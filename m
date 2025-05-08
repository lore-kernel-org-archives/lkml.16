Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABF1C84CD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698846; cv=none; b=i8zcHmPfIfwkxUrLVusfDLnn3N65yvQMglBxpBDhjkw4Y9kZ3mwVmZj/ZesIJe3afkFdzCq0zaf9+gfxmvM7gZV0S8hBKL+Fk0v7jCqnvN9dO3t0EybUEb5Az9y7ll5ggqV8RBveLEGxsaODBgGjZhLpLjMytMdkxFRM9ePfkwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698846; c=relaxed/simple;
	bh=wbY05BM+oFyf5c7eesHOTO2O39mRvXwu5TpZihwG4+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jnF0xtZVzkpL/aTbIM/w6eF2RDAike8cjtGcQ8ClQV3i5XxMeMH4eK8Qu2psSe62HiJJCDq8SMQhYQSxjlkJoNj+zziCONmcCmkKJTL4Fkbi2+dehnpWxwhW1NxuRff82u9JdA+AUMfItOFL6pcic7804txdZkdMso5gEVyh2mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mycs1VwF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mycs1VwF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3995ff6b066so446324f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746698842; x=1747303642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=njSz3ssZ9vsO3uOFmBi11IJ5TO4pFxRuIrUMYY6uL3s=;
        b=mycs1VwFg9fkwu2HQ5152SgC/cvMV4LhrdLq372/E59zeD4/4yrXuae0VVHxMRQJfT
         blOHlWjHxRilAP9+66/YZ3u3aXMo8JVuL1aRpSRinBZTx8cKZdsLe9Fb0ZWfpokUzmHU
         TLVYucGGQ/SNhu/tdZpBjNYQDzk0c/qgc5GRtgxfQD3WxNxuMNquXdudqawp6PpWhcJw
         ERyUFqfuY9DFz0T1sPvWTaKULafMQSS8gR/mklbS27jZ7tUaajqU3E9tzKhG2SH/w4IF
         0xvAJ2SZNy6rNm0v2ed1K4FubepjMzEFPBys+2kFjxbkgPF7IAUAAaQHEZkQUM9br+ga
         dIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698842; x=1747303642;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njSz3ssZ9vsO3uOFmBi11IJ5TO4pFxRuIrUMYY6uL3s=;
        b=Hdo8pfdLXo/w3ekad12q7A/WXLQ5raoks9+5wsaVmnIilkQ8gkXQ0CcO5jEtzkUsQB
         rdU6ylAlEykUF+NUhIAxbpq9Yj/qT8Ik4qRQMnqIBtBuWuOPYnkweIg5aDKFDkGwjtHO
         py3plkuqlJftycrmzxifqNiqN6cqOSoWALqFiG+rs+dI6mHUkaP7rqZXHYRMaSiCQX7+
         t3tYHEDwMFy42SZoMeztnoZnsEK4jQYQzwjOrZuxumF/v6/zeHEA6dzOqKAuA8eRDx8n
         cXl1BFZKkuFV1QB55eqlVJNxZ7zjhi7k2+9XnIojXzO+QEhpZ9WGZFUTHPqN8F0LCq5D
         3EDA==
X-Forwarded-Encrypted: i=1; AJvYcCXqyuta5I8m0ZJxbw6OB4kjwNLzG2K5fgEVkXRYdyX1yeAaNAaiXcZPaRqIq3zjNwYXLmbADTbTc/5nYD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3Iqmdf4eV+wL8vVD6iAAUaspC9v8aVP/jE2dKwyUFFzYa1uf
	zF3PNiuS/gAjeAW61fOl4efivDzmovhLimBLUovzsRQbeBk6f7lvR58hwTpAHh8=
X-Gm-Gg: ASbGnctc72KLTKgC/ubC2720o3vSZ4o5oY4D30D3tlu74f3eqk0v28LaDnIOVv702lQ
	TXMGqqDP8LkfiqWYV8gmclx9JLbr89c300BMVVKTsSxddB+ZfZG4z8vQFD+mYAI3bvfY2wcohMr
	LbCtOZ08EBEP9xHiF5VkQ6HJ3pny/FieMaWZU9py/3fjRggezuDzrzT2bY1I7Zc5+cSuhDT7yBy
	S7HrF1N4+U3K7WFNDFHljy5i5hsp2u6e9rQRJgvZydclbjAf7pvjYn0q1EmITX0+vOCB4ls+3q3
	v/vsA3qDOWALvOjV9ndLTPbQ6qm8PQQh6Lo7oi0xYDWFWqq7FgxwIrf2XfF6XrojO+SoWU8pZtC
	4QeKmJA5VV4zP
X-Google-Smtp-Source: AGHT+IG5LFa6Ck9ZYFbUs7yGsWs+SbJIJB7ULfi1cZg9Cm/5pQcWo8uOLaQcTk9BEl1Kfmx1cnsDLQ==
X-Received: by 2002:a05:6000:40e0:b0:3a0:9f24:7742 with SMTP id ffacd0b85a97d-3a0b4a4b4d7mr5131493f8f.41.1746698842004;
        Thu, 08 May 2025 03:07:22 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd363940sm31699665e9.25.2025.05.08.03.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:07:21 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v4 0/5] iio: adc: add ad7606 calibration support
Date: Thu, 08 May 2025 12:06:04 +0200
Message-Id: <20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAyCHGgC/43NQQ6CMBAF0KuYrq2ZTkurrryHcdGBQZuokEJQQ
 ri7hY3GGOLy/8l/M4iGY+BG7FeDiNyFJlT3FMx6JfKLv59ZhiJlgYAZGNzJR6glXaUvnAUrc38
 NFH2bVhLB6531FnSGIu3ryGV4zvbxlPIlNG0V+/lVp6b2H7VTEiSTKcwWFSmHB/L9dOZNXt3EB
 Hf4xjLAJQwTppyhAnwJW0U/MP2J2SVMJ8wyObLsUIP7wsZxfAF9gpeqXwEAAA==
X-Change-ID: 20250429-wip-bl-ad7606-calibration-20a396a60352
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=wbY05BM+oFyf5c7eesHOTO2O39mRvXwu5TpZihwG4+w=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiQaeK783VzWaW8tUYbW2vlTU2RvSetO+dn7z+042PbT
 P+/3inpHaUsDGJcDLJiiix1iREmobdDpZQXMM6GmcPKBDKEgYtTACbiNYPhn/qOtfLPde4tjr5j
 dT25m3OH0HEugc3PHKY0TJ9p9Fb8zSZGhptd/bN5ti7ZaSqfVvr8elahSO75ixMmecwoWPlad8u
 GChYA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

Add gain, offset and phase (as a delay) calibration support, for
ad7606b, ad7606c16 and ad7606c18.

Calibration is available for devices with software mode capability. 

Offset and phase calibration is configurable by sysfs attributes, while
gain calibration value in ohms must match the external RFilter value,
when an external RFilter is available, so implemented through a specific
devicetree "adi,rfilter-ohms" property.

This patchset depends on:
https://lore.kernel.org/linux-iio/20250505131544.0a7477a2@jic23-huawei/

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v4:
- fix ad7606_chan_calib_gain_setup appropriately to be called once.
- Link to v3: https://lore.kernel.org/r/20250506-wip-bl-ad7606-calibration-v3-0-6eb7b6e72307@baylibre.com

Changes in v3:
- fix dt_bindings,
- change sysfs calib_delay to convdelay,
- fix sysfs documentation accordingly,
- used u32 for reg and r_gain,
- used DIV_ROUND_CLOSEST for setting r_gain,
- minor syntax fixes,
- Link to v2: https://lore.kernel.org/r/20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com

Changes in v2:
- change phase_delay to calib_delay,
- fix dt_bindings,
- fix gain calibarion fdt parsing,
- fix ad7606c-18 calib offset range,
- fix calib offset calculation,
- fix calib gain range,
- Link to v1: https://lore.kernel.org/r/20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com

---
Angelo Dureghello (5):
      Documentation: ABI: IIO: add calibconv_delay documentation
      iio: core: add ADC delay calibration definition
      iio: adc: ad7606: add offset and phase calibration support
      dt-bindings: iio: adc: adi,ad7606: add gain calibration support
      iio: adc: ad7606: add gain calibration support

 Documentation/ABI/testing/sysfs-bus-iio            |  24 +++
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    |  29 +++
 drivers/iio/adc/ad7606.c                           | 221 +++++++++++++++++++++
 drivers/iio/adc/ad7606.h                           |  12 ++
 drivers/iio/industrialio-core.c                    |   1 +
 include/linux/iio/types.h                          |   1 +
 6 files changed, 288 insertions(+)
---
base-commit: 2f122cfb4c5d0ee7e44ed34ccb2d148d4146c0a5
change-id: 20250429-wip-bl-ad7606-calibration-20a396a60352

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

