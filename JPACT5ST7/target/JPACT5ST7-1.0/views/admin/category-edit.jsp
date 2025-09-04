<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Sửa Category</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  :root{
    --brand:#3b82f6;        /* xanh dương chính */
    --brand-dark:#2563eb;   /* xanh dương đậm */
    --bg:#f1f5f9;
    --line:#e2e8f0;
    --input:#f8fafc;
  }
  *{box-sizing:border-box;margin:0;padding:0;}
  body{
    min-height:100vh;
    display:flex; align-items:center; justify-content:center;
    background:linear-gradient(135deg,#0ea5e9 0%, #3b82f6 100%);
    font-family:system-ui,Segoe UI,Arial,sans-serif;
    padding:20px;
  }
  .form-container{
    background:#fff;
    width:100%;
    max-width:400px;
    border-radius:16px;
    padding:28px 24px;
    box-shadow:0 10px 30px rgba(0,0,0,.15);
    border:1px solid var(--line);
    animation:fadeIn .5s ease;
  }
  @keyframes fadeIn{
    from{opacity:0; transform:translateY(10px);}
    to{opacity:1; transform:translateY(0);}
  }
  .form-container h2{
    text-align:center;
    font-size:22px;
    font-weight:700;
    margin-bottom:20px;
    color:#0f172a;
  }
  label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#334155;
  }
  .input-group{
    position:relative;
  }
  .input-group svg{
    position:absolute;
    top:50%;
    left:12px;
    transform:translateY(-50%);
    width:18px; height:18px;
    fill:#64748b;
  }
  input[type="text"]{
    width:100%;
    padding:10px 12px 10px 38px;
    background:var(--input);
    border:1px solid var(--line);
    border-radius:10px;
    font-size:15px;
    transition:border-color .2s, box-shadow .2s;
  }
  input[type="text"]:focus{
    outline:none;
    border-color:var(--brand);
    box-shadow:0 0 0 3px rgba(59,130,246,.2);
  }
  button{
    width:100%;
    padding:12px;
    background:var(--brand);
    color:#fff;
    border:none;
    border-radius:10px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:background .2s;
    margin-top:10px;
  }
  button:hover{ background:var(--brand-dark); }

  .back-link{
    display:block;
    text-align:center;
    margin-top:15px;
    text-decoration:none;
    color:#2563eb;
    font-size:14px;
    transition:color .2s;
  }
  .back-link:hover{ color:#1e40af; }
</style>
</head>
<body>
  <div class="form-container">
    <h2>Sửa Category</h2>
    <form action="${pageContext.request.contextPath}/admin/edit" method="post">
      <!-- Giữ nguyên hidden id -->
      <input type="hidden" name="id" value="${cate.id}">

      <label for="categoryname">Tên Category:</label>
      <div class="input-group">
        <!-- icon edit -->
        <svg viewBox="0 0 24 24">
          <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a1 1 0 0 0 0-1.41l-2.34-2.34a1 1 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
        </svg>
        <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}" placeholder="Nhập tên category..." required>
      </div>

      <button type="submit">Cập nhật</button>
    </form>

    <a href="${pageContext.request.contextPath}/admin/categories" class="back-link">← Quay lại danh sách</a>
  </div>
</body>
</html>
