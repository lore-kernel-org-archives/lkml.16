Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753128382
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016550; cv=none; b=VNS+spiLZsgV7B4YWYYb4BR23NQPdFWFQ+60fvsnA8f29SwnWoFr48pdhp5t79YLk78Re40C7iLjFgyUp0stZzmwrZTnyR4lDET69+Vk6UZqXP8ma4bpT30vBaphMvGF4KN3xAz0FBw6e0jlHUp9tkdaRanD3SK1DUUoiNnp3/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016550; c=relaxed/simple;
	bh=k9IHr22dIZ13iJzs7yyRdPr8k2jCtf78mwdfDeIF7pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TBJf2lyW2QO1eM5dDxRPsx4l/y3KRtqcWhkRRJZJEogWbQMP8F9a9KJ3ehRlPFVAOwvyk/VG1FMiwwnFAfcidrQqvNRSPoM+CU+jaTWZmEkRPO7f6kMALVEy8Q6z84W52SX2sz7WWLo+iq4HyCH8Qx6YdkuvXKqNx7Fk2S/moaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vu1uS6AA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vu1uS6AA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36c2d3104so51793f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016547; x=1748621347; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6chOe/tXluDkGi3FLf3UONxFGeWcH0v84gFfRtryfM=;
        b=Vu1uS6AAWOJkPRH5lWaoy+nnbN0KQveekvSEuIkU77i3tXMAhRVFUCcKU+9cLMJdMF
         L8V2R+/C/21I/E3hAHgzTXg8zuVSmfcfblSR1+RvFAbEENue/prlFzZqBAnxJyMCdNNV
         R6IUyUoV/fUarhMXBn2dMt2UI8XaAFbDW30dhdx+jJjhjK2cb09P+mWgFFg6lH/yq95t
         +w33yGWxMYwPW9Z4aqV3qeJFzfraQrAS4Qix4pBBIT6nH4rjfPupuJW1L69L6hWwh3wL
         XVsS6RrHY7pnkMqBa9y1oXkIzW6hGB3av0FuxokRaMugDbOZi1xXWy9oxMEz9mHuq198
         x3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016547; x=1748621347;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6chOe/tXluDkGi3FLf3UONxFGeWcH0v84gFfRtryfM=;
        b=tM48i0wvT+GGAkwdx2oMe/Ag7EoU87GKOtS9IQVUiqXUTd7N9jKbcCGBhk3JP3zsEH
         MaptExGkWueCa74FcZjKzvO/fImR+s9pM5GtuE8kMC5RNB6oKpZv+UTHgNfYetNubAFx
         Zc44oY7+WsfkhBsScsxJU7Djg9elZsAXZIGOdVxYG97xUPhGiVWQezxcNnfk9psGNDEU
         dipjeI711JfAdTWfznFOPwm+v8DTdy7IV6J944vMHCIfPKHHtcuAIyrSFQKvETAuLcid
         VuyQ5y6iJbh3xM64z9gXPjKYQZwNijmn5QsTBA1shRDsrcUHNpNZdHBzrUCOJobVxPQD
         uC/A==
X-Forwarded-Encrypted: i=1; AJvYcCX30KtR1jdlDiWZ5qn8F6ySSQKiaXOKh/l2GFff8jk7YZjmohqVskf0pivA0SCJneJ6RfiUnb0CqWumioA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbB9Sct0UCN3tQk++PDEPaGWQCBBzE3TSfkLF+4Xow7SMVbEg3
	oYEDlbApP/R06jvem1eCHeUfq77t0c1DjT+gLPheaxK8zXgfixqy7aaIrsDWzmWLEvM=
X-Gm-Gg: ASbGncuNjvrZqRzu4OvObMbXMmqm79uqEG8pbd63tyH4Cd3KcTa3lF75/Rlu9GQitOh
	JiY9Lji8FUt1Ft94kwDjinmcRxOig7kXwF4jQjHJ8UPF/llrJlupBzQ4b8CmI3bCwxOnZHcmMZB
	EyOs/n0/nw42ACF6fRb1wZbauBz4ecM2ugTFJRPlH4eJV67cH8izUgQNfuOMUlD4RPoypnpQ8mR
	F5MPkSvFsa1rrYEDcQTjr4C3617DYGPs6AqThWoa95vxW5VkpBftf7mxE8xoqb/e20tN5gQvY9F
	AvjGoEAM94UQsQnadmGWTGJGcVGfp31uYEWw+ruR/o7Aslz7KyZ/9dGu
X-Google-Smtp-Source: AGHT+IHPVwqYQMQUBFaNXvEFIcr3w0MI32C5yLoljXKKKhZovzZeYOKYCcY5hi27O/0atp1C/FA3vA==
X-Received: by 2002:a05:6000:18d2:b0:3a1:fcd9:f2ff with SMTP id ffacd0b85a97d-3a35c808dbamr21076476f8f.12.1748016546702;
        Fri, 23 May 2025 09:09:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d310sm27215487f8f.17.2025.05.23.09.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:09:06 -0700 (PDT)
Date: Fri, 23 May 2025 19:09:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/panel: nt37801: Fix IS_ERR() vs NULL check in
 probe()
Message-ID: <aDCdn9r_ZAUTRpWn@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_drm_panel_alloc() function returns error pointers, it doesn't
return NULL.  Update the check to match.

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index 84d367eab058..d6a37d7e0cc6 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -257,8 +257,8 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
 	ctx = devm_drm_panel_alloc(dev, struct novatek_nt37801, panel,
 				   &novatek_nt37801_panel_funcs,
 				   DRM_MODE_CONNECTOR_DSI);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = devm_regulator_bulk_get_const(dev,
 					    ARRAY_SIZE(novatek_nt37801_supplies),
-- 
2.47.2

