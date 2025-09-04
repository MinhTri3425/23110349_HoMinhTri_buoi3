<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách Category</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  :root{
    --bg:#0f172a;           /* slate-900 */
    --card:#ffffff;
    --muted:#64748b;        /* slate-500 */
    --line:#e2e8f0;         /* slate-200 */
    --brand:#22c55e;        /* green-500 */
    --brand-d:#16a34a;      /* green-600 */
    --edit:#3b82f6;         /* blue-500 */
    --delete:#ef4444;       /* red-500 */
  }
  *{box-sizing:border-box}
  body{
    margin:0; font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
    background:linear-gradient(135deg,#0ea5e9 0%, #22c55e 100%) fixed;
    color:#0b1220;
  }
  .wrap{
    max-width:1100px; margin:32px auto; padding:0 16px;
  }
  .header{
    display:flex; align-items:center; justify-content:space-between;
    gap:12px; color:#fff;
  }
  .title{
    display:flex; align-items:center; gap:10px;
  }
  .title h2{margin:0; font-size:24px; font-weight:800; letter-spacing:.2px}
  .badge{
    background:rgba(255,255,255,.15); border:1px solid rgba(255,255,255,.25);
    padding:4px 10px; border-radius:999px; font-size:13px
  }
  .toolbar{
    display:flex; gap:10px; flex-wrap:wrap;
  }
  .search{
    display:flex; align-items:center; gap:8px; background:#ffffffcc;
    padding:8px 12px; border-radius:10px; border:1px solid #ffffff99;
  }
  .search input{
    border:none; outline:none; background:transparent; min-width:220px;
  }
  .add-btn{
    text-decoration:none; background:var(--brand); color:#fff;
    padding:10px 14px; border-radius:10px; font-weight:600; display:inline-block;
    border:1px solid #ffffff55;
  }
  .add-btn:hover{ background:var(--brand-d) }

  .card{
    margin-top:16px; background:var(--card); border-radius:16px;
    box-shadow:0 10px 30px rgba(2,6,23,.25);
    overflow:hidden; border:1px solid var(--line);
  }
  .table-wrap{ overflow:auto }
  table{
    width:100%; border-collapse:collapse; min-width:720px;
  }
  thead th{
    position:sticky; top:0; background:#f8fafc; z-index:1;
    text-align:left; font-weight:700; color:#0f172a; border-bottom:1px solid var(--line);
    padding:12px 14px; font-size:14px;
  }
  tbody td{
    border-bottom:1px solid var(--line); padding:12px 14px; text-align:left; font-size:14px;
  }
  tbody tr:hover{ background:#f8fafc; transition:background .2s }
  .num{ width:70px; text-align:center; color:var(--muted) }
  .id{ width:140px; font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; }
  .name{ font-weight:600 }
  .actions{ display:flex; gap:8px; justify-content:flex-end; }
  .btn{
    text-decoration:none; color:#fff; padding:7px 12px; border-radius:999px;
    font-size:13px; line-height:1; display:inline-flex; align-items:center; gap:6px;
    border:0; cursor:pointer;
  }
  .btn-edit{ background:var(--edit) }
  .btn-delete{ background:var(--delete) }
  .empty{
    text-align:center; padding:28px; color:var(--muted);
  }
  .flash{
    margin-top:12px; background:#ecfeff; border:1px solid #a5f3fc; color:#0e7490;
    padding:10px 12px; border-radius:10px; font-size:14px;
  }

  /* Mobile tweaks */
  @media (max-width: 640px){
    .search input{ min-width:140px }
    .actions{ justify-content:flex-start; }
  }
</style>
</head>
<body>
  <div class="wrap">
    <!-- Header -->
    <div class="header">
      <div class="title">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="#fff" aria-hidden="true">
          <path d="M3 6a3 3 0 0 1 3-3h4a3 3 0 0 1 3 3v1h4a3 3 0 0 1 3 3v5a3 3 0 0 1-3 3h-4v1a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3V6zm10 2V6a1 1 0 0 0-1-1H6a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-2H6a3 3 0 0 1-3-3V10a3 3 0 0 1 3-3h7z"/>
        </svg>
        <h2>Danh sách Category</h2>
        <span class="badge">
          Tổng: <strong><c:out value="${fn:length(listcate)}"/></strong>
        </span>
      </div>

      <div class="toolbar">
        <form class="search" action="${pageContext.request.contextPath}/admin/categories" method="get">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="#334155" aria-hidden="true">
            <path d="M21 21l-4.3-4.3m1.8-5.2a7 7 0 1 1-14 0 7 7 0 0 1 14 0z"/>
          </svg>
          <input type="text" name="q" value="${param.q}" placeholder="Tìm category...">
        </form>
        <a href="${pageContext.request.contextPath}/admin/insert" class="add-btn">+ Thêm Category</a>
      </div>
    </div>

    <!-- Flash message (nếu có) -->
    <c:if test="${not empty message}">
      <div class="flash"><c:out value="${message}"/></div>
    </c:if>

    <!-- Bảng -->
    <div class="card">
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th class="num">#</th>
              <th class="id">ID</th>
              <th>Tên Category</th>
              <th style="text-align:right;">Hành động</th>
            </tr>
          </thead>
          <tbody>
            <c:if test="${empty listcate}">
              <tr>
                <td colspan="4" class="empty">Chưa có category nào. Bấm “Thêm Category” để tạo mới nha ✨</td>
              </tr>
            </c:if>

            <c:forEach items="${listcate}" var="cate" varStatus="stt">
              <tr>
                <td class="num">${stt.count}</td>
                <td class="id">${cate.id}</td>
                <td class="name">${cate.categoryname}</td>
                <td>
                  <div class="actions">
                    <a href="${pageContext.request.contextPath}/admin/edit?id=${cate.id}" class="btn btn-edit">
                      <!-- pencil -->
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="#fff" aria-hidden="true">
                        <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a1 1 0 0 0 0-1.41l-2.34-2.34a1 1 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/>
                      </svg>
                      Sửa
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/delete?id=${cate.id}"
                       class="btn btn-delete"
                       onclick="return confirm('Bạn có chắc muốn xóa không?');">
                      <!-- trash -->
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="#fff" aria-hidden="true">
                        <path d="M9 3h6l1 2h4v2H4V5h4l1-2zm1 7h2v8h-2v-8zm4 0h2v8h-2v-8zM7 10h2v8H7v-8z"/>
                      </svg>
                      Xóa
                    </a>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- JSTL functions for length -->
  <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
</body>
</html>
