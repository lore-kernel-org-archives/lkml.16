Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7927585D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781193; cv=none; b=I+GPzRbDo6JDRyHMg/CVatgbNKZABWVnsrX9AiiBUMoneUF0csmK/8aPHiEoPxMhiqpS8pIWs+0+BNE5lxMRYbucik3iujf20jSlP/Z9+K1/fHwvm8rih4r0TBNxdbuCRckjY2BKntnYP64CAS5C+P1P8Uce3Mt4mDe4naa30uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781193; c=relaxed/simple;
	bh=GPxpgXymGfi30tTTYrQvSmgXs57nzI13TRxUFomOKfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=il//0OPU9hNBsdFOiz4oYx5QonVdIp1h9hDY5qcW0IbJRf+s+jNmTTanaNRFVaTPlBIsAivm6nE9ctEU6Q7KrkMzi8kMWtbESykIgBQ+KQWPqlWkc9ksukDSDnrrOKZlL2SMD7uMYhBSvhVjtv12UoY3dNt+fUe5fkXwWGQ8euY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSxj2V8u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSxj2V8u"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso20053165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746781189; x=1747385989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRBK55taPvQMwljJYM7ckCWG6RHvCfzlKygUDbNUXwo=;
        b=WSxj2V8u/UtwmAmbxFCXAynWlAkDhl9nGxYWs01AxmCZma3dj2VLjyslNeNz/HuQpj
         uA0f5WTNq9Sf5i3iolSXKIKomsnWiLR2z7fSjmeAzgCNeDRXOuvvmURWs2HkcuB+jX7x
         Ku1qHeDJK48+WisGuiwd4TAFaj7eobCkrrRfzsQ6KspXVwTUtaUeiCNfA6MkWdTo4F4M
         jcAcCwdnzUwkvtVmPxhy+WnBTJAu4HeHR9LLVcq+N5nDkD5NdQNBOujMsZIKWm/wFIED
         zF2cO7aYlaudmMlDzz0OQ+bvAB5shEEbCR9/8jPu2Ei5DJ2OY17Uu2ZDLxScs/bxrwn5
         AhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781189; x=1747385989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRBK55taPvQMwljJYM7ckCWG6RHvCfzlKygUDbNUXwo=;
        b=a2a2L+KF+uVo4r1NoOAHuQ49x/t70GGlqHutJThqFDcEnVI7+v/KIk+VZiZgk9+6B+
         BkYrJ0OaoRfWhvMn11VWKVyrjn6X0d/Utov0D8KUg91zq6L0wjpdXDfjOQCYhGvrMsgW
         ctQlXU6SYAtWDasbOwSx3xSLZYdfXR/ZadEhJDjKbD2rZdb4LgS9BRQ/l7pi6J0AC9yf
         dbe4x68Lr11QXDqxTto7uW/uGknku/Tx0a8M/UdTT3FLdTuTQdtpz8nyq7YwI0/EK+Fm
         Mf8wImQpC80qIfXxojdM3rrPpZQIRj9Pv8ZjjSHjCDKbGsxcyb/ZdE06TpiF+VoDOLzW
         9j0w==
X-Forwarded-Encrypted: i=1; AJvYcCVw74WfQaNXL5EbJGyGhmblOR12dXGMeivNhuXUjKMqhyzTY+y9+y6EYCLEbIEGuc7266pbSBvvOdboNNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9b7bQ+7nY/D7iSZHbxf5h+WgB5OO/8DQvAdwgcq3QGY9y8wW+
	LM714FT0nYo0a/w48nxZzrQCSYMXit02nffL7NAL/wb4qMgY3WdaTpTqqbSeQQA=
X-Gm-Gg: ASbGncuzE9a11prergL5Lqt9tClPYIbvyn+teJTh7PaL2k9c1Dwj9V8bV7039V+fu66
	+0mTRmkjGZnl6v1WZEmav3Db5PFf4KrZjEfApVnd6trVt6mTcoFfeNxaawKTCPY/OeXIjb2MeWB
	GtKrpmCkiG9P+vALdkaYsgqZUZmFpf3YBinxYEw0qloAsVZ2VspgiMQzv90uB/Plk4AqBxeF2G8
	Bd+D08rZi5amno9Sro2VD4LoTKUTmonWWH6gddYpac0Q5ZC5zq7qpjvbvKYG0kqRA49zhja1udf
	7W5bGnR06VPpSo16DhZFsSRYAFa/WwtqpdojFNorY0WXY+8Loa/6Nc6VfDV3Vg==
X-Google-Smtp-Source: AGHT+IEi4oRGxvf3rarJ4EA34gWNHMfrrN3mGvf0JwgmZirlDAUM4wqDJEk8pEjPJG5QidQ9TfqiKA==
X-Received: by 2002:a05:600c:6819:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-442d6d1fadamr18291925e9.11.1746781189468;
        Fri, 09 May 2025 01:59:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:59:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:43 +0200
Subject: [PATCH v2 5/6] drm/panel: visionox-rm69299: switch to
 devm_drm_panel_alloc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-5-c2c2d52abd51@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GPxpgXymGfi30tTTYrQvSmgXs57nzI13TRxUFomOKfg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP+ecnzg5DmaJYJHRyGNTCk0On8akQmyvH8H1be
 11j4ZFaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/gAKCRB33NvayMhJ0c3FD/
 90n/oSSx9N6qgcfjfwzf3awcAVX8BUxaNhrnpe4bmiMausPmc3BqGPj87mkqFXAw8/Rfp5oBo/u4Ws
 vPFbeuKBxR/SMNztQWHNFFshE9gbxGFbixJjSEQDWKjyTaMliok2L8aejsXgMIcn8ju46cPMYDb/BE
 YsN9NslV0VKPdtk00S+KnOa2nUjD3P3BSlO8qrmu1XMa69mBdbzDawflXr8cPabkW6x4gQAPHD6ceZ
 O1B00P07Rbkuf3W1mcJ/RjRZ/m5BcvOxicEf9EqW3j9rhbtUC15w/b4HJh7HK7u0riRbJC7Y4Q5f8I
 PKSRM1guQeN9nzrLn3E8Y1k007qRaJH4MAFu0rXjs7fHIWeiyt8Ut3v2t5tJJ2S772qVP08tIPqzbW
 6zu/SaWn+X8AkRFNSUli4LaEJL5PLdg+G4ieM6VPzPHR6i8/T5CN/cdIlZLARbTWmbtGDCJTkpAvvT
 lyElkXPnGjg9CsXUufTmcje9dB8rGchodRfuV+njvMav8v/9g5xyBAmwPsiF2m4ZhmdYcHCLDf4joy
 CEnFXw7GvGbGEyq2ks9+s7TpUC1NzvKSHIywxlyYtXfhlx5RdYdhqFwhHTNS1NZ3mnKiuhGUYw5aZN
 ZayrLHIexYn6NZHRExd2Tj7QBRyLlTbhphll2fAewTprlWnXOFE7//48MJeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Switch to devm_drm_panel_alloc() to add panel refcounting.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index fe921d5fb1942c47c5b849e827c244d7fbde25a3..fda1caa9052dd1c61c2dc23934d5faa8a52a6e31 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -167,7 +167,9 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	struct visionox_rm69299 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_drm_panel_alloc(dev, struct visionox_rm69299, panel,
+				   &visionox_rm69299_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
 	if (!ctx)
 		return -ENOMEM;
 
@@ -190,8 +192,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->reset_gpio);
 	}
 
-	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	drm_panel_add(&ctx->panel);
 
 	dsi->lanes = 4;

-- 
2.34.1

