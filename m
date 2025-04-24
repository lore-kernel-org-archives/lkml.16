Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64105247288;
	Thu, 24 Apr 2025 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491137; cv=none; b=ao/Z0anpTxLIrR8Z+Pa6mjKNuaPBgY5Nmj+RPu3JqFSsdXkXEdnpg3V8lY51BWxILDfyk97pf3iMACF9btJsyS4P75/FaHx+Y2DOR1GSADjZSuzF+j6FkvP3PXmBjG4ciXVa4olphUl7vg+OV4Frux3aAdC0brR3+BCJqZbNXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491137; c=relaxed/simple;
	bh=3nl62yXxMssSA2tckUOrqcXIUupteJL1z7XxEiKpVcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ITbfY/I+ugqFSajMxTCUqf+LNTsAfmi8kSLJ5lsn2uHpLCnhLVK/fymNWin+88ZP2H4BF/i5qaQTmKc8hFnlXTI0E2OFVxS/kHF1TjbH+S09r1AASx5X7RXXYMfhkAXDBSglLGtEe4lpDfqVkJZsVPyodM4qQfjKptBfMpLBCdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK4JZ9g2; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK4JZ9g2"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so8868526d6.3;
        Thu, 24 Apr 2025 03:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491134; x=1746095934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaKewPOxsrW99MSIcPJ7ZDt0CGutndNdyQvNoR2CN54=;
        b=FK4JZ9g2SlvzWDVKuAzR3NruwSAvIs1FZIJJegdadJ9MCK1uLejxvq9A6SzWz+duQi
         tx8fSQ40amgxAsa92TkQeAYm0eZr2spDF0viuSX4OTV8CMZ5W/XR64otT1OGBiNcWWNU
         O3BizYMOjVCRg9BGdgSoZQn/n26YSgvl4LpynoI5eTY5pv64lIsWwaXIuXI393ovKHsA
         b7Iz363lDaNon6Z8g3tGFAcfe+seUN33aXGJNgLqZ+WPjAc1KOtLud9XXNhvmiNKfJGo
         xcbPjCR4gwl4a0b6eigRk6vrsB3YpvZ8WOzyWDZi28+cOPLtzZ0g6mUbLKGMtJpXk4V7
         DZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491134; x=1746095934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaKewPOxsrW99MSIcPJ7ZDt0CGutndNdyQvNoR2CN54=;
        b=d05wZrFnHVtNv3VdqRwS0PGxFfmlMc2hVXLRXLMEVywZMTcyyVKy0yBKoBWtay6GV7
         8nMTyjChOcNulQbaySlkgIZgJbnkFTV1CIMvfhRtLTEjvc+STSrM9Uk0Emx1EnP8gLA7
         leP3Jkm+cR8/jJQ56p9u5k/FcuiBxN5ftNOXnSxI0SOBu3lV5hen23c6Bh1lOEmWmW+V
         pAp1WRk7O7aW3jRYkWcWTs8rca48OsVGpTRnstlAnDO/VyuJUq7ORGZT2N9QqNgNl1/L
         wCnXlaJf/L6bEXeajIBCkDFoWhwLLZbGrPZQTU+96r14LkpWguczO9OCZO8AYTK1TuS3
         vEOg==
X-Forwarded-Encrypted: i=1; AJvYcCXhPGZE9LpC3DFoupvj6V23S1rWBlr5pUW37KE999B3+N6GtzmPV0giBH0vSBDLbe3epYy+yjY1phQY8xI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPZRT8UeQBJWZZHQ5AKSyWUrnBW9wy9AbBPdVH5wG8waV3zOQ
	TCrkr9AoQWUXiiEs4ohgC/jOt3KVl1DYmxXPderAPIBoe05aXODa
X-Gm-Gg: ASbGncvpWBU9AxZSxGjE/2zUiw07MQJWn2vMKS6UOf6O6vN+XFONC+0EbTOrjkBxygc
	blDvCgAxe3UIVsMVBJG8POvh7JpdowSk22EJ80DKXdbXTdJA6WRvp2N/BDaHE7J0JxGEY7N89Rt
	B5WozpNkOfouOhyYud49lvHKWdPnmAFEi5qp2I9C3SRhmcEAGxS/EIc2oFO2gzt7EOodfPIzFoU
	A68kMJzAFUPVO38Fccev4dobcspDCil0r4P8UDEgZhT59SoB11aM6bcjszlwvEfv2TOFkGJrb97
	GxYOshmohPfC9T0DRL0NNDlrCoSZt5Jjt7/iYkX3wzWXG2uI2GH6UBWdCKufMRLpcumI
X-Google-Smtp-Source: AGHT+IFuJQfUOrC9JLuQwKjc8vEK7Iw182APmexnycrNI57WJ8woRgCiA6Hh7Efas2gjRjFXKMYXzw==
X-Received: by 2002:a05:6214:29cd:b0:6e4:4484:f35b with SMTP id 6a1803df08f44-6f4bfc7d6e2mr33660656d6.30.1745491133916;
        Thu, 24 Apr 2025 03:38:53 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:53 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:38 -0400
Subject: [PATCH v6 10/13] scripts: generate_rust_analyzer.py: define host
 crates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-10-40e67fe5c38a@gmail.com>
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

Define host crates used by the `macros` crate separately from target
crates, now that we can uniquely identify crates with the same name.

This avoids rust-analyzer thinking the host `core` crate has our target
configs applied to it.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com/
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index b281e87cfa30..0e3bd64f857f 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -162,10 +162,16 @@ def generate_crates(
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
+    host_core = append_sysroot_crate("core", deps=[], cfg=[])
+    host_alloc = append_sysroot_crate("alloc", deps=[host_core], cfg=[])
+    host_std = append_sysroot_crate("std", deps=[host_alloc, host_core], cfg=[])
+    host_proc_macro = append_sysroot_crate(
+        "proc_macro",
+        deps=[host_core, host_std],
+        cfg=[],
+    )
+
     core = append_sysroot_crate("core", deps=[], cfg=crates_cfgs["core"])
-    alloc = append_sysroot_crate("alloc", deps=[core], cfg=[])
-    std = append_sysroot_crate("std", deps=[alloc, core], cfg=[])
-    proc_macro = append_sysroot_crate("proc_macro", deps=[core, std], cfg=[])
 
     compiler_builtins = append_crate(
         "compiler_builtins",
@@ -177,7 +183,7 @@ def generate_crates(
     macros = append_proc_macro_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        deps=[std, proc_macro],
+        deps=[host_std, host_proc_macro],
         cfg=[],
     )
 

-- 
2.49.0

