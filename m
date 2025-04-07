Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3D1F8BCC;
	Mon,  7 Apr 2025 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037560; cv=none; b=MnRqExr/kOOcT6g/nCADsaILFHCizhNAug7mqrF0KaIHqxPlv53D/+DT2nK2Tvnp16j963+JkJEfGVgF1ciOeh5n3HYZ81M6p08JqluTeSHxlzOUlb8KLsejBcixMBNBxcaZBkcmEe3XDyHiEJPq7Y+QHqGPVpR2WhdhP9lHzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037560; c=relaxed/simple;
	bh=dNjzd71oIUhFnetcIZ4cjovfuK4KPL5cuUztsNo6E1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMX6O3+UOu7s8oNxuNQmRch20y2f5D/6BSzZtAmJs8y8K70z/N86vXkvz0VzFCjialAVDBIRPo/ymNG6XK7skK/uLMqeeGc1zEPfvJ4TRoz0RAVhy8ZoR6etQ8WTkG6M5Wkw7BlATUGimwoJq03J5DY1vtYP/t5E9CmEK/Oc7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZ4XqF3j; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZ4XqF3j"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4766cb762b6so45170331cf.0;
        Mon, 07 Apr 2025 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037557; x=1744642357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUy34P+DoBoMQt3OZN3Q8KWP0NyQoRSypET5AtaZZ10=;
        b=WZ4XqF3jWLN2uaUv6IVszJc8ILqWMwEYiOqlJ3AjL0RAm/hW8gWxpok+m8nqeANQF3
         s/6UkJfoPN81FvcQR1pONmoK9dWpzT60/QTg3VullcTBxuSuGNyN9LNh0AYZpTEjdWME
         oMXNB3IH4KuMq90vEWYt7N/19gy5XEdLBPhCbiXFgyIYpOUJj2wyjDZ6KqIF4sS8NKg3
         BigNPnNwwz1EmDGseVN9r/fVc+Hrq2pNQcUEM1cG5NRMLrcIpmMNzBBtxu3EwbYwW0yS
         QeHEgVKqdoYtz0FRAO3XtdJYCjNSR95vxKrS3zwmYOKfFD492jPqbKgL+qzo7yf2lF+Y
         l+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037557; x=1744642357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUy34P+DoBoMQt3OZN3Q8KWP0NyQoRSypET5AtaZZ10=;
        b=jipECschJSMjvVpYTRsEARQ+ofaAXDFDpri+3B0au5P6n0nFAe2iXhQrZ+ugN9nsUG
         Lnx8iyATvq2en0xaoN/FiG6dsNMiRw9o5Fi3SuVuizLBUWInbZgE0eifkkQcp023EC4B
         yg649ssJWSLoZf2IXhWm9gsk6WOy0zaEQT+NxkSDNI/GKhM6ox70shWJE+ZqUkxZNhGG
         AQvCf56LKzmxRFwI0jC+/5jK0Fhqha3kB0DLsMh14kXfVDbURo9fQGpZxh286D79OPbY
         7h5P9xx5ZOM0wzGQq2S6MMJeqdG/HdfdLYCW4hGCkpG/4mRHxOlAW01gafsK1foNiP7S
         sS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX8gXjqHnWhW567bHWRAdOANa+/Uc3L00Szf5IIiuqDNaIgbdeovZHwdqRJPR0J9BYWNzWROsv/JUus+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOC0vNcivkMMVlIYKOeJLFOlZyDaOy10lQB22PGx09cQD1Nc/
	ogkjGLVgYBCZxdJtHC5clC41o4nCjWLDZd4znyOMv2KTGYElOZQs
X-Gm-Gg: ASbGncsD4jxduUmOWYzQI6im7UrjKGcdiosAhXKNgvldY/JYewg5I13G3vu+6Qx7hfg
	Cq05qiO2aQ0VhgahZPVEBA/NIXI9vdTbDlt9iCOM9rWkdjAun0LXqV3RyZ4seUzz2wuUdzfwgTn
	GS+nWxdWsM0a61iJTZZ6GXW7c3MwIl89d1yefeh1dv7TjDXJLPKYxpRX+0PkhQmBkOCFUoFpzEl
	CURIisqqgQFG+XWdFC2i2nfyz2Y6SdUFhBpD4Rg0K+GwaaQ/2n7N3X/wsaGpxMIv0jomcnrfgDT
	d62obQbEu3lSEf42OdXBwB5CX+1/Hvb1orO8JQxU5uf26hzMAR4mK1VGcQtMRmspmT8HJta+T/T
	vuMG5m8hokFk028JLkcVNB3d3wpEC7Pg/mWpGi+Fn7D2+w8w9DjEnGNOwtm2vX31h
X-Google-Smtp-Source: AGHT+IFXXuWHPAgJppz8Bflv9yauYrd0TI9kqDg45vrypllHt7rGZH7xP7HB56ZjnhWiQKN4J9hEjQ==
X-Received: by 2002:a05:622a:205:b0:471:9e02:365e with SMTP id d75a77b69052e-47924c8547fmr207883451cf.8.1744037557552;
        Mon, 07 Apr 2025 07:52:37 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:d8ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-479364eaa28sm33065601cf.28.2025.04.07.07.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:52:37 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 07 Apr 2025 10:52:33 -0400
Subject: [PATCH v3 3/4] rust: alloc: refactor `Vec::truncate` using
 `dec_len`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-vec-set-len-v3-3-c5da0d03216e@gmail.com>
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
In-Reply-To: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Use `checked_sub` to satisfy the safety requirements of `dec_len` and
replace nearly the whole body of `truncate` with a call to `dec_len`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 844154d310f0..d0b46aa36169 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -493,23 +493,15 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
     /// # Ok::<(), Error>(())
     /// ```
     pub fn truncate(&mut self, len: usize) {
-        if len >= self.len() {
-            return;
+        if let Some(count) = self.len().checked_sub(len) {
+            // SAFETY: `count` is `self.len() - len` so it is guaranteed to be less than or
+            // equal to `self.len()`.
+            let ptr: *mut [T] = unsafe { self.dec_len(count) };
+
+            // SAFETY: the contract of `dec_len` guarantees that the elements in `ptr` are
+            // valid elements whose ownership has been transferred to the caller.
+            unsafe { ptr::drop_in_place(ptr) };
         }
-
-        let drop_range = len..self.len();
-
-        // SAFETY: `drop_range` is a subrange of `[0, len)` by the bounds check above.
-        let ptr: *mut [T] = unsafe { self.get_unchecked_mut(drop_range) };
-
-        // SAFETY: By the above bounds check, it is guaranteed that `len < self.capacity()`.
-        unsafe { self.set_len(len) };
-
-        // SAFETY:
-        // - the dropped values are valid `T`s by the type invariant
-        // - we are allowed to invalidate [`new_len`, `old_len`) because we just changed the
-        //   len, therefore we have exclusive access to [`new_len`, `old_len`)
-        unsafe { ptr::drop_in_place(ptr) };
     }
 }
 

-- 
2.49.0

