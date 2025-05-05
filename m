Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA026B2D3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462769; cv=none; b=s+EhY89/orip67OYYYNcIWjPnyTsW2E+918cVdY5V1bmqmluicubqNw6rcTKGbgJhjf0/tOEyfRyavSdRRYpvzzLud7ZjtW52YVBN/hF1G0N3I+FqLWErsSw2Op51T3WbfEurTQa9dJAdMg9c9ZkMthtQsbClrX27oNMDLdDICE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462769; c=relaxed/simple;
	bh=Vr9wDkA3SNoSLT9FCnDYkBa0JumGawTzg2ZkCcTYUYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTKdRTPIDLMsswKScJHSkeiaCMDgRvxTrsGtVYYnB3H5gzsqEVoQMqfQ6KWZdD7VjVbODJMX4AYxbyGNTQqDiv5Yc85T+EI6isvVU5rNR0PfpU+pYCb12cRF9DLYmTAbQjgqkD9jc0j09SeN2SjilkaBSSSDNrV0wQba6CcQY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kKUvEXwK; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kKUvEXwK"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-400fa6b3012so3551450b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462767; x=1747067567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=kKUvEXwK60vUpsDcCOHT8oYxSFX5YIX00JTItEVWHLAsamRFhDjJfvlLrj7gXld0Hy
         uvnaPIgigILjYZHJ+XLMY+6gqmEO7NYw1BnKpvybrq08ykOhbZbvDuur7NSGMUiFa8aZ
         gRBBLb/k8r7f5pCQO5T8lYcB6vLlvjUBrMHX0+p5sUmqvQPto9/jYoXYKuKYQno9wmpB
         LJIRXpUkW9UTx0DivyccjfbM7H4WVCKJfJ+Ebe0aG16cJP7j1NeNBZRFqIhoMFwav3st
         WraRXUsiT8GAv3vmrl1jFZduJM4mDBrsRmQneXGTSHRBvNlgr6z9vimkFgjTESu+taow
         ff9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462767; x=1747067567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIY1UYaU1fvtHky+5YvUDY5xMfkarvlEBEV1oBc96LA=;
        b=loLMIv7oYXpO+5aDafgzheFndcMy3PXJlh1fuy0Ql7nENbcuHHvzBbBYTyLrKtWtpS
         8IH4FhjAHulbg7jOjPe4788TrW5xvxVXnSbFqC+/fTJCuq/tPwjGEL9r9HFbLXvXMOL/
         QskYaWeS2hfoH0bN6BYJzOq+kgPxBlwtP4zI48pi7CM6mJMRZBCO5ptSun2VGeyog3Gs
         rg9hf2NgdIL1TTwUVRPlBafNgtgIfyfJIoX3ThllQe4fambYuT1DKBW8jQImMzCrwjRF
         KRVswsGakRQf4FR5xrnNVdxDqiAOQ4FUPstBxfU+p0waOo0UVF7Nuw5rrbjZvWNu9QPw
         +Sew==
X-Forwarded-Encrypted: i=1; AJvYcCXyiIqCFo38t34LawSRe4VJOFjUgX44lqktqk37EFL/i6WC/EW/XtXjvmVSfqVoMFnQiYVz8id3DRm8TMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXY64RkIBTjEp1Ay9XSh4Fi+e3Dj0Exiy3YzwnYHYqc2Xk89bm
	Qzfb8tknpjlDQgzEw6i8fqdd75Ge6IB1+H8L1gM/EqM820Zu72KI3cBXsdfmzzg=
X-Gm-Gg: ASbGncsRpJ1KuRwr2DiLmJ6josWHfLEdgDVqWuLFeQ2J58v7N/G4mxULGeXydPDXe0m
	rDVVSly9mAyGw30oEnoBPkfPyDiw0r2WG+lCuPXD/nr1o435MhN17gMlyvGKh8cF4Y1PJT//yv2
	HpHJM3KbTWHX6Me06gGChzaQZMYkWpwmDuAWgmz0KMXJkuAsm4I67EBX4p6TcRWPOWGqMEACJmD
	TTkKmwXOXxjSHd0cG69XgaivfdLj5Z9sIcNz72eidJQV1UnURGMYQmrlyyqyutpLhZ3AV8QQ0i0
	MC7xhaPRCbWM5BCKdxQ2c+4beJOKYMWNTP+dFdBsoDJI2g==
X-Google-Smtp-Source: AGHT+IFozkxNYc+TkZ/Dl7Rtx6+wVKGzltkaPmqSwC5J4g3ybHlUKPIa71hZXXNMAqeUFbgBk2ljNw==
X-Received: by 2002:a05:6808:2217:b0:403:3192:385 with SMTP id 5614622812f47-403687eeba7mr98841b6e.4.1746462766974;
        Mon, 05 May 2025 09:32:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:46 -0500
Subject: [PATCH v5 5/7] iio: adc: ad7380: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-5-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
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
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOgTCR6lEzYtZByvCH+u97cNW3EB5n2Er5uth
 2EUH5CDdrWJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjoEwAKCRDCzCAB/wGP
 wPbbB/9F7PFPzkzoQ0p3LiG5VHOqbAw7G90nYahGDdDEobzVJ8JTUEsMqCWq+ewG5pPXhgKRTwf
 ORcWEUcY3IzIs48HpY3THjfD8eJlJ+VdJIkSw4II3q8KfyQyJErBr2p5xtd/2bV+HdpptcIg6M0
 uDEWtTj8NSd3vFiZodyhdFToWiiXAgJnvkIbwJnzHNDSHq9ufyj9m/nM6xgV1ia6jnlhybT9NEf
 TCUj5HDyM7+ZrzFk/WnrcvO9lv93/9xCEeqmJ0sGTz0hdDvWnIy0nek77Mrk/If+7NwNr0/waZK
 VAm35vK0LffyNySOEDgC11RS5l0RxFLHuDgltBidEC+zewSb
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

