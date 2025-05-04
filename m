Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE181E;
	Sun,  4 May 2025 05:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746334819; cv=none; b=qUmmfm1fjTtxbo/2x++wDmTDYDFQpnvjs4zMKs5y2uaZ5ikTF4Eav2EoipPHd++h7oRPAdq6FLsX7mB7vAeiQIMTu1062ksSoq+MkQh2ldpGAJkfDNFTETkQoWDQJsKWylO/AWhLv4mxVTqeCyRmt+qVm5LraxqFw9JuNSG6wic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746334819; c=relaxed/simple;
	bh=zl4sJNGthzZLZ1+4crX6Vr7P7kWOAx7JN+qu+L3ObPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+bCJG7CGgneOfhEyA7cM2Rg64ntFKcWek82op3zV8xmmewwjFZ/ro7DlYRFYFrLrTbBumNPHGRmEWp0uWwCMhXTxhRJvLQhv5CzVwSLUxBtH4Nbj3IqqPrlQiiw3MdHLNuiH4lJY+wLtbRIPNDEXg08ZUvE3YqMWfGlG7LYsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoBjkgva; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoBjkgva"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739be717eddso2761022b3a.2;
        Sat, 03 May 2025 22:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746334815; x=1746939615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrDG74rIW86O9duGthjeZHPVikMtq3eKNAk/Yr/Vgpo=;
        b=JoBjkgvaYFeyu4tovblkTsx7skubhjAILoEa1SV2AiIc1t57iuxUdNUEm+sDUWHi7v
         wyIeAjR8xXqcc6wpeZxYzPDCkquxc4OTyT1LF91BScxZz3xH71gN2J47h0hL/Qd8ihmU
         VXEB6VcmyrMgD2kt9UlId+VDqnY1bUTIFlQpbWp67B9K4lH8tZKH6mK0zGA/G1RhOrkq
         1lhmLMcjLy36Cvf7VyIptnulCBdbByRWx3AE7f+kOJ3LwkHjDoTq9n7g+2NKBoTrQJQb
         x+oBzp3/M7hI2soTXUloUl6H3bP9ZwLPSYGKI6FHmvefzRtLZZDzLagXFuKItn7lRur9
         fOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746334815; x=1746939615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrDG74rIW86O9duGthjeZHPVikMtq3eKNAk/Yr/Vgpo=;
        b=Ljz2EgZWQQOPT76xd1zxB8g8wsY0lkeMHtWQkZlX5a/UzIOuu2pYcH2XErF8J6xCpB
         pN/Nf1k7uuVZqGSSLOcHax1tSjFJE0IZewl5RTdu8MY7Ig3bUpmem0f8vGQtGvQm2FBV
         ck2Ge5F3vmtA0EsfAMEqiTBBFXpmSpBY8ht9PAD3vAsS8aQ2ekH7FRqwc3vpYrUMTERm
         /KjQCaGVeJ1DxADZYLi7tE2xvz/XgRvVa/iSxLmRsv+xI4/Ywf3lD3YY/9lIVagNoc81
         i+tyqAISbiHTLsBBb9JBxGKmAv8q0p72rLOqL3ETc5y50f+FBWhoN3LKZRFp1uRrOKos
         hx/w==
X-Forwarded-Encrypted: i=1; AJvYcCUgHqPvwSPnuEl4tFji3Fjh9Padv/8hDY16Ba24mN/b4ly3ZZIaEB02X24cMjOYIKmoxG1dlf/q1W2VU+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUa1xnbxO5BqTDWvyUA5K4hTDN4IDjncwbgrO5/s2o/6Ra/Vx
	IoUaOIMqw3TZ7IQvqLKM/8OpkLz6QzrSnsBb2bTmkR4D/tBEBsUiaRs7Dd+U
X-Gm-Gg: ASbGncvsWEnTasdFSajrtAaAzSj3P6wORVTmnEAssVW3+U6y34LJZeX4N9L8paJwMwT
	MAskxmreOn24S1NZuqZWXtJ3G6sHuHKIMaKeX3nHiSUxD5zMWqhFoxTQ+uWz4pEXa6GJP9rDGom
	l+In5lxZlSPFwlVUFB3v+34aCgWTVTvZDZDaZuAnk76OHG64fIWI6/LX1UeT/G9JSRDg4TB9THx
	nfEu+d93JVonC/Ql6PxbVGVUmb6aArXMSqC1ZEZyw2YMoxqo+MO6QGGpdjtxbgj3gqUQskVRUYu
	AYs/RR7gSx4hZynwM7FCaB9rZN/6u7Cyuq+EJhAUuPwA/J775rdZAncaSSkNEfLd2d+W6+gagxK
	QAtHcVIVt4PQvbkshsg==
X-Google-Smtp-Source: AGHT+IH4jNL6htGTVVoOTPK7QPxTV+BiuViU95N8q7vXthKpI86LxyXaxii2C4yvkMYaIAviI/qHOw==
X-Received: by 2002:a05:6a00:e17:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7406729ed39mr6310921b3a.5.1746334814961;
        Sat, 03 May 2025 22:00:14 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91dasm4225756b3a.44.2025.05.03.22.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:00:14 -0700 (PDT)
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
Subject: [PATCH v1 1/5] rust: time: Change Delta methods to take &self instead of self
Date: Sun,  4 May 2025 13:59:54 +0900
Message-ID: <20250504045959.238068-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504045959.238068-1-fujita.tomonori@gmail.com>
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change several methods of the `Delta` type in Rust to take `&self`
instead of `self`. These methods do not mutate or consume the `Delta`
value and are more idiomatically expressed as taking a shared
reference. This change improves consistency with common Rust practice
and allows calling these methods on references without requiring an
explicit copy or move of the value.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 1be5ecd814d3..deca2999ced6 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -260,26 +260,26 @@ pub const fn from_secs(secs: i64) -> Self {
 
     /// Return `true` if the [`Delta`] spans no time.
     #[inline]
-    pub fn is_zero(self) -> bool {
+    pub fn is_zero(&self) -> bool {
         self.as_nanos() == 0
     }
 
     /// Return `true` if the [`Delta`] spans a negative amount of time.
     #[inline]
-    pub fn is_negative(self) -> bool {
+    pub fn is_negative(&self) -> bool {
         self.as_nanos() < 0
     }
 
     /// Return the number of nanoseconds in the [`Delta`].
     #[inline]
-    pub const fn as_nanos(self) -> i64 {
+    pub const fn as_nanos(&self) -> i64 {
         self.nanos
     }
 
     /// Return the smallest number of microseconds greater than or equal
     /// to the value in the [`Delta`].
     #[inline]
-    pub fn as_micros_ceil(self) -> i64 {
+    pub fn as_micros_ceil(&self) -> i64 {
         #[cfg(CONFIG_64BIT)]
         {
             self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
@@ -294,7 +294,7 @@ pub fn as_micros_ceil(self) -> i64 {
 
     /// Return the number of milliseconds in the [`Delta`].
     #[inline]
-    pub fn as_millis(self) -> i64 {
+    pub fn as_millis(&self) -> i64 {
         #[cfg(CONFIG_64BIT)]
         {
             self.as_nanos() / NSEC_PER_MSEC
-- 
2.43.0

