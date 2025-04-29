Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8C2980CA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745893050; cv=none; b=tu2Lax1CoHZ6fFydW2FPXEPgrPk1lbDl8Hr3rROHXRYeAKedmh8o/CtcQO3M3c7SUKddAQPNcZcvPh3prTe785CHEvzJ6DoobtX99zMBYUlDj12xny1mAKk/Fv+u009aSLvBxLHacT5tKAjbj4CiRToco7iIoQXRY7KUjMY8Uvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745893050; c=relaxed/simple;
	bh=r4Xvne1iEXPAeguZm1TQ8Dfad3TUBl5sXeU4woeJKM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WNqgXiTSQu5cMjvbbuiw+Lhr8WKw7ZWyvBTRRs0ho5oiMe7LLH8KJaY+7JpjWyrDQJ2FpLnus3xT1YxitoEmCg1Uoba6RhIubqHzRbo18OcW23l+BJfhYX7NZUsZkYa1n3ilZeS8OqfnaTf6qDYBpAJZYiB8vezrSmMxfGb6KjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YiFJHeqh; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YiFJHeqh"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c40235c34so1623518a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745893048; x=1746497848; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxAQ7U3+wNbG9z9JR5W9etJLvPLXYYeasvIVL7H/WCo=;
        b=YiFJHeqhOMLOoAOU/0Gx+yDiR6M3p+fyXtgOQzN3m8DaulOAwzwKc9M2Yag7JHDLaM
         l0ZbHJtW/Wra//naTEXyf4pUTZYsIu5J3I6Vc3T07JlgQSbVbtvlS0bjyJxLjSlijEk1
         EP1njqT35xJFsSr7t1R0bXRLd3rkd32l3GQkATNxbKlrx/N1OcYJsETSAycAhTnkNPCv
         P7jms0MBI/Jy413R+H3cwCmwkn5cNZeBkzOEi/dSCbsCS2iPrAaF/nYYJRl6N4CmTOGJ
         u1MlD1Ej8+TZsDQVojQSC8y5KI9pcneKIxwysHEhqNvUSuGMRx14mG37GvC82VA7xmMs
         qhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745893048; x=1746497848;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxAQ7U3+wNbG9z9JR5W9etJLvPLXYYeasvIVL7H/WCo=;
        b=UZE33mzTRUqVg+CbDDcOnc05wgCTejwnV9fTO+ZGj6Ntswh6mYdnESXQOY/6e6VtPV
         kNqJ2c1KJhbOxv5r+8CyA6wwGc5ZGn+eUz1dRNtoCB85f5as/s5G2DalzhoXYPTZ1feo
         zXl/lZyZ9pxdlMgFg4uEIH9wlaPk/flKpO0dXxZaI2aRUD7y5lGfqmzRFV5OqopDX16b
         lOzxp4NA5QXd6X5Haq6de3MmBUmFpGZzDO9GOnT7FYMYLWlR57fEaG2RiSeie2JKKdhI
         URrOlnwiw0hjg9bEwM37gOeC5/ag8uuwRtX9eefbZViFRrPxKCY24k3I6O4v33XS/NBg
         BvUw==
X-Forwarded-Encrypted: i=1; AJvYcCW89W8DEn8eOUzWpKgsuytahNAxVIFpAfb2f3Nwo/UcTypPMzoUTmMFc0/hknT8oX9vDlHCeotA8Y3jKU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/mBu5yxdfJe0Pbxh5VHe680+jVAeJqI4umpyZnLqXBXGO8DR1
	cSqNzdRKA93bwVydOsbD6RDASkMspEGq6I+kTnwII13LULKvssjDxXJ9O8n2nHzd6vQIYf6watn
	e
X-Gm-Gg: ASbGnct+Gx8CCLwoYp5WCMr0mzOko3omFC9LswmrJQrUzM2yNgSuOLxcZDGwN1/LW5f
	GYn52Dyk+Vb+J9tOQVY/dcM0XhR4jwF5GEMjepwPIOH9Sky1izoq7NihrbyKmbDIGD1YN8DDvR6
	2Xd2SosOg84I9F25HxtdnpWrZjF3CyoBVyQuUQ/WgWUFQTMB2EuusQR8KamlpNZh0IAV72WdBEe
	qGAkWptqvMOLbRN8i7kLgG9U0VjuZ3bsTBPsCFPcSbC/2g5EggR8tC1qdpB1wVAyIJTIi5aHjKr
	xc5FV+fcf1fDkXMwReQyQTx/HqcFEwKeTck/qH9cy9xAq0iOOr9hf6HVag==
X-Google-Smtp-Source: AGHT+IHNkH1RRqrvPJPVcOqtzsqUP7XYeUcIbJHZzFCRpW2IVsA6MD82R7M5Yf5Dsop7VZdM8d3xPg==
X-Received: by 2002:a05:6830:6019:b0:72a:4804:77ff with SMTP id 46e09a7af769-7306528b06fmr7224803a34.25.1745893048059;
        Mon, 28 Apr 2025 19:17:28 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b0f3ffdsm101440a34.9.2025.04.28.19.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 19:17:27 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 21:17:14 -0500
Subject: [PATCH] iio: adc: ad7606: explicit timestamp alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-adc-ad7606-fix-buffer-alignment-v1-1-88dfc57e5df0@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAKk2EGgC/x2NQQqDMBBFryKzdiAGTdSrSBcxmdiBGiVpiyDe3
 cHFWzx4/H9CocxUYKxOyPTnwlsSaeoK/NulhZCDOGilO9XqHpk3dMEL1iiDkQ+cfzFSRvfhJa2
 UvjhEH8g2prfBgyztmaR7XqbXdd3U8X3AdQAAAA==
X-Change-ID: 20250428-iio-adc-ad7606-fix-buffer-alignment-9fcde71687dc
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=r4Xvne1iEXPAeguZm1TQ8Dfad3TUBl5sXeU4woeJKM8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoEDavdQc1qtun+85xGI5sUhiW1Z+XwmEcBblY/
 W2NloNufdGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBA2rwAKCRDCzCAB/wGP
 wLIPCACNjO5Z93T2mM8N/PlidRDDnXmwY48keUAbQpoi2XfexXkLj0fQ9tAYn3cq0ZeFSALoZM5
 ZJu9SAJHPXDVf+TJbfr01cbMkdpgKYxtBkAQ7LAM/DLY7Uklhi+kEOlUq7H116bUMn1tt5kdsnC
 OOlWcc9EVc/I45HbtFWLs7fdWJHvMW54bgnXuTqstJI2mWTjLGJ4NZ3lLkWjMxA5P2FgBe+7ZWX
 erFb8DVuIpgPzowsCD/8IrRrFGLApZ+qirxyGKyWoKoV2K8ZeYeYh98OLyE5/tMCcLxyh55BoiT
 2rc5qYjjG7B5xvUL83OOrAWfuLT5u/XfmfKoibXyWi1ZIMdD
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use struct with aligned_s64 timestamp to make timestamp alignment
explicit. Technically, what we have works because for all known
architectures, IIO_DMA_MINALIGN is a multiple of __alignof__(s64).
But this way, we don't have to make people read the comments to know
why there are extra elements in each buffer.

---
 drivers/iio/adc/ad7606.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad7606.h b/drivers/iio/adc/ad7606.h
index 89d49551eaf515bab9706c12bff056dfcb707b67..441e62c521bcbea69b4f70bb2d55f65334d22276 100644
--- a/drivers/iio/adc/ad7606.h
+++ b/drivers/iio/adc/ad7606.h
@@ -155,12 +155,15 @@ struct ad7606_state {
 	/*
 	 * DMA (thus cache coherency maintenance) may require the
 	 * transfer buffers to live in their own cache lines.
-	 * 16 * 16-bit samples + 64-bit timestamp - for AD7616
-	 * 8 * 32-bit samples + 64-bit timestamp - for AD7616C-18 (and similar)
+	 * 16 * 16-bit samples for AD7616
+	 * 8 * 32-bit samples for AD7616C-18 (and similar)
 	 */
-	union {
-		u16 buf16[20];
-		u32 buf32[10];
+	struct {
+		union {
+			u16 buf16[16];
+			u32 buf32[8];
+		};
+		aligned_s64 timestamp;
 	} data __aligned(IIO_DMA_MINALIGN);
 	__be16				d16[2];
 };

---
base-commit: b475195fecc79a1a6e7fb0846aaaab0a1a4cb2e6
change-id: 20250428-iio-adc-ad7606-fix-buffer-alignment-9fcde71687dc

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

