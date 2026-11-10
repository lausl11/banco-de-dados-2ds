
import tkinter as tk
from tkinter import messagebox
import sqlite3

# Conexão com o banco de dados
conexao = sqlite3.connect("clientes.db")
cursor = conexao.cursor()

# Criação da tabela
cursor.execute("""
CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    telefone TEXT NOT NULL
)
""")

conexao.commit()


# Função para salvar o cliente
def salvar_cliente():
    nome = entrada_nome.get().strip()
    email = entrada_email.get().strip()
    telefone = entrada_telefone.get().strip()

    # Validação dos campos
    if not nome or not email or not telefone:
        messagebox.showwarning(
            "Atenção",
            "Preencha todos os campos antes de salvar!"
        )
        return

    # Inserção dos dados no banco
    cursor.execute(
        "INSERT INTO clientes (nome, email, telefone) VALUES (?, ?, ?)",
        (nome, email, telefone)
    )

    conexao.commit()

    messagebox.showinfo(
        "Sucesso",
        "Cliente cadastrado com sucesso!"
    )

    limpar_formulario()


# Função para limpar o formulário
def limpar_formulario():
    entrada_nome.delete(0, tk.END)
    entrada_email.delete(0, tk.END)
    entrada_telefone.delete(0, tk.END)

    entrada_nome.focus()


# Criação da janela principal
janela = tk.Tk()
janela.title("Cadastro de Clientes")
janela.geometry("400x350")
janela.resizable(False, False)

# Título
titulo = tk.Label(
    janela,
    text="CADASTRO DE CLIENTES",
    font=("Arial", 16, "bold")
)
titulo.pack(pady=20)

# Campo Nome
tk.Label(janela, text="Nome:").pack()
entrada_nome = tk.Entry(janela, width=40)
entrada_nome.pack(pady=5)

# Campo E-mail
tk.Label(janela, text="E-mail:").pack()
entrada_email = tk.Entry(janela, width=40)
entrada_email.pack(pady=5)

# Campo Telefone
tk.Label(janela, text="Telefone:").pack()
entrada_telefone = tk.Entry(janela, width=40)
entrada_telefone.pack(pady=5)

# Botão Salvar
botao_salvar = tk.Button(
    janela,
    text="Salvar Cliente",
    command=salvar_cliente,
    width=20,
    bg="green",
    fg="white"
)
botao_salvar.pack(pady=15)

# Botão Limpar
botao_limpar = tk.Button(
    janela,
    text="Limpar Formulário",
    command=limpar_formulario,
    width=20
)
botao_limpar.pack()

# Inicialização da interface
janela.mainloop()

# Fechamento da conexão ao encerrar o programa
conexao.close()


import tkinter as tk
from tkinter import messagebox, ttk
import sqlite3

# Conexão com o banco de dados
conexao = sqlite3.connect("clientes.db")
cursor = conexao.cursor()

# Criação da tabela
cursor.execute("""
CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    telefone TEXT NOT NULL
)
""")

conexao.commit()


# Função para salvar cliente
def salvar_cliente():
    nome = entrada_nome.get().strip()
    email = entrada_email.get().strip()
    telefone = entrada_telefone.get().strip()

    if not nome or not email or not telefone:
        messagebox.showwarning(
            "Atenção",
            "Preencha todos os campos antes de salvar!"
        )
        return

    cursor.execute(
        "INSERT INTO clientes (nome, email, telefone) VALUES (?, ?, ?)",
        (nome, email, telefone)
    )

    conexao.commit()

    messagebox.showinfo(
        "Sucesso",
        "Cliente cadastrado com sucesso!"
    )

    limpar_formulario()


# Função para limpar formulário
def limpar_formulario():
    entrada_nome.delete(0, tk.END)
    entrada_email.delete(0, tk.END)
    entrada_telefone.delete(0, tk.END)

    entrada_nome.focus()


# Função para visualizar clientes
def visualizar_clientes():
    janela_clientes = tk.Toplevel(janela)
    janela_clientes.title("Clientes Cadastrados")
    janela_clientes.geometry("650x350")

    tk.Label(
        janela_clientes,
        text="LISTA DE CLIENTES",
        font=("Arial", 16, "bold")
    ).pack(pady=15)

    # Criação da tabela
    tabela = ttk.Treeview(
        janela_clientes,
        columns=("ID", "Nome", "Email", "Telefone"),
        show="headings"
    )

    tabela.heading("ID", text="ID")
    tabela.heading("Nome", text="Nome")
    tabela.heading("Email", text="E-mail")
    tabela.heading("Telefone", text="Telefone")

    tabela.column("ID", width=40, anchor="center")
    tabela.column("Nome", width=170)
    tabela.column("Email", width=200)
    tabela.column("Telefone", width=120)

    tabela.pack(fill="both", expand=True, padx=10, pady=10)

    # Busca os clientes no banco de dados
    cursor.execute(
        "SELECT id, nome, email, telefone FROM clientes"
    )

    clientes = cursor.fetchall()

    # Insere os dados na tabela
    for cliente in clientes:
        tabela.insert("", tk.END, values=cliente)

    if not clientes:
        messagebox.showinfo(
            "Informação",
            "Nenhum cliente cadastrado.",
            parent=janela_clientes
        )


# Criação da janela principal
janela = tk.Tk()
janela.title("Cadastro de Clientes")
janela.geometry("400x400")
janela.resizable(False, False)

# Título
titulo = tk.Label(
    janela,
    text="CADASTRO DE CLIENTES",
    font=("Arial", 16, "bold")
)
titulo.pack(pady=20)

# Campo Nome
tk.Label(janela, text="Nome:").pack()
entrada_nome = tk.Entry(janela, width=40)
entrada_nome.pack(pady=5)

# Campo E-mail
tk.Label(janela, text="E-mail:").pack()
entrada_email = tk.Entry(janela, width=40)
entrada_email.pack(pady=5)

# Campo Telefone
tk.Label(janela, text="Telefone:").pack()
entrada_telefone = tk.Entry(janela, width=40)
entrada_telefone.pack(pady=5)

# Botão Salvar
tk.Button(
    janela,
    text="Salvar Cliente",
    command=salvar_cliente,
    width=22,
    bg="green",
    fg="white"
).pack(pady=10)

# Botão Limpar
tk.Button(
    janela,
    text="Limpar Formulário",
    command=limpar_formulario,
    width=22
).pack(pady=5)

# Botão Visualizar Clientes
tk.Button(
    janela,
    text="Visualizar Clientes",
    command=visualizar_clientes,
    width=22,
    bg="blue",
    fg="white"
).pack(pady=5)

# Inicialização da interface
janela.mainloop()

# Fechamento da conexão
conexao.close()

