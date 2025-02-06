Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69DA13D897
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847593; cv=none; b=iYsF/8haFfGTSDTSvVlnYdYKScbavfaDeoGg5Qwgdm7+m2K8FkjmBCrIj927JYCvduHpMB8WJyXfZ9HMgzKynyLkm+jZYt5ORYIhy4lufj9w2Fr8bWN4JeETwnqPcEOF3oYmXZYXHgVU1IeIpAx7xPn78NuBfI+DTQjOrsZ0EHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847593; c=relaxed/simple;
	bh=7LGrtppsMBLPN/3BsfqBcn2mKTcTO4758RF8sL1ECRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=liYqoLQI3pflniksxilEPFejPDfxNq3CuHIDRS5p5y/oHj5ENloDT+FFbzqxKRlMUvyYRal3N1jwn/b3BvEb22FcOdpYcqunuoyDb972wM0wOp/p+RIfF3liyEVdeJpRmKk5Dbs70eOFMpMd5onk2bb0f3rCWIO4kerYI2ao73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=aAKTJ3or; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="aAKTJ3or"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166360285dso15476875ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1738847590; x=1739452390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpq/JlGo1+gTZp4/L5XVxyxFvC99WE7FdLuLF6jJBik=;
        b=aAKTJ3orUYaDUeiCkQR9SsBFxUR0V/sJWzhZPKJiopkJafh6Jw68f+QPCt6MLT58eW
         SKUiwT+K72XJWRAfO2GbldeZfLE8RZFirRAyZzd+77U1Uyn/eULa79vZWlHVoZvGsl/+
         VCLZTPUBKcft6yu6lNy/Q42Qu0wXmN54QLI0f5P70lOi9UImAxLfssBsRsm4F+9Wdt2i
         143VB0Dshx3rGakJ7ceYXPpJUODq5kShuVrOoMoIIXb5TGa9hNaYfK7JxvYBN3IsBi9f
         k+kAdEGrrFHAbjgdUkqLozFwqtZLx8Yzxu9hWeG3+3TFaA0obrjRdTVHd+V2Q/6/Go6o
         koCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847590; x=1739452390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpq/JlGo1+gTZp4/L5XVxyxFvC99WE7FdLuLF6jJBik=;
        b=a1hLE1gS9aSBaR0bU6UgwHHIsU84LuU/N3X3A8RpChPR/Al2OfKOxBWNEx6g/igJ9O
         IoeAxzTDBR7orhyqIzQhXOfLL5dR2/Ro23pdBi6Kufhwmau9AhaezHkqkV4FA1+5HGsT
         ac82Oeh1P2zOySsVcVLRo2C0nyn0PpvKHrnVn/kg8bNyJ4gewi5H1IanTK8ljtAMftj6
         jgftAa8utTekyr/gI/BIr21cx2eS7CoP64QD9hDCPPhmuNQqkMwMhu11t7MTyK4u2LqD
         22MC3RGeCXCqPg59mb5OqqLGT24JjbbxuhzTx/d59LsD1L0EZfuGrCt2lVPLD1OICOAe
         Kl/w==
X-Forwarded-Encrypted: i=1; AJvYcCUHrL/1fCUPPcvPx1SMsdWN47ydVWyeFpMbtOkzFknaYR3xDHxFl8bC3TzyWD8m70CQ6BXwcRfvJkB56Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws0I9OUOTs/2Fm3uKEAhsitVbH9nZOsAa8zy6jCwZGR9L/bra6
	5aJU2IPAvgbaWqiDcfnFs1fNBiHgRBwfb/7F3w4Ly7pUV1D5XXS5KKijGE8W4bwHwtBoooj8qaK
	F
X-Gm-Gg: ASbGnct6tGe/PEc+7okqxDYdxqwhIHJV2xKNg+rhdI55cbVO0jn/SJ9xNrJykxsEkGV
	skZz8N1CE6cIbAHJjXXZnnTMGbm47AsQgzRzniqyt/9OKTREfFWtpxVBK0/bpTENIXDzNjTiSgd
	lQGFVZJsY5bylmbBvPugLrqpuRB9mddGKFXakovhpiyAF3cVnHJ+ioOIlT4YOYkNTm+OO005VXb
	CpaayY/mAbnqmnt+fUizU/4EXQrDvgbB7tYwW2V/1n8fXf06K/BMS7NRpuDVZmNDhPdM9dxGq4y
	HSjBMTiI3Im+RD+dIoGOToafraW+7XpCErmQjTqopNJYzuOn5l8iYwwtzLaY3qI=
X-Google-Smtp-Source: AGHT+IHxqvOKzx2p1ONEnCBXtdA3snICrOFz5MyCT5P71N4sfXoXnSCIV8+wBHTzkoWIRuASvb8hrQ==
X-Received: by 2002:a17:903:28d:b0:21f:14e3:165d with SMTP id d9443c01a7336-21f17f031a4mr124763555ad.44.1738847589822;
        Thu, 06 Feb 2025 05:13:09 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653afc2sm12237925ad.62.2025.02.06.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:13:09 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] support for csot-pna957qt1-1 MIPI-DSI panel
Date: Thu,  6 Feb 2025 21:12:57 +0800
Message-Id: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "csot" to the Devicetree Vendor Prefix Registry.
Adjust functions and default_mode/desc ordering to match bindings.

Changes in v2:
- PATCH 1/3: Add "csot" to the Devicetree Vendor Prefix Registry.
- PATCH 3/3: Adjust functions and default_mode/desc ordering to match bindings.
- Link to v1: https://lore.kernel.org/all/20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (3):
  dt-bindings: vendor: add csot
  dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
  drm/panel: panel-himax-hx83102: support for csot-pna957qt1-1 MIPI-DSI
    panel

 .../bindings/display/panel/himax,hx83102.yaml |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 123 ++++++++++++++++++
 3 files changed, 127 insertions(+)

-- 
2.34.1

