Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5852F5335;
	Tue, 17 Jun 2025 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202980; cv=none; b=u7raAIFTogCGzperg4wBORzRLqFqncZVOJ+l5MpW2EeyFoVk1rJIOaPq421LnflgfwIUgtUU+woNFgz9iCYT4Ol+vLleDRrRYnzKIUX9PxLO2BPnJKnWD2CoUYI2C9uFy4xJ88942KlF67q3NNlpulPKPjJ4rOJS/HTfYisGxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202980; c=relaxed/simple;
	bh=8t1mB/mgV8e/8qfISdH1Ze3bfcTHlNZSdYZ9RbyA18U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MvUTmP0PCkm5vjsZnxmDnZjEByRdTNU2/rLda83fhrLCsa6LJ72f4j+3+mZPt8w5uJWMYeEOQTz/KBE56NcfNhB8mnjohsIOS05nyTO6yrkoRpZ4mUCy722bNaTOnN30HK3tKLqqDbbmIvkGyluYFLetf9oX8NeKaY/wg/ottu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw6kUuir; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw6kUuir"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748d982e97cso948078b3a.1;
        Tue, 17 Jun 2025 16:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750202979; x=1750807779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNIDHhnv9doUvg9cx6RuqDmMskROWntJd1+wocEwBXo=;
        b=hw6kUuirgPNfcZgg4T4+84NwBLee+3k6jZSKJydJMHw4xTJ2FHX3cGzFtGTO2PvY/q
         wlqpIQujdgDLBLsaP7SZ5royB7SnoMQH4sdGXAgCDkUkffRTidUVWlj3zkn/e82GwjaV
         lPW86s4uwsxKTUGE69fQvu5RebmkuL+7nZleUiv0aHaffsvhZCUP1rDLJJ7QMbIo34HF
         xQ2QTnwTwroLz/Lu4cXfoYqK9iYvptXDRvW860xm6/GdL7f8Z4UHmDaEKisrKh2AUml8
         GKogjd9FjxkyoZqP8rTHbiczdq1+k2AEt7iwOkFpfkHW2tpuYarfFULX3y/IjNilpKxY
         JFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202979; x=1750807779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNIDHhnv9doUvg9cx6RuqDmMskROWntJd1+wocEwBXo=;
        b=D9ytjSzpKu7b3VtlUWAOGN+I2OxuV1/dGfkt5JvN+1ssFVpK/E4cZj55Q8jLdekaj0
         8QrdYd1/H9ylGUKMo/WhAS1MxJeT+Lkud0m+pyhh3DIZgZBojb13vJASQZYWVAwb2nN8
         jjy1KJjWwiZQhHW1nxdeQbi0GPvpr/bX+rDOuXyCMYL7qmW6Pgi/VOffabwZ1tj/N0Bk
         lYzos1WgOiodRUbM38xuYM1fSnWbCJdp0TV9wfx8mEMq4yth0VjeSUk6NuRz5AZygW5l
         fcqKDuH4M2mPSmABN5QlD9LW5Zexy7eSKwtB+9qqGLvcUn3k7Emvbu9GmmgP7pfSBKsa
         CBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvmNqACxJBYnjsQwknVRzpmJrT4HwfXg57cPJT9AQBlbNQzOPfMyu/HTBvBJdJJlharw8PbRKBgFY5dejgCGY=@vger.kernel.org, AJvYcCXjGwmswG2Qlcv+C3cdWIwplpLvVYoPUxoOF6tJhH32WboZ8WM0P66eSRU6WnzN7jE9iMLfn43y0S6QN3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqjhGqA6qjabj3DHYXd5BnojQL7Rp1w8pU8JN0m1WR8Ri/jMtz
	uF/TDINVcPr+1/rjkoUtRBtCNQ+ssQhqsZCFFyh8h7AJddMhtSCoWukB
X-Gm-Gg: ASbGnct7ns9yDQhwxx5WYneAXQB1UHzlNfVrLNPtkQglLfJgAtEofbXHAaiKARZ/gP0
	8isv+qKtILlUnN6+r1AUr4136f36Gce2oU1mV1bwTbPKIjS4EPLkbwiuFddKmlaz99XrwCEhPqx
	5QrzRGXKVs0hDC0dyN4fic+C4KvDQBUDH+YdvNs3kyR0BVoa+AtK7a6gXQVFqd4Rliro2/ydvY4
	XpTJWNzhQMpXA5QD9KyPqlcyVThTW1O/945eni1Wk6Yz+T4HQj176mO3gOcWbZ9uZjVDet2DXen
	+NU7mF1PrOYK/10/sPKxRMlaaREe3PCHkVHTf60fBay8QEnS/ZHxb4StLlZtBayyOMLf47INuoG
	JE1/MP0wdoM3aQZrj5i8BTlOzVEXbW/h3NnE=
X-Google-Smtp-Source: AGHT+IHs4ShRbtM3t0L4J4qA8ksNddh5BMNwMcX2t58SXOE2k+EUb9qon2Gnr7TxpbW8rIQArxupng==
X-Received: by 2002:a05:6a00:3a06:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-748e1e475a6mr2020758b3a.22.1750202978656;
        Tue, 17 Jun 2025 16:29:38 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2e30sm9499933b3a.128.2025.06.17.16.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:29:38 -0700 (PDT)
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
Subject: [PATCH] rust: time: Seal the HrTimerMode trait
Date: Wed, 18 Jun 2025 08:28:06 +0900
Message-ID: <20250617232806.3950141-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent downstream crates or drivers from implementing `HrTimerMode`
for arbitrary types, which could otherwise leads to unsupported
behavior.

Introduce a `private::Sealed` trait and implement it for all types
that implement `HrTimerMode`.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index a6468bc50e57..0028720cb4e9 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -442,8 +442,27 @@ fn into_nanos(self) -> i64 {
     }
 }
 
+mod private {
+    use crate::time::ClockSource;
+
+    pub trait Sealed {}
+
+    impl<C: ClockSource> Sealed for super::AbsoluteMode<C> {}
+    impl<C: ClockSource> Sealed for super::RelativeMode<C> {}
+    impl<C: ClockSource> Sealed for super::AbsolutePinnedMode<C> {}
+    impl<C: ClockSource> Sealed for super::RelativePinnedMode<C> {}
+    impl<C: ClockSource> Sealed for super::AbsoluteSoftMode<C> {}
+    impl<C: ClockSource> Sealed for super::RelativeSoftMode<C> {}
+    impl<C: ClockSource> Sealed for super::AbsolutePinnedSoftMode<C> {}
+    impl<C: ClockSource> Sealed for super::RelativePinnedSoftMode<C> {}
+    impl<C: ClockSource> Sealed for super::AbsoluteHardMode<C> {}
+    impl<C: ClockSource> Sealed for super::RelativeHardMode<C> {}
+    impl<C: ClockSource> Sealed for super::AbsolutePinnedHardMode<C> {}
+    impl<C: ClockSource> Sealed for super::RelativePinnedHardMode<C> {}
+}
+
 /// Operational mode of [`HrTimer`].
-pub trait HrTimerMode {
+pub trait HrTimerMode: private::Sealed {
     /// The C representation of hrtimer mode.
     const C_MODE: bindings::hrtimer_mode;
 

base-commit: 994393295c89711531583f6de8f296a30b0d944a
-- 
2.43.0

