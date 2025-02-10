Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9098724BD0F;
	Mon, 10 Feb 2025 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210164; cv=none; b=ipwYpH2VxPPsDIC3nhd+ztOm8fDyQMU4irhDM1bEFHQ1CWD0pwLy+EfxuOxU8NBCXgjZpMIguar9x91Jc9fGCUa9ixwrstcKhyBl5JKd+Xqjckr84GpwCEylv2+MsBzYyVpsxITXpDw+0BeMi1ltQHlewBNaIX4iO4XIi0xDmDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210164; c=relaxed/simple;
	bh=WfRTBdyeM4nQmtCZWzXI+u96gqxpn6LiEPBczZ91G/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JWCAyW5js8kr06nGzKKW0x5wSTZY7XNb1w1R5f3TYTnbwH+h47fooxR0Ez7rnt+SYDanyqPYuPHemAp5D2uYCu+lswrgKp7P0ebpMyu/oRaXkiaMnKRhmSfBNmbx4TIqheXITL7ghvPWSsLsVjaDPN74xGemzYuxeC3F8gcm1E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5dS2BHP; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5dS2BHP"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c04e5018dbso185843885a.0;
        Mon, 10 Feb 2025 09:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210161; x=1739814961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxgKM+hVOP6x6Lqz4af2aMlNHDAI6axnHkoGyF+WopM=;
        b=B5dS2BHPxwKpmbsVXw1ePYQdbUI5S2inxJbnfBqeGsfDGLFMH/KF36MNXxs3G80Sbv
         bBWVVrQEd03G9tzbvmc6WOz5qGXizGGCY9lGW3e9FtWWdykT//hC2Brc0OUVTTlXx6Qe
         d+lnVWLXM5kxeiOD8MhtO1JJQX+i25tPkWlAJ8e/65GpzbaR640L+LF7zpklx+WAPfoa
         J6m8xrZAvQjV7/2WzFWG1AiUkuvuGmiHOwFXybrHrljuHm3nz6B/XVoA6h58aNi8W6D7
         ham3UICbfXnm4CWrU9+AoMx3f9B/WdjTwkDIxmgebkvoef+M9QbHWwZi5a979zollIY3
         rG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210161; x=1739814961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxgKM+hVOP6x6Lqz4af2aMlNHDAI6axnHkoGyF+WopM=;
        b=pY6enYwKoeAR1ufOP+TyckxZsjMlUIMvEZRJRibZRGpL5p00UhS9qt6VzaIzsDX2g3
         u1utRqRpvuNeSlJQPoGkgDo+ZnU2S1//S7ac8jmF/kKthPMsSeeP1Dzr+RAsV6ZAlNzv
         oDvfNmSoVFz2T/kpYoGRYzQa6twbrjbrw63Zc7aULaR9aJat+TRHPWEYWI4CKVvJt9sD
         FQACextl1R3cLTCE6lTANNm29RpjRzcNh+ugannJvWdGsinxs35TIZMvC3EqreyrWuGb
         KATLpccyYHi/lPkoZduq/gyapa4bQYZGvgnuxHQ5WqR/9WllhHhitfY9SO5Mafdhw+0m
         KR1w==
X-Forwarded-Encrypted: i=1; AJvYcCWNT2OIFIH4iInrCslB6cNfssvADdyhTnY5C0rVGPa5Y9u9pM6CC92P7BrPXQPD8JupjrCsTjijnIzepUw=@vger.kernel.org, AJvYcCXLLPIn50ColZrzg13cYRaC8Gyzbmbk5TlukUGmmQPZjWyE9Yin9vV5SQywngb+hN6cjJWgkXU7FWpwOIn6qXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Y+osSPwMkGbMAp6KD9snHH8oCeHbUMd3WTfL7yaeesH+QEFA
	AdRXS/x7tEug1UbKhwyF5l60oH2zPIpgVwuluRIumjTyLj8Hro6O
X-Gm-Gg: ASbGncupisqhbvecJwo9Z3j/z7Bnu1iuOvTF5a+XQmdwL6iIrBfAtE42mdT7WgaPTSb
	qh04OWH4hKGwvIGYhxlD/yuSf8NJMATxu0HAF+8LmBMV0HQQKpkrZRyjbWEvNL9JQpphYV8V5hE
	5WM1odKoyoazVkStDqOYm45v7nx9VBHFj4N6WGQkNbGzetrWAAeptoTMF0XmnnR25IelkNdDelB
	7i54/YXz6nfwweQsJwCVnvVLIp4wHQcXKwBTjsrGFw0oEt5cpTVe0dmkhkVmqwGjsY8gDV7XEpn
	Ccp9lS8R1Ty1tH/zS6bdvcl9Isrc6l3fB58eZRConGs3kV8xST/y+bqU8hLZjpCuOA5ZEUF7c/c
	tWqUAwg9HkzagsyDh/vh2Nn6n
X-Google-Smtp-Source: AGHT+IG8J+N7uHkRhbfsCpNHhQICPanAFtIppZ/l1d+b/Z8KQjinFkh/mFY5x6xjgxw+OUhJCMvNzw==
X-Received: by 2002:a05:620a:1708:b0:7a8:554:c368 with SMTP id af79cd13be357-7c068f8a167mr43811285a.6.1739210161370;
        Mon, 10 Feb 2025 09:56:01 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e11d19sm548788885a.52.2025.02.10.09.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:56:00 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 10 Feb 2025 12:55:54 -0500
Subject: [PATCH 2/2] scripts: generate_rust_analyzer.py: add uapi crate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-rust-analyzer-bindings-include-v1-2-6cbf420e95b6@gmail.com>
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

Commit 4e1746656839 ("rust: uapi: Add UAPI crate") did not update
rust-analyzer to include the new crate.

Add the missing definition to improve the developer experience.

Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 1f573d19cd99..ee4f01ada277 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -105,6 +105,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         }
 
     append_crate_with_generated("bindings", ["core"])
+    append_crate_with_generated("uapi", ["core"])
     append_crate_with_generated("kernel", ["core", "macros", "build_error", "bindings"])
 
     def is_root_crate(build_file, target):

-- 
2.48.1

