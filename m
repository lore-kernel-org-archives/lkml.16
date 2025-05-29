Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4780021C176;
	Thu, 29 May 2025 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748514385; cv=none; b=UIG41R8TFyDyHnXH+uurCC9SQE2vD7L+AezmAma/Jz04IFM/mZ8Bl1eOLpW6GQU8Z3kmaKfF4cFiPponOtBImzfNIKQk0ffN9bBBbBH+C6XNUIJV41VgX+gFJuUBhKKj9X4ah6XwHmot52suZmmfWVSR4+P+cbxU1xEem6jalWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748514385; c=relaxed/simple;
	bh=klYx1Y07kVk/S0TwjqmVOAThJZh3nOlwNCFD40jzZu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQGi5ywU5RIZbW9/XE5Q/wXMCegVwP3O6elZXL8FpbfTU3rr/bNqwAnFLGvZZUoIkX+7kt+Y5EG3OWRHxhhUtEAooN2kI6Ejpcbpm94dr86ZM3+f6zeANz5DyQzoiIB5gP6Erlh6Q/C5UYmOPj8H5jdslH3cDfDNYgxSClhpqgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOU9Um1u; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOU9Um1u"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso26092766b.2;
        Thu, 29 May 2025 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748514382; x=1749119182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnZTfx4DJ/20VLdE21durXqBLl/6baSWFBSIgLYZamY=;
        b=NOU9Um1ufZgRsbxPN3dnhMn2Jpu6lP8E0ORN1sf203rD85Cd0rWqmgxyS74OJieWeQ
         N9brJolFlLFwwBOYfe3Zwshjt6N47sHVIElwVuCB0leNyFj1dN2Sgg0F3tydEWfd1Cmr
         qBfp5UXMlJ9N7nMTtepSZnnw86/IhLyeBCgIN8amJvQLdioZfjlFqQEHrc/abzgQ9VWl
         Q1LEfz2lv0wZvX6AtK4SUlUSA0gbZBuJAGXR/EHnRHw1VnY0nczic5jLgsULCBfl35ud
         Qli8w8mBMLfPLuXyR3QfU6nBtETB9RA87XX0D9hJuK3nQPImNOD5t3R8yTInHNrR5mIi
         Fd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748514382; x=1749119182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnZTfx4DJ/20VLdE21durXqBLl/6baSWFBSIgLYZamY=;
        b=YdqBzgOcBnCxvo57ik7hp0ufCGQK2QIRKmLCHup7XtXvY0xz9Ay7LBPCasKBlmC0GT
         es8okxJC7v7LOvzuAVLAeYIBLyoqOdgUaNRd8USvsm3CwTPqfkVynTUZJa5uTZgAklZ7
         UPCWms4BFh442zAUWczeugY7Lf6jQcLxo6rM7jTQ2/uOD/llDxS4JaiW3KHuF0YCmN+s
         LR775tsuRFilv7181bm622cGDT8dE7pk8BKatlErjzqDi/Icp0heL+91de4HS3RYsUiG
         Bos7WIYT+MMZEd9x3V6jEDsKx6W31JFmUPS/Q8aIwfBu+FY535t1ymVug11MdoFT1uFB
         ymcw==
X-Forwarded-Encrypted: i=1; AJvYcCV9kiSODP/Uo3UEkbPk3H4bf4CWkXpQnWThMvynGWAk7YbJjvOEVcJE611K4QllpegCUIBUh3iBM7ur@vger.kernel.org, AJvYcCXCtnsm5H/gy+OWCpWWjf9daXVa6FgToeo6OdluwhQ6l1VMS+HK1TnK/SowjZLiaWIxZuWfIPyByJk/DYyp@vger.kernel.org
X-Gm-Message-State: AOJu0YzFp1Ld5J5s5rozMyaLtdfiARkjBCzJKV2YwsxVVgKnQCt6iZhp
	6RsT8nuypbtqyUUCIoCipUDXhrCPx3Rt6XbRnqfAyMarTo+LhNLBzYev
X-Gm-Gg: ASbGncvO2kdqcI6X3KHZxZv4FGx5fUTPx1mZBEiFrPgqW3uJ33TLc4k0zvIa4VvOXoI
	JvmFKvWy95U9xTK2gWPNcoBdzdG1oA6sWuBk3jq0tUS5+mH14M6YixN8S9lxSfxMxuaJuThaziu
	3qb+6RGZdOzKMV/8+EuVCveOcNCuWqT4A/Ev8aZfIS9+K86zsQfhh9Hat1ZEOaloWIoVlrDdlbr
	drHr+Nb+GD6yYQEFjSULexytdOXbqWNNtZlPg+RFSfuf0uFTGD2MvTl0Vt1RQIRA3Ov+QAkNsoc
	ViUMQOYNlrsLYWM/uQW5she3G5iSj2AJnDKOUrKgpqCaWQX9xBIrWaLekF1QYMsn6r/wM9pXiI9
	eqRpacJBX7Oxn8FBiV0C0IumlGBokfebk
X-Google-Smtp-Source: AGHT+IFNwqYb6hYLokA1iAbB99kihXj8zRaHpm5oMrFkFKhkmT44PK7Oed6ASI3bLbpvYocD8G0UBg==
X-Received: by 2002:a17:906:7305:b0:ad5:40ab:ad38 with SMTP id a640c23a62f3a-ad85b2a42d6mr1750899066b.51.1748514382137;
        Thu, 29 May 2025 03:26:22 -0700 (PDT)
Received: from emanuele-nb.int.toradex.com (93-44-16-92.ip95.fastwebnet.it. [93.44.16.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84f389sm116052466b.82.2025.05.29.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:26:21 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on I2C_3_HDMI
Date: Thu, 29 May 2025 12:25:54 +0200
Message-ID: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Enable internal bias pull-ups on the SoC-side I2C_3_HDMI that do not have
external pull resistors populated on the SoM. This ensures proper
default line levels.

Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 226398c37fa9..d90d13287076 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -717,8 +717,8 @@ AM62PX_MCU_IOPAD(0x0010, PIN_INPUT, 7) /* (D10) MCU_SPI0_D1.MCU_GPIO0_4 */ /* SO
 	/* Verdin I2C_3_HDMI */
 	pinctrl_mcu_i2c0: mcu-i2c0-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_MCU_IOPAD(0x0044, PIN_INPUT, 0) /* (E11) MCU_I2C0_SCL */ /* SODIMM 59 */
-			AM62PX_MCU_IOPAD(0x0048, PIN_INPUT, 0) /* (D11) MCU_I2C0_SDA */ /* SODIMM 57 */
+			AM62PX_MCU_IOPAD(0x0044, PIN_INPUT_PULLUP, 0) /* (E11) MCU_I2C0_SCL */ /* SODIMM 59 */
+			AM62PX_MCU_IOPAD(0x0048, PIN_INPUT_PULLUP, 0) /* (D11) MCU_I2C0_SDA */ /* SODIMM 57 */
 		>;
 	};
 
-- 
2.43.0

