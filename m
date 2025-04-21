Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BCE20F07D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223074; cv=none; b=n4s+jb/eVIjGpU3/5Q1r1vVnfxtODFTafRPTeLlJy25QSAuTk8EfQagzq4fU2zc91kw1y0jfSDm4u9jhhDTk4IJuoN4CSIjKqZfFQilt0Yafj67gz0PoF/yKTqEITt5xqEUlpLkRkuWEguVaw329HvV0f0cJXukmqXzWcYyPq0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223074; c=relaxed/simple;
	bh=O3pRsI6gkhJ8yN5yjJrEOMIYhnHfrtxVjzkgA4JG+as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tttbENMj0GJYR/fzgu1eGeCnZCmyk0c6xeYg5LxWgDdbbyiXkvEL2vMLDyVSkXN7dMOuPVk3Zqp4P/yZA6r7xs2Mm/TyQWkBZv1/jbvOXzkLTj9RsS9zkwzNGhOfo/qxAQnZEzLt4dRypLzTNHqA/0lDXt5vSr47ho162uyD8J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SQSQ8Ka2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SQSQ8Ka2"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac34257295dso715874966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223070; x=1745827870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4BsVWyVpHQ7IvkTc4RMfeoFhYjZkeiB88CiEh0P2ls=;
        b=SQSQ8Ka25w2EXCJq7L6HbbzirZMOALdFSF8TcFH6IJRuThdnxhFJC8iQTFyAVy7/k9
         vKOLW2BqN9Eh3IodiJuPEUa1mkPNKddHJeIkp5mKmfCMJomLVxc3b5Qri3roAPV3kHgN
         MCq2ur60HMBN5VhxNJyF/Im2QiF69HPH3g3ff/su1kJYNOCU0SqD/ES3VYIfbEz2B63G
         ecEcOb/BzqyLENd6KJ4rojKNidDjSnrRT5CZxhywsPiOyevPNDBaGMzHlTfO3YfgkD7j
         BoSHzrR8XCZyZVZvhF2WxwG2bp9YvmVeom0Q/W3GkGHJ0iHhtoTUt2tW/imEaeXuPBfs
         Encw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223070; x=1745827870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4BsVWyVpHQ7IvkTc4RMfeoFhYjZkeiB88CiEh0P2ls=;
        b=bq8mvhgRMAz0zjzuCp7CCMbcksq8pUwXcSnCjR0buBpqnTq5zyK30kzBEFXQXxERO+
         4cbeu0WJIE30MOUIrk6M34j9WTYvh435+RHroH8NvpIqLG0wLdNJgGWnOPC+UgIOgWWd
         I+ZcrTvkxV+zc0Umf88Xknd0SUKT8ac4O17BlOs5NMLebA2Yu26mu/DmL4ixDCVJK1uA
         GlC8EXjYALE89MB3cXh7nLNZ/2hwcr8GdUzuR/MAxht9fuabyIddVmRx0bF3IIbgi0vK
         eowXy2+7iXrJUoHxdQlmXjazWYlhcTurVXzStFF4nmsyuKsIsYfQPDOZKO+IJp+C0E4V
         vzEA==
X-Forwarded-Encrypted: i=1; AJvYcCUkYc2sHKkLp6SFKkZcbJF9rP/ytdWqDhQU4VutILC2IAHKAq6gps0yL36OjhMBYcJmPtL54wqliL2ftbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp8PCc7KD0aWnVRdmUbLFzh29mtS7/W51XQLkK1X2cyfqvHt8Y
	CZ6hs5CEBDNdHjzDqMPUb68zrgGz2PFktkWVC6MN9WCaAdiln2SEevsm8uaU7Q2wdYCl75HOzbd
	i
X-Gm-Gg: ASbGncuMZKAdilDEUBn2w+qcUlgFmdjDykcOSKKO4GSOa2IYwPCDhJwAvw1KdEt0ZSb
	au/e5Ff19aZmjyQNoKAf1/YN0LOXCmvZM2YNgKnfHhEYQCZB0Yc4TPhKeErqERsjBDSZksZH3ik
	DbzM5PGDT1DD1g529zWJWXNwA2qxcWZlm3EgbqpVxW3gBr5mwDzy2j4Cx/tjqD9DNCrDLf9q8wW
	dyApnhkNdoZTaT5wGWPbz9SBMxwyw3SaltxWrPiG6+ScbUeuikyKWVYEJktydpwQFiA9BJasUP0
	vCTarI/gsE56g4hRXo2y48OVKYYIvcDjdCM=
X-Google-Smtp-Source: AGHT+IFPfkIPZgAxBveKMS+PA1BBUxqCRSJyT3Kkijrlg8CB0K7qQWv3Ia50u+6V1cSdjB6QnqXDeA==
X-Received: by 2002:a17:907:9712:b0:ac7:16ef:e994 with SMTP id a640c23a62f3a-acb74e19569mr805571566b.56.1745223070456;
        Mon, 21 Apr 2025 01:11:10 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ec047b3sm474581166b.28.2025.04.21.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:11:10 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:10:39 +0200
Subject: [PATCH v7 3/4] can: m_can: Return ERR_PTR on error in allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-mcan-wakeup-source-v6-12-v7-3-1b7b916c9832@baylibre.com>
References: <20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com>
In-Reply-To: <20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, linux-can@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520; i=msp@baylibre.com;
 h=from:subject:message-id; bh=O3pRsI6gkhJ8yN5yjJrEOMIYhnHfrtxVjzkgA4JG+as=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWv315N/a5f2DO2mBXn+ZYGianXHm2uur42ieah2+ny
 1p+1t7aUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABP5383I8OMhzx7D6zu4xLZM
 Pfzi+AFpQenI3R/MVpWxx5339w5PE2T4w9v3J+aO6p8bYvnVUu+ulTyakNljlHhGWWn7We2eL4y
 LWAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

We have more detailed error values available, return them in the core
driver and the calling drivers to return proper errors to callers.

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c          | 6 +++---
 drivers/net/can/m_can/m_can_pci.c      | 4 ++--
 drivers/net/can/m_can/m_can_platform.c | 4 ++--
 drivers/net/can/m_can/tcan4x5x-core.c  | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 20f7533ad9e7735013ff000e6f3b11d016f8a09f..20fbef50db20ab5cea5afe4c44fda8b03e5c8c85 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2392,7 +2392,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 					     sizeof(mram_config_vals) / 4);
 	if (ret) {
 		dev_err(dev, "Could not get Message RAM configuration.");
-		goto out;
+		return ERR_PTR(ret);
 	}
 
 	if (dev->of_node && of_property_read_bool(dev->of_node, "wakeup-source"))
@@ -2407,7 +2407,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	net_dev = alloc_candev(sizeof_priv, tx_fifo_size);
 	if (!net_dev) {
 		dev_err(dev, "Failed to allocate CAN device");
-		goto out;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	class_dev = netdev_priv(net_dev);
@@ -2416,7 +2416,7 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	SET_NETDEV_DEV(net_dev, dev);
 
 	m_can_of_parse_mram(class_dev, mram_config_vals);
-out:
+
 	return class_dev;
 }
 EXPORT_SYMBOL_GPL(m_can_class_allocate_dev);
diff --git a/drivers/net/can/m_can/m_can_pci.c b/drivers/net/can/m_can/m_can_pci.c
index 9ad7419f88f83016e93667f4847fe536eca39ad1..eb31ed1f964491ab41c7811be317706a09951390 100644
--- a/drivers/net/can/m_can/m_can_pci.c
+++ b/drivers/net/can/m_can/m_can_pci.c
@@ -111,8 +111,8 @@ static int m_can_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 
 	mcan_class = m_can_class_allocate_dev(&pci->dev,
 					      sizeof(struct m_can_pci_priv));
-	if (!mcan_class)
-		return -ENOMEM;
+	if (IS_ERR(mcan_class))
+		return PTR_ERR(mcan_class);
 
 	priv = cdev_to_priv(mcan_class);
 
diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_can/m_can_platform.c
index b832566efda042929486578fad1879c7ad4a0cff..40bd10f71f0e2fab847c40c5bd5f7d85d3d46712 100644
--- a/drivers/net/can/m_can/m_can_platform.c
+++ b/drivers/net/can/m_can/m_can_platform.c
@@ -87,8 +87,8 @@ static int m_can_plat_probe(struct platform_device *pdev)
 
 	mcan_class = m_can_class_allocate_dev(&pdev->dev,
 					      sizeof(struct m_can_plat_priv));
-	if (!mcan_class)
-		return -ENOMEM;
+	if (IS_ERR(mcan_class))
+		return PTR_ERR(mcan_class);
 
 	priv = cdev_to_priv(mcan_class);
 
diff --git a/drivers/net/can/m_can/tcan4x5x-core.c b/drivers/net/can/m_can/tcan4x5x-core.c
index e5c162f8c589b2c75c51cd8a994fc93ab507b9dc..5523ad8c9175cacd330a330b0f45d2c6515d11fa 100644
--- a/drivers/net/can/m_can/tcan4x5x-core.c
+++ b/drivers/net/can/m_can/tcan4x5x-core.c
@@ -401,8 +401,8 @@ static int tcan4x5x_can_probe(struct spi_device *spi)
 
 	mcan_class = m_can_class_allocate_dev(&spi->dev,
 					      sizeof(struct tcan4x5x_priv));
-	if (!mcan_class)
-		return -ENOMEM;
+	if (IS_ERR(mcan_class))
+		return PTR_ERR(mcan_class);
 
 	ret = m_can_check_mram_cfg(mcan_class, TCAN4X5X_MRAM_SIZE);
 	if (ret)

-- 
2.49.0

