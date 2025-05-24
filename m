Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DD4690;
	Sat, 24 May 2025 23:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748129987; cv=none; b=fHGa3eoVRgRVLukvyiYV2xf4NYQahcOoxTDEId9uAzkjxwQcz7E5mo0trMsh6oGwpBsH6oI52XZOUIN9bNct5eCGI3ZfXHGqoAjVBzeHsYBaVmrAw3bWOjaTOJDIeV2sb0h35v1cD4Pu91NOYj80xaZHjG3aanVORHAChHgJKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748129987; c=relaxed/simple;
	bh=RYxVIYfjeVfGihjd1LIChsnAKujthuSIUn3ZCPdZX+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uvyCfGHvjdJlaNiGuDqFNbwp0VPIu5weiXT4TdUIibOqUxfd2zbocLN2QzL1zSSJ4OkvNUQmf3KNy5UAgBYB0WO2VJeUrZY/VuYRYlIsYsjiETYNDI9qahypOXQaUFN68toIB+tGSBRsPRRPuzoSrmnYc6r4LzlXo1GTn72Z7nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hfh4nNx7; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hfh4nNx7"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c54f67db99so212270285a.1;
        Sat, 24 May 2025 16:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748129983; x=1748734783; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbO3oQPHCvuTTXVKuQtlj/Uk2lmumJMG529cAn20zdQ=;
        b=Hfh4nNx7aSPdIKQo8BNhAx+GdLPzFJzjMybL7b5tlBeJmn0w2oN5uTVsvrDij73fI7
         hEAOkq71kDjtc8yyL9m5c+Ftzbx4e3cHJT48mChMF6Iv1/XGVPLD+q+5TD6OjAv3m+5p
         /zaJaXSfjCmxgPa64ZXEZWFg1ubYD6CY43aQ9nUbAo13BMtV7XODRILUCGpvgwAkpFCZ
         BP67zIN1JMWq7caJvmvYrusP6FqUJECrTsiaz6A7v5165/2cLZEga/HIwGjzgrdhXeCl
         QVRsL02krs18CclKZe1rTMoNnUsiRLPpJVRZxYsHaeR4EDkm1/4uc52XV3UlUjih7Sz8
         q3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748129983; x=1748734783;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbO3oQPHCvuTTXVKuQtlj/Uk2lmumJMG529cAn20zdQ=;
        b=wm18UcL5vRySNZMnD0xvHDJ+YCs4/IRCCRu3cG1lDo0lI8j33Ji0q4I40CEK0AeSaG
         mZ0IY5wCYOIF7RvBZqWODVJL3HQ1ZuzkD6NJCptjgNJyZY94Hd8p1IgVx5YdBE4A/zYZ
         5jNg/helXKC+bWw6TynIpQO+2Z99hAN4Ep1LaZh6Rh5MZ3N02UZ9qwKv1uc24ATd9GQ8
         axB8xXH2S+Li+6kg+bgoHViwMhTi7d/ZkNpfIr5FfArXH6FQZKdGpXDBUUQEOfi1bayb
         eOtIF3SXH5rWDnVT5TkXOfudwL89lfwrh7n6Ajen039mduEGkrWdp4RhAvL5boV2Qcky
         M0zw==
X-Forwarded-Encrypted: i=1; AJvYcCUPbpl75BgLG7yt1ta3V/jVEudBhoKTxysdNc1783fcnf8y7dceT2xjS1lloTU4mtdN1s/YtLb2lqwvl5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVR39STqFQQuaqlXzJJFmH1Neje4N8MFIGp2qVeLjagUTV4rw2
	k0yHQwKvwC44Ol1+/sHQcFKBxd8ecARAjr4KCds/jxkUcFVgywmob+ch
X-Gm-Gg: ASbGncsSBbPPCLgKmy/1UwLKAey28jV3AfbLZExJ56fvQzrmifB5R1+BkNszr6bc38B
	eQsG5sSmwBDEUKQothPczDPS88PhlVANW3JI5jE1HxL3y3Vz2RgvJAB/QIZ9b2suKCfsh/c0koa
	AR3nRY894vZMup1K1xqXpgL9GfvJ/7PUxRy/7/1fQOuR9ISbphH2yrXpZv9EShINxBE/EhA1t3R
	1iRQly+6rMt5HM2ysg17ihy9zfpaPw/fqzmJte1Qse7AfFeHm2Zqh5HdODNjTdbS0g7aj+2XQwK
	G4LhKGqgWVAx/FuXUlJDKfN8tf+5fIaDXrfrKl4Gf+M3bOsNJ2tfJNF8V5Eg6iGeZKerPrKYsPp
	tYOIu
X-Google-Smtp-Source: AGHT+IEQBs54oTB/+YRul+bLjx1fCVKM9l9X5OuCN9FWLzTwa9SuGzA3MLj+x43I9taIsQYlSYME3w==
X-Received: by 2002:a05:620a:2544:b0:7ce:eb15:6f7d with SMTP id af79cd13be357-7ceeb157c20mr739219285a.20.1748129983399;
        Sat, 24 May 2025 16:39:43 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:8563:e370:791f:7436])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b6459sm1396122185a.78.2025.05.24.16.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 16:39:42 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 24 May 2025 19:39:41 -0400
Subject: [PATCH v2] rust: remove spurious compiler_builtins dependents
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-rust-remove-compiler-builtins-deps-v2-1-4fc2ff489391@gmail.com>
X-B4-Tracking: v=1; b=H4sIALxYMmgC/5WNQQ6CMBBFr0Jm7ZhOUxVdcQ/DAukUJgFKWmg0h
 LtbuYHL9/Pz3gaRg3CER7FB4CRR/JRBnwpo+2bqGMVmBq30RRlVYljjgoFHnxhbP84ycMDXKsM
 iU0TLc0Ry6kpKG+tahiyaAzt5H5FnnbmXuPjwOZqJfutf+kRIaJxtjKPyRndVdWMjwznfod73/
 Qt0EEHn1AAAAA==
X-Change-ID: 20250408-rust-remove-compiler-builtins-deps-1f061024dfce
To: Miguel Ojeda <ojeda@kernel.org>, Lukas Fischer <kernel@o1oo11oo.de>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
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
Changes in v2:
- Rebase on rust-fixes to include "scripts: generate_rust_analyzer: Add
  ffi crate".
- Link to v1: https://lore.kernel.org/r/20250408-rust-remove-compiler-builtins-deps-v1-1-4fda4f187190@gmail.com
---
 rust/Makefile                     | 6 +++---
 scripts/generate_rust_analyzer.py | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..c3d8c5ed0060 100644
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
index fe663dd0c43b..1c7399b5e4be 100755
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
@@ -115,7 +115,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     append_crate(
         "ffi",
         srctree / "rust" / "ffi.rs",
-        ["core", "compiler_builtins"],
+        ["core"],
     )
 
     def append_crate_with_generated(

---
base-commit: cbeaa41dfe26b72639141e87183cb23e00d4b0dd
change-id: 20250408-rust-remove-compiler-builtins-deps-1f061024dfce

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

