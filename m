Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5523507E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406803; cv=none; b=eGNiO9rHnM34Bnv7/JbZdiVzupfx6mIHrO2pg7VlF/kv2BnwULyiAC2sSytxF4S0cUOTA+TVFqf/wzQzi5dUzVvm4aOgm8GHIf9DAVEv1DznHJe879Dut5JZwT3eND+ogyvpdwkM9NbDdZLu2sCviRG3Q95Z1HOvF2N9csLSSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406803; c=relaxed/simple;
	bh=bPOWhIvLpETLw9/fZPa9WPnf/zgDPVp1QOoej1cOWdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIHCv503CiU/M44DdlrHo/7ONjnDCcSVJpa9AlKIIpVsTco2tClZKwCD563TbXSvXFEJRoGbDUUhXZMp7CV+eWMW2GRxbKlwVhKfjvNiEUKQamYf9fgCTkWiAR9H/hKlFpF3N/UpRj+a2lZbR2sXhNz4kYvy29PALdxYG79+kes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Uifo7LYg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Uifo7LYg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45362b7adc9so5608615e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406799; x=1751011599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaH9Kr0KBdWEdHexAhzixmWuUEOjZiRLNEaItTOC7wo=;
        b=Uifo7LYg7U4uUXzlfVqZN2OqT57KqPIRsgyW5rdH55ljBjrBtWhd5SgJV5bFAMp/Ui
         qoId43A+2Gb1eWhOzh0kjlkFqhYDK33sevCf0jfvmZ9P8IgwOgfThJHoyXPsQDc98j/4
         89aj+m74ZG0LuL311pgCYc4OHhOytuFCKWAoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406799; x=1751011599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaH9Kr0KBdWEdHexAhzixmWuUEOjZiRLNEaItTOC7wo=;
        b=tw/+ApNcD8aRaZABOTgJlRz0LK6I4d3v+apfJAZOmyRZXY8DiW3rUF6o9oZBHwhKwj
         IAKu/CPDS9AADuwCrFgtC9fWdZiRNsG70NIwQowuzno5VNJptXSl9n4+d4JShq8UkIlR
         ZGLbO/pKfRolloje+tVUxkC1A3XYSb36mtCebTXM5V3Yh7/ccaPO4+0krKYtJl+eoVha
         ffFizc/T1W3zdQzDx2OizfXfEeMty8DZVz48SR8czpQZSRoZnCkeogiaAIaawuHPaAXF
         0qzxLlKEC8fyHhDT0O9v6hq9YJYMo7Gt7QWxQ5dFzUj2TaHlpA7m19Tw3F2CxCFr1NHl
         OUJQ==
X-Gm-Message-State: AOJu0YyHQXVG3CHNugq0HtQBEjykuiUW2PwsR2feH3WdPJ/4xlPqSysq
	nEbxMGrIdJGysLHXC1jd7OKuag91HX8p8PkJSnWleIMj3+5fBBBUqUSujQYM8myi/C6HxlrcsRc
	yCbSg
X-Gm-Gg: ASbGncvxp7ERNhasNWDLJuRx8f3aAYOuDq74QPK2iGmYoLU5B54rUmkV6k5PxhGWlc0
	FVLMbAtxu4esNlIJP4/jimsjj4UC1MqyvJ6LeVhcE4xDczbOMTnEnwCoI379QMZREp7ekfPJHfg
	lTCyTlQvxWmryTqIkCRSUVFQTlyfAmj2YzXueWfOZP+V6thPoEzqbYxchoZESPsI9m+P7UuElqC
	7ddxQLZ1kS1uzFchEFwQDX4hbgWpL1kcM/nNnUIvLxvUMG1MnINeuTVlhJbTLWfouqTLi3KhFlq
	d12p0qBprbAyi8QN4RoezDAzQYcQSF6KCrJmMoNb3kSnzg4mcYbD/xnqBI6x/z9av75VmfajB9I
	dbdjiF2pBZ8i3RcsmRlb1GQloE2Yynwql8zr1cUFmIpMGJAtDnFiR
X-Google-Smtp-Source: AGHT+IH7fwkHJC3cXXyAdVYkYDzLjEdQXHbS11KLEXj8zNWxo6QfxaTajDmFHgq5T93JnBlRG9Likg==
X-Received: by 2002:a05:600c:c105:b0:453:60c8:f0e6 with SMTP id 5b1f17b1804b1-45365e42d77mr9268105e9.2.1750406799284;
        Fri, 20 Jun 2025 01:06:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/5] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Fri, 20 Jun 2025 10:06:21 +0200
Message-ID: <20250620080626.3580397-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the options required by the imx28-amarula-rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Drop [PATCH v5 1/6] "dt-bindings: mfd: convert mxs-lradc bindings
  to json-schema" because applied by Lee Jones.

Changes in v5:
- In mxs-lradc.txt:
  - Fix deacription formating
- In imx28-amarula-rmm.dts:
  - Drop #address-cells from gpmi node

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

 arch/arm/configs/mxs_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 91723fdd3c04..3b08c63b6de4 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -64,8 +64,11 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_TOUCHSCREEN_MXS_LRADC=y
 CONFIG_TOUCHSCREEN_TSC2007=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_PWM_BEEPER=y
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_AMBA_PL011=y
-- 
2.43.0

