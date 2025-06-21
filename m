Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC31D8A10;
	Sat, 21 Jun 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750504996; cv=none; b=d0LirVPmr2mitHPoZgMjSX9tFIe0CIANSue/SbCA1S3wRQ48kRkuHIILSDaRwmt0H7HI4kDhphIMFCxwHSdB3g309xp/38LkjrKRdpdhkAJggNuhy4ELqqbBaECmMNeBGFtEshKyr2+sfdAS6Rcw6jlxIbnL/mOvcneLsDylJYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750504996; c=relaxed/simple;
	bh=xtyMvTu8rIA23hY9kaMR1I90uDuUCANKxURZNeP5bI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWdAibg5TYMqDa8BEEQ2RxRjGM6irKiNpLLohh5SpoFkXsorPXDED1jpVhzA6uZKaVUaq+JHDQpplBUB/KBYqjwqg3GJgbVp6dXnVg+c4iRfg7kAFoylC5hVaWpoV+BuOkYuilSOJYcWlU3kV2SxfKU5rsaauelNEvIW9ZLmlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1DQLIBa; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1DQLIBa"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3de11a14ff7so8998845ab.3;
        Sat, 21 Jun 2025 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504994; x=1751109794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UF7hadND9s3UrrMKF80WbZP/w/q/Chjap2NrEwYw97g=;
        b=L1DQLIBaXVCCJJ6gQThZBBGtcj7XV/I4Y3G9Zrc/D/hrIfFcWcLuGN3V+AfD8p0b33
         AkjHJQbM1wRGpIj3wDUlxtLBxwuEF3AmGo2l3TZ77Xn01LIETlC4ZNlTG09+2rv7b07c
         HiKhUj1uvI08K3BuCoePa8pWiB1jBbuxvrwSmjpe1IsGV7fSUgVroVFML7Hqj1CdILkX
         EYcHPcX+FI6m4v1yv2jtB0+nlATdY9juiEVAmzN96PemEohCnTWzNp7ZH91gZoU8opfP
         fFgcy4LwU0h/6U5hw0oG48yUEulQhNZ0D+3n/296GJPZek8/YvN0DFTE3rpFTrfe1ipP
         /sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504994; x=1751109794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF7hadND9s3UrrMKF80WbZP/w/q/Chjap2NrEwYw97g=;
        b=kzksEflLbwT6bpqHUegHLkF10CEuoXvDnadKpVbNn3yMMWetDPWIpJ7T8Krla+DeND
         Zukz85qzj+v8IBbj6NP7TM87Z/40ElDrZtY47cSKVA3i5+8e8Ku8a7iLPiEbl3ck5JaM
         EXewHGUtN5g0rXzOA4K7XxNoFsEcPbC3tRfZxY6Aog+uyu2RSt0X89gD7/GV9414DB5C
         FG3mzIwxSCHLED8kaDjV47Sd97vlbA5r58487hp2BTPTrz1ImXs0Vg55v0VZxlpI6OBE
         3lK+to2LyX8q0I7iZW6RxTYRQCFRqAYPQoKUUZOoIIwE9O7uJN80qrTs9vNWhSAXHR30
         6W6A==
X-Forwarded-Encrypted: i=1; AJvYcCVtwKPwlIYp3ziIR7+FXiG37MV518QAS+46htpLLU57XEGwCuhdrInvmt1KACZiI416gCDbBhZgCRdxCWQO@vger.kernel.org, AJvYcCWVuv/ykw3xhxzuMPpIeVw+xOuQHrYtxDe+waK3GUkUU9wGFOVyYthGJPmC6FRRoxnkpySnfO59mgi6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9jWQU7S3pla9ay+ntiWyLy9UE439ni3FQsyGKC6SYzpyp9XNp
	nwEvPbw9SDMDM0NUSylUP/xzpJ5+yF4L2mRPbpEw+L6wtdGzCjp9DSdrZoWEmQ==
X-Gm-Gg: ASbGnctqQxIKoGbjGL+Go38DOxQgCnwp1FyRrIQQsOOy2lqjmJCwWzEC2LGF2I1tQ83
	G+ixbjgsHpJZqko+6vvS63gPi8Gr4+VqQ79SfZYo0sKluWbSLYE+S8GHVtDYo1sTea38f2Xpk3m
	FCn5eWr5Qj/F4UfMhLusAPz6HqBFegKUsOve6uZJOdubTppMfHUyN/5tHnaBdQ039S7dxqmGZn4
	nvH6Veqx6WGt0QvYegCL/BdJpU09XvBhT7Bt570spsZYd1OD1O8IPjtxLzRrjArsKW418GFPM2l
	WCZ3tPTG7WH+5ApuQ/KEyxoFPsJPB3k75MUO8av/qfJV4ftjMcEW91//rwx9nS5SsF7bUZTyYHo
	PXekTK4wu1eINUP99Jh8SlMb8ONaCKli/ZQg2j7ow974VSg0=
X-Google-Smtp-Source: AGHT+IFygc8LNOika5Gsbzg0FvICu6wDzZeaHLaClXsS2ujOTAv2/VuH7qQJ9WvXWPOzMEJqiZfyqw==
X-Received: by 2002:a05:6e02:160c:b0:3dd:d33a:741a with SMTP id e9e14a558f8ab-3de38cc23a5mr66804735ab.18.1750504994014;
        Sat, 21 Jun 2025 04:23:14 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de3761874esm13654385ab.9.2025.06.21.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:23:13 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
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
Subject: [PATCH 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Date: Sat, 21 Jun 2025 06:23:09 -0500
Message-ID: <20250621112311.68101-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recomended to not use the DMA on the
console. Beacause, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>

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

