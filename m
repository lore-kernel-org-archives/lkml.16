Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862A22C339;
	Thu, 24 Apr 2025 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491128; cv=none; b=XGvmpaJohcrpn2EUYxoSHw6TtEGe0wemSrD7SLYoOlU6GyHrTaSyFQB6fNWO1llizbmPNhklWyNgo523rqNxjjecQ/OxkxH5WqqpnbEdMEHp7OaG5gyvmdqVww1P0bNGdY8K29VWtuzvA2/PfvStd6DsXQmvOuv7wahVaPK8Y4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491128; c=relaxed/simple;
	bh=HTv9fwFZp+P+sHRaLwwVi7cGVgUB8Po7XL+/jPfYgM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mq05dLVo8rIIpNbu26/9HxX9uKK7RkjQTqJO9ai7ioF0Hm8tF7S/KD8Aaq+Hpl9OOhHhUaYVS7FLRHa87DvlbWbnxu7PPNUjRCUT0TeOO3vIPl6n5PM42E1CLbp+dJuJ4udswqhzYo4opYuZI/e01fXtbRm76N10hUAwh+h6GVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2i68LAx; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2i68LAx"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0ad744811so6238316d6.1;
        Thu, 24 Apr 2025 03:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491126; x=1746095926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8C3h2/SJwtP1G69T2vLCMXxUKgzGh/K1TU6FXaAc+c=;
        b=D2i68LAxUudlmdbKKOiq1eacpJe2oFzE+8WDa+3S3qJc3G77SOvbSAjl3ONl9pjBkT
         qPCzbnIemgNCPLHl8B5wGRYzi+DvXC+d0l5lavvtvxzqzC94/Z2uyXQWB/VbLVqV5y8y
         zZkyh9tSago/uRQ3AHWvm33LgcVTjTZEHeluW2qq8RRLX67qoara50I/zNT3En9lxTFl
         Y9BY8yRWJpswTsApg3/OSwdVkfUHRlANyLSuvbM3bZLieF2skdLDoDsUf7Tdd+ek5SXa
         s72ycls/fYB5s7vG0AcMjuYVL9lUyDguG2qHe2tMFx8eFFZiiPP+sUXu+Z+VU1d7aEfI
         SBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491126; x=1746095926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8C3h2/SJwtP1G69T2vLCMXxUKgzGh/K1TU6FXaAc+c=;
        b=CBWkSBZYBOHurmOD+zgV9aDO+oMM4kLztHuy++/qFqeZK2r/H5YTbXVq+fO7CVH8X/
         91NtnACQI/K7d8vxJn0Pwh4i2FmeC2uEdDv4tIF560/zTCpVNNdGTXfhw1npP2Q7M7ZQ
         Bps7eT/bOSXqFVC98NAF7uYdootUzpvsnevBgwLJdlQrZCa+Vndq7mGXnSK4J6mKHc2l
         EJqc3xLZ4NpU4tiot8Y3wns8nwKwGpjLVOeQ03Dl7bcNVJheBeLl2jOPOzitR2yGjAF2
         d+eh1Kr0c25Yl/PZ56Vqj9lBlp0e0ICwWE011TTSx6saNi7ic0yHt/yWfxAq+kqjOQCR
         3avA==
X-Forwarded-Encrypted: i=1; AJvYcCWvtHxWy7hZ8FlvyWuzVDEACzcxcLSYc9dPYz1rbloMtrB8u6wjn6wHXWI0TnzCMLoKKbpWVqopmiqIfMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6F+PC/r3p3GrxbnFBbOverxU2rAGpT4pm2RRheb4vzM/vbUvQ
	N45F3ELMwzn1NgntYmzEQE6AACQnD03iC33iWo5VEE8oORY4WaIb
X-Gm-Gg: ASbGncsqom4I5uOkMI8lQ7E60m9tjx/bQ7FjswydD2WJyhipkjLO4xHosw+xDwLdlEa
	PeaEp+5Jqsg7w26Pzds4lrTo+/ZfgwE2c5ZkgMYrwGjkhe18nreYYl8tw7qlb9YNLXha7Ouvzav
	sKie4ReYlnrtN2MuntgTYkEU9DooLIvgBTG6njS1PoWgb8PzkLM1xXCbnLN6GMPnbTcVxIfGfxB
	tNOQBRbV4ZeIU/Ft3Xolmbw753LeJLY0iOtOqf8DuJfGzKzDuciHTpIaLsyusGN6ilW/g58pvTU
	Guoyyzj83UObCbVNR8FpSinpfpXam38Q6zxWG2Fnc7fUXWFjjFQ3ANVB8NfpwxWTydok
X-Google-Smtp-Source: AGHT+IHA6mdrfPLrtllERIawpG031zmLtuf5ietbJEMeqHicFne+qKMs2vBCghKDUsQSVCgML8vq7g==
X-Received: by 2002:a05:6214:20ce:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f4bfc6febbmr33784636d6.26.1745491125997;
        Thu, 24 Apr 2025 03:38:45 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:45 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:32 -0400
Subject: [PATCH v6 04/13] scripts: generate_rust_analyzer.py: extract
 `{build,register}_crate`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-4-40e67fe5c38a@gmail.com>
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

Extract helpers from `append_crate` to avoid the need to peek into
`crates[-1]`. This improves readability.

Suggested-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 828e7797d253..74f7ab5541a1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -35,7 +35,14 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
+    def build_crate(
+        display_name,
+        root_module,
+        deps,
+        cfg=[],
+        is_workspace_member=True,
+        is_proc_macro=False,
+    ):
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -54,9 +61,26 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
                 stdin=subprocess.DEVNULL,
             ).decode('utf-8').strip()
             crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
-        crates_indexes[display_name] = len(crates)
+        return crate
+
+    def register_crate(crate):
+        crates_indexes[crate["display_name"]] = len(crates)
         crates.append(crate)
 
+    def append_crate(
+        display_name,
+        root_module,
+        deps,
+        cfg=[],
+        is_workspace_member=True,
+        is_proc_macro=False,
+    ):
+        register_crate(
+            build_crate(
+                display_name, root_module, deps, cfg, is_workspace_member, is_proc_macro
+            )
+        )
+
     def append_sysroot_crate(
         display_name,
         deps,
@@ -122,20 +146,21 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         display_name,
         deps,
     ):
-        append_crate(
+        crate = build_crate(
             display_name,
             srctree / "rust" / display_name / "lib.rs",
             deps,
             cfg=cfg,
         )
-        crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
-        crates[-1]["source"] = {
+        crate["env"]["OBJTREE"] = str(objtree.resolve(True))
+        crate["source"] = {
             "include_dirs": [
                 str(srctree / "rust" / display_name),
                 str(objtree / "rust")
             ],
             "exclude_dirs": [],
         }
+        register_crate(crate)
 
     append_crate_with_generated("bindings", ["core", "ffi"])
     append_crate_with_generated("uapi", ["core", "ffi"])

-- 
2.49.0

