Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7F22F3AB;
	Thu, 24 Apr 2025 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491130; cv=none; b=tA4fudNEO6VxqAN/50U8IQ55xu4r91tBhUMgByLS31AxkC2UiGIp56ItAVrHtHeTtCu/TUO3JFBUhDP9un0as+NTDKbTQ6UxEvzO/k7HfWGr5REynLcLhG/vLl2fb74U135XF5VeoYXr+k64uG5oC6wAhV6grdm6uJQ9QT6HMFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491130; c=relaxed/simple;
	bh=27ICFOl2juZMkeMfFHO6457hI1FQs6ziDM9OBLRqgBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGEJS3JVSjacaNSMBgEiD6sVKoDdBiNvS9h1xcJxN1tFuTIp7YytVZDyPQKH4OQNbVGJEpAkJYrKHZwa8TxcRwBce3JS1Oq2fjRuRCG+1y5P/y/FYeAsb/Vyt4RbtWoyR4hUqezLsgz2F1BUP0o0+mh3VFJWNuoJtyMONrv3AQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DudtMgZk; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DudtMgZk"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6eeb7589db4so13564386d6.1;
        Thu, 24 Apr 2025 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491127; x=1746095927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5r1EIESYnOdfWNwNz6CrlRMRpjB4h4ox/FopfXonFs=;
        b=DudtMgZkCQr0E7hsd9DYQji/p0G/7+DK1GRzjcsWTgbLRiMH++RcFbOF3fyRYw4F9W
         b+B1WzmLbF/V0RECLXaNltqM2ETEBiqHNj+YcE+nxZu5wKLzuERyBt2EknNk0blMsJ6k
         ydUnUtOQwfGZiaCUlpJc4yLuyYx9pvH+jhiotc37VLIVSn9tuSCMSUsIULpQDAyJ6Scc
         d/MBvLshZyXr4bkIVo7eHa5nIDnq9boRdMPnOwkrYh6ypsTezxdt0vU39svkZrPf/ukv
         6h02kjLqQJKJy27Nsr8mLbnEBeW/mugVccDum0MsFqtZ1DcLN9P4ItV/7Q9aAfjHVRz3
         ZsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491127; x=1746095927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5r1EIESYnOdfWNwNz6CrlRMRpjB4h4ox/FopfXonFs=;
        b=H95RFK0kwRoSFd7VmimP+/c4alM30s9GrvM86FXIBLM11McMWshor50VMzgeEV26KT
         drmLF2RomNFtC5kmMXFeIsxdxY/IY9fBEyPWxcd9vuhNPnTBZBUrjjoCIGb74IMSsZtw
         ORPDvPDWeRUzI0puOT/pSpDUphSYbWyIJmty8MBLGTm8gsN4QD/dZk7AwK3HyOd18+MT
         pzpD9WMw8EFlVC+hf1cE4edNHAtOHTPqo3lAXWKjEVFCoMlwVSf8gbnT/JL+0IHnRDnM
         BhDiIH8YlKH0Z9oxki8NksBdJ+p0q4D+rcfRVirs40vgSNj4g0Hj1l6Bm6P0bzVaA6s2
         ID1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5RXMXjmk1CZ0Ojd1BWN0XtVRUs+GizVCAWK94sMBUrAJPYiB10d7HNszx/LhObwmk2cykOZ0PI8HuUQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0L/Sfc9/cyzF/wlKdp2aK78XgezU1CjuA1A/irI+j0ZN6njg
	OcvIfpnYi+Q8lU4G8pzJL1M4kcGBM7lHnKIitPcZLawbpuP77wlX
X-Gm-Gg: ASbGncv6wdQ66f2p7f+GUf/EXr6ry6psjF2LjxPIm6jYgaRgnUHjbeFtzQZB0btq13P
	JTWD1uD0qGU6rBMYDfr5FAefOxaizlbHV4neTL5GWQ7vRSoCukxZ7YJDUQKd+wY2clvQPCy7RG+
	8TPP/QmKG0repk33s/sLLflNnbzjkcw0VBTICnvdpnv7bApCiAee02B6uzl/3FGDu4KsDaHBw4G
	rozm9+MrHTlVk79XsU6XxM+nMOyxJTrUlLbbtXuojBunmCNCss9Nj0+bfAkSyFoqcupnc2JdQpT
	LqU9PHwjZ+3dh2VsVvh0/O/K+2I6045YSFrTuCcttJg8sfaz9M31xr5guYNgLafKPRxy/iA08hx
	c6i0=
X-Google-Smtp-Source: AGHT+IH6sAfbv2amdTI/ljOGh36RnH5cs6OB87uagutmXQ7wXbnursTwyqKdoLFOopTpibKR7l9XUA==
X-Received: by 2002:ad4:5882:0:b0:6f4:c21b:cd9d with SMTP id 6a1803df08f44-6f4c21bd1e7mr15425916d6.29.1745491127192;
        Thu, 24 Apr 2025 03:38:47 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:46 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:33 -0400
Subject: [PATCH v6 05/13] scripts: generate_rust_analyzer.py: drop
 `"is_proc_macro": false`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-5-40e67fe5c38a@gmail.com>
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

Add a dedicated `append_proc_macro_crate` function to reduce overloading
in `append_crate`. This has the effect of removing `"is_proc_macro":
false` from the output; this field is interpreted as false if absent[1]
so this doesn't change the behavior of rust-analyzer.

Link: https://github.com/rust-lang/rust-analyzer/blob/8d01570b5e812a49daa1f08404269f6ea5dd73a1/crates/project-model/src/project_json.rs#L372-L373 [1]
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 55 +++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 74f7ab5541a1..a7f94f3be93e 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -41,13 +41,11 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         deps,
         cfg=[],
         is_workspace_member=True,
-        is_proc_macro=False,
     ):
-        crate = {
+        return {
             "display_name": display_name,
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
-            "is_proc_macro": is_proc_macro,
             "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
             "cfg": cfg,
             "edition": "2021",
@@ -55,13 +53,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
                 "RUST_MODFILE": "This is only for rust-analyzer"
             }
         }
-        if is_proc_macro:
-            proc_macro_dylib_name = subprocess.check_output(
-                [os.environ["RUSTC"], "--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"],
-                stdin=subprocess.DEVNULL,
-            ).decode('utf-8').strip()
-            crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
-        return crate
 
     def register_crate(crate):
         crates_indexes[crate["display_name"]] = len(crates)
@@ -73,14 +64,48 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         deps,
         cfg=[],
         is_workspace_member=True,
-        is_proc_macro=False,
     ):
         register_crate(
             build_crate(
-                display_name, root_module, deps, cfg, is_workspace_member, is_proc_macro
+                display_name,
+                root_module,
+                deps,
+                cfg,
+                is_workspace_member,
             )
         )
 
+    def append_proc_macro_crate(
+        display_name,
+        root_module,
+        deps,
+        cfg=[],
+    ):
+        crate = build_crate(display_name, root_module, deps, cfg)
+        proc_macro_dylib_name = (
+            subprocess.check_output(
+                [
+                    os.environ["RUSTC"],
+                    "--print",
+                    "file-names",
+                    "--crate-name",
+                    display_name,
+                    "--crate-type",
+                    "proc-macro",
+                    "-",
+                ],
+                stdin=subprocess.DEVNULL,
+            )
+            .decode("utf-8")
+            .strip()
+        )
+        proc_macro_crate = {
+            **crate,
+            "is_proc_macro": True,
+            "proc_macro_dylib_path": f"{objtree}/rust/{proc_macro_dylib_name}",
+        }
+        register_crate(proc_macro_crate)
+
     def append_sysroot_crate(
         display_name,
         deps,
@@ -108,11 +133,10 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         [],
     )
 
-    append_crate(
+    append_proc_macro_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
         ["std", "proc_macro"],
-        is_proc_macro=True,
     )
 
     append_crate(
@@ -121,12 +145,11 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         ["core", "compiler_builtins"],
     )
 
-    append_crate(
+    append_proc_macro_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
         [],
         cfg=["kernel"],
-        is_proc_macro=True,
     )
 
     append_crate(

-- 
2.49.0

