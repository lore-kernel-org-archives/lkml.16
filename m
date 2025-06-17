Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAE91F5847;
	Tue, 17 Jun 2025 23:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202492; cv=none; b=Rm1UxuCzQqg2qLLgJ5pXm0FHu+HRV4m4TvXSXVGCkmziH6+aHk6UMMS3L90wB3969M1RFTC+Fw86bw98fAcgEFZNX5BH/bEAN8/83l8gzoXr6QlB+1vE5tVKq0ILqRTIrG1xGYb476fqEAHhz/adWQushsdlU+x9vcepbvf5QQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202492; c=relaxed/simple;
	bh=dIXo8Jh9lHgvtAAOQ+xyBj/8xgQnccwPS7hc4B9HsPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQQvD5j87GuSHQ5js5rbl0GQUM1SYf0B3BMh3R8anRCIwh/+PgU1/fnZ8ouLTDMsCZBy+OVNpN6BY8iWQeMVXdyibxge9EKpffNLxwDhY3cUSiuRifh5Pj1mVNu47fQ9XQ4zr4WQz0H/4gRblaGvOPFXT54bFcfTu5+eSZTDSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIMaLpKS; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIMaLpKS"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31befde0a0so694560a12.0;
        Tue, 17 Jun 2025 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750202491; x=1750807291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pg2lwL1DRs4BLKUSm/jtW9UL/QTcCQRXZGgPZKuLTP8=;
        b=LIMaLpKSzl38rMF04VAy5C167/Ze2VWGH6b+3kirpRJlYgCpvKr5lkGId++DLVFn/v
         YuughnciyJZD4pSc1rvq6UmmCjhQBvXT0ps1tdwvayyYUmXeKBjpguUb3R4wh5dLufwG
         9aINNyQHYT2CJIs/jVtHfq0tUFi2CgKsH78FEWlSZXj6wps047fM17GuObDcB7S72DYu
         WUSAGpn7YY1vUeXmHbF1Upz7AKDtS6Ggydpzxrg41MRW18Md4X1uyboTypohi193LYZJ
         xx5iHA182tbZ9QfpY9AXONJOccgIXKjrPDXEF6UDgGkn7msQZpDoe+dQyr+/g7PnE9CN
         PJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202491; x=1750807291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pg2lwL1DRs4BLKUSm/jtW9UL/QTcCQRXZGgPZKuLTP8=;
        b=QM15pcsZtoKpGdSdvsbAiDK4OOAyfXyYcnFsZoInbBSnFcTrrS61APOJwWYk6XTbG8
         PwsfqGWWyt/mB0+XS52Ex/+D5SCcOMZfZfeHTqff8XmRmo9Lf0ApZa+8LpApr5fJgQ1R
         sR+JN9BOlza2+lC+wzstl7+ZYy300bjF4ANFlILXH+wIxx+je0XVgXPIJiI6uwCRQHs4
         3MAJYbr/lM5Nc586R+hLuCtholuKPg/oIQ82r3neb/aIT+5CFJ7nwlGm9bbC4SK397Du
         I8ez42iNrdv2LfbA/lrH0ApOJzF2HWxpw8v9ykLxbh9G5yPZtdVc8sgF96+U3rOWN+Oj
         Teqg==
X-Forwarded-Encrypted: i=1; AJvYcCVJn9l7V+BZgfeZHxR6EdacwIzBFGy1dJPsQr8/qHT6dCGvM4qI/igeTFLPs+arHwJhPeOlfebLdVZu8DhXAAA=@vger.kernel.org, AJvYcCVbokGuGZYY25kC0GY5GjEtz6Jmf6mKQuBE6/EaPyuTYgBSJ86wj1KHNWdpe5JmeJvPxSi+xDO7gmZb8UY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GJ2XceH10Zc3Du3WycYpNeVTC+xR0efg5BD3XJMCgRrzZHxZ
	Zk1UUnRBAq1XGbVd26H7PVdfgDJOopTZpvVTqS8W269eizQw7i+SPjsM
X-Gm-Gg: ASbGncuIcmYC+DM8xJjo+A4yyRU7zNk0Ig6VwZiyHor+vVSN+86ccw/5SWKXzlwvE6u
	Eyw9zhjPBsO4zR1n4bBOVJdyOBrJSaUxxL9TKuTizCFJ7hDdvVmknpq8lsvKJDSZ3e5J5mr02lF
	GBxe/SESHqZRzEMfYC8i9m1BwZpICUSlyt4z5AZPA8GAkPw0zNmx0wlpIUfrXjdYD2RXhq+Juum
	4tYlhpStkR2kbwiyV0fJqgpj0bZO0UhPMih3IcDN3n7aiF6mUv1HmA2ZnXc/eocmkKE/ohZ+zXl
	/8DyWxtjsE5Vbf4Uevnft+LLFAUtWnQF8i/4T5M6tHWkM5ziMhWFHgn+T0uX9hczPnuT65OkOAg
	ZQbQYq9LZHc3/FYcpCNmwiP/uZMxvagHau3J9n2PZBdAP5g==
X-Google-Smtp-Source: AGHT+IHyMlm/OsbpHdYanLvTD/UMCJ4Rg06gvq7ckAZg1PHLH827XqnbgqbHPllKZv//pFDPCsxK9w==
X-Received: by 2002:a17:90b:3806:b0:313:f6fa:5bb5 with SMTP id 98e67ed59e1d1-313f6fa5d2bmr23316153a91.18.1750202490616;
        Tue, 17 Jun 2025 16:21:30 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb4d44sm86249985ad.189.2025.06.17.16.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:21:30 -0700 (PDT)
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
Subject: [PATCH] rust: time: Seal the ClockSource trait
Date: Wed, 18 Jun 2025 08:20:53 +0900
Message-ID: <20250617232053.3927525-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent downstream crates or drivers from implementing `ClockSource`
for arbitrary types, which could otherwise leads to unsupported
behavior.

Introduce a `private::Sealed` trait and implement it for all types
that implement `ClockSource`.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index eaa6d9ab5737..b1961652c884 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -51,6 +51,15 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
     unsafe { bindings::__msecs_to_jiffies(msecs) }
 }
 
+mod private {
+    pub trait Sealed {}
+
+    impl Sealed for super::Monotonic {}
+    impl Sealed for super::RealTime {}
+    impl Sealed for super::BootTime {}
+    impl Sealed for super::Tai {}
+}
+
 /// Trait for clock sources.
 ///
 /// Selection of the clock source depends on the use case. In some cases the usage of a
@@ -58,7 +67,7 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
 /// cases the user of the clock has to decide which clock is best suited for the
 /// purpose. In most scenarios clock [`Monotonic`] is the best choice as it
 /// provides a accurate monotonic notion of time (leap second smearing ignored).
-pub trait ClockSource {
+pub trait ClockSource: private::Sealed {
     /// The kernel clock ID associated with this clock source.
     ///
     /// This constant corresponds to the C side `clockid_t` value.

base-commit: 994393295c89711531583f6de8f296a30b0d944a
-- 
2.43.0

