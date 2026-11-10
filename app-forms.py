
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
