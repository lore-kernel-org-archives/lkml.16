Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B198D215771
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492095; cv=none; b=KHgQh4w24y1G+92CD4zURUUZ3qvUtKvNtgOubI5V9vlBOrUtIb2q3SHXjv2iasQtyGT46lGJlprSQEKNV0V57uD4y7TC+e71qd0tXgR3zsZWjk21ktnGyEBRnK0M0BOgWV1ningICMjxbgOdo/cF7D3jmtpKdLWMKWgJWlnOhEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492095; c=relaxed/simple;
	bh=8XJGloc6+qKwSd8AJG65ICcDoijGpZxvac+voCzkNQY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CDNZak/YKf5nSSrTfyuMPoG0+TtNpKE4TfiUrrFPqdwWRGhmUacwqR5yYWOVUGufJ4a9CX5r+Fm8IXfd+nTEkL9AkwlpG/iUOSgj+Kw/A7vx6dHO9S918y0aP2v/lDkj7wZwDIYtz4zbvW9dJm6eH9h6Fyl66BaxBblITv0Ihr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qlQAOeQ9; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qlQAOeQ9"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53OAsYHa2607782
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 05:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745492074;
	bh=h2NgmqrTEbwp6SY8hoLczRXrNeN3OfGG5+RHp+y4Dxs=;
	h=From:To:CC:Subject:Date;
	b=qlQAOeQ9vqTxtOxQ5pzddoz2ZVfo9KW4NqEKL/w8OeLuBqcdyA8inkuXyWmTif87D
	 +4uS5pV+LJVCJY1Hn83o+9SmFGyYafQ61agvWlyhuJClC+eR4SdOOUB3hAdlEBhYYc
	 tGr4ezEdID4e2lEqJof0UKZeHJO2pK0wIhPQxFJM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53OAsYuN001262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 05:54:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 05:54:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 05:54:34 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53OAsXNI073675;
	Thu, 24 Apr 2025 05:54:33 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
Date: Thu, 24 Apr 2025 16:24:32 +0530
Message-ID: <20250424105432.255309-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

For TI SoC J784S4, the display pipeline looks like:
TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
This requires HPD to detect connection form the connector.
By default, the HPD is disabled for eDP. So enable it conditionally
based on a new flag 'keep-hpd' as mentioned in the comments in the
driver.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Hello All,

Sending this RFC patch to get some thoughts on hpd for sn65dsi86.

Now that we have a usecase for hpd in sn65dsi86, I wanted to get
some comments on this approach to "NOT DISABLE" hpd in the bridge.
As the driver considers the eDP case, it disables hpd by default.
So I have added another property in the binding for keeping hpd
functionality (the name used is still debatable) and used it in
the driver.

Is this approach okay?
Also should this have a "Fixes" tag?

 .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index c93878b6d718..5948be612849 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -34,6 +34,12 @@ properties:
       Set if the HPD line on the bridge isn't hooked up to anything or is
       otherwise unusable.
 
+  keep-hpd:
+    type: boolean
+    description:
+      HPD is disabled in the bridge by default. Set it if HPD line makes
+      sense and is used.
+
   vccio-supply:
     description: A 1.8V supply that powers the digital IOs.
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f72675766e01..4081cc957c6c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -191,6 +191,7 @@ struct ti_sn65dsi86 {
 	u8				ln_polrs;
 	bool				comms_enabled;
 	struct mutex			comms_mutex;
+	bool				keep_hpd;
 
 #if defined(CONFIG_OF_GPIO)
 	struct gpio_chip		gchip;
@@ -348,12 +349,15 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
 	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
 	 * delay in its prepare and always disable HPD.
 	 *
-	 * If HPD somehow makes sense on some future panel we'll have to
-	 * change this to be conditional on someone specifying that HPD should
-	 * be used.
+	 * If needed, use 'keep-hpd' property in the hardware description in
+	 * board file as a conditional specifying that HPD should be used.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+
+	pdata->keep_hpd = of_property_read_bool(pdata->dev->of_node, "keep-hpd");
+
+	if (!pdata->keep_hpd)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
+				   HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
-- 
2.34.1

