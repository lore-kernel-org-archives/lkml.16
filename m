Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8584241C98;
	Sun,  9 Feb 2025 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135108; cv=none; b=t02fqxN1aUF/9CWE7xOj79F0DQtxv5je7dYYAmnJyYP4kY132OLqQqIBhpjf3OUfipbhUbLSEBwZLQfMQ1YfvuyQMdbHN7qz9bkP/WsJr1032ZYJyXyRhSxukmbOtk4COJE2EwDCX//kOgtWBPWRQwdvdvj8Z2bVcrIaIWXso/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135108; c=relaxed/simple;
	bh=k/a+YYloKs30FYcmJMxVoiBc5880F7AOdupmYFGqHLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJQ4N0Q4GNVf3Gqw51EfUMOdwy2wmP5onkFhyCCfisE2S52AIWngD9QPdLWog02UJBxylwo1Avy5FYXTESuLjeB7Cwjm5fMmowP5IvTw2qdY1PQByn+ZNgx7iDwpgHLf7hPq/B6xWcHZOJa16sMtTqzOry7qrNTTCnc7t6yUOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmYcaa41; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmYcaa41"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd0d09215aso29233526d6.2;
        Sun, 09 Feb 2025 13:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739135105; x=1739739905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+qHhvOuniI0ncU/zRRxclD9Styu48aqgyVuEXkRMAo=;
        b=bmYcaa41FXS27xDkfGycp0ZIU/YqIkopXeMG/4K7hE6ihqlcADjBQnwx3GntsF3Lmy
         ivQtz/+mRZnpKM5iOjsfoa3VlnJ7tlvylO5i1TVxxX3xgDrEoiCs2P6/RTJJJv9IYs6B
         sDPj7dVHH1qXh+3ecaQ1CtcXJ7HORS7xBuFgIs2wSp+rmCqXn6SepJBM8Tux/ewZQNU5
         PTYfXLkY5sPQnLzvuRS7/sTVEaiPXYSAGjmX+ow43cYE8XaXF1Qu8BjJhU7oYpptgi6U
         JfJBmcJDQH5whA8/YqsL6ZwqNbk9+aplhRmDyPWF5K5P6PkbdbzhrvOIlHubcmTZcCNN
         u2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739135105; x=1739739905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+qHhvOuniI0ncU/zRRxclD9Styu48aqgyVuEXkRMAo=;
        b=g8/Arfro8cgL917btT7cWZcg4+QePe356z6YLAsTxHRFLJIqZpJnlo6vdahQ4PnnBa
         uU/NyTqhzSZcr48qCB9Wo5fPI3M3lgVldZ4WFKKeYaMRHpSqNsVe/Ep0NjaBrsA2XZZe
         +V39301bj/YJXsTXwsQCfjp1+3HTMKVyV48NymznPROOfKn0oOIHwBweUiiRYkCv5HiD
         2fA8Z3CDLM0aoysvrwjhqlrqDetGDKY+LJMdIjxyA9omtO9MziHwTQt0d1Te1L8707d9
         PCh2QbYZfBWSovzgTrBv0/rhr8Npr7gCQMkJ6s1RUzbYQQ1z51k5bSCAyoIvS/gqchaM
         n4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU49JYECY5ICvLi1Zn6auo7G5U3YQ8RpLEJiwlqVKb5RwpbanPM/vSd6JV/Zqj9DdZ7BJTzggwbr89mAbY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Jzike/koq56nEZtsg+RWwZFwjAGHA/qbQXNiXBgvqgQ9FIsx
	CD1BoroebRRAg0/xkEUAkOTNmzjlboQM0Z4XF2Y6Tcutn2BA0/s3
X-Gm-Gg: ASbGnct84S5rMAw7H84NaItRsOm65wb1kDkiZhzNalY60GQFXkBMYvKepacmEarXMYs
	xp+98Gf6sqjZI6Y6Y3fDc/FtjpFVSnLACEIDafCpomHXlEN2kMz4MaabzqLYi5nvgolP5Il+Tkg
	37fTkWABJPT8ba8e9nckXzL3om0Qtv0Cc6wkgkr1ucCxbMtV9ksWTsrHUmpTtda2+pg8irTKPgH
	e/UkmGrPmCI7/bZG4ajt/4y1NF/SWCBlhscqIrrmJ786PNmffaYhWq0Rb5tdMKjwUXUr6gr8tXy
	nqSXs5YfLlRp6hXPfpkHxQcfPchURgdF+omxs6I=
X-Google-Smtp-Source: AGHT+IGceoNLFzIXI/inRVpNwGNlHGgtVFR8e5CZCcFbHvOHDHCqFbeMCRKxtFqKxvyqFTl6xuW0fg==
X-Received: by 2002:a05:6214:1c42:b0:6d8:8b9d:1500 with SMTP id 6a1803df08f44-6e4456e01fbmr238839956d6.36.1739135105502;
        Sun, 09 Feb 2025 13:05:05 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:15f6:96e9:3308:934a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44d545327sm24915476d6.33.2025.02.09.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 13:05:04 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 09 Feb 2025 16:04:47 -0500
Subject: [PATCH 2/3] scripts: generate_rust_analyzer.py: identify crates
 explicitly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-rust-analyzer-host-v1-2-a2286a2a2fa3@gmail.com>
References: <20250209-rust-analyzer-host-v1-0-a2286a2a2fa3@gmail.com>
In-Reply-To: <20250209-rust-analyzer-host-v1-0-a2286a2a2fa3@gmail.com>
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
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Use the return of `append_crate` to declare dependency on that crate.
This allows multiple crates with the same display_name be defined, which
we'll use to define host crates separately from target crates.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 28ab05de52b8..cb49f0b07c97 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -56,21 +56,18 @@ def generate_crates(
             line = line.replace("\n", "")
             cfg.append(line)
 
-    # Now fill the crates list -- dependencies need to come first.
-    #
-    # Avoid O(n^2) iterations by keeping a map of indexes.
+    # Now fill the crates list.
     crates: list[Crate] = []
-    crates_indexes: dict[str, int] = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
     def append_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: list[str],
+        deps: list[Dependency],
         cfg: list[str] = [],
         is_workspace_member: bool = True,
         is_proc_macro: bool = False,
-    ) -> None:
+    ) -> Dependency:
         proc_macro_dylib_path = None
         if is_proc_macro:
             proc_macro_dylib_name = subprocess.check_output(
@@ -78,14 +75,14 @@ def generate_crates(
                 stdin=subprocess.DEVNULL,
             ).decode('utf-8').strip()
             proc_macro_dylib_path = f"{objtree}/rust/{proc_macro_dylib_name}"
-        crates_indexes[display_name] = len(crates)
+        index = len(crates)
         crates.append(
             {
                 "display_name": display_name,
                 "root_module": str(root_module),
                 "is_workspace_member": is_workspace_member,
                 "is_proc_macro": is_proc_macro,
-                "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
+                "deps": deps,
                 "cfg": cfg,
                 "edition": "2021",
                 "env": {"RUST_MODFILE": "This is only for rust-analyzer"},
@@ -93,9 +90,10 @@ def generate_crates(
                 "source": None,
             }
         )
+        return {"crate": index, "name": display_name}
 
     # First, the ones in `rust/` since they are a bit special.
-    append_crate(
+    core = append_crate(
         "core",
         sysroot_src / "core" / "src" / "lib.rs",
         [],
@@ -103,37 +101,37 @@ def generate_crates(
         is_workspace_member=False,
     )
 
-    append_crate(
+    compiler_builtins = append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
         [],
     )
 
-    append_crate(
+    macros = append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
         [],
         is_proc_macro=True,
     )
 
-    append_crate(
+    build_error = append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
-        ["core", "compiler_builtins"],
+        [core, compiler_builtins],
     )
 
-    append_crate(
+    bindings = append_crate(
         "bindings",
         srctree / "rust"/ "bindings" / "lib.rs",
-        ["core"],
+        [core],
         cfg=cfg,
     )
     crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
 
-    append_crate(
+    kernel = append_crate(
         "kernel",
         srctree / "rust" / "kernel" / "lib.rs",
-        ["core", "macros", "build_error", "bindings"],
+        [core, macros, build_error, bindings],
         cfg=cfg,
     )
     crates[-1]["source"] = {
@@ -172,7 +170,7 @@ def generate_crates(
             append_crate(
                 name,
                 path,
-                ["core", "kernel"],
+                [core, kernel],
                 cfg=cfg,
             )
 

-- 
2.48.1

