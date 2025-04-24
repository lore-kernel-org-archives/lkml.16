Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A3223DEB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499201; cv=none; b=pjAVFAaBwCGWMel5ifBo4GS9C0p6xypkc8NulEA90/ATgIP56JzP1NzW9xTg7FRQSAo9Hk/dCL1LWbTsziui1zKBHcxNuHdMO8vNAJ6IWVGue/FFScca5GU01za+23QSr4/Geg/+DwSyzTBa90HbYRZLg7JRgWAwsOfKWXNIS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499201; c=relaxed/simple;
	bh=DxBNQJBPeh8jU6Xckk6xFrDJjMmrCmkkKoxjle3sUXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BbDgRe84+QtAuM3SqpAX9toTlmQq5+hXe9frwuUioQa09JBLDijxmKKaLF7+FMC63a3eIi6V8jAxwkAetjFf7YpdlTSH7x4vvsjv9TkbkunwqA+X9vpwzM9UZrCYS43Zq6a4XOTATyeaCNRxT4LuiKk585RMMcO2schisTqEwmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re; spf=pass smtp.mailfrom=mwa.re; dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b=fKuh/Lkq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mwa.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="fKuh/Lkq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso8499475e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1745499197; x=1746103997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LBeAKJ7KUcW1dQvt6wdl3NV+6b3AZQYzsiqjB7Iqsd4=;
        b=fKuh/LkqOZju5xY0QNfjc+bbIMzJspTkQUc5EsF0fxLrfjYdPELWjzQx7XUy5c5/tA
         cMzz1Kozrxro1WCt5ZSPviclG5emk3I7G/o7kK1Fpz1ZVcRodNTIQ2jS2wMPL4Guu+kR
         ei8qtvBO+l2NTFknc5sKEBuPav1Qr3bkI21yD6mpkIHGxJc7AZRu5hSOffD1Pv3rl4mv
         4skA/Iqx6k/ZDM6CcHjJTey1pgiJVSnr//SfZIwZis+t7EaQpvkYK5r2Azq/uO9AsMzI
         7kQlHxlG37T/3eVKMxU0t/c4tzRPPuQ2P1MnNRo67TyHEFZaTRm3FXoQ+1WALXeOElzp
         XY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499197; x=1746103997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBeAKJ7KUcW1dQvt6wdl3NV+6b3AZQYzsiqjB7Iqsd4=;
        b=PUj3I9yG40LZB/+nfWMwnTy3bNtvqFjau0DPp6LmnMWRzVjVb9eQRtmgVy788CTo6A
         ezDRsYwYv7l5SKqtFY55xz4V/SvifKg88Up8aYpI4iGftSOY7aU5l6wpTu7KHfF4AtBw
         S4sbJXbhYv76CDTIdEskQlfh+LJ6Qr540qzJwqOwbwAe+ZVHYs/ry/vxHK5etJtAyMyc
         rmOlDPW4Ws5eSTYbh/s0h/9VHUUK04yu6fuVqyGh+YRigVN7IMb9/RXtKwsZ7scTWjc3
         hXv/lpbP3qkm7s4vxgivc3aU7kWX1RpMoXLuPayRygUPVN0Lckxry5mj2VroGc6rL/jN
         hOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvJlnMIEXcgNJaGqVE2SKBOgTIPEaPz0sAU1nwWQ8ZOvG4SyTlysEU95ZG/2TvSsTg1JKqmGt3SoCQLBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3bPSvLvRr/GQEdvKSzoPAZojPt4SfyZJ+2VQaPK2tjKy18rU
	Ge6xTZI5RLqrnc4xkOyBNq2ANB6Hofzffh5htr9tweFeGlLugjSitXA/AdFC2pc=
X-Gm-Gg: ASbGncsOECKU0kTJQ+5GaPwyvZkMQJk6GRBy9sZ182bay3ykZCaZcX4zw7135pkms0e
	sny5RsE2854/QKepIEsDbDb3lq5HoLvUmNxDOjS2eBDOWqbZk5laj1GOJITMVF4nea2x/uWkem1
	XMRVMGpzMlXLFGvzxe/HFHeYewbYF38O3tL1q5CVRqQD8IYBg+P/Z1cdRsLuXFxKVNbAwYMrjtk
	H6V65HoLlKTHUiVVJ5sRWgUDXp8L2yt1ktkqnxc80THoIwjn5UzDPxVp4n7pfZ4etUnvQzioy88
	suyzRSf7A/ndHYTNRjY0vWkW5WTjbZRYPVnccEINlTi9IhlCqf03teCEpAbk/cRA1VX6S00yJeB
	b
X-Google-Smtp-Source: AGHT+IEppmH4zKcBOoPZazDeFre0hec+YmCx5L9B/fZlDtqDoVt95EXVe+b4uRH2rTi83dPaArW3UQ==
X-Received: by 2002:a05:600c:46c9:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-4409bd8fca2mr16008835e9.21.1745499196866;
        Thu, 24 Apr 2025 05:53:16 -0700 (PDT)
Received: from mw-ac-stu-3.corp.mwa.re (static-195-14-251-13.nc.de. [195.14.251.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b8a9csm20471435e9.29.2025.04.24.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:53:16 -0700 (PDT)
From: Antonios Salios <antonios@mwa.re>
To: rcsekar@samsung.com
Cc: mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@mwa.re,
	jan@mwa.re,
	Antonios Salios <antonios@mwa.re>
Subject: [PATCH] can: m_can: initialize spin lock on device probe
Date: Thu, 24 Apr 2025 14:52:20 +0200
Message-ID: <20250424125219.47345-2-antonios@mwa.re>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spin lock tx_handling_spinlock in struct m_can_classdev is not being
initialized. This leads to bug complaints from the kernel, eg. when
trying to send CAN frames with cansend from can-utils.

This patch fixes that by initializing the spin lock in the corresponding
device probe functions.

Signed-off-by: Antonios Salios <antonios@mwa.re>
---
 drivers/net/can/m_can/m_can_pci.c      | 1 +
 drivers/net/can/m_can/m_can_platform.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/can/m_can/m_can_pci.c b/drivers/net/can/m_can/m_can_pci.c
index 9ad7419f8..06243cd43 100644
--- a/drivers/net/can/m_can/m_can_pci.c
+++ b/drivers/net/can/m_can/m_can_pci.c
@@ -143,6 +143,7 @@ static int m_can_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_allow(dev);
+	spin_lock_init(&mcan_class->tx_handling_spinlock);
 
 	return 0;
 
diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_can/m_can_platform.c
index b832566ef..c09c61d25 100644
--- a/drivers/net/can/m_can/m_can_platform.c
+++ b/drivers/net/can/m_can/m_can_platform.c
@@ -154,6 +154,7 @@ static int m_can_plat_probe(struct platform_device *pdev)
 	ret = m_can_class_register(mcan_class);
 	if (ret)
 		goto out_runtime_disable;
+	spin_lock_init(&mcan_class->tx_handling_spinlock);
 
 	return ret;
 
-- 
2.49.0

