Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE0528B50E;
	Tue, 10 Jun 2025 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548012; cv=none; b=GQL3RgqEkPEN0SouTDckmeeyrZtP5SAfLtF8ZIO6pgTG5YOAGzYvk3d6WekWUIsrMjGfpvtNFYJzcQvfLTcTNXA2njv6UBSAcsXIhXEgj/XCVDanusBq06BTPz0t5fDDrD47s3CWa1Q1+w7hl2+aDBBu2ei7MCHbd+Ixuy6/dqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548012; c=relaxed/simple;
	bh=MQCk59toxyngoPvhQ1aU6dcIzz1O1u3tDlMe5aRUD6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Env9HhDW2t7NmN7bZCOJ7cdtc0AZONEdO/CclyoyVhvitBS5IVDsnZjNolSsUv6VWFTtYPPNu644L3HZQpuwpRQfHHRhnYiLOBMB+e7ZX4RDhB16yRp/ZwlxpigmH/Myj6+SV5vGWilzm7Qov3zQtk4qRWwuuk/tsVSh4Gz9fmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtrvV6FQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtrvV6FQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso4599594b3a.2;
        Tue, 10 Jun 2025 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548010; x=1750152810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R0AmsFSPzLdyf+EVvSE/Sup3od+E6kS5h9VH5CP9Xs=;
        b=GtrvV6FQqsquQ/cPijloZA9kyQIfBaTNhvLAyNt4k3+zNxB/zhKQwXp9Nd/oZVlVHx
         qsvI2N73+8zj8W7rpoy5erkt2ZRQxjM/Q/PmDqnyGNt9SEEsBjxSjTXmAXRSTAXCjR0K
         4CEQOgTJKhz2K5TMzi5vvAdzIT0fcs78G+WMid6HYrE9t4yKL/HmUW7tUFTBRrKsB4X9
         A4T/YfmiEj0JGmOjEHOb9CfNkAX+Zqbfp1roSYozIk662cs/b9pfdya8um7+tlLIOsiq
         coslR3crJF+/BUrKvzkC8w5Eef6zg747NXqFAffrFi2JdD//7MtA4wjXHj0mbcdybXdj
         vvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548010; x=1750152810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6R0AmsFSPzLdyf+EVvSE/Sup3od+E6kS5h9VH5CP9Xs=;
        b=D6KgDx5qxj7YMxUDpEXugizo820MMdi1TQEJUJfaLGbkYxHTkhi0eOHJvNvgzkiHgs
         tpLcUGP4PSg91rOhDq+CNq4TkfQkNxqJWYbuFzq5hLplHtUgHnembh0ljYLWwx1Esfpe
         Ms3wq0tx3NndpJCAAziZ1hC5SHqkyA5QKwUkRW+oaP4nKq4/5tUOEZbidNLqDg3LnSXa
         Mbc5wFu07QFdW8Lsa68bWAWtAFVeEYf1eQ+yWtt/Wy/svHLlvm2LcXuR+VkosC2F/9tW
         W1a4dkbOKVLxCdSbin/kWioDnvu2Fo7Rz1gnnCw9ZO8MlLAaEmV7PPFOV6+s5gJsUUfU
         QwSA==
X-Forwarded-Encrypted: i=1; AJvYcCUn/ZymD59NO1VDg8UiT+WP7MHMgfhF+hXMLDx3X6KV+fDzEEEa/xM/XCJhBrmZmjFNx6q6V0V+T9TFmmE=@vger.kernel.org, AJvYcCUtM5ZYYITWqbDgvhy8WO/iCznB9JFOa66fVodIP0lgLFcMMW9oDT9GFBW3SPG8SU+Sieg2uI5WHD5kGTFM8Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIh65KEGM5jcA17yRPNr0Owe4TyrHgj8xILU68Gt1Gq6BcTFc
	+RnUMUBK1s39329jmh+TiNBGS0CwqWqlyONJ+yZJo/i3H+BXQvqponSX
X-Gm-Gg: ASbGncsYWcsCQBpYCvXvhgjE/yjCDFIJGAt046zk4b8R/d8H0U8JHKZZxwvqkPG0y2G
	tSaOGpGH3X9HFEqM/vT28VyGqh8zx0zCqcwzMpmz+cwHqCRZ7nV/QsWIo0edu+FJ4Q0BR0T06mj
	SzvGIckMTK/WI+1kRSD0Dbm2kkQ8I/q/rPITIN8r+DfIwkak2Kb1hcNHFvIJdC9UKWYeu1F6ZnC
	aZcCq0pfs3AOe4DU8Ng269ERsP4uus0k+XDXEtjXFbL6Tu06XpSH778w/EqMDjSYGYVr2kJtLMb
	6ADVMSQxrZ3x2/EqVCS0hWWSyC1yf9KyUHKX5dRHgGXdbUQPMs/pYi/N648HYzrf5b0rHQJoJk5
	a+CWTGhnLTgthQN098zkLJSXbKzPqujkN/I7gI8fCoFzvJQ==
X-Google-Smtp-Source: AGHT+IHi5tXwv49dq0BMlRk96CKlxGxtXPynCyKPuIA/qU+xyW62iYHaJca+idkaB4rZI0FieUyflw==
X-Received: by 2002:a05:6a21:495:b0:1f5:7f56:a649 with SMTP id adf61e73a8af0-21ee24fe763mr21991469637.13.1749548010406;
        Tue, 10 Jun 2025 02:33:30 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0847e9sm7037684b3a.87.2025.06.10.02.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:33:30 -0700 (PDT)
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
Subject: [PATCH v4 2/3] rust: time: Make Instant generic over ClockSource
Date: Tue, 10 Jun 2025 18:32:55 +0900
Message-ID: <20250610093258.3435874-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
References: <20250610093258.3435874-1-fujita.tomonori@gmail.com>
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
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
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

