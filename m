Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B596B17588
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369614; cv=none; b=tNZBEvJeX5HfhSxEOMiCHTUztM/EBGBSwaCnUgeC5Rzy/vYBCORJUqQFogBc/akDVmXEDScT68lMzp6MdjJQLVZlCClCMohJLLxNUktw0FuzV8/WKQU6vnYLiksJCpOoPW1faD0UOmcqs2zygxYv8g4qbHiqTiyHxuj+7f8pM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369614; c=relaxed/simple;
	bh=+dNHJsRHE/JZChzL4jtoYzFUWpe+5i/Vh+Y/tynOtRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kgjt6C8FpZxlvdoq5cyRQ6jRFzueu9Nt4XfK636I6QV9xqbkU9Ss4ofTTTMYufSA3CvZE/F//5DRdPpEZyyUiU4Jtk8tKDwvb0qHWhR54AsEDtQcYo0WZa3OWkZjr5Jeb+JPDb1RGf03rDdOOHgLsIKq9V69njBaRNYMlBdKBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KkjIvfmE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KkjIvfmE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0ac853894so3881489f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748369610; x=1748974410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dpxuBRogWor3q4lMth7t3PBdJyoOLprduS4IK1yfNYE=;
        b=KkjIvfmEwEJtYEJtA/urhqgtYCyp2uVJJY8wEYEGwV423u58nqxuINyLhFUrlbuGSy
         LOkcPvZw3B8zp/6jX73h75qzCvO9A8T7lY6nvgqmtiw3HVUx/OrON3PC1oC1i9HXtVUG
         C8Z+TQRLCV5c6Rhm9UT739PVZRwemjCeZVHgvNK+8zCgKuNxnk1lSH4UXv0GuHbzMRCD
         d6jnj9aPXWyqKVtvc1dWVQY0ANgKLp1OFjjj+9owAvJZC/Ab4jAplAua2bCVG9XhxLj8
         tM+Hcsrf8cYMhhbr28F/qcg6VYLvGq2nV7FbTmtx6f6rtdJBlGVStds+b99+gPqPkyiW
         M1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369610; x=1748974410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpxuBRogWor3q4lMth7t3PBdJyoOLprduS4IK1yfNYE=;
        b=DShTFl/ousacsZWY201ajCmxZPyxmwiWBgAdszLQfjb2b2OrdNUSb1K0QzciCv3diT
         mezvaqPB8rNntvEuHKj9oX1VyuilIOkHwm2D2gFXBy2y25Ay4K0xUB9WnqjOZGAY7lfI
         ZRvrnbIM3lECIs92NOcDRCYtRosu4tCROGY3r88xlluKuYQZBznx+M3qDdddH9uiazuq
         iuvJgbKoPOAPf3FbhopZcJ9ooUPpj+1DkYHo92vl3we2auQ+lqD7ZsprmdGqy/NrBWUt
         1Sb+6+PjvmBmC2qoO2tIUMpyaCL2Lo9oyGRZqTs2+O/kfP1JGvPK9VjAPXpZaPI331C4
         +meg==
X-Forwarded-Encrypted: i=1; AJvYcCXq/CX1n/UVlUJTh4ulM16VozdIjL7w+V5Y+PX5rcInTC4bRi4AafbpPIPIOkFSMqGGd79RynkJZUVSrus=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXGYu5DqboQczy+kYJmUVEVAouiSL3SMQvPBwKbQmlBVitUUz
	BAYqSJ1Ufhsg6y8fJ9Vs01uiXcP3ClVk8Z1xKZtY912csNZ7ieyPqGNE78/oSCMKkrA=
X-Gm-Gg: ASbGncuJKMr52IxcTUcHUTccy4t7CdBK0df5eOvSxxrqVDlnNnqGWJ/B3yJujv2D45k
	+gdkG7dToznBlSsZrdNgKBDYpi1sLbr2naMDvdocNvLRARZ5fuXfzwlGmZIDzfXobRGGWSAo+al
	b3wlbLPirsl7idh9Uzg1MDbYTsJ3i8g/g/0AKFKFjwTMoFjZYTwVno5RhBJgI/y4P5bcPAK48Wm
	f/9IHBuzXh5jLkmkA5y0L2XcNLzkBpCcKp63XVcPAuquNwnZN1VM9G+jNFcm2HwXv2MJpFd22Sp
	Qq87fS21CvyhjCpZq1z8WcSboziIuxZ3B+90HyYIRFg+cKUSyVBoCNNMy+23fU6/88xoxHCdcxA
	PmZtqFV8x4tnByQE0eFQJsv/iY6nW
X-Google-Smtp-Source: AGHT+IGyU3zHzfNm3yCtX8SfqxXihbtdFZqypQaZRfy+BYQa0ZaAr3pKhSRnVElWiW/7T7dSNF3VAQ==
X-Received: by 2002:a05:6000:288b:b0:3a4:e65d:b6d5 with SMTP id ffacd0b85a97d-3a4e65db6demr1273634f8f.1.1748369609987;
        Tue, 27 May 2025 11:13:29 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4e658f96bsm902113f8f.38.2025.05.27.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 11:13:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: bcm958625-meraki-mx6x: Use #pwm-cells = <3>
Date: Tue, 27 May 2025 20:13:18 +0200
Message-ID: <20250527181320.373572-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+dNHJsRHE/JZChzL4jtoYzFUWpe+5i/Vh+Y/tynOtRQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoNgDAW5dubIg6+TqZHBRIzyah2FApIaAYRtXTf pqGRfowoMaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaDYAwAAKCRCPgPtYfRL+ TkZGB/9L3cCZEK+NJYPysI9UUNFEL3UFLYkm0pC5Pc6rhtCooUd7UHPjpFwpnSERFbvwzqjhIir 8ok3PXRe5Vr9IZiZGJEA3jCFTl8fJnG9kaL9NJeFS1di59xHVkQpGJHNUdV3jDe80F/z175+Yi5 31wqH+aUr81mLJdgGkUfANvYr4jAlI6ieCUOKHIiTDUaRrx8sD962dl0NJbcZ1xgUFfExXwq2X0 NiNvFdTnxy2pzSe0g9dDSypBrpdxQgMc9ErQg31gHtRXJz1hdT6h6+E8U3/SAEjKiClfvJerdhC akYjIzxbITlzegy8qZBD4jL9EVhn8tZGs0XaN+nJfCFobCKy
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

bcm-nsp.dtsi has #pwm-cells = <3> as is specified in the binding. So to
also use that correct value for bcm958625-meraki-mx6x the property
overriding that value just has to be dropped. This fixes a few warnings
like:

	arch/arm/boot/dts/broadcom/bcm958625-meraki-mx65.dtb: pwm@31000: #pwm-cells: 3 was expected
		from schema $id: http://devicetree.org/schemas/pwm/brcm,iproc-pwm.yaml#

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 .../boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
index 71a8b77b46f4..7e71aecb7251 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm958625-meraki-mx6x-common.dtsi
@@ -17,21 +17,21 @@ pwm-leds {
 		led-1 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_RED>;
-			pwms = <&pwm 1 50000>;
+			pwms = <&pwm 1 50000 0>;
 			max-brightness = <255>;
 		};
 
 		led-2 {
 			function = LED_FUNCTION_POWER;
 			color = <LED_COLOR_ID_GREEN>;
-			pwms = <&pwm 2 50000>;
+			pwms = <&pwm 2 50000 0>;
 			max-brightness = <255>;
 		};
 
 		led-3 {
 			function = LED_FUNCTION_INDICATOR;
 			color = <LED_COLOR_ID_BLUE>;
-			pwms = <&pwm 3 50000>;
+			pwms = <&pwm 3 50000 0>;
 			max-brightness = <255>;
 		};
 	};
@@ -132,7 +132,6 @@ pwm_leds: pwm_leds {
 
 &pwm {
 	status = "okay";
-	#pwm-cells = <2>;
 };
 
 &uart0 {

base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.47.2

