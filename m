Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB42E610F;
	Wed, 11 Jun 2025 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641450; cv=none; b=ilUB/CasSgzijQn8CLm4M8jLSIHqy0i0ToVu8ANtNqIYYJ2dp7ckMZLT04qNUv5rNfiknDCbO/Z0qFeOqCdRXdSncPiiZRr0hAqILnsvatNAl5Lt9Zvu40EsQhgILWlmwmZhsxs6aSLeDIZpwi3+Q3HHzg043zNQyVY0FZNoCOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641450; c=relaxed/simple;
	bh=vC4yTA9SmrAgEgHHZQ6kzFeLQEt6WJRdftXvctmtg6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L+pEIUeT+ICAOnWhWooenbpCjUfKUXjo/RXhEEIfxn48zNrgwHTj2lEQmri5v4CtoAt2tv07PxloNiN3z1mPGE1hzb8MA1kVcejLDs0Pxv+MhhqLVm6vXFW/N/183Cvc7eGXpYr6QTmsNXofV3RBpttmiw3tWYC57qeShePRSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLMwO0bP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLMwO0bP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb4e36904bso1294570566b.1;
        Wed, 11 Jun 2025 04:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641445; x=1750246245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uufpzLeFHw9pdIZ6dvCNHoZRW9ZSAUt0Lz7+TMw96CI=;
        b=HLMwO0bPhLV2moNVEfzhA4qwF/1yiksqgWFhbE02mSCItpEi3WJxtFb72NHbbS9uQI
         OsKqn2d6owL83mXGkGB2qAo3bAAW6Z8/DYqMtBYzdm1pmhKKQ6n88NVOeSdt7tn1Ejm4
         xjEfk1Axf1xhxhAHd/9vMl6q9VXZFlv1n6LiMgRCGAAcc3CeH6TimhxIjVhkOOxrTABk
         4hbsZ+e/wEEmtdp5WhpRsvYcB4rGd5KgvP5qBhZ35LHFmN8KA+wG6QxkMeezVwMSbss7
         KFVVnU9te3suiPbaTkZqGurWnfmnIZh/MCYJ7G64IigyevxTrM3GsJfGdoD73/Bcg/zg
         A8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641445; x=1750246245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uufpzLeFHw9pdIZ6dvCNHoZRW9ZSAUt0Lz7+TMw96CI=;
        b=GRbWPo/mh6NPctzjeHTXEGD8nNSBWeyyK9U8GYvHv4eiqhgd+OO3kjS3wQZ+5ySb1f
         6ZGExCdAc+0qX+UJveD8cEbBdGDxzsQlWDsqE7Njx8nCfMgFVaEKyA6Gt95jN7tvEYhs
         i+wTyOjd0sgqewmZsGsoMSTmMWByqdJQ6js5UHYNw/NK3O+66gFhaL3kA0/Pus8uzEcd
         WwXzOEb3i4BjX7vuQx0K/z8YppyVvPeg+cCiVAwypeqvcYM7+NCb7X4rDOCbQxtQwgY0
         5zA/lfk33PYERUsKY7Kk0QiyV/Fn5ys79uaS/MyKzvZvtDyeWEsVBeMNvMudp4aQFcIP
         wXzA==
X-Forwarded-Encrypted: i=1; AJvYcCXSnI3UPL5NQSi1ghkMBLWC20SX/8sI1qaHkGx7NpZew5juf5k0Mss6gJDPPak9NDhLnEBUlDgZiX1cFalc@vger.kernel.org, AJvYcCXrBXCBc1vvOB9B4ivJc8JQGBzXNkuKkZfcnmuPJY1W3xgrQ6/k0CwG9/J42kb1S2LotHH66Q9EXt8f@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJ6bfPpDfRmW3/qIBDJVEox7Dh9OACBQkFRKvAloZF7wdz/Gl
	jDhtVwwfcNAtWjWTiHkfVIsFdIBuEByiztl8tDIqdRoYPBAhKRMzmNGSRprnVA==
X-Gm-Gg: ASbGncseiOG7ZPepQrCK4+ZJHaNZU0gF4AuI7hg6GXoEBmOxavyst6YmUELxSxdxkR6
	DSFyH9gX1KlWxby2x0zEDtzqdSIUo3KWdJFh+oj1VowGBH3mbJexduLkqdGy+huDQ9Q4RDBIahX
	IJpCZmRLcuUrlWsct45/r/ZDTPfEVC3RlI4od123gdl3atfeTbphgNoeWdGbkgf+7K6DmmWtHG1
	VhZy2ueS07UxrJPDjtdRq+XmzXCp6EcmCRAk1s0DmTpuyvUl/aUoiln40NmhNSIax8uvPJvG88e
	jzbyH2DmCuM3C65DK9UvU2lXGC+QvCqAepCeHXa8H52SKYj01dOFuDCIH2DEFPT1A7Wvnn5S6oz
	ZbxkLS0AKwYQw
X-Google-Smtp-Source: AGHT+IESqJAZRKIEu2aYv41GW69ANi7wzoD0rggPz/LwgJu6KXn77JmwkH9T5pd1qm+bZwplP31o0w==
X-Received: by 2002:a17:906:12d0:b0:ade:9b47:9242 with SMTP id a640c23a62f3a-ade9b47960amr28948666b.0.1749641444965;
        Wed, 11 Jun 2025 04:30:44 -0700 (PDT)
Received: from wslxew242.. (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55d6csm870519066b.72.2025.06.11.04.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:30:44 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Wed, 11 Jun 2025 13:30:35 +0200
Message-ID: <20250611113039.304742-1-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds support for the Ultratronik i.MX8MP-based Ultra-MACH SBC.

The Ultra-MACH SBC is an industrial-grade single-board computer based on the NXP i.MX8M Plus SoC. This initial support includes:

- Updating the MAINTAINERS file to include the new board in the Ultratronik support section.
- Adding a compatible string entry for the board to `fsl.yaml` in device tree bindings.
- Introducing a new device tree source file `imx8mp-ultra-mach-sbc.dts` with basic hardware support.

This series is modeled after the support added for the STM32MP157C-based Ultra-FLY SBC and aims to follow the conventions used for other i.MX8MP boards in mainline..

Changes in v2:
  - Use `enum` with `const:` values in fsl.yaml to correctly represent multiple compatibles.
  - Updated SPI child node name to use the generic `nfc-transceiver` per DT naming conventions.
  - Renamed several peripheral nodes (`crypto@35`, `pmic@25`, etc.) to standard names.
  - Minor formatting cleanup and compliance fixes per review feedback.

Tested on hardware with:
  - Serial console
  - HDMI output via LCDIF pipeline
  - eMMC and SD boot
  - USB gadget and host modes
  - Ethernet and basic SPI/I2C devices

Feedback is welcome.

Goran Rađenović (3):
  MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
  dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
  arm64: dts: imx8mp: Add initial support for Ultratronik
    imx8mp-ultra-mach-sbc board

 Documentation/devicetree/bindings/arm/fsl.yaml |   6 +
 MAINTAINERS                                    |   1 +
 arch/arm64/boot/dts/freescale/Makefile         |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts | 909 ++++++++++++++++++
 4 files changed, 917 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts

base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
-- 
2.43.0
