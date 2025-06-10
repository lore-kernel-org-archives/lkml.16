Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F2C23AB8D;
	Tue, 10 Jun 2025 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562120; cv=none; b=NDa83U7sM2JVx3HJvIRdfkZhFPthgp6qWW30KMiGh24SlsEYWmI6Besvk7zz3MjlHnnGdmjuo714vFpH9uBMZJFsTXhTbRZ1fqZLyjks3ENPhiUp3A9O76NukCobpe3Sz9bmwtupqj2zYVNeOzfwDNGJYRuJLOtBEJH5OKZ7wMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562120; c=relaxed/simple;
	bh=4hyk0K8UbeOWdvX5D5fgy3eh4gAR9L/juUd7uhWoWKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZIn9hEi7K981Oolmp/J8TA062SFaJahsgXsSm2uvTSwfMsLIzk+KIGuuAvHaED1w3G/9cZeEWMhPNlRLgJTtXYvcOk08WKCK7FlXSTTQJ7W79vhMws2kfsTXn4qGosPjqY+3Sm7pa6a6lkpjAErWb1p7VlI6q/kCFh/p00wiKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qx7IqIEB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qx7IqIEB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d710d8so66581045ad.1;
        Tue, 10 Jun 2025 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562118; x=1750166918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omwJ5JP66L/+9sD/AxglLPlZQ7EGc6XcrGECQtUSke0=;
        b=Qx7IqIEBfRmSWTGbrrs8JvpnyT/gD9sh7vtyRVHK7GbpUTYJ+RwG7YfDOxbbd7Ne8u
         /7FRZ4AOsqJc+eqxgOFMHlpwSXakewxyuxwkDVhG77S5TtlYe4Y2RuVP73uuOZQBvujH
         X+M6n7hmccVIUSKL/x1baJvDFBhNuRsV/10wnn8u2cpJNOOmMZ5PMsOVpalxf8BvxMDA
         MQWc5W+n89sLi1+25JQd/FsP2vkNHDBHDG5LcvBBGXYNAtYEFLiM2vMGz1Tgn3JRc5ov
         ESY3eSteSokXSqK//M+LOrZwLTNnxali/lPLZBbbMpfj35hCqXdGF9BvlqYK2vJ5pjLl
         0Ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562118; x=1750166918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omwJ5JP66L/+9sD/AxglLPlZQ7EGc6XcrGECQtUSke0=;
        b=uCPlBvcw65epdJBVTfoj0K36vJs/GJx6KUZWpO/iHTNQQl6iandn+yKdZ5jb4lbPeb
         bmoRb/TjfpMw4WrONCMW9m7PoPlDPISAkgvvdTC/Vm52pNwkH5OIxCmDz9poVoldReQv
         UhJsjFubSB/cPndfEcqKSJ2kEntpQHLJaPGkLN+jqKc01JllmEho4BmGjpGHgGvXORDC
         CBStt83JV7YODGsamEbmyBXUdcGNwoM3+8FYI8TxkQFh0M6BXew7y2IT1KHOCekb7qJI
         y+2Kc6ebNEVNFINP1o0xdhMXoSslbns9SX/wT4cJziMMN00Lz7UlqBdTRJJ1A3tE/h+j
         IClA==
X-Forwarded-Encrypted: i=1; AJvYcCUtDxtIVMgK7lJeGIWmLDkNuMYCUBxs46muDs883mlGum1RBDTz7MS7+0TAvpbd8pYmH8W/+OTPBd0WNYI=@vger.kernel.org, AJvYcCXm8e78F4GBcDJVISYh/S31CS8pFWealYXGbaQDf0mzNkDvB0+rkkJhvEDIWfcHQ5VUtRqk5qYnhh7MIxc229I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaS2Ty/TFFStOUSjMk1ISx/Zm9fV8PSzTBgcP37Kz7SDJVaAgv
	ygIw9aUknhN8ZCzYTghEnCgJgnu8N7EbGqfOKdi4fDra8O4+RFP3z6Lu
X-Gm-Gg: ASbGncuxyW9z9kHUrxNtM7cXCs0a2mf+AIPSt1T4iBgsKHzq3SAt/kR8HNHQ+M9YdCj
	X9p5vE8Ur3Tosql+70QyXnkKjbs6mFhTgwL+v113X58KX9YWt8JIwZrEXFdhT5W3bPKsT2jaAMK
	9FJVaV2H4iaIqWliL9904ElAQl2ZQ6Bnb+aJdzphGgUFbTnfESoUkMCsS1AcL84iTaD1A73YNUe
	0L7s8Eg1GGBwomgevyTo92IJzdv7/UkBuFzmOAjVPfSKQ/Vak1hSFXz1/rFlL2jlRsZdkUQJa+P
	+3R1xgPRNUj6z30QDqOG75PW8ueH4P5D3fwvjoWrRrK+AGB5IyCamH7UnRBiCb4rKK9uv6VYl7d
	ZEyCK69JBsw2mlWI2v7Kle35LPn4uDBRJgLo=
X-Google-Smtp-Source: AGHT+IHFo4Hj568NXhmQHnRzk5hYOvgTrZaZ+Gt8La/fb87IINto/aqaIIaswE7l9do8CcalpsDslw==
X-Received: by 2002:a17:902:ea04:b0:224:24d3:6103 with SMTP id d9443c01a7336-23638342d1cmr40756195ad.35.1749562118258;
        Tue, 10 Jun 2025 06:28:38 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b128050sm7969276a91.25.2025.06.10.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:28:37 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v3 1/5] rust: time: Rename Delta's methods from as_* to into_*
Date: Tue, 10 Jun 2025 22:28:19 +0900
Message-ID: <20250610132823.3457263-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename Delta's methods that take self from as_* to into_* to align
with Rust naming conventions.

Using `self` is more common Rust practice for small values that can be
freely copied [1].

Clippy warns against using as_* names for trait methods that take self
as follows:

warning: methods called as_* usually take self by reference or self by mutable reference
--> ~/linux/rust/kernel/time/hrtimer.rs:421:17
|
421 |     fn as_nanos(self) -> i64;

Rename the `Delta` struct's methods from as_nanos(), as_micros_ceil(),
and as_millis() to into_nanos(), into_micros_ceil(), and
into_millis(), respectively to maintain consistency with the other
function names.

Link: https://lore.kernel.org/lkml/aD1fgizC4FPT07vt@google.com/ [1]
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 9fd487276457..2a231c321afa 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -261,31 +261,31 @@ pub const fn from_secs(secs: i64) -> Self {
     /// Return `true` if the [`Delta`] spans no time.
     #[inline]
     pub fn is_zero(self) -> bool {
-        self.as_nanos() == 0
+        self.into_nanos() == 0
     }
 
     /// Return `true` if the [`Delta`] spans a negative amount of time.
     #[inline]
     pub fn is_negative(self) -> bool {
-        self.as_nanos() < 0
+        self.into_nanos() < 0
     }
 
     /// Return the number of nanoseconds in the [`Delta`].
     #[inline]
-    pub const fn as_nanos(self) -> i64 {
+    pub const fn into_nanos(self) -> i64 {
         self.nanos
     }
 
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
     #[inline]
-    pub const fn as_micros_ceil(self) -> i64 {
-        self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
+    pub const fn into_micros_ceil(self) -> i64 {
+        self.into_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
     }
 
     /// Return the number of milliseconds in the [`Delta`].
     #[inline]
-    pub const fn as_millis(self) -> i64 {
-        self.as_nanos() / NSEC_PER_MSEC
+    pub const fn into_millis(self) -> i64 {
+        self.into_nanos() / NSEC_PER_MSEC
     }
 }
-- 
2.43.0

