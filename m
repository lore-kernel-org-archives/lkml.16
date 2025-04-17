Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD27253329
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899946; cv=none; b=Rc9NtV3ZpzTH37fy7LWMThOSB8sGNkNx+MVRSWB6aHWUXTuJH2q6OKpTW3Gengd3JYCOQ/ohOMqLbgOFrcpTXjfr4j4QPpvg92KQJu9nEXlATPxmhaHks0UC5RcfgSN+0WjN7U1G3vQ2bc/gdQR7LGousMPqIrb0SVrehV0f3sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899946; c=relaxed/simple;
	bh=mCvK16gSgEDQy1+5bYn7FFtCLXuKxhPqDJ3FRjReYEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRWe0Dw8gYebJOhFmyA9W+0SauO2wjMUmUdnGVqWqHGuYZXpldwydbE9aqwtm3Ed7OXFONNE1O1tyr8dqwHR1mtLIiOjPwB3k91+tf+4gL2lJ0lMWMgTMWoMPBX9LkVuivZ2tHnJ7nik5vnVI4wVmZyed7oJcEvZkXe3y3KUI2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhmeIm5G; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhmeIm5G"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54954fa61c9so1118894e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899942; x=1745504742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhCzeeuIRn9U4lLFeFB39wEFdroIdbbgBLNLNN654Y4=;
        b=YhmeIm5Gv+7KPC7WLKw4TTfzlaVcxpqkiHsyMEDZaBV2xsaHhfV9xgH3WpL1WIaKtW
         eAVoTBxfiZfWZsErRI2Tg6ajPU2wH+WPqae2x1s2rJdSb6lT1ZV2oXsxNUvNBXW+drII
         ExfeJ7zk3xKLyIPV9uvOnSfvZOj92GlwWYce8PgvMCLVs9sx5bURTZi7ORXKZPgRufLd
         55hnG75pfgVeGhoQhmEnNadY2gpxe6IHlJIWGJMWRAZT+hSTNsnfNX/CsF9VkuzAC7ba
         t3IEck7D7wF/xFgxHNZIY/Ia6uSnH059t2eUnJBAyJvJF6uNFC7Dyhb1qiQ9JaQWVQJi
         z9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899942; x=1745504742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhCzeeuIRn9U4lLFeFB39wEFdroIdbbgBLNLNN654Y4=;
        b=JDvvtx4fxpKr5HuP9jRMo2D00eLpA7rHAYApWUuSjbJACwEUntAuE3s+bVUsTIe3fE
         x2uTSWGfynvDUAonLntW/KTUKMeUgnAeSl5KnZjCWYvfDJBEFBE8iXlHOqbRzSDc9KJs
         Z0cyEOqrvsMfq0Z5OwP/jBLkMcbYBT1UEQM2uug+bM+7mhfU38E/xtkfmvflJ0rdWz2w
         M1PUCbXGWcY2a05mmQZn0mQONjZiCcb5mQdZOHJOrzqncetMZnujUhjO2Xj0ht/kEpX5
         cL/RmLEGcp0hyXg7GpblY9aYWeu5smMbxTz94cMaVo+LhB9zdOxPvlbx4rDo2RT8V4Jw
         jX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCURLaFp26Nl2+2MdwcjT02dlqeGqhWAqxSDfqcm9g8k8L+CaT6d8y2rt1MmBsLog2X7no1O1xUEhfHrxoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Y3EVsctU4xjaJQBYMlDxTiKz6VrndHH+0cUn7wCoEYG9s1Ct
	7B93/3Yu1OiEft6+v5HnTX3rYndiqOt4gOfqIO5CAWxrvk5Of0WgDjOscnB4GmE=
X-Gm-Gg: ASbGncu70FSpUGB/lEc6YQipoGGPSS+TA8DY4yqS3tSDfbJ5me2OeAm219IKIKJrDZO
	pVlZxPKNTB6iqYzMPjJOopkgJ55fPIhhKGaUieDr89vNrKs+fWiQOB/eumC+p+Cd9c3bTeHwa/+
	4vu49LuxXm5Lf7tDS0Bu3hDKVovnABDfB033wQEVw9/0ozyK5CznkGatjlO3+TCQcTly+9If+2o
	rhZlwsHTMwW+G7fznOxh/C2J2cuY/Vikw+MHAEza04xmuAio3gJ3CyZzB0cURV5kbZIuNYNRvPh
	hFSQJXcb18MU6hAuC3lLXGWCYUa+45/AUst1HUekPYQAhf9XMZ9c9/or8wqr4vToJQ/4M5FnxyK
	lrqFbfpU640ECEZ8=
X-Google-Smtp-Source: AGHT+IEKg2sAljzc60RG1x7zQS31Y71/y6HRPvtwzajn+isSwZjg667wjhQKlzCNX2y4YKOKam9UjA==
X-Received: by 2002:a05:6512:10d5:b0:549:8675:c388 with SMTP id 2adb3069b0e04-54d64af3fbbmr2088472e87.52.1744899942203;
        Thu, 17 Apr 2025 07:25:42 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:41 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] pmdomain: core: Add the genpd->dev to the genpd provider bus
Date: Thu, 17 Apr 2025 16:25:04 +0200
Message-ID: <20250417142513.312939-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To take the next step for a more common handling of the genpd providers,
let's add the genpd->dev to the genpd provider bus when registering a genpd
OF provider.

Beyond this, the corresponding genpd provider driver's ->probe(),
->remove() and ->sync_state() callbacks starts to be invoked. However,
let's leave those callbacks as empty functions for now. Instead, subsequent
changes will implement them.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 3911d3e96626..5aba66ac78f1 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2640,11 +2640,17 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	device_set_node(&genpd->dev, fwnode);
 
+	ret = device_add(&genpd->dev);
+	if (ret)
+		return ret;
+
 	/* Parse genpd OPP table */
 	if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
 		ret = dev_pm_opp_of_add_table(&genpd->dev);
-		if (ret)
-			return dev_err_probe(&genpd->dev, ret, "Failed to add OPP table\n");
+		if (ret) {
+			dev_err_probe(&genpd->dev, ret, "Failed to add OPP table\n");
+			goto err_del;
+		}
 
 		/*
 		 * Save table for faster processing while setting performance
@@ -2655,19 +2661,22 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	}
 
 	ret = genpd_add_provider(np, genpd_xlate_simple, genpd);
-	if (ret) {
-		if (genpd->opp_table) {
-			dev_pm_opp_put_opp_table(genpd->opp_table);
-			dev_pm_opp_of_remove_table(&genpd->dev);
-		}
-
-		return ret;
-	}
+	if (ret)
+		goto err_opp;
 
 	genpd->provider = fwnode;
 	genpd->has_provider = true;
 
 	return 0;
+
+err_opp:
+	if (genpd->opp_table) {
+		dev_pm_opp_put_opp_table(genpd->opp_table);
+		dev_pm_opp_of_remove_table(&genpd->dev);
+	}
+err_del:
+	device_del(&genpd->dev);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(of_genpd_add_provider_simple);
 
@@ -2702,12 +2711,17 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 		device_set_node(&genpd->dev, fwnode);
 
+		ret = device_add(&genpd->dev);
+		if (ret)
+			goto error;
+
 		/* Parse genpd OPP table */
 		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
 			ret = dev_pm_opp_of_add_table_indexed(&genpd->dev, i);
 			if (ret) {
 				dev_err_probe(&genpd->dev, ret,
 					      "Failed to add OPP table for index %d\n", i);
+				device_del(&genpd->dev);
 				goto error;
 			}
 
@@ -2743,6 +2757,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			dev_pm_opp_put_opp_table(genpd->opp_table);
 			dev_pm_opp_of_remove_table(&genpd->dev);
 		}
+
+		device_del(&genpd->dev);
 	}
 
 	return ret;
@@ -2775,6 +2791,8 @@ void of_genpd_del_provider(struct device_node *np)
 						dev_pm_opp_put_opp_table(gpd->opp_table);
 						dev_pm_opp_of_remove_table(&gpd->dev);
 					}
+
+					device_del(&gpd->dev);
 				}
 			}
 
-- 
2.43.0

