Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6F297117
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007673; cv=none; b=dV+uwT6CXEO1y3loImIiutVHux+OppOlr3IEf0z3vmeToXcX84PSy9y03V+CfqyFQyIOz1BFvcWHTC956M9Pvht6Vy23QTqP9RgXKeGZQ6xe9M4w7hzfB8E4fBnS+rWFtFw1Zqn7vye2ZT7oVkW+ibQHgYYSPztU8GzeE9WosTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007673; c=relaxed/simple;
	bh=SdIrTkzSEt461VDJ4UWso4pVdWU9yzD2AudkucqhnnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=keISU0Ztvq2gHxEd4n/QN/vVIvEkEsPNQR6B1UDbF/TG/Emu5I6smeeSRT/1oWdrBdetDrTrELNwwc6a66wq+4k8AKxfvi3aJ9K6YgXN2N4z/9RI74sclSPvuov6WnCrjAVYbytX6QvMguqwg5T63XMhlzQDJvB/X5xAIAXRvQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uhCKU3oL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uhCKU3oL"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54acc0cd458so11970332e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007670; x=1748612470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0aKf3r0veUqn1rT4el+1RxCAoZmF17+2VzJGANVxCI=;
        b=uhCKU3oL93S0hs/MEY40FEtREgBMhebkNIMCIjNvEq/9N343BDc1E+LPAPedcTOF/H
         zvlOTxfxD6pdQOxSSmrVzytAG9X2W/GKc+a98WW1hm5cCCNg/j4yUvHcf4KiBX1ssDni
         70hZQUwTqz2AMUTiVTWB/gK2MfXOPZZ89fcM9t0ZV1pE/bVB7Vpsnm0JcfXaweptwVYq
         Ll8+bLaiLT67/aLrOF2o88rjTyrdd3g4yBEGD6wDSGVh9CMXjXGUtSZWacC6wDrPvA0/
         JWrnzja3NIY3pJH8TMLYcp5j6tj+wClg9G2G32Wd1QXvcSSYHN64GmdnOuk33MLGcFU9
         molQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007670; x=1748612470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0aKf3r0veUqn1rT4el+1RxCAoZmF17+2VzJGANVxCI=;
        b=WkHXMtr4I7ytbaUh13PYN/BD8UjQoKiMOaN9EO7JiSAdsV5brwMzb8nzgzsE98ccbe
         k0o4bUOX+oLVWpCiD0A4yc1o4y+s4KZo7ZsECQ1UdK0fcP05k0H3683SJ6dU4eiy3y7y
         oZTmwqrS4g2VV8ECC42GLp4JaPqiM7gwr79bDmj2jyWSz+0gNL5pPWA1zMW5+P2HFKUw
         RpkuY97szR5/PCq35K+DGoWAA3xkeSyGHYM3KaYrPqfKE/6OxHlfeTkBKwBuiYi6lHDJ
         Mk6GRkF3mvTl4EqqblOc1f4ZtuIC/Xxn0e0Xogs3tggHOpeMtY+Xc1bQr3GXNOEkkugH
         sPKg==
X-Forwarded-Encrypted: i=1; AJvYcCU6rDHu03IsByGCsjNhFdYOMT40kTCaGr7RsHoE5U7bDjaZSLl98FQLI7M6/EbMF0RFWysacQRCleDATJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7j2St3cSBqwB2L6W9uKYlVtI2KyAHJKMIiJW58YSoXdNz4whF
	tbIcIaOurvWc8J3jxjnOgsyxq/IcPMm4ubrv1UCYUqwXgbAnMM+/8dS6JhlCKMjoUhw=
X-Gm-Gg: ASbGnctXnW8b31IhRhjy5uh6BGHlzHVFqjpNgrqNE7ob/uyDBl045abcMTRUokz/TF8
	9rKSzJAimoZlELG7wwyTpuRu2UKSCWGSIQhqED5FOf+xOl6BCVog0THR6pNYTp8dxYKPB5odKOp
	slmFTvNyFp5Jb74+ryIo0kt2W9a+aYtSh2I/4QU7hW3uYDIltBrK9PzsDXOTNHqp12sPwWOvAT3
	URXYV2Pqppxx2zAXHq2OKT5gf8wp65qLDhMzp5XgM8EP0b1yMh/hZeaVo5vfMznWBw76Bff3CcZ
	dwEpsU9sO5WUpdLbJBnAWCZevPAtOi4C2LA/oYiZGYYxpKcixuFtnCQ7QndPWuaoj7AtAotlu5h
	7Pw2SdXD2fDFsYQ0/yxG55lbiFw==
X-Google-Smtp-Source: AGHT+IEajquH8YxvUkbDSaTSmZKiibO3mtnqJl45yxSX8n0PgKqQyv3ngd+5PXGwnfc30g1Js1BKCg==
X-Received: by 2002:a05:6512:3e04:b0:54b:f33:cc16 with SMTP id 2adb3069b0e04-550e71b2359mr11620509e87.16.1748007669877;
        Fri, 23 May 2025 06:41:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:09 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/21] pmdomain: core: Leave powered-on genpds on until sync_state
Date: Fri, 23 May 2025 15:40:16 +0200
Message-ID: <20250523134025.75130-20-ulf.hansson@linaro.org>
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

Powering-off a genpd that was on during boot, before all of its consumer
devices have been probed, is certainly prone to problems.

For OF based platforms we can rely on using the sync_state mechanism that
the fw_devlink provides, to understand when all consumers for a genpd
provider have been probed. Let's therefore prevent these genpds from being
powered-off until the ->sync_state() callback gets called.

Note that, for non-OF based platform we will keep relying on the
late_initcall_sync, which seems to be the best we can do for now.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 5d2ed4edffd7..6da25e2c81d2 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1327,6 +1327,7 @@ static int genpd_runtime_resume(struct device *dev)
 	return ret;
 }
 
+#ifndef CONFIG_PM_GENERIC_DOMAINS_OF
 static bool pd_ignore_unused;
 static int __init pd_ignore_unused_setup(char *__unused)
 {
@@ -1362,6 +1363,7 @@ static int __init genpd_power_off_unused(void)
 	return 0;
 }
 late_initcall_sync(genpd_power_off_unused);
+#endif
 
 #ifdef CONFIG_PM_SLEEP
 
@@ -3471,6 +3473,7 @@ void of_genpd_sync_state(struct device_node *np)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
+			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 			genpd_unlock(genpd);
 		}
@@ -3502,6 +3505,7 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
+		genpd->stay_on = false;
 		genpd_power_off(genpd, false, 0);
 		genpd_unlock(genpd);
 		break;
-- 
2.43.0

