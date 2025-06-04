Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940A187554
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050748; cv=none; b=QJjoo4Qjz0PHTtQCfmNMpZer+joRIT9yxsLfvVNC8/JK+kD45QXhREnX7ZlgkNQmHwc9Kvzbn5/1cdK0hzKCymtcwnWgaBmW71g7fOtSNHHXxMtSBZCigf8Q9iY6pITvCYeFenaJgnRmJjydJkMY/tz3Ufcg/9rpnNxKc362PUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050748; c=relaxed/simple;
	bh=isbY6m5bcY7s9P8U97tjZbqw2x3Sh9LSh6vgbTeTAd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y2NHKeJ3W94/LoKrGdaYxl3gXEDd92A3WVGsRvjywUAIwCuzMBCkkNfaLqVfGdZVesvbSQ2Neepy4zfeEG1tqu/90v4y7DfXr8dGxq5HXAgoK+JR+MenkRIdynEQj+vNVK9iqFB6BlTypTG4mbpQFPlZ7B20+fAMldwMn/btweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVbZLGlz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVbZLGlz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d54bso12822691a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050744; x=1749655544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Mjo0DOx9z6CkyXriQUpR9DCtiHO7VQ4yQ7cb2Q1zps=;
        b=XVbZLGlzRXRSfsnJMhZMh8/2nCcbPsq7nXU3E3x1R0OsodCLV0uCNaGw65o9Dywc6h
         3TFfECaNambjRaD3DB+XlmEZGgbmugpV/SZEBRL6GVso4QoXcYwhUnlmJTGjIrzi3bcR
         jngPlvdL+2dpt3Gb96E7ZP+iXaLyp+uG5ZUs8l/WhMH8Bm9d3UDSL3RttaXC3wq1bGuD
         S/5dTn6iXCld9OFfj+Qr8CGuE1I8RgMJ6mzHdhF82wLaA8oNJAVBkrsDZZVlNALajcnG
         dsnHR6Ql/h5QLT3lJamlIgLMiLwY+AaK3rWENfXTjpve0WRzD1dyq1nXa5SwccW6kvLc
         uVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050744; x=1749655544;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mjo0DOx9z6CkyXriQUpR9DCtiHO7VQ4yQ7cb2Q1zps=;
        b=evmVKq2TRPvjM5HUd+1EsqCPwtiyEzCrpK/ChfbxdNLVbmU2VVkHNVqQ6Ab5ZOKjuP
         SjKcV/RgKg29FwvzXyb/Q2Tb5GtbEU5OLyMY46LZghelAU67/D/ACpYOrsxHQzPWSNE9
         zk7XGQyFCHLMD+fStl5rOxLHFS9u+dIOws4pGN4uA/HJCU6T6AUea0onAyR+WUG23Pzn
         VF/CqDsnUjRCqO/1q9Xn0LTdqTTFBDM7CzCf6F+mgfSpNHNFpLvR6m58ocUXShvSTK9J
         ziECBDK+cHJbnQUg4W7FM+JCSMeWOFtBLVWt0BbfYcighLjd9MX/Px6lKYcSJ96JsGh8
         T1qA==
X-Forwarded-Encrypted: i=1; AJvYcCU+ov4LvVDDMrVYpzuaoihLfVfcIU9GjXzFqlnjQhcnmiYuq6636DyZl5L1Vd3K2FoEw2h3YVS0/Ad9tQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAzQOvRM7Jh2ymRa+YdFlH1EpWMcTZOBZmrC/wHmD5wDNc5xK
	B/iC/IJsxguWEpEN8y+l6ptOR6wPvYcc86fU/EZiCKUIkvykjhriH/KJb+4E/FnbIpQ=
X-Gm-Gg: ASbGncuJIGvNX9/bOLQkto3qQBYFs8fCFM0l+3INl/CQT29xBKv5YLH9CyQhUSo4PvS
	vMBTz9VhpIjH8Fa9GYjm3/8Eb7ME0/oPlUNlL74vSYr1Hl2UJTyQyOZufzLAsfvndgiOdXcuLwJ
	eWHlk6ZrKI34nQrrC0u3XjJRFM2lrnNcFeNGjAycbcilLBER/nlilJBjAh+f8rsVtWSfDTjPrfc
	aefa4JxfI9KPkQ5jOpOtSa9IbIsYw9EfWAJPf/B6wew1TJiAOVAZ/BX+5kPGweeaiLMARZcCGnc
	YBv8N+orJjURmvN/0aIzq9uU+yO7bxrpxvOCxfYlRIYwstzBUMd8anAUBumid3YEjCPKHq2vgtF
	2mS5zz9ulgpvgQB2aEUtoiZ+4eFG8IGJvz7M=
X-Google-Smtp-Source: AGHT+IEsfd6MId7vxmTr6lUOonqiY+rpdnb7nQfDQA/Fz1+gfc7G0MeiG2xYshTRerLuSnxWlq43jg==
X-Received: by 2002:a05:6402:35d0:b0:601:fcc7:4520 with SMTP id 4fb4d7f45d1cf-606e944f274mr3150956a12.4.1749050744290;
        Wed, 04 Jun 2025 08:25:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/17] Samsung S2MPG10 regulator and S2MPG11 PMIC drivers
Date: Wed, 04 Jun 2025 16:25:39 +0100
Message-Id: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHNlQGgC/x3MSQqAMAxA0atI1hbaOnsVcVE11oATiYog3t3i8
 i3+f0CQCQXq6AHGi4S2NcDEEfSTWz0qGoLBapvpXCdK7LJ7cytGf87u2FhU4VLTl0lVuW6EEO6
 MI93/tGnf9wMRl45WZAAAAA==
X-Change-ID: 20250603-s2mpg1x-regulators-7a41c8399abf
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This series extends the existing S2MPG10 PMIC driver to add support for
the regulators, and adds new S2MPG11 core and regulator drivers.

This series must be applied in-order, due to the regulator drivers
depending on headers & definitions added by the bindings and core
drivers. I would expect them all to go via the MFD tree.

The patches are kept together in one series, due to S2MPG11 and its
regulators being very similar to S2MPG10.

The Samsung S2MPG11 PMIC is a Power Management IC for mobile
applications with buck converters, various LDOs, and power meters. It
typically complements an S2MPG10 PMIC in a main/sub configuration as
the sub-PMIC and both are used on the Google Pixel 6 and 6 Pro
(oriole / raven).

A DT update for Oriole / Raven to enable these is required which I will
send out separately once bindings have been OK'd.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (17):
      dt-bindings: firmware: google,gs101-acpm-ipc: convert regulators to lowercase
      regulator: dt-bindings: add s2mpg10-pmic regulators
      regulator: dt-bindings: add s2mpg11-pmic regulators
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10-pmic regulators
      dt-bindings: mfd: samsung,s2mps11: add s2mpg11-pmic
      dt-bindings: firmware: google,gs101-acpm-ipc: update PMIC examples
      mfd: sec-common: Instantiate s2mpg10 bucks and ldos separately
      mfd: sec: Add support for S2MPG11 PMIC via ACPM
      regulator: s2mps11: drop two needless variable initialisations
      regulator: s2mps11: use dev_err_probe() where appropriate
      regulator: s2mps11: update node parsing (allow -supply properties)
      regulator: s2mps11: refactor handling of external rail control
      regulator: s2mps11: add S2MPG10 regulator
      regulator: s2mps11: refactor S2MPG10  ::set_voltage_time() for S2MPG11 reuse
      regulator: s2mps11: refactor S2MPG10 regulator macros for S2MPG11 reuse
      regulator: s2mps11: add S2MPG11 regulator
      regulator: s2mps11: more descriptive gpio consumer name

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   44 +-
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |   87 +-
 .../regulator/samsung,s2mpg10-regulator.yaml       |  147 +++
 .../regulator/samsung,s2mpg11-regulator.yaml       |  150 +++
 MAINTAINERS                                        |    1 +
 drivers/mfd/sec-acpm.c                             |  213 +++-
 drivers/mfd/sec-common.c                           |   22 +-
 drivers/mfd/sec-irq.c                              |   67 +-
 drivers/regulator/s2mps11.c                        | 1144 ++++++++++++++++++--
 .../regulator/samsung,s2mpg10-regulator.h          |   66 ++
 include/linux/mfd/samsung/core.h                   |    1 +
 include/linux/mfd/samsung/irq.h                    |   99 ++
 include/linux/mfd/samsung/s2mpg10.h                |    8 +
 include/linux/mfd/samsung/s2mpg11.h                |  420 +++++++
 14 files changed, 2339 insertions(+), 130 deletions(-)
---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250603-s2mpg1x-regulators-7a41c8399abf

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

