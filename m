Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AE1C84CF
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698848; cv=none; b=CSOtOiYFidgnJjPfTmd0h76Dvyp9ALDL8xbQVObcfTwLx2aQvIQLDHYL7GdXHInjiOeCickADMsty8g7a79b9YDwS+AqOITuVarxXWwoZihApINgwKUEGDH7rc8sV4kzj3HqP0hwHcrzbluzBy2Prh17Jx25iHaJFThMsWV2MKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698848; c=relaxed/simple;
	bh=8DecWNX9a+g7ci97Vv7IU6U85+eTrGoiJDNqhMLAwD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEKKz4Onjg/o4k0/O6xvAqXYS2gSWRh1i3vXGpuWnWQOv9IJmOxTWxmUh9j9DJPy0TTq2xcdvPTZpQx2QjzZrGqPlLPUwGTfYhUgnq+4hADv8EhFBZuRz26qK6wZu1bvPODxKijU3usmGUTn3M8/uPJZsqNP9kx7k37eWTI3TBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lyvpKTOX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lyvpKTOX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0618746bso5874205e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746698845; x=1747303645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=lyvpKTOXERZ29rWXJ5wzwrZ2hulMV9XCRo5DTrp9vK65+zVjXQCcSg6UBXTHgkknoe
         EnB9vYFCvYE3oJklxQGKHEWMYjQ02rLjnDFmisX+z09jIYQml2j82MSwELVnn3OZbnfZ
         1S0XGV2iKaaeBG31EgMidbk494/69mI+J0E5soFD6LcEYWqV6wUhBihx94uyu7MVKA+O
         YSefer75+A+t2nQZ1FqnGvg21kW36kLfP8Ynsa236EUZVRWR3V4U4PQYf2ZiaDLEPVeM
         aiNuLEQ96DsMNQVRwpSTu1eeL+Ouh1CYg2UIv/u86R4WloYb2KD4ojnaRcD13AX1PA5A
         FhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698845; x=1747303645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=bKKnkXVRvVGj4jerft04gwmSft4i1l18i0cbJbTWqlXceZN6shwt/MLahuL+zmZeog
         khaWFWgjsWmRoMUOZLwH83mcOQYt1M2ETIdfI7oZQEIKBr6hKXAO22+HxDvl3eoNQE+y
         rQDLIEfB96EbqVA6fG3B4luEjSXPIcQVQw8VFwfKXSGX6wA3pVvvU1xRbFCUMZyC0ZL3
         G/5/oB5jpQO0lolmKvJ3kCbFiQxRfqWyPmq5t9Fn7fzQjFFQ5Q2fqhX4k2hHxJy7CXtc
         C7gM76V9bYrizok0AyRC5NOB79PHmpunwDja4eMMyJwM07RG67Cp0McDboCn4/Lm1+GC
         BAXg==
X-Forwarded-Encrypted: i=1; AJvYcCUSyeTQwGqKmkuqNL1peCbvWfIzwEKcHPV/bdgptBbrywf7uNm4rGEggOuyOnvRssfO8bRvHR+Q/OWJk48=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPNc9RE6+loFXXW5F0sdBH8+x4IgLqQgJB8wUqls0DdkW6ofr
	Vxj5+TJVwSlt2+1hSf0CV7i5c3UanZxV64uXNxugnyjjAkcADL4qWzBilOJd5c4=
X-Gm-Gg: ASbGncuxCVccZwmzSj9CjtGJl4XFBAKeNd9XvPvnqT5Z9q3BH/dLMUkL7bIwWvwffeM
	zEybNDGGvGx2xUIO5rupfYa+tmlh2OTmH0khxTDY0VBG/jJ7kCovylufUOBicrarBI0zMxTbE+M
	jOmwnjySnOI9UkWbMUIVD00meq/yXp232AcLFQk4kk0BCsFqS6nbR1j/yWTyGMKZf0WmK8FPBAR
	y60TxRQ8F8FRLACuRt1hqmTsv4UTlSFsR+Wgma62M2nnm3naw29Ehq18QQtKVi3rangK+bS7R+6
	8NOPaXmwzqjvz+HYYpmy6Y4dUQXHqNSecAEdE3HLO4tnazo581abWC2KVgwPY582tRF15wvO3FJ
	eZPnOHV2EYK2X
X-Google-Smtp-Source: AGHT+IF9EQT4M5SmZsHAxZZKz+TKrhTiH7Tl3JMTlzBWU/8jiEAgKt5PKxZvsg6SfE8e2vmOVcIRAA==
X-Received: by 2002:a05:600c:4454:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-441d44c2d62mr50234245e9.8.1746698845213;
        Thu, 08 May 2025 03:07:25 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd363940sm31699665e9.25.2025.05.08.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:07:24 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 08 May 2025 12:06:06 +0200
Subject: [PATCH v4 2/5] iio: core: add ADC delay calibration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-wip-bl-ad7606-calibration-v4-2-91a3f2837e6b@baylibre.com>
References: <20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com>
In-Reply-To: <20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=4Hb5fAw6wk9UOyjGvMGWLBgqM5yKlaYwdF7azoNoMts=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiQaeK3vt9n+1tV3Di9/5Oc2K9Ic+GA1iMWR7On33x84
 8zu68ePdZSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZiITQbDP4M/xbWukXt2RIgu
 cU5kzJyrY8l2uIjx6PvChiq/GV7HhBn+2aYJ/Zlyf1PT5vDHBSXdrD2n7j3h2ZBbxJPZ1ca7IOE
 hKwA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

ADCs as ad7606 implement a phase calibration as a delay.
Add such definition, needed for ad7606.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/industrialio-core.c | 1 +
 include/linux/iio/types.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 178e99b111debc59a247fcc3a6037e429db3bebf..f13c3aa470d774bfe655d6a9fb00c263789db637 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -188,6 +188,7 @@ static const char * const iio_chan_info_postfix[] = {
 	[IIO_CHAN_INFO_CALIBAMBIENT] = "calibambient",
 	[IIO_CHAN_INFO_ZEROPOINT] = "zeropoint",
 	[IIO_CHAN_INFO_TROUGH] = "trough_raw",
+	[IIO_CHAN_INFO_CONVDELAY] = "convdelay",
 };
 /**
  * iio_device_id() - query the unique ID for the device
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index d89982c98368cf72c0fc30fa66ab001e48af4e8b..ad2761efcc8315e1f9907d2a7159447fb463333e 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -69,6 +69,7 @@ enum iio_chan_info_enum {
 	IIO_CHAN_INFO_CALIBAMBIENT,
 	IIO_CHAN_INFO_ZEROPOINT,
 	IIO_CHAN_INFO_TROUGH,
+	IIO_CHAN_INFO_CONVDELAY,
 };
 
 #endif /* _IIO_TYPES_H_ */

-- 
2.49.0

