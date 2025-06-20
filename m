Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963B24469A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750458088; cv=none; b=hySiMeqj8vZMRca+gHkh1XtVoCQ6buUWWCljkqpbww58UNODxmaJMwJ7FbTOrQCEupZIkiHsU3654v7ZYaeyt+zP4uvlrNL0jUlHzSE0C+4WcKmZIJAbQDUfOAfmGE8OqHF24//NLx6v80hIx0qyPXoATCtIVa4Xn8HGmSYTews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750458088; c=relaxed/simple;
	bh=vcFh01t+JmSdJIe+pkepWbRzB5Tv6UVGsGvhuGY2/vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwRynMNAOnne5CrxyBwvcb1P8tt87UFHEXSrqxJS2QlvNKQMNqFaeeCXcZuVxU76ryWiTFcld80VB6ttT3T1cNUPFMdhP2qaamHYZ03mSM4vXaxvXREKscx7NDMBE3bOl6elWNWTCqzdulLaDXgg22FBHVIgAgGh8PG+2gay7yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fx60Fh0r; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fx60Fh0r"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2da73155e91so757600fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750458083; x=1751062883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwFoCP9sQfkuV+I5mDs2NyND2ADnvvFWBv7uoS+Gnc4=;
        b=fx60Fh0rl8a5lwYtq/4oFbPkiQBuNGW8hh8KmRdE0TYoYgWmCAEYEkD8y/p+mPi3wL
         JBaLw1BC20nwUKUkCnQRvgFqlgjp8yPghFGUqJs9ux7u/TJDXC748oh8GmT7qYFbi2QZ
         IyPqSNez0ddxPmZvA8J0R77sRs8RB9HDh6q9u6prOe3NvZNkyookztRK2S0w6tOcgyeE
         P34l3VCbvEiasrB0XnWu7Crk+cNO4dMOCRSj0KTB1kNhD3wXBJomv7h5q/fcAnQ61lHo
         ozZrahBpvYme6Ji6PtLcErkl5nRE4ZrCHPmFfLm3fmrz17u8b/7Xos2JA3Q+bfGCx5yA
         d+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750458083; x=1751062883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwFoCP9sQfkuV+I5mDs2NyND2ADnvvFWBv7uoS+Gnc4=;
        b=fTe8AYA67b4CUMsZNcy+JS+dU+w5iabStMSxQNOessAujA77iX6jHnlpD7olwCYfJB
         4cjvu892y2YYKA8LaIahz091xHC3jVP5AYRzQJa4eOU0VLY6fAs97j2MD2JxHmeT7fja
         BOh/UGRRZewzQXA/BtepG2hG8S3LX56u2AWOUz24kYsYQcktpVb7+mRBSF+lj17Nnzfd
         LLssBovhtm0TwBcHTGtz+CwYlFnwpkaqumSzeFcK/WqUBhJt47QWLY70TiD0XgsfI2xZ
         nSiShs2BtNbQFyAoZXUIPHSbmUXHRiGEDRupFv/aC+zf/RCUBKudeBvNjs77SMiNDZB9
         jDqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKCCZcShq0Ea4cZGXdBasVqbYlnDwKjI2MGx27cfkeOmclTJxtMhjelxUdqQn/rVncmyzGL9zjITDDOCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI3UcMPKuoJkNgEpOgwvSQSQrwzA8jN5N9aGgPN1/XRdCz6nYG
	+oxwREFpuxaQoUOmdnimowHHfDhnNKw6ZmZEExyZisaIDZzV8+eQ+EwFwlfE7LsnYTA=
X-Gm-Gg: ASbGnctVYuBuoTRLA7SXIMOO//64M0LCEWHGIvF778TCrOOcOb+bd4/0JdMBMjWuY0w
	hAz+5usQg2rpYbjCEE9dFVtBp7o/RiBo+ruN4HsIP5lECv/q7WnT4/7DkaEljVF82n62Q1mb3pU
	OTLN+LbeAN9w/AVuRGAYQOBMrC2L0zetrC/jIWl9u9wKK7/PmkflWE8kQ9hk45OQXtCEKCm2YG2
	JHBn1nfuLvFoC7ioyGFP+fD5kZWzbYEkGoxHrjIZ40zMCtYAEC5wQva20tKQWStmAIOGVAaBWl9
	jJgpwBGvqEOfcdiK6Wui47vmlVrel7N3VgkEmawnas54P41gbaavYIiZwpISxGCmMNOm
X-Google-Smtp-Source: AGHT+IE4/LcA0WYE5yJAI95TpeYpZDVIpC1YxrPmFCw3pSnW5EA4v4vkS4RidHD+h3dLK1w7YqZfGA==
X-Received: by 2002:a05:6871:4409:b0:2d5:2955:aa6a with SMTP id 586e51a60fabf-2eeda4e19f9mr2846359fac.7.1750458083288;
        Fri, 20 Jun 2025 15:21:23 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c4bf:cf27:203c:f8b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ef481fe06esm7561fac.35.2025.06.20.15.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 15:21:22 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 20 Jun 2025 17:20:07 -0500
Subject: [PATCH 1/9] iio: adc: ad_sigma_delta: sort includes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-1-0766f6297430@baylibre.com>
References: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
In-Reply-To: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=vcFh01t+JmSdJIe+pkepWbRzB5Tv6UVGsGvhuGY2/vU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoVd6iInU0MFGX6S6BJOE/3ef2lfn/fzwjEWMx+
 za/8sCxIgOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaFXeogAKCRDCzCAB/wGP
 wJT+B/91aR8po6rLRfhWcXtrVeiDAY24/tBykK824JFFxyJKGP373X3G2oaJCappPjHsF7Ci5IT
 uR5XOx1sWev4LHgCQCLJ3qv6tWNi5Pu03xM2MsJqrZxKPfZQSbD9QU9z1sIGtjHDkrRCpagCIxN
 h9TXdyhOabuMPtljX3UnPycuZnL/PZ7h3UK0Xr598zSDG7FT5Ps1oXdalwaTe61evBFWZossv4Z
 UCMYHBmnw8JdqEkEfuY/aE5K1MTYMwj11dKnDLwwSxCF7RScDWyNddLEJuNgC1F8SKHTmoPCUG3
 YQx4r8uxr1oFVcCZ1u/BPmk8sXVIVbVASpKn8r0fJhhceCne
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Sort includes in alphabetical order and fix grouping before we add more.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad_sigma_delta.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index 4c5f8d29a559fea7226b84141bcb148fb801f62c..6cd3645eaaf38a23d5b6479ac598b6d276cfd81a 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -7,24 +7,22 @@
  */
 
 #include <linux/align.h>
-#include <linux/interrupt.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
-#include <linux/err.h>
-#include <linux/module.h>
+#include <linux/unaligned.h>
 
+#include <linux/iio/adc/ad_sigma_delta.h>
+#include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/buffer.h>
-#include <linux/iio/trigger.h>
 #include <linux/iio/trigger_consumer.h>
+#include <linux/iio/trigger.h>
 #include <linux/iio/triggered_buffer.h>
-#include <linux/iio/adc/ad_sigma_delta.h>
-
-#include <linux/unaligned.h>
-
 
 #define AD_SD_COMM_CHAN_MASK	0x3
 

-- 
2.43.0

