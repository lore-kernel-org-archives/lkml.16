Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2432874E1;
	Thu,  3 Jul 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542702; cv=none; b=ECb+hdWkmSt8WI6Ulh7R4rclPc8DhWgfNf1hBghMFIx9GnTgMAOnMthXOUige49felBC7mRGPeUrb/f1gWus49oFrXwf3dNyyQLMTnoYTxPjVj+TPek7dubdYV4uD2FoRFmkOY/HK2SxrIHswxJ/kkDjFi+vuXmScLBA6n2XwNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542702; c=relaxed/simple;
	bh=5R6ckhkY2hESttOY9KT338PgWgQIq75EHvFlZEgFiuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhXIyaHrX5A0fG/atiW3IZhWD1pU8jOB/woy9TYM0T0nYRbMSPLv2bPYdfAuwYNeXEBlhrVdw5TuNTWQLl4t0ExisriyEjSnDlCU2OqvPnqk0RNZGEsFSIq8ejUjglA7MhT/rMM+gxz+46HI3XEHmQ//zzRKGB+dE3VAeBURYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii9ZITgk; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii9ZITgk"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86a052d7897so689571839f.0;
        Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751542700; x=1752147500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCtxfijaVm+CdySvz4wp4lXx6NKzCfTR5tSHGOmQuhM=;
        b=ii9ZITgk/jRJK6O+w8Q89wGZCAMNjwWsBA1fRuY8hdYxmPY1bMBMlobbypCSofOtf4
         vqSt8NNI99ateUqeH4vTChYHwtESCL+58PDthqAxVeq7xP5C+H+qyMRXA/H5cOHPYkQk
         THXzaLDb947yDGBiYpRa1WXBhDi0+HDOYpzTVenhAdjeMZVjNvEqYJyhQgKITfUtFT+c
         2ByYMRkvmK97u02bFCYsK7F40hAgXkuR4GbGAz+dbS/FZ8Z8ttINbJYg6VikopBhWjnT
         WyEorUVFTrf/rJwXMOLyGFYLtIlrqZCUbcdVsF2nYXtKNbvGNz2tTM7D/4dnPA5xGLc7
         Hbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542700; x=1752147500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCtxfijaVm+CdySvz4wp4lXx6NKzCfTR5tSHGOmQuhM=;
        b=sL36LOUuGtdTxt6aeOTX4VN0sGwfC8CI5MfY/aqTO/NkiW0ctCuB4ngQdWgGh4sUUA
         /OBFubm/60A45kIOSC29bZBvylvU1zaE4wlGfQ5FdmLibbOFUKSI2Y8XcgCgKCLU2mhq
         QSARzWTwjg547oTLpdCEr67ul3mo9wA/uGfcZ6Xao3pC0anq6962DXLtVQ/UHZF6lYXA
         pXwseJXDa0HmJdQR/JnlIT9Nn+EJ0zDavpenjjQsfHqEPNOT9AqyRZ/tMcX/myDminms
         xAL/MFYIWWye4XR0vDOf/h2bXmrw/0Zk0+AB2CSlsETrmvhiVnPwQ+/+eOP++y9jZNN3
         qfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkLZJoRt0nzEH+6Tkkk/d9xRa9YjdycrCXyXPAlaFBK4qCBRWQI9PumYlFrFzRYCoehrhqSOw3LWGe@vger.kernel.org, AJvYcCXDndjQiTese81+sH9CRt679jxDpvKav6XKNnQXCshYopaTBJBtdTMrnbQ7MjBH3bHnTFDn4qnLzIf0dQgY@vger.kernel.org
X-Gm-Message-State: AOJu0Yznz+v/0gCJxXvXkGe5tEzd6Ygv6BA1yYR9lbiwir64eCj8RiOM
	z/PAVj4WGaQ05fBqcTyhSMUqX2LxhdSocLeiHRYuYEnoxc26rD4KKxa98fJ2Lw==
X-Gm-Gg: ASbGncuurD6vvC+TF0bqkGkKW4oEZRCZe1t7s9mBnjmCW+mt16Mf8rUeq52RIMxUiqI
	u631mjOeHj4pRVdpd3iZaeCKJSco4fu5w4HntJZa9ADSbiD/O7Lrnohg2fXZznz9VhoZEkdTL13
	Ve8XFb70wFRD4fhcCtg5y8v4g8Apg5hEzBm69VXmrsLI9gOc7HhiIpPBMSlvE4LPsq0q1YucE/d
	o+0ZOfiS0P3Y53sYFhuRIKGigxghyr9eXPriz9H0lI0zck+g1o/EIkJcegbl32ep19idubleK7W
	HEz3J4MTjf74H2pQ98osbN3cglPWkrfBgF5ASOTFbAA+njwqMJ2lphk80xUmK472BZGVZcs2cHL
	wT+pPI4uV7KvzxpprUTiUxQUUl73f5mlwaJcbThjdGUsdpxI=
X-Google-Smtp-Source: AGHT+IHog5B1MQo5B5fqSCOuRreuMqfrr3E0s/Y/+iP0IZARhEP16EmHsjUPLaXR/JQcDkES5v7T1w==
X-Received: by 2002:a05:6602:6003:b0:876:5527:fe2a with SMTP id ca18e2360f4ac-876c6a6fd54mr836261839f.11.1751542700238;
        Thu, 03 Jul 2025 04:38:20 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a57456sm3483544173.72.2025.07.03.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:38:19 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Date: Thu,  3 Jul 2025 06:38:09 -0500
Message-ID: <20250703113810.73023-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recommended to not use the DMA on the
console. Because, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
V2:  Fix spelling errors in commit message

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cfebaa01217e..ded89b046970 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -915,6 +915,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MM_CLK_UART2_ROOT>,
 						 <&clk IMX8MM_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1

