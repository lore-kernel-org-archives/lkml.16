Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E242EEA6;
	Mon,  9 Jun 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472498; cv=none; b=DYCRZ4wcCxFOyrH5NBN92H+PUe327KHupu7btLH6EPU/Z00xQmxAV7KXJRssLZPaUJEldzo2LSYLAHXroDcoGDWKMSW+jefyxLUNhbc/DHpKZ3S29NIlV0jvAa0uFgc2wcOVFtaz/asqKXgPNyktE8mcARUCqsAzz3mFQegoyHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472498; c=relaxed/simple;
	bh=DZoggPhryHEbiSsWnD1qSMm0Ex6evuXzI89YJOMAkuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TqJIFmIibu4mXT+SBpiW7k4kbjUP7rHL9ndoH5W/rpKpkmIM2r7hu296Ewz6kZ+n4crkWaRpudHl2CVo7ftc6OOhOnOtHJZ3PlPszVTDWWokPuSMA7qcdk2hJTCjf8mgYA7PWDt96oEEVPPU1t9uAl1hkn3FKRuqOhfNaZYpWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Do+cNuTF; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Do+cNuTF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40311438D1;
	Mon,  9 Jun 2025 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749472493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/lXrCRhExUtlmqo2B4UhVKucY7yhOD4yivNwZVPNXi0=;
	b=Do+cNuTFLztXUxWawVnq0GbbINbRvQ9w8gcA6dIyC1LptnU8u1kJiSaykxshCl/I6gKiFq
	MrSBTAaOtl0YruTddQ83GfG0OT0h6Xn1VHrxFQcFEhtOSvVFj3CtFAorO20n0gocjWoKUX
	PKZ80AV28WxDuf06HWg3SoDrVd+n9AvSFKU66gjpDkBx+9DIEzDbuA0bUGDtyCu26vJmZK
	Y70EsroowaIQp7KFkxKCGwdMglB6LakQhtzlCgMnZGE8ML2xUZ4xOz6HyrfFOFa/9ImoDY
	RTAG4v4GF9w8vBmwufgsOlnGXvtMQLQJB4RhCtx9gPxfjuourKN/QinR5WG39w==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 14:34:49 +0200
Subject: [PATCH] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Use
 devm_pinctrl_register_mappings()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-lenovo-yoga-tab2-pro-1380-fastcharger-devm-pinctrl-register-mappings-v1-1-fb601f2b80f6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOjURmgC/x2OQQqDMBBFryJZdyBGKrVXKV2MZkwHNAkzIVjEu
 zd0+R583j+NkjCpeXanEaqsnGKD/taZ5YMxELBvbJx1dzvaCTaKqSb4poBQcHaQJUE/PCysqKV
 tJJCAp7pD5rgU2UAosJZmd8zNBQU3rji4aUZPZFoqC618/G+83tf1Az2CW6SWAAAA
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgffgffejtdeivdeifeeltdffgfeludekudeiueffffejuedvgfejteeuffegtdenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Use devm_pinctrl_register_mappings(), so the core automatically unregisters
the pinctrl mappings. It makes the code easier to read.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Compile tested only.
---
 .../x86/lenovo-yoga-tab2-pro-1380-fastcharger.c    | 33 ++++++++--------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
index 25933cd018d1..d4e767822ac7 100644
--- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
@@ -240,30 +240,25 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	int ret;
 
 	/* Register pinctrl mappings for setting the UART3 pins mode */
-	ret = pinctrl_register_mappings(yt2_1380_fc_pinctrl_map,
-					ARRAY_SIZE(yt2_1380_fc_pinctrl_map));
+	ret = devm_pinctrl_register_mappings(&pdev->dev, yt2_1380_fc_pinctrl_map,
+					     ARRAY_SIZE(yt2_1380_fc_pinctrl_map));
 	if (ret)
 		return ret;
 
 	/* And create the serdev to talk to the charger over the UART3 pins */
 	ctrl_dev = get_serdev_controller("PNP0501", "1", 0, YT2_1380_FC_SERDEV_CTRL);
-	if (IS_ERR(ctrl_dev)) {
-		ret = PTR_ERR(ctrl_dev);
-		goto out_pinctrl_unregister_mappings;
-	}
+	if (IS_ERR(ctrl_dev))
+		return PTR_ERR(ctrl_dev);
 
 	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
 	put_device(ctrl_dev);
-	if (!serdev) {
-		ret = -ENOMEM;
-		goto out_pinctrl_unregister_mappings;
-	}
+	if (!serdev)
+		return -ENOMEM;
 
 	ret = serdev_device_add(serdev);
 	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "adding serdev\n");
 		serdev_device_put(serdev);
-		goto out_pinctrl_unregister_mappings;
+		return dev_err_probe(&pdev->dev, ret, "adding serdev\n");
 	}
 
 	/*
@@ -273,20 +268,15 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	ret = device_driver_attach(&yt2_1380_fc_serdev_driver.driver, &serdev->dev);
 	if (ret) {
 		/* device_driver_attach() maps EPROBE_DEFER to EAGAIN, map it back */
-		ret = (ret == -EAGAIN) ? -EPROBE_DEFER : ret;
-		dev_err_probe(&pdev->dev, ret, "attaching serdev driver\n");
-		goto out_serdev_device_remove;
+		serdev_device_remove(serdev);
+		return dev_err_probe(&pdev->dev,
+				     (ret == -EAGAIN) ? -EPROBE_DEFER : ret,
+				     "attaching serdev driver\n");
 	}
 
 	/* So that yt2_1380_fc_pdev_remove() can remove the serdev */
 	platform_set_drvdata(pdev, serdev);
 	return 0;
-
-out_serdev_device_remove:
-	serdev_device_remove(serdev);
-out_pinctrl_unregister_mappings:
-	pinctrl_unregister_mappings(yt2_1380_fc_pinctrl_map);
-	return ret;
 }
 
 static void yt2_1380_fc_pdev_remove(struct platform_device *pdev)
@@ -294,7 +284,6 @@ static void yt2_1380_fc_pdev_remove(struct platform_device *pdev)
 	struct serdev_device *serdev = platform_get_drvdata(pdev);
 
 	serdev_device_remove(serdev);
-	pinctrl_unregister_mappings(yt2_1380_fc_pinctrl_map);
 }
 
 static struct platform_driver yt2_1380_fc_pdev_driver = {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250609-lenovo-yoga-tab2-pro-1380-fastcharger-devm-pinctrl-register-mappings-26fa329badee

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>

