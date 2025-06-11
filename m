Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D82638A0
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749636389; cv=none; b=lFigFhg9hXix1VbyfWXXmeensW3EV19JiEvSD8Qb+MImJ37HAZR8jbpQKS0tzBNyYcmeIqahVgETI57b703obnkO/g/5EaqzvmxdBlNccytUXlNLt4o949T/kUZDzfdn3gzhBtLv8fnaJ16X3feUA5jYIpE6tIw0leAITPMXWJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749636389; c=relaxed/simple;
	bh=clQ3jgN2qCBEsYAGOoMAdCnfbcHuvX/5rpXfTQ0tO3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dPUHnooJGWNP+fm4rDNJMCq+VpYrMie0Kqx1iz8Wno64Tll0iDECC6PHfV6lrERK4uljC9YRcwfsoKTr7Odqy3tQ+hMuVSSaoIapiGoUlxUsl8vooIqBjF38obKFatC1uTugNWLdvgc0zmhz7nDYlJXuD2Ndw9aSBZp/GsW1K60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jhVwVkmk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jhVwVkmk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4872635f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749636383; x=1750241183; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwt72CN6KWRLxttKBs5UY4wbGk2WVRiZkQeLI9k7oFE=;
        b=jhVwVkmkHIfPuwD9KBWQVxtQJPkEJxQaCZTFBc9/ZBGlh8L539bY8/64uNlu8nFiKE
         sb8Ba75fUcV1z0N6OtGPItzsMmZ38DITdYTbWM8dj/lfLwgGfYFUxMY8E1PqW0oDo30z
         GWa7A7SAzO09Vn1lbGj+7wUQ+8cUZSHozMQYLawNZaKhefOP4JM5dKxtwt4mqcPiS39O
         spDsljJux4NTGm8Q6msl+KwFx/RtKpkitEjfjvaNvfkx4iOAKco1sLRIzV1lppU0cZa1
         9ncOp7g84z0HIP+V9f/nr4UROS0UKdM62Mj/92MVkaQU0g89bdFwsW9Od/ALtKtHm1Eu
         Dfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749636383; x=1750241183;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwt72CN6KWRLxttKBs5UY4wbGk2WVRiZkQeLI9k7oFE=;
        b=I/uPod+4ENTe93N8Ctj1fuFXSUu9X8w+cSV10n8J8Gyow0BB8KnQD4yljhUBnO75NI
         sk82ql4k1gC7p7/aKHp5D/iIvOV+V8dGBIzJuDgWskbf/StG8gsa00Z364xqd0UbPROK
         LC/a+s8yz+OJQ86YIG3h3uUMiPx8asURfLZWIFSydTJQJgcR2EAOEVWTabxVG1zoloE0
         SnHrMWl3YSIixb9Gn8Q9fjogtKH9e60Zyxkd4MOknsRLA6UYrpHs6q7Y60noilg+ukAJ
         mxyyHsHDm8RU2OW8LnlOpLDPA8Eymq2lzcZQjkqvMLfk1u6L15RotrEj6LBWv5UWJVTV
         2V5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoUYHp7hVI2NRjeKXH8/RMyI76SlrrOb0D67JTozti4+Q/AEvOw9PJge5ott2Bx9GcIca/lWkAcp2CeLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxhJ3wk9pe2ZBHkPUsQaHVYyVsoNnPTAZ1fAJl6dpxy/wh9jO8
	ctj2MXz+9oRf+Go3WWrUOd2aEHZPJHO0NdkVLiE16PEQ4tSMejQvu4MrxiiK2FeJ4dE=
X-Gm-Gg: ASbGncv8fjrY5AYwgoFnPIdUj0cLZQZBP0HNcCTBCuyMeN0fui9IDYep1LkGowuUoFU
	qP4kcWZ0c/dCWcUTbsOKgVONJnU/eoVWjFHAR/5hY8zJKfHzVQGAE5uTl4eF4vuOn/5x0gGxMo2
	MqS9Et94asGuQuCHmIoAwn16jeJYVG/58K46E0HLzrMeHW6Foma4gaA+kCiK2FS4HiMy3cCoyrm
	xvmcIAgU1QlFTOhDhbfswZqqIMnwc1ZjSYgU08FTkEs/ayZSlHPP1mCzKs3ioMk+Mgn+1T2SF4T
	rU0lYNCVKnQ23pvXstyQgfdjVfyaiyHgSTxsu3d/ysspCF7zA7gg/rOIrt1Flo9R60gS4NctKTQ
	=
X-Google-Smtp-Source: AGHT+IFrV43Q0txBykmBCNkljr+qDXGX9/3eZHASaTsnissCeaNihvRPhHOqaPH4Muc2o0CnaB6Rcg==
X-Received: by 2002:a05:6000:2507:b0:3a4:c75c:efd5 with SMTP id ffacd0b85a97d-3a558ae2c6cmr1887798f8f.46.1749636382979;
        Wed, 11 Jun 2025 03:06:22 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2c36:1f5f:50e:d73b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm14776613f8f.73.2025.06.11.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:06:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 12:06:04 +0200
Subject: [PATCH] reset: mpfs: use the auxiliary device creation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-rst-mpfs-aux-v1-1-c86534b473c3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAtVSWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3aLiEt3cgrRi3cTSCt00g7REC0tjY1PjtFQloJaCotS0zAqwcdG
 xtbUAdcORv14AAAA=
X-Change-ID: 20250611-rst-mpfs-aux-f0fa893353fe
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2778; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=clQ3jgN2qCBEsYAGOoMAdCnfbcHuvX/5rpXfTQ0tO3U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSVUdU1TyPm/mDwlG3awa11Q7meVPnG5vZHvCv
 pywXVBGTIyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaElVHQAKCRDm/A8cN/La
 hdaWD/wNv4KAjQxUdV25bQK3T8yUrA6M2dS/nL6M5Sb6r10HgWdV2ZhJbbMdRa9WuKQcZB68h1g
 8E6Y0yTGqRkH7BykfWIzHVoayvsA9HCgfP9JBbL+KTlFntewPHupo7WbteyYlFUn1v09MXah+nB
 QV1L47Cx1mQK7g+wswVgx26uNewesjwcl2tJv6Xd0I2iXVID7TB7M17p4mFHnajS4nnqgNFFxzl
 JFLGn7OHSFPrLX+lnl5oFBMoP8xZUdR+otKd3PcJTj9xKbap6kQTo0BVjYtnYO1V31K1/8lG1kD
 Qep6hai3ipKPqTmY7XfVA4KWu1f2aujbqa0+9n3pFd5TCugyMguwcPMS4wyn9DqcPzEiEHP0eB0
 okUfTi0rt4c4D5vXwW9xYFZ/ertWVF6jXF0La9TyQKEPN68hABzCZFePnObunwyZaXiTfPEPRmq
 n1n69l07p2IBiwR1/UYK0MmQdOCLPNCAVg8n4nXj344l1rkcWGa4Pe/mf2Zn/PIx6mKFRW1vG6D
 GezBsQvvHXIcxMjywRsT65fLxQgxxuP+C40cmGgVNHCRxpRoXCSl8dr6sQRF944HxMgpTH9vPr3
 VdYW6KB4k9K3QCKUL0hnR728DkolR1ZNjX0Lr4J4NT9Ax10CcGbotAVmnU2IpAOlmG6hqnSDq2S
 Y2RsIEBzO2ZL+xw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This is essentially a resend of this change [1] which was sent a few months
ago. The necessary auxiliary bus support has now been merged with
v6.16-rc1, so this change should be safe to apply.

[1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-2-c3d7dfdea2e6@baylibre.com
---
 drivers/reset/reset-mpfs.c | 56 +++++-----------------------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..f6fa10e03ea889e5434110156f7bece808a6ae92 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
-	if (IS_ERR(adev))
-		return PTR_ERR(adev);
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base);
+	if (!adev)
+		return -ENODEV;
 
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-rst-mpfs-aux-f0fa893353fe

Best regards,
-- 
Jerome

