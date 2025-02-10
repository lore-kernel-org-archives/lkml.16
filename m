Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CCA2566E1
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203982; cv=none; b=QKaDEP2jtIApP/Xx8pZvNxhIG9x1WR+ZoqUIx7zRkWEFx1vx4/0siZGomtvjLIlfqxDYa+E3kAVQTI2sRU17F4aJ8jaJVqmtkTT2aqyD8oq8VShiAEc5T5Fr7H4tYEXI1oGiqO43MzGLYhsNUMNuLwxvJQaPWH5oZUo4fSPC5Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203982; c=relaxed/simple;
	bh=3NUUx15Y02eAxw+Z9yWc/3djPoH5Ry3lT7zOZkK3n3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knD8gX+3M8ta+H8yMH2jiHqhOkKBv4aU6RryQoZ+jDKUolauV8X14zE2s1xh/m/qxbImiWarDYTVG8vodXSHhOZFvWIRwegVarlMtuCcyM/kGx5Be2Yc6xbNHW5vM8YGnaZVlPDEVlJbT8ztJnXgfG+xG21NHNxICxUCQ1pe0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SGO92Vj7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SGO92Vj7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436345cc17bso31581845e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739203978; x=1739808778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vN8F20QDO3HQKLIA661OKCUheq7UYLkLcdweF7Jz39U=;
        b=SGO92Vj75AVvK5gTOo+5OX4/xiKGRksBD2WkNDiY8nnGVEKsP0XW5Nn7BVVSRgXG2G
         /aeCgRVQy0JyyZOP1VC4IuOF1letySh2sZ2FFJx2nTbLJPO0uQgqcElS7nPZtRy+4wyI
         KagCTQCuTHzsRXAAeg/j5C7TEKjW3s7H9DDndnFfDmonuhAWcLIEaX9SYU04qz4w9YlT
         jsIVDMLxpmaj3EkdYwDYdUZKn63UNnHERNZkhpO+LuEzum6n95GIH3WI/1Ikuq8H5iJE
         PaLg3MJ5jzCUpc9ChfL/nOJ+mWvgxJTHtzYmD+ZoqA/PJvQYxuIVA9fjayX3ulgszl8N
         KUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203978; x=1739808778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vN8F20QDO3HQKLIA661OKCUheq7UYLkLcdweF7Jz39U=;
        b=uUYwqpK9Xow7wPLAzA9Ee1wAGFbVE+Z718zD3M8MIFf5ljmqZsZUSWYDhzijfaaJTd
         r7iXWv+FfVvWsf2SAAkeTkYYE2CYsofYDdlJ9XFr2Q/GkLM/YcKlb0iFdUM7pwM0rcfU
         hjXQIpx/H5Q4G+0tgNXfjndfirPC/N/g9zsj78D9V3/743rXCCP+xPaTAbTRzGikjp2o
         bRmFsqEoeUG5ikM6EaXN1418vFEndxjd6vTIxJcV/81uLc98MPSd2R8I29xPiKN0M3Pn
         pjvi9e5e9/rtF3Lx2bEhmv97HGiloWPjr6Qh3oxPCIh0P5eq5VzBQv9dbucwFl/LNj0S
         G+lg==
X-Forwarded-Encrypted: i=1; AJvYcCV835lrPi2BBXA02E3ZIEcRkehaHxLG1mTd/Iz/WOhG34bEeWlGdQiYlZYFqr59ddxQmvQ6BeMDJlYZkZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAomD1omi6Fb9KpYP5cVMc7REo68Y05QtKN8SSgXAxxbphf1wg
	h2aRtkQ7H7qLF7X6E+RXbrXmYYRfBmQjaf3cSHdjVkxJszWv1w2XaHQvjHqRRy0=
X-Gm-Gg: ASbGncstFz8UbXQ/r17fA2bny2uueYdUqWLxsXJaA+0lA5cM5tDnt0GPXEU4fNFkuYd
	6sI9zB+QwKr0PxIYd57LSZ/zxMo4MJKUTP4LL+9jmoo439+GreqhTQY8agMH0hoCGQq0lcpwiyp
	GsWz9O5I4jIj0uhLr8HpNgoRW8XzgPCQwMITZ4M1IHYpMLFafLGfG+UO/6SYtLUf2taoixoyA8n
	EGc6qV3xQ5ehDhfePjPcCF94ARYsArW3V4vGP7Mgp9uLcCXx6EqtipOHJuvaAADh/3TOTemmHae
	KJbHxAEn+RocABN/T1q7DSHV+WFMajmdKUyDGjbkwwcWrW75F2gXfL5d4nwqBDk=
X-Google-Smtp-Source: AGHT+IG6o5ZREGcR3FZz87qZP85Jb0UcLM1o8sU4230MxIIzFZQjtotZMxY+b32r+NX9bZ4tcPkzxw==
X-Received: by 2002:a05:600c:510c:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-4394c847ad4mr3624905e9.24.1739203978447;
        Mon, 10 Feb 2025 08:12:58 -0800 (PST)
Received: from [127.0.1.1] (host-87-8-15-130.retail.telecomitalia.it. [87.8.15.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffcdsm146637945e9.15.2025.02.10.08.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:12:57 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 10 Feb 2025 17:10:58 +0100
Subject: [PATCH v4 8/9] iio: adc: ad7606: change channel macros parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-8-160df18b1da7@baylibre.com>
References: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-0-160df18b1da7@baylibre.com>
In-Reply-To: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-0-160df18b1da7@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Ardelean <aardelean@baylibre.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guillaume Stols <gstols@baylibre.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.1

From: Guillaume Stols <gstols@baylibre.com>

Add the possibility to pass the *_available parameters to the main
macro.
This is a preparation to add the new channels for software mode and
hardware mode in iio backend mode more easily.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
 drivers/iio/adc/ad7606.h | 51 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
index 7a044b499cfe..a35b526f3915 100644
--- a/drivers/iio/adc/ad7606.h
+++ b/drivers/iio/adc/ad7606.h
@@ -40,37 +40,19 @@
 #define AD7606_RANGE_CH_ADDR(ch)	(0x03 + ((ch) >> 1))
 #define AD7606_OS_MODE			0x08
 
-#define AD760X_CHANNEL(num, mask_sep, mask_type, mask_all, bits) {	\
+#define AD760X_CHANNEL(num, mask_sep, mask_type, mask_all,	\
+		mask_sep_avail, mask_all_avail, bits) {		\
 		.type = IIO_VOLTAGE,				\
 		.indexed = 1,					\
 		.channel = num,					\
 		.address = num,					\
 		.info_mask_separate = mask_sep,			\
+		.info_mask_separate_available =			\
+			mask_sep_avail,				\
 		.info_mask_shared_by_type = mask_type,		\
 		.info_mask_shared_by_all = mask_all,		\
-		.scan_index = num,				\
-		.scan_type = {					\
-			.sign = 's',				\
-			.realbits = (bits),			\
-			.storagebits = (bits) > 16 ? 32 : 16,	\
-			.endianness = IIO_CPU,			\
-		},						\
-}
-
-#define AD7606_SW_CHANNEL(num, bits) {				\
-		.type = IIO_VOLTAGE,				\
-		.indexed = 1,					\
-		.channel = num,					\
-		.address = num,					\
-		.info_mask_separate =				\
-			BIT(IIO_CHAN_INFO_RAW) |		\
-			BIT(IIO_CHAN_INFO_SCALE),		\
-		.info_mask_separate_available =			\
-			BIT(IIO_CHAN_INFO_SCALE),		\
-		.info_mask_shared_by_all =			\
-			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),	\
 		.info_mask_shared_by_all_available =		\
-			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),	\
+			mask_all_avail,				\
 		.scan_index = num,				\
 		.scan_type = {					\
 			.sign = 's',				\
@@ -80,14 +62,30 @@
 		},						\
 }
 
+#define AD7606_SW_CHANNEL(num, bits)			\
+	AD760X_CHANNEL(num,				\
+		/* mask separate */			\
+		BIT(IIO_CHAN_INFO_RAW) |		\
+		BIT(IIO_CHAN_INFO_SCALE),		\
+		/* mask type */				\
+		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),	\
+		/* mask all */				\
+		0,					\
+		/* mask separate available */		\
+		BIT(IIO_CHAN_INFO_SCALE),		\
+		/* mask all available */		\
+		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),	\
+		bits)
+
 #define AD7605_CHANNEL(num)				\
 	AD760X_CHANNEL(num, BIT(IIO_CHAN_INFO_RAW),	\
-		BIT(IIO_CHAN_INFO_SCALE), 0, 16)
+		BIT(IIO_CHAN_INFO_SCALE), 0, 0, 0, 16)
 
 #define AD7606_CHANNEL(num, bits)			\
 	AD760X_CHANNEL(num, BIT(IIO_CHAN_INFO_RAW),	\
 		BIT(IIO_CHAN_INFO_SCALE),		\
-		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), bits)
+		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),	\
+		0, 0, bits)
 
 #define AD7616_CHANNEL(num)	AD7606_SW_CHANNEL(num, 16)
 
@@ -95,7 +93,8 @@
 	AD760X_CHANNEL(num, 0,				\
 		BIT(IIO_CHAN_INFO_SCALE),		\
 		BIT(IIO_CHAN_INFO_SAMP_FREQ) |		\
-		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), 16)
+		BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),  \
+		0, 0, 16)
 
 struct ad7606_state;
 

-- 
2.47.0

