Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7D24503E;
	Tue,  8 Apr 2025 18:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138349; cv=none; b=uawEA9InkznoufNdUmwFhKtl3i5REBNJ6dxNtRK7ddwBMW5RNpVVqwZFA5UHOgU1/RHxwZnCpHvjLhHHH1JkkWynbb7JOvihAQ9iCdhDpyzTYqZrIBeMJTFY9tzOatuBMw7UiTk5R5t/dfQS3FtHluHQ9DDV1J4DmQXucsnXm3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138349; c=relaxed/simple;
	bh=1AIAOmc4+BL1MwEPjQncGsite0L/q+UqJSY/JgPuTKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=joIoPnUXGkMQ9Jc4DNmNX4UZF3dy8k1pzsTjFBWz0r3efXER/p928SoZPCcQGfjsXI+oUxtAh7kM96W+5RukgJaxLxY/Tcc/CldGNqpjAlKenyv6jVcO6z02ngLXXjtTuLMF6R4kO78MxdhlI5B06vY7fEWg2SLulof9pKX4lKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEmfND6n; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEmfND6n"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so50705146d6.3;
        Tue, 08 Apr 2025 11:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744138344; x=1744743144; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXzbNqX21KINjlwvOBtDTLvAt43XUqMC0bq2LYlTQao=;
        b=QEmfND6nuTXRD37/Oqd2maIRDJ9m5JGSsn/TNPmdqr1DFzPXxjr1gDlN1/ni9joKNw
         NYzp0m2ZRAxRKajPYO/w+pVSZEKz7vntdBdIJXYmxkt/45Cz3vzBDqrvFHO/mWqrXY2P
         6hgY702dZore6bKdK+WpvSXyHw+Oaass7/pa7Vt1JuVGfyffD+6tQue4A64OF4+mvXtJ
         d6zPE2+iDKdeCUe+p1BZnfcS9V5H9SZi1SMyPJc+qYNJ1Q44y5GbH3R4fhLGBI3n+rO4
         0UcJGWq+qX6mRCcnaWjZVDPDooSRvR45SXK/06RyoJsnOfWMEGGZ0dFBGcRP9/idCWKO
         eiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744138344; x=1744743144;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXzbNqX21KINjlwvOBtDTLvAt43XUqMC0bq2LYlTQao=;
        b=uScUCNS/AwQfpYDvTxPaPslPawAGWY2fynZmQRl7/LsYp+yrnS2iGKsv/m9Iu/nAyL
         if9kj9bLT1ruc+95oLOZUIhHCsXUv7ZTtUQaeGMXnpSKPHYSBSqgiULxKCirC4GOLPgP
         m8NxbjNpkwQAcbFDJ5I9bt4s4Lgk/v3bfuGJD8FCplgwWYOBPD1RLr4yNZ9RuBYCMH2+
         ZGcLF/AhzQsjozE+RxVhBtFiFMmY57jO4H7TeRHL1d5btJQK/IiNMwJp2o1oz7XPPrtp
         3PWyuHd1gush175T9UQRtxqDc0LP/vJh2Zf7BmpscD61JxEwDxXinZc4r2/o9TSeULFa
         Olmg==
X-Forwarded-Encrypted: i=1; AJvYcCWIELeexx3VwNrtqBtOgrDiw4jq3zy3IS9sxRbe31rspKW8S8XVIme1WKPZEY9jD98Z66UhlxHBqx6Lw0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1ozdjcQfxy2bmd/q2qSWfJBJT/fiVxBEVrlfYWuBh0tIBdPi
	jmpt4YjEIEVH+hB0kML1odXVcHkT4qvvKP9lhgjC5tr4mVxxfL99Nr92sugf
X-Gm-Gg: ASbGnct7Fj0TgtzseugdeUSRpG2eIjUjMwtc6jhcsyN+cbG8aPwsn1mBUat/4YH48RU
	Xk+6L0L/RGhsa3+/3I5ofWvXIgkawR41ul5OnGEzU5qOVKbetNOCk6QKBQi3OWu5Djxvbnl32+h
	ix3mxGTMzadBLMIV3tRaAZtm7R6nilmYAIuQyzVxLv0GRYdzvO9CmqoXBvX+0BSVtl1+Gcj75kg
	wWbWs3983aEvuyQZ2NP6PU0RM1cAyBhdzgq0lOw/ays2Om9VZEI7hWaU2V8ZVSO7hREqoQEJevV
	p/XFDMF7T43YrHORWLR1ETNDwZgs0RG7yCgRy4a+biyefZB30uzkYD7mH57gj38iGD16w6KwpYX
	LRGgko3tW7MBTXuZTp1gOQxH/sHl0bzVw9Ipy6CR4FcWa+xlf
X-Google-Smtp-Source: AGHT+IFl9Eh6ffoEeDMkQbqKK2M9fcPQhiIKpO1IBqsjJ4FbhPIIAFpmCmH2h8Wexiy8S62bnJL3Ig==
X-Received: by 2002:a05:6214:258a:b0:6e8:97d2:99a2 with SMTP id 6a1803df08f44-6f0dbc75c96mr3901876d6.39.1744138344472;
        Tue, 08 Apr 2025 11:52:24 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:3b8c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f0476adsm77472306d6.52.2025.04.08.11.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:52:23 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 08 Apr 2025 14:52:22 -0400
Subject: [PATCH] rust: remove spurious compiler_builtins dependents
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-rust-remove-compiler-builtins-deps-v1-1-4fda4f187190@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGVw9WcC/x3NQQrCMBBG4auUWTuQhCriVcSFJn90oE3CTFuE0
 rsbXH6b93YyqMDoNuyk2MSklg5/Gih+nuUNltRNwYWzG92VdbWFFXPdwLHOTSYov1aZFinGCc3
 YZ3fxLowpR1APNUWW739yfxzHDz4uN/Z0AAAA
X-Change-ID: 20250408-rust-remove-compiler-builtins-deps-1f061024dfce
To: Miguel Ojeda <ojeda@kernel.org>, Lukas Fischer <kernel@o1oo11oo.de>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

The dependency on `compiler_builtins.o` was first added in commit
2f7ab1267dc9 ("Kbuild: add Rust support") to `alloc` which matches the
standard library[0] but was copied to other targets in:
- commit ecaa6ddff2fd ("rust: add `build_error` crate")
- commit d072acda4862 ("rust: use custom FFI integer types")
- commit 4e1746656839 ("rust: uapi: Add UAPI crate")
- commit d7659acca7a3 ("rust: add pin-init crate build infrastructure")

The alloc crate was removed in commit 392e34b6bc22 ("kbuild: rust:
remove the `alloc` crate and `GlobalAlloc`"). As fas as I can tell none
of the other dependencies are required; it is only required that
compiler_builtins be linked into the rust-enabled kernel. In the
standard library, compiler_builtins is a dependency of std[1].

Remove these dependency edges. Add a dependency edge from
`compiler_builtins` to `core` to `scripts/generate_rust_analyzer.py` to
match `rust/Makefile`. This has been incorrect since commit 8c4555ccc55c
("scripts: add `generate_rust_analyzer.py`")

Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2faca8d34818339/library/alloc/Cargo.toml#L19 [0]
Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2faca8d34818339/library/std/Cargo.toml#L21 [1]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/rust-analyzer.20improvements/near/510200959
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/Makefile                     | 6 +++---
 scripts/generate_rust_analyzer.py | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index fa0eea8a9eca..eb0590a77e95 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -501,16 +501,16 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 $(obj)/pin_init.o: private skip_gendwarfksyms = 1
 $(obj)/pin_init.o: private rustc_target_flags = --extern pin_init_internal \
     --extern macros --cfg kernel
-$(obj)/pin_init.o: $(src)/pin-init/src/lib.rs $(obj)/compiler_builtins.o \
+$(obj)/pin_init.o: $(src)/pin-init/src/lib.rs \
     $(obj)/$(libpin_init_internal_name) $(obj)/$(libmacros_name) FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/build_error.o: private skip_gendwarfksyms = 1
-$(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
+$(obj)/build_error.o: $(src)/build_error.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/ffi.o: private skip_gendwarfksyms = 1
-$(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
+$(obj)/ffi.o: $(src)/ffi.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/bindings.o: private rustc_target_flags = --extern ffi
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index cd41bc906fbd..b573349d688c 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -81,7 +81,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
-        [],
+        ["core"],
     )
 
     append_crate(
@@ -94,7 +94,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
-        ["core", "compiler_builtins"],
+        ["core"],
     )
 
     append_crate(

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-rust-remove-compiler-builtins-deps-1f061024dfce

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

