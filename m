Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DC202998
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429145; cv=none; b=RThjkPqPpmFMgOcsVdEIynvcCB5GoI7jNofvNNQ2Zekxl37S5k8g9fQ+NU8Qqb3E0bSfySNEPzROo8SyAkcNR0pdg6fUcilHxvb2bmzK8J+v4y/TjDI+0DBG3TzhEtaeeEh0nVRXFtrk/2FOs874e1CCUgkoDlCIcwJpks6zuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429145; c=relaxed/simple;
	bh=WNBlDSISNr5rKZ8xmsunf2YPelq9fQ0/mDnde8HKsf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZC5FiEKKafyvrjbKP+iC0lsN+N+qmDiRt8hKCiXB4FRIIw6gfUHJvVXnJcJKlACfSLb4JIPHtpuQMFKdHLDP2YnsXCg4E9rpcAYHBYbE+Xk/rBDI3B9w2nj0/QjooRSl7Yc/XEKu4my3/+xUz7ZTbDEc2oECuAj2fBvFwTiHy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xX75Pjfl; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xX75Pjfl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-602b5b4c125so896148a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748429142; x=1749033942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtDcxZbG0zU13QY7UbKwVwW+Mbm4F+j186r81Car6U4=;
        b=xX75PjflHJOj8CtgjmUTqMs/ychFP5QEu57v85bYvmY44npb4aLozHzL+jFTnF3Xko
         Y9LCL7vzQmLmQcgcl/A50qsLv+BpkFcG/MblOMbvtd+/nbr68814P3hC2mUVDsnkTSIe
         YUY6SAPFbCKaXgQyzHvGlcij+cPV2eIO7Z1nE4Nw+jZZibVkoeoXyTJQ7USUMQaltrqH
         omd7HKpMuxzqhCoWLsHMqwrW7mIQfY5AbEPFmyW85aeT//RcoypDlhdK1FFED1W5JieT
         9qI/hzn7G9uptR/KjwivzzaBHBQgpX0sfL9vLBJRT0CI0Vpcf77QXfhrOCPr3dLEXjgn
         uK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429142; x=1749033942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtDcxZbG0zU13QY7UbKwVwW+Mbm4F+j186r81Car6U4=;
        b=W9xnLQxzrx5hg93QRoReTBc7rnBK8bqPAnkYSokq2B7/mvFq8DJlA0HW+5Sx8dvtXD
         +WW6h1Aq9BwohJfbmBCX+NwL85Dbef+exO96App4Q1bbdiGYMP1gDUyxkJcZrM/qjQX0
         sFySmAUnkupn/0CYhb4L+MbNzdAkfD6ID+fMkDfORhNAJis3VRb8aJi2r6wwC2dW4Oa1
         +bWEAJeZ/cxYFS2kaMCle+9rczO2n+WADyfOiKsoN617KVUsZGScobEZpUhNBAt/jkMD
         wkgWr2ifDHNgVwzV3rO0Rb2gV0Bfq4BU92QOJJ1KQR2RS5g//1wKEQAZmQzT8Gmh0fnR
         elMg==
X-Forwarded-Encrypted: i=1; AJvYcCWZat1Xs4OucgopuPRrKwMbz2y4WpTHk3AvWjV2Nz+HtNztgU1DbBg3mGDaK9pWN/6OT7KhN5Zofkz2G8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkYrEGJGZAs1UmjgifNFpljNoMZFadoIA+rYe/VMwBEbrC8F+
	hY6THWDBChCgNxdMBYl7ooXJLe6YXQJlKMqrZ0uS8hFX9RXkyk8OyapX1NWsKsTuXhlM2hAJbhl
	H0wgI
X-Gm-Gg: ASbGncsB/q3JTZfcZ19ZaeAF7AUH5ErcSIIX21gbpK2PTyjbYtt9bOiHrJJUtHuDlWq
	0GYPMeSUSNEmoP+RQnICBcq2Mlz6h6VTKY8k/uT/sUsBUMDnxJ9fT/AqbEShgPLAQUw3cb6PBjt
	ebo+vqDeAFoL1ssUTwYWz2YpHFNGiPIGSOlTN/PuwOWli9AHDDzM6myf9u6cdcKaI/IP8gaLoGD
	V1GATxt0wckfv52GpbvGAY2uxL4wVJPRW6N0j/YsQfOgApLWi/hxTxIo85yVQ+3iI16TmUPJvCs
	sQCi0oHp4QsS5G6kLPJ7uu9k53eV+Omm6Kp/zUntYDBr7qStIMa09b8+CySUjQ==
X-Google-Smtp-Source: AGHT+IG8X9g0RKfdSK4PqNdy9GQldoxC4TaqYDMdsaCwuPIFrydbyErQBIHxXyGaX56fRVVumDyFvw==
X-Received: by 2002:a05:6402:40ca:b0:600:7698:f79 with SMTP id 4fb4d7f45d1cf-602d906683dmr5286829a12.4.1748429142217;
        Wed, 28 May 2025 03:45:42 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5f2375sm608858a12.23.2025.05.28.03.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:45:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: MAINTAINERS: Drop bouncing Jianlong Huang
Date: Wed, 28 May 2025 12:45:15 +0200
Message-ID: <20250528104514.184122-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=WNBlDSISNr5rKZ8xmsunf2YPelq9fQ0/mDnde8HKsf8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuk6td3utNc5lFqBWmZW/WBqH9jaO2wpVyO2O
 GKz7A2M5quJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDbpOgAKCRDBN2bmhouD
 1wTjD/9QOyX2QXQ1eQS3zCI3JIVMUBVm1xZ5KMkDyjdtLd6hUXBleXXqibnWUXqr+1kS7t03yy2
 kaOVZ2448OwaTRz/BhSFAR/Np6y2Hzop7z7kMjW4IyIVqa0w6HN5jy7Pmo1KQz2zUdmWQpdVS+R
 mO6KwrBKYrTEeuT0xr2BpKfnfsW8ZHiWjPMBungKLIbLGh38EIOvFKB15GlZY5YBq1eh3opR+CL
 Ubk4DL24a65NJKA9zDZ77sVMPY6NU77a/bnWopY0To5b3074+g/KhmfCd1AqM0McZtuJ4Ih4mjG
 a76cDBfpf/03S3e4dUc1hh7lyfGXE6i0O2/NZSbsBujJEs7B0yT4283/ZiIXYHP1M5hJwomIWqp
 cppfKKypfrcEN5AjqEwl6SgFB+BFx0xMxDR659UgkyTk+4d7J3Qcq6EbyURrjRQK2Tz0U48HkY5
 4pP2C2KHeUqQwX2rcq1WMuRZumxPF5RJgjN5+rVP2Bix1fT8Gyrb6Dl5FjPwSucRrjhM4w2D3jw
 nzblSuUS8JO+epx3jnjlnXH31Uqrz1+oAF58anmVIG5Gxpxzkt3YCWtw3Oa3AzHW2v7nyxwzOpR
 Z/2icDAjLMkglMOuemUlY/LpmrZgwqTtIcNXRvUC7owHzq/j/jVfr6NTnFEeC64TPJ/Naex52ql wPWFfMLEFt0C0Qw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Emails to Jianlong Huang bounce since 9 months, so drop the person from
maintainers:

  550 5.4.1 Recipient address rejected: Access denied.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml           | 2 +-
 .../bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml           | 2 +-
 MAINTAINERS                                                     | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
index b470901f5f56..4dbef86bd958 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
@@ -15,7 +15,7 @@ description: |
   Some peripherals such as PWM have their I/O go through the 4 "GPIOs".
 
 maintainers:
-  - Jianlong Huang <jianlong.huang@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
index 222b9e240f8a..e2a25a20f6a6 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
@@ -18,7 +18,7 @@ description: |
   any GPIO can be set up to be controlled by any of the peripherals.
 
 maintainers:
-  - Jianlong Huang <jianlong.huang@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 properties:
   compatible:
diff --git a/MAINTAINERS b/MAINTAINERS
index e20de38ffa54..29545231f5d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23628,7 +23628,6 @@ F:	include/dt-bindings/clock/starfive?jh71*.h
 
 STARFIVE JH71X0 PINCTRL DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
-M:	Jianlong Huang <jianlong.huang@starfivetech.com>
 M:	Hal Feng <hal.feng@starfivetech.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-- 
2.45.2

