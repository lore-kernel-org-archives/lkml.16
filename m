Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76AB1C5F1A;
	Sat,  1 Feb 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738431643; cv=none; b=f7OQ5LAcHJbNu79ywee6nyIN3usnCQmU5ZBJmFWYkUDZZvxAEpkBnW7GYDYxg+gFTI92tysK2giCg+eSo/q6hFm4xK+hgPt7Hl9sCTevup1OOqqj6GmT9/qRyqwopRNaSwlKsOqtc2ahJIBETgi2aJ99cSKhIqBQlKGiE9zbyYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738431643; c=relaxed/simple;
	bh=0e7YtVb4Rl91RO2HeDvog7TGlQEnuWZgpX3dh9FNCU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gw1/34qSeOW4js1yrWliuyypN9Vdr2KqynHkNwbeS02hBjNj5sOdBHbsx1KLs+lt05EkPOLY9EcXS9syjfETGHkGkuSTx1NDDjSefo9pVin4xiL9OW1mcR8qyvr9lXbLjezvnnvVbCAB6kVb5/HA24+c7esViCcb7jxIz+9vgmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYvT6f80; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYvT6f80"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4678afeb133so34845941cf.0;
        Sat, 01 Feb 2025 09:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738431641; x=1739036441; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkaP4RKgAdA4bYOyaxeoV4k6i+xBMieE4c9zsLqurQQ=;
        b=gYvT6f80xs57CF9IEpBlyWFv9CYHGG/7xLnc/VcSkbqbMdsJrLHMic8r2lOyvfiAqF
         OuN9vL7thIJ0A+oXMmJ8qIICQE/dG8ukDSN/VzGyfSuiDgXD5vepTWKWK70RGZNKjBiD
         sQEfXtdOuyNCRI9YG/X9nNYDSWPKqJWS7nCOO7WsXG2Q/Sx1X9sTRM/wSzbjJk5WuZZZ
         ONiZjn9m3/henrYX5GRl61oD7BTd1uPIxpknfg3A6nqJS25g5uw36JzBHZbJyZZIJavZ
         oEdZU0pMrfmLmWbXZDVyppF+1wOCfgLmcnYZAh/HROhEneKRRGgmxcjKkyel/SojVyBb
         gsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738431641; x=1739036441;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkaP4RKgAdA4bYOyaxeoV4k6i+xBMieE4c9zsLqurQQ=;
        b=iI/7GPtw2WTxt+AkLlWv3z8kxE5x14Th5gjRgiDW8orL7FsIx8Ro1wgToGpkdXVbuV
         dsgebY99D1dQO/OJuIqqie16j0Qczs+T0nB2Sx7PcKiO/kk1gefRxx0uXgNSLdLtBrhL
         Tqd3Kmffn5bHP6dnwGkmNSDGK/hjEeXZNqColMlmu3weZZ8Zny2Uud7vhIwfx0A2p/KD
         +yTBfjlxzi6Cbl2+PRy4fxQ2zAG3SXi4/Pb/AGYgzPQVgt+C6snbdGYhmuLnGh7zId/X
         MXAB1rifUyAOH3Kz/bAwbbHhU6G8fybl7rcqQ5mH3BiArIvIQ9xwzMrVbvH8cWmzHW0h
         UKNg==
X-Forwarded-Encrypted: i=1; AJvYcCUIfG5SclLYGTivlz0w4nCYEm0pu+80LRgc2nUABBWuEyH/7nvz5/n9EChT6kJBWTZHpIKUhK51uJYec20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGUSLq4JiLq11exjf3TBGhc81CpTdj/FuWRvBlbE31aik4HNa
	dYQbPhBKrlAV/krIc+7IXm6L+L5z1kr1W7RojH+BFpz3EqqaEDYD
X-Gm-Gg: ASbGncse9uA3LlIJh4VT7IBlSkKaRqe0RwIhNJXSKDchJTN3jwOiDAvrrMC4KLowEE1
	gft4GKmMCIbwNtbCHdo47OaKosm1SJ87pi0qZHrYO49elvZ/9HPNWN5c4XlIDjp/xjJrNiPEnZp
	3XfjfQiHT41MD6LPX8teEN05LxEaQ+oRlZDIXisgEwdq/VJgSSCKy85csPrWWvcdIRa/6E6k4nc
	aD3On0hxA7SdRdACwVzKVaSFK4UBu9XogsOQ99CV4tGAViPMsSBlLYFt11PrlIopBs8vQ48RyJ4
	WN7B9IQ/vD436kQjTCEdji+7AY4xxylUow//U0gZxKjAwU7p0Q==
X-Google-Smtp-Source: AGHT+IEd3EeW9ymw11V/AA0lkUzLxFUnJLyT+pSYCSPyX65E6YD3Mu/Bd+cPuZ7EHn6+H9AdQUsvrA==
X-Received: by 2002:ad4:5fca:0:b0:6d8:9f61:de6c with SMTP id 6a1803df08f44-6e251b75b8cmr190313246d6.18.1738431640689;
        Sat, 01 Feb 2025 09:40:40 -0800 (PST)
Received: from Tamirs-MacBook-Pro.local ([2600:4041:5be7:7c00:f07f:fb14:288d:6f1e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254833d3esm30313866d6.55.2025.02.01.09.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:40:40 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 01 Feb 2025 12:40:38 -0500
Subject: [PATCH] rust: use host dylib naming in rusttestlib-kernel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-fix-mac-build-again-v1-1-ca665f5d7de7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJVcnmcC/x2M0QpAQBAAf0X7bOvcceRX5GGdxRZHd5GSf3d5n
 JqZByIH4Qht9kDgS6LsPkGRZ+AW8jOjjIlBK10prQqc5MaNHA6nrCPSTOLRDbYxhmypawupPAI
 n7b92/ft+e55THmUAAAA=
X-Change-ID: 20250201-fix-mac-build-again-cb6833a64276
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

There seems to have been merge skew between commit b2c261fa8629 ("rust:
kbuild: expand rusttest target for macros") and commit 0730422bced5
("rust: use host dylib naming convention to support macOS") ; the latter
replaced `libmacros.so` with `$(libmacros_name)` and the former added an
instance of `libmacros.so`. The former was not yet applied when the
latter was sent, resulting in a stray `libmacros.so`. Replace the stray
with `$(libmacros_name)` to allow `rusttest` to build on macOS.

Fixes: 0730422bced5 ("rust: use host dylib naming convention to support macOS")
---
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 71a05a3c895a..9df46daaaf67 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -144,7 +144,7 @@ rusttestlib-kernel: private rustc_target_flags = --extern ffi \
     --extern bindings --extern uapi
 rusttestlib-kernel: $(src)/kernel/lib.rs \
     rusttestlib-bindings rusttestlib-uapi rusttestlib-build_error \
-    $(obj)/libmacros.so $(obj)/bindings.o FORCE
+    $(obj)/$(libmacros_name) $(obj)/bindings.o FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-bindings: private rustc_target_flags = --extern ffi

---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20250201-fix-mac-build-again-cb6833a64276

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

