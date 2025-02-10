Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163C024FC16;
	Mon, 10 Feb 2025 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210665; cv=none; b=IEbHnB899FwLV8WVIpJMDv2sFxVh4JsGdYDVrLLD6p26c/B0TbsoSgfqjNd9uFUvWleLevAe2g8QyKjjNSC20iS6sHyv2lClomTl9jlOqHQR2MunU4crbPgVL/npvtBjClodBrkU4umMdyam0Gc0R1TvXTvqWEQSpew5DYDdsw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210665; c=relaxed/simple;
	bh=idybxxC8bH+igZDqggPEBzxrwApkIzWLXgCe5lXe+4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zyit6udEWkwq3uYcMlwizc5YhOC1nzHEmBKXBxop2DgTQ4Cle1dSohFur7M9BYTyWHPc31h4VhkKEleuFCHyj77EIxuRJA2x5sK1si5G8Y3XtR0wWA/vgAn59iy50P+/1zttAE0ovHbQvdNbFd5P5MWu5C9OFAtwj3spC6hulS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGioCZiX; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGioCZiX"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7be8f281714so466801785a.1;
        Mon, 10 Feb 2025 10:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210660; x=1739815460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzN8okf2Y9n4zB2hYQOpbg2qasFR6jbM7vqVkXiBMY8=;
        b=eGioCZiXCWoRFjOhTZ4scFs3ZUDgm97oQKZv38+RdD6PBVM7GypdDIjHgw5IiLn3y1
         a+SQJZlkujuuhdNdlI7bKSEhZqs76CaAjVp3BghDUdZdQ0HVoVlTfDkJq1Pk+0OEAU+2
         4uAB0g2c6kQUl04d/pugayh4LMb+L0RCUZRLiM/u928UiEuDHBsodkpBqWEgdVkTMA9f
         lLCZN9Z4+2J8FQvI4l44pBioBu0cBytOEfnYyoIDv/7ZM2drJ4kLegeHD+vU+2zJ/G06
         GL6xAWZqragLIDqeRQLuK20abxyEE4rXY/He3jCSVWE6wdHKDwA72nT+SgT0LC10TiqU
         EPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210660; x=1739815460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nzN8okf2Y9n4zB2hYQOpbg2qasFR6jbM7vqVkXiBMY8=;
        b=M5fGP0AtqzjPOpmyEQEXH5Z73tdjax/vInWtru6eCccgSHsKRE8soFE7ACn0rAjESK
         ZmTeOl5PS06paplWwWb0k0G7wi2wZGGJkOktQ9OZ5EidBXgsHNlr9nu5qi5Pjhb3RqgB
         uJIrRDMk4pZDJIjUzFZH8yL8qT40Ag7eL2lv7Xf44og6CY5D1eij25O2zW/hJUgY7uWV
         VMYJFX7iuk2SPqtHSFiUv/tf+zor+8zTWNK+XFf5jhBByxiEk0B8qxN7rTjY5FP/d+Fe
         Fm8qOxASiCRwKr8t7XlL0+klKgzLoA4ukdgaQoMmzcoWoHw8A8oFSvhBud6+ETe5TUMq
         Accg==
X-Forwarded-Encrypted: i=1; AJvYcCV+WirvaX30L//kfSJ2r271NjbXxuMcmAlDM3aqXzy8RALD2prRAowXwXdN6Yov6b5DfTBkqMw/FAycbGw=@vger.kernel.org, AJvYcCWQksmEGjIbSAOEgQP0twweY+RH/t9Az4Wd8/Yh5I9kkO2HxpMJZm3iBgnCqxL4FHyeRG0Jd8eio/6Y8GnR1gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygf0TusmDWrCGCO8OLNdIedSqR6GF/Fff6O4MzaOCkLLRZ3V2h
	7zHvuNhFWsJRVqNcV6r6EeCBTVy94F3yLw8lf1U+GG3eUjUv1WoDgj+E9D1F
X-Gm-Gg: ASbGnct+FSAUmi6zvn+Pt+iDBxubwPEbftRjim1B/AHcjwUj0BHOoQCiD30CnjLgbpm
	pQt8r4aAhf4wXNwPKI26a5/uSAOUZfryb1Jd+kYZ5bGFzu6DJa9lxlDMK5fptsWXkK1Zu/MwrPx
	LLgDbzDvrQjamZ4LP3efTDfk2IIrgkG4Lo0AoPToRj2ySEsUEsajntmbYLSMbZeDUTXFj6APHC2
	JlSBvWQLCvI2orycI+9e7o+yv17mjnLVnq1Me7nY18gMSr7Y8S+lPMHVr9vgdS253Ras72Z/bY1
	EVdyFavk9X3MG5sxscZ0AhmJWh8+I3szHGQJgLOx76gHYU+U0x4qbrovp1OTgO4z67pMZAFhET8
	fhGGRt4dJcvBCgmu5C2EZMbYm
X-Google-Smtp-Source: AGHT+IEpIafvVpkAzICzq0E1zWd/nozI2vzpL65RyXcIK6IiqVUVe6Kihd12kTUgrxdGuJiLCLtg+Q==
X-Received: by 2002:a05:6214:5098:b0:6d8:aa52:74a3 with SMTP id 6a1803df08f44-6e4456cde36mr233996156d6.28.1739210660455;
        Mon, 10 Feb 2025 10:04:20 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e449c271b2sm37713226d6.36.2025.02.10.10.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:04:20 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 13:04:17 -0500
Subject: [PATCH v2 2/2] scripts: generate_rust_analyzer.py: add uapi crate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-rust-analyzer-bindings-include-v2-2-23dff845edc3@gmail.com>
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

Commit 4e1746656839 ("rust: uapi: Add UAPI crate") did not update
rust-analyzer to include the new crate.

Add the missing definition to improve the developer experience.

Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 1f573d19cd99..d3fe091a55dd 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -105,7 +105,8 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         }
 
     append_crate_with_generated("bindings", ["core"])
-    append_crate_with_generated("kernel", ["core", "macros", "build_error", "bindings"])
+    append_crate_with_generated("uapi", ["core"])
+    append_crate_with_generated("kernel", ["core", "macros", "build_error", "bindings", "uapi"])
 
     def is_root_crate(build_file, target):
         try:

-- 
2.48.1

