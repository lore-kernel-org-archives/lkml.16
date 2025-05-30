Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4E226863
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641827; cv=none; b=Qs3n/F8LszDr5PnFhsZQ24dIh6oLLTLh36d2XTWYyVrNnjyDPtgFD2Nmk3hAHEQ2jgZWy+CceNPW88Kr8cpt0LrOOBJIylFmo3XvF7swhZDZuJ+UiSSAAuDj7SoAdnph/MC6DKgb4eaoHO0zie2ImSMutzWYCuJ156sIZ1SG3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641827; c=relaxed/simple;
	bh=+LfWniESF6M2p+FgfnwNhvqmla2v/+V0o95urQLb25g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hppchGiGU9EG9uGgF7R90qSW0jcH7SzCDBEDmaqyaDmsU2KlfqiyJs/Dt+x+nr6j3E51g9H2scJdwMDL7/pVyBKXUNjpo0+PIbtyZBC+xoux58F4/gE4AE7WLAKIR3A9nsoPB1ZOBBHBsPlww7bg7uj8jZ16hKCSU6awv9LwPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yIQdV8DR; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yIQdV8DR"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-736f1953673so222808a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748641824; x=1749246624; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkFCsnDIHW6E5LdzUgSg8CyIgyUdxpvIaHU2xP6RQ14=;
        b=yIQdV8DRc2RUj1zPG9APA5b30I7qDZmiL7849c8iZJnWRH4QAq17sACyXVye9tFC7G
         g1qpH0ebKF8RKAX2+9WJkllNDOzSeIRL7AiQJshxPx/q5PkMT4Eq1i2zkmImOYzqvJBk
         4cNE8SfiBUvTDIy1QECH99NyAwyMfBFBxVX9wGXM2R+LBTUh9ba4XDF/d9UgDgiauNeR
         jCG+Dp+L0OUl8XnTjQh+dmmp+0+9QDqIE4kKcM7XRBazY8Y3VzTq9t5eUQ1haiKxNoIx
         4TGmOxbDDtiabT6sRsvjBulXHddQixJK8VXe3Ynmo6BR9yXf4I2D8DZJbSnRW5sDq17V
         1CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748641824; x=1749246624;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkFCsnDIHW6E5LdzUgSg8CyIgyUdxpvIaHU2xP6RQ14=;
        b=DE8w71X++qfS9RvDt96LdkJx16dOKQIgjOLWSbeqgX9dc+3wiUzyO9D6E6A8G/HCgL
         CZOpCSZt8lPEky1KNbnq1qg7dQJHEfOyh9FjcanGf5qABS8z7bxw6tCZuphnOsu5AObN
         vpO6sN4ff6U/qbviTj8fb5+mvlhNkZ/+4nuFduVa0mx++aXl688SGK1MaBO/G2siSuFp
         7aEmZoVaGt1EK9FCCrCqG3q51jKVy2NXpgUbTebtNC0dRfJWGQcsBIJQsZ+KRgrmGTAg
         OSIMeztuEJodqAr0ALwNv0QC6z0kALY+x2oN1T3YPFtcT1+IpJ1HlVrf9idsM89En15F
         BIQw==
X-Forwarded-Encrypted: i=1; AJvYcCWm/F+a319QHqGWkhLj6Sn88cyYzHP+MiihIxRGMEZzOG2V5KZMoMk06kqJtsHe+5NXqnoSuETYRkjkHU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB2+j3ttmBMuhTelqvw0Q+XvYeet0pSuIacmBHF6zSmbD3mbhu
	DnaMxGt2mgSUP7wcli/UOWZTGnz1iIe9v5G4qcyeMzyfuyJorb39yAWCZpTZJ+RmNzc=
X-Gm-Gg: ASbGnctvUJEBw5Gy3VpfHrCWtX9CkJYVrK2uv7Pa9VeTT3cC3ii0vgAmEZNrRi/jKZB
	jw1T/zTmLJkdvqSPBMcjZdY1FhPA+vu+amc9+fOfrGuPChO4bcd7cRnnglR5/Yen6iu4GbGgMjh
	r8+pl6Zy0Yfoi/vTq++wMVps3wNdEc/izFpGC3K4+i46x6LXtCzxQEd51t++s2GDwoYORvjkk9t
	XyPg5uZ/Y50J0RC0qODLPj8rJlf6gH/qUZutK4bCdw6H61ZaMVnsXzhNi3tpqvJxz6dXVVyMnAk
	1J2QB5ZFQ8dOLJC6aKTCFK17V9ZOVYmLm5NnxcVmEUIP1PrbYY0NGCmuuw==
X-Google-Smtp-Source: AGHT+IGKVLEbmu522lYCLzZMIswrfPdfbN5jI/3EPFFJiXCOS3lO4xfkSEESWXJICYKGE+EZr6MV3Q==
X-Received: by 2002:a05:6830:6b07:b0:72b:9b1f:2e1d with SMTP id 46e09a7af769-736ecda85dcmr2316838a34.2.1748641824680;
        Fri, 30 May 2025 14:50:24 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4b52:4054:714f:5bf2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82d2acsm737013a34.10.2025.05.30.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:50:24 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 30 May 2025 16:50:14 -0500
Subject: [PATCH v2] iio: adc: adi-axi-adc: fix ad7606_bus_reg_read()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-iio-adc-adi-axi-adc-fix-ad7606_bus_reg_read-v2-1-ad2dfc0694ce@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABUoOmgC/52N0QqDMAxFf0X6vI7azip72n8MkaaNGtjsaDdRx
 H9f5ifs4ZKcS8jZRMZEmMW12ETCmTLFiUGfCuFHNw0oKTALrXSlKqMkUZQueA5Jt9Cx97TwrK2
 yHXxyl3DguCB7DQCVMgEaEPzxlZBPD9u9ZR4pv2NaD/lc/tr/PHMpS+mx6WsPl2CtuYFbHwQJz
 z4+Rbvv+xfnDnNH6QAAAA==
X-Change-ID: 20250530-iio-adc-adi-axi-adc-fix-ad7606_bus_reg_read-f2bbb503db8b
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Angelo Dureghello <adureghello@baylibre.com>, 
 Guillaume Stols <gstols@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=+LfWniESF6M2p+FgfnwNhvqmla2v/+V0o95urQLb25g=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDKsNCRT9lq0/DcRNJmrtCp6zVuex9m6Ft6WB1ftTys9+
 JFFfoplJ6MxCwMjF4OsmCLLG4mb85L4mq/NuZExA2YQKxPIFAYuTgGYyI869p+MF0QCvWLvC0e0
 smg25NVek3g5e75AaekC0aTDLa3n0xUZbqxM2xB+L2Zb4v/I/qgy77mL+KP/HvygXV20aFMB34T
 9i4UsLLa/e/BXe+2hiRxFdvovEgMXufe/7w3VV+uoMd5RnOur5u3j8TVNreTKEo5Xb2z+yrjUdx
 w8LR0vyj+n8sdL82/mrnlF6pklUel9tU8aWxx+me8QN0q81W9Vl37Inr/cdK6Ukq7ArzvbxYKX1
 p27cKrj/YysiJePBA+1hEiE9E6tX/h1mbH4rMUrNfdosaYei1GdPKvvTRyXjVdfgfVMdYaD0d8P
 XTTdndfYPjlZy/bi3YnnAk7Ksjuo/eTyL9oUOuOqxWYnAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Mask the value read before returning it. The value read over the
parallel bus via the AXI ADC IP block contains both the address and
the data, but callers expect val to only contain the data.

axi_adc_raw_write() takes a u32 parameter, so addr was the wrong type.
This wasn't causing any issues but is corrected anyway since we are
touching the same line to add a new variable.

Cc: stable@vger.kernel.org
Fixes: 79c47485e438 ("iio: adc: adi-axi-adc: add support for AD7606 register writing")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v2:
- Use ADI_AXI_REG_VALUE_MASK instead of hard-coding 0xFF.
- Introduce local variable and use FIELD_PREP() instead of modifying val.
- Link to v1: https://lore.kernel.org/r/20250530-iio-adc-adi-axi-adc-fix-ad7606_bus_reg_read-v1-1-ce8f7cb4d663@baylibre.com
---
 drivers/iio/adc/adi-axi-adc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index cf942c043457ccea49207c3900153ee371b3774f..fc745297bcb82cf2cf7f30c7fcf9bba2d861a48c 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -445,7 +445,7 @@ static int axi_adc_raw_read(struct iio_backend *back, u32 *val)
 static int ad7606_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val)
 {
 	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
-	int addr;
+	u32 addr, reg_val;
 
 	guard(mutex)(&st->lock);
 
@@ -455,7 +455,9 @@ static int ad7606_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val)
 	 */
 	addr = FIELD_PREP(ADI_AXI_REG_ADDRESS_MASK, reg) | ADI_AXI_REG_READ_BIT;
 	axi_adc_raw_write(back, addr);
-	axi_adc_raw_read(back, val);
+	axi_adc_raw_read(back, &reg_val);
+
+	*val = FIELD_GET(ADI_AXI_REG_VALUE_MASK, reg_val);
 
 	/* Write 0x0 on the bus to get back to ADC mode */
 	axi_adc_raw_write(back, 0);

---
base-commit: 7cdfbc0113d087348b8e65dd79276d0f57b89a10
change-id: 20250530-iio-adc-adi-axi-adc-fix-ad7606_bus_reg_read-f2bbb503db8b

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

