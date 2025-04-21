Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6667E265615
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235423; cv=none; b=buPH/SsBOTqqJnK0wangoxM+KKYicFGR4Z2Qujb9ZrMUDrmBbdjYuJjHmxIAGwku7G4FN+2ulQt5cvF5TNv3v5AaeuDbFIc+9a9/aQOMe6GYa1Mb+LuGn9QxlKZ29ECRzXAY5MrNBEg62QAns6hUf9NxOwPAoaLGdIpRrPWsihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235423; c=relaxed/simple;
	bh=ScwmmtAcgJR8Fqj5YrDyyn1VX7y4nMFu0ZnPkq/zfJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=e1m7xP5CIuTzbecXCdm1dD1Rqm2989Rdzj/0pQGPJiXjmKSUNrO55CSa+luEi+jNCMZbx/7fF7m4wLAXY54duqdOv4dfIRRC3XSqkDlqVJ+i5ulcPghQ3jG/nsrJ/D2YqUak8uzD3BJbUWjMfUIgsgnWdBU/WZwWYmKTPZx0el4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=OeL+ibQV; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="OeL+ibQV"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af51b57ea41so419210a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745235419; x=1745840219; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cgtjjjKCRxClYti6rXY+0AHa3f1l7CcQ+jhoO9zTJxE=;
        b=OeL+ibQVvdDkVWyFDoOhmAetWVCsiq9i0oi1e9vsgRn6bs1SLNZSwv11CLj3yRCzKB
         xcD8VRvyxnqNHjdBzCDILkfhpeZOOYRg6BrRezwDnivhQJcgScuQq+m1hQkqKlkKHsYk
         z27uWpGAmA6XV7IVq2krNepPFqzzUw0asC8YcEMWu4LKQNPGIoz8aep+HU03xYlUilkj
         qUp9/OVvsTiXE6pykA98R0L7LGMmf54U6k9xQnMMXU19m1fIYmlFdX5W+V2RJQpyOMtN
         nvCLvQGzBMArFI46HERkoX17vZJ8SZl76rQwKSjkuTAKSKzo34gSDgHCus8uOR8DqTAV
         +4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745235419; x=1745840219;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgtjjjKCRxClYti6rXY+0AHa3f1l7CcQ+jhoO9zTJxE=;
        b=nLpus7mXCerSosp1y/7lXWHZNpv8IHlr4V9GUYT/LKeHxQ8PwvhSHW5UYl13fP9k3W
         1MN8RT8df3wonf+Tj/zbd580YM8c/QYwww69EBJAUze4FfdCJ0nON6sSsKMMkTZARKSZ
         UlaLPr+4wEp9YgCU/vKWvZR4j8nyHyaHrtrtmBBDdv+GnQeiWiRlLAD4xtCRo8sRnrMa
         7JaY20v3qCXeCKC4Y7Gz1m8XA2DDxg6FHolJaNKKPyxtA648BrX6IOE994r76d8zOroS
         ytLKhxRX6AgueiA3RAQGVJQtYNE1KMHpqD0ruN6rl0PsKhvjBPyZi8NhhMRxobjsnC4O
         h+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxFAd72jBzVTMwNKANTj3JCoYVCD+SA20Uix1DiiQVFgDEYwEZvVKCwAJ3/58YKCkfusTl2NY0lrgTTe4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0apK0Olz1N4BRR8giGPVr9OKZhvTyViPxVpolsNl5XovwTwii
	fddHSPKPuVsUkW+Z9msnHD3IX6OciYsqvRz2dTHdfBy7pKGJgg5nhBr7k1eJlQ8=
X-Gm-Gg: ASbGnct8uJWfTOm+RxAjXLdu8MojwsFN763iNCtAiIylqxRq2mobwJVQfWbrxxuLU53
	IXfRTNbCovqCtn0+YpMbXm0Bm5FyaTJ6d0kwsK0g60MJE5bQk9KhMaFuBINGOU3J1Qi5fpadgcW
	iozewJAWnFJpNH468n8VuIy1eHNM0IOXGLqPC3NWVNrJ1tZD/BL95RpSkm4v1zqFVgEHDLY93pM
	yryJrhS/2pra4hdelc/gcFVQxZPbXiZufB4lFMFZ3yPDMmhTu1/zLbPouMV4qfpWpJo8IMLvl8x
	pWVHB+ete7kGsV44nhQCwFEFtqh9J17pcxYbg8R1a0Jo5wNqBU15yktnTaPauQitAdEqDbtzssH
	uqK+w
X-Google-Smtp-Source: AGHT+IEL9RdM/lWdE8mAC+ymrQ8GL+mcn2szB9uvQOzq+OMmZ1jIMiAzJba//eD3KsmEjFBwsseVdg==
X-Received: by 2002:a17:90b:3b85:b0:2ff:7b67:2358 with SMTP id 98e67ed59e1d1-3087bb418b2mr6289249a91.2.1745235419418;
        Mon, 21 Apr 2025 04:36:59 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:36:59 -0700 (PDT)
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
Subject: [PATCH v2 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
Date: Mon, 21 Apr 2025 19:36:37 +0800
Message-Id: <20250421113637.27886-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

CSW MNE007QS3-8 EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 57 14 00 00 00 00
34 22 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 cd 7c 80 a0 70 b0 50 40 30 20
26 04 2e bc 10 00 00 1a cd 7c 80 a0 70 b0 50 45
30 20 26 04 2e bc 10 00 00 1a 00 00 00 fd 00 1e
78 9a 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 53 33 2d 38 0a 20 01 3f

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
80 3d 8a 54 cd a4 99 66 62 0f 02 45 54 7c 5d 7c
5d 00 43 12 78 2b 00 0c 27 00 1e 77 00 00 27 00
1e 3b 00 00 2e 00 06 00 43 7c 5d 7c 5d 81 00 20
74 1a 00 00 03 01 1e 78 00 00 5a ff 5a ff 78 00
00 00 00 8d 00 e3 05 04 00 e6 06 01 01 5a 5a ff
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 76 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 92844ab4cb9c..71cbee86fe81 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1770,6 +1770,13 @@ static const struct panel_delay delay_80_500_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_80_500_e80_p2e200 = {
+	.hpd_absent = 80,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_100_500_e200 = {
 	.hpd_absent = 100,
 	.unprepare = 500,
@@ -1982,6 +1989,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.17.1

