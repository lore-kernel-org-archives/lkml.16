Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB6214A6A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940944; cv=none; b=a4pnLD9YjfMVCbY8QdvBie9eRYheQuKuXOnsJ2g+cRjdzx1ctyfhH3kQDcDrvcJ46vuvUDBNI86rKIgD7G1NsMHpbxSsYhGGxbAI61n7ih9iUjcJbk25NT4zptS6xOa+LYcXhEF3LKSCXAvzT06h5i+VU/yT8q4R2319LT2dKBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940944; c=relaxed/simple;
	bh=CtX569IokO7YOabr1anwNSEIZHqFW37Iwrc8CrNdPEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sTr2dySmi70kQqZmUmyIXuNcg1DX6nyHkIZ6IZlAO/vGzF3cThgla/szBslPgs8RQDpjY6P9sgICd098Z39lhmWbDSj//WiK3W9aD/R9NmskIBmDlsSniKP0yX7rPM+vpqr3oBe9kDqHiiahm1I6D0tGX1Ou8tOA05fm693Xevs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=uCmsOdI9; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="uCmsOdI9"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748e63d4b05so620696b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1750940942; x=1751545742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlJYTL71/uAz1u7d/EHP8CqzSYQGGLACwb736n4vqIY=;
        b=uCmsOdI9oQPr/x0Gy0GzGwerS1VNUWlFLnvp/+g1oN2fvYImOKBrQNXxlRT3rdAWJ0
         DeUWxsg07lJvIBgWuStsq+ugXyI7tiZQfrDhNAPbkhVwrAWral40tcYOl+WbBq3AhLRn
         VxXIkv2HVx7u3NIfwOlMaxs4oCMtCgbdQpXbx/dMAbHONRhBdgAA/xNustQvLWjHlwhK
         P9uJre2NNpFKwhM6FujKXWJTTCGqvLXxSoRvVsymyJ8M0C89xepI+FVgN1l/NuVb5T04
         iC1KhO8mhFYtb4fYFhVJ5DJ++ezmJK2cREjPO0vQ4rm+lMVC+e8kO+WVWf1R1F8hayDG
         BhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750940942; x=1751545742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlJYTL71/uAz1u7d/EHP8CqzSYQGGLACwb736n4vqIY=;
        b=W1ToTPOpnNjRDupoa9mfHw6jzovpOiuwBFTLXMj6qLfjRWXxgZ+PCyUKxMnVZuR7R+
         T8R7h0kg5QWVTO2ZlsLoToSxJMdWOVisxYlLON+qwfh0eylvJyQiPEF20YkIk9JArMv4
         TwHm8+m8v4h8c9g8ItGgAlxAloGxKNQ3C4cZ+RWLs4xoydcUEZnK8puUUZMSUCIcsC70
         cm3zbuYfNxUngjoxZuKmqI/9Lp6zTTAGTWbt3Z2qyvCruJAju0bxFkasKlDTJLdlTSLu
         /8MTyUTnWzi7PW9N9/a2oggr/Yx4ilcaZ3bXsS35jfNrqR3rdir1D+fZyXK/8+QiqGhK
         dJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLmgQ1JCNIPoiDqRw2rnBWi9fXRuFFgNebNl/veSOdtnT+pKkTAi22kK3oIkNxv4+J/62qJci3nj4JyQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDzK8x1sL89P3B2UocUBWq4CpXrwZSkqDSbqed/aiUx9NPGmx
	QA74LmfsQ+DvE0jWUG8aKd20BDsO/UM4EX+gS/izaETR736FUN/pO4/uZKMr5j1Y8m4=
X-Gm-Gg: ASbGncuAMtjlGaY9gLwKSv6jnb+ebnva3v1YrI83x14GWa0Od7MXmYUNSG0ruxEG00X
	i9kKBGkAxEPMy71PjK7p4a/JBcbzcEf+rHTa5apqg1QE7aUy1AvIMJKnPLpil+0D19e+N2CUL2H
	QwM7VVMFjvI706USmuBLzkayxrj3m2Z2MeTKqlVAWZntn/g986h+e0FyP2yferav8cLO1GFc9dd
	mn78I9O1kvyFkPHXQ7nACSQIyRGBzfpoFv6KP7Y9kqDkKfZPtPhuP4clzMOc2Hic2+UXF1Q2Fft
	13qsIuoUu2tRg4ija5a68O4TAUTu6P1Vs9HSOdlx5eY5dBOu5LqEqgpGV/Thd00RuVvDE85rzBl
	lrbvMFdyIQ7Yvuw5ZJRqHT2d/pWGx89iqpEhAAH7YBIOv
X-Google-Smtp-Source: AGHT+IHFFcG/GMI0g35/DAzgIDspUjp27oCkusKnYgLyEdL2QPjdYyJLZIGQPZjr9B7yRsrrDflIiQ==
X-Received: by 2002:aa7:8893:0:b0:748:68dd:eb8c with SMTP id d2e1a72fcca58-74ad45817abmr10696205b3a.23.1750940942511;
        Thu, 26 Jun 2025 05:29:02 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e217afsm7298432b3a.55.2025.06.26.05.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 05:29:01 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add CMN N116BCJ-EAK
Date: Thu, 26 Jun 2025 20:28:54 +0800
Message-Id: <20250626122854.193239-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the CMN N116BCJ-EAK, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 0d ae 63 11 00 00 00 00
19 22 01 04 95 1a 0e 78 02 67 75 98 59 53 90 27
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
a6 00 00 90 10 00 00 18 00 00 00 fe 00 4e 31 31
36 42 43 4a 2d 45 41 4b 0a 20 00 00 00 fe 00 43
4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 4e 31 31 36 42 43 4a 2d 45 41 4b 0a 20 00 80

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6c45c9e879ec..3796c41629cc 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1967,6 +1967,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116BCP-EA2"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1163, &delay_200_500_e80_d50, "N116BCJ-EAK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
-- 
2.34.1

