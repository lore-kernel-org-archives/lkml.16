Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3635F23814A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621286; cv=none; b=Yfu15OH2I60HKi0VwpC5adrCHgfP+mlLY8wWBHyek6rcVWQIf6ve4GDmp2rXDK6we9qlko4E8d0MMZJsPK9rjLlcDr68MJy+UKZTwX7ft9AJj/qNAEkdyBoEBdX4hvp9Mffk9r1shE8F7g8VkJTX/LQpc2dBNFQZ4oLxultsEW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621286; c=relaxed/simple;
	bh=20+CDTw4vzWKnMq2YhSJ3lSPA2rG6reE6EsPNfWd2IM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1X3n6I6+PcmSMN4H++j/Yix/C0WCb/ior/9quUWdMfv6Nq2O0yhOpyZRLqLtG/dlqAd4N3VT8AWDBH3rAvDVzNDutNKGcgBU1WThD2G61MUj05sEEcj0T3TOndHULBt9GWYuraAa6HJjfvpPNd2tibdcqR/a4Lf0dhG5skABbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CPIZk51A; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CPIZk51A"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso19679985e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621283; x=1749226083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvgM2IbfWBcG4/oTfKmRrdxwIvc181owD475503ERJ8=;
        b=CPIZk51AA9T+xpSxzYfSCixNgXTWJAROmuwpBpz+gRjV0bEY/n9gUaL6QnuCH7tmEp
         chN7fdBcLlF5ZSgveiorpLcG+xPzSfTKOn+jDYHB6/JJ6nC/9IDJLeqZvEv+BMfgov/8
         7NfaBjN2Gp1jPd90gPpBYYehggph5JsNXFYpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621283; x=1749226083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvgM2IbfWBcG4/oTfKmRrdxwIvc181owD475503ERJ8=;
        b=UKpCoVObRq9pqa6rgmcZgBl6BZLZ4rfRu8ouruiQGZztqq9vPsj8FF5AfL8yhZ2naA
         QCh2I7q/l8rmuv6vb7BDtXFxaCBmfxs62Vlggty9Z41YDuis+WdfI3JRWT2e+dlCvYrd
         wx7MV5UhIgzU9CSqw7phf+BerjZ6+9iznKDC5AdDOzQfs5KmKcM7FK8quhjVvCri1nrH
         F0vL5FCunMaGaMu+WbasgQLKsXRSve7uX0TZKyA+DFVT+OOy8CeFApRdjMFBFydC+rYo
         dg5yA+srCaMdkDhmYuHTAvtQNMCaZ1qzEumGUa4Ro2nlXZgjOuJe7c33akZMvSbZByP7
         D+9A==
X-Gm-Message-State: AOJu0YyEX+yhG8u7I167jNf//NG+7p1u41gJw806yu/R7NxQwRoent0m
	+YDDdYMTWEyrQaTlWttf1o2RLj/dCYT7/8erS9RFLcExTaaCs5lfVDGBWNp1E9rXTM2y2qi4cWb
	o07kE
X-Gm-Gg: ASbGncv1X5l/rJpYvkipHMSsI4SWEYFcIYmsLEPqP2kS28g0CgzAsx2tcolNBXbhh21
	lng7Ot1BruhRrQRmL45BNj1DvMQqUgrNokhiHHFEzE4JVrMk+7nIz/SyPpTIs0hbjJ5oPaI/SuV
	UrM5ly8gDH7fQV02IZE2Pcm6KuRjugMSPbT8mnk3Y8n0lshHTCD/eZYIE1Q+Cbf8xrzu60KKrke
	LKhVyOkyhwNoHpM5Y6r64DWeKX3VzmpKnrpb6PS37qWpdjii0eUbW+vU7bDpqqK77mXbsy7sEst
	h5csK2sMGvfQtiyGHnqacXniJ9Uq8rnf4B9oQFof2/PP/DKqpnLF9GEwp8q3HJPqHsZ9F4Ixebj
	BWAS9YxaaZCtuYAkbrMZWyAdsnP5UTWENtmViDD0biY7WctIfZ9s=
X-Google-Smtp-Source: AGHT+IFYdaNMtebMqrcyfFwd8HXEmCu6MtcABHOw6woSEVwRzVUsS88bwdlnnTOG4SmcQTNczADG4g==
X-Received: by 2002:a05:600c:4f87:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-450d87fd991mr30332145e9.2.1748621283200;
        Fri, 30 May 2025 09:08:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:08:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v5 6/6] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Fri, 30 May 2025 18:07:37 +0200
Message-ID: <20250530160748.2476088-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
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

