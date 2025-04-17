Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D63E2512F8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899944; cv=none; b=nfAm0QyxmrSi/w7hMxo9Esl9Y3+BAY6LwbZw0tTfezreyaO8dq1Eco80JpwgldLsoMgzfAfVpvimE5MAuXnRX0xC4ycNdSt8aS0JrYV2pQA3LiZdDxmN06NdNYxznhr8Sntxdb98gEYY0N16JYiPvciNrvsvM4GrK3PkHHsY9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899944; c=relaxed/simple;
	bh=hGEGke+YeMNPuG7Ik9fetNSAb/9H7liP355EVYXpzPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQg+7N+WwBvyRWRHhq2T5mINQIukPu24BRuRNogPm9qH7BrUPQ/cdFrWZgsakqpeU9fSfTPFYrGo//SCqh4Rrs1FUXr4Qh/VNB/ASsusEGNne2eoUmTBXThcjSwSAXQjD4BvGOxtR3RZFSXEsI5Ibty6oUH6BTPJVXWr8PkTycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJE6Cpff; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJE6Cpff"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso969254e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899940; x=1745504740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsxBU0bGS5KqHJ803b5B2Fj0PSRviE9NZjBErJhiWF0=;
        b=OJE6Cpff9qR0c5sdMWMW12TACVifchxkMfkpP24AJp7/p9GXHetnbfIfMUlwzNDLkW
         6rVv6Kj7Ja4ZbkpFG8QReb+jAUMT8vnaCti5Js9Vffx6yGYK/mVjW4ktHK2SLC8jMEL3
         zgk4qkKKV9h1A4+cwHon77gTOHTOCNt3qhCAcYjgUEpdQhoQbKQXoZG/yMxanTsLknGa
         SLCXqpQW1VhSLB4W6cFW90vdNgF4ZtYXrc9GSvYc51NY9F9vW6GDmMO2QLAjnPkFxJZY
         fRSanCIvU4X8OjDgBIdEGfT9J3W/SJv7M8B5VpJrCs4p6eAcBXmpT9hadmMOpnD5ZpeW
         TyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899940; x=1745504740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsxBU0bGS5KqHJ803b5B2Fj0PSRviE9NZjBErJhiWF0=;
        b=eCO0VYgMHHYveFeDjxzcC/4JhU84qBHYCz+XfL8KmqPLVa2mbkY/pRfRIrX0AIw2bl
         Mj924oJ3gjGQIzYMD8R6875LmyrGqUuQjemiuD6HpW3OqDLDAEMgirhtu5CFABY8CFqq
         oXVLjEnfUZEtkHelDL/AlUSMw1ChzfPbTajb5yd/afMKYHPSTozcD9EOdefYcvFo27SJ
         gcNtL0O45SyzB+STKlO8deC4aJ9+uIRFETltj5aNmMsCvxYwZlOU/rP57BOkl5OJIqhq
         iuGZvaqNekmYIhBa6mo7d8L+6aprPXAbdj+Wp0NaXxqYH+OH0l/AgNxs5hG0K5RDohzY
         GKiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVydTkhvxXXUF7K6y7nswHsjiNMJLtpH6aVbM6EVGWMAnOKwTG7SnkRbw+61SlpwXO6j148xCwIZa+AGVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrOCqMEf+F5EIQD87cYF8jsCQLrBFeKqw3JhZhVeCiSl7a4GW
	CTIGQLc7gL21E4XgnoZxPN7FtJDBYxfEILjiewuXo8s3C9wm5+N4MZTRTESk9ww=
X-Gm-Gg: ASbGncvs1bZr8MyaSxyhYksEg2WFirbRQkAsBWxeCvlE+J6Rhbyfo3a35qyognSqKBb
	Dxt3ZTK6g5bvknJ4CzBj652GOP/Eec80OfvhrK0NLZYNJMokVKI0dYccsa86R/GgxYLQZRpTqsG
	/bRYEBHLUvPgwyJ6bEU7emW9NpC+w+LqUcC5d1wAf02R3X+bBR3FL2BOOSFJx7nnbBzzJAWCXE1
	acK0q+P3u6lC01i1uFXFJaonzybLVnPia94xtAO8xdkQ+FNEI+JW3UCCOxIhZ1Qz3UUsCv6wJHT
	AVtB4/B/Wy3BeH8OHcFpVmARGK/ZA1VAFk1qEsQQYZKFtJkonFQ4xt0hBggabzfBJeNqoVtnqyU
	FgHEQzMnjLjlFlFI=
X-Google-Smtp-Source: AGHT+IEWl4UhmNQk6NGrzL0Iqf0HFQV64z24gz6YKYgW7OTjKrIcQquUG8drUV+xQ2lv6sucMcxvpQ==
X-Received: by 2002:a05:6512:304a:b0:549:8c86:9bf6 with SMTP id 2adb3069b0e04-54d64ae80e7mr2023094e87.39.1744899940189;
        Thu, 17 Apr 2025 07:25:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:38 -0700 (PDT)
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
Subject: [PATCH 05/11] pmdomain: core: Use device_set_node() to assign the fwnode too
Date: Thu, 17 Apr 2025 16:25:03 +0200
Message-ID: <20250417142513.312939-6-ulf.hansson@linaro.org>
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

Rather than just assigning the dev->of_node for the genpd's device, let's
use device_set_node() to make sure the fwnode gets assigned too. This is
needed to allow fw_devlink to work correctly, for example.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index da51a61a974c..3911d3e96626 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2627,6 +2627,7 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 int of_genpd_add_provider_simple(struct device_node *np,
 				 struct generic_pm_domain *genpd)
 {
+	struct fwnode_handle *fwnode;
 	int ret;
 
 	if (!np || !genpd)
@@ -2635,7 +2636,9 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (!genpd_present(genpd))
 		return -EINVAL;
 
-	genpd->dev.of_node = np;
+	fwnode = &np->fwnode;
+
+	device_set_node(&genpd->dev, fwnode);
 
 	/* Parse genpd OPP table */
 	if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
@@ -2661,7 +2664,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 		return ret;
 	}
 
-	genpd->provider = &np->fwnode;
+	genpd->provider = fwnode;
 	genpd->has_provider = true;
 
 	return 0;
@@ -2677,6 +2680,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 				  struct genpd_onecell_data *data)
 {
 	struct generic_pm_domain *genpd;
+	struct fwnode_handle *fwnode;
 	unsigned int i;
 	int ret = -EINVAL;
 
@@ -2686,6 +2690,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	if (!data->xlate)
 		data->xlate = genpd_xlate_onecell;
 
+	fwnode = &np->fwnode;
+
 	for (i = 0; i < data->num_domains; i++) {
 		genpd = data->domains[i];
 
@@ -2694,7 +2700,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		if (!genpd_present(genpd))
 			goto error;
 
-		genpd->dev.of_node = np;
+		device_set_node(&genpd->dev, fwnode);
 
 		/* Parse genpd OPP table */
 		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
@@ -2713,7 +2719,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 			WARN_ON(IS_ERR(genpd->opp_table));
 		}
 
-		genpd->provider = &np->fwnode;
+		genpd->provider = fwnode;
 		genpd->has_provider = true;
 	}
 
-- 
2.43.0

