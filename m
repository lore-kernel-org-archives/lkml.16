Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E52D3218
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932088; cv=none; b=F7eqGWC1Vk5ekajCuyk71UWb19iErQVX4/1TOnnMxZvKNqEbMImArVy5QtInRzH1++qgqOibhzdZ528OyXStR8SWM7xVBrd2v4mgNGBAq/ReUimjhJl1zpnQcVmeFMNXA3I4PRIv5ZyE0fIKRJm0G2/hVa27w67YwSTAeMf3hoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932088; c=relaxed/simple;
	bh=KNFLAKlea6yeUy4lbi1j+QrNXSerWfYkhf4kLna3TIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mb6ruSCjA8l/A6Oa93abncgvme74U7iFbwygDCIjegmKNqZ5FdHKb+mV4gtgpn7HA41DYJKA+YAz5HkzKeH1tw2qk5tEtJjMzPiSqMToJd1rfTNii/jC2AXrY3w0q0oszEpspGkM8cYJ6P1KDNRgvHy5iwGmBZe6GKTNhaF7Fww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PQDp8Xl1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PQDp8Xl1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf257158fso34400735e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745932084; x=1746536884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHBtxryzQthLhYJZlS/DuviCEeYbLy5mezGC/ZEnYPQ=;
        b=PQDp8Xl1Ug1Rc5NqVnQLU4NuBS/xO69Rda2VG9vRMpM1ANx5fHf7S1vkcqSgFeG2cd
         ICGK5ujGGc5PEfzix0QVjTP9QDsgGgjuucvyEhDIJUZpYrC1DKuN4nLsmTa+kbTxBPF8
         qP08yEK34zQuE5pFduyJghZSz3vS5B1n+vxFMNj17+zov0rioYvVFgTXLQObjkUettMU
         0KPexMET7fgjG5zQ5rumqrK9HH8Up3UUKGNMhsxJ3Oqlbk15eeFidIS8etKdKFoDukOw
         qOURUg+NiigA4HbZSMc7grNhvvlBjGpBdk4D7by8GZ8NZl4Q3LIF9RjrbiHM0LBnYafD
         qtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932084; x=1746536884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHBtxryzQthLhYJZlS/DuviCEeYbLy5mezGC/ZEnYPQ=;
        b=BxAWhJpYqUUJPG6ZFUC7WwbOIPu38PxzyYEFc7RySHLzbuIVnO8fWJngGhYRw9S4hs
         yK3hDSSGGUVwxe2avIbDA7+cyXLP+unHRyDqOwosB+4OCluQH7U3P+mObzgP9Foh4eur
         tWHgiWbveoGK110HVi7QuTwMOok5KHsL5xRwM+skRaKJOl/jRfJOoCv3a78AKEh8UHRG
         ypxksKU4kPiz9YQqAPGeBm2mcyORjlPDMx/UfuqQ1MCdkNHJYO/1Ya031cymR8h4Xxcb
         5geaY7mu2sGVSoqbA61vOS6+Vm9PwOK34QUSnFM6TW2Tj04w7roJ/he2vh+KUBHM8snU
         p1HA==
X-Forwarded-Encrypted: i=1; AJvYcCXnnxdpwd2H4fxlLLteFR+wPxPu3shtGP0wAM2vjmmM8AmMoA8xmRXVxRmOEVtwsjmE6ibShUGTVwiFCww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJnhVsyZG9jRyCHWxhUDM2XRKoKgQ3j1nirfWTIbQmfxpz/5p
	hspX7SFl3nBMuaS7dWuYO1BS+GM6CDIYdrrf+BjlGBsx+c+6WVjHHfq+PufzXZU=
X-Gm-Gg: ASbGnctVP0/3HNduz5fg/RYICK2d6TFOfggXTeEZetZznBTuFqWXecd2unlAVfBTHXI
	ZPCWXMrB2c3UCvjdkp1JLQcOqC9w7D96IiLPXppb0QQID3dIbcYDOnjoQj4ESy2SZSSQF2T6R1v
	ggyXpHjnWsVomIrNRIK7pyjsN0T7m/mxyOkEEWYMVXIN7Gf2zbjQSL1MGjx2XsqYp+Vb4aPgDNM
	Fo0k1tZ9DFJuFyDqEgPP4VcDvF1370KGAl7ZswCsklQnBh9AeTCXGO8uh6NfzYiHc8QRyQY67vZ
	BEOAUITxfKjG2UP9KrDAkhm4ETClEsGbLdJyQ1qAirb1XznGjVLd1wD0v+NSmDRJ2NeHroJUdBB
	Uq+zZpMbRNCWf
X-Google-Smtp-Source: AGHT+IHQ8+f48r3Q37DChmVguLuyyYvsJkQYYpRTlbsCTmcMzwkKag6RYXH+xnfFhLDPYFiSihn10A==
X-Received: by 2002:a05:600c:34c8:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-440ab7b8cbdmr123641025e9.12.1745932084214;
        Tue, 29 Apr 2025 06:08:04 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm155550565e9.21.2025.04.29.06.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:08:03 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 29 Apr 2025 15:06:46 +0200
Subject: [PATCH 2/5] iio: core: add ADC phase calibration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-wip-bl-ad7606-calibration-v1-2-eb4d4821b172@baylibre.com>
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
In-Reply-To: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=wgg3iYunJuQ48BT265dZ+c9r7K85M1f9m3M1YHmwGb4=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgQOPfilr7n/iXPa7O/lzHken894Lc3ouOulEhba2CZ/
 arquaW5HaUsDGJcDLJiiix1iREmobdDpZQXMM6GmcPKBDKEgYtTACaS187w34dT8OmsxJlFWWuS
 2iZ9Xtw842hgpuHBGgfxnfMDt6kc+8PIcLF4W0m6cO1r0d9/H8q9uWXwTb62T/SWxXG3l5oBk5S
 TuAA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

ADCs as ad7606 implement phase calibration.
Add such definition, needed for ad7606.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/industrialio-core.c | 1 +
 include/linux/iio/types.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 178e99b111debc59a247fcc3a6037e429db3bebf..73ef9347d96b39c49e8a831576482071a95b5a41 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -188,6 +188,7 @@ static const char * const iio_chan_info_postfix[] = {
 	[IIO_CHAN_INFO_CALIBAMBIENT] = "calibambient",
 	[IIO_CHAN_INFO_ZEROPOINT] = "zeropoint",
 	[IIO_CHAN_INFO_TROUGH] = "trough_raw",
+	[IIO_CHAN_INFO_CALIBPHASE_DELAY] = "calibphase_delay",
 };
 /**
  * iio_device_id() - query the unique ID for the device
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index d89982c98368cf72c0fc30fa66ab001e48af4e8b..f341233613633830745e1899870377439e50d7f6 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -69,6 +69,7 @@ enum iio_chan_info_enum {
 	IIO_CHAN_INFO_CALIBAMBIENT,
 	IIO_CHAN_INFO_ZEROPOINT,
 	IIO_CHAN_INFO_TROUGH,
+	IIO_CHAN_INFO_CALIBPHASE_DELAY,
 };
 
 #endif /* _IIO_TYPES_H_ */

-- 
2.49.0

