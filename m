Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1652517AB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899939; cv=none; b=XE8FMbpAToh4LQUCv4BD3SVAebXNSegYm9PXHCiMNnvBqBYgDH3wjTxTOWdxsALKniEMlizHVpU3lNZXoYwslo7F0PSfp7DXWPVfPk+KKRgoTmpSn/IK95xz95hqka6b5g060iBJzZihkw+qbq1/vd2Z3Kf1p5TCQ+ZwkJ25L78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899939; c=relaxed/simple;
	bh=N9bh2sDAqWIi8kjkl/KRpShW+sOiFuj+Ys/q11FogxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Umxu3GZXTxkp1MylOpfyPHD64PThuhG0Orgbo60UyBoGnYtBb/MstfRpfGb6Ouo9Ny0s8p/brYDx+nUg3vJFe9we0vMf+e1u7lce1DIXVkrVhKQHlg8/T3AhrwLr6oDlE/RyVmBGcxBrHBfkC0O7d9SY8mHGQwHXGzCVUxQxAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vmwlZ0LP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmwlZ0LP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1153618e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899936; x=1745504736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWK6OGQUPtJsrWaqiRqfJ/zsH5wseFrp650Wv3Bg60w=;
        b=vmwlZ0LPlPe8HaIUcfLQVLJkNPZvu6OOt7f8Ie76eTZVUyN/0gIBqzgcT8i0l5p/WG
         UAod08jCNl6UNGn76MKaw5detGjx+u72Fij+1cG1/oE3GThB+PBreNqkYxvdHiCksGAt
         evlpL7oKzOHvmpIs5QgUBLDvhkQIuEA5PA/jzQv/y9XrD+vOvk7enxIHkq9wcafxAyZs
         XhyWYHCk1CzDttsia70FWK8UOt4YO0/CIrbIgyQBgY/4rkQEd1/Yq+OSQzF5nxypeFi5
         4VXWkjJzqK2JFMoKECysW7kspCok/5TkeOppGBqtxBN9pntvsRVCFIo1SFQSkofbm7WT
         PyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899936; x=1745504736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWK6OGQUPtJsrWaqiRqfJ/zsH5wseFrp650Wv3Bg60w=;
        b=m6jwr03jXFFu3QBQVUWNEvR1ure2uIPkINwxVauKV1WPEIMVBNaybPCnaPdn5m5CJ7
         dfNMAaJUsxIihwTf2M5WZD6MuuShyBQLb9K34GPLDstctyTjtwNxXanQWMPsDVN5OwfP
         +S6DX1EgLkrobsDt/mkID1nfGjeB7dAXoTuBU7kzyYwfkpQqdCyzK30IljhLyQMuglto
         rm7sdLPCCPAo5fkEuoeXmSAKqjHX8tHPZ+kgUBgcCvtcMYXrO3cFSX6pIoeoDuDe9+uL
         c9Q/czCl+kKAtVm365mdiZPI/haM2LJfAAz9HkIHDvwxHfnX3fOd3RLwL3tKVx1/LmnP
         Py7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKcREVv1Xkv2emxnVuRyjvTRUbPMSF4xVgjiVpA7xS0OAABDOT3iDbDp/lvcq8prHXCjWxy3vEqncaSyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9iXp856ijGIAu2nJmr/seGyBXVreooSXHZSIE4t8hYLDCHuQw
	iz5eB44k+j5eem6FK24jPHQ8O4LA4MUnwLESO6gwW6odcSucFGiWYMRGTab5gHY=
X-Gm-Gg: ASbGncvQ0ml1GoO5nm3yF5XWmEW5aYRbIInC15vm4jk5nJFY671YYmH+By3XuD+caqN
	ujTpiuxw99Y61cv7hU8Tm6ofNxL6hgIrS3VD21qHk2/p9HZ/ObkdMhSpRQxiL0S2bIzj3yej5px
	K9/ZjdOmcEJDjOK+XNh7IsbK/vlw+354TxInK15KW+zg68wpstF2MHjkEXRBxtMml2nAbwYiMnH
	QhlAKwK4PMaCYlltcTlCP7LXc8GMLL9Eqy4iN3I+qm0k9DNb3oXH0hSVkR7wfYvzsBW6s+sdzkn
	MA14ZBmv3cM7s1X5IR4KF7HJiKVF1xbV+Ngf23j3dpbxAQC6mboyvj5ZYo8PHC0/0a3Y9gFNkQ1
	SCmQcouqJKkTqoMI=
X-Google-Smtp-Source: AGHT+IFMIMS9W78LDELYwj19yc/UbKsawjkHWp2lDcIWNSaSrbDAkmZeYKJckcObhsbeji26HeVx/Q==
X-Received: by 2002:a05:6512:33d1:b0:549:91c6:96a8 with SMTP id 2adb3069b0e04-54d64a7b359mr1644875e87.7.1744899935896;
        Thu, 17 Apr 2025 07:25:35 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:35 -0700 (PDT)
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
Subject: [PATCH 03/11] pmdomain: core: Use genpd->opp_table to simplify error/remove path
Date: Thu, 17 Apr 2025 16:25:01 +0200
Message-ID: <20250417142513.312939-4-ulf.hansson@linaro.org>
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

While we add an OF-provider we may, based upon a specific condition, also
assign genpd->opp_table. Rather using the same specific condition in the
error/remove path, let's check genpd->opp_table instead as it makes the
code easier.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 34a85bf347ad..035b65563947 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2343,6 +2343,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	genpd->provider = NULL;
 	genpd->device_id = -ENXIO;
 	genpd->has_provider = false;
+	genpd->opp_table = NULL;
 	genpd->accounting_time = ktime_get_mono_fast_ns();
 	genpd->domain.ops.runtime_suspend = genpd_runtime_suspend;
 	genpd->domain.ops.runtime_resume = genpd_runtime_resume;
@@ -2617,7 +2618,7 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	ret = genpd_add_provider(np, genpd_xlate_simple, genpd);
 	if (ret) {
-		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
+		if (genpd->opp_table) {
 			dev_pm_opp_put_opp_table(genpd->opp_table);
 			dev_pm_opp_of_remove_table(&genpd->dev);
 		}
@@ -2697,7 +2698,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		genpd->provider = NULL;
 		genpd->has_provider = false;
 
-		if (!genpd_is_opp_table_fw(genpd) && genpd->set_performance_state) {
+		if (genpd->opp_table) {
 			dev_pm_opp_put_opp_table(genpd->opp_table);
 			dev_pm_opp_of_remove_table(&genpd->dev);
 		}
@@ -2729,11 +2730,10 @@ void of_genpd_del_provider(struct device_node *np)
 				if (gpd->provider == &np->fwnode) {
 					gpd->has_provider = false;
 
-					if (genpd_is_opp_table_fw(gpd) || !gpd->set_performance_state)
-						continue;
-
-					dev_pm_opp_put_opp_table(gpd->opp_table);
-					dev_pm_opp_of_remove_table(&gpd->dev);
+					if (gpd->opp_table) {
+						dev_pm_opp_put_opp_table(gpd->opp_table);
+						dev_pm_opp_of_remove_table(&gpd->dev);
+					}
 				}
 			}
 
-- 
2.43.0

