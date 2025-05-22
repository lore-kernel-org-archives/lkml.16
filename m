Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D028BAAE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920585; cv=none; b=aw4EPaTEdgpVx6VoysizyE1BFbnurhI6RGsqjCqrAJF1kKI4w3OsSZ5+gvbgaLb2vkrUrFtZ1nngDsQ+w6fl+OpVB215WxFiuhVH+dRM74hK3l9EGY46dUdOf3ICS7VzspyA1hOUF6zrgOIAF8e1cDKyEu+qeJ/pZ/ozhxoWXCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920585; c=relaxed/simple;
	bh=YvxmOcwXxySke6hJNz3qXEpH82+lpny5SEPaKZ39tzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iSzRX4Lslt7PKtbNC2qaZlxDlBYHePAu30dHSnb7VOd9NFLV61kzFF25lA88etZPdGKNOTPtjiyDHG5/L1psIkW78dwEztcYUTp6RrIuZUctGmahD8hdxIhM/s99v3CY3lmBIs3cCYEsld42CSjC3+Uz66l2GbbX9ibmv2EoZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RcqIlTYI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RcqIlTYI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe574976so58744125e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747920581; x=1748525381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIzpzapNTYH4VGBko38vkkxsTkjFZRUZnHumpB9vr+c=;
        b=RcqIlTYIKFM23kLsONtpo1F7YAv0TM+siEzdQkBN7akYsoi+KXx3zwz/qcpU9zhm0t
         8r7mqpyR926veWXzJiEMtMfUOJPDGNKj3bOYgNoEMpjO/eJMpgvMWBZSr6MoiBCgGriv
         +oS0xTq+gaQH8FLMjwezwFAegKak1mRaO89swafNAQap7croNxgAhd2Q1+OoFX4iOADE
         qyntnhLq3vaYugCglzNi8hI8upHOV5qle8nof1SAPGHliQB5bA7EpuHfmwL32LFkrJTP
         bjghAJ2Xmrc19//3MgKgx7TW93PlFb7mgwq4UCjKJ0wDbEEAPeg3nJLEtX21wOw7tyxG
         RMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920581; x=1748525381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIzpzapNTYH4VGBko38vkkxsTkjFZRUZnHumpB9vr+c=;
        b=jKFv9sOkHzIUicOxyhaOli5597RaqvHeDSJQlD7HmJXUGFslZthlFwpqWW9Iq+NA/b
         UVzDqH4yG/Urh5+f0AsGOObPFdJJhiqEMAp4N3O+TtIfIsegExI0W/3iJm0zKGfgqwCo
         5HSVoYmL94LjjxxGjs4sl+RNO14xpsR3vVJTSGDIcepBrtk2R+gUJzTqCVl27es6lP3L
         kNppwPRGR1yJLO95DM7638AFJaT/u8Gj7IT0i0rYQsrCp1/xg7QapZRyI7lXTrC2yMuY
         WC0dlCAI5eWPTXLA1y59kP/L+SJfQDk+YsiEY/gUn2Zuz4MxTZSU2JFvG3ZoiV7UP1A5
         2zFg==
X-Forwarded-Encrypted: i=1; AJvYcCX8gGJxJ1lN9TAB86QfBMGVNcF59/pvx/6L0znXxCIENqzy/4v3AFZdgu6hjhlLFsixR6e8K2suJZ+iiVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzpNJk6+kqt+DYLX5KvY2hj4eXe4annzCEfhMv32BSCl68CdTC
	Qyhvi8i+pFojtkArqrhmPCZDzXt6GilGNlEG3Q4Y3cCwYk9Z2U1Aga8hQ0hgu3jOiuA=
X-Gm-Gg: ASbGncvaUo2xrMYN7d0xCZ6OGNVB5IRoOwIaiRPqvD7EtaE8EkM0uXYuj3ERjfPe4po
	+3tN1NHjrlaF656GdaNHhfThWPugh+XNQ91hNmd2PLpNVMJRB6OKZFfVtTJIlcRIGEUAgMuH2EZ
	6+6qlEY9OUtgSqwGll8x5NXUn+tcQNv/Sbswm224nuxh0RVRBOIZeNsGnukC26J1Klz7qsepUoy
	Q0PPzKHOX/QAEZifltzz5ThpyfzkeO3ZPnjoo56xNQbto5ieR/hpvCDryFQw4IDOgwi80qAuPCO
	lM2IVzhl+PRMTrWXUoZ8uvZsgg0twSthP7S984wqZ24b7+bG9cf4gLYn93wy8CP4/chOhwp70Ou
	PTF//WkzNY54UFQOR3jEj0eFWrFReZWU=
X-Google-Smtp-Source: AGHT+IHj5yBsUYf4YI13lVQPPXM3bDI+sCi+sYh/ZaKSTJgcKvk6X18B9cO02f0AvngeuLfOR95OZA==
X-Received: by 2002:a05:600c:3d15:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-442fd625120mr229896315e9.9.1747920580841;
        Thu, 22 May 2025 06:29:40 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm109837585e9.14.2025.05.22.06.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:29:40 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v6 0/6] iio: adc: add ad7606 calibration support
Date: Thu, 22 May 2025 15:27:01 +0200
Message-Id: <20250522-wip-bl-ad7606-calibration-v6-0-487b90433da0@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUmL2gC/43QzWrDMAwH8FcpPs9Dlm052WnvMXbwh7wauqY4J
 Vspefc5vSyMEHb8S+gnobsYuRYexcvhLipPZSzDuQV6Ooh49OcPliW1LBDQgsFefpWLDCfpkyM
 gGf2phOqvbUoieN2TJ9AWRZu/VM7l+2G/vbd8LON1qLfHqkkt1f+ok5IgOZhkOlRBOXwN/ra0+
 TkOn2KBJ/zFLOAehg1TzoQEPkOnwgam1xjtYbphxMEFYoca3AZm1li3h5mG9crrjJ12TFuX2RW
 mdn9mG2bAmhxd7LNOf7B5nn8A4uNIaPkBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=YvxmOcwXxySke6hJNz3qXEpH82+lpny5SEPaKZ39tzA=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsjQVzOoubh0u3WXZvNv/cBjkiKd7rckGu5vedMj/FCe8
 3tgV9XKjlIWBjEuBlkxRZa6xAiT0NuhUsoLGGfDzGFlAhnCwMUpABNJMGH4H+f4Tdbe48RmrXq/
 Q55S3m7fv77Mn+xUXlcisllSr51TjJHhWMCb+ijH/9OYZxca3/KfMME2XP3U/DTFz7apu5zulDn
 wAAA=
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
Changes in v6:
- exit for error in case of fdt that breaks the dt_schema,
- add (5/6) patch to fix the above on older code too, 
- Link to v5: https://lore.kernel.org/r/20250519-wip-bl-ad7606-calibration-v5-0-4054fc7c9f3d@baylibre.com

Changes in v5:
- fix tab/spaces wrong formatting on ABI doc (1/5),
- fix description in ABI doc (1/5),
- fix code multiline alignments (3/5),
- fix calibration offset calculation as oneliner expression (3/5), 
- Link to v4: https://lore.kernel.org/r/20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com

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
Angelo Dureghello (6):
      Documentation: ABI: IIO: add calibconv_delay documentation
      iio: core: add ADC delay calibration definition
      iio: adc: ad7606: add offset and phase calibration support
      dt-bindings: iio: adc: adi,ad7606: add gain calibration support
      iio: adc: ad7606: exit for invalid fdt dt_schema properties
      iio: adc: ad7606: add gain calibration support

 Documentation/ABI/testing/sysfs-bus-iio            |  24 +++
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    |  29 +++
 drivers/iio/adc/ad7606.c                           | 225 ++++++++++++++++++++-
 drivers/iio/adc/ad7606.h                           |  12 ++
 drivers/iio/industrialio-core.c                    |   1 +
 include/linux/iio/types.h                          |   1 +
 6 files changed, 286 insertions(+), 6 deletions(-)
---
base-commit: 5f7a3b3aa8dc5fb3103322c30c690d38d1a25071
change-id: 20250429-wip-bl-ad7606-calibration-20a396a60352

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

