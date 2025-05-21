Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C522472BC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820275; cv=none; b=sVLu3xl1/BIc1GieIUZe/WbALbWO3BFccU6Zy2BBKnmShUqAMsMv/WlAEwcnp7BJQ8WE47IxFUQxKMwXiXD3j283v3YaM77RSFIocpDWfRYy7aNympcCf5p6umNiDPSwxvtqOcSkWlXz37YqPoyQaGhyKLIyCngkSj9BCohTaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820275; c=relaxed/simple;
	bh=xGkVPsNx3EjbZaaLCIIJY0B+44SY4L34GyTVckp2hbE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m2oy3h/GCNFvPS2sLR0djgzZxnJnuN/Zub3xeWZnCmdT22/GN8GUS45n4SOx2VPlZ7yGNk191GUXG1xnr1cWTLfiWYqOKiTmOS7Jvs4HfIPCfW2/G/w5Rzffj0i8flOs9p1fwKJ94Hay/4/itFfsAL3KcgJ38hb8jmSywXrGLK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=EXra/pjx; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="EXra/pjx"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742af84818cso3929320b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1747820273; x=1748425073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO1gHHlVF6gGZvRY9viyv0hbKtAsLTQwKpaodCCIfU8=;
        b=EXra/pjxXibxbFvRmfP+734Hz5LHuz2tw0WTA8pTamq+a+vgUmuTiO2F+uohHMqEgI
         G1Z7aKLYU1IsOwimnDVOOgnQJN5fHWDwk+FWOghX0lIaeGZr95hXT7FKcCBiwtLEO16q
         cBmyymgQ1iChW8WsUp0UUJT82PMCIzeBZB90mNJZR2WbDfj7PWszv2BkKXyDop3cUgt3
         7ngfRywtK20OODRVae5yXGPz9T10Oxm7NY2CMW6LykKWMVBS3IQmes0GzTAuzuxTCvJ/
         AblpkDO4Lu8Uq2s38uz/YBL6qks8YgwPsHaQVCRbuhnMWxbat7fcxH8FpLh1QNQqbC2C
         pJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747820273; x=1748425073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO1gHHlVF6gGZvRY9viyv0hbKtAsLTQwKpaodCCIfU8=;
        b=QZSh6mxcQ94UhrtII/ZS8qSPTdMKRpBo6O1uaTeisWc74+pf4wkbq2VnFjYAiv0IKV
         qTi86mx9g4mj+UJ9MZeKZH+aisd9OPU0p0xzqQdjIsA5JQjcsa/f6LDxFgoOe4hM/Svo
         GqNBKSidlM4X1MXQf3BgYzVtGAWZxiCIGK+cuIeJo8YjGDFw/kKX42bHeWsd2tFF/LZN
         +0SxgtxD6CHaC1vauP9YDjPz+BLU4mCGppLEw/pXlLAVkeVGffdFQSiDz5RpIuZY7WfX
         AGTmOP6pyp6qTJJo/iWIEIJiYkWD7rM0SF7BPMkNFUm4uWfObGKSN3LDS8NIjwBvqaPS
         fVHg==
X-Forwarded-Encrypted: i=1; AJvYcCVUv+qYn8LoKEs0wt12livILx16gry4UrONy3KloZ0Arj62pRiTSeg9ChlqXbdwYYEHwhH7XkcFsp4jOk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68rPF5jLIR/tPfXIaBUHC7S9JmVJ8H4uKlL4dyOoSsTK2g9EQ
	n9+URpZ774oEUavesJ0BJH7EHfU+P4YfrGTCuxrM01YSuZ75BQFEyp5jTrKjhAziO4s=
X-Gm-Gg: ASbGncvKm7pnrXk0EPL+RliyrEzLnnnkMAFn1KKEH+rKieHhsZxHVxnwYTtYrLLVHSC
	fYWXXN0FUhaLB9ET3P210zJf26UFQp3UgnM8XBMPdvlPHVnjDrrkYodGkuhDJ7e8ShbbcFfNYRN
	0XBRCgvCYV2Jc97ER+w0MFx3M0qFVH7bpcyABsPt1FAHdbV7SANJowDDm8YLUiSDAeQnkFhcffT
	QVmIw9s30MSo42wAlVfGZvAzU4//8QnS+3LyS4b4Z8NcLGcvZX8yCRzLRKSChyQzXvrzk7wuxUQ
	1c+AA1JzV0PQd0N5NtFTaM4t9M4eSw6jFM9j5VEE1VjSmAEEA3a6fv1p1NoI8rCbwcVNak32CSy
	CUuZBpHihFV5W7CFNOd35jeFv/LGgABkMQwMwEHG9Xf0K
X-Google-Smtp-Source: AGHT+IGj9/GHt1Rkhv1de4jt6AZ2GtCQzoZhDnZ4wR++SUUYWHHoHoOcBO/UQQls4RGHP/cLUW/uhg==
X-Received: by 2002:a05:6a00:ab87:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-742a9787708mr27488901b3a.5.1747820272879;
        Wed, 21 May 2025 02:37:52 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c6b1sm9575827b3a.59.2025.05.21.02.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:37:52 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add KDC KD116N3730A05
Date: Wed, 21 May 2025 17:37:43 +0800
Message-Id: <20250521093743.1057466-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the KDC KD116N3730A05, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 2c 83 20 12 00 00 00 00
30 22 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
00 4b 44 31 31 36 4e 33 37 33 30 41 30 35 00 e2

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9adbe0f11421..5426648e7116 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2007,6 +2007,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
+	EDP_PANEL_ENTRY('K', 'D', 'C', 0x1220, &delay_200_500_e50, "KD116N3730A05"),
 
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0000, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x048d, &delay_200_500_e200_d200, "Unknown"),
-- 
2.34.1

