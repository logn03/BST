#include <iostream>
using namespace std;

struct node {
	int data;
	node* right;
	node* left;
};

typedef node* Node;

Node khoitao(int data)
{
	Node p = new node;
	p->data = data;
	p->left = NULL;
	p->right = NULL;
	return p;
}


Node minValueNODEBST(Node T)
{
	Node current = T;
	while (current->left != NULL)
		current = current->left;
	return current;
}

void insert(Node &root, int x)
{
	if (root == NULL)
	{
		root = khoitao(x);
	}
	else
	{
		if (root->data == x)
		{
			cout << "\nda co gia tri nay ";
		}
		else if (root->data > x)
		{
			insert(root->left, x);
		}
		else {
			insert(root->right, x);
		}
	}
}

void deleteNode(Node& root, int x)
{
	if (root == nullptr)
	{
		return;
	}
	else
	{
		if (x < root->data)
		{
			deleteNode(root->left, x);
		}
		else if (x > root->data)
		{
			deleteNode(root->right, x);
		}
		else
		{
			if (root->left == NULL)
			{
				Node parent = root;
				root = root->right;
				delete parent;
			}
			else if (root->right == NULL)
			{
				Node parent = root;
				root = root->left;
				delete parent;
			}
			else
			{
				Node parent = minValueNODEBST(root->right);
				root->data = parent->data;
				deleteNode(root->right, parent->data);
			}
		}
	}
}
void nhapnode(Node &p)
{
	do {
		int x;
		cout << "\nnhap gia tri cho cay ";
		cin >> x;
		if (x == -99)
		{
			break;
		}
		else {
			insert(p, x);
		}
	} while (1);
}

void lnr(Node p)
{
	if (p != NULL)
	{
		lnr(p->left);
		cout << p->data << " ";
		lnr(p->right);
	}
}
int main()
{
	Node p;
	p = NULL;
	//nhapnode(p);
	insert(p, 5);
	insert(p, 6);
	insert(p,12);
	insert(p, 19);
	insert(p, 41);
	insert(p, 11);
	insert(p, 55);            
	insert(p, 1);
	insert(p, 2);
	insert(p, 3);
	lnr(p);
	cout << endl;
	deleteNode(p,55);
	lnr(p);

	return 0;
}
