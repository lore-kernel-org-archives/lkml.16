Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832D29375E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007644; cv=none; b=kp7zQh8B5nPdRtCCufYFPPd97hcDWQQaGrpRZ2BPKuO/W6tKVTgsuaQ0PhKlkHyaZ6KGeD3OL7JI2coad9fdzTI/3gcLXf0k4dq9Eg7NiPuOJZlP08oqpfy9m7nlwdJ5yS2qSTosSfvzJAPxbs0KwzuwFIKp6jHcCKXVj+9tVrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007644; c=relaxed/simple;
	bh=ZWuXoHRykjcQLvugNPxk6lMikozG+4QpwkTnChGz2TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hE24sYJprzA/UG5pNf1G5Il5lrYAmAab8NrKKG/LA5cKKO5gy2tZReOOq3TqOAiIx7MCL/DVKztvw6Pwr/JAPUx29zTvSObM6h9T4XSMX2iZZ8WsFQdsdJid9/QnU57z0wZsJvV/oMp6mL2Ezmv7n94z2pN0+HrAresJ++aTtK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5SO9le5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5SO9le5"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso10979766e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007641; x=1748612441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVuyQaWXDo32LSLemr1Wiyb/FTBR994cD4zXDWOXk7w=;
        b=s5SO9le58+lcREccGO3MaZ3Nx2+KdSXzrVQbArBo4z61JHHrAOBhqqSYXX6up24zAJ
         +YcOiTuf6q4mTwzO4Xj+j1H0WZSL+YBaXmpTIiJYDw4X7PdcOpIDCbp48Vn92MKXpTR6
         Xzh5kUB1zNtEa1WzfWZQfPOlQt6Qd23OgwXIy39LqJMax2+Fcz+8OXft8e594mheGooa
         pcj3++Cjh/+IbvacuYQg2l+CeYdLndpCI088jbEPjgUt78RRTR7t41H7Tbc5v5MdZNmk
         vK5Kaum5Vyl6a82bL7Mkt2foMr7B6Mj1L/7DMcoU8RFxo/m9wI1/WYgLuen7bfJ1HkP7
         SmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007641; x=1748612441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVuyQaWXDo32LSLemr1Wiyb/FTBR994cD4zXDWOXk7w=;
        b=HOvZ0R2qbl3diFc/xX2U5lyR5JBq4lPDVKajPy30cWwzsROiV2vm6eIZR8S8Z4oFuD
         btbc+JsIkGBg5fcnqD4PlTZMnIjC/txIEFuR34K2poPWvOvv5kodcJO3BQHeCmPzeojw
         3tEZy1WPEFxAMJhVRksuauFPJulR70htKYDuwPMUTKcfMbBPBMQy48IsbcTiArBVLhL9
         N4QrwYZnaVW3uofbXL766+vRgi88zGrE1oF5k9VwTRb0UK4MWI7mLuqt+FAq1uEElqG8
         kGlUdWDtfnzAfgZ7/QNBpcBQ3Eh9E5ItZjeyIblBYXIUQ1SJJjGCeSAZUykexXwSdcoE
         V3MA==
X-Forwarded-Encrypted: i=1; AJvYcCXHZZ5RgQwURZfx+wr55PTrnod9B23NCQnAJACh9XiWLzRdfddAhBZe+hOPDrIz/HoL2xeHJ8owtul9rCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVj7f8LZGg5FCNZ0UDi/Wf1mQ7P1Z/bKnh2fTGH8ell6yc5P/
	7hL6VhI9UDtvrDpS0EBtCh04wQvbjrWYJLsC/yG4ZlRQuUQPonxSoKzETOE7iT+BYMU=
X-Gm-Gg: ASbGncsEvg4MM3ktgtbCmVuCoA9N59n2AaelZuDAoM9bd153wMsWKpirTJPJeB2D0dO
	xKAumaanKGh2y5795ZpBiw6VSfMG0BoFxvcH40gSkzLs1lLRq5zSDq10+T/Lr092NZWnQLB/qB7
	Vb23zc9LYdQpgYthuJ+rkEjrOGLAdvRDTTHOaOY0VWu9f6BlMohnbUYi3DNOlwzOdbI19nYN5jU
	ycYuSC7eg53vrmKoT/Jnc5YpGcBOLY38H50Yc3CWxuc/5iowF3A3o5Z3GQFJnd9TyfWg9UvBX38
	ObUNr1aH6LsSH4djOfc+iTxl0BntMhUHMw71EllYUzCueYLRjorXO1u9pQ/yMyVusUs+5Nnkdw3
	uRl4WuzUSdvFlBdKbe4tt5RDlvA==
X-Google-Smtp-Source: AGHT+IEVIbZ36oRuBgtUIV/gY2wrVcuoRcXYW2ew4UfjOMiCZ3z4VNYKumXWYXyWKY98xtuLk0dWog==
X-Received: by 2002:a05:6512:22c9:b0:551:eb71:4aa8 with SMTP id 2adb3069b0e04-551eb714cbdmr4668192e87.25.1748007640612;
        Fri, 23 May 2025 06:40:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:40 -0700 (PDT)
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
Subject: [PATCH v2 01/21] pmdomain: core: Use of_fwnode_handle()
Date: Fri, 23 May 2025 15:39:58 +0200
Message-ID: <20250523134025.75130-2-ulf.hansson@linaro.org>
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

Let's avoid accessing the np->fwnode directly and use the common helper
of_fwnode_handle() instead.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ff5c7f2b69ce..9a66b728fbbf 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2557,7 +2557,7 @@ static int genpd_add_provider(struct device_node *np, genpd_xlate_t xlate,
 	cp->node = of_node_get(np);
 	cp->data = data;
 	cp->xlate = xlate;
-	fwnode_dev_initialized(&np->fwnode, true);
+	fwnode_dev_initialized(of_fwnode_handle(np), true);
 
 	mutex_lock(&of_genpd_mutex);
 	list_add(&cp->link, &of_genpd_providers);
@@ -2727,7 +2727,7 @@ void of_genpd_del_provider(struct device_node *np)
 			 * so that the PM domain can be safely removed.
 			 */
 			list_for_each_entry(gpd, &gpd_list, gpd_list_node) {
-				if (gpd->provider == &np->fwnode) {
+				if (gpd->provider == of_fwnode_handle(np)) {
 					gpd->has_provider = false;
 
 					if (gpd->opp_table) {
@@ -2737,7 +2737,7 @@ void of_genpd_del_provider(struct device_node *np)
 				}
 			}
 
-			fwnode_dev_initialized(&cp->node->fwnode, false);
+			fwnode_dev_initialized(of_fwnode_handle(cp->node), false);
 			list_del(&cp->link);
 			of_node_put(cp->node);
 			kfree(cp);
@@ -2916,7 +2916,7 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
 
 	mutex_lock(&gpd_list_lock);
 	list_for_each_entry_safe(gpd, tmp, &gpd_list, gpd_list_node) {
-		if (gpd->provider == &np->fwnode) {
+		if (gpd->provider == of_fwnode_handle(np)) {
 			ret = genpd_remove(gpd);
 			genpd = ret ? ERR_PTR(ret) : gpd;
 			break;
@@ -3269,7 +3269,7 @@ static int genpd_parse_state(struct genpd_power_state *genpd_state,
 
 	genpd_state->power_on_latency_ns = 1000LL * exit_latency;
 	genpd_state->power_off_latency_ns = 1000LL * entry_latency;
-	genpd_state->fwnode = &state_node->fwnode;
+	genpd_state->fwnode = of_fwnode_handle(state_node);
 
 	return 0;
 }
-- 
2.43.0

