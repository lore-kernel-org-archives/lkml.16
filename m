Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A827D76E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381898; cv=none; b=ZqGwsioZVq+cvWTcnYmVjiOAP8qFZ27SoAp48Z7xYCcZo2nOD6qVZsgCY0VVLuak5kF9C2Qx3QsKygtwOfI/LU97uT9C4bXydKOrAwmfWwevMbLGj5qdsnfxwr8DY0BNUuWxk9QMvRoz/Isw587Y7KXCwA0ClIsxgUs14NMv9YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381898; c=relaxed/simple;
	bh=V3/1Jhz+8jf7kFbZFnPBPOCuvUVUSIhpyy7UQB/kU4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eA084tnT5Sq+6xcoy4V7CZqEZucDjxXxlvaVjuRf3zWxTMVnITlvZ0SMsfQGGG1DXjimIDLP29Lo3jm6zBRzzG35f9MWr83ABgpyv4C0iyZR7aKPWT3T4sNGmApcJ692gVjWEvaRkEIhExDI3HpfIVpOpx7d0/j+XZLTovHPpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Au9mT8Pq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Au9mT8Pq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45363645a8eso40294495e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751381893; x=1751986693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9SnrP3NnfwuDtIo3bxA5uNn9yAXYdP3Skxl+K4FHxq8=;
        b=Au9mT8PqG25k8NMp3U+Nx8IMd/GAKdFlf0feBvjMsKlzlS78O++Pi9G5fOTdjAXlj7
         K2cURzX1spMvb4jf1p5OCUHkQmYMiU+d2/cX7UsybdpfZIuXm0Fta1g/Ny5635EscPx2
         8vrJmqXF0H5EYCzPuLZcb9O2HCSqCPMcsngjacw1KPnniCW0aoKjvPKUK9uxhF66a/C+
         rkidsAxgEKWwpnR8bpVN76llzrCGMg7CNF8ncZNfgDA+r8q0LkkZCmQEeCX9xSYmC7lL
         wLTompuVTBKNZwGIOEsJgPCxRcjyGde5gwTACjV42ZL23+a5Ou1Ry/4OJaLLpIOY6ocd
         3vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751381893; x=1751986693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SnrP3NnfwuDtIo3bxA5uNn9yAXYdP3Skxl+K4FHxq8=;
        b=c41Iz1KB/LJdhQe8d9v1uoQKCHt9bcPSbpn+YBKu11z6jMyeonVq/GCSn2f+OfVYG4
         vLVNb7NjV20fUWECWUcfpyHE4JZ56vAq7sUoyyM8WSDmSIupRzI2m4nwI7ifEN6CbwKz
         4FavOKD9X+ztels2ePM0pZEgF4q/ynuXRBww2gmPKo1DjU2I81+c9G8W/PESeMxfBfb/
         qTG4vkZBBcmlK+qoypd3oXCwJrJxQMDQkV9vdDHgf3b8zAnT/2H+QQvp3FIERjfr2ZM6
         5vKRXqzLKhpwrKCQEdXFCPbIycpnSilLwrqur4YeOZiAvkySGoUu51CneTYMr0j1oE9t
         af5A==
X-Forwarded-Encrypted: i=1; AJvYcCVARSrH7uD8hgyzQkJYWqEkOb6Ive6P5OB74w+3nme4STk5ktPDFDTR4SqzyTLIDH+ESqtcc5b6sJ5Vs/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjDhLtwO3vIBTbR8jVunvdF5S7NdKQknB7FUsc7BPY4i4XpCWd
	4A3SIhPTenn3uZNb2e4llpPIDAqFEwI0OrlYeuBuwq86clez69xTi8GxAvvmZ1FvU5E=
X-Gm-Gg: ASbGncs2qn4k1O8yTW3GBYzOYiQgAcrxK32JEBCYn7CgfEGGcyfZW31A0feCuFJJaY4
	fisYNdeNYcZ0yMtLpDy6Dml9+R8KsjbeEwRsD+23RpdZ1RHf01htqlLaosfGbLSX/VUyyzdzyiw
	TlUpOZawYM6G9GmcyGSY2rbqxP09fP8ZxZGHe02OUdVB7FFuYPG7kcsvGd5eKNFhDBAaTeAOnpb
	Lg5V00fftYxlQ6WWzDZaSE2XtOBAQcLuYnYg2NJnKjv5/c/Go2CfvN7B33ki6svjLOPen1rkOiW
	utsF9RB9BOAEccUtYyNknthnPiJbiPs8w1M/xxf7Rsm38UbYBO0eAV2vTX/lZu3aglmznepcjEP
	zdG+YlcFPwaU/CsHEhlLe5PZdGlzTJR6swTeO3gQ=
X-Google-Smtp-Source: AGHT+IHUmoDZ1xCqHU/YoX1VGjQsqIcwCI4NeUvfcRvvMvB3GVl/xxbnk7JsJ/Hkt3zYQQizDFlazQ==
X-Received: by 2002:a05:600c:358d:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-4538ee5d5f8mr208971115e9.16.1751381893014;
        Tue, 01 Jul 2025 07:58:13 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5972bsm13611051f8f.68.2025.07.01.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:58:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Purva Yeshi <purvayeshi550@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH v2] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC PWMs
Date: Tue,  1 Jul 2025 16:58:03 +0200
Message-ID: <20250701145803.140004-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=V3/1Jhz+8jf7kFbZFnPBPOCuvUVUSIhpyy7UQB/kU4E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoY/d8toMLlz9lxSI2Llq56+YvDEDL4asEd5CrC RI5bWIYEqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGP3fAAKCRCPgPtYfRL+ TktAB/4soWg74PxIEoMJ0HCcBne4dGY+GAy12UbwZonUtaMNIbvMcY+uICUI5B0u1OWZl4yv+VP 6SfkyOG7IK0m4xe2NQdRrvpsoqRmAd/G7pPUziwN2ofDvpNCX1BFZzgaTEufOWjDmCHa1DbbiKf baPqXHW8A7MdPSigqhloWsBqwBlb7rXdL4DruYiINyvGdgbArsjyWVp/UQPptAzln1vrUtu1bN6 vc4Yk2hFGT/YWCRmQqf1sO1BiJLTtZ7tn+jrnlhqwfI9oNZ3LK09QMzYU1jeMKNCuLZqgR+kpGu Y+opYi8G0asrxrSO3LpY3t2rH4Xxj8WqY/RXFk58Py9/d9c2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If these PWMs are to be used, a #pwm-cells property is necessary. The
right location for that is in the SoC's dtsi file to not make
machine.dts files repeat the value for each usage. Currently the
machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
there are no properties to drop there.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this patch was send to linux-arm-kernel@lists.infradead.org and a few
other lists but not soc@lists.linux.dev[1]. So Vladimir's appeal to Arnd to
apply it was lost.

The changes compared to (implicit) v1 are:

 - rebase to todays next
 - add Vladimir R-b tag
 - add Arnd and soc@lists.linux.dev to recipents

Thanks for considering
Uwe

[1] https://lore.kernel.org/linux-arm-kernel/20250403104915.251303-2-u.kleine-koenig@baylibre.com/

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 41f41a786f9d..6cf405e9b082 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -481,6 +481,7 @@ pwm1: pwm@4005c000 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c000 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM1>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM1>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";
@@ -490,6 +491,7 @@ pwm2: pwm@4005c004 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005c004 0x4>;
 				clocks = <&clk LPC32XX_CLK_PWM2>;
+				#pwm-cells = <3>;
 				assigned-clocks = <&clk LPC32XX_CLK_PWM2>;
 				assigned-clock-parents = <&clk LPC32XX_CLK_PERIPH>;
 				status = "disabled";

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0

