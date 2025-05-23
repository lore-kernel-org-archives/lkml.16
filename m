Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78450295D90
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007666; cv=none; b=o4VlOSpKuEra7RmxMxoKYMRjJEL4mHb7W5t1Kw4peQUF3GaZrbKlim3t1+GLq6hz6BbUbhUcyhijrXodQVbTIJQ4JaPKLJWzUfqLrCvGDcU8ktzYdak/U6DeNaWd+90ivQVFh5d1VhNm3VDdzGsRAY+WKPowB4DPyDABadOCsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007666; c=relaxed/simple;
	bh=k1WDqYJlMC23mNs1HIwLVzoqt5ssM4IDpkVZTQA6i3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHErfDLjmzmqCa8xM2zK5QTfRgr5ekJjdA6xV6uRB8V6AGoDCajg1TGS3EqbAXBvA4GGgesKfzkNuvdnsy9gkSYMmCbxooY4lR/Mvp9RJ2WAuEvmhSZ1HlCyo4vrfDGSRWE7bg3nesdQnS2A7i6o5lJ4oH2LKY1zI7F2UE+Y9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tgp1GeKJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tgp1GeKJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad5740dd20eso942368566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007663; x=1748612463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUC/L//rK2/TTSf1Dzin38jZuZ6dxi7JPqJ0cw7AoiA=;
        b=Tgp1GeKJ1hwGxWrxPdgkBnuQAc7yT/F1x3yfA3W3tiKHaxn9LrcRBS4MWETWkzRfV6
         +LhpPvtMZGR8qAiN8hWYWyGCAnAxLmgniiou0N/R8gEjKzpdlUIb/VVTfYt64FYcAH6N
         PYZOLhNjF36ypV/K73pRCH+cti50Dcb2k6KunRxSHj6QIv6NoM0rMIdGG1K+uneyeJ9m
         47QbZrtS8QkG0W3q40cgMSCtj/8+qADF54PAb6S4rFj6MpCz/1gyBZ2nFHPAIJQt4qQj
         JgcIGKqDJSyDiKALg3gh8v0tl/6k396ZUImHCc5oXMTJ/Iv0fdKG4CbEzoO+Qp31fLd1
         2NXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007663; x=1748612463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUC/L//rK2/TTSf1Dzin38jZuZ6dxi7JPqJ0cw7AoiA=;
        b=c3KWT3rq1zyuveEyQQEphU+KJ2gs1FoYeH0PjrMmsFJWZ7Tsq13OsRA91Der9eYlhX
         luZdrbnKO+RwN9/uGb3dTIERlPah7AtSA8fWlUegaH4leblrWEaR3kNgwcmRZqHmnS9r
         KGhLEA+qJ7ulv454d6bE1qjeOhF6RLLQ22x9Ql8UBhzDKAaU40wvHcK1v1Lb8Fc2OTBv
         8GYX93j6vbza0kVw7xNKQdPpMMRE4acKiRLDtLS62BYGQGB74zn3O/B5zbrXbFiKW2w+
         +k/30XDY45GRTGQ59T69ijggHsOQuDr5ltPMJMySq0bpr0HSWYYsNqLGFOkw4hI1/VSs
         e7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWRDWuhtUsp1ZWvRaFa0F5uIc09Hc8oeYGTntcdMhU5udgSCxiq+Qobr/1pNxtPtzPi6NcMGuUNOHBYLY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2H8c6WnNRjeV1A3hm5FZd6KlZ7mGruBzEcxfSnbQCp4HZ6jyI
	x/FrbSo7IjX8+lfH66LKrgtGDOmZkB+dOE+eDHzt4yN1p+V/nR57uE5EGwFXjZ93MON6vlxM5Ub
	YFWa9Uy0=
X-Gm-Gg: ASbGncs2rLpU9+uhhysT5zTOnsA14Fbbj/s5qqp1jdxuepR6eE5hVeEDpNyEW9QcJo0
	JuHzOBulX0qeqZaf/nj+vK0Zio5C2ReylvqWIUBlEaGzL+ACVYFHtrAxn/nV8U6+q4gxV8EEuMV
	S4+cSPZbADnS6d/AE5OJRfcVWtxOuvdLWcFIHEqSV6mF6cUmq7gmEJsHiUjVlFz50Z+vQyX7CfD
	YNp9lZrio3q5P1KPIQDotf6TBFfhyD+zzqdU0YuUXDgLPJPQJTZzI+jznlYdhZHAbMBlxcf+wiy
	BBrIgV61Fq5a+Ib0MvkQegb+KZ+0DnTNp+ab5p2DyMqlr0IFHomMWbgeEjZsaiEt0FolQwWXBL2
	aBCqahBJXB6Vz9oEGAZwUMhgz8w==
X-Google-Smtp-Source: AGHT+IEHCYkYuWzR0+7rN1lJlnWJY9YunsWGOeHigvX1kOvGZwTPmtXZLbWPxdIRTzInet0tBxzveg==
X-Received: by 2002:a05:6512:3d1d:b0:54e:90ce:3c34 with SMTP id 2adb3069b0e04-55216ebe5a0mr842172e87.55.1748007652469;
        Fri, 23 May 2025 06:40:52 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:51 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 08/21] cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
Date: Fri, 23 May 2025 15:40:05 +0200
Message-ID: <20250523134025.75130-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The riscv-sbi-domain implements its own specific ->sync_state() callback.
Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..83d58d00872f 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -347,11 +347,16 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 
 static void sbi_cpuidle_domain_sync_state(struct device *dev)
 {
+	struct sbi_pd_provider *pd_provider;
+
 	/*
 	 * All devices have now been attached/probed to the PM domain
 	 * topology, hence it's fine to allow domain states to be picked.
 	 */
 	sbi_cpuidle_pd_allow_domain_state = true;
+
+	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
+		of_genpd_sync_state(pd_provider->node);
 }
 
 #ifdef CONFIG_DT_IDLE_GENPD
@@ -396,7 +401,8 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
+		     GENPD_FLAG_NO_SYNC_STATE;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
-- 
2.43.0

