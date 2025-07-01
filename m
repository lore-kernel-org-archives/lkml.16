Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32074FBF6;
	Tue,  1 Jul 2025 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329121; cv=none; b=p4mAD7mMg/n6ODX0j5w6UvPm7i9phM8/BIt0SM7yYqtHFfr03oYh5By8cXQiD+qXuJU1Gfj97X/dqzKj+R/9mlOr9Jl5lsvOJE5S0WaMeLx7j8xqEx759x+Q31hBoR6LQIaKwgm5hw/pd5nLz8l42QreBFFGFe6WLrr9TLxoD4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329121; c=relaxed/simple;
	bh=yMrZ4JZNAiQqXMuoU7PwJaX9DZhFx/KCaf7NX4sTEuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sh7Oj9Dv/GRXUtmBR7z0052Wy16kiiNGICjPOMtKuyH6CZeRJ75+gYZZJMBNdVohFXZWU92+Iud/n9yHt6YPwmOJ/rgoG7/A6Xk9LsYkgmND0sR8NCslN1uVxagXH0Ct90W3HIzinBB7YsnbOkzN2DlfHi/of6PfKygs3smG0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2Zb6SME; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2Zb6SME"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso4411662b3a.2;
        Mon, 30 Jun 2025 17:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329119; x=1751933919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7/iJEzPIk1+iUBesCRqXA9be3lON0e77vJMPi1nGYY=;
        b=U2Zb6SMEbCTjPvJpI31yGYci03nwsrS3Cp/I+w5MUWqwpBH9bIxHuoqmFWBUn+v4bH
         U9EhvdqHKvSc5OEYH12TDz97bcKQzdr67p7/OFOCNOc0A9CVFaPkZXgh1btzPEOYQrlP
         ikBmRxzr7i2noEGXR2WkAwIFjE6adsowuAtNcq/gztIfNXljVDh5SyL6KXWSWB+nfli/
         D5jzVADsoCaohdSIm5nOly2r3A2PjPPR3MnDPdtMBJ3x/Y6pQS14HmD4Y5/eUp75ajnQ
         XAP6p5BeFMuRSTdTlzXoV3vGdYQT9lLpgcNwnDB7vbSDpHfFA/9aauZ3amaAtnlT68au
         b8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329119; x=1751933919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7/iJEzPIk1+iUBesCRqXA9be3lON0e77vJMPi1nGYY=;
        b=aqCFmoIsA/ux9GcLG2LsK50re4Ji5xiMKb6XfyUsD3HVecLBCy8auyJ+fh9zl7dvyR
         lrpM7bK6onwETLcegqpUPF6SElqkosjxZ/z2fH2u7QV6DzpjRBcLCwLOM8ZZn91wEHYI
         t89YMdCnn0dJTpNuGXGn9fxcAd8I2mM2T9aGdJdyADa6oN2ESwcKJr/ukHXaMYXq7Ter
         y2L1cncFDVtRDzSryJx3QxkpT8GLTNisHQOxcl5IEMk2Ykoc9PyuKr5dnwVTEK1fy1qQ
         CukJWxCnEuYDlzgfHUZQXV3XSszlXwbmw4Kq2IAU/sBkqu29YkF/seKAYq3rVyWfhHer
         mLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUklgnPFCzBsjV091rUIyudAKrTq1+Qi27ZrK2IK/JmpZBbeLv87OGsal+ryG+7eE5lX/HO+Y7Xqs/xnnML1Uo=@vger.kernel.org, AJvYcCXzyFE2gUlGCBmtG1qFcKlnUWkii8QPmDKitnXbxN6xNU23eKaDKpO15hi/EByDaEJ7fwIu8YLwRaxdEYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuUxkHVCKQaT04G8ApXvREwKmZkCNOdlsdjl6IiRf7inbmFTf
	/J5LlDLLRm4NVWqzGSIcbGGTkN/vbPYTu+gW4Hla78Q4w5LePEpQkEUE
X-Gm-Gg: ASbGncubSql40EYrru9nXUsdkV+V9OZCHSCUwaVUI72ef02v+3v0TfDuMA+cXDm4YE5
	YWyGqC2Duw2yDLHx7BSpzwLnyv0Mf3wkL1QIHAHD6mAjA98oQXmZs6CMNqc/a8NLXW6RveT877x
	9O9WyZFsuftMjUQsDaLLU5VBmaT/5OMYJwsN5+cIyEaFXvAtgkTUtXra3p8KFlhQljfZHXF/Hmi
	spZJsEHU5YOldyQoxjcc84xfJHvdmq2s4HMunaHi2i6PbqiDMwvvlHtR4+YaShitiXikh3x5QVU
	XVvncXqopY/w9EW28NELF/Pu//OmpbSUFK8r4zx9sbKC8312C9+JPpMFWSZzWaOanEwTz0dKOKp
	O/6U6FoBN8Q7CAojoACM6IyKi14DLj0WU22U=
X-Google-Smtp-Source: AGHT+IG/QRahOP2tTojgH2/ui/aRYg+7RO4v8upmuRnaUwRlnoR6moZJeSAMQRFTxHdngBeenyV2nA==
X-Received: by 2002:a05:6a20:12ca:b0:220:21bf:b112 with SMTP id adf61e73a8af0-220a12cd7b5mr25624288637.13.1751329119377;
        Mon, 30 Jun 2025 17:18:39 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e302311csm9091196a12.21.2025.06.30.17.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:18:38 -0700 (PDT)
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
Subject: [PATCH v1] rust: time: Add examples with doctest for Delta
Date: Tue,  1 Jul 2025 09:18:09 +0900
Message-ID: <20250701001809.496389-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add examples with doctest for Delta methods and associated
functions. These examples explicitly test overflow and saturation
behavior.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 67 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 64c8dcf548d6..c6322275115a 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -228,11 +228,34 @@ impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
 
+    /// Create a new [`Delta`] from a number of nanoseconds.
+    ///
+    /// The `nanos` can range from [`i64::MIN`] to [`i64::MAX`].
+    #[inline]
+    pub const fn from_nanos(nanos: i64) -> Self {
+        Self { nanos }
+    }
+
     /// Create a new [`Delta`] from a number of microseconds.
     ///
     /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
     /// If `micros` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let delta = kernel::time::Delta::from_micros(5);
+    /// assert_eq!(delta.as_nanos(), 5_000);
+    /// let delta = kernel::time::Delta::from_micros(9_223_372_036_854_775);
+    /// assert_eq!(delta.as_nanos(), 9_223_372_036_854_775_000);
+    /// let delta = kernel::time::Delta::from_micros(9_223_372_036_854_776);
+    /// assert_eq!(delta.as_nanos(), i64::MAX);
+    /// let delta = kernel::time::Delta::from_micros(-9_223_372_036_854_775);
+    /// assert_eq!(delta.as_nanos(), -9_223_372_036_854_775_000);
+    /// let delta = kernel::time::Delta::from_micros(-9_223_372_036_854_776);
+    /// assert_eq!(delta.as_nanos(), i64::MIN);
+    /// ```
     #[inline]
     pub const fn from_micros(micros: i64) -> Self {
         Self {
@@ -245,6 +268,21 @@ pub const fn from_micros(micros: i64) -> Self {
     /// The `millis` can range from -9_223_372_036_854 to 9_223_372_036_854.
     /// If `millis` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let delta = kernel::time::Delta::from_millis(5);
+    /// assert_eq!(delta.as_nanos(), 5_000_000);
+    /// let delta = kernel::time::Delta::from_millis(9_223_372_036_854);
+    /// assert_eq!(delta.as_nanos(), 9_223_372_036_854_000_000);
+    /// let delta = kernel::time::Delta::from_millis(9_223_372_036_855);
+    /// assert_eq!(delta.as_nanos(), i64::MAX);
+    /// let delta = kernel::time::Delta::from_millis(-9_223_372_036_854);
+    /// assert_eq!(delta.as_nanos(), -9_223_372_036_854_000_000);
+    /// let delta = kernel::time::Delta::from_millis(-9_223_372_036_855);
+    /// assert_eq!(delta.as_nanos(), i64::MIN);
+    /// ```
     #[inline]
     pub const fn from_millis(millis: i64) -> Self {
         Self {
@@ -257,6 +295,21 @@ pub const fn from_millis(millis: i64) -> Self {
     /// The `secs` can range from -9_223_372_036 to 9_223_372_036.
     /// If `secs` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let delta = kernel::time::Delta::from_secs(5);
+    /// assert_eq!(delta.as_nanos(), 5_000_000_000);
+    /// let delta = kernel::time::Delta::from_secs(9_223_372_036);
+    /// assert_eq!(delta.as_nanos(), 9_223_372_036_000_000_000);
+    /// let delta = kernel::time::Delta::from_secs(9_223_372_037);
+    /// assert_eq!(delta.as_nanos(), i64::MAX);
+    /// let delta = kernel::time::Delta::from_secs(-9_223_372_036);
+    /// assert_eq!(delta.as_nanos(), -9_223_372_036_000_000_000);
+    /// let delta = kernel::time::Delta::from_secs(-9_223_372_037);
+    /// assert_eq!(delta.as_nanos(), i64::MIN);
+    /// ```
     #[inline]
     pub const fn from_secs(secs: i64) -> Self {
         Self {
@@ -284,6 +337,13 @@ pub const fn as_nanos(self) -> i64 {
 
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let delta = kernel::time::Delta::from_nanos(123_456_789);
+    /// assert_eq!(delta.as_micros_ceil(), 123_457);
+    /// ```
     #[inline]
     pub fn as_micros_ceil(self) -> i64 {
         #[cfg(CONFIG_64BIT)]
@@ -299,6 +359,13 @@ pub fn as_micros_ceil(self) -> i64 {
     }
 
     /// Return the number of milliseconds in the [`Delta`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let delta = kernel::time::Delta::from_nanos(123_456_789);
+    /// assert_eq!(delta.as_millis(), 123);
+    /// ```
     #[inline]
     pub fn as_millis(self) -> i64 {
         #[cfg(CONFIG_64BIT)]

base-commit: d4b29ddf82a458935f1bd4909b8a7a13df9d3bdc
-- 
2.43.0

