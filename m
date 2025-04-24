Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C0C244679;
	Thu, 24 Apr 2025 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491135; cv=none; b=CMSOq5kXVNkegQSyIIk8kfjgnpXmpHU3c84fU+u2ue1/EA/iLbrIT7zc/PsVRXJ6vRvB53Ov7oCmIywfvQUM4WWmvRRAP3nennj4BxlFU73tIdT8k/rQb0cHnCpAnARCq0a3147Lei4UZVcGJUJ/uPgfFWd+am7SEdIFpHhY6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491135; c=relaxed/simple;
	bh=fspxg+uNYQg/0xMHqz7C9hQnM6mWytkwf+DymD/SJHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ya2ddGuwAJKoHebURguDG8QWPWhpjFDyA3W30+3bWjG+x12ohjBPd0/Q8d49TMd5Uwmnajv68zZcZ2Oqrp4pzkub1dvuj1QiERQQP2O0k8tra007fTXOh1brXxqpHh/Zr1/t7Bk+XZabZu3U6OurRTVN7IkLPaUvy6R4Tk7MPDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iv3KbTy0; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iv3KbTy0"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso10734966d6.2;
        Thu, 24 Apr 2025 03:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491132; x=1746095932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCGT2JlziqqiSztKJ7xnMu1WkpausWLoKCYcx1OKs3U=;
        b=iv3KbTy03eFTzhIix5MprYPgYmIJuQZVBd3USpPAOzCo0XBkMNh60FNWXvNu/AL6Mk
         wHxUFebDofsssQxdz5e5KZOOMPv+W5prYyk0hbRlHiFG6nqXrdnv7VsCNTtrvT+QoVPr
         oGnmsYfbMoZIKVQgONYtwqwpJs7UrZL0OIiHWd4RQV3QZ+zJqGtiGhYec2vYMd48ARho
         mUd8gg0nOluCgfb0RZA6FKdljrktOST3Ahfc3ACOkrkzcDpuBmWAv32tCnmRU3Dk6RPf
         eeSvuueURbF8OWs4G/PUWsLLnS9U/NrC5XEFZp1lnq5i1F3CK1tAiH33ykM08cGbWZA5
         ivhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491132; x=1746095932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCGT2JlziqqiSztKJ7xnMu1WkpausWLoKCYcx1OKs3U=;
        b=TIuFnSBsTCZNx8/duiJLQ+0C6r9yJx8Ybzb22MP7nVBSUZtHnkDYeofogon7TAZm01
         Gxh+3nFfxwBz/cbR/PSJqD9gnjWBaOq3WwhVmAGLXvnVTLDjqvvZAsMmLNtY6nvJq/PD
         e751HDeBwHmsvvRcD7t4NqO/13BuN6t9dV/wAeQRgT7IAsDAPUx+Vihk5cEmH6KfMq8u
         A2zSN74NWoWCeWnyyNAM2uvCbJQifvGNStX3g55S4T5nVlS7sb98gDGq5t7roCzx4py2
         BgXI2e25cDYx+BSy/R7oHh7/nTHa5ukFZ1VUULSgBEGq8Xv11UDzd3XS4PgejLVnWNRl
         CzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBidwe8AAQB2ZlNIUHWZJsuegEWLmskUYGbnHkDIRVreEl+npxaCuwr3/RNOjDf1dkSeNCLqzpo0QKj2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ1fCp2XNjwlFJPve8/ZY8Is8CVZX6S7P29vPcFkZzVPyJXEXJ
	QJjAyvWW9HnKWSxi8YBNlM8WY0uEoaKhnGp8rFQAahs8mNY70Lal
X-Gm-Gg: ASbGnctoy6sC/SMp8DoAL7WCVAT4W0EYShm/+QRu/v5Fc/x1fd7CSehmi9WL2HD97oG
	zbKRddlg5HEELtpRKTdk/V4NCLwJ58WJSCq8ttpYZ/WR7aTcmk39SaAUlMx7u2Dfdq9rMl2wHAn
	Bd0WcG88jYlA1IXBDinwBFrAS73iRBFaZ74rPLgz1b8Sj1xFjojzc011Sr74J3ZN3NzeRM9c0fs
	TLygkP/wdksu1L42HQ8EpGKKF3bLq/iZBE6TIuM2bMrsA+wQ8axr1hGcWFFV/q/kHswUC04isMM
	QTJspDkcsSkDcIbOCIRzXB28kX+tqQb6glsrLaIq9kzl2JLKfvhBBuLd4DPArc7nHkDZIiJLEvu
	Yqqs=
X-Google-Smtp-Source: AGHT+IFtbTUg/NlHp+xGGR8hhVqM+3uqW4XpfmIRTs3e+e1XwqiOWrT05niehzviMiK9ZEWlb8+M4A==
X-Received: by 2002:a0c:cdc2:0:b0:6f4:c63e:4cdc with SMTP id 6a1803df08f44-6f4c63e4e4emr3337556d6.0.1745491132296;
        Thu, 24 Apr 2025 03:38:52 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:51 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:37 -0400
Subject: [PATCH v6 09/13] scripts: generate_rust_analyzer.py: identify
 crates explicitly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-9-40e67fe5c38a@gmail.com>
References: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
In-Reply-To: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
 Tamir Duberstein <tamird@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev

Use the return of `append_crate` to declare dependency on that crate.
This allows multiple crates with the same display_name be defined, which
we'll use to define host crates separately from target crates.

Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 88 +++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index bc23cf58e7a1..b281e87cfa30 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -60,17 +60,14 @@ def generate_crates(
             line = line.replace("\n", "")
             cfg.append(line)
 
-    # Now fill the crates list -- dependencies need to come first.
-    #
-    # Avoid O(n^2) iterations by keeping a map of indexes.
+    # Now fill the crates list.
     crates: List[Crate] = []
-    crates_indexes: Dict[str, int] = {}
 
     def build_crate(
         display_name: str,
         root_module: pathlib.Path,
         *,
-        deps: List[str],
+        deps: List[Dependency],
         cfg: List[str],
         is_workspace_member: bool,
     ) -> Crate:
@@ -78,7 +75,7 @@ def generate_crates(
             "display_name": display_name,
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
-            "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
+            "deps": deps,
             "cfg": cfg,
             "edition": "2021",
             "env": {
@@ -86,18 +83,19 @@ def generate_crates(
             },
         }
 
-    def register_crate(crate: Crate) -> None:
-        crates_indexes[crate["display_name"]] = len(crates)
+    def register_crate(crate: Crate) -> Dependency:
+        index = len(crates)
         crates.append(crate)
+        return {"crate": index, "name": crate["display_name"]}
 
     def append_crate(
         display_name: str,
         root_module: pathlib.Path,
         *,
-        deps: List[str],
+        deps: List[Dependency],
         cfg: List[str],
-    ) -> None:
-        register_crate(
+    ) -> Dependency:
+        return register_crate(
             build_crate(
                 display_name,
                 root_module,
@@ -111,9 +109,9 @@ def generate_crates(
         display_name: str,
         root_module: pathlib.Path,
         *,
-        deps: List[str],
+        deps: List[Dependency],
         cfg: List[str],
-    ) -> None:
+    ) -> Dependency:
         crate = build_crate(
             display_name,
             root_module,
@@ -143,15 +141,15 @@ def generate_crates(
             "is_proc_macro": True,
             "proc_macro_dylib_path": str(objtree / "rust" / proc_macro_dylib_name),
         }
-        register_crate(proc_macro_crate)
+        return register_crate(proc_macro_crate)
 
     def append_sysroot_crate(
         display_name: str,
         *,
-        deps: List[str],
+        deps: List[Dependency],
         cfg: List[str],
-    ) -> None:
-        register_crate(
+    ) -> Dependency:
+        return register_crate(
             build_crate(
                 display_name,
                 sysroot_src / display_name / "src" / "lib.rs",
@@ -164,59 +162,59 @@ def generate_crates(
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", deps=[], cfg=crates_cfgs["core"])
-    append_sysroot_crate("alloc", deps=["core"], cfg=[])
-    append_sysroot_crate("std", deps=["alloc", "core"], cfg=[])
-    append_sysroot_crate("proc_macro", deps=["core", "std"], cfg=[])
+    core = append_sysroot_crate("core", deps=[], cfg=crates_cfgs["core"])
+    alloc = append_sysroot_crate("alloc", deps=[core], cfg=[])
+    std = append_sysroot_crate("std", deps=[alloc, core], cfg=[])
+    proc_macro = append_sysroot_crate("proc_macro", deps=[core, std], cfg=[])
 
-    append_crate(
+    compiler_builtins = append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
         deps=[],
         cfg=[],
     )
 
-    append_proc_macro_crate(
+    macros = append_proc_macro_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        deps=["std", "proc_macro"],
+        deps=[std, proc_macro],
         cfg=[],
     )
 
-    append_crate(
+    build_error = append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
-        deps=["core", "compiler_builtins"],
+        deps=[core, compiler_builtins],
         cfg=[],
     )
 
-    append_proc_macro_crate(
+    pin_init_internal = append_proc_macro_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
         deps=[],
         cfg=["kernel"],
     )
 
-    append_crate(
+    pin_init = append_crate(
         "pin_init",
         srctree / "rust" / "pin-init" / "src" / "lib.rs",
-        deps=["core", "pin_init_internal", "macros"],
+        deps=[core, pin_init_internal, macros],
         cfg=["kernel"],
     )
 
-    append_crate(
+    ffi = append_crate(
         "ffi",
         srctree / "rust" / "ffi.rs",
-        deps=["core", "compiler_builtins"],
+        deps=[core, compiler_builtins],
         cfg=[],
     )
 
     def append_crate_with_generated(
         display_name: str,
         *,
-        deps: List[str],
+        deps: List[Dependency],
         cfg: List[str],
-    ) -> None:
+    ) -> Dependency:
         crate = build_crate(
             display_name,
             srctree / "rust" / display_name / "lib.rs",
@@ -235,20 +233,20 @@ def generate_crates(
                 "exclude_dirs": [],
             }
         }
-        register_crate(crate_with_generated)
+        return register_crate(crate_with_generated)
 
-    append_crate_with_generated("bindings", deps=["core", "ffi"], cfg=[])
-    append_crate_with_generated("uapi", deps=["core", "ffi"], cfg=[])
-    append_crate_with_generated(
+    bindings = append_crate_with_generated("bindings", deps=[core, ffi], cfg=[])
+    uapi = append_crate_with_generated("uapi", deps=[core, ffi], cfg=[])
+    kernel = append_crate_with_generated(
         "kernel",
         deps=[
-            "core",
-            "macros",
-            "build_error",
-            "pin_init",
-            "ffi",
-            "bindings",
-            "uapi",
+            core,
+            macros,
+            build_error,
+            pin_init,
+            ffi,
+            bindings,
+            uapi,
         ],
         cfg=[],
     )
@@ -279,7 +277,7 @@ def generate_crates(
             append_crate(
                 name,
                 path,
-                deps=["core", "kernel"],
+                deps=[core, kernel],
                 cfg=cfg,
             )
 

-- 
2.49.0

