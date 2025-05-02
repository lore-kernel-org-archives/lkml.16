Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BC25485B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192502; cv=none; b=ZsgJ5nzirXnfIvADatIzukNtQ5okGCtgXwOZnu6KsxFpnok+V+aOqmQiAWD/97ngDvC9GUxeMXRHJhihMOAiqp/9ugI2zcBZEc7WiNzR91zAVh3K+dIT1LAqa1FWyxY2MpWaQBsi7D69jlO9OQTLyeMkurh3P9F/WnIaNXB1rsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192502; c=relaxed/simple;
	bh=TQqLWy53nCViEnaTWQFWmvMZdao7mPG4VBPe7jY2JnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IW2VcebP6sIA9aX/I5N0qO4h5h3EIpQ+5LjUQQt2bMePos6mKoUB40xTgC/AjD/chQ3uHKmtkzHybTCZaJUf1keueELVWZ5Y7PoR5t3xjfV8Ljp4a9DUKeglF5y7lYHPWetu02YnL4S4s18ZdLLlEC/0AL7m7V/P5mQTLBj0gPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LA/kn8JS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LA/kn8JS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so14892365e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746192498; x=1746797298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuRbnqMan3w9A4V02ED54xhlqh03UYeyGh90bRtECvU=;
        b=LA/kn8JSHPyd7j+pcfeP1thP2XoDfVBvl3lkd9JfzVuwT+ZFV+YgatosI7yPuGdlqS
         1D1osmh7/IbT/6t4kAEpcpWTQfOABXcmjsw14UCe+RjbZT8m5bAGqCgzf+WvKfHB6//H
         Dfc3I1zF63PahgZ0lMCA/MUNBMtz2w2Uht36wnkZY7STdHJ0x4x1AcLYw59A0T/SZCre
         L7AGS3zVWLRY4vB75/LSB/lBctz9jLrrSVYcdNag9ddo/3h4CWO/h/7We4y0RPHs2tcD
         e56WrqTnY+mQ8lVI6GX4V3nAtZJPu0GgK9UEatwQ+uWHGCBUvgHpG4jBI3PSK61tSDry
         nnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192498; x=1746797298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuRbnqMan3w9A4V02ED54xhlqh03UYeyGh90bRtECvU=;
        b=NdNuNmJx9VEHJ5xdEuWoKv8Wt1g09JMb+gzOlc+iy50VKgndcgm/DCPYm6aNVfScjN
         rXewQB8xC/iLMkb1TGe/B6Duv8+AvOpW2n/BjEolyfqPTrc+oF//QcSV1Xh6lMFFRwfC
         wxPGbaNOleXO6voVaGdT7D1thAi2wdYWNPVTZyuMOtHUUZkzzeag+nF+kMmJw2xYJ/b6
         OI4Tq5usNGruzjVBVZX1SA/Z0IUClp0Z43c1ymY+HNYVLSiSq7T8fKV8gmqE+L+s0RrT
         RWvJG/OpJ5Lg2bJ66HR+OvFde3h/GjQSp85rGvrF5wytL8MsuGjtXouCpPJ0vMpfwaj2
         vknA==
X-Forwarded-Encrypted: i=1; AJvYcCXPbN0A+YDe8MZwUAahfugBsVePJInB0XAG45qx6Te6xYUH3sBGnOzw2IX8eimwZlLFOrfX9zSc1n5b5bE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxscpfji/wq+T5WA7/LJB+Ni/yIeO2c7VvkSjzHUKRZ0G35VL7q
	r/srSkNGJncdnclay2X/FvpkCq9yGdsa30m+fr+/x0ZukXEHHavdwlro3iGiWVg=
X-Gm-Gg: ASbGnct0dp4DnothPYLKsgDckjTRyEsQ0DT620lZTmbBY2AdJorcqmLHymYt6amMhCv
	RY3d/ap/mLSz5J9TU/m72JQy+JtuYAAxiL4uJLd4f0w/1QO00cxcuL/TF+ihVwzrISdcG2fdc6p
	2LTr6nSu3vwHdhjs9baMIyeUBli3tNfgTonQ8hfWaU6/kOYQpX7n/N8EKXLOxJx11X8riRZZCpb
	GbwUek4ULT2UIUCBynNLoKIsZZJnraVlRoofdNsHSXBU1kPDMqlrnZXkQxjr519rWZIk7+dICiU
	NdsSqQL7q32oT3c6tIhrfLn3wZKmwcR/Z5vDCWIH47O2
X-Google-Smtp-Source: AGHT+IFQANgfE3IS1tRpNJM0Ecgeq6HCN0uHkEtPuAM+ff5mCDruJROS/5GCJdPHvUbt9Mw624sPjg==
X-Received: by 2002:a05:600c:c86:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-441bbf2cda5mr22225065e9.25.1746192498501;
        Fri, 02 May 2025 06:28:18 -0700 (PDT)
Received: from [192.168.0.2] ([87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc50esm45761065e9.8.2025.05.02.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:28:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 02 May 2025 15:26:59 +0200
Subject: [PATCH v2 2/5] iio: core: add ADC delay calibration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wip-bl-ad7606-calibration-v2-2-174bd0af081b@baylibre.com>
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
In-Reply-To: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=aRzAUIAqWC4TDqtCS6Lh/5C89FaJdMlDTJtPJeTuUxw=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgQOaGe4Prlx7WUc/4Pp9hOCv5cc/iEkqbfoeg6N+Ws3
 kae33tMOkpZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExEvozhD0+DQLZwyjMe9YyD
 5x88/vjr0Km8p526nJ/q/4sw6Um4bmT4X3w9U2pGx7bNC+yf3OM8UyzpcVIyxS/OcU2BnMo025D
 bTAA=
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
index 178e99b111debc59a247fcc3a6037e429db3bebf..45ce8603959e6d0985904b7feb79872bffde1126 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -188,6 +188,7 @@ static const char * const iio_chan_info_postfix[] = {
 	[IIO_CHAN_INFO_CALIBAMBIENT] = "calibambient",
 	[IIO_CHAN_INFO_ZEROPOINT] = "zeropoint",
 	[IIO_CHAN_INFO_TROUGH] = "trough_raw",
+	[IIO_CHAN_INFO_CALIBCONV_DELAY] = "calibconv_delay",
 };
 /**
  * iio_device_id() - query the unique ID for the device
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index d89982c98368cf72c0fc30fa66ab001e48af4e8b..d1137180a8b0bf2e34cb4186dceddad4978ca766 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -69,6 +69,7 @@ enum iio_chan_info_enum {
 	IIO_CHAN_INFO_CALIBAMBIENT,
 	IIO_CHAN_INFO_ZEROPOINT,
 	IIO_CHAN_INFO_TROUGH,
+	IIO_CHAN_INFO_CALIBCONV_DELAY,
 };
 
 #endif /* _IIO_TYPES_H_ */

-- 
2.49.0

