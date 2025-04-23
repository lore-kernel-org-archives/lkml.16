Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F4267386
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388188; cv=none; b=D1ZQA01nhQhXd8VlszrFivXNg6PjQ5+C3L8PE85zHZlFinf9NyHkggJgzPhcFIx3oAPoKM00DAR1WV9Z+nKxIKe+wWo+va9yqW6LECqM8jBcYxKDmBgbYj5snJsg2NDPK8L26xkxeoAAwRlIb/gVwipbIbgXYG6CT88Y4LySjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388188; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kcu50i+dwtD/Z0OqD/hTBogG25lk5yQ7atW9ZIWczbfxZKaXeSEqFI/ay9Y9sP+z6mjsPGzhcJUjnR7wkaKPG4AhLT84aes2EQnRa1+qkrLb6PxbeZblo1Y3sxjG1bFjv0bmF3K0zhfm6GJIjXYk3edhNjlyFIZiOWDuftqU2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=h4veubHf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="h4veubHf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2c663a3daso980229266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388185; x=1745992985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=h4veubHfeYyLh3j6fSFwqN7zpypn/de+xGbCYN3fktebu/MqfMJrmCuPYMaIdHVJwW
         kE3jz4kPkjfP/oFzfMnJfxsrqDgNrHItc7om07p1uvTEhHnxud859bVZNOqvrGXsUrl2
         m3pMUgLYp90ABOfls8ykhNlqq4lMDTtSGyD+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388185; x=1745992985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=SE4OkrwKpxkxT+wqDTZ6Ub2HDmt8MIXyQ47la/sEbcGwdBNofLEPDAW2J2kgC0jm3M
         wxoCIV6hjr28ESwkMwY1o6D9M5qi0dQaHktLr0gdSQL327yS85Zd3qPuAKQHStN58Ukr
         XfVDuOrBnCYIACKLAyqrv5Y4A4EDgSLljJN8AkROM/gG9ufCP1v0/lXlSwymQMofFTvg
         aPDaGFG5TXNCvAMpGOgPjIcUgTB4So3dPkUW6tTZjmEi+oOZ2GWjoImvLKEk3xWXzhLa
         Pj4htZMXFtgsE5jl3+qZPrEfReyAsoG2JGhmkkizrMMEllhqzzhwX0QkM0qdFDjyUju6
         OBlw==
X-Gm-Message-State: AOJu0YwZm6T5Fyqa1vZOm5Nzp83DOg+swq9iGPIKngZ3kMx2/ntfTwk0
	LAdTLXgzbsvxZJ5LzXmaAwrbmm15BOfxo2OeCEkxJqJhbNilJKFdBix1cemHUDKp53VGSIrrwFz
	E
X-Gm-Gg: ASbGnct6vLAE6wEXICp7g6HGMWBfhOtFIfHLYi99e/alkVTeRrl9sz0cZWKPhGgQ7yI
	HJmZchCxz7yyPSkmcX8+8ADs26vLtZSULj9Lmih9Tsl43TKkzxQc80/K3MceGsI8szA4sIM7z0K
	RpY1ktr8tez5zBKnCYAVPgktp7xk+v0xbHdDYEVRsS77M7jCf8qH1UpRoUonLym9sRY4WsiX2YP
	ypoAMBnXR1GSOzeRsb1uC5dAWAKi6Zt2xUHb9tzbuYkijeMJSh/q+uy5BzAH1dUenzPlNvfPxlO
	ewxypuip3pmoxtgRjCSkUlDQgFFe7QGzTeGNeAdUguWzwXY8MLO6cJTVGkk5aoxyvDgmfyzFhih
	wVUlo
X-Google-Smtp-Source: AGHT+IGrspoHDsYpuHpBd0xkLyZI/0PkKVqNxamXnpGvjKWbNAnUwCBvXK83/LAVhSGUiYAa3+5Q4g==
X-Received: by 2002:a17:907:1ca5:b0:ace:31bf:30f3 with SMTP id a640c23a62f3a-ace31bf409bmr477621966b.43.1745388185104;
        Tue, 22 Apr 2025 23:03:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:23 +0200
Message-ID: <20250423060241.95521-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

