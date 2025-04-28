Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7321DE881
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871855; cv=none; b=a6zvi0p/ilqyht2W6+pLuQh4veyH7c4NivY29mv6wAb6GLZOq+yCcYR1S82nWn7Ep5fRGUHAgx+ncEH+B3HRESsFCZ5eruc5CIIBthH6ky5GElds/UogXDG46QazDg8tPtPcmWRc5I846GN8xhuCyuycip16NJGRSMVn1oZ/dXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871855; c=relaxed/simple;
	bh=Vr9wDkA3SNoSLT9FCnDYkBa0JumGawTzg2ZkCcTYUYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANS1n5DaZVeS3XieBYYz5fwhS5so1rPyiZzQbioSJ5GQt4uoEslqsQUlURtwiImy6TUmE4jvxB2Ed+DaVShzktTOUa/q5J8eUgxkVzFQ7WYF2xUDz0zO89dNAMs6t6y5AjCjnw1+HWHOU5R0uZbS0kfc2uXlmrrsbwrjXxm+uwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pHY+MHUf; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pHY+MHUf"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3fa6c54cdb2so5330828b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871853; x=1746476653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=pHY+MHUfBzSYKTO26gPodATZe7bgipHpf1Zqr9/KqMR+OeK0xrSz6w/JkvmgDo/c13
         nUkhQVL6mVeUn6bNtooORoAXHfKGyUExb7yPNdKbYJyyO0YIJyLsSH3lkaM1+xnSo2yz
         9LbmzrpRHA9ACsGdf72E47u175+QXBEXl+eqpb4cb3pHKdMUD90jPGIv1Kh0Lib5wLC6
         zd/jIxznqXrnslaVVsNed8W6TCRKH18zLSNkCCCdjxqRgiphz6h5tfw5d46CzcWlB7LW
         DcokTK8H5EjF06n8/oUydwSJe1Qj+F90/eW/bY+cfRctrxAijtGdoZTvOPZF4vk6vOQB
         pbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871853; x=1746476653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=gZIa/GF1TBuvpIWzUhVG0KGyYZ3guREF0C/Z4jexatp1QdIS+Tw5i5yF86GYj9ZTzn
         7fLGWEltqoN4QWY0krhWYdt686TJiMJY4qJoXP/wlgbgJ0okyiEt5tMPo4l+Uigo4TAW
         ddgkKIIj5qhDulEKAXEK3TzTBlJfyWJaFS8B9Wf9T9JODwI2ynIID8Oekz434Rc5/Ue7
         QQEB0vH0qwcfDgNQF5p/ckLLmP1jZXmZ7mp1GfV6waeBB2rx9YneSmZ4nDsjzHTXyecy
         xn2A5K+safbOc/kDxrbtkxXbARAb8MolPSq6RK1khdtNdyVJnuHkZP4iEm1XQP8rnUmV
         O9UA==
X-Forwarded-Encrypted: i=1; AJvYcCVoKbpEbwJAzgmTgobKbSsDcKooUrhM9Xdus2V0yQ6EgdXcyReqwipfRu1HvcgfCTso6FuvSAvCSPpqOEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAyo6bVN+5HQwc5btDcgc1smk10Tag+wx8GVprdJDTmB47cztQ
	X3v1Y/SqNaanQh15EzVWpPA5/EK7pg19YQztPGtYFTykah9COBH6i4HXBrLKDHI=
X-Gm-Gg: ASbGncvUyxBh1m1tBHus/2IuOnLnAISF7nn/OZKzdAH9414Zp/fmEaG462eoshmV76D
	fn+RFkSGlNsBoTxHtVN/HSJ8+svqYqsaI53gtoYIqVwjteK0be7TQu4Qvc6tyU/DsVtza9DmHRB
	/5iO3N8Mj1OTEi46eYZl55/IsuK4mwrfDwtcMVLYzS+nZJw6WOPOu6pcH3oRcfqh8nAqgn3WVrW
	LGLSU7Jy2ilkHrvkeM/TQesA+FTzVo/j2bSjgVVmHiHDMn2xE6Ao4QI71K5HVKWayYN9uptvT4v
	dE9Cij8b4wd+b9kM1WSmi0GMl9a6DFlGb/Bn/KSKoD8hGGZaEF6gWkHttA==
X-Google-Smtp-Source: AGHT+IFMSSYxN7PK63XVoFOxHQkyZ8JEzuE0uzWukzKAPCdxZRACSzzcrQRpXZPMCEOaZ577NXiY7g==
X-Received: by 2002:a05:6808:6f93:b0:3fe:f4c6:a053 with SMTP id 5614622812f47-402107c0d8cmr718547b6e.4.1745871853106;
        Mon, 28 Apr 2025 13:24:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:12 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:07 -0500
Subject: [PATCH v4 5/7] iio: adc: ad7380: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-5-6f7f6126f1cb@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Vr9wDkA3SNoSLT9FCnDYkBa0JumGawTzg2ZkCcTYUYM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+PMWNKFP7ZhFMvFOuiJ7rcZBKKOsujRDG4Os
 CIHO4PxOY2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jzAAKCRDCzCAB/wGP
 wFmoB/9c4ABl1VBly/ge4NLl3iDZmPa8fsd5u8MhDN3q4RgHIjRoWV3Vn2ypZk5O/wO6jSI3Y5g
 8Vi8Y9ASJ7k4FUo+us7y6o/9Nq27euWZ/uOWxbC1iJueH1HgWYcaUBhIrZSq2qMFW+HaB8V8OAM
 g5obAma5H3SKK4Zcx4YyG6xgvM/SzEO1SB1etFTw28vVc+Z8HCa64wdILIhF7rVS6JK+qQY6NgU
 wtEWuN5caQfN5xosKwIGyC8GTMrU0D9siB9mn2YUdGNWBFwj+3ecHDV6invWY8I6A1Q+DVvjzTE
 iV4NSAqtnYANrywdxzgMJkqvADUn8Re2UUV+CkV0yz1nT/hD
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
used with iio_push_to_buffers_with_ts(). This makes the code a bit
easier to read and understand.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

As discussed in v1, this one stays u8 because it is used with both 16
and 32-bit word sizes.

v3 changes:
* Use IIO_DECLARE_DMA_BUFFER_WITH_TS() and drop __align()

v2 changes:
* None (but I messed up and there was supposed to be a change).
---
 drivers/iio/adc/ad7380.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index f93e6c67766aa89b18c1a7dec02ae8912f65261c..ed5e43c8c84cfcc9c4ce1866659a05787c1d6f5e 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -909,8 +909,7 @@ struct ad7380_state {
 	 * Make the buffer large enough for MAX_NUM_CHANNELS 32-bit samples and
 	 * one 64-bit aligned 64-bit timestamp.
 	 */
-	u8 scan_data[ALIGN(MAX_NUM_CHANNELS * sizeof(u32), sizeof(s64))
-			   + sizeof(s64)] __aligned(IIO_DMA_MINALIGN);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32));
 	/* buffers for reading/writing registers */
 	u16 tx;
 	u16 rx;

-- 
2.43.0

