Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9824FBFA;
	Mon, 10 Feb 2025 18:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210663; cv=none; b=M34Gt2z/YS5hzGS+f97RsuTXaovhsfmyKn6AYih8WAWIGY5RF9lFiarww7f5Fj9DPCsxkCm5MOwn8hVMJqiahmC+SeDovn0/x2+p+GKMP+dPre5EOh2zqaRqjESwy3WUh1Y/CMfTCc2enf+uChqvsEXT7JA/YyFAZk4ZTxkX9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210663; c=relaxed/simple;
	bh=Mtqbgw2OIehnD8M4asR136gXQxf831IPvScVu2CeFV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKNli9k2v0LxqSHixRNlHpA0vIgF2WYGPCycx+Jf2PL11T8F8FD3gexT/WMMGuQNkZg3GgdYkoI92XxQTwBqILExrbgKttS8DdptUoWPp+2mhkWqAO8C3QvFBPmI/lKRnSB+sM5fKEvjTK7lo6Bri0dYxwoU3TNXzDXXDvrBbLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4XS29Gx; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4XS29Gx"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e4487fce51so15863966d6.0;
        Mon, 10 Feb 2025 10:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210659; x=1739815459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugP0WQMcU/54tTmvfDWk5D3dxw+mt5ZDUJmbgAZzY60=;
        b=j4XS29GxHnEJMEgrLJKVkXts8608nVKTGVHO33AZOS1vUxcSqdA9XkArvb16Yn9BGd
         OFSB5i6dOaC/AeiqhmfkwM4Y8tYNDjvpbH27FR/3BZBShc3m5ZW0hokBeHjk1TCyUZzp
         85OiBJevc325TC4eL1psmgTuM54lsOvVmkK3aqxt3F2JgfDf48O8ALcuhX794cZjWlkS
         JelhD822NdHpFFh6LFznTVcoTmoguT+UdCg53wED0z+9F2QJq+ytR0yOqbcZBbuWiOJO
         ASq4SUuti3TR93J+CEQfdLpwNgyzns0ZQEdj5wiOs1HyWCUsbSAkRk/7kYlur9jm3agf
         xK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210659; x=1739815459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugP0WQMcU/54tTmvfDWk5D3dxw+mt5ZDUJmbgAZzY60=;
        b=uDtkapW3/+NBuQ1whddxpughInjVs1IQZiXT3ljZ1mqfj/7ss5dGWgopRfQthKt6dY
         jrijaNx0YmjZuZ3SJGuwwYu8YdhRWVC1vzhUqncs+sNpnhixq8OIMco5vcvV9HYvb9RU
         AEDUMHflcDXcrgftEJlBry9g4yKb/HJ1yUxqveCA5BpipvdeU2zSnnGlV8V5TQW0fTRv
         TV6Sk2gZZkfbhlJ1dmTvhc8waHKkWEvzTb9yBNnev0+U6/0bUz0sOnNVAPJCmNbFl2YW
         f/doxnAInpjus11Fy15HuoDSken99YPiHIhWGmOueU7Uu7+eCBtdQxo7R/0S2WjzX/bd
         iqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb9IQWshDucqXAnWWRthDQJeNpJnt8+yYDcHZ6BZEXqj5lsvtUxZWpMHLAUX7dT2jQuEHUnj/y7R3xpsk=@vger.kernel.org, AJvYcCXnR1ERml37eYW+/WOtggEwulx2DGUnQAUMsRImnmFh2xun6Bk6cafsmeSYd4KfxnonfB5Xpf5qHogoiubp9Go=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4iDOqUD2wN6Lc7hssa9O8EdsYleMo2ykQVA23EPn5avnTPPP2
	Xu6j3HCSiIjJq8Mclbnv8WUcZbOpmXe97sGQ+X8+0aX5Z7leLEDL3WUynK3x
X-Gm-Gg: ASbGncti1thWR9BcaLsV+g5D/u97I4HKFG8ptu75v2ifWiuaakPGqthMxg3gWJLWJqd
	bOXzzEI0rjGpzBl2wsGp+550g0bEcRxojKASdxr3uuEKEcePqfUtScam5+cvk9zuN6UDNvWBMTf
	r4rn4JqkOR7VhrtT/5OAmUx8a3VZpwgFVAKoU8I4Nw/ma+/i6JbXEF+FmZpAsIR3H+wj+SNRhQF
	/6QFKxMX2+tK2bvIklY2QE1dJA9Dlb9DQBsKRCEXMR3jMb2A5vo2r9AA3Dfmx9CuJfyscqTHxSm
	kzJKHic5VjNODkeDiVycY43kwJ4CsT5BAMTC6doOIlsW7qLMWAIr8jBrtDYJcQKbCH4jiMpGZh0
	ayA6ovJE9GfU2JG4wu5oXwum+
X-Google-Smtp-Source: AGHT+IFHru5ZjGY3xaejVO5/d9XHZV10fNayQKXLX8nP7KU+Q5MyAeJynIXujNJhUay2CLVpbU6/2A==
X-Received: by 2002:a05:6214:1d0d:b0:6d4:b1e:5418 with SMTP id 6a1803df08f44-6e4456c16e8mr222671146d6.33.1739210659327;
        Mon, 10 Feb 2025 10:04:19 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e449c271b2sm37713226d6.36.2025.02.10.10.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:04:18 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 13:04:16 -0500
Subject: [PATCH v2 1/2] scripts: generate_rust_analyzer.py: add missing
 include_dirs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-rust-analyzer-bindings-include-v2-1-23dff845edc3@gmail.com>
References: <20250210-rust-analyzer-bindings-include-v2-0-23dff845edc3@gmail.com>
In-Reply-To: <20250210-rust-analyzer-bindings-include-v2-0-23dff845edc3@gmail.com>
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

