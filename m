Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541371714C0;
	Sun,  4 May 2025 04:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746332694; cv=none; b=mHqQPQL+LlfK4wW2RK43jjVW7iMaYH0eFC8VuRWFUuEtNcaMOcYVun+cs28KA5vXDdtcexAekt8tOuqmQEmRLaT3i2f8FmGcq0ONZJz9KAb0K3Kyp8MaQ5Pu75W1AtkFejRLKHIXTWpWuQSFVZFjlGfZudt4IEu9Af9YKekDsZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746332694; c=relaxed/simple;
	bh=oa6L53FFyHjLEZAlHfEnmPEYcnJH3sI9BHEO7dJXZSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBqXtoYdfGmRSqQFPoea8LNVRpbad4jxJsQ0aJjNR07Y4Yf3ZD+dRR4ldzbw/H445EEujugAZub+W6UsEZ5DRxA55cozYI0PGJXY2W3OOQCsRr0ILxWQEVT8t+fYmoFFNjfpPVnBDHElupF7NqrmxDeJs4ZsFGuuY+NnrLpLIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtsxrU1x; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtsxrU1x"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227d6b530d8so30952095ad.3;
        Sat, 03 May 2025 21:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746332692; x=1746937492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJKFHuvmYYPlzU68ekIyAcFUGAd6JaW2Eyl11HXIMNU=;
        b=CtsxrU1xEip5QKOIgbHZIa8+FY7COqTdEIgFFdcmTjLPuhPqb69elmvlUZo2y8A8eo
         xbEzYDHx1LHvpbM9b9wx0XRPrwk9y1gpEaC0SN7imuPpIbsLIo4Mgzkz8POxq2bGzQUl
         W+xGQ4+HOwzH6ngvnoF+D7JPCgluMAfUb8xlW5EneSvfYz5JDWSdB3xhkhKAIQfFbHbS
         7FYpdEN2DawfZnB22Y/XJltfFy3dbeOWCEsXP9bNd6oE5+Y+ttQeaYyfMqSDvPsOVaQv
         y4zEEyjiDzSY5YhKuMVDFmRoFQx+cTHJKXyNwvlwzKiHdyZN4XYmGa6jF0Eq1TKiXnhl
         31Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746332692; x=1746937492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJKFHuvmYYPlzU68ekIyAcFUGAd6JaW2Eyl11HXIMNU=;
        b=qBvBj2U9SDTIL8NCuXDIQQcLhzInrfQ34GbxaOu5zu+CPRYhg++lNCiUVHO96g+8v1
         NOOdWTJX3UtxCUfn2FPsSWmeePRyprm0QcRrvR/J6w3dyXwCjL9dEvaewEgI1eY66CLY
         e05uy7mQIRbSnd67WyuE6DlwnYxN3wULejz26d5da66zOLxXVwbKynScxFqDsvEz5lR5
         PoRflOg7RRu0RV+rnddH5p1rcYLTGo4b3NnvJKGOD/tJNMCICwwplxRltmXub7UjVw+r
         FoOTgig3llDdx5TfB9InNJAGHU6T1mjCkPQ0mh6Nhk0YCbpm9aTwgGX0DxvPWMGbnTVP
         LQNg==
X-Forwarded-Encrypted: i=1; AJvYcCVP1Vz2OhCkWhOyDufzNtDXs+z6KGcH4OcpwZYw/vmJkaYDH8Br4GoFV2STpKXsyE1mT40PCvsAEHEipFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb75kHMgqT2qSI3C2bRB/PsN8Fznyu/C/SanXAeHrhChHzM0BN
	d5CIUfXeRQ8P01rCyT0sCP6gyCIDmMrMsifK1Vmb72VWWxVzHdT1lp40+H3u
X-Gm-Gg: ASbGncsSDUqmpaUqvqjnlJ4kL9M7z+CqZdud+4Z6cZpMzdxay5uG1pP5iTq4FVpCzox
	dIKJK/+ia8/B/CT3+0PGJw02jEneRxz5ROUBlTtpzxDbAclxf0K+VPPF1v1iGpZYi4svlCHEk3S
	/NZGe8DMwkQkBXPgVUtGbb+RCigWSTEt+7jAHXE+6HvLwm3Zdz/9VChSEZgLKX3mlsZKxyaAX0g
	3ME5y7Q6tWgwRoIsD/ui9HtCAFUWTOEoGyEl8/QSi6Vu+l0AanpcehRi9YgTECxus4eDsNZ1PXS
	tZ+3l8YWhjyKt+lGmKp5vvdmlHdDrlR3z1YqwQy5Pl050NWuUvx3/tBRo1NKQSjbTAHTDDmoG5s
	ZFSbbGVQNUiXpjKODcQ==
X-Google-Smtp-Source: AGHT+IFm4o0vsx2oajksjk0Vmz17njjhcZdWtw89HpA4PWNpdbhjuHvTegefbphRqRkOTO6df50AMw==
X-Received: by 2002:a17:902:ef43:b0:221:7eae:163b with SMTP id d9443c01a7336-22e1037ecb5mr129100125ad.46.1746332692189;
        Sat, 03 May 2025 21:24:52 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fbc8sm31482185ad.142.2025.05.03.21.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 21:24:51 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: a.hindborg@kernel.org,
	boqun.feng@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@linutronix.de,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] rust: time: Make Instant generic over ClockSource
Date: Sun,  4 May 2025 13:24:34 +0900
Message-ID: <20250504042436.237756-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504042436.237756-1-fujita.tomonori@gmail.com>
References: <20250504042436.237756-1-fujita.tomonori@gmail.com>
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

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 1d2600288ed1..3bc76f75bfd0 100644
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

