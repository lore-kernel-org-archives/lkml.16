Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7780878F36;
	Mon,  9 Jun 2025 01:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749431108; cv=none; b=srcda4DhW3n1ihPJT4dbtPPPObt07uUx2nLGreW3iR2nP00jvxR76q4x1gadMLr/3/uJAU/z7bw5+NLa3lS3+0rJXGUqFP+z0ZGD1gViX/LApK5JGMz2E2oZfwkTXLfLuHnHDu5ElXk8TlRvWGshFl98CyXDGhg3NxE5hr8mQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749431108; c=relaxed/simple;
	bh=KpEJPDoH3Ke7E3fk3g4o//fi6zwKI4ypzzJTsX7nLHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NkKHivlY9yCY/BtINOxrMXN7WZdHXVn5EJZ9uFR8VtS30w/DOiCEQWMFfaz5/TsSZ7UzHWO17M9WNmT8x93nZHF+SZiy2pSPHAqqCMDB5aClWgt+tbV66JjFEeUUMPDenRbObCLGk17vCQbfV+GCIWKF3Qx32O9Z0Vbu6h5JKks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlyqPmoP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlyqPmoP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3418977b3a.1;
        Sun, 08 Jun 2025 18:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749431107; x=1750035907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VMiY7LHcttEm2EneVCNDxpKRP5JWg0jKpatukxRljQ=;
        b=jlyqPmoPQr8rDN7A9D9vDdpATp0iTZa3WhFzpI1BToOlgvU4sFyKwgU2pyB3Wa27+s
         qtEVhTZ+eBEsekdBk+zE00ztj6Bbic2JzW9KikrWaZArIjL9cDyl5bUnSgYT47dVPWc4
         0QNIV3l9zaHbfXotFEwfUm75vHHyx0cIl7yfVpbZlLWw9NS8EMK7cDIAC/O5ckSGFNHp
         7GA/X7VhCcocgttUDMBPWDF0kNkN1IV+ahCx3GIQT2OXgTKzpZkwyWu6FBmyrCUs7N/t
         rUH4v3ViHtyzgT1bPbRXr2C8sGVXOhqhamzNKXydsC9Q70Rae5DHhwwje8HQyDhWyNof
         ePKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749431107; x=1750035907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VMiY7LHcttEm2EneVCNDxpKRP5JWg0jKpatukxRljQ=;
        b=ozbS/IiwCDtSuwFzuxxNXg6erxtMVhk/xdxsllXiyK0e55gQM8hZAKsbcf78XibpAO
         YbCuA+2nk4EoZLHC97f9UB6qovR/ioAoVkdD04ctddsXeo41j/A8L5AdnS3dvFf8a2al
         SCh6vcNMD7iylLTJR/aeCGIFxEGp7OgWXsFKtH4C1zq/PQOajcI/RnBsrcrCk0Yrb/My
         MZXyAYYPeyg+c62JRIcPUGtlPRURkzyMyf3i8pOE2UE2PezBqfzYJ+XRkyMHIvf8+Kxp
         U5gFNGLYYhFqyZzJihIXUnMOe/GOVyCqzkPece9Xu+Mo2Zluf3E9IlqwPzhXoOzghL5h
         8AZQ==
X-Forwarded-Encrypted: i=1; AJvYcCViSUaHItWbnBqJpQv56hLwDRObSXjmcgCtQHOtLBC0Rh3/o6eGIfmhRfpruRztsXeV3HDY96FYZo9r06k=@vger.kernel.org, AJvYcCW6OjGwm/Xhs4KYXotYDme47WmCrFWkrk/OFTvo7P7I65D60GqxrL9JX1I3RMx/SN+6DkcSrOCxXepC1leEQ4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywx9wfkoq25+Eh2RUP5q8/OnF/YlIHqav0h27KmKKkCKwRsxaB
	YLeKO41LYqDQ/RV1XJe8BqTG2MDnmUxo1bh53dM3+brACI5zYjL3g+GS
X-Gm-Gg: ASbGnctobWXFH0+D2bfz/iq2aqg63HMgMUp/bX9Wj3VYhiEQltmRNXZZaJGdYFU3oBt
	4EkkE6OqoMflMiuFQHPvIq/rVb3RxImHSbk6OwegdmQG6otHITGA1eMXT+N+geMDguXzk0NV2NH
	wnaKRyHG9K8HkwsKiORLcUjkEpiz9v0ACLe2CvyjUp86a3PS568hGOpSSI1gfOggZkgLGMNy5Cf
	1RW10elSx+Ur5/uH9koLZP9WqnMAhHPt+on0Hs+iWgkw67KW+3Cv49UGUxIULKZZ/nj4/x3PfNr
	1pPRTrpvoDvZz6dz/P9k2ODiZlNaXPvWhpQTOzL24RI3fxgiK5kFffxLzX9LmrI1JEQCio9ca1B
	0u5O66bgL8HrcxhokJQj61i495SwanOfQKoWa+0s=
X-Google-Smtp-Source: AGHT+IHIFJ50KVj62qpytH8UIDC8kuvcb1nZbUNGWTqCjcDuoN5FvjA2SWdwC442wWglwbYeWKC/jg==
X-Received: by 2002:a05:6a20:7d9d:b0:218:183b:ccaa with SMTP id adf61e73a8af0-21f4884f1d2mr12333356637.17.1749431106642;
        Sun, 08 Jun 2025 18:05:06 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f6683b1sm3652201a12.50.2025.06.08.18.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 18:05:06 -0700 (PDT)
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
Subject: [PATCH v3 2/3] rust: time: Make Instant generic over ClockSource
Date: Mon,  9 Jun 2025 10:04:12 +0900
Message-ID: <20250609010415.3302835-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
References: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the Instant type to be generic over a ClockSource type
parameter, enabling static enforcement of clock correctness across
APIs that deal with time. Previously, the clock source was implicitly
fixed (typically CLOCK_MONOTONIC), and developers had to ensure
compatibility manually.

This design eliminates runtime mismatches between clock sources, and
enables stronger type-level guarantees throughout the timer subsystem.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index efe68462b899..bba62c7f37e4 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -24,6 +24,8 @@
 //! C header: [`include/linux/jiffies.h`](srctree/include/linux/jiffies.h).
 //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
 
+use core::marker::PhantomData;
+
 pub mod hrtimer;
 
 /// The number of nanoseconds per microsecond.
@@ -136,12 +138,21 @@ impl ClockSource for Tai {
 ///
 /// The `inner` value is in the range from 0 to `KTIME_MAX`.
 #[repr(transparent)]
-#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
-pub struct Instant {
+#[derive(PartialEq, PartialOrd, Eq, Ord)]
+pub struct Instant<C: ClockSource> {
     inner: bindings::ktime_t,
+    _c: PhantomData<C>,
 }
 
-impl Instant {
+impl<C: ClockSource> Clone for Instant<C> {
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<C: ClockSource> Copy for Instant<C> {}
+
+impl<C: ClockSource> Instant<C> {
     /// Get the current time using `CLOCK_MONOTONIC`.
     #[inline]
     pub fn now() -> Self {
@@ -150,6 +161,7 @@ pub fn now() -> Self {
         Self {
             // SAFETY: It is always safe to call `ktime_get()` outside of NMI context.
             inner: unsafe { bindings::ktime_get() },
+            _c: PhantomData,
         }
     }
 
@@ -160,12 +172,12 @@ pub fn elapsed(&self) -> Delta {
     }
 }
 
-impl core::ops::Sub for Instant {
+impl<C: ClockSource> core::ops::Sub for Instant<C> {
     type Output = Delta;
 
     // By the type invariant, it never overflows.
     #[inline]
-    fn sub(self, other: Instant) -> Delta {
+    fn sub(self, other: Instant<C>) -> Delta {
         Delta {
             nanos: self.inner - other.inner,
         }
-- 
2.43.0

