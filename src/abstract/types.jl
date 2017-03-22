abstract type AbstractVariable{Name} end
name(::Type{<:AbstractVariable{N}}) where {N} = N
name(v::AbstractVariable) = name(typeof(v))
degree(::AbstractVariable) = 1

abstract type AbstractMonomial{Variables} end
degree(m::AbstractMonomial) = sum(exponents(m))
variables(::Type{<:AbstractMonomial{V}}) where {V} = V
variables(m::AbstractMonomial) = variables(typeof(m))
function exponents end
function exponent end

abstract type AbstractTerm{CoeffType, MonomialType} end
monomialtype(::Type{<:AbstractTerm{C, M}}) where {C, M} = M
monomialtype(t::AbstractTerm) = monomialtype(typeof(t))
degree(t::AbstractTerm) = degree(monomial(t))
variables(t::AbstractTerm) = variables(monomialtype(t))
variables(T::Type{<:AbstractTerm}) = variables(monomialtype(T))
exponents(t::AbstractTerm) = exponents(monomial(t))
exponent(t::AbstractTerm, v::AbstractVariable) = exponent(monomial(t), v)
function coefficient end
function monomial end

abstract type AbstractPolynomial end
# termtype(::Type{<:AbstractPolynomial{T}}) where {T} = T
# termtype(p::AbstractPolynomial) = termtype(typeof(p))
function terms end
function variables end
# variables(T::Type{<:AbstractPolynomial}) = variables(termtype(T))
# variables(p::AbstractPolynomial) = variables(termtype(p))

const AbstractMonomialLike = Union{<:AbstractVariable, <:AbstractMonomial}
const AbstractTermLike = Union{<:AbstractMonomialLike, <:AbstractTerm}
const AbstractPolynomialLike = Union{<:AbstractTermLike, <:AbstractPolynomial}
