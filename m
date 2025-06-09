Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2892566FC;
	Mon,  9 Jun 2025 10:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464721; cv=none; b=DSZDHI6SoOk7WXcIiYuvSmSClvneqtUdHcTOsob5tqnVIxUd0fwwonrG8hx4FOUivmWGCiP1ZgsgBWMIaW5VQ2cLrHGudgxPHALgJnYn7ILdxxZyalApHa6kA/bs2LHYMS0s2/OEJlq27zE2Tac4Qi/Af5tuhRrrM9UOGPquMII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464721; c=relaxed/simple;
	bh=4Kn682OxFUesQsmgthIxnTWZSZzlNxbPl6No8a41yQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=claAq1knfJ8kzklea3mqqLv41n1PoYnw+jTsA5Seh1DRXdoPVQzh7WaPHCR+SA184AEfY1eZkg0VI0aQTtPrebjazhoCHeVbS9EaBp5lPUqT49sfbtlZbeKg4ZYxETRC9hpOmXc43Px7TZya8IyixNaAtNAWDvV0IMwb5AAhYBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9mxGItg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9mxGItg"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso4629884b3a.2;
        Mon, 09 Jun 2025 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749464718; x=1750069518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/ilTrkpRnHGZHyE+5PFyCcT+FMmjC8kEuMpiVXiDPU=;
        b=L9mxGItgUT7lb7poqLYLkfxAoc/IxyVGeiFgFIfY4TU8Pnn51EM0ftocFnQXxJmxp3
         +nBcnB5Hv1iwO656uO2xyO8SDwq7/81DbD9uG7dJhvgWHnAEpDA/9QQr2+35mJOSdnuQ
         xv+0pI6h2L6fPaNLucgXNtccbcOEvwwctOVKwCQ0CnxqVcArmbqkCQj0f6UjUjTfW1m1
         DXHMgIOfcJ/s0qg+ZmFIsyEjXhwgFT1ECqgM4xO1jqKOu5Kl+u1klx/Bo0JOgpPCKcDl
         qAUHUBirs5ZYcIGAnIkobdWzaskjDUC7cOwtCNCrPtdTH78AP+tP+w0ItsS73FgvYX53
         LtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464718; x=1750069518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/ilTrkpRnHGZHyE+5PFyCcT+FMmjC8kEuMpiVXiDPU=;
        b=Rrs0JP80JRjQmmOw7HM3l40aaHPb4BOz5P3tHJhR5rRNRBEvG0IRK1YOQvfKvQmcmU
         Xk1yBH39nSMyk0uUfAmcZ2gEHpfHPxYzrBt92JEQssG+gsBv6Y5hXDkSb05peU+HRB6P
         5eDYPSsZVCOaa/SI/ql/4CzMlmNohfPjiSjXbOo41SD20vpJCNAaBwPEdwysQzo4q/F7
         +Q/xDC7igiq4FrQOtgYxJgg9FHY5vdWDxLKOwhNKZ3T1EnFIq3kbkeXf2jr/QbM83aUi
         3+3GGPwghYTEAFwhnkVU2MvUtpOnWJSnQf0tAHMlKP63u3ye4V/rEVbosbPebS+GhkSC
         rUfw==
X-Forwarded-Encrypted: i=1; AJvYcCVwTAJO6Bn0ogIH0aJ1FfJI8v/3syIX4m0I4rzBv5hozKXZ/lQf26z+okv//5bKYXw2gvgOmeiqCv4btA6vBnE=@vger.kernel.org, AJvYcCWc8jgE4AAVj8TDk4F++woGw/HGq4OAEfGa5raJH3Vl4jQHXpz0QPula/pmXLbvcAEEiubyIGdiILUOCNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdZHixTU9S3EonoPP6202/PGTxj21z6lC6DOipIf9quIJodOC
	TCkZLPjkIBXjcckt5L0bSBfB9U8o7C7ro6McT7kPHCIE1+GMVb5R5lZJ
X-Gm-Gg: ASbGncsi0IcvLzL3m44ONGrgvcJxRNcly0nGjkY06SYaOzCA8HqXZUeuf55YBM3N9IQ
	cwi+/xcSHJHmWrHb88G3Q4mPdXHdnniihz5HijkPYtUCBYYGJRGh8jel3wTKS8mSiGsRhH8rp7/
	03RTduu5kGNOMCneKqI2B+JVQ7uIywOXo96OliSvoUMg3QIhxMbVV7OITdNQgsocJ/ssIbgi+k7
	C+u432POUZt8EHJPSgqV6Hzax1N+2m9POoZyuiCaHn1EP8VJUH6vIEKThNCnxmxzuTqHA3INrie
	UBb8UZzHAW4arALlH5hWNF4n2rZr+QKrwDjLMFQXDUHRx6brIJ7AD9EDgnhbqUPcMAZ3kKsBz8o
	d1BXXlIcG+pMY9/wjoNwpcKG/GW+PJ5NlwrTpCv4=
X-Google-Smtp-Source: AGHT+IF93S62osAgCU8iXkM+y/B4uAH/U0ozR0ll8O/MbbUUfQGAHl1q7jUtIN/mAJVK3LMPXUZt3Q==
X-Received: by 2002:a05:6a00:2303:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-74827f4494cmr17975346b3a.24.1749464718394;
        Mon, 09 Jun 2025 03:25:18 -0700 (PDT)
Received: from bee.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c082csm5403262b3a.121.2025.06.09.03.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:25:18 -0700 (PDT)
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
Subject: [PATCH v2 5/5] rust: time: Remove Ktime in hrtimer
Date: Mon,  9 Jun 2025 19:24:18 +0900
Message-ID: <20250609102418.3345792-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
References: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the use of `Ktime` from the hrtimer code, which was originally
introduced as a temporary workaround. The hrtimer has now been fully
converted to use the `Instant` and `Delta` types instead.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index fe68d8de4101..a683da540e67 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -72,22 +72,6 @@
 use core::marker::PhantomData;
 use pin_init::PinInit;
 
-/// A Rust wrapper around a `ktime_t`.
-// NOTE: Ktime is going to be removed when hrtimer is converted to Instant/Delta.
-#[repr(transparent)]
-#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
-pub struct Ktime {
-    inner: bindings::ktime_t,
-}
-
-impl Ktime {
-    /// Returns the number of nanoseconds.
-    #[inline]
-    pub fn to_ns(self) -> i64 {
-        self.inner
-    }
-}
-
 /// A timer backed by a C `struct hrtimer`.
 ///
 /// # Invariants
-- 
2.43.0

