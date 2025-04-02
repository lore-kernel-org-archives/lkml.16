Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941C230BE3;
	Wed,  2 Apr 2025 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574363; cv=none; b=sepo/5Lxd6N5rBcLc37fk0VTFaLYPE3wq7TZipUZyEYpSaLyvBaq6poWGi7baD2sAaXWdwUJn/0pwdWD1VG4wLHoQTJPHoO7tH9MMRMBhDgQa5l0w+pnHc/jy4/cyWyJ1AovZO2Nq0AMobdwMJk623MCAQGvsKuz4KyJf2t3Jus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574363; c=relaxed/simple;
	bh=9eeOR4+3JgcxriKPV7Ry8TZTkJpSspY/e5izNWMiFoY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GnznsY13QTXVqR1B3Bz5gtvcZuYYscrTyEJiIkDCbWICtNhP6p1Bys0UCzb+Z4FrfPEgQks6MGmEBU7sYQceNpD81NFmu6KSg6KJ1nE3N5so00jG7QULrgQjlNBNWQK9S93o0Y2BkSGzpVvfriy/awaJBv+n7Fms4qoGgyVt5GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPRCbY/8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPRCbY/8"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so65538201fa.0;
        Tue, 01 Apr 2025 23:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743574360; x=1744179160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shhHsX4Flyz0JwxNbhQY7INdDDpms3xK5mGyADEjcy4=;
        b=dPRCbY/8P/7rDq64itR/5dPLTd7bH9rNDHWrBBiO96Xcn5iwBlVnes348oBjGJCCCL
         pdmZwprvyzFHPCSBeXNepTVXKXK5LdGAQK01YtlZ9L3eEhwiaWZTMAkqHj4ZFmt2z2D9
         065o6dbZot7k7FXDXaOorlr8iNp/XhZR2I4Mu23FwBS8muWO2B7MFWXZuoP3yqbjGsXv
         YuOeKXMJWTvNsErMdXHtTngohFc3LyGRBcyfPnpZdrJrdxsogasJRZYAzqPVpnMJCR/1
         +L8orc/j3PHE3mpXxjDvX38nUVmxDtt3yJ7TyHGxp2K0AFuvws4awGFlu8/kxzum22HK
         TI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743574360; x=1744179160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shhHsX4Flyz0JwxNbhQY7INdDDpms3xK5mGyADEjcy4=;
        b=SuSIe4nE7gUW7ggkQ0182pJmnlwVp3ybZN4yOVA9GW5yNOmIzP95HzuDF2NJUEWEin
         SMEkcgMh0l+ESz5AlvJKv3ejGsRf+q0nieEbfQDaw10NZ+WhA29CuqMryEL876uY/8gL
         Wp1DpGCRuW6vGdHcNfVbVueUc1K9zx46nxpj7XhNVBjZfgWdFkmIU7rPsPBz0SJUxvN9
         7g2wMukQjeBmiN/cjnoa4uSp1Bp0vJK14Im5RKJkJQr8t5wedCqx/Mpoxl8km6ObYgcE
         YIgjJaGUuxzVheIf80XYmir7ivfykX+03JiJdLtRABKQzeIeJicpfA9hXVftDfYwp1n9
         pGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkQ78w/r4Rl6hqhSM5ee7vAezTP3xS8qhhunihrbWOnoTIem2GocZsC0iaNlNg/De1ZTo/pkXtJ0Bu@vger.kernel.org, AJvYcCWu+JKPWkTmAWy5UGETT2JI1UVQseeVnthM4WizfZjx16jtE2AMgO7LQ+Q0LxPNz1LwVqi04W/bDU12VYhx@vger.kernel.org
X-Gm-Message-State: AOJu0YzuU2uGBOw2Wtwv39m+KAU11cYldxH85WgHb/zM1a7dP1BvzD+w
	jJqIC5yJrYg3DXrKzfZClegluP3xSWUJE5iRAr7PL/ny3HmoPBoYeluG2ZyCIDE=
X-Gm-Gg: ASbGncvasLN5whyUydknaiN2xCArgfOVkhUzsa56a61K+fvIfmcAwTIqbnYb+OfUmut
	mHLZ18C4duI8rpIvYRqZdB7R3kxnWmbzRC35h6tl9gIVAQSXgHS2lJw5qmTKzXbv7wVQAaZqws1
	jkRpoQHFNaPvqmr3g8h5HA7Bk0UXUKd0ym4+6FgqYZkSZ0r8Jq2mKYSMyBHvNA9I+9IzS/LzKdm
	qmYjUSpgZMrYy3oj966iUqdhcIxTOlvR5LM7IDf1p1MdWMTUbnbs6Pn4eB4hN61WSxjba+I74pT
	dER/H0cZA40eujFZcx5EhO8fHo48ayNBjdGwEEIwUzIJ5tTq2x9ZRN2OuKylFwjynKtcoKhHVmd
	SYx1p1h4RJr5c
X-Google-Smtp-Source: AGHT+IG08Enxq6EzqVSRMSso30yyhraUTKz3CUY8nXLcIXgmvLVqtcNk8VTRMQm2KJN2Y2PLoAvmPw==
X-Received: by 2002:a2e:87d8:0:b0:30d:e104:9ad1 with SMTP id 38308e7fff4ca-30de1049debmr37766981fa.38.1743574359607;
        Tue, 01 Apr 2025 23:12:39 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa9118sm19336801fa.14.2025.04.01.23.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:12:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/3] Add support for Sitronix ST7571 LCD controller
Date: Wed, 02 Apr 2025 08:12:09 +0200
Message-Id: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnV7GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwND3eISc1NzQ11LYwujJMvktGQD4zQloOKCotS0zAqwQdGxtbUABH9
 MUlgAAAA=
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=9eeOR4+3JgcxriKPV7Ry8TZTkJpSspY/e5izNWMiFoY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7NVCAPpygHz2LMVamGSNTxQMrwwwjg7GS0SGI
 3gNeOvWPr6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+zVQgAKCRCIgE5vWV1S
 MqbyD/9yIWLNwspaYsuemQzDd5lGI/ist2Q+gD5h0oPeVW2fp26Em/G2gABUhdzRdw0XrcrBkHD
 uA+I0Ya4XdX80lrknS+8puTLOqouQPw7AoCMZLHGLpjNF4ng0WlEOyoZhijeSayMtAA6XrrtCrM
 mmMxaizrR3fAby6bnki5dhgLTkW5j+AnsNb4Z3wQgQS9IgEVv157a8A3uBMleLLG2RwGcAeN2um
 cpWnlih68CNHZG+P08BCxhWUWpRM8QJDTCAwJHHoIxLI5siSPAfMMzyvZYHT5QLqx6Z5L26x9Wv
 kb6S6Ka+DrU8kNS+jeWXgCzomRtWamro/hQUTM5AnSXjz8AijFk67SOEe4oPJzIHtoq0Lf9H7l0
 ZrgQdAHrxMbhSsBch0kgZYbSYsnuiNPtT4KQsUksV0nwuDgrqnQpcRdhhU4fbXy0+BLuMuwG4/T
 vz3Jg+SoVnsqaPqPqyfQsz6YFdBm0LAq9AihL/GLeGk5tgCXUUZZk9VTxMcTLiCkx5lDlOt/iBi
 ndANUXHV4bCMHuQfdrqcUySQ2OWZm8gKRrltHKXCwr8/3moxVGY30ECKedAZ1MyZbSaid0hXiYS
 1hSVXQFq6aYYZGb5LIBfPQLWUbPPEUFkfJQ7NOeAS64kLtXCQqbRHihp8xHGTeNRpAPEbL+/0+f
 WopOzGeqBNn8SoQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (3):
      dt-bindings: st7571-i2c: Add Sitronix ST7571 panel bindings
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add antry for Sitronix ST7571 LCD controller

 .../bindings/display/sitronix,st7571-i2c.yaml      |  71 +++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  12 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 563 +++++++++++++++++++++
 5 files changed, 654 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

