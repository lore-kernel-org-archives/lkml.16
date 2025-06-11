Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F920243968
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677631; cv=none; b=kWOcZ5z19EDJztu6N33QAX9fp6bl/M8Q+e1IbQkLQG45WOBU7V+2rIH7hpFVk0WYnZeK1bkDesvK+DyWKaucGmOiYCJOqfG/FYjpK6JbnqtR9xY1bcmiZ7ViXyiYoT45nxq8MF2Kj7ZnjezV2bXzsHBJ3p2pIIsCAt7La03ngSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677631; c=relaxed/simple;
	bh=8nYNZ0t13n9D/8UdTM9a/nnJ6lObjFa3OXzCbnbLuUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LL41/dhey5ttxU5GeBZ0r5y+9Cs6EaswzcclHumotAlOht6cqHd06MrENt1JlChE0ZfbNm/LJmEp4t2JIIOj6IUEMkGa82pyABE2btmr8QM2ONhapTRb0KE+JxR4evHcQYSPSEu+xQlkpKds8ANanDzkWys5EZrvvqAdI2do2uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ef4zGzub; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ef4zGzub"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-408fa4be483so171780b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749677628; x=1750282428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzLb/vPlnEIFPDoiLpCdRirb2U4EbQo5sgL+L78nVMk=;
        b=ef4zGzubYhr2wJ4oAH7a7cuadQ1Fck2VxnZQYI3+7cVt14/zmy2apVOeAqP0/vvpV7
         ZVHYQ7UZ7JYuzrkRV3E9sbm1fQ11wjB2DbiYo3zlFlRdO0XJh0EgUBHWV8PROvV8Cxl/
         6aIbPApfB+NKul6LsCT3CO8wGP2wR7pLYe6Z5s0MLXqdmvjKhoBqSgd4jM1LiNSN5hZw
         hyIG37VhWTaVma6ieT/UyTo88WJ3W+2ULgud/lZeM8JP62sOVlGuKw5A+K0gpofktSfV
         BI/R3dkYl2mqEaUpXN5q7geYj7T58DYZ3XVapGcJUg86dD4WCOOjjanvoqiv939C+toc
         piPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677628; x=1750282428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzLb/vPlnEIFPDoiLpCdRirb2U4EbQo5sgL+L78nVMk=;
        b=hMxKNmAyAO9ZZfdUEo1977+sfaYj8ebxRjuYcvVkxBGILU++2V55pu5F0OGbeK9QTZ
         par9eNv6Xr7QEda54A5oMaUu1TKKyfuehztGZ6PZl1oiqiZzp0yvooGQ1/Ya9rAfj2nq
         GooZ9MxrvB7U9a84sEf88dzQ0P7ZvstMGVGxR5pj0c8hSV6qZP/RCvsHr1oEye6Z3iuQ
         Zol/enqNexoKT6wgqBk+MVjrAOshR+//iu0Iu4c9orop8cr0T6fht49AM2hYlBcVKmC0
         3MBF4EiWunZdMd2avFGDPH2ejS2KhCqCOWc4a9m7i/lh128Pzl2lPoZEmWERZSGwXMc9
         OHzA==
X-Forwarded-Encrypted: i=1; AJvYcCV2qyyKfZ7JIC7aazqMbAvbkVDz6z12+2GJEV2ZQc5LrmtkL/csSmFR5eJJiZ3bdPEfu/0xK556uonZZ+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIFHYXWn3iH6qyXJM9gEe04wgt80WLA0KBhby2vilo2xsm1/Ve
	K/noTUGGuS5meIyuxrck+5NQR/S5OX5ZDgDt9E6wbrCrYD4LqCNLEk7tCu/e3gQO8qI=
X-Gm-Gg: ASbGncsJTwV3+Aeof6HGRHysY6Nj/Yt2FT1Q26Nh7zXXh2ycPjyK3Gk9Ad227CK1RHi
	T+vpOsso6NBSDr1n9nnZOjT7+vYQUT/UsEf3GrrKrRB242XaScyVKin9fEZI61QWq4KiDIzq1Ug
	JX6FhNoQNrEFpE76c5g2cXGqQTy0UwX/VQQHCCJdabXtHP/hfy+TNX1oVhom1TBZh2QbT0nTXhW
	KOrabaLHFzsol3Gz8n07tzN3WWRRqsyNELWxvspQBtbK7KGKk7OofBd4Sb30bGAJ/BrdGMGxb+m
	keVO8dASjJaeubIwaJepvj4bXOIlYGTZf92jAxCBhfE90n6639jZOPUnrpNA/yhgn85/uyqbRJV
	AKks=
X-Google-Smtp-Source: AGHT+IGfTOk9ozSDpoM+4g4Hm+0DH29OFTfuba3qFwOUQuVKZ2xCg+WwfSm/zL+cIAJIoC2uakHA9Q==
X-Received: by 2002:a05:6808:2286:b0:406:7a50:947a with SMTP id 5614622812f47-40a66b31f1bmr366446b6e.27.1749677628096;
        Wed, 11 Jun 2025 14:33:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fb0bdsm2262b6e.23.2025.06.11.14.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 14:33:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 16:33:02 -0500
Subject: [PATCH v3 2/5] iio: amplifiers: ada4250: don't fail on bad chip ID
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-2-bf85ddea79f2@baylibre.com>
References: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
In-Reply-To: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=8nYNZ0t13n9D/8UdTM9a/nnJ6lObjFa3OXzCbnbLuUQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSfYcKVfvHAUfzl0bBKS3Q0CJ5CYc86OmKPceM
 iLtKwZaC72JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEn2HAAKCRDCzCAB/wGP
 wBaFB/4ytHErWauhCNxbfIjhOXWgpbfFh62T8WtVJOGFL/DXdX0uxGAqT/+2k/UhhiJsGO2KQsc
 azPFnkGeAQtfLJzDQUE0Bxh0mWhCEhHqvj3E+kEMrX0/5wXrm/njroGBuF4Y7p9IC/BGT+Lr+PN
 frlbQe/EVAuq2DRfHTe20KRF3gxEsg84tYyqOruP0QT63Ooz9/gDzRcnyKoSibLpyRBlrCai2Z9
 jv6f1Ksv1KLdzBwtM/UcVXukcyUcYj8R4P82LU1VjLEkraCO3pDOowf4LQEWJM6ZrIoP81CxiXy
 z+vwXtWcNpnpbA0Bas5T+DIjCyNFHfh0VB7OIRrgXUX32teu
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Only print an information message instead of error message and failing
to probe the device if the chip ID is not recognized. Experience shows
that this can be fragile and some devices may not return the expected
chip ID even though the driver is still able to work with them.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Closes: https://lore.kernel.org/linux-iio/20250421122409.79f5580c@jic23-huawei/
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/amplifiers/ada4250.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/amplifiers/ada4250.c b/drivers/iio/amplifiers/ada4250.c
index 397c1e1545cfccad9b0ff58b133796d415130064..1bd7c0c3c695b3872b8c389fb4ae89bf5d24f51c 100644
--- a/drivers/iio/amplifiers/ada4250.c
+++ b/drivers/iio/amplifiers/ada4250.c
@@ -332,10 +332,8 @@ static int ada4250_init(struct ada4250_state *st)
 
 	chip_id = le16_to_cpu(st->reg_val_16);
 
-	if (chip_id != ADA4250_CHIP_ID) {
-		dev_err(dev, "Invalid chip ID.\n");
-		return -EINVAL;
-	}
+	if (chip_id != ADA4250_CHIP_ID)
+		dev_info(dev, "Invalid chip ID: 0x%02X.\n", chip_id);
 
 	return regmap_write(st->regmap, ADA4250_REG_REFBUF_EN,
 			    FIELD_PREP(ADA4250_REFBUF_MSK, st->refbuf_en));

-- 
2.43.0

