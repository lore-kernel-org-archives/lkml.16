Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1192125757;
	Mon, 10 Feb 2025 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207011; cv=none; b=jTdMML0Bhg4p1sZquqfc3rijWLG04yHUaPJVtsrAaH5+Csxirv2O2lhsYJksktXHzDcJYayVGoOa3wOXdlMMF2HriWfwm9n8MJlQxuSiUL6DOOZ7dkIyJ8naxa2WLUrMjMwQndgfDBXVkrmPb4aEriLAgbhIzq+M1N5ozgx6mhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207011; c=relaxed/simple;
	bh=nUyQF9ZwjyFx8T5tvhw+XAD4YxjTBqecLI4HqTQ+i9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mt3TxAAHk5cCV3c6ZGgeupp2WkAUUk46a2ubzaIPCU7IIbhdOgGlybdyIv78JyjqBP43Rm0JCj8+aPvn2KLDtuptsnQlL0PH01R8I8DyIO+tWZUDxEYPNVQiJbYlB81O3c7VHdszHTlvj+ERPHE9DYns9PyDLpxZXDRnFQR+rKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOtfGBe9; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOtfGBe9"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c0566511aaso242781585a.3;
        Mon, 10 Feb 2025 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739207008; x=1739811808; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hao5A2zCROL2hkmLhO/BsCc51XjmtqWoaTQ4PUVjVZA=;
        b=VOtfGBe9cKxo0P3aB302yInZV4wXOnXXvJE3YlIMgmvqaGM37nOeUrZWyoM0VW3E8L
         hlQklPhYyz2s3HUT9cK/B8ipVKDP9abr1A5yulTJhfvwhRiZEmgDhCFFDnLFACoFKD//
         bqxtb4XiOu04Oam9EwzlFkwd8coPiPG9or8gDvGmb0QxkQS6z3oUOAFPDtFQSxdn3Jdl
         hjJYGCgstTfmLl8FBYB7dUPnkFMlTfOacaLDOoH1xX/7L+Xg37B6GvDy8m0bkj95YB2c
         UQ7MJNXZZIuLT/qzMG/Q7ArAjplqg3q8tkB2q98HRu8X60I/lcuWmHAjjCRXDHUBVYGf
         ZoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207008; x=1739811808;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hao5A2zCROL2hkmLhO/BsCc51XjmtqWoaTQ4PUVjVZA=;
        b=ChQypWKMxfpFfwWGQDW/OsLMx6+ato8vU6G+aPQ64/R1napZwrG3cxn6le6GdlpX/U
         ernQahDy25BpMSdVHt8tUpHdS0F0Tigx2el+etPnuXtpYDQzD09DyXPTX3kfaKz+z7OH
         1nb/8CdAvrqQ5IV5hOl1Rqf+hrQb/Mf+y/+RmsLGKqT88vLZhnOkgfoFgbXhkNHQpZRQ
         VWYzQKDKiGqXQAsHwrSET7m+VtUYonazhVSdYl3ZJ2JdM5Q+YBcguCq+X0qs7gGUC69x
         VQpaWX+Sn5APJWxZDOlrSVV+xQjk6LBtqTFGN47v0fiwysuesLuqdz6uGobUaanWKr7G
         tkKg==
X-Forwarded-Encrypted: i=1; AJvYcCWNDUMFIhHuOOrFx9QIb31bN4AHprOydMSq1UUnMbkkjFa6L2D/bUG+KPj8//SXij63F9/CoZhJ7TaDpU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39ymS1LnxyHcVDpDcr6smhJwvBV4IPQ6vnvEu8OSet/0xoCI6
	VT+uqxThT3d1+Z8Df7u7qBtvvDiJpVUIsxswN3o9NCaqCHob5bzfYdzAY3pd
X-Gm-Gg: ASbGnct+6QCuUXBlagDxfgIX8B+6QZmxMApJx4x0rZbQPb7IniQe4BIIeg151MjVKQx
	1VpLYA3WLHE3hSlxGu7zrMRJStZw5svZ7lyMUa+jlmWT36VHfxTg+xh+Mg8x4/QtMM/zf1xSQj8
	aUAfX9Y9KrXgeHBXsE7Ag41Ew984gFl7ghZ7CUAygzA+UXp7MBL91B5xHGRjlNNp8N3oh7ligB9
	g8OBjtdzV4oAFOAfk9q4o86HaOa1Dg1XJYaEZ2MN26rsupOKBSLCT+ShH1wBLlTxLHyEbUIV3fT
	cM9z5orRvck0xid9Hsrqygxnjw5hDJNSALVU4k81MEeqVTgtJD7PwRTilxR6tisCzYqy6+3rZ50
	VEv47myUs20y+8gdQLJcIJdyt
X-Google-Smtp-Source: AGHT+IHEZobr99K5wIQ+NC5yBX/JwyPkKjdc88abqKqPCE2WDGWU4RrjRUCpy5jnrlTJ0qsGTmt8cg==
X-Received: by 2002:a05:620a:1990:b0:7b6:cbc6:c87c with SMTP id af79cd13be357-7c047c3803bmr2220096285a.30.1739207007822;
        Mon, 10 Feb 2025 09:03:27 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041ded11esm546880285a.19.2025.02.10.09.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:03:27 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 12:03:24 -0500
Subject: [PATCH v3] scripts: generate_rust_analyzer.py: add missing macros
 deps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-rust-analyzer-macros-core-dep-v3-1-45eb4836f218@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFsxqmcC/5XNSw6CMBSF4a2Qjr2mDx7FkfswDkp7gSZCSYuNS
 Ni7hZFDHf5n8J2VBPQWA7lkK/EYbbBuTCFOGdG9GjsEa1ITTnlBOa3BP8MMalSP5Y0eBqW9C6C
 dRzA4AW2LSpbSGFa3JBmTx9a+Dv92T93bMDu/HHeR7euvcmTAoMAGG4FNSVV97QZlH2ftBrLLk
 f+l8aTJuhJCijw3rPzWtm37AHuRY3oYAQAA
X-Change-ID: 20250209-rust-analyzer-macros-core-dep-0f57868dd19f
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Boris-Chengbiao Zhou <bobo1239@web.de>, 
 Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chayim Refael Friedman <chayimfr@gmail.com>, 
 Tamir Duberstein <tamird@gmail.com>
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

Add the missing dependencies to improve the developer experience.

Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Suggested-by: Chayim Refael Friedman <chayimfr@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v3:
- Avoid shuffling compilter_builtins; it is not needed for RA support.
- Align more closely with the long-term solution:
  https://lore.kernel.org/all/20250209-rust-analyzer-host-v1-0-a2286a2a2fa3@gmail.com/.
- Link to v2: https://lore.kernel.org/r/20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com

Changes in v2:
- Change macros deps from [core] to [std, proc_macro], improving
  autocomplete and go-to-definition.
- Remove Wedson Almeida Filho <wedsonaf@google.com> from cc; email
  bounced.
- Link to v1: https://lore.kernel.org/r/20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com
---
 scripts/generate_rust_analyzer.py | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index aa8ea1a4dbe5..1394baa5ee9e 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -57,14 +57,26 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         crates_indexes[display_name] = len(crates)
         crates.append(crate)
 
-    # First, the ones in `rust/` since they are a bit special.
-    append_crate(
-        "core",
-        sysroot_src / "core" / "src" / "lib.rs",
-        [],
-        cfg=crates_cfgs.get("core", []),
-        is_workspace_member=False,
-    )
+    def append_sysroot_crate(
+        display_name,
+        deps,
+        cfg=[],
+    ):
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
+    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []))
+    append_sysroot_crate("alloc", ["core"])
+    append_sysroot_crate("std", ["alloc", "core"])
+    append_sysroot_crate("proc_macro", ["core", "std"])
 
     append_crate(
         "compiler_builtins",
@@ -75,7 +87,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        [],
+        ["std", "proc_macro"],
         is_proc_macro=True,
     )
 

---
base-commit: 6273a058383e05465083b535ed9469f2c8a48321
change-id: 20250209-rust-analyzer-macros-core-dep-0f57868dd19f

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

