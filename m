Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634B6259493
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228689; cv=none; b=U5v6zER+Thuq0cS5q0ZR9oTAoDkR5wL3+BDnZwO/QGIKU7IiLmFwpJO+FG/3HSYYQQmUn6Kdt+CXu2jZQsaCRUSLPVqYOwUzPyRx5ZobwoXu4Om1redL1BPoHC/kr9/fxnqXkgHMq3//6rrbZBqKK9Z2KjC0tQnB2yy5m6AT09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228689; c=relaxed/simple;
	bh=aFKqTt/G5OIIfUa30R3tOXmDBZclpxQj7uYaA08xM3o=;
	h=From:To:Cc:Subject:Date:Message-Id; b=mMZSD63NeYSh6ka2rN2GtovpKae+w5Zg6Ti5sCnDo3+yGBYi7nMz21sHQWjQUJP1OBYmAZpIFWHz1W++D6mXHEXSZS25fbYEkFfMgqaifZpg5SLHURQnXxt7DXoDZlDmQsio12hb432Ydr7Oy4zxASDplM0+cum+mXj7FSJBTjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=HgEXUlsJ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="HgEXUlsJ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af8cb6258bcso141933a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745228686; x=1745833486; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDEQT5UmTpyK8wbScJw07ZkJn1WpRVeDbWvf8Y9zcEc=;
        b=HgEXUlsJcLAwXfq9V+6SlNTQQ+Sil9Ul89Am+7W4NawxTqp3qgaS+KxTmVNRY1HMXW
         d0HDYBP/7iBThw5bL5/VDH3EvJTU61VxmuZKRe4AFjbymZsrub6ayYZuDxxKrAvB+Ear
         oV/36uorleZxnbcLh8f4jU4x0ZI/0yQXY4SPVvpNnNRVTQg8E4ti2/ihuuPNygwb1h5N
         ztj477+vP+usg8Yi8F0arOxMPNd/9ukL3IUe/D1/h/fNlKWfcy53HY2V2FWjtBXa8IAy
         QDq4aWnikXq+rW6ykH/awMAmQl7pBdLeQ8WY2CClAxxW83nRVu3MPmX5U3cITn9iLzw8
         UAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228686; x=1745833486;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDEQT5UmTpyK8wbScJw07ZkJn1WpRVeDbWvf8Y9zcEc=;
        b=JxBLMgFK/h0ownyO6qknQPb+3U3hinQ1qkrr0A8PnqxBmUzu087y7xOSj8qVyKLVvu
         bwDtE8yeyLr3xEVsPgZ33nWCtAHqpyM5/sfIECfhZOOPOm85sURDayh2QzDroYkZ9c5G
         h13hhJL+KfSkI8EBlHvMc0FLhAAxB3vk7JvFD4uB/oHVpPVomkAiJ+zxd14lwcB+HhKz
         9mqmigg3Puobp+t0+JbsD0atflhnZ82X6UTaitNsjFyqoIyyhYCTqmh4peXIeX6hGw0Y
         LN9uvcyk1JxVusqEepg+eD77U6YaJWJcZ95NZoWdh/2gKo+CUE7bnUU6F0Mqn0s/MEhK
         jUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDFaBW65xdWGMWdOFbNegEhZpmuZBmVfZrLPtJTNUXjRQ0/31tS83DxltBtTAw4CdIJYqMDL36/KlM+B0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUcOzLKY8Hjt9U5qvY9iUwje1r6udHq+JbOPKn1nJtrZFoKqwy
	yyJ2n1z9I6rOEGY2CjCQttbx3pAmD5HnMs1UVUbIEfyAEf0JeXGP8ndf7SD8JRA=
X-Gm-Gg: ASbGncu8V/5+WaOrBOgPXMOfO6gKn3+immC9q2ZZFwf8ZasiV5VHIpKp6Izpu07+T/b
	Wbdp883PkcTyTAnVq0FZ7WaZXTv1GJLXhHHT188ISG04fFd27SybEExoJycvYSi1GN9AAW7Y5dk
	DSWu88TareFQ0OsOaakll9ldSECSuZI8tRBb2qFFmtyGuFFjkoWb895rfMRu0I/w+WzAOqyfN4Y
	7vRN1NEO3G9zyJDKoSBNSq8/ZmpgBR4y65kYUduMHeLr/f1CphWKr9OoKQRRpyqvGoVc43BiyNz
	Wx6FmnqIC2stVDT9+SvrIq1aD2F7Xz6lWBtb0BB+d7SoRKwyw6IU06CeesFzOLXXrImf8Chpxd7
	bYqso
X-Google-Smtp-Source: AGHT+IGyGKN+jmsD3XsIQJ5rQcLtg+W/gGGswuQH0rrCgfkpkLFwOMKZpACmLAqDyXCu89NAwruxGw==
X-Received: by 2002:aa7:88d2:0:b0:736:457b:9857 with SMTP id d2e1a72fcca58-73dc15669e8mr5613644b3a.3.1745228686515;
        Mon, 21 Apr 2025 02:44:46 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e59f7sm6218123b3a.72.2025.04.21.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:44:46 -0700 (PDT)
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
Subject: [PATCH] drm/panel-edp: Add support for several panels
Date: Mon, 21 Apr 2025 17:44:38 +0800
Message-Id: <20250421094438.4199-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

AUO B140QAN08.H
BOE NE140WUM-N6S
CSW MNE007QS3-8

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..83339c0ccaff 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1744,12 +1744,26 @@ static const struct panel_delay delay_200_500_e50_p2e200 = {
 	.prepare_to_enable = 200,
 };
 
+static const struct panel_delay delay_80_500_e80_p2e200 = {
+	.hpd_absent = 80,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_200_500_e80 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
 	.enable = 80,
 };
 
+static const struct panel_delay delay_200_500_e80_p2e80 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 80,
+};
+
 static const struct panel_delay delay_200_500_e80_d50 = {
 	.hpd_absent = 200,
 	.unprepare = 500,
@@ -1880,6 +1894,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
@@ -1915,6 +1930,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80_p2e80, "NE140WUM-N6S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
@@ -1973,6 +1989,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.17.1

