Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABDE2512F8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899938; cv=none; b=J8qEOTDCt/Kh1TmvvYRW3NR+n7eG9tn/WdV0g8byyg/CTfzSdeLl+aWCnG6Ee9pHT5HpHBGQywL8xAWtFmjjsZhCLSFheOCSJjPvaq/yNyXtb+VjBjce5ebsUzquK1Qxg0ePHQIyMAtoaAf+jAXX2FDVJQwgvADmNO9grzu8pNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899938; c=relaxed/simple;
	bh=Cori/y8yi7jlnunZM7z+pNAx55LfzsPSrBTLfWbNPD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=az6f4v5+j/sShGApSoVm8ZFi8mQ6mPg23i8JQAGmoL9SONwtMoEb3UDDXHEAtU6d2RPDx9BT7tVBANf4MHVSU30C/ATwb2f+yFy07AkQada7Su3PLYZXNdJii2fyfkDQNa+4ztVe2dcCy5yiVdX0LxOqg5iuq1w+uJHcvsAV3D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pizVthba; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pizVthba"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so916615e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899933; x=1745504733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLoMIJgubi/4cvpvs3WmBPRGnJMeyrBZc1JViSgU2O8=;
        b=pizVthba8+pnJGt3T9nM9h26Ez1wiFVShQPbS0AWEbGogg5JwrNginydzARfIEP2/D
         31ITHCc/Icsdf/bN7qO7Iw1VsAfQ2iwvrcDQxsmgvv8LSQskweK+tcOP9vremxfEjYkO
         U5EGjuUdvrcdzZH/6zrxgmf3pkPop+cdsSKeuN2FyGla7NJteGkY2BnUZps+rmzOxl4O
         NaxuMuHN+xu0DjCbn0In0q5b/GMzb1PAtlTpXXFGo31uCBZ4mA7FLv2IIfO9xvXkDHr0
         5kBU2/njNCeQ7365zeTGAVAqp+vW69WZsoL633xLjsKTV8cgQR4AmfA32QIZFgx2A8Bc
         sKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899933; x=1745504733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLoMIJgubi/4cvpvs3WmBPRGnJMeyrBZc1JViSgU2O8=;
        b=SrN4TM5GcEAtjvhpB313OaQYWtze/I2Si0JHOup0jT8SXl+1Mb6H3AZ5vMWcptLxne
         fVfvVMfpFuiMt6HW6Zdnt7rqaqHN3yukNuSSh6DuTHtIO6P8Bkt5qJqwzMnEXyHj0vAt
         mR9DZC2EsqoTvmKQdQIfy1sqpMTeI7LH0ua6EefGkaRQZKf2lUkR/px/oyhiJUA/4e54
         C3M6G4nVL2wVySkHldVAeSr9k1IbH1FSqzMQSU5A6A4TL0BqlW4Jl+EgQymcYBwg8/fQ
         XDie+jD/Fkkoac3kDS3m/D78wpyCeU9oboYALxxdr9x/C37Pl0mdoXXbz1hwbCWZvIxZ
         1pcA==
X-Forwarded-Encrypted: i=1; AJvYcCWJRQYm2Wc1sD09wMwTRKHxF1JLKU3dB4uYZN2kJeDJnDPwFobUHxXj+NNeyC684ULRP7an2GWyrpWsRT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXzdv5IeoMkUJ5AcxEn5t/Nntu5EA3ZzlZFSo3EyP+t353FS1
	aUE766gb8dBmrID2oleekArYdYmbv5cAuClu7LbYGFhTQh6mDKRxoen0I4DSyrQ=
X-Gm-Gg: ASbGncvr+A9/LwsOHcl8huJ7ZdBv3SmCykqGHi6GcyTksXvoE4dezbOsfKOt/3pfzv6
	XqwydZ2tJMQo3y8YiOqxaO+1XOdPBcPrEDssPUa3a2Qv3jg6c+Qg4alSlcv1VFFjcmq7Shgtqx6
	QIiT3Us4Dxg99P6rGX8n18BUMT8m3ca9ZD8M0EKbC2IFmIv5Own5VhB4/pMT7ktpbBgvpWon3H1
	r3hwbIBNwjG48NY1EWU6pvATaWW4zITSHK0iWExK3U0x+v8k/mWj3w+xOOVWP8qZtRCuf6y0FAl
	UAnXuqbE4U1xa3S31N14SKcea49fDti8vcdXWB/XtVB+hnF3h4oRnNAnk/iVfE9yIf8WWVL866d
	PPE9wSQWo8Oe2Tfc=
X-Google-Smtp-Source: AGHT+IGEHywzk0Uvrr5vva6qwKhkHAMRzineGZ+Ie2tYZ9oqV2dzLL/IgZ7exOPJtd8mc3KpgoduVg==
X-Received: by 2002:a05:6512:3a93:b0:549:8809:ee32 with SMTP id 2adb3069b0e04-54d64a9d570mr2067636e87.22.1744899933071;
        Thu, 17 Apr 2025 07:25:33 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:32 -0700 (PDT)
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
Subject: [PATCH 01/11] pmdomain: core: Convert genpd_power_off() to void
Date: Thu, 17 Apr 2025 16:24:59 +0200
Message-ID: <20250417142513.312939-2-ulf.hansson@linaro.org>
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

At some point it made sense to have genpd_power_off() to return an error
code. That hasn't been the case for quite some time, so let's convert it
into a static void function and simplify some of the corresponding code.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 3523d0331cec..574a0de1696a 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -908,13 +908,12 @@ static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
  * If all of the @genpd's devices have been suspended and all of its subdomains
  * have been powered down, remove power from @genpd.
  */
-static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
-			   unsigned int depth)
+static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
+			    unsigned int depth)
 {
 	struct pm_domain_data *pdd;
 	struct gpd_link *link;
 	unsigned int not_suspended = 0;
-	int ret;
 
 	/*
 	 * Do not try to power off the domain in the following situations:
@@ -922,7 +921,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * (2) System suspend is in progress.
 	 */
 	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
-		return 0;
+		return;
 
 	/*
 	 * Abort power off for the PM domain in the following situations:
@@ -932,7 +931,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	if (genpd_is_always_on(genpd) ||
 			genpd_is_rpm_always_on(genpd) ||
 			atomic_read(&genpd->sd_count) > 0)
-		return -EBUSY;
+		return;
 
 	/*
 	 * The children must be in their deepest (powered-off) states to allow
@@ -943,7 +942,7 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	list_for_each_entry(link, &genpd->parent_links, parent_node) {
 		struct generic_pm_domain *child = link->child;
 		if (child->state_idx < child->state_count - 1)
-			return -EBUSY;
+			return;
 	}
 
 	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
@@ -957,15 +956,15 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 
 		/* The device may need its PM domain to stay powered on. */
 		if (to_gpd_data(pdd)->rpm_always_on)
-			return -EBUSY;
+			return;
 	}
 
 	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
-		return -EBUSY;
+		return;
 
 	if (genpd->gov && genpd->gov->power_down_ok) {
 		if (!genpd->gov->power_down_ok(&genpd->domain))
-			return -EAGAIN;
+			return;
 	}
 
 	/* Default to shallowest state. */
@@ -974,12 +973,11 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 
 	/* Don't power off, if a child domain is waiting to power on. */
 	if (atomic_read(&genpd->sd_count) > 0)
-		return -EBUSY;
+		return;
 
-	ret = _genpd_power_off(genpd, true);
-	if (ret) {
+	if (_genpd_power_off(genpd, true)) {
 		genpd->states[genpd->state_idx].rejected++;
-		return ret;
+		return;
 	}
 
 	genpd->status = GENPD_STATE_OFF;
@@ -992,8 +990,6 @@ static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 		genpd_power_off(link->parent, false, depth + 1);
 		genpd_unlock(link->parent);
 	}
-
-	return 0;
 }
 
 /**
-- 
2.43.0

