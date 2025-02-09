Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AEF241CBC;
	Sun,  9 Feb 2025 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135109; cv=none; b=afKcQ86/sH7IZfiF6Fhg0O5aDIxbpJSjCIkKzbs55XJbW/CVMRABNKxUev9TFtMjhMBIK8vy4le0VZX5fLpN4I2V2nvUKoyZF9oEsyw4zLixyDycOb3uUnjGZudJkXb65uWcSaXIwAF7f5fB8HkL7tuTyhqg6EkFF4ne/eVJfF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135109; c=relaxed/simple;
	bh=tpp+HhS5c1vQqIa3l51GIBBumfDFTVTs8A9zUQaecZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYy8Y+fTm0bvhBOH0NnVd2qpMdMVVdSq7+skl/MaOQLtrxp/CcuwCpqG0KCxXa9wBPjaecdtA3DrfFvH5MK66CsO35U7priqQEUvTwiPNQ6KPPW9G/F+unqcVi2QaGd2ttQaIpIZ8IIg96o/4Dg77ZZR0Pk1T4l0csLYo6ShHys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BONfS35r; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BONfS35r"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c060568959so11801085a.1;
        Sun, 09 Feb 2025 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739135107; x=1739739907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiWD7eS04IvCFBhTX/2ExyP1h9pWIv3v/MbJ7+UeEI8=;
        b=BONfS35rnDXWiStHUdSddUHbIWlJFt623O9XEYQNxC1AUqZxTs9nm1nlukMhBvzYqM
         E5tCJn+ctH/ra86qDKI7hE9bCo0AOt9frOYfOul1DmWVX9qiw2OyYOtmmONktsAE5cqh
         TpyV8fyCPnrtapqJtHjp5Kq/XPtd1NtvKeZLq3QYPR6jEqsJQednupocbc5dMIQxmQIt
         2gKFO2c98wG6a83wUJyAyYA5myA0cOWpRgvGcksEecr6jPvQ8SgDI6A3gbssWfsbZp0T
         TOqGQwPW6rtN9xejk/7gbVtTeB0kOMYYJ/WcbpMCGAg3p5dFdvHINGcy3CsIjJREpHnA
         7dbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739135107; x=1739739907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiWD7eS04IvCFBhTX/2ExyP1h9pWIv3v/MbJ7+UeEI8=;
        b=gcQpohMEYxdUULcF1rpmv2tr5a2ZdiEBXgw1yD+hbeqGjooSidEMvEntWat+/haU6H
         u5wnNwRg2LDLWi3vbf0BOCPPpcOcoQt1k8uo5AO5Wov+Syi5ShJ0JEZmJ+aCfFF4LSoS
         uaiBgogacbJw1TSpwJA8OdwdgCUkfl/kd8eDmxQ2d9NPTqrjdEAklM2LVBArNozZLUAF
         2Z/9P+1aSGDA1PDCFPbaRQBybncMJUU6kfpbt+buMEy+SEMdUDboJsjr8ln9ZMZQzimM
         33AA13Vg5b4Um/eNSJ3evFT69qeiHdBpryDf/e7xA/L+jnOvkjPPQji37f/ysNESrovq
         UEUw==
X-Forwarded-Encrypted: i=1; AJvYcCXf4zEqFg2QCxgbnwTQnfz4/EL6bCG6TxnlBQPv9LXhltcVKkIusLp7THnKbHdttQT5f3ewX9lDrywNLq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIH3y8p0xOqQDhYjJzjWt47peq+m5/6LgVuCWOAY2eWSXh5yMB
	UC+cIg7fsL9vyDYfMWv9CiVkQGllUz3vzIX1fehxiTGU+EIBr+76
X-Gm-Gg: ASbGncsUihL+ZIo+OdEDYgARgSGOriu0y1eXAU0d4NFEm7o6fay/znZn30cJpfztmKm
	mHoSoWAFdSQ2dXeo6ZikIb+JY9gzx6CIgZbkI62HbnhLZpl1tO483segNepk1N4b8JGFdnDR/kv
	EVkMCV11PMNWCgCbmNby0bfR80slOeZqQSJTg//UqR2ftHKKcUhWeQfX7F1kRr0vEJ5mUBLNJu7
	ekdRBdDKR0+06rq9rWIudWrKcjWwhH+34tFbMl2Z/3O4TJRaP64V3XpHT06Z8lz5HzWvgcfARul
	8XorA6YU7GTQ/U7AWpffjZSdXXCGctt+X0TFm7U=
X-Google-Smtp-Source: AGHT+IGt+X/C9WBSXpxZglWrezYuB9hTMLlOFlOBNt71f5rqAO5uAvkogTiL8EmyWzZ9DwtL6dUTtQ==
X-Received: by 2002:a05:6214:e47:b0:6e2:43d1:5fe5 with SMTP id 6a1803df08f44-6e4456c5b23mr187139956d6.34.1739135106648;
        Sun, 09 Feb 2025 13:05:06 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:15f6:96e9:3308:934a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44d545327sm24915476d6.33.2025.02.09.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 13:05:06 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 09 Feb 2025 16:04:48 -0500
Subject: [PATCH 3/3] scripts: generate_rust_analyzer.py: add missing macros
 deps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-rust-analyzer-host-v1-3-a2286a2a2fa3@gmail.com>
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
 Tamir Duberstein <tamird@gmail.com>, 
 Chayim Refael Friedman <chayimfr@gmail.com>
X-Mailer: b4 0.15-dev

The macros crate has depended on std and proc_macro since its
introduction in commit 1fbde52bde73 ("rust: add `macros` crate"). These
dependencies were omitted from commit 8c4555ccc55c ("scripts: add
`generate_rust_analyzer.py`") resulting in missing go-to-definition and
autocomplete, and false-positive warnings emitted from rust-analyzer
such as:

  [{
  	"resource": "/Users/tamird/src/linux/rust/macros/module.rs",
  	"owner": "_generated_diagnostic_collection_name_#1",
  	"code": {
  		"value": "non_snake_case",
  		"target": {
  			"$mid": 1,
  			"path": "/rustc/",
  			"scheme": "https",
  			"authority": "doc.rust-lang.org",
  			"query": "search=non_snake_case"
  		}
  	},
  	"severity": 4,
  	"message": "Variable `None` should have snake_case name, e.g. `none`",
  	"source": "rust-analyzer",
  	"startLineNumber": 123,
  	"startColumn": 17,
  	"endLineNumber": 123,
  	"endColumn": 21
  }]

Define and add the missing *host* dependencies to improve the developer
experience. Define the *target* `core` crate using the new
`append_sysroot_crate` helper.

Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
Suggested-by: Chayim Refael Friedman <chayimfr@gmail.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index cb49f0b07c97..124f6b0334db 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -92,14 +92,28 @@ def generate_crates(
         )
         return {"crate": index, "name": display_name}
 
-    # First, the ones in `rust/` since they are a bit special.
-    core = append_crate(
-        "core",
-        sysroot_src / "core" / "src" / "lib.rs",
-        [],
-        cfg=crates_cfgs.get("core", []),
-        is_workspace_member=False,
-    )
+    def append_sysroot_crate(
+        display_name: str,
+        deps: list[Dependency],
+        cfg: list[str] = [],
+    ) -> Dependency:
+        return append_crate(
+            display_name,
+            sysroot_src / display_name / "src" / "lib.rs",
+            deps,
+            cfg,
+            is_workspace_member=False,
+        )
+
+    # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
+    # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
+    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
+    host_core = append_sysroot_crate("core", [])
+    host_alloc = append_sysroot_crate("alloc", [host_core])
+    host_std = append_sysroot_crate("std", [host_alloc, host_core])
+    host_proc_macro = append_sysroot_crate("proc_macro", [host_core, host_std])
+
+    core = append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []))
 
     compiler_builtins = append_crate(
         "compiler_builtins",
@@ -110,7 +124,7 @@ def generate_crates(
     macros = append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        [],
+        [host_std, host_proc_macro],
         is_proc_macro=True,
     )
 

-- 
2.48.1

