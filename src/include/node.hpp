#include <memory>
class Node {
    public:
        virtual ~Node(){}
};

class NodeExpr : public Node {
};

class ExprInt : public NodeExpr {
    long int Val;
    public:
        ExprInt(long int Val) : Val(Val) {}
};

class ExprFloat : public NodeExpr {
    double Val;
    public:
        ExprFloat(double Val) : Val(Val) {}
};

class ExprUnary : public NodeExpr {
    char Op;
    std::unique_ptr<Node> Expr;
    public:
        ExprUnary(char op, std::unique_ptr<Node> expr)
            : Op(op), Expr(std::move(expr)) {}
};

class ExprBinary : public NodeExpr {
    char Op;
    std::unique_ptr<Node> LHS, RHS;
    public:
        ExprBinary(char op, std::unique_ptr<Node> lhs,
                std::unique_ptr<Node> rhs) : Op(op),
                LHS(std::move(lhs)), RHS(std::move(rhs)) {}
};
