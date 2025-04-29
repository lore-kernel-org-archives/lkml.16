Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388F2BD589
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918442; cv=none; b=XWO3baG4oh/qyINdFHiSJHMX3AjvgJszLOsnrVqElkBZ0ayBvgNFkcCWKrCpZ+bRUJco8JFqk7DA4rWdUkMp6Tm9EWH3KCz75D/s0tIA+M/6IfCoqmGiBQr2HacIAgw/GHVwbRFR2vwFGlb9YFrLx5atB6iyq2krFDf+NFBTYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918442; c=relaxed/simple;
	bh=4RIqdgxdC/oOuBbLUh2vIuacG9wyhJnyJn3fbS8S1mA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=UXLONh6Tmk9B1JHHQ0cIotFmfPXrj4bMvuvRLJaIRpE+UqOU1wr1OTrVuqAPhoIRkbPtAxTWDlc2EHVbCxM2lcF6XxzvjUH3uunIL2Y9kFTrkoLz7ypBbTjJWiOZ0MnF81XrG5bXcQvpt0FJZGx3E4VubGXl8lOePt4JWzQLSLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=J6o/xd2k; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="J6o/xd2k"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7395095e9afso742916b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745918440; x=1746523240; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uXN+jhLGdXGQPrM46EPqrwhrceeRXpjRt30SBte/Qog=;
        b=J6o/xd2k6YFw+Pnd612a5J09oiPxsvodVMBF28HdMb+OvzessZeEJgfJ4y4xpDIowa
         9FKRZCCFqEcpx4dzXEx8G/RmDf9v0rCTF4LrITaNzukjWzkGmY3qf91yo4JbM2pNsYGV
         79ttsA2r27YIVYuVcqqf//kGQlUok3bXbB2n9c/OhRV53nZ87X2NFI0H34+GIbadJJTm
         rYdQBNxl6wxzl9YrZpYxR+b0UKbs58fHOq4SWsv8byGtjc9fY0qmF0G0ILhKQytXCc3+
         duwdkdApe4xvyEAL6iN4PnVsadI56Hifoe2zzD2/NU1xTakC1pox1HHTQKVxBD64AX4e
         rAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918440; x=1746523240;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXN+jhLGdXGQPrM46EPqrwhrceeRXpjRt30SBte/Qog=;
        b=LjnvvfL5bmlddFfpBvdFVtRQaZjzkNJIBvFwPoSuC7zxSJNW1KIvyr1GF9KJuifJB/
         eMXOeS04DLmrtq5y7QjcQVcOXfXWSTwuDVcVSXC/sG918fz5W4j9IQBHL+iZxm01yK8u
         QLTx9NCkkTxI+8v3Ff0umL9tsAbV32035+LLLaAOi60MK8+Q6vaIsPGK70hK9/PauSal
         drtouWRYqO9eqKKSF+fSvHjFclA4ZRqUbAX0uXY5xC2+InT2E54lBk8UFmx2MTl4cNo2
         2TPLhsYXNZHbF+rPAHhjYb+46BTNCMKlK/xo15x8j8rTLnigqyhMOoGOuo/8h4unt4Hj
         oE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1PTuLfVxfQN6E8Wsi2wuwK3exOvBSqFzGKjkNqllZoR6HUEDeHdWi376jEoxCuXv5OTuJ5VEOPW7a/8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjrS0IOLUjljeHU9hSYf5R9yGAmxjYHdjyFsBKxFdRQJYrul+X
	6Uq4Kv4En2+6CiCAy5V7rRh8pz3gHehwxCKY1EuavAy1fi/gwlrQiw9wVVN2Lfw=
X-Gm-Gg: ASbGncudQvfU3ATXJfx+YXguJ1Rk0NYVRw99qOiAvpcOm0C7UqkI4/oHx/BLiKykctK
	Z3et8jkPK+VOy3idAEaGSJIRM9UrkQJEinzAfEPESQmlriC6s47/KixLhyhcEzZWJnD7Ot8GdNP
	hRhkmMPcd8h+G8DyXw4B7nQarLKMsgCh66cIAZFBIVNc9cs1dscasGCmwopu7G9+NloBj+SXA0c
	bQLR/S6fj89BMZovchZf5uf0B64RlG0xbCf42m7zR50gEDVaZIPOqc8Ee0CNzaQtOtqd1RmQG7t
	s/U1c3D5YDMrTQB5KppfW1ilaj81ZTmE/iieahGFVqxg4LxspErySi3HLR2csb3m4UwuWJy6KYU
	mX0SE
X-Google-Smtp-Source: AGHT+IG+15drw1HE4LF6BgEWXs2qRjNpr1HvzCSKPm7xtb+B+MDf+JIRvdQU8yNQIKy6C5t5pg6VQQ==
X-Received: by 2002:aa7:9a89:0:b0:730:8c9d:5842 with SMTP id d2e1a72fcca58-7402914f1c0mr915425b3a.5.1745918439780;
        Tue, 29 Apr 2025 02:20:39 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:20:39 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
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
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
Date: Tue, 29 Apr 2025 17:20:28 +0800
Message-Id: <20250429092030.8025-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

AUO B140QAN08.H EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 06 af b9 fe 00 00 00 00
00 23 01 04 a5 1e 13 78 03 c1 45 a8 55 48 9d 24
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 18 86 40 a0 b0 08 52 70 30 20
65 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fd 00 28
3c 71 71 22 01 0a 20 20 20 20 20 20 00 00 00 fc
00 42 31 34 30 51 41 4e 30 38 2e 48 20 0a 01 79

70 20 79 02 00 21 01 1d c2 0b 58 07 40 0b 08 07
88 8b fa 54 7e 24 9d 45 12 0f 02 35 54 40 5e 40
5e 00 44 12 78 22 00 14 ef 3c 05 85 3f 0b 9f 00
2f 80 1f 00 07 07 51 00 05 00 04 00 25 01 09 ef
3c 05 ef 3c 05 28 3c 80 2e 00 06 00 44 40 5e 40
5e 81 00 15 74 1a 00 00 03 00 28 3c 00 00 60 ff
60 ff 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..a7ada5382c82 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1878,6 +1878,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa7b3, &delay_200_500_e50, "B140UAN04.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
-- 
2.17.1

