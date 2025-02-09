Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44781DE3BF;
	Sun,  9 Feb 2025 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739121133; cv=none; b=gEOX6b8prGVvJ03J+KNRyJlLknno7E2tl+Q309yyfWVJ5Yxyx4djVQgAmoD7S55BQConsq4gufWmxRc9nNY7V0YwU9Hjp2Ac4ofKzv3XGHEaTXo+Ck9oOMnB2gbKd4+3NZSCLPgS5Xjfr0WKQg7oSpKTcLZ+fzxH0X3MTfhJ+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739121133; c=relaxed/simple;
	bh=Ij8FXDgm594aSwFO50e/dsVZlCH8OoQvJuCS3Revvpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j7Pv+4xkCn8jAwZZzPL5fteRmYmtDgObF9kQTmJBa/2uXEX/RF5PoPXybaF/4kHDP0FKrUJrUpx43DngE0yF8Y+tfPD7G570tu8Ed/KThQhwBJIpWYiumhYe1xtZMl/0fmzLb9nSATVdU35W4sfBqG7uniAd+ITlgCp4cpdJzvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xlg11w1D; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xlg11w1D"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e44fda56e3so17232826d6.1;
        Sun, 09 Feb 2025 09:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739121130; x=1739725930; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/W8FZshYynv+ufzfeOAG3y0QsuNizEjuYJOTZ4cmuE=;
        b=Xlg11w1DTvhQ2k6F8ONU/uK5SBI/LBnVtxoARiCulAGqJTJbXv3ITpTWb+lYoT/0kG
         1Wuk1DqfHHKWApvvSX/u1poZKqRZCyg7l9Nhei9id0SqGDUBbEnVRRKzyM2gr4bsr0Wd
         QqQlWx8UNufUN27ZyGFxCH2I6ZL/aZey8vVDjHEWCqxeZrnRuKQNC9mFXephH4fd91eM
         h9yxsdWyOyrZpAoA+OjE1Oh5pNkBKQEq3vBHyEz6w+QN+0SRbmLSulrDzd4v1Ea9I9XI
         RcTiwYdNlbQNsPO+zcKGOBcYeJpRZbXydLFEpekPGhnZ/8LKoS1CdkrACVDOhpKUCLP9
         yDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739121130; x=1739725930;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/W8FZshYynv+ufzfeOAG3y0QsuNizEjuYJOTZ4cmuE=;
        b=nI7/VfybwyfvhmzfNM81SNGFCI8phxnufUcPYi9u8FuloFYi+KCJoCOKu4/fID3clH
         O4tJt8TKpXrBVqsaJXcCCdLSc4/O97F8uiKPU01173m4D2+nV77z9TvBn+4Sc8pY6v2R
         1buc+W43x4tkLjx/vgc3P4hULFFR18aHYIpfXDY4PPqLpIVeZP1lZlWavA1m3YWrBi2P
         NobdC9RBd0cnPLkWbavFM80TW3Sh+4NN6v8hr3v0tWRn9ZbNGJ8m93BXyCAaSctSUyLK
         QABrd3bdzhmAeH6MaMjErBBvUmwh9Hw396ucQZjgJZFySRXoiVNeZOZ548YtN4VQVtS3
         9O1g==
X-Forwarded-Encrypted: i=1; AJvYcCUDNcccLFXX93SjgX+IkNFMEena9IRzf3j9kIQiEQ3LXEqc7vIZTL+CKvTP+jOqGtrRIph5Vg7kmIGJOxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDWEXgIiwB1mKoSs03nBu1S0Dot1pr3vLBk6EmBk73iXf8kRb
	t4/f8eP+o3BvOqyEVIRhnpOCcsqsOoqwPZbSj059bD3Wwv6J4teD
X-Gm-Gg: ASbGncu87asiLZ5he5XPugY+u9giSlK+yLBzL4qL7nhIWXarTa8Z5YxCqbK1+nLNTSu
	MbUKYQAjRE9IJYynJ/rC4sXSNr2+s2V3tL1AEYnzqbhJYT1lUkUYuQhDxHDqYMwkY56sW51ZXpT
	7s+VwY3MoBi34myDwV67z5oeujZZYrvvfU/4Pl/5KO3CJpinZFoJvW4AIOWy14KQleiqjX5vw2a
	cI1jerSnP87ne7sLdIm7vWO2/XYsMJlLajnTVP5gXM+v/QiTKweVEPml9jPFnMGgrM7n6sKsLXq
	/M5R2gweswdxlea7UVAjRGUYx/RBwn+nFHGuUIY5LF27
X-Google-Smtp-Source: AGHT+IHk/S4mx0xRQtJOuHNk0ObINp/M4lWI5QJJjJy5+6/iGb2dzvC1XNsSwLN3+fRqC967IP86YA==
X-Received: by 2002:a05:6214:5099:b0:6e4:5a38:dd0f with SMTP id 6a1803df08f44-6e45a38de1cmr53705816d6.4.1739121130492;
        Sun, 09 Feb 2025 09:12:10 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:15f6:96e9:3308:934a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e461238a50sm1187966d6.48.2025.02.09.09.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 09:12:10 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 09 Feb 2025 12:11:53 -0500
Subject: [PATCH v2] scripts: generate_rust_analyzer.py: add missing macros
 deps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com>
X-B4-Tracking: v=1; b=H4sIANjhqGcC/43NQQ6CMBCF4auYWTumrQHBlfcwLEo7wCRAyRSJS
 Li7lRO4/N7ifxtEEqYI99MGQgtHDmOCOZ/AdXZsCdkng1EmU0aVKK84ox1tv35IcLBOQkQXhND
 ThKrJbkVeeK/LBlJjEmr4ffSfVXLHcQ6yHneL/q3/lheNGjOqqb5SnStbPtrBcn9xYYBq3/cvR
 ZmL4coAAAA=
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
Suggested-by: Chayim Refael Friedman <chayimfr@gmail.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Change macros deps from [core] to [std, proc_macro], improving
  autocomplete and go-to-definition.
- Remove Wedson Almeida Filho <wedsonaf@google.com> from cc; email
  bounced.
- Link to v1: https://lore.kernel.org/r/20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com
---
 scripts/generate_rust_analyzer.py | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index aa8ea1a4dbe5..316174c22346 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -57,25 +57,33 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
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
-
     append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
         [],
     )
 
+    # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
+    # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
+    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
+    for crate, deps in [
+        ("core", []),
+        ("alloc", ["compiler_builtins", "core"]),
+        ("std", ["alloc", "compiler_builtins", "core"]),
+        ("proc_macro", ["core", "std"]),
+    ]:
+        append_crate(
+            crate,
+            sysroot_src / crate / "src" / "lib.rs",
+            deps=deps,
+            cfg=crates_cfgs.get(crate, []),
+            is_workspace_member=False,
+        )
+
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

