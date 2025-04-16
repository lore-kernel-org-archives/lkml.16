Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942F6211A37;
	Wed, 16 Apr 2025 01:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765329; cv=none; b=GbB0FmawMZG25SA0iQ+fYyduI/K9oUtFk+YuQmz7MNfIxE7kUiBNJi6DKdDAt+v1GfatRaLRja3c8K+Fs6alZHPYqPn4C8fOkXptnL+azazvLsiWFvY321asBP0At+xTFdkBGeMUES1cNT6L2yk+S6FAWr2SownSXeKZWs5E9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765329; c=relaxed/simple;
	bh=a/39nf79uBuqznjc8lRDd/vjaADz9shNA9MfxIkl6Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seXFbUaLGou/C+oSURLk6cYOEUOzku/+XUzyZJ5XrcJsRgllt6qemHcZ03D/11H/rN1sPJ8GuzVQ0pxqzHr3441nxB8VRYpLr7zbcFeuKvLghyvXnMIpzzo2PRbOXyemQnw6l6k2F9g1RRoh+hxaB4FjUzmPTPehNPg9WBX7g5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ghs57gTE; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ghs57gTE"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4768f90bf36so55690481cf.0;
        Tue, 15 Apr 2025 18:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765326; x=1745370126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOP+Xk7g3usaXB8DY5qKgeIjsWqmRpi7//9PYTGo7zo=;
        b=Ghs57gTEMlYLInOKHQcBe8ODPP0/3FWSR5nkhalFe/v4vByrFYDLQMKysm8MAf2EB1
         d7Hlf7bVCiyPHwsdy8f9mwyU4HwTJZcWcoHZTyG/UV9JGT7NILD7qksBjNwQj4vT+KU5
         kI5n3exUfamM3XEZbcGto6Ac+SXG43dLjLMgzCAsboqtwjzvp06+u6+95g8Jg6Oun490
         U26gQD4W3XHzPR4zUGHpA4BQQ3+9wjolDZS3ROT82nAG9JznsSdxCJfFEDZ+cnpiohob
         gPRX0GUuEUIc39UWaRse+qnk3uqtpf4P/K61wrdQBXbByW7ihZ0QEjcHL/ZQQlMlv2+E
         bn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765326; x=1745370126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOP+Xk7g3usaXB8DY5qKgeIjsWqmRpi7//9PYTGo7zo=;
        b=h7G8Z+MnO4Afh4F8uvOquR33hMrNQGTZYxhY/Dfcw4/D9uENYjoM6sPc6biYTtHTpk
         tAY5skdRKfTc9C1YvftdiuqwEFVPVAKYXrCDl3nzqYU/qg8a3pJfOQnigZGAGQ9WnNVa
         TcQjHr7WMyR1cPCCO2xp59WKeRG0vqexl1+2vqjPMvHRKkX7pHV8TFkAyF/QapCf7WjD
         4ZXN8M+ELgQ0vlNOUbWEsSTNXPWIrpY0oY54W+vdwOvsji56rWmZbhLx+nTIyrsah5mF
         TwdsylrBLwA3rfByToqvXfsYBUK8oKL0W/3XDKxjwn+U3Rv2m5wO7hoVEKpX+ifBTbpY
         YsdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1kfo/2icjkFt3jWkLb9KE0HGhtpiypajzUfBc+rsqONr3N4lTmp9bgtclbLH2ElOJ10CPYrw7Rbb5z682@vger.kernel.org, AJvYcCXTcAewd1LBggqEvPWD8RnTc4gpgXl1GdvUOPP6iPTO2aSi0eEtkyCOihH0wtSAF4ZOKQhEjBDVnJGw@vger.kernel.org
X-Gm-Message-State: AOJu0YxjR5b9nZfhNvBX0fhAsbD4RN6CCZSEt5RsWH4nHvn+eh0rrqvY
	5W5ZP/tPVNpgO9+yTlA5yKebNk4tGyo+R+GwP2ofnaV/6QmHstp+
X-Gm-Gg: ASbGncsN9/kkD2n37kMbU1xp8xU9EnuNar5jcOSXGeJQyYlgRBEeGQDNh8yLPLRrJjh
	s+4Kt96AMCrqXwvYHB4yDszQi6R7hZq6T0JpiPipFfE5ZhhLEO5caju6HHmT+bGgNaZ40AM0XEU
	Z2kMX+waAZCA9GDlR42XH7FTn0/QenY5lVLtS/4yt80xeOnQBrms2VBZGGNlVSEZ2f4cCswe+f2
	3lUrsZXTgUr756X22acJujYREWQHaut6NRvdh1IdLyy52ORSZAtoIxYFnLAmk0BfW3atDKokgm6
	90epT/+L6owMxhsqeVdZLTvVqa3Pd31QwU0pFeyIZrdup/F0iG+32hg/GxYzPRLOldujnE6HkyE
	OOWCEYrXJla4JwjVi5cVjuKhOHw==
X-Google-Smtp-Source: AGHT+IEDuQm9Q9+u2jWvi1Km6PvJSKi5AhyyT3K/6Ng/ENPnCAb53xcfqp0yjXnII20xvajqm5l6NQ==
X-Received: by 2002:ac8:59c6:0:b0:477:41fa:1120 with SMTP id d75a77b69052e-47ad3a1d777mr19903451cf.12.1744765326454;
        Tue, 15 Apr 2025 18:02:06 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:06 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 10/10] arm64: dts: imx8mp-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:36 -0500
Message-ID: <20250416010141.1785841-10-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the interrupts and wakeup-source to allow the external RTC to be
used as an alarm.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  New to series

 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 88561df70d03..6a62cb32e22e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,7 +257,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -382,6 +387,12 @@ MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x1d0
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
-- 
2.48.1

