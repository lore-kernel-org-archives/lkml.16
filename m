Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1E6224AEE
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746085697; cv=none; b=KargUTnYQUV+ki7BV6mQULUYeMPbfm/l5ZS4aCFWQH71/h/u5WfCJ91ZTLY0f4PAhVk7wYxkz57D+TA0595lle43Ed7J9L5DT3y1qalE+5FnTAeyb14X0XmN5eJ1cayDz3GvBqECtPsbZD+WrQN1mtadTc9GD3EZfgFjWAtijsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746085697; c=relaxed/simple;
	bh=jtrbo0MjP6Q9FCmKZBuyNrIPLHUfBduBm7HadRHbpBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z27Q9BqpS1CLc3jpZwZJb8ZkkfekqRFcgOoMxpI54GnBgvIkHYfytDcRl0iEO78uvSSeD3xlw2ZLCFi57oz8xS/FGTbMWjZctpYb5+/3Cr51KC7ovl3kjJwGyF1NsHT0ovZZeNFyj3ll617CXr5GCJD0982yePsTIEvxht1MAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aA0sPc6G; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aA0sPc6G"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c30d9085aso376968f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746085693; x=1746690493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AJWiwWvxqq8d8lvRpGDBO58dLDaqXemoi28sZ0Dk2XU=;
        b=aA0sPc6GiycQP9cUrs/xRCdCsqhdE2T2yB8aXFFF5Aq9QmKrSKPOVLlDLKFiP2Uhf9
         wMLd7NPldLXPKs4w4FHIhOyBPwjkgleu+Ph5YaRRZIizn2aaQa//UF0wmB4sUiKjckUn
         yMZGpSmMkeiCAytcIqsQutLBo15SMtdVOLubio1P04tyx9128Q5g1Xjcl8bsF9cFnL2/
         Kwjknbnn5StGwRj1nvf1sDY9OsR8d8Do3hlrmnWkAmgVYheglL5DpikU5csiOMk9Vkvf
         BAhdwowgpyTZ7ZbFlGAFspAolo5B/abq2jLTGd4+ZJKr7rXFjnZICtstUqjQIGZoE5oo
         rhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746085693; x=1746690493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJWiwWvxqq8d8lvRpGDBO58dLDaqXemoi28sZ0Dk2XU=;
        b=MrEss8b6MKsX5sLHKne+ulNs8jrDitTR70Y2i655JOpLhj0XE/R3CdFaUvb2Mp9547
         qNO/TG+uZ12T09f5RYLhUn/GmHPpR35g1ztwFknnFw+ITgWkGcAUSQMC5/JOxCkZaSIx
         1d8GcLM3MRAieqftV6yUH8gVW0IhO03rEk9bGsDXsBHuLG+B4LKdUWR0+jOPAu2vXJEI
         aZ1y2rDD5n/6U7GHvu6irNYqT0HlGhWuPxqWtVYmkBg+QWkBhSM0GIR6Czc40fdR2VKM
         NR66yHLCuY8rPHXQdpntfV3Mc02NZk61jR1m6ayz8cB6gApa9ai7fCWasGeh7f7Yjr9U
         lpLA==
X-Forwarded-Encrypted: i=1; AJvYcCXMgUVmNXiyTWeFWtPXd1fDdtXAtOGgqdqCEjhb3DWIy9ofbrsYC+S/S/4+fVGjFeEyaTpdNYkHjH9BDY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RPeP3RNua9MEMV88LRihDhjXhNcNYas4TE+SaVvMBlhRgJnG
	saBouzwEZmZNtPwcds9O8RaaYXS+rLpY4gQ+PPvYdjJJyHcYEEd7
X-Gm-Gg: ASbGnct2dudlp6tiyNlIEH+bp9NdUghseffw4qri/E6BOUEJfdg9iaY+EXUN5oG9Eqj
	uZElVHo6Zzm9qHbBwhfuQcKVf4JSk+zLPe39cOSAKrrkKGTeenW1INqwGRPjqgX55TKjdGG2xH3
	++MyRCDChcLVYoJLcr+XOumTLEJH/jaXdsIHMJ3rbwXhE24PyYDJ6pT0ZIZ9zOKmcjC5T3TgROo
	F8vfpEy9TjA7+ibOnS20ZlCopsvWQy/i/SXu1e1Frgwbl3NKiPsBzWqBISWx5MyL8mhqxAkPeq2
	0wK0D90V3pCs6TCl0gAjufjjuw1hAC9VBXuQBsZUqx6ktoLzHeabGHl+JeD0LAmPerDbUz4ZjV8
	lawUyJsId
X-Google-Smtp-Source: AGHT+IFonP9yjdjJlEqRjKEzvecQ1TsMwjxuqrSVVBU38WOngG09cHfKoUQKO+cVhPag+ri7nI+zGQ==
X-Received: by 2002:a5d:5f8d:0:b0:391:47d8:de3d with SMTP id ffacd0b85a97d-3a093035627mr1350025f8f.16.1746085693264;
        Thu, 01 May 2025 00:48:13 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8ed95sm114535f8f.94.2025.05.01.00.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 00:48:13 -0700 (PDT)
From: max.oss.09@gmail.com
To: max.krummenacher@toradex.com,
	Jayesh Choudhary <j-choudhary@ti.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
Date: Thu,  1 May 2025 09:48:02 +0200
Message-ID: <20250501074805.3069311-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

The bridge driver currently disables handling the hot plug input and
relies on a always connected eDP panel with fixed delays when the
panel is ready.

If one uses the bridge for a regular display port monitor this
assumption is no longer true.
If used with a display port monitor change to keep the hot plug
detection functionality enabled and change to have the bridge working
during runtime suspend to be able to detect the connection state.

Note that if HPD_DISABLE is set the HPD bit always returns connected
independent of the actual state of the hot plug pin. Thus
currently bridge->detect() always returns connected.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 01d456b955ab..c7496bf142d1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
 	 * If HPD somehow makes sense on some future panel we'll have to
 	 * change this to be conditional on someone specifying that HPD should
 	 * be used.
+	 * Only disable HDP if used for eDP.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
+				   HPD_DISABLE, HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
@@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
 
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort &&
+	    pdata->comms_enabled)
+		return 0;
+
 	ret = regulator_bulk_enable(SN_REGULATOR_SUPPLY_NUM, pdata->supplies);
 	if (ret) {
 		DRM_ERROR("failed to enable supplies %d\n", ret);
@@ -386,6 +392,9 @@ static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
 	int ret;
 
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+		return 0;
+
 	if (pdata->refclk)
 		ti_sn65dsi86_disable_comms(pdata);
 
-- 
2.42.0

