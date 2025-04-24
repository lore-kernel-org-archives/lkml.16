Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5F242D9C;
	Thu, 24 Apr 2025 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491134; cv=none; b=FalKQrat3nNBJeH23q442ZhMX9nTTVoc2qp2wmvKUBFiVhwujKeNa2C5JUqX+HDeeakSdqx2sn/C+Qt/TcAH66uTEXyvWhzseNCxQUDWj3C13cXP5AU0k70R4IYRMD+DeVumxK1nrtI/ZGEMxM9cxoyeoNm8DSh4ITQVrlA76IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491134; c=relaxed/simple;
	bh=K4f1M1J3eiRkmlZfWE5q1aMx7TxUtz8BejasUkAtzmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxKyLeoBNDDGHrdTPne28IcF/rxIUlaxZtOuyHOZQgwAeV8Xm7PBpT5p7OIoH3UjvhGGumhBX+6B/VIkruEUjmVp0kW6vIholX/chP3hnHel5KBUNjdCaJG2LKvhKRundJDRdH0plgaQLjI0kHxeeJQdUqYWMaTQv3OTpHNB1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU8Jqefr; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU8Jqefr"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8ffa00555so8516376d6.0;
        Thu, 24 Apr 2025 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491131; x=1746095931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvS6joOczv1CrYhdtKitf4Xzxm9N0M7WxqdmnmwyA9Y=;
        b=PU8JqefrkyD1YkkjzLUlZ6DC0mPslXHdOaygOvycZXMn3zcoDDzVhlyJbPzPB0xM3X
         xgRswhP6UNPMh86VC6kW5PJvhvNRaHsmljQzd7XJfQQi+PJYsCQPFeQe1J4XflR9h3zT
         83ufKq0ZRUNFM9X3c9FhzZP9Fu2MqQBGZX0Hg0Qpdg4LGJ8quu+SOcbFg1bwHbEs2ZX/
         Cu9AS0sQ/im3wtBk0IwyNzcp8qopqyknhyEQXaa6InFEU0bkERYZC9RlGanhm3w7NuRz
         uvVfj4QXDZF18zDNcUp7/od9Jmuc4ACdIK8wT6YG03GwHYcTXzjc5CzbWqPDxnGYiUy+
         Whvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491131; x=1746095931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvS6joOczv1CrYhdtKitf4Xzxm9N0M7WxqdmnmwyA9Y=;
        b=SSzeXUMNqFIAWw7YqPIzwxD1csiSiD7mkXUl38T9Kb5iTj43CqZl1H37uj+aG+vpLJ
         ZF15XNH0TwEMMF3g0RonPQgQyj4y9LRgbvCly6+r7QXoOcz5DgKGgsMyuDYrdURhix9T
         jZzo5BuDEMvPS++0ZxDoQbkJPPQvrgh1CmmgIkENjsWE2pUYFZf2tpFfNYoXHGV7yt7m
         q8qNFbLPrhKUwi6/Y5WHbp9r3ec7JmW7X/uHjQZv5Ik3xrpS+/T01+V9ySsOGcBzb6Ld
         JJsk+wdSx23eUUs3P3o5cz9i5w53xJPia4uYwo6O+5N4pZQFokhsJW8WXTKJ0iiNC/fF
         VCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTmFWvPAa5mv0FJN4WjryNqW2CFUlCYjCf4wwh3vio62pxSlC8u4oKFlzcoSwY56PrP/2KZXTlFw3X3PA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDVbQj4ZdLoKoviHzP40aMbwnVFX6eygf2swwY2AS0sSWVQNN
	+oP6KickcpUaUjVkNl4dUWNeOFHMz51rfEB0yjdhHutRZdjUGWoN
X-Gm-Gg: ASbGncv6RBssq+uzkltk3j9XvHW7GJ0mur2JZk+DDQrTSatHT+KiaNekBefXgyKoiyR
	asm+plD1rcQknSm9OlSX9K3lQcrl1NOHKJkiW1dwDFNRKhPSrNMb1XocJgv28u2OowTxR6sdQs5
	HL77CAouwCpjJnvc7EHL5q4sZXmdBYfN6ESlPoJ/eVPNVHSXuJe0soUBxOVBMOU72qUTf8ovb0D
	G8niWvRaSVHGclYS4k6j3iFjl0lAdYcFnYnjJkqEcduAS04qb8daIo9WmJUNdiPMA1TSr0haa3u
	+92U1FWxVogAkYtwAq0BUqXLC9kNCpsLznZ/gg6zYzj3NzM///PfqVGLf3bAIQYaQROg
X-Google-Smtp-Source: AGHT+IFESDjoAGrwnc6Dwc2MhR9GX+/9VzJJjsPSfV9tN+KPqKvBsZ/djdvKAtx1+eVpgNry072xMw==
X-Received: by 2002:a05:6214:8b:b0:6e8:f672:ace9 with SMTP id 6a1803df08f44-6f4bfc6dc7emr23517106d6.29.1745491131221;
        Thu, 24 Apr 2025 03:38:51 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:50 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:36 -0400
Subject: [PATCH v6 08/13] scripts: generate_rust_analyzer.py: use
 str(pathlib.Path)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-8-40e67fe5c38a@gmail.com>
References: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
In-Reply-To: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
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
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev

Use the `/` operator on `pathlib.Path` rather than directly crafting a
string. This is consistent with all other path manipulation in this
script.

Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 66e3d5e8c52c..bc23cf58e7a1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -141,7 +141,7 @@ def generate_crates(
         proc_macro_crate: ProcMacroCrate = {
             **crate,
             "is_proc_macro": True,
-            "proc_macro_dylib_path": f"{objtree}/rust/{proc_macro_dylib_name}",
+            "proc_macro_dylib_path": str(objtree / "rust" / proc_macro_dylib_name),
         }
         register_crate(proc_macro_crate)
 

-- 
2.49.0

