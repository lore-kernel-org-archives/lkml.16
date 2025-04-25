Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5E07E9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610521; cv=none; b=OMEPiJI9Yd9nwBZW20j2K/qyxUX3EgNgWbrHZ6rRqKHEzUgzp86aKvxNEoXQLXJ6bt3kdtHTpZ+d3c7qTJrLwncg1n7tS5PNJC4FYJUXC1wnMopqvtyEqyOCsu3+7f+tLgtWNGthpnL1xza8AQwWhFryXABieviC5lLKhZ9O8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610521; c=relaxed/simple;
	bh=oQRBqh4XgiwJuZPQCthdVtPPxyK1X4suJcz9pRIGrPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ASjZiPTGrWQTORtn3dSqFC3PzITwvAnPVNvso93KT9ijcQyjEPgne9oST1H+VzySI6VPmup43+jgNDCz0Yt6OO2KZgUvKOePShuAZIvQETBRbPt3XFHGizWUQFX54WchyD+1Gj/dHtQJTMjg3qTe+n+bSrY19FnHsPX09SMAe/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nxIf2eUp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nxIf2eUp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso3794075e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745610518; x=1746215318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGvNSF5iLep88s+rKNWsz2f582ttwkEVFBO/bttrKpA=;
        b=nxIf2eUpyWsyKns4QtbHNU4Pahp0Dt7ryvoY6eIHOjNZYjoL/qnY+k8wneqLNfKXvr
         QXWuDskdFXhqVKy5asxK30ce5Y8g5dcCCMzZEzSXKXEyKAwRpe9k9cN7Io0mFGvAowSt
         tRpgWLN7TgsR+rycPpIJiYtgEe5ct2f+ih7C2a6LCJy8ntVX2UOSkkpsUGOF1VNih05C
         I++y6B4I/ceUxcDJ4IUm1WMzKwHlml/JVvjkmVpUaJ6kmbRZRPhbi9LOc1iBblVi+O2L
         Pr9QOBk0phIbttZwNDHqnpAtXyVIXjGNsauJ/WGtv862/vPA2KywE6gEJ5DU9chJZrYR
         op3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610518; x=1746215318;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGvNSF5iLep88s+rKNWsz2f582ttwkEVFBO/bttrKpA=;
        b=GQHFhlkYV05loZWKWp1tGKRFLGL6uxwgmYkrz6MMFv3WY++YMc8sHnAx1pZTBBCiUg
         Ze2pUYlyfahK1Cjh2D4UKlW2J3bFxaHX2nb9/7UPD4BXkCVnoNChRXmDs2LRuN+qPUDC
         SaVJecanpPSwBDktyEV00e/qkbfOEAFXG53c+7s9bsMLphQo2y4abEcK2wZ391SMGplN
         gLqEiH5UWw6F0UiCM9Xn67LAitAmxVCr1lOod6deZ/0KkAq5f7EG1pJHYmxk839RfJsy
         2Mu78BPDPgzYBw4sekpyWEkfmc3q0Tujnl4iNrOOsE/aEMB+KQ1K6UmrDgR9OBaC8IsT
         fRLg==
X-Forwarded-Encrypted: i=1; AJvYcCXQwKIeiGbcdk+dQss7fHry9AI0P0H/2wd/hy+pw1kzCANPnZ+tWdCRDk4N4+3kRzbKa0CfJZKDzWRVQZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyoiwMF9cP0RLP7eIbaAAt3DEptY8XvIAZwVEm6ayA0i/Q5wPB
	4GksAlQyC+JecnA1dZe5CsjnNA20eXeLr6XzojZbh+wamXH9f1vdhn3myntS5oo=
X-Gm-Gg: ASbGncvj1q0szs0uSc5E0RGM4Btbmh3M2NjF4ITJF0JQaPXAQffDqLFYYMSjfT75jTT
	aWEdyV5DswQYsr94HFTuAinlRiM8pZftbt6tRhKIQTjXo8iDcZZkCr0hNtZmQL9L0KvlJ73P+ou
	oimb4JsNg2DvNpJVIuDli/AYSWmCpos88lI3uXX5yGl+1/CHl+ZyyHDb16C6yDWCtKqkVh52n3A
	m0nlZl6eQKkAaVMAUeulIlIJoASyg/KSkGSreg2LEvxJkvjfsZwILcLQaLqDo8Y+jWFtWr77J6n
	TQI/ZikoAdJYs2xBaUwtgoBNbRPh/+veJ08wh5PM8/LMYxIqxIlVqmjUOB9CuFQy5IxNig==
X-Google-Smtp-Source: AGHT+IFz/FugmRlMTdXDEAYrfKpO4xB6/lRqUH7jCG9QA+VkTuUez77zGRsmsohXN6EyLkakJK2+AQ==
X-Received: by 2002:a05:600c:4685:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-440a65bb7d5mr12401055e9.1.1745610517631;
        Fri, 25 Apr 2025 12:48:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm65922335e9.16.2025.04.25.12.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:48:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC DTSI
Date: Fri, 25 Apr 2025 21:48:23 +0200
Message-Id: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfnC2gC/x3MQQqEMBAF0atIr23QaFDnKjKLYL7aoHFIh0EQ7
 25w+RZVFymiQOlTXBTxF5UjZNRlQdPqwgIWn02mMrZqjWWflGU/2W3iFMpIK2JA4qbzvbVmaAY
 PyvkvYpbzXY/f+34AlANA3GoAAAA=
X-Change-ID: 20250425-dts-imx-aliases-ethernet-37d8552939de
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5098;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oQRBqh4XgiwJuZPQCthdVtPPxyK1X4suJcz9pRIGrPE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoC+cLg5dGjGKD3lhq6H/EQ9K/8FKQj99PWWgxG
 kqm/J7//lmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAvnCwAKCRDBN2bmhouD
 17OvD/9keyWhKZR6aiTEog/YJHtK9qQVveiuOztYoqQZ1SpUl8vjD8wo/q3C6XjoKL9eUN1mUDs
 GPXi+Q19J6Ah8pObTpMMH3LGud0ZbI71H2CYqFKzRHeD5Xt5eZlSXHviNzVMsm3GELSBE35j1ZL
 r7Qfn1xxmHLWVJj7y/FEwQCqT+cmEmglYiULDLN8Ie6phTp1nNwrlhN9ZOrYlYgc6E8J8bcBozB
 ivlEiNhXu5HHHZGOu3D27HdW5oN0vlJvRc4naxcJic0Tl7V2DyaWtL9ROjgWrRVwOjFQbzOgB7D
 4kjqGFGdN4uzWzaG36f+O29L/KPHcfgBXLvhcvbTzwZ8GenenGvF793UwmRGe9hC5BeLtMrjYVT
 ps7bdB8LhfouOxXB5252/lPDciZHrQkem0Scu8FLKc4JzJly/YQHZbeJQ/gfsRA54VQSmzJ/wDR
 Lt/qsdO3Fz6OTAPbLu4iAj+9ekC6LDUzB5K+6slUSNqYlgyTWABESbA64HWOcUYsLBivetYnyxA
 XfWIb2rNPrVja+Ac6n69kqYPb44ylGIVTU7SU7cTNI+ebw5oszB208L/8wMVOIMFZVAZWYg+aut
 dsLk5WnqI1Al4mWrVhioE3rhztKfi9tnD8RJ0+1VGGtLggEu8wTazf0oMtbJjfKTuK+zToJNiL8
 oRHY/LcY6vApqxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Not tested on hardware.

Ethernet interface, like other exposed interfaces, aliases depend on
actual board configuration, e.g. its labeling, thus aliases should be
defined per each board or each SoM.

Some boards (e.g. Gateworks) follow this convention but many do not.

This is continuation of my comments from:
https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      arm64: dts: imx8qxp: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8dxl: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8mm: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8mn: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8mq: Move Ethernet aliases out of SoC DTSI
      arm64: dts: imx8qm: Add Ethernet aliases

 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi           | 2 ++
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi     | 1 +
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi     | 1 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts                 | 1 +
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi                    | 2 --
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi          | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts   | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi               | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts      | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                 | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts  | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts     | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts           | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts                  | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi         | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi             | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi       | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi        | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi                     | 1 -
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi          | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi   | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi                 | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts        | 1 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi                     | 1 -
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                  | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts   | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts          | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts             | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts              | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi              | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-thor96.dts               | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi           | 1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi                     | 1 -
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts                  | 5 +++++
 arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts               | 1 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts                 | 4 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi                    | 2 --
 arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi        | 6 ++++++
 arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi      | 1 +
 arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi         | 1 +
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                     | 4 ++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi                     | 2 ++
 56 files changed, 143 insertions(+), 7 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-dts-imx-aliases-ethernet-37d8552939de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

