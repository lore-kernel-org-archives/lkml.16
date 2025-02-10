Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866425B687;
	Mon, 10 Feb 2025 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210162; cv=none; b=Lt3y27PohCTVX05V0QECar9tDgsXFADnRZERdHh0J6DihBjR+uMxpDkKZ/IDMMhGl3vBdwj/I+xhzw0zyEjyNIpsKhj7f9AWta9N9S0ZCgDjGt3ZfHxdHE+Y3n+I0SxcV+FCJuUkEZSbPDJSaXZ57hpdxzqhj60kbZ0+a6LT/1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210162; c=relaxed/simple;
	bh=Mtqbgw2OIehnD8M4asR136gXQxf831IPvScVu2CeFV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gtt3jeEzRsnYVWICtaJ+WIPFugGfJ1B1jmAJyWek4KA10q7NoU/2jnxyuZlvbxsLIooLAj8CxwXLA46dh/eg8aDXCfBdiLKzwcHcxUadB1F1e9Yo3p6j9P1noJu5jjnXCxpRObzKSiDx4fbfqpdhrcSbJliLQfG+WVfLePnHB/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RooEBhAT; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RooEBhAT"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c05f3dde21so148753785a.2;
        Mon, 10 Feb 2025 09:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210160; x=1739814960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugP0WQMcU/54tTmvfDWk5D3dxw+mt5ZDUJmbgAZzY60=;
        b=RooEBhATsY/wAIrb+Vkz4QgTkQq8M0OZuvG8rYX5T5TM+JcoAFLzs9qFdujP/iiaiZ
         YUhtWpVQ+KiktOQH99BWntG0NmlZ35QCSJhjIut96O5qfKpEMlCgfYTwhf5YzvnAxvJM
         XMEdBVov6auhA94at8I6ebyrr88I8a++bLLe5UzoVt3XPomt1EHc4z4JO5ACXDfApLni
         z9WpOGRRpRC9jss03XSK8fJCx4+1WqtqPuxYTLg8B2bBevrPEiZ7orWcvg6xlrL9ZHiE
         f3GX7Qk71VZIqzh2liqFY4ZQWoVlbhFcA0MPIGfa62L8wpFBSZhzqLCX52oRkM2DDKnF
         tFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210160; x=1739814960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugP0WQMcU/54tTmvfDWk5D3dxw+mt5ZDUJmbgAZzY60=;
        b=WwUWAejor1zAADmCKJ+eQu/bdAoy8e85sqpw/+jnkHADPx8dY7WlcykUeTYJVodUcW
         f2c0GJ1JNU8A5NAqyzv1cGwXDM0hqiB0h2rG4hHtxLE8o3L1I3WFFNtimCNE3W6EmtJa
         xLeWJG12WWGERT82mmJiTRhc+97nPyadhxY1g6u2mblNWoS6RL3GcmwPcLnnGluu2OSZ
         lJ5J7mfnTDlZ1iUZGqQXGEbOcBpEub9agJS7+mAR/KU6yMfoD4wsXx4+MOdNN3idFGwC
         prujbb/r560UxrO6c5l5/xfOECjgNVi4Iq7r/rE91XZjmf7r4qdOgIoJHT5ivzwlFqAh
         DyOg==
X-Forwarded-Encrypted: i=1; AJvYcCV7RKj6QZTrRPlxpFkRZP7zEHewtNtaXp6NqUl5sJX3Z0SS7J4OOvTW0lkOZiPyuOSnAMj0iWQWo35MNBlvujo=@vger.kernel.org, AJvYcCXd7Xbz5wVm1EYp4tUnG0KtX1xnwjXGk/AucY5m50+hbKv7eIB668xzscOljY7d+nnlNJ6KDvq5B9H+TMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhaRTY0aVRe+dNfViptyyGLdPlg4dMgQE33q+1s2ay62H1BZaj
	4GayjCbw1qCRM4HFA1FpINbN27S34ybkLGW5i3DSe4L3CLvMCa41
X-Gm-Gg: ASbGnctdojbBAcf0lnDm95XP6X/YSp7203ZJJRymb9zOTCNrNZIEdY9vEme2qwiVABQ
	qeVtk+OclSNSn3pZ4P+wZ19gi5J1wtcjJSqFAOK80VcEbdMcMfb7ddhv8BAsBB+U0ggVXuC683N
	VHm7QJOaDtdJzSIoncN9bzO0N1/5D9yqIrs9EpyFuMR4LFcsGqSjHEAymQWHjHaSkCv2cpo0mw/
	IdfGSogDFUiCBbG97Do9zYElvUzlCrJa+pEeXlWDe9cOZs9guIe23jkNcoEb/kSUO5faf8dNh80
	OZlyt/Z8/2KPJa8fhJ/Nn5Z8PK5AtENnfedgZzzNtKysSPh5D8h/LsnnRL/JBQmEXpjDUpkqF7p
	+iep+l+ts26GgpPBmsH2GV4kw
X-Google-Smtp-Source: AGHT+IHTXFpC+Lr4Yup/29/vLpZn+wbBAjuiBhuYmhDfMhVpelG0yR9jfA/S9h/k6XO1CAKtGU5QjQ==
X-Received: by 2002:a05:620a:8f8a:b0:7c0:62ff:d12d with SMTP id af79cd13be357-7c062ffd23dmr356306085a.32.1739210159986;
        Mon, 10 Feb 2025 09:55:59 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e11d19sm548788885a.52.2025.02.10.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:55:59 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 12:55:53 -0500
Subject: [PATCH 1/2] scripts: generate_rust_analyzer.py: add missing
 include_dirs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-rust-analyzer-bindings-include-v1-1-6cbf420e95b6@gmail.com>
References: <20250210-rust-analyzer-bindings-include-v1-0-6cbf420e95b6@gmail.com>
In-Reply-To: <20250210-rust-analyzer-bindings-include-v1-0-6cbf420e95b6@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Asahi Lina <lina@asahilina.net>
Cc: Boris-Chengbiao Zhou <bobo1239@web.de>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Commit 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
specified OBJTREE for the bindings crate, and `source.include_dirs` for
the kernel crate, likely in an attempt to support out-of-source builds
for those crates where the generated files reside in `objtree` rather
than `srctree`. This was insufficient because both bits of configuration
are required for each crate; the result is that rust-analyzer is unable
to resolve generated files for either crate in an out-of-source build.

Add the missing bits to improve the developer experience.

Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index aa8ea1a4dbe5..1f573d19cd99 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -85,27 +85,27 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         ["core", "compiler_builtins"],
     )
 
-    append_crate(
-        "bindings",
-        srctree / "rust"/ "bindings" / "lib.rs",
-        ["core"],
-        cfg=cfg,
-    )
-    crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
+    def append_crate_with_generated(
+        display_name,
+        deps,
+    ):
+        append_crate(
+            display_name,
+            srctree / "rust"/ display_name / "lib.rs",
+            deps,
+            cfg=cfg,
+        )
+        crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
+        crates[-1]["source"] = {
+            "include_dirs": [
+                str(srctree / "rust" / display_name),
+                str(objtree / "rust")
+            ],
+            "exclude_dirs": [],
+        }
 
-    append_crate(
-        "kernel",
-        srctree / "rust" / "kernel" / "lib.rs",
-        ["core", "macros", "build_error", "bindings"],
-        cfg=cfg,
-    )
-    crates[-1]["source"] = {
-        "include_dirs": [
-            str(srctree / "rust" / "kernel"),
-            str(objtree / "rust")
-        ],
-        "exclude_dirs": [],
-    }
+    append_crate_with_generated("bindings", ["core"])
+    append_crate_with_generated("kernel", ["core", "macros", "build_error", "bindings"])
 
     def is_root_crate(build_file, target):
         try:

-- 
2.48.1

