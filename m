Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3382741D0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781192; cv=none; b=MzqXPddNgUOGyZ0XStDOo8S27oQRKRTrzKaj5a/Wh0WE5Cf/Vspbj9SUqXLRbP7bHUnY+nDUbVisMUVEKWQitL0fur4rmp+ByX0zuzP/eGSxed/rY3xJg+FcGYgqkWQOv3bt1za68QQKjzrcN77CRcof52JVQElX9Y1fHmqVXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781192; c=relaxed/simple;
	bh=wFSO+bW0reZeJiU75auO+mE0Vw0w+a9HRouNJGN1GmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKDIe4HLlenw7YSdZNShL4AgH0Gq9A2oivHDYlLjRb+70ygOuvXCiULC/4UaIIohUZ11Or0oxAGmn/G8HDQMx1wPbMhlQE5wNM7PpwvS9JR5oIrZ51orjKY6CAQfKJqzXg5FuMytpwrGLMUisRm0Y3bM9Y35NIe0MK9AVbTA1q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c3PGZCVQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c3PGZCVQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso96338f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746781188; x=1747385988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASnQFcWLigUiMmzLp6e/Ns1g9XB4PFwbLTaJMqYMfMM=;
        b=c3PGZCVQ4/0l7IqGD9UnY+rxidqiAANcXKWo4aAWabPlkgI0nnkSywci+fa8A2t8iJ
         wtJNb9zsge8MsR0m1/XfxTEVS4XGmT2Ve+T5vQjH/CgMOGjOTe7QGA3MKZaTObG0WW59
         GuOOrIpoJnYn8+8VLaejQZ/DBYLz9jsCxeuOQ4Mh+P2XkUFRTvTs674FAlM/QQV3RiWe
         7DXyGlw4QaQnN7q1ENwTIh+EfELAfO9o1qtz/uQS+KRiau9mFPjQRMewADVC/O+EHZBM
         SkdApxUjTd0XgzszFvTWmeOS7e2wNfvCvBnh4C7JFh1IdelV2DCbVT2AnocNt9wJgOlu
         +Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781188; x=1747385988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASnQFcWLigUiMmzLp6e/Ns1g9XB4PFwbLTaJMqYMfMM=;
        b=J3ZTfCdFWmNrsUXiG6kfPdkYWjbUa2UqP6q7rm7lt6Q2PhNaXCaEEiyuaC4vRk7Kei
         0r8OQjkd6IRpqFy2DhVfaCqm3LjvhU4BBvyTeTStxAtny8MA1dHiqmYPYKDFdp7clUig
         zggSknNf1J7a3Qi4+dBQXg1zbZdy0ERa0taf87EvtJWAWk0zFdDF2LAH4POaHwtes10l
         Ku7u/RkBto92qRFw8USommKD1CxF9D4noQPpAyQIeF3sFyXY89gls81F0nCEyxVxCp7X
         0nvqYF8f2Q0Dg6TLAWA95APp/MDhUvGtzo66mxvvhi4KT8wAVrXtDK63oAJ0iqBVM69/
         +0eA==
X-Forwarded-Encrypted: i=1; AJvYcCXiWCriZUtHsWrVU+ar6GQde/9YH8C43nLI8SDyWhuXFvu4mXtzIbacO/Ja4hCQXdz977G9UOa/ZwNs6vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD6XCLjv1d0DONN7z1gq9zG6X7qCfonHJZwKT66TA9D5aHD0wt
	eo7ekDrTfkHaW8QNgYr0hbhSwXqGpo17VwpDZfzX8fQxbICRq7yv5NstW6AsnfA=
X-Gm-Gg: ASbGncs3VCyWiIU0CnZNDkg6IfCd98MD7DV/tDWkquG5pGOpogpLo+qZCNle7oFqVUf
	uevYc2x58+oxZnkFn7DNZCLkUSaYcUsDQ3OVK0DHZVO/MoMoOBP1vzIzy1lz7K35c+/N/NZ2hO1
	Gt6R1YkPOmpMD9/c0o4pMFsjrftXW3xA89E/2V1FllbKAq4MoyMPn4l2sbyJR5HkcfsNJwqbwx/
	AipXGqcWckGtbVeCSA8shSte3TYksOoYOfx14Rl0hGRJQtIjBpbdxdHaXZZ/vNiW696vyMCksSj
	AzOAbrPQ9N5fIKSVBtqkvf12MJki9WBo5EkEVfrb2ff3GzHd++zbi5Co3td4rw==
X-Google-Smtp-Source: AGHT+IFx+LSi2P1gg9frBl/nSRpkctm4QwBWfWv5N/4i2O+LQgr/nmgIxLSi06bFssUOA42kmzpd6A==
X-Received: by 2002:a05:6000:2485:b0:3a0:af63:c35d with SMTP id ffacd0b85a97d-3a1f64374ecmr1989939f8f.19.1746781188481;
        Fri, 09 May 2025 01:59:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:59:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:42 +0200
Subject: [PATCH v2 4/6] drm/panel: visionox-rm69299: switch to
 devm_regulator_bulk_get_const()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-4-c2c2d52abd51@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wFSO+bW0reZeJiU75auO+mE0Vw0w+a9HRouNJGN1GmI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP+ZjUj+MNthAC93tQv3yVpyEM9usXDnu07Lj43
 mCpk3guJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/gAKCRB33NvayMhJ0SYTD/
 9VRHzPDa8DYPUdooooCuzwmLoXMZnZugd889qT8G8CNT/ZozZGTaiHrOJpsKSK+EknLoqyZJT5aOUS
 AqWLY6WHZAGqJbOJLRqb8FkkZh1OQl869dnu4BkwAXwc53gHCC5pTmGD/DaOBYERoN1BMUTd50biBX
 CkdgdQJKrsvt7K3QdW+5VbrxgzjM8aIrrf7DmpPnVgKQNAh5ZlW4OG+YnpTrsF9nr6M7doqweQ8nYa
 8NxOTKZjZVnFbtc3feajhdNygqgDFPgNPWE5NSFWXY0qrgUKOXsjD/cS8tcA1f1sOkVKkmYrOPz/4b
 WsVA+zPgI66uPgYmJ+0mO82IfeaitLKGolj8qwKoX7p+bJCY3d5rpMj0XbhfG834BHWNAEShJgLGnO
 UW06Uh9IfoqcG33stlgxBhQAupWS79snZWJ8KLHwyhPi7IqgkDae15J11/bmo00aOo7SvTs2W1R5XV
 B5qcTqFwgYsTvNrXsjl6LAG9MZBcTCcbvSc4ih+7M+yL1nHwhArjcT5KvZIRnMyGch+Edj+WzmKmqk
 cVmCodLXMqBdghsH3f4N00AN4qKv8Hk6P90LY5XnHbDA22FX/MdFKFcSHZKcup+yEU9ut9HARqWyt9
 BW/CP3DfhEtcqfG7CoWtpnnfOViR+TEgbPc/yzy67uNCK9D+nYL6OlqrW/+w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Switch to devm_regulator_bulk_get_const() to move the supply
data to const.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index c3c14150a5546512151fb15c8e9a91269ca21c65..fe921d5fb1942c47c5b849e827c244d7fbde25a3 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -24,12 +24,17 @@ struct visionox_rm69299_panel_desc {
 
 struct visionox_rm69299 {
 	struct drm_panel panel;
-	struct regulator_bulk_data supplies[2];
+	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
 	struct mipi_dsi_device *dsi;
 	const struct visionox_rm69299_panel_desc *desc;
 };
 
+static const struct regulator_bulk_data visionox_rm69299_supplies[] = {
+	{ .supply = "vdda", .init_load_uA = 32000 },
+	{ .supply = "vdd3p3", .init_load_uA = 13200 },
+};
+
 static const u8 visionox_rm69299_1080x2248_60hz_init_seq[][2] = {
 	{ 0xfe, 0x00 }, { 0xc2, 0x08 }, { 0x35, 0x00 }, { 0x51, 0xff },
 };
@@ -43,7 +48,8 @@ static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
 {
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_rm69299_supplies),
+				    ctx->supplies);
 	if (ret < 0)
 		return ret;
 
@@ -66,7 +72,8 @@ static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
 {
 	gpiod_set_value(ctx->reset_gpio, 0);
 
-	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	return regulator_bulk_disable(ARRAY_SIZE(visionox_rm69299_supplies),
+				      ctx->supplies);
 }
 
 static int visionox_rm69299_unprepare(struct drm_panel *panel)
@@ -172,12 +179,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 
 	ctx->dsi = dsi;
 
-	ctx->supplies[0].supply = "vdda";
-	ctx->supplies[0].init_load_uA = 32000;
-	ctx->supplies[1].supply = "vdd3p3";
-	ctx->supplies[1].init_load_uA = 13200;
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(visionox_rm69299_supplies),
+					    visionox_rm69299_supplies, &ctx->supplies);
 	if (ret < 0)
 		return ret;
 

-- 
2.34.1

