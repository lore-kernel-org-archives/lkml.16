Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6A22AD16;
	Fri, 20 Jun 2025 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455294; cv=none; b=taYWhfyHc8NYOOePjXX6+vMhOw09qy6Vdckb/1f+zSg8tLB7rznM3Bmw/SiWv9yOIbKeVsV3WpQQkvBu9fPMLcyjXgFrlT5LDwlR9Jc5wNdmSHGmdxvSnH5zeoJGo4bBEBVOvlsp1BgSVe0b1Z5U69CuLcbdaEaXsE/W9ODerpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455294; c=relaxed/simple;
	bh=+2t//q5qq6lq45+xIz6SECaL4eslI6UA5sLtspIWoyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6JTbxml50AhPBexKOP3qVBqr5yq9gnLYj9f/UmaSjF18SDZ0hiCqZqWx0qaaB1YRomSvZWP8OwCVQv5vTntJploRzH4K+a+/qe36UsDLC21eKpnvbiNB0MNusFLxTEF5WawObgDFmst6zD4k+l06XTTtjCsMYlEZi60eFm2+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI5dAOiZ; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI5dAOiZ"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3dda399db09so23616705ab.3;
        Fri, 20 Jun 2025 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455291; x=1751060091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+B3F6T5itIIw6Fea+hP0fYMEiq/rD2eFXwlu5ekNYU=;
        b=JI5dAOiZf5mzS6N3ITKAc80g9XP40YgxSsVja0+wDC2lUoJdT5hgidxCaPVAElv6FA
         sQyQ09VWBfaRsqnLNo0cykXrKIToptwoZV9c/UtuBos5L/cOYKkpbgLy/oAATYJRZhgp
         kUrqff3lx4SNXVsKHL+A4N8LB5fxm+v+hsmGDKqnWbb30Y/i3lpg1LN2VDMBW8pRmxVN
         2cldlua4u+j7goGnohb6suT6wkqllBBNkpol6JeWdad86fCrHIpq8rtVItBG6C6wh3NV
         iptIIrtUPtWtzOVckieu8nKyUgyI1j18AC++aHZ/huWwAcsQ2kvdXbTQRVP5v+9oaqUt
         Ed9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455291; x=1751060091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+B3F6T5itIIw6Fea+hP0fYMEiq/rD2eFXwlu5ekNYU=;
        b=fmeoNgQTF1tMPYlNnqrxkYV3KVsSwAQ0bYQHtnKtAgOxhJl6W48jTVoWwtRaJR5YEi
         YV79uj0/LmsRHuFOBYK8bt36Hd6EDsEsxdDdwUGK5rMU2qFNDNSR5Y+l1J7Ffo4gERHn
         NSJLN3w9HyPBMoEx7zi9q0nyCSThWjQ1gslJGfBQnPFmV6EEs8afiFStcnevyL82BVrJ
         +/yg6ur2PkOSZuYdvqN68x0RJ50ZHS8jITa7nVLR8A0lfFErcbPG6LaBu6perzwErMEd
         j0lXiSx1fGm2iCi+aHymOVI5xQarm91hrsyiEsP0jW5zx4mllyiwq9p/F/552nQ+7Y/D
         aVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLlc9aAFoAUjTACd3AHr78o8Va7A2csAtUOUoac9xN41BYk1ejpAxQeEQUhsSxLQJKRibdLEfePEdV+aw9@vger.kernel.org, AJvYcCXjMGkAubnY71LSR3tjbi0OVoBJYtMfOJJpdIHahnjeXD1Fmh1AKMz8Q7R7CsEazULes8S9AmvKSjB+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiy9SMYrfm8xwEMiyRjh+QJHQgc8aui/p00J4Bkk6DxSTvnEIL
	hd4EDmjB8Lw6r/l3SasYEGdx/sp26Lo5BK1rtGHobhUgP+88QaVk3+2k
X-Gm-Gg: ASbGnctf1ZfAKAqliXLWTyiyTaaj9rk9XnsBtJ2wW6y8p0O55kHgJ40SypPkCgt9DG7
	wwo5We0L41pVtG5VCyQxeugHnkKy1aJPGSuvBW7GJC92YHOruWVp57Hk8Th4cuDL5NQOBbEUSFp
	GhBFTY3P8u2KmGLfeYZ4xxiURsQrf7IXVeSrqsS0ONSdPh4WXGjsXVSyPX2QdmrGOcANmk58EAu
	28uJtylxm5nAzRnyYHJXIEkDGzH90CFuBvuyNzwZVB0ZNvROlY1E287M9p826kkAf7M4tNQbFN0
	GBPBuC55bxpNXFxzPc4aTaJod0EifC3wHiYr7BGAKg5NuaQU1KIKeRdFmNblBzValQvQK28rKPw
	ogY/snhUqbZbbnhNw1Ykfyi6MfgHy6qHn9rQbnJA7XlVSTN8=
X-Google-Smtp-Source: AGHT+IEWnxZaEsUoXIyBXQdtG3ofERkIZgoD94IDVPmbvQCBnUrK9o6S+P5EUx9I2ltMG/Cyr6ePaw==
X-Received: by 2002:a05:6e02:174d:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3de38ca55cbmr47468705ab.12.1750455291583;
        Fri, 20 Jun 2025 14:34:51 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e0d03e7sm546707173.139.2025.06.20.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:51 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
Date: Fri, 20 Jun 2025 16:34:46 -0500
Message-ID: <20250620213447.56392-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
References: <20250620213447.56392-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference manual for the i.MX8MN states the clock rate in
MMC mode is 1/2 of the input clock, therefore to properly run
at HS400 rates, the input clock must be 400MHz to operate at
200MHz.  Currently the clock is set to 200MHz which is half the
rate it should be, so the throughput is half of what it should be
for HS400 operation.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 67a99383a632..917b7d0007a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -305,6 +305,8 @@ &usdhc3 {
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.48.1

