Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F49295D90
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010338; cv=none; b=h7nktLt+MHn1VdzHBQjD7BEm/do5q67szongPb+dxKriXLXDEo7t5zvg3XzmsEhIxwKzFyhStI3rUN+nWva9/28aVmDoxh/PbgeUHA+3Ck5/FQw8dQvj+wBl12INZZBdiMkwI2KTSt04giVyGVwi/9IPUwNtWDPwtHcPl5+lFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010338; c=relaxed/simple;
	bh=nZ5SS5fpmkgR3iYpdpq7pZORQVlRLYu0ooXoeUHCCeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=enM1scThliOFoSADrHKfF5AlmEQmFbj0iBIICAtdxpV/DFC/nCKmFIia5oaNJLmmcSQFnHYmIJCvagwrT0gdnN3LPBkLn90Hfnj1UQV1i2Kxo5UPGnBXsaa9xIZR/euJNvmIkcnhjE/AJev1fAjbZ5oikYsBL3H8AtbYRro1iPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XNFY9O80; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XNFY9O80"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a367ec7840so1740f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748010333; x=1748615133; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DGHdWjCI14DDBm+q+Hk4hxhni2JPnh8fl80zU64P1W4=;
        b=XNFY9O80vyukQ3xJjjvOzsfPH316LuAHPy8Hs6ctSFHFw5odc1Xtgh1BXKNL+DQRAQ
         EFiHmbEs/RCx+BKfW+VK/ZFwIZFvE+36iapW0rsFC0L+yxs/FtamvqWA2dgw7vt0dDM6
         prE4FEuvXEop4YDbdYStR9/U6Q5ESoMfxjfG1MZSD4v2eXXco6BxkqG1+e1xuI61u50H
         76Xi8jATpOBf3RMLWbhUgBxFGoR/y1RN2cOliZfR8ajqVy2wegKtZjKVtnvCyT/m2VvH
         I33nyXkH1RpPRXxp82iZlHBF1k3QfCEHjA0aLZ7f3z0Clo2z9RtMPgRV39R2h2lnyoRy
         3EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010333; x=1748615133;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGHdWjCI14DDBm+q+Hk4hxhni2JPnh8fl80zU64P1W4=;
        b=pECuGvdkQtwAkVdxMROvf8maoFbrd6t/9lQ29UpVHYAZL/QzwshaSl/2bbS9mBHdJF
         vCIqi8AthZ1sQFrtqXfDEwvJtdsk4QvpK48J+RKYWCKKwB1WzuJBc/a76MtuYwzUx5BJ
         9/LoPotve7ScEe1GQS/zRNFt6p7ayIX5l3a98gFfriheUFu5xjYC6AuRKcLOkbeYQDEc
         5p5dm130yRhmPq3xKwb3Y4MNb1kE7pskwWaEVLNfnDhC9IQ2VWPOKB/phBsATLefgg1n
         F/zvpaPOrZT9M4Dsq+TmkzAakSP6DcmV8kMclfRVMQDf/Bp/4IiY9xDYrqiTy0YFOedq
         ApfA==
X-Forwarded-Encrypted: i=1; AJvYcCXwY633UK4UzDAHIA/HUGFI8qPnnl2Qq8YQopl/ECb+uz4tEbk6wH4iut/cBLWqBTZQfIRM0WyZpQKFxsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYg4JW9A/W+PpYgbcg4/OEAv7GKC0fHsiQ+SrtDU8LsUeYq4oO
	HIKPK1WiAqNk0jSRsOeQpBUIfArfW/1AkB8QdtDSd+yzUaKD4XZSRGjxlkj0Ea+4lFQ=
X-Gm-Gg: ASbGncslrXUBJdLaDn/L1y/eMArJsRQ4mhcvS+uL9D9JcznEUB8V4F+fN//xmS+y04c
	wA/aGmKO9tJqBvsBi4apSWyp5nTVJQCwrbhXDck/ZwAtK9WQj2Lq05nWekm+NfXO9zllQvnIg8u
	aI7/uk3Zf9xV1e27IIBdfeOI2GgCn2aPPR6Kp37TSIYKeWf7G5/4ezULF8fAniKaIOIkOltuANj
	sc5RFuefwfA0QJ0lmZN6sSWJw6e0GXGLE+lCQftynitFiaAZpTU0gmI4w2d6SukPaeBR49b+4nc
	SIiAYWTr2f/e2Zu8m9UwkbKjIw50GUerhIrtbSPAkINfCOu1csAAZE+bElc3I++Wi+oAIUSvJz2
	A/le/+r6BDwVRRKKqqEijtxw8U0R26rx5zn0=
X-Google-Smtp-Source: AGHT+IEd6EqKjtLeZMNL/y87CLJWxjBYBO6/USo1csg1/iA/GI/sQuJwwjnjqAjZo+BJ46fboxzoPg==
X-Received: by 2002:a05:6000:1a86:b0:39c:30c9:822 with SMTP id ffacd0b85a97d-3a35fead0admr24745639f8f.30.1748010333459;
        Fri, 23 May 2025 07:25:33 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d2ddsm26448936f8f.7.2025.05.23.07.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 07:25:32 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 23 May 2025 16:24:20 +0200
Subject: [PATCH] dt-bindings: iio: adc: adi,ad7606: fix dt_schema
 validation warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-wip-bl-ad7606-dtschema-fixes-v1-1-d9147fb2a199@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABOFMGgC/x3MQQqDMBBG4avIrDsQE5OCV5EuovmrA1YlI1oQ7
 97Q5ceDd5EiC5Ta6qKMQ1TWpaB+VDRMcRnBkorJGuuNt45P2bifOaZnMIHTrsOET+S3fKHsEWL
 vGgvTOCqLLeMfyqF73fcPrllBXG4AAAA=
X-Change-ID: 20250523-wip-bl-ad7606-dtschema-fixes-5e6ab342e043
To: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=tpYwHh0xRHdEPXHKeBzT0dSpPvZJP2vPXGLFFNbWbUw=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwaBVVepy3egmnT59r29PaoGU30t7q3jo+bVZw8t5XS
 hExHqcTO0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAEwkKJvhn+bKJQI6l5fdj1Kc
 zLQ9Nqu0aFV4zCTLrtVhjEYLZ05Z9JORYUPq0eiSBq+lt97FfPgb/4Rzh1/5o+NH3v7VmHnO7Ej
 4NTYA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix following dt_schema warning when offload is used:

  DTC [C] arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb
/home/angelo/dev-baylibre/linux-iio/arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb: adc@0: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'io-backends' is a required property
	from schema $id: http://devicetree.org/schemas/iio/adc/adi,ad7606.yaml#

Offload is a third option, so none of the above is needed. Used
"#trigger-source-cells" to identify offload usage.

Fixes: ccf8c3f106a2 ("dt-bindings: iio: adc: adi,ad7606: add SPI offload properties")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Fix dt_schema validation warning.

Link: https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 29f12d650442b8ff2eb455306ce59a0e87867ddd..ddb8266d18312031c6b957bcb435b651a128f711 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -228,6 +228,8 @@ allOf:
           - interrupts
       - required:
           - io-backends
+      - required:
+          - "#trigger-source-cells"
 
   - if:
       properties:

---
base-commit: 3964c6e5877f054497ffccc7d00f8f7add307d0d
change-id: 20250523-wip-bl-ad7606-dtschema-fixes-5e6ab342e043

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

