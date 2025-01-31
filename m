Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D881C174E;
	Fri, 31 Jan 2025 18:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347238; cv=none; b=OQtsQPxSwJJ19GVcIhCl9Nnnar2lthOXvfrWgN2Jxe9/cDwoK7r3SlgeIUH5ADoqql8CSrEbwj1oFKES15YpkIfU+nghQglBCpc4ekccr8fZYU/zfcyiYVDUbEP/hbPSJnKbRZDaLcoGBC2KOoUjT+SqEY3IV+2ilVSindfaxvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347238; c=relaxed/simple;
	bh=TZW2cM+0eXm4cJxjHahhQNsg/hpuj/YgRHBS74BfIpY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c6euCNCy6qKGr/J72IuN9Rbmuwjk7MbVw1veP3gcsU9UIXYif/xJ1Lb/k1kbszdPgdr2+/K1CNgEGijD86PG03K8l2pIcTN8S0RshM4gK/p3+214G8531ucf4Wg1pTiHmXotLrvukQJQtJ7f3iiNBT5TzgLc6OxU3IWxl7UknmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1hP2KL6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1hP2KL6"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so3794343a12.0;
        Fri, 31 Jan 2025 10:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347234; x=1738952034; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDioANdvXwNuTfGfbnchsEWp0ZwSPM1Eio8Fai3fOQc=;
        b=l1hP2KL6kNxVTZJQnBBCh5EkBYva/xvlEaPZ1mmLgY65u8c8AUXcpRbDzFnqLTO18l
         WbiBQxdHGt9FPHZnIem+6Ye8iguQ1NPkWA2pS2rQtRnWLuarwCG1Mb4vCdjW45ICCP/1
         vvUaVjADURqj65mUjBa6qfxgjZLnoQ2IgDOxurMLjAxhisMGn2wkeXM7SJ4+CFbkEXF4
         jFa6/njCbpwWDDy+KHq3LOi7xWgcFde6ok2viABgSJuvAlO85NNpuESpL0h9H1si02LJ
         U/oNqI54PpK4rANPYB5v1dDlUdqqUOu4sxuJiuDr1adJ00vw/98ykJONbWBYEneXwGf0
         gmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347234; x=1738952034;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDioANdvXwNuTfGfbnchsEWp0ZwSPM1Eio8Fai3fOQc=;
        b=QUcqnNlmszoDMxkpM6+BrtFNTP9wQx8UvRyiHhTalf4ONc8fJ6yQiO0Lc2285kNWPE
         T473hVPHdK9vGpLteSTbQKQC5TXMPyg611xIcGstZGz8HI0WIBfmZUVIInyr4cPOufbW
         w/fGjslviJdC1bA/+fmeAbiDh0LVbilJFDVI2Glo2Xx7AsAiiVWMY6eHUE7glU56MSK9
         1m0vNtKUo8LXsdVOPy1CszdrAY2ISzBZqXnKuOx/f8BzWZJXyUn90z9IrGgUKeI/KQ7u
         zon/fbPoiIFD7hOsRJb04LtYxSQ3Rsl2c+cnUSNhDDZVfMq8bPREy/bQWIOXdRGNrBp5
         zPRA==
X-Forwarded-Encrypted: i=1; AJvYcCVlu7Dauq8M6bVZVR0PkkyJupPB7rs6VE3GIiaVsCuj6uDVgPE46S+xvPMBKEzZ0VuNh32GhK3WOckD@vger.kernel.org, AJvYcCVwFVmajpza/59xthI3wxabQ8+5D7WiyBBUSgW4RdUJrpRGwMhqdcnAgZfC6xCbOhFu6loSe1SxsZoURjkv@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNm274SzGzSNtdDFDQOFc4Urj9iMV37f4CsTnkwM1lAWu8p7N
	sk4IaOGebgORrvdyOL0QL0DFQ7SOJwO/Ft/o4Az8WfU8Wo0OR7WWOyMdTA==
X-Gm-Gg: ASbGncsAotmwpl2K1Lf0/TNZ8cjWzYmN01Bhy+CQnn6tAlRrVJIrNrKYOa9LtA0KP2R
	q+RbJe3OsEbSnAklm/7U/XzXC+9yA0JuxZxe/+nx+UJoWTXa1kwx1ImWQegSo9LPSCk6LXPlBYM
	0IwvY4Bb9+MjAKAfb2aHHAOc14DfYYkEBMZBp6Ma8VcYocqC54s93rIxMayXHvWSSXVMxxFrp1n
	oKZ7bYKkIm9RfSooEWzdbn+4e35S6vnhCDxPBLUy6a7r5hGOgcTDcLe9s2UQKjUkwC1mTftOLlq
	aEPLeQBqRrtpTeKYR12tcDb3qK4cX3FyCEhxIS83g5weocae6/yn1ujxWjpaiw==
X-Google-Smtp-Source: AGHT+IEQmEocMbJNJ0PdRJ15kLtw8dvQ5rNV2cOSKYrkS79S6czxp1b7N9XtcxDPTx1C2ptq7qG3jQ==
X-Received: by 2002:a05:6402:34c5:b0:5dc:89e0:8eb3 with SMTP id 4fb4d7f45d1cf-5dc89e0919emr1967310a12.11.1738347233986;
        Fri, 31 Jan 2025 10:13:53 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:53 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v3 0/7] mfd: bcm590xx: Add support for BCM59054
Date: Fri, 31 Jan 2025 19:13:48 +0100
Message-Id: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANwSnWcC/3WMyw6CMBBFf8V0bc1MH1hc+R/GxVAHaCJgWtNoC
 P9uYaMbl+fmnjOLxDFwEqfdLCLnkMI0FtD7nfA9jR3LcCssFCgDDivZ+MHWYI0k56CqLRtkJ8r
 9EbkNry11uRbuQ3pO8b2VM67rGtEIGr6RjBKktnhsawceWZ+7gcL94KdBrJGs/omqiLYlA4hEt
 qFfcVmWDxRrf+/ZAAAA
X-Change-ID: 20240816-bcm59054-a880695e41e8
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=2641;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=TZW2cM+0eXm4cJxjHahhQNsg/hpuj/YgRHBS74BfIpY=;
 b=A6Dbj+uAl53ukznQEtczQco43P/7cmTdK83+oAxA2Dl66TarI//ANev9LtzSEhPVkwzuUftBQ
 hbAr3C4jA0aC/iS2wisQkDi2uLI5YpW4xWNoqzWZk/suZhxiSlZCHP+
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add support for the BCM59054 MFD to the bcm590xx driver and fix a
couple of small bugs in it that also affected the already supported
BCM59056.

While we're at it - convert the devicetree bindings to YAML format
and drop the bcm59056 DTS in favor of describing the PMU in users'
DTS files, as is done for most other MFDs.

The BCM59054 is fairly similar to the BCM59056, with the primary
difference being the different number and layout of regulators.
It is primarily used in devices using the BCM21664 and BCM23550
chipsets.

This patchset has been tested on a Samsung Galaxy Grand Neo
(baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
Testing on a BCM59056 would be appreciated.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split out regulator DT bindings into separate YAML
- Use tables of regulator info instead of get_XXX_register, reg_is_XXX
  functions
- Drop "regulator: bcm590xx: Add proper handling for PMMODE registers";
  it adds unnecessary noise to the series and will be submitted separately
- Link to v2: https://lore.kernel.org/r/20231030-bcm59054-v2-0-5fa4011aa5ba@gmail.com

Changes in v2:
- Fixed BCM59054 ID being passed to BCM59056 function in the
  regulator driver
- Dropped linux-rpi-kernel from the CC list
- Link to v1: https://lore.kernel.org/r/20231030-bcm59054-v1-0-3517f980c1e3@gmail.com

---
Artur Weber (7):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      ARM: dts: Drop DTS for BCM59056 PMIC
      mfd: bcm590xx: Add compatible for BCM59054
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators

 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   55 ++
 .../bindings/regulator/brcm,bcm59056.yaml          |   58 ++
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
 drivers/mfd/bcm590xx.c                             |    6 +-
 drivers/regulator/bcm590xx-regulator.c             | 1029 +++++++++++++++-----
 include/linux/mfd/bcm590xx.h                       |    7 +
 9 files changed, 1028 insertions(+), 401 deletions(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

