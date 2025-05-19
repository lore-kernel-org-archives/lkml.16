Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F932266B5D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638471; cv=none; b=iXXoPfgtCFacI99/rVZd2GdgTg51tQtlUOghZYqmlMcdphY79GMgKubpC3+ZZ59/YJTXLTIS2TGisjd8+DhdUADqQM0r8QRnUNdZ0HsALpHE7D6Hc+8+e/BYIE7ghJ4Ftn3ZUzCm7MnurItzTbg5Qa0nqpXkwgXaugSMHhSgIIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638471; c=relaxed/simple;
	bh=oF63t+ak19BpgsJzIpsjrXfi+NV5+mUyjooqlBcukIM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oNcW3M0JjcCMiPDoX1Fj18w8U2PKb+L3rRc9/hjTfhXlyGp3++ckXXtj5TRWBoj7XhVX5AYk8gGzGt9uoBcvyzTsSrYn7oZI9NJJtYUWzK0+ifdI10ps8Cw1t4tyxRDZfAoIxgeh1LxWYLE7batEQ4KP0/hK9d+DVpzfbrDfA08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LViOgfsz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LViOgfsz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231c86bffc1so39203195ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638466; x=1748243266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVn0xPDTBmI2fx/iE4ainR18Kbcm4bTM4VkXhqSdQK8=;
        b=LViOgfszVsHYWxQmmtaKerbiCNH0mn6ezN9nrJsgSEh3wG3ww9LOV6Naclk6BXwtnw
         TrU8IwDJlIOm1GnFZYyQ7khCjPUQk/zj5ikiyjAVosOdv9G2W+xw61VXZUUQijLyJXIg
         939WDszfodpLA++4lpRsdunEgLaKCVN6p4NoDGOkDuFcMUPFVUFUQGHU+X6GdIXBV/Nl
         QSxyQegCUFXZ4DcXAEEy8nOcmtbFl26R0HHp2TdzP4ntargJWoAZ0rXFMlkT9CV1AgmR
         RHJVmwGrxK7FswjYwu81Z49SA9Sq6M3Wq3cZiXEy64mmxblCOl54mIAwy3d/ADNdWVLl
         vAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638466; x=1748243266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVn0xPDTBmI2fx/iE4ainR18Kbcm4bTM4VkXhqSdQK8=;
        b=KNGZRC4SyB5re1VY7UKUPOsDAclEYR3s8SHMPu6P3LVzVJscSULhYA2sedzcyQBhGs
         XF7YksXGUbYOCUH+TYMhNDBFWYqEYF++FPMIRZTB9IKU4TZ0TwY4xEeYG4IyF9aLVPIX
         xYQybLunGTID2uv69AbNHA5Y/x3Ihv/cQ2XNZUHpl+m6bEAV0u1xL6bVJK1tSOaAjok7
         tQIGo+jBivjD32Yh1LQrhbw2ggmmezB2Lr5JICUhIkK6M6/arMxycPuOPSU7Thl2yT+u
         PTMU60jc1qAApA7aVRACMyR/6RqHhJjJ83/OmgqYwwBFhK1KgeMlLB0i/xbV8gkD4N8h
         aeLA==
X-Forwarded-Encrypted: i=1; AJvYcCVnVPkYV8M7S2RVHLByPXcdoCBjJ6XU1PZkQz20azFtzaLoU5dgc7j+EnbkIzaUUVuL6PZoCn3q1vSAWrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRBuZJ7cIU6pddMzBBmzfRYb27Hx+e9ucGgFiLEbeNplhkel0
	zUGPor2FEyh+YGxZKOqAnvrX2CRtEMupa53LO0vim8XntTMCI0fE7kwjwgP6R0FQzLc=
X-Gm-Gg: ASbGnctmiMDTEXRXGVHb7fMFOa4EJPbwFlza+mWyKZOmq6ezBGfPReGoCQE5VPl/Qi7
	WsxcWHaB5qbLjyrYl6l4pCdpkLJybFNpt6DLvWZDwKeVjG+7yYyc1dY+C7JT80RnlBZ+pRK5QTL
	STj4koFxQaknqby4DuMuXvS0xrp4eYKjuGrlgBjAcU5M+jEkA4fgI5u+CJh/TvPnWH+Uf6R1sSK
	+SSyCUTdnXhwQWvqvWFVMniDJXyUN4+l1G7/AqALGYAUiUXvpwainsj3GwKOawMaEjrt16lpqgk
	HGnjLRj6/c5Wshp3h5MC3L3eyzsAOWAPp91LyTIQo72kfhk50ScW
X-Google-Smtp-Source: AGHT+IGvRu+V4HoqAZDkp13c8s9rr5ud0+/U0brM05Z8wTvCrpR8/as4fHNNVbCsf3eEwlXoeMdK9w==
X-Received: by 2002:a17:902:ce8f:b0:224:c46:d166 with SMTP id d9443c01a7336-231de3ae584mr173011935ad.40.1747638466407;
        Mon, 19 May 2025 00:07:46 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed897asm53052705ad.250.2025.05.19.00.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:07:45 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 01/15] rust: cpumask: Add few more helpers
Date: Mon, 19 May 2025 12:37:06 +0530
Message-Id: <0e085055a3de84550dbe478ee95851e18b2bc5a0.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add few more cpumask helpers that are required by the Rust abstraction.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 rust/helpers/cpumask.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index 2d380a86c34a..eb10598a0242 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -7,16 +7,41 @@ void rust_helper_cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
 	cpumask_set_cpu(cpu, dstp);
 }
 
+void rust_helper___cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
+{
+	__cpumask_set_cpu(cpu, dstp);
+}
+
 void rust_helper_cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 {
 	cpumask_clear_cpu(cpu, dstp);
 }
 
+void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
+{
+	__cpumask_clear_cpu(cpu, dstp);
+}
+
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

