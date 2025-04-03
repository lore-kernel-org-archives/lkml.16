Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13424886C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677369; cv=none; b=dBx39BhIIWs8ZDZKPU6Eqfj1lfEleiNm8UGyHCZSspAnjGknq7Irlwr+Ms+f0D5HSQx4CAhTGqGeRfpZimfjPMcszfcxdliyuqd7fvKGiAQrI9rOJdhxaBbebiw6BqF+wdz2FI6O4H+hxrQYaMFvBqSN1BuIRcRrN/EgwlTn3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677369; c=relaxed/simple;
	bh=PiSeoio2a86WeS2jXJRlVM0CbLy7adADUG+LFiQOMGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UPgulgiU+sU0urjdRFCr4T0/u2QmQ65jXAPHQuv7YrsJ/rzZJ5iCIXSdyQWfhNKoKR4qbHlcth1iORA8TL8YbzW93BHIcFM8h9vYoMflOWV5niapGIiZc/YOGnzluEkCL2UkGktKIpUT35cIeozxuyS9AZ8ynfTLzteuAp2ThmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IUSN01mH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IUSN01mH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso7273095e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743677365; x=1744282165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7N6TSglbOMXGrbSWsg3supmWymijubudO7AAYgdgVI=;
        b=IUSN01mH1K4bGEyY8Z4ncFkfPM0tv6RudHd6S3Am5DXFaKBDi4UoVDhHmy4aFyh+8F
         oHqZ1zPpFzTfh36NhbzFOYl0QRR38+fR+Whs454KtyHMoUuCIddJKDPwqqe+UMHQio6S
         wWjYAqX3sPsj3Hf+RiQw9ItEHZrToMK67XSvWhOA76VGt5S1Ge8LMM8Lf1Ivg6t4ZWhm
         gGk/Uw9QtLD+hxRB5Pu4XCRy8eEDbnpHLUi9/zkDzSHxG+f5lF7LgmmRTyZ6oCRX9aAB
         SM16aCviadEqcnx5phopyWThMLPGsg54pqFynRG413uqhBorGuVK93lhimE5qYfoSXOS
         VPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677365; x=1744282165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7N6TSglbOMXGrbSWsg3supmWymijubudO7AAYgdgVI=;
        b=nOAqPk73H3I6MVIDZWtBdQ0bmVU/aN+/nEFhBvgjBXfk9cVRY9Ppc9RcQNSxWXsgCN
         zXaIm3H27XpWzxlbVM3TfJU8P2xZvtpPbIATnV9g8C0z7+GiwdhHZj/oXZxqQAmJqOjv
         Lhb8qUZpOKKaw5oUnYNIcCAfKGyCsV3FWWztQqqBuiqc/nqmBFGEt7RqDcmtptbglshq
         pxto3ZEq8i7qPkz6+hd8Ozx5759nCUBgr7NuBSBXlFmvrCVM7AdxKDH474JD7ta8KMwG
         4k+FRWvtf34K2q3srpzYZuBSoAMQ1wZshnlpeyvAhlnScetb0PhRa8Df7iSZ06oJC4TH
         j24Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3xP5fcaS0EIRWtNch1wXLG9UpQHp+GxxDsZB6hBivEUCCAJcHbcvQK+rA+rm6+jRVPgyGV0rdXwAw8s8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IXBH6tWjFjN+dBx10DxA2QYXbI9w51eYXO47+/eruQURvFhC
	FWX5JXk1+Y8a08IsdnasT+4pMd0BX7/QsB+2lvdTT5vq5LHU8l7Hatamu+hhQBpEsfEPKihS3hw
	s
X-Gm-Gg: ASbGncufKff3AgUKXRvZb8qBsVb6VcH+Hl+JglYWfzhPibZp6jlnbun2rryz2Jr4p/a
	l2/VMwoL8MOjv324VGOlmoMOMIAsi9WSY4O+O91bA0JJfnx4vO9iflZSudxWK05cmsJBdi4l474
	Gervosff/wqe3qvX5z7poiQo6twVA6HzId/Qit7LBKAl6PU6YrjpBUeGNLglHKhFSXhkrqIngmu
	fO60I9nWlLm4g/z7sBIJ2nII07KURC/e5w7Sc7FxHKgAgSUkLywR2trOdml8tRJF4/KbS4yOZbS
	CJ6iWhd8lAQlsImfgKVaL5PXBSrHcALVXrWTq6BFT0J+SIlSIpAFesbZn8h/BlF+QyNvcaWm4ef
	THIz80xasSnc=
X-Google-Smtp-Source: AGHT+IF7ppya2Qe7sDdlJauBrlDdBS0DOhdQY6it8f/OoMt81AYudBQET3IpEmjnLoCxmzeRrLg8Fw==
X-Received: by 2002:a05:6000:1aca:b0:391:1458:2233 with SMTP id ffacd0b85a97d-39c120cb5b1mr16403178f8f.11.1743677365072;
        Thu, 03 Apr 2025 03:49:25 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a732asm1476123f8f.30.2025.04.03.03.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:49:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Purva Yeshi <purvayeshi550@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC PWMs
Date: Thu,  3 Apr 2025 12:49:14 +0200
Message-ID: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=PiSeoio2a86WeS2jXJRlVM0CbLy7adADUG+LFiQOMGk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn7merikfyXXV0LsL+fQxBuc+nqdH7dQZ/s7ZfQ 8IOL7u4IGSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ+5nqwAKCRCPgPtYfRL+ TjWwB/0b9e+IY35Xp9g8dPZuyf2cd6XtTWE0FyNuSx1RToEiFcjklGDYgFCtEKABwcKtOBEulek HwZ4A4tHbzhb5jBnciWyaUFZj1wkLoW6qboUr0tx0KMvb5MHhAk9xqlCowUe7338mRaLpij9YLJ ltxRsgek2oj6gC14sGnIONM8I2Bl1SMh0j7RDoCMvS9Kb66HGMe/6t1ixavC5RUxRol2KNwYRRT UOKpKSBkan+bbe2D3N3GMzVsBNO+wJy33UIGVMjyrvyx1bmeuq8AUAgt/PJq1qvLFw/eVy6aKtr j/93vWsR7GlnQJD3O3+rrMGdlerhb/l5KqMU/hSuuIL63uot
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If these PWMs are to be used, a #pwm-cells property is necessary. The
right location for that is in the SoC's dtsi file to not make
machine.dts files repeat the value for each usage. Currently the
machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
there are no properties to drop there.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

found while reviewing https://lore.kernel.org/linux-pwm/20250312122750.6391-1-purvayeshi550@gmail.com

Best regards
Uwe

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..4460a1960606 100644
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
-- 
2.47.2

