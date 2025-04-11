Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC8929C335
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369170; cv=none; b=pJAGM/UK2dQE2uD18dEaDboXfX1Sve21vzu36OAoSVEYELmt8f1XDac7KM4tNsaozBsaWyZjer/z25smkkHLI0wJpQ2tVdw+xGxLcCxlQkvJtECZA831PHjPKr8MFoTR4MlfLaDQyNPN/UVLRawnRvH2Rg1VEyIuoHO32lB5YjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369170; c=relaxed/simple;
	bh=TASzFe4KkdQHPJ8mONPPBe7339nuUPyow0ze0CYWoKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JJ4pkCLUhZgqoHHIgCwWTZEdOprXrbRgN5jEavcdQ7t+f80JaloDvqD88HZ/OJo65Mus/6o03EUHlBB0MrrFFaPWDSDLNIMiaDPLPGVQIOWFW34TqPzLfRWJt22HNRvZHqcOS3clrW48UjbcHvRQyKh4z/tpWTBLouJg/wreXeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3n0kt4+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3n0kt4+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7394945d37eso1621904b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369168; x=1744973968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Fe6e6xig4JsW2EGU2g8ZB0kG+/KOTdn8cRbvkRNqmM=;
        b=K3n0kt4+tsBhgPQDjeYpEsgY82h0BwOkKS9GYFosDQFXx9SaDf26mELPVZ23lIvs5w
         9k9k5a31eUpV9FW8HcpM/lUs4mQ6VKxPQ+m5qJmYsJn9DNKleGEE6H67olRcbLjDpDjq
         FRy7C8QlCuzfseYIg29fMf2MS2gDXzDz7Na6kDdaFChKjk9o6XzDlZcqafc0yvgYbrkH
         mXYVMDf1mTM1DtciM55aE5EpDn0/vo3ay+0kozZJSgxDrQtrc8Q92t7B5YNBtlsoIX8B
         1BfiodGle8E1kasYf7fB6r+GYUbW+lMjVzbBAG/yijXXWdh6GJs6v3qC6aZm1B0kyKB5
         IcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369168; x=1744973968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Fe6e6xig4JsW2EGU2g8ZB0kG+/KOTdn8cRbvkRNqmM=;
        b=OGnOPa2Q9s89LnW8oO3EvhpunU321y54MTlEpqtxFdNmj+/uG1dxYvivoflqnV5X0N
         gB6IZ6kEY8JjxUEg4RgzboilPv0QHaArDR+Vyef3JQNrQqipEnVdvMyzvUqsIpciY5uZ
         fSYBVgxLDqiRD6HxUO9TfI4YM/ASQOYPS/DEXjAwySZiosRvnX3CI1U3YDHhWumNbh3I
         BLIpjEnq8Ej+pnZdTf5XTwwzD06Oc0Oa1b6BhrAj/o2E01X4fIICWeTqaGqGnBaiEr38
         lrCPT97xEEPNP0udhNObDi5L8GRweyCaqkUIpZY594zvQdo4YRBT6sJb0IfUw3Yz3mJI
         l9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWu6hOEBLaIAoDYT3y4a7SNiiY0+/lA5q5aw7YdsK9gTXYmJ85XORiLRZxTPzKy2vW2DABOpHwNrflAX8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTuE/vLNSuE9NW5lLnufHZHO8BPeqES3dodygguBL+ZPjRh5N/
	gqSbbyzPlyBueN7FfobpHSEFLCIqJN+QicgQWtzqji5y5HmvkeV6N/AeBWXPVXc=
X-Gm-Gg: ASbGnctASRRCU2c/ignnx7Pak0irH8R3lKyR64HxA/ZDXR4P3XgRmNdkTCy0JzLLGah
	ohtrJtsGrPbqaWKBEA1qJv8FNpmGPJlUM+xAsPlr3axt/ixbeglQh3X9HvBRL7x0D1/1GVD+qVM
	iP9P8aAosAK/JnEMM0/bdiqG6LInFVpI4DKxrAJHQjhUxYACera9JtLTcTRaR7zaeQWPGhknvig
	+kqtA1OWVouziA0LgE79YNFxoiqQTc1gLEP3+X2PYilKrtdwtHnnwi+RgbzmauXunfC7/NSHk3I
	sYV9VwsiNw5EPkwiGD6hNy8Jg89k04rULiOR+4mhB+pmd01m9MNF
X-Google-Smtp-Source: AGHT+IFkRCEV/NTt2biHw/E1GMU+IZP1L1H7t9UuwWWpn6sRLxyupr9IGU4747ikedGlYmnFckPnWw==
X-Received: by 2002:a05:6a20:c6c9:b0:1fe:90c5:7ceb with SMTP id adf61e73a8af0-201799964ddmr4296796637.40.1744369168283;
        Fri, 11 Apr 2025 03:59:28 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3abffsm3792427a12.48.2025.04.11.03.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:27 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 08/17] cpufreq: Use enum for cpufreq flags that use BIT()
Date: Fri, 11 Apr 2025 16:25:07 +0530
Message-Id: <efbdd8212a90175c293313de961c34d13b9f4b43.1744366571.git.viresh.kumar@linaro.org>
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

The BIT() macro is too complex for Rust's bindgen to interpret as
integer constants. This results in many of the cpufreq macros being
undefined in Rust auto-generated bindings. By replacing the "#define"
macros with an "enum", we ensure that bindgen can properly evaluate
these values, enabling their seamless use in Rust code.

No intentional functional impact.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/cpufreq.h | 96 ++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 45 deletions(-)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 400fee6427a5..354ae35fe708 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -298,11 +298,12 @@ static inline void cpufreq_stats_record_transition(struct cpufreq_policy *policy
  *                      CPUFREQ DRIVER INTERFACE                     *
  *********************************************************************/
 
-#define CPUFREQ_RELATION_L 0  /* lowest frequency at or above target */
-#define CPUFREQ_RELATION_H 1  /* highest frequency below or at target */
-#define CPUFREQ_RELATION_C 2  /* closest frequency to target */
-/* relation flags */
-#define CPUFREQ_RELATION_E BIT(2) /* Get if possible an efficient frequency */
+enum {
+	CPUFREQ_RELATION_L = 0, /* lowest frequency at or above target */
+	CPUFREQ_RELATION_H = BIT(0), /* highest frequency below or at target */
+	CPUFREQ_RELATION_C = BIT(1), /* closest frequency to target */
+	CPUFREQ_RELATION_E = BIT(2), /* Get if possible an efficient frequency */
+};
 
 #define CPUFREQ_RELATION_LE (CPUFREQ_RELATION_L | CPUFREQ_RELATION_E)
 #define CPUFREQ_RELATION_HE (CPUFREQ_RELATION_H | CPUFREQ_RELATION_E)
@@ -424,52 +425,57 @@ struct cpufreq_driver {
 
 /* flags */
 
-/*
- * Set by drivers that need to update internal upper and lower boundaries along
- * with the target frequency and so the core and governors should also invoke
- * the diver if the target frequency does not change, but the policy min or max
- * may have changed.
- */
-#define CPUFREQ_NEED_UPDATE_LIMITS		BIT(0)
+enum {
+	/*
+	 * Set by drivers that need to update internal upper and lower
+	 * boundaries along with the target frequency and so the core and
+	 * governors should also invoke the diver if the target frequency does
+	 * not change, but the policy min or max may have changed.
+	 */
+	CPUFREQ_NEED_UPDATE_LIMITS		= BIT(0),
 
-/* loops_per_jiffy or other kernel "constants" aren't affected by frequency transitions */
-#define CPUFREQ_CONST_LOOPS			BIT(1)
+	/*
+	 * loops_per_jiffy or other kernel "constants" aren't affected by
+	 * frequency transitions.
+	 */
+	CPUFREQ_CONST_LOOPS			= BIT(1),
 
-/*
- * Set by drivers that want the core to automatically register the cpufreq
- * driver as a thermal cooling device.
- */
-#define CPUFREQ_IS_COOLING_DEV			BIT(2)
+	/*
+	 * Set by drivers that want the core to automatically register the
+	 * cpufreq driver as a thermal cooling device.
+	 */
+	CPUFREQ_IS_COOLING_DEV			= BIT(2),
 
-/*
- * This should be set by platforms having multiple clock-domains, i.e.
- * supporting multiple policies. With this sysfs directories of governor would
- * be created in cpu/cpu<num>/cpufreq/ directory and so they can use the same
- * governor with different tunables for different clusters.
- */
-#define CPUFREQ_HAVE_GOVERNOR_PER_POLICY	BIT(3)
+	/*
+	 * This should be set by platforms having multiple clock-domains, i.e.
+	 * supporting multiple policies. With this sysfs directories of governor
+	 * would be created in cpu/cpu<num>/cpufreq/ directory and so they can
+	 * use the same governor with different tunables for different clusters.
+	 */
+	CPUFREQ_HAVE_GOVERNOR_PER_POLICY	= BIT(3),
 
-/*
- * Driver will do POSTCHANGE notifications from outside of their ->target()
- * routine and so must set cpufreq_driver->flags with this flag, so that core
- * can handle them specially.
- */
-#define CPUFREQ_ASYNC_NOTIFICATION		BIT(4)
+	/*
+	 * Driver will do POSTCHANGE notifications from outside of their
+	 * ->target() routine and so must set cpufreq_driver->flags with this
+	 *  flag, so that core can handle them specially.
+	 */
+	CPUFREQ_ASYNC_NOTIFICATION		= BIT(4),
 
-/*
- * Set by drivers which want cpufreq core to check if CPU is running at a
- * frequency present in freq-table exposed by the driver. For these drivers if
- * CPU is found running at an out of table freq, we will try to set it to a freq
- * from the table. And if that fails, we will stop further boot process by
- * issuing a BUG_ON().
- */
-#define CPUFREQ_NEED_INITIAL_FREQ_CHECK	BIT(5)
+	/*
+	 * Set by drivers which want cpufreq core to check if CPU is running at
+	 * a frequency present in freq-table exposed by the driver. For these
+	 * drivers if CPU is found running at an out of table freq, we will try
+	 * to set it to a freq from the table. And if that fails, we will stop
+	 * further boot process by issuing a BUG_ON().
+	 */
+	CPUFREQ_NEED_INITIAL_FREQ_CHECK		= BIT(5),
 
-/*
- * Set by drivers to disallow use of governors with "dynamic_switching" flag
- * set.
- */
-#define CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	BIT(6)
+	/*
+	 * Set by drivers to disallow use of governors with "dynamic_switching"
+	 * flag set.
+	 */
+	CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING	= BIT(6),
+};
 
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
 void cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
-- 
2.31.1.272.g89b43f80a514

