module Cnf where

-- Cnf : Conjunctive Normal Form
--
data Clause = OR Clause Clause | AND Clause Clause
type Clauses = [Clause]
