Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E294242D77;
	Thu, 24 Apr 2025 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491133; cv=none; b=ewIppr10Tif6F97hotU5Obf6NLW+iiVAtVO3KAH352EOv+Xdko+VLOAWb2ArftNPX4++mf2KtS3AJaiqH2mkaI9JRRhBdfasbRUAsjfxen9+f8+Ralj0KtQSAG72w47OKupvhJYCDjXSyNnCi+3mnLvvzUbZNLqOEkTSFkJfzRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491133; c=relaxed/simple;
	bh=SUZrUjmoprtQ6keJ74Ysw9Z7cJItkWfXXgUFBGiS/xU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sf2zOqYDRTeBAydqnzP5AogbU5gcJDPAqk6BmtMRgdgVm01Ernt5essEY9ROU/o/DOO/7TkO53Md32RU5oiZZVlAA9HTOkbhG93aSTATNHH8eu64j8WPKI6uNbDMJqhVUqA8/cMhQOJ2dhf241YZVBBslqe/tSPqBulTJr6YcnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7zZDMpy; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7zZDMpy"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8efefec89so9079126d6.3;
        Thu, 24 Apr 2025 03:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491130; x=1746095930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYN72obP8YeGAUbO9wSEKeCZVhrNFzJyZi05YjQSxM0=;
        b=W7zZDMpytXBKRoNmVFWIjN877aVChmpSAe+9ZjOmHKsA7T2V1g7ufYTUBPPg0vsf2L
         2ii8jIyuKKRyZC0aYPBuUDpZ3f4zmX1xIxoIZFgmqV0Ig/auRSI7wOkwdIiVDVgUduC3
         4GwiH5nFGa+okcxqLX6LYcMPD8qDF5K1fIfY8puKKq46j/0XZZcqKi9s0ULblRGe/tcO
         tmZOCOGigRZPSW+01//A/UIOmh3nH4beYBX8D4VWwCgLuzQYkn3vZFvV+cAoiWuBK0LS
         ZhRZgXEaiW4Af42zqQrjz2AHbp57I23qDlfDPot7zk1ds1W5lecF9oFjNK1iCyMDe9nB
         pHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491130; x=1746095930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYN72obP8YeGAUbO9wSEKeCZVhrNFzJyZi05YjQSxM0=;
        b=bITVLBKr1S8Pmz/9RdE2QfeD/KTDfFUVMnkv2SeVr8192c+Vab+pLQ1QhnKDeJwR1o
         BenfhEb2L1byDVCHdNoPVQqw4IpIodHWJ/qilNTnWSI1UmbZ50zjiqshIzHeEOFniZVL
         jxOVzRuBrXDbhQzzeeErKHD1ZJIkahfYfpy3r2ift1WQQKl/UMEpSiar7kQMdn8oACl5
         Pj3ROhUo0l8zFhX1njSxQjJKN9GDW/cNgTDj6XKOF6GXwstPPMJZt2oEB4Cacwy3q3pn
         x6LUjx6pJMJBVKQ2QDrJuRJIJahsfwZolBC2DI3vGRE4O+1tL/rcoxNWYhoCDtCj72Mw
         y8+A==
X-Forwarded-Encrypted: i=1; AJvYcCXZbdzB48TKihn15A6iUSfCTnOFiTyBJS98m0vJVCPzyJbF25MaRGJY3JLD/ZpXiu/DgnBd4D+W4j20W90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeeO6CiQQNErv/LMz60U1qiMnxWqe5VGYNL7ID9xedqNNVDFjo
	TMfdTE4Tw2zYrye9ySuBOXIk8cTKJNqrAoR8+adhg4EjUxaqZUk8
X-Gm-Gg: ASbGncvSzsNvA93elp64LgGVouMoI7OhQ3+88qGEzWkvZVlAY/G8ZQlCJCwnOvv4SB+
	wsBhCaFEnd2BuKV5mdPvqMWVtBKr4m+eHCDbkdDRzuAqZxg+uEZMkCy1slAnxc4lISicHYBafFg
	muzEIcFLtyDmJ2Bdi6YcfO5drP0Ml+QcpFdFkj6S45n7ufxG01Wab2MJlznox6aiewbMosJMl73
	cUzAmT4KA0/e9Spl3ItAbcaDTViOIFXcwba5fvzvJ+PC62Fl6MHNClbWi0cSWUoWUt1Hoohaou0
	ZBz6LVc1EQldUVEiE857AxrCLXabpDLhTtzlIn7xz8dm+IAZet3i8nSXBlLw5golkdl9
X-Google-Smtp-Source: AGHT+IFK18q5pKkd7jcXBM2VqgbsokDoCON+YlJZNXZv1BZ/CtL3wOqXQV3Yb0sR0q7t9vRK+TYEHQ==
X-Received: by 2002:a05:6214:2aa2:b0:6e8:e8dd:3088 with SMTP id 6a1803df08f44-6f4bfc85376mr40058466d6.37.1745491129849;
        Thu, 24 Apr 2025 03:38:49 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:49 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:35 -0400
Subject: [PATCH v6 07/13] scripts: generate_rust_analyzer.py: avoid
 optional arguments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-7-40e67fe5c38a@gmail.com>
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

Make all arguments required to reduce the probability of incorrect
implicit behavior. Use keyword arguments for clarity.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 94 +++++++++++++++++++++++++++------------
 1 file changed, 65 insertions(+), 29 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 6fa4cec0e506..66e3d5e8c52c 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -69,9 +69,10 @@ def generate_crates(
     def build_crate(
         display_name: str,
         root_module: pathlib.Path,
+        *,
         deps: List[str],
-        cfg: List[str] = [],
-        is_workspace_member: bool = True,
+        cfg: List[str],
+        is_workspace_member: bool,
     ) -> Crate:
         return {
             "display_name": display_name,
@@ -92,21 +93,34 @@ def generate_crates(
     def append_crate(
         display_name: str,
         root_module: pathlib.Path,
+        *,
         deps: List[str],
-        cfg: List[str] = [],
-        is_workspace_member: bool = True,
+        cfg: List[str],
     ) -> None:
         register_crate(
-            build_crate(display_name, root_module, deps, cfg, is_workspace_member)
+            build_crate(
+                display_name,
+                root_module,
+                deps=deps,
+                cfg=cfg,
+                is_workspace_member=True,
+            )
         )
 
     def append_proc_macro_crate(
         display_name: str,
         root_module: pathlib.Path,
+        *,
         deps: List[str],
-        cfg: List[str] = [],
+        cfg: List[str],
     ) -> None:
-        crate = build_crate(display_name, root_module, deps, cfg)
+        crate = build_crate(
+            display_name,
+            root_module,
+            deps=deps,
+            cfg=cfg,
+            is_workspace_member=True,
+        )
         proc_macro_dylib_name = (
             subprocess.check_output(
                 [
@@ -133,72 +147,82 @@ def generate_crates(
 
     def append_sysroot_crate(
         display_name: str,
+        *,
         deps: List[str],
-        cfg: List[str] = [],
+        cfg: List[str],
     ) -> None:
-        append_crate(
-            display_name,
-            sysroot_src / display_name / "src" / "lib.rs",
-            deps,
-            cfg,
-            is_workspace_member=False,
+        register_crate(
+            build_crate(
+                display_name,
+                sysroot_src / display_name / "src" / "lib.rs",
+                deps=deps,
+                cfg=cfg,
+                is_workspace_member=False,
+            )
         )
 
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs["core"])
-    append_sysroot_crate("alloc", ["core"])
-    append_sysroot_crate("std", ["alloc", "core"])
-    append_sysroot_crate("proc_macro", ["core", "std"])
+    append_sysroot_crate("core", deps=[], cfg=crates_cfgs["core"])
+    append_sysroot_crate("alloc", deps=["core"], cfg=[])
+    append_sysroot_crate("std", deps=["alloc", "core"], cfg=[])
+    append_sysroot_crate("proc_macro", deps=["core", "std"], cfg=[])
 
     append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
-        [],
+        deps=[],
+        cfg=[],
     )
 
     append_proc_macro_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        ["std", "proc_macro"],
+        deps=["std", "proc_macro"],
+        cfg=[],
     )
 
     append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
-        ["core", "compiler_builtins"],
+        deps=["core", "compiler_builtins"],
+        cfg=[],
     )
 
     append_proc_macro_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
-        [],
+        deps=[],
         cfg=["kernel"],
     )
 
     append_crate(
         "pin_init",
         srctree / "rust" / "pin-init" / "src" / "lib.rs",
-        ["core", "pin_init_internal", "macros"],
+        deps=["core", "pin_init_internal", "macros"],
         cfg=["kernel"],
     )
 
     append_crate(
         "ffi",
         srctree / "rust" / "ffi.rs",
-        ["core", "compiler_builtins"],
+        deps=["core", "compiler_builtins"],
+        cfg=[],
     )
 
     def append_crate_with_generated(
         display_name: str,
+        *,
         deps: List[str],
+        cfg: List[str],
     ) -> None:
         crate = build_crate(
             display_name,
             srctree / "rust" / display_name / "lib.rs",
-            deps,
+            deps=deps,
             cfg=cfg,
+            is_workspace_member=True,
         )
         crate["env"]["OBJTREE"] = str(objtree.resolve(True))
         crate_with_generated: CrateWithGenerated = {
@@ -213,9 +237,21 @@ def generate_crates(
         }
         register_crate(crate_with_generated)
 
-    append_crate_with_generated("bindings", ["core", "ffi"])
-    append_crate_with_generated("uapi", ["core", "ffi"])
-    append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
+    append_crate_with_generated("bindings", deps=["core", "ffi"], cfg=[])
+    append_crate_with_generated("uapi", deps=["core", "ffi"], cfg=[])
+    append_crate_with_generated(
+        "kernel",
+        deps=[
+            "core",
+            "macros",
+            "build_error",
+            "pin_init",
+            "ffi",
+            "bindings",
+            "uapi",
+        ],
+        cfg=[],
+    )
 
     def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
         try:
@@ -243,7 +279,7 @@ def generate_crates(
             append_crate(
                 name,
                 path,
-                ["core", "kernel"],
+                deps=["core", "kernel"],
                 cfg=cfg,
             )
 

-- 
2.49.0

