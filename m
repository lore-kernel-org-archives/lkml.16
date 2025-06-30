Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FBD292B44
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305987; cv=none; b=mIPTuBvSR0kzAwqCZFlhL2EyDXCj8fXscC7wryCsAlNFFlhgkLJVKFlEa5QoUPUg4TpetlKr//9jYSIgga5zQMXIqQRa2BcWBTT7lwPYJGFK3T5D1ptbDT0FPvShAsoiRbcgq3vgHW7xydEMAHH6v7OC1n07ndGYl62LbXb6k2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305987; c=relaxed/simple;
	bh=G0qWNoFWGmiNDqgD1P4BF7P8cK48XuZ9ZuuSgPI24Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tM4DCVe1bbDNaGu6vtwYH9cYF0uIh8wlNHRSzcJDQqb2VM5vHTawspYHvoEIdIjE5psAwzQHygMCLdwheacC2I0tZWJFArPVoUcvG618ho5FMBJ3ZZKn7/G8KIfX2OkLd2htibd0LyUPrlGqTaPg+MQH6HDui1MxN0tBZKn+0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK0/iUSw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK0/iUSw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso7381915e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751305984; x=1751910784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVDH3IFHkeXQ0WJmkJj+mJm46IetKk3t0NoyteEO2Jw=;
        b=NK0/iUSwzayOZ7mnlwWO0mu6UIL5at5veXGk2Plq/nk/4e8zjqPnLP+L4Y8EEFX0D6
         HdgUQn9VMQ2kA4wMhaxdCjw+v42uGDc7CSD67MZM0HjEGGTtvZVEOJ8zFtcylQtv4sKs
         vYvBFRe8cDRd0R//XuGrsjHv+k1VubENCf1dSHjcN+l3X/rV2c8VOdYEf8hG5aSiZ6/w
         NnAdp3gqdBvzatVaF79JCYRcodC+mr3EPGhP59Yk6sFs7A8JFQFZbKOHaUk//l4EEa1y
         ct1q0mPJ1yBnD8fss4NA8fPM6jYk21onNDv/u29o8L5wQne2VzznJdIQIAg7f3BFjlI5
         0/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751305984; x=1751910784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVDH3IFHkeXQ0WJmkJj+mJm46IetKk3t0NoyteEO2Jw=;
        b=WqLyCztIuVfv7K63/bHaIKnWlV9LwKTrGphUjeyXu/ZClbBAFHD06kUuvxX/WlXGwa
         dLIZ5LohFW2G9f24WDM8wRInKsCJvDcX5Cv8Q4oZ761A+L/kdKn3DH6Wv06zpYevZK5Y
         GRm5+tzXbs6tPMup903rpfyzuI1LcFnf602JXGamJo7cgxwQUpuCadRxoyFT2Ywsk4ZZ
         AYRJMEHQeZJ9zLFtbw+bx+IMKA3eohcpJqVR8EAbuMlDaZfoOCul5EsChnZHHx+QojVq
         Yup8RY7crCap0JKWOe8MVNyF3IeeE9T3LT0bmqM09ORPQs0r3DazsRSEey32wbWBB9Ta
         QVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI4ly/mXZBCKBcMh06GWglO3mCreuumiE6cRne3Ij12LmVMtDsddFsWhi6+kUDFyvr1Ft3I3DZc+L+cVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPU70Q0lG3luAQ/d41+cv2XpZwFRZp8xRHilUQkPR99Cedaz+X
	T27/tIBJcGP+suD20Q1ywlVMpwNbe48Qc19XuT1+Iybm9J8d6v6urkkQuatRRQ==
X-Gm-Gg: ASbGnctlNcmD7Ttr4BrWi9EOEXly4gcaq8/D8Y4kTZKAah1NGuAY3Ud1yd4o+NzOH/9
	zuQhTxDoCnr+4jNhMoZNaJQoFmdr7TIrZrci/MVXgSbtBxvH1QjPIEjkbYLPPMqRoOh4EvXywwK
	BexxmGyAGBGofFKC/wDNfd7n225dy6Hq9VcwvC8xxlmsyO0CECaFJXo6v8tbKYIrf3bZDBqAOZP
	M9iQA0HJNekrZKSSWfS9IdYTuejGYLBJWPbKpagvpYXxSSq0AVESlAqXsn4Ek46pr50H5IilwVo
	l0AxMU9xX+CyjcipkuuYByWF6bQhDyPca6iKQAf6b4whH7N97LWiBWmkW5mz8UM3buaKpExbSAh
	EfoW5gLJ556R4HzbLwlHXkgeY7K3W+jc7YYW5VO7MjUDuevtp6fVMibntQ2gB+5FFWMOLuzQ3ZM
	o2Qo6iPSZCSlZfVvTfVILH
X-Google-Smtp-Source: AGHT+IHCeLu8B5boT6CpCjVQhUTrEdqMDg6uZ1XMOCKhoU9rsjwWQm8IVUiaMkggBWhCJ5Ysl24bVA==
X-Received: by 2002:a05:600c:3ac5:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-4538ee399efmr143966895e9.12.1751305984001;
        Mon, 30 Jun 2025 10:53:04 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453822c6b9fsm172058865e9.0.2025.06.30.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:53:03 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] reset: brcmstb: Enable reset drivers for ARCH_BCM2835
Date: Mon, 30 Jun 2025 18:52:58 +0100
Message-ID: <20250630175301.846082-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BRCMSTB and BRCMSTB_RESCAL reset drivers are also
used in the BCM2712, AKA the RPi5. The RPi platforms
have typically used the ARCH_BCM2835, and the PCIe
support for this SoC can use this config which depends
on these drivers so enable building them when just that
arch option is enabled to ensure the platform works as
expected.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

v2: Update the defaults to add ARCH_BCM2835

This allows 6.16 to boot on the rpi5 when just using ARCH_BCM2835,
which is what Fedora uses, otherwise the boot stops due to deps.

 drivers/reset/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d85be5899da6a..ec8c953cb73d4 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -51,8 +51,8 @@ config RESET_BERLIN
 
 config RESET_BRCMSTB
 	tristate "Broadcom STB reset controller"
-	depends on ARCH_BRCMSTB || COMPILE_TEST
-	default ARCH_BRCMSTB
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
+	default ARCH_BRCMSTB || ARCH_BCM2835
 	help
 	  This enables the reset controller driver for Broadcom STB SoCs using
 	  a SUN_TOP_CTRL_SW_INIT style controller.
@@ -60,11 +60,11 @@ config RESET_BRCMSTB
 config RESET_BRCMSTB_RESCAL
 	tristate "Broadcom STB RESCAL reset controller"
 	depends on HAS_IOMEM
-	depends on ARCH_BRCMSTB || COMPILE_TEST
-	default ARCH_BRCMSTB
+	depends on ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
+	default ARCH_BRCMSTB || ARCH_BCM2835
 	help
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
-	  BCM7216.
+	  BCM7216 or the BCM2712.
 
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
-- 
2.50.0

