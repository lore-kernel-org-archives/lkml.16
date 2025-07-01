Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43D32797AF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370501; cv=none; b=GTGKIC/EreiTpf6YwwzC64NMqjeHjREyvOk9ND2Xk92n9sz2DE0KNMOzcW9cfHBuM9bfgQWJuioSlcOlsYO5WzVYAAMkSgGoZJ0XYiHeLgJdyRyxzp9DujwXOLoAM+o7qzrdN1lAdsA6t2qSAPVtYQu6GdYGMqd4w88vpoYCzZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370501; c=relaxed/simple;
	bh=IcMPWNtWz+Yq437eto4KGz4yBcEZPkVOdOxFSJOvbLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULrafCYrDu4pBxD6HJNuD2diBYfs7k9DgfEfF3rfp6j9VQLHw7NNCwthYa8LXE8ITysIz3yA7DptdcjsH+nAGwHNdNLLotjwZpqXsRJf4Jy3E6AcPhZQJ2JuB7qcwucmjEfduvOJtMp8XN5lxpX3wktoXBpxTT4ltL65Q5hKdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Phee2/pV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Phee2/pV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso6547436e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370497; x=1751975297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSVn2mrG7zN+yugOBdym77+gEsZFQXOddpv10aEY7jo=;
        b=Phee2/pVjtu8knDXoTq8OmkVIeCVsYjZAnC27+3H1AYhu0wR/2lEGDuuAChsfdLvZE
         +Bb6jW2s6iPyT7/I0E9tEZ08/om/BSIWgCLXwik7QAoA1ReuZECDnS9MipC4t4MMgKgv
         6354MpRjmKG8wklTq8t+pLZWkd3P7yuq2O3o8TK7kpJzfZ6bU3F45ZkEDAs86pkNfJAt
         wH+OnmYuSQ4lSMtylZYDetL7YZYQ1BArRLXkSrwKJoMbWRzTr5T/yYsZC8Qz81U3Evp2
         Oxsu17cZMxYU2GtulFR8wSpcEmi1Rv4JnWIkNVlUhrUJ+LhCfu49Gc6uHC/Q2/AYeeEP
         iBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370497; x=1751975297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSVn2mrG7zN+yugOBdym77+gEsZFQXOddpv10aEY7jo=;
        b=B+QJIFHi3jNBcpkKkQk9cZrUWl1Xx7MewTHP2ZSgnwW2xCVprxYxasecxFjo3pYZZ4
         xr6aCMbGtW3pvECxaTa8757x6UBhRGjr5zRgiycuL30BhNFBAvBzSBvYWwQWhph6PrxD
         sU/DJEIEPHNjDuWgBSTtfdl7eQnHdPWDS9snLJxgUh7fCKaIx65W9iC+ITqQx1zXy42I
         APECoHz0p11JdBPOj9dbEg3KK14d72fKAc4mK2ekyVXlznZJ0Q7q2ECVX2404bWb3uVh
         qefWekrnZfQD5iT5NtVhyoNy3GOohMwHQH5ILiRjRcjQBwbCk85RKz2Jq22lQ+UOyOAk
         13Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWFquVhRmce4vC76kVyL4zZyvxjbr0r0QoIxLTRckanZzQuHvkQ7c0GbP6ZbguCyn86bf6NmNV1CVHdWUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycTggPPPr25YPfRjwlA6YCYPL+5vqEp5fq2ppkD3jkrAfP0H8x
	gREdTrGT3S/3YFW4VEKQQSlS8bCUx2T41ElsmKTfxSzdQ25E6iZRx6MbhqT/O4qjUKc=
X-Gm-Gg: ASbGncucxv91b6SD1v6UnIh9pVOstjm1peiQ2RP+oKixAJvmAaskW74J/p2qBNxsMNj
	wrWYmcheIjMP93/P2uHuyMv0RVwb9ASJLwdsGLEf3vj3msWzfniidsNbxIbwGUr0SbOrKAglDOM
	I7LDXbKv9TTwOjcZL0JsUGxpIFrHgnYxvMP5NqrLaUVgpvFYbV3z99QdDaeOzJB+AOuxVgtxohZ
	WnPu7yOrdsaEJjubFPhEbJp7F1LITMKOUFg65x2RP44sB8CkomW2uOeQFCBzBNfIMiIukcDkpSP
	xn0bTaXuRvSZf9FROrD4Ni2wVi3KIr8FfTJyv9qkJ/66GgurpxP1FQnE9f2cuDFn2ceADAQQTqd
	E0R1gCmJVy/A77gfQiegOdAlfqWQESyiIHgHGFX7hIDF1H6E=
X-Google-Smtp-Source: AGHT+IHDgDRPfHPY98/LHxFMoQy3YVLaarT1QmySpf801TGvHsjckA9nhAnZDzSK8mfVyqtwI0kzDA==
X-Received: by 2002:a05:6512:159a:b0:553:522f:61bb with SMTP id 2adb3069b0e04-5550b7e7b62mr4991989e87.12.1751370496991;
        Tue, 01 Jul 2025 04:48:16 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:16 -0700 (PDT)
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
Date: Tue,  1 Jul 2025 13:47:26 +0200
Message-ID: <20250701114733.636510-25-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent updates to the genpd core, can entirely manage the sync_state
support for the cpuidle-riscv-sbi-domain. More precisely, genpd prevents
our ->power_off() callback from being invoked, until all of our consumers
are ready for it.

Let's therefore drop the sync_state support for the
cpuidle-riscv-sbi-domain as it has become redundant.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 83d58d00872f..a360bc4d20b7 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -44,7 +44,6 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_data, sbi_cpuidle_data);
 static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
 static bool sbi_cpuidle_use_osi;
 static bool sbi_cpuidle_use_cpuhp;
-static bool sbi_cpuidle_pd_allow_domain_state;
 
 static inline void sbi_set_domain_state(u32 state)
 {
@@ -345,20 +344,6 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	return ret;
 }
 
-static void sbi_cpuidle_domain_sync_state(struct device *dev)
-{
-	struct sbi_pd_provider *pd_provider;
-
-	/*
-	 * All devices have now been attached/probed to the PM domain
-	 * topology, hence it's fine to allow domain states to be picked.
-	 */
-	sbi_cpuidle_pd_allow_domain_state = true;
-
-	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
-		of_genpd_sync_state(pd_provider->node);
-}
-
 #ifdef CONFIG_DT_IDLE_GENPD
 
 static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
@@ -369,9 +354,6 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 	if (!state->data)
 		return 0;
 
-	if (!sbi_cpuidle_pd_allow_domain_state)
-		return -EBUSY;
-
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
 	sbi_set_domain_state(*pd_state);
@@ -401,8 +383,7 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
-		     GENPD_FLAG_NO_SYNC_STATE;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
@@ -570,7 +551,6 @@ static struct platform_driver sbi_cpuidle_driver = {
 	.probe = sbi_cpuidle_probe,
 	.driver = {
 		.name = "sbi-cpuidle",
-		.sync_state = sbi_cpuidle_domain_sync_state,
 	},
 };
 
-- 
2.43.0

