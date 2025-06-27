Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164062957A7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067694; cv=none; b=ZJwuEDHaSd/U9Egj+5pRhGuEXA/eMfqWLkMsFAMYYjve1vHNIvHy4oJYzlatpcIFV7PEPahVFy2U/FyTUUMyAMP5jcNtk8UXOwRDinJJOrDWeTapm7Zr54sHMdJvXQBCANVX6hcJStdhyiEI5E+XattEma8vwWteGjpNZXAI4UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067694; c=relaxed/simple;
	bh=rTMPy0vWx9yUwEty5cvxFd319Z4yZNxLlJgbcACjydc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4Wze2+UUPHbHmpqOam5OOfVPoFDv0HrrizrpgVvbXYu2FmIIZwtXHYYFsxhyzK+Bg2FsKL04H8p1Uk4I1jEcme83KZHRK73Rs93KSzbKFek3Sk9MtTJHwQMgfj9WTZ09Vdpxs5xm9ScC0U85ggQREuhGHu0UwkWalKwK3l0yJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BbzEC8gP; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BbzEC8gP"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-40a4bf1eb0dso246376b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751067691; x=1751672491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8Mb5Ax/ZzHIZ0v1JkgbwozpX3DBIbsec6z6Okbm1Lo=;
        b=BbzEC8gPANpaAn+uSNtPtMD/Pe1+/6msI3iKmX9vRg1JnCKl9MkM9w8V9UMI9+xUXt
         3QkLrLuLCtHrMuSTgwIDDw+OI6WRS3cISfrj5pPLgbR72NXBap2f3rhISULtHnfyDCsk
         FOaRaXdaURoQfccJSMDJfdHtg3AmuAJoVLrrxUuVUBbe3enV257D+CKIQzwZlTn/dXZJ
         ZDNJJ8pNFZafWt+51DujSqe0AYH3loUnxiQnl2hCf80Ft8m6B7JTU6XqEvwtez/g5xA1
         rhDtMnPcjVMNOMmBuYrc3dV9peVvxc4xrdktXS3DR+yZKcHJYmSFBrVcykCMW8fhLz06
         2R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067691; x=1751672491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8Mb5Ax/ZzHIZ0v1JkgbwozpX3DBIbsec6z6Okbm1Lo=;
        b=lSvgKdcmZo2P/bRGne12ICv6p+/so4N1sxxxPJmvZ39QbXZxkZjm+vxQ6P0cg0aFq9
         ji9ryRrnzwCdtrJ/r47IEQBNcjVmBjTmrPXoUNivGF3PmCYfsAHdTFLyvHBc3bOiDAD/
         ZVVQZN0K/XDtLOliA3o9l6NgOm87oJAoW3kTrSoVcJMHSbQPOKCjn15rT8RPylUGl+lx
         NOC4yO8s/DNfxvVcoPI947L61o/x5K+RFBgbNz0QLxwTXrrYlSA9c8/JY/XT+MMjUVfA
         EGIkk9Nn/SIrxDIIyh08qe7pLxZ8sHOgxqDJ/qhavbCscghadfPcJGs12Q7IxDS8Ak26
         KBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCViYDBaHNkASapagnYxnTfloHX8YMm082ZzznoR6mxZWJBBNdhUW958yWD6b6QyM0WN7AtP6bqj1Qerzyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0StDwXu0wQsCTNuU+4UH16zk1jLHBjvo9ZMr9jkWUMz2au2TF
	OEhj4MYCi4zyIV58ogenyHTr9WhxnhxO4gNOdXhOzU1HWrgcjBpk208Trm3eskQMCh3zEdbbMmU
	5HQi4tjE=
X-Gm-Gg: ASbGncte04DsSWEof/ZvKYypQ9H7O+jNwLnmkpm5asF4lLSBQ6GJoBWBpv6QtFT5D0J
	pnSPT4iYErYsQeCTuUE234GfdS/nnU8TfIAGh2HoKPWm2HMcgg+XJD8c9dB52+sXJaQchR77Dni
	sgTbg3fE+n4T2FafpD6x2CDfgrxjY3Y8oY1BOJTw3Vt+DiFDQ02rwXPmh6YO/3iyAZ1pwsnFtO3
	ZEpO3zv7gQZ7v2mYRhXJ3c8VnB8OOvurxlY5g6ctKVR+YL2V1qMlA0pqsnhrOmWu13RfFUAFqQk
	CpzZ5Wm1FMSNYJkoMtzFp759+vsMR9aplJ+aT0LEd0fqsFUtkDnZeHCkgXU5f8HYrZk=
X-Google-Smtp-Source: AGHT+IH38PitXxn1VKaiQ2a7qcSfWel57rt41qRDl8nNA2/UdFYx6tdyKS66zYHhzvBf1Y8k36T3ew==
X-Received: by 2002:a05:6808:2202:b0:3fe:aecb:5c49 with SMTP id 5614622812f47-40b33e324abmr4839837b6e.21.1751067691140;
        Fri, 27 Jun 2025 16:41:31 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322ae4e9sm568483b6e.17.2025.06.27.16.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 16:41:30 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 27 Jun 2025 18:40:02 -0500
Subject: [PATCH v2 06/11] iio: adc: ad_sigma_delta: refactor setting read
 address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-6-f49c55599113@baylibre.com>
References: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-0-f49c55599113@baylibre.com>
In-Reply-To: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-0-f49c55599113@baylibre.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=rTMPy0vWx9yUwEty5cvxFd319Z4yZNxLlJgbcACjydc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoXyv61Esyd/0HrepT/Mwg/nk56ba6vSv5xUaps
 Fq7m9VtsDmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaF8r+gAKCRDCzCAB/wGP
 wPZVB/9h/ljBYaDCSu9HP10Y2f/kXGZgaDjCpK470WehwiOXQ6+fXJZGn3lfHprs/kVW4LSUY4v
 t3hjuznSZsVzWzqtuVzpdTG/wbS9c0v8fP2MCq3kVmMQyQARtuiOaj9s39RbqCxnu8sK0Q7vrju
 x0Iq6ADVPBNbV/y/tDP8kUaGEFh4FnjY0bHc/a7+h9NoiPxPwP1CMDArrUlhRtPOFITNWFoBYwF
 Gsuc6wtphoAyoiisbevfXfxsSktzP16TLTLjtQ3HabXD9HiKNp7JXtwDbwPOlfk77i7eelroEJ5
 qioj5543MnqVO4UshP1Pg5xIeThrz3rSwsu6eQYOqqEmv6c0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Refactor code to set the read address in a separate function.

This code is already duplicated twice and we will need to use it a third
time in a later commit.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad_sigma_delta.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index ab34ff5e09146535fd6edbd288888c3afb0188a7..d8101f5d443f957a398e66db1dad0d1f73c16078 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -107,6 +107,14 @@ int ad_sd_write_reg(struct ad_sigma_delta *sigma_delta, unsigned int reg,
 }
 EXPORT_SYMBOL_NS_GPL(ad_sd_write_reg, "IIO_AD_SIGMA_DELTA");
 
+static void ad_sd_set_read_reg_addr(struct ad_sigma_delta *sigma_delta, u8 reg,
+				    u8 *data)
+{
+	data[0] = reg << sigma_delta->info->addr_shift;
+	data[0] |= sigma_delta->info->read_mask;
+	data[0] |= sigma_delta->comm;
+}
+
 static int ad_sd_read_reg_raw(struct ad_sigma_delta *sigma_delta,
 			      unsigned int reg, unsigned int size, u8 *val)
 {
@@ -127,9 +135,7 @@ static int ad_sd_read_reg_raw(struct ad_sigma_delta *sigma_delta,
 	spi_message_init(&m);
 
 	if (sigma_delta->info->has_registers) {
-		data[0] = reg << sigma_delta->info->addr_shift;
-		data[0] |= sigma_delta->info->read_mask;
-		data[0] |= sigma_delta->comm;
+		ad_sd_set_read_reg_addr(sigma_delta, reg, data);
 		spi_message_add_tail(&t[0], &m);
 	}
 	spi_message_add_tail(&t[1], &m);
@@ -288,9 +294,7 @@ static int ad_sigma_delta_clear_pending_event(struct ad_sigma_delta *sigma_delta
 	if (sigma_delta->info->has_registers) {
 		unsigned int data_reg = sigma_delta->info->data_reg ?: AD_SD_REG_DATA;
 
-		data[0] = data_reg << sigma_delta->info->addr_shift;
-		data[0] |= sigma_delta->info->read_mask;
-		data[0] |= sigma_delta->comm;
+		ad_sd_set_read_reg_addr(sigma_delta, data_reg, data);
 		t[0].tx_buf = data;
 		spi_message_add_tail(&t[0], &m);
 	}

-- 
2.43.0

