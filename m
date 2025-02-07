Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976B1957E2;
	Fri,  7 Feb 2025 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948928; cv=none; b=M1tDi4aBaliI5Lqk26U01ZKYQgNxyJGFi6m9CX3KmHbf0JeNY+iBi5Fhvs4EtZlNyKkgGmPP8/P4jhg4i/1jaNWPwQMmD8+U3fKB6LkfBI6GfPxxsDy0xSV1Pu9As8DcToh9jNgRvHuw1/ECqGT6Pr5UUypQm9F/M0URSrwXiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948928; c=relaxed/simple;
	bh=opQ7Eq7FAwHER3lm4+xX6SzAqXF6+Gu6svg/mcGBMA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3PbM7m/FRpx/I3/BQ5nmhkyDCnXV6v9XsIzMabNYwHwq5KOxgBX7ViehkrPaFn0V8o9+A4ciNOuzW0NhYGG2fxJroeUdXUJmDnb7eQlc2lL6OQXgkolS8eLppOKBG80x45k/gmKvNq+1lrQZwFwEfXoSxuaaORS6QhW5p8iK2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFGt4uya; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFGt4uya"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d92e457230so23671866d6.1;
        Fri, 07 Feb 2025 09:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738948925; x=1739553725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rUq0LHAvnx3g+Lh9sTbb33DXAq6zinXS9YKC71Tvck=;
        b=BFGt4uyaUKkF2iYNAu8fNw9Pfiaqhzp+ItRSKElvBOU2ZRfnw9sTAuNDXAnMz7C/PB
         RYslWKMCNTfFx5UEMhU2QydDgDbiOYSIeQIjG7b8/PBbFiLGU75BDKKckTduHuhpC7wd
         YTYzsO2kizYdShDSBdxFSVMROwMJ4yYnaEjoyCX+lMF6jnjGBtLmo64GSk7VC88Hkdh+
         QtlHm4N/2Bm8HFMJruJIKQFfyBYlrfHRbm2wsMQCot1cswbdjFyQrz/eAYxyA6HcE3/c
         oXb/R/0p6UrS5Kr9h+5AUqIfnbHniYvJQFSKR9/5bVc0HilXqBmzz9kBklShc/0cl78E
         9mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948925; x=1739553725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rUq0LHAvnx3g+Lh9sTbb33DXAq6zinXS9YKC71Tvck=;
        b=oOmDaKel4MXs0mESmZTRwxLq76ZX5gwNoPeq8MoSxrtH3skDdVtMKWmjtcriwk7K1w
         0y0Fcsm/ppLf5yNCBB9ms0Pd6UPDv949ktWlFu0vRvtVK8kHb9aV9+VrTpxZgXDrZtJy
         jPPgxr0RJEcKa0EZAI6WQ+6jg7iOuONXOnS9I+6u6xUpxTLcpTDbAww0pKxVSXXulvSC
         wjedWQYdKBPAJAfey6V/HQCJyCVtM5BPQBLpnEkSHwmXy8kijdN33aIoWHaKYb++znMe
         +lyZP8eeR3kazHRTf63G4awoZPvAXsPkJzYr88Vq0mTKCvbG1i+5UjZqZCt0iKimAD5n
         NGvA==
X-Forwarded-Encrypted: i=1; AJvYcCWtX9l+fOU3ogFKMGEzdw7SfEVVO/3rIf4zAeGP3vJJjggYYK1eM94N31ViJF5+lSIOrZ3pFF5OC7FwtkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9917tJOcx3hobxddJxi11tTH7xCRzEgDTtrwK373bPG4K16l
	4e3T6UrzcqP/n+NpjzQs4EuggntkuqCd0vt6cnUMkpHp1s1XIjvk
X-Gm-Gg: ASbGnctquGvKlxa0A3XTbipPLXqWM0z/EVGoYZd6m5/g+/Rw/8Y8k0Q7OCY5Tsltifi
	y0vn4034gXUUkasRrrLtIOFlzWjvC62Nz/QBb6pYTqOpLwLjCroCpRXTtR99XLpJwd87pTosKLd
	KLeIMAgXiVyCaQyp9/dCUD0FZ5DMHmdcShHIDg7fx/nnPWpeVB3hE0v6IuMAxZLs2ZQZdK2PkWg
	bWzS1gwaxm4bmgTdpTrenmGAXt0BbhXp+Uum8XE3urHunMiLnglLmUpiEusgcYby2eIGII+yJyv
	FLoKvIv4OiRerIK03pK4pnx9YMDNEUafor1ADH4nHSOYuYU=
X-Google-Smtp-Source: AGHT+IEyJQrM9O6VjZISh9avzFiX83A1uwVFtrU1e1jyuTW+GGeyIjUVy08MvSEdi4brZqbibvhSMQ==
X-Received: by 2002:ad4:5f4a:0:b0:6d8:d84d:d938 with SMTP id 6a1803df08f44-6e4456c5c4emr49297976d6.28.1738948925628;
        Fri, 07 Feb 2025 09:22:05 -0800 (PST)
Received: from Tamirs-MacBook-Pro.local ([2600:4041:5be7:7c00:fb:aded:686f:8a03])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44eb52460sm3159646d6.8.2025.02.07.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:22:05 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 07 Feb 2025 12:21:53 -0500
Subject: [PATCH 2/2] rust: macros: fix `make rusttest` build on macOS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-macros-section-v1-2-8f018cb05a20@gmail.com>
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
In-Reply-To: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Do not emit `#[link_section = ".modinfo"]` on macOS (i.e. when building
userspace tests); .modinfo is not a legal section specifier in mach-o.

Before this change tests failed to compile:

  ---- ../rust/macros/lib.rs - module (line 66) stdout ----
  rustc-LLVM ERROR: Global variable '_ZN8rust_out13__module_init13__module_init27__MY_DEVICE_DRIVER_MODULE_017h141f80536770e0d4E' has an invalid section specifier '.modinfo': mach-o section specifier requires a segment and section separated by a comma.
  Couldn't compile the test.
  ---- ../rust/macros/lib.rs - module (line 33) stdout ----
  rustc-LLVM ERROR: Global variable '_ZN8rust_out13__module_init13__module_init20__MY_KERNEL_MODULE_017h5d79189564b41e07E' has an invalid section specifier '.modinfo': mach-o section specifier requires a segment and section separated by a comma.
  Couldn't compile the test.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/macros/module.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index ca1b7e6a71ff..f09431614f2b 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -58,7 +58,7 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
             "
                 {cfg}
                 #[doc(hidden)]
-                #[link_section = \".modinfo\"]
+                #[cfg_attr(not(target_os = \"macos\"), link_section = \".modinfo\")]
                 #[used]
                 pub static __{module}_{counter}: [u8; {length}] = *{string};
             ",

-- 
2.48.1

