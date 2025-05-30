Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E20231A55
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615381; cv=none; b=dCEGqfez2YNCKVOvxeDuzBhhEpmmm/4JgAS1pWb9hn8SbK47bCAPX5Hg86JiNIMOm4f1sjzxM4Yl+iFKSIldeVq+TisMmqDx2np7nIK687WeIoebx0fnwbtgk7CEl0u+VPXIS9wQa4m5ZRFRL67ReIi/Efi3g3Q1QdMWBQ+IGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615381; c=relaxed/simple;
	bh=FrbTtGrivaT4Rj3CF57EXLkRqLyS9Vv1ydCdW8ZexzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UjfRddYFrVji9NcqnRR6ujo6wCxAlyCzh5EEySxsJu2qYstnYpa6o+CAR7dNmM8gigV4eggZNiIgDqX9XTbpFq7wz4Igln5/eI9sybZTg6M0EVG83IXXWQCp0Dt8QJtkWnVxDe3ln9DCMw3hFQFmgkl6udMVS87rOJIZO2EdkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tF+bT+T0; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tF+bT+T0"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2089978f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748615378; x=1749220178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iq6evQ1Ylo22d/EKkED7KgSCVafKGbfKTZIys9O8MM=;
        b=tF+bT+T0RRhix+jAo34JAHYIm2L+2TmuPuv/k3gNZyeVog8pVkmXN7Jit0V9Yjo8GH
         c2YgkPk+KPus2yMPWpPTl9eeIkYFw3FBxOJ2JYW5w7aa/npJQ78EbkkWkLvIBeNLCzYM
         oi+bpV9VScXX2o3yDNHT3li5DsmNMxR0otaAhQ2SreMDBI/I+6JDqApw4OHCY3Aj9wD0
         H4bo9XxVm5dEgH0jOooDtmV5mCikp+jDPIE6pD5w1qdkaGKpEN1ybEL1z2epPVbZJ//v
         5OxpddWN2TF2GPC29tUNCqp5kkuZXfh0ykyYirifvwpPQAj9vuuup8cFLO5lY3C6dvbM
         44QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615378; x=1749220178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iq6evQ1Ylo22d/EKkED7KgSCVafKGbfKTZIys9O8MM=;
        b=vCJA8VjaOTdZ4WOgMGr/1DfHZfMzTJavdoiO/Mjzh/i/1mNYV06k+xMetl4D9y8Ira
         7Gd5UveM4wrQB2AO/p0Vvp9fYS5XiK7XgLxJgDgzndBTnvK2CAZU4Tjn/psq5doZqPZJ
         WLH0XxraXrUljjJDTeVFKg064IoYacPlT/zrpLv/Jsi0W0dVvydLaNvAzbjRUQ2v+LxZ
         op2sNA7jMBmtYzt1ywzL1wkCvdfqMFhZXZblnPJ1cwBD17eGgd+7Mp2mItcPFEdkrtxs
         Fay8qsMVt2IvhrbRIygfzhotoCM9FVwKuD0XWOJ+HluzbthCxiFmbMy6l7J6Y5udVxAD
         ezoA==
X-Forwarded-Encrypted: i=1; AJvYcCXIsf5WjXRSd6BXmTZwzFb0XxlBp2qDdLkWYQJwabeMhxE8YE9mSaCK2XB5QhHTUQ9AesksIuCAYMyki0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UAtU5xzZ2e0gKJW+0ERXiA+guNvm+WOUgaHN4LeDvT/H5D8Y
	jHB3GsSAtXKpnNqeiXnk9ASGj5cS/GpZGey7nesxRMeCfcNtKZXMVHzNhM/FQgmp2BM=
X-Gm-Gg: ASbGncsWlfNyDsikv5r1784N/SPwggWku+scS+d6UjzHLvTReCfhwXmH/W4wJuburD+
	xJxXxcWOrRjyqLO1eZF0GbNRrEE9vfaEAxdYsBgvuDEE86CEDBQ1XhgITmHch5l7Zjygu1ZWm2x
	eZUFuEkIhrR9ErYErfU7CD/daw1MN9ViQwj486IAd3tfjO0MhNyhOF9GMEzcuxFrTUOCreYKgvY
	+rerrXZZmy9K5Et1dGRFTg2Fxgq4ymrkgL4ir/bQ8H4O65kNqvei1tCjcDh73s6aJwwYLVkBe8x
	hvk7zSQEiYCycGFXcAxHIgRlaQlAjqSFbyOyJ8zIDm1Pc83FWGpMDePBulCIw0mBFekB9iRPvuC
	8daJmJoB4E1oAZ/DFllR339qyVcwYC5eFm3RCLAnA9zA6j0TgJkEB
X-Google-Smtp-Source: AGHT+IH2qFjwsL0ZpcsKi1Cp+Z/huaMzhDOx115aS4K84ZONVuPgMF4dhe/+D/7EpJnehWCn8NGKjA==
X-Received: by 2002:a05:6000:4382:b0:3a4:7382:d262 with SMTP id ffacd0b85a97d-3a4eed990bdmr6348269f8f.13.1748615377773;
        Fri, 30 May 2025 07:29:37 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0421sm4979870f8f.97.2025.05.30.07.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:29:37 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 30 May 2025 16:27:57 +0200
Subject: [PATCH v2 2/2] iio: adc: ad7606: add enabling of optional Vrefin
 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-wip-bl-ad7606-reference-voltages-v2-2-d5e1ad7e6f14@baylibre.com>
References: <20250530-wip-bl-ad7606-reference-voltages-v2-0-d5e1ad7e6f14@baylibre.com>
In-Reply-To: <20250530-wip-bl-ad7606-reference-voltages-v2-0-d5e1ad7e6f14@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=UxklPPiojuFxSBZLSo/8pFrHGqCsGLMFqwxgwQ8ZpEM=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiwPFDwRvqrt+sstRcM7cqqjC9emNjtuP7IR+LgMUnlu
 zob+e9qd5SyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZiI+3RGhnOs2/yWdrxpzjk0
 W7fk81+Rp4oqL4rnxM82fGW37dfP5mcM/yuLlKc8OGWpUftu8nuzYKHljEmmV/6d18nmmK1kEt8
 SxwwA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add optional refin voltage enabling. The property "refin-supply" is
already available and optional in the current fdt dt_schema.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 3bbe9c05b5edbc11e8016c995c6ab64104836e7b..4fd9638eb6e56f800c7c97425e45e04f269e3df7 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1335,6 +1335,11 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 		return dev_err_probe(dev, ret,
 				     "Failed to enable Vdrive supply\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "refin");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret,
+				     "failed to enable REFIN voltage\n");
+
 	st->chip_info = chip_info;
 
 	if (st->chip_info->oversampling_num) {

-- 
2.49.0

