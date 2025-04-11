Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F8B284B28
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369148; cv=none; b=nFo73inZ3hxEUhAcItaeXyqqefvLUXcdfNLNZFAkb35guIvXUAMi+im5dxAKu8pZv1PQ9lRw+wkoT1k+cbsh8rm+8QzfYh/TOlUlOIkCuKOFO5ohi+Nu9xKnvrbg75R1QmQbcg53I+Ish+c5Z6EoEN3vXmnEbD/C7tzwHj8gWdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369148; c=relaxed/simple;
	bh=Lz8/dlHquQs8+KgJWlTHfeHGDG+b2IGK2cF/V+dR5o0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ul8yJLgmIivDe/F72MkENtYCDVUnIOwIRF5jVD7NR66V5MTZw+gudGbYqHfBlRgHCpKjmFkifxe0q3BhTG/aGzBnulq00kGo4YpEFoUVsWlMnl0JohFjBXn1dxzCFFYZXVzbuKU8cQNe/rMP4vYpxwXnDqB06BaR+K/Oaq8dQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/nZ8B7W; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/nZ8B7W"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so1435174a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369146; x=1744973946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cw314qO5OzgfErL/PQP5mXU7cjPJv+CNURyMPhNy3E=;
        b=V/nZ8B7Wdwc5yzPo3fPLqG5IOO865KEst1zoHPUXvJ4QQlfc8rjt8umE16XlMn3Mt5
         T9X0uLWMusDiVzg0QekAxOPUQuIcRKz/85VN6iwzKfRxo1+FwNjiy5nAldDtRltkDYoi
         gwFldS1ra6iLBAEyOUAamPAjqyKqCKxGu+NV6eINHAyTCLjYNHXAcyu5n4EfoDDuaW1I
         lqL1WPq6/Ek9Uo66w3uprsx6N5DTIdqN53cNBGNIXQiguIKPJs73ATFTMqmTjlV7oaYd
         jyipxrQUrhbSsI6XAF2X9mArcIksuqUm5TXo6KFVrZiOMyXwXgIwvHtZ/XSe/RA23zAI
         8a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369146; x=1744973946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cw314qO5OzgfErL/PQP5mXU7cjPJv+CNURyMPhNy3E=;
        b=pRT+7sTsiW+pOVHyKw96wWG8jWncvoSOUM7i10pRTGO029t/28SRZ3tXIa8LJOyopK
         VjFWk0FexFqRvFHcygkZfFllBmpPXhinxE3irJIJUPuUCF4AZRogbBhmY3ZYSLmr+TQT
         GqQc4I6JyBmLH5lffdNG1dPEdHx9ZFBOcKvATRYbBi75uzY/bsdARr0qt9NwOfGkWvFr
         kHJdpATAm6jDKU5JVLa7iwRovMybbAVgHF1bOKaNO+m4RAtG2sw7fLcr0Ca3sNdZsgp1
         i1VBWIaaLdSugBx/2zRzFZUs7YdaFsGE8nGO3iw16ktnxiosDdh/txZQTtNN2N9Frfd2
         6KTw==
X-Forwarded-Encrypted: i=1; AJvYcCUI00RB4AoyDYPNonEuQimwR3WQRbJ6x8TCRAQ0pyycwobvvnFUrfXqLZsPkA26rNz2JWcP68ZZIO0lnmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy7wVh+TWwgvYJJcCatqUKvGGfhsShQHRr72IIineYebdeyL23
	Un24JgDHFqy7K1FeqbT6qTmr1AyFsbvVRDec1FQoX5ZD6WyftCvRtBEOOJAsXa8=
X-Gm-Gg: ASbGncss2Rvggoydabmcxg7NfbVx7Zld0nlg5Ky59CpYQGeh0ueAv8g+BL7t/aWr7DU
	FtIkJgRlQsja42q/LV72cvLmE7Bb24FOylkGMbjTyAHjYgytr4Mvj92+mOxOB/o3rFT1kObh7la
	8akuXS0o61nE6mH4MkYprm5rGN465bId/CDp/WyRhuQj99wCHXxSRF6Ls5xMBYXRBLLtzbBiErc
	xL2/gPwIlG7TZxpnXmk22ycDTld6x9NB2aIHNoc2AD0YBB9e4BHyG2kL2sx3R6aGCL7/oU5yLyE
	kLdqccuqQelc5bLIQDiGoIlnTLXT3GWD26gi1IwmJdkiwirdsGtX
X-Google-Smtp-Source: AGHT+IEFxwHKqoOI4yL6xARYViMgwvtWz0BpJSZrfD87BTkTPcEYvJrbdX8FbmAvDOdGi5eq0VSwyA==
X-Received: by 2002:a17:90b:5744:b0:2fa:1f1b:3db2 with SMTP id 98e67ed59e1d1-308236723c3mr3321753a91.25.1744369146401;
        Fri, 11 Apr 2025 03:59:06 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e79fsm5408297a91.19.2025.04.11.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:05 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Yury Norov <yury.norov@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 02/17] rust: cpumask: Add few more helpers
Date: Fri, 11 Apr 2025 16:25:01 +0530
Message-Id: <878eb11f74cd320cbb06fb04c8ef655de81dd358.1744366571.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add few more cpumask helpers that are required by the Rust abstraction.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/helpers/cpumask.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index ae964cddbd41..30fc0bc0c0e8 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -12,11 +12,26 @@ void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 	__cpumask_clear_cpu(cpu, dstp);
 }
 
+bool rust_helper_cpumask_test_cpu(int cpu, struct cpumask *srcp)
+{
+	return cpumask_test_cpu(cpu, srcp);
+}
+
 void rust_helper_cpumask_setall(struct cpumask *dstp)
 {
 	cpumask_setall(dstp);
 }
 
+bool rust_helper_cpumask_empty(struct cpumask *srcp)
+{
+	return cpumask_empty(srcp);
+}
+
+bool rust_helper_cpumask_full(struct cpumask *srcp)
+{
+	return cpumask_full(srcp);
+}
+
 unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
 	return cpumask_weight(srcp);
-- 
2.31.1.272.g89b43f80a514

