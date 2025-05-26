Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593419DF7A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265636; cv=none; b=d7MEtJKRZFCnAsvKkwLv8omYgccB3+hEjyZxFW9QByFN/e/OTdyjKOwQY4KoBmUogvcIaY4+1/qrdzg/cTx9qXG7XSh3J4RU/wX6GhcQDQCoY9QtOJBKyLIGX8d8reScCj3pbKzh3CexYF0f7zntNOwxsjT9mZSNcdAF8Rew3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265636; c=relaxed/simple;
	bh=FA+FFymajfUy4pOqjSAWA3X/OMrBghhQSgqCnZeHplw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SB3W9HlTurIhoivoAegDWtB/8RlFBty4B8/+kedGVI4kqG693yfUQvzl0E8oF+fZ9gk213OqvZuQdq3+T49zTKcBkqRnokIC54X5AxF1MchmLz1pXtt2+vjPYE3uczF4UWv9JRVtghxR53JHO6OxfTR9ekRME/HS2afZbMoyP4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ocong8TV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ocong8TV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440685d6afcso28331565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748265632; x=1748870432; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ej9FiKr0JkEdWsFsmolvJ2gLB0Q5mF9UscCZJ16sQU=;
        b=ocong8TViw1zo0oNQZth390gQrSEj0zbazD8gF6dXQ1l33/36QDNm2ZwhGkiOtQZFg
         Mi8I+LcJFfkqCs7Zrew9j1PYpqDK6ot86C/Sl2mpbJlzzl04mqpo5lh7ioK6VEkyGONI
         GF9HPMrxGrbJPIipUOQJzHQMU7QHLTFaE3h5n6od7F+9Owx9mlzEyfd9CWoz1Y4uGimq
         j51hBJfE6wOJw0RyqscPJlMEVcm9OLG+W+WxvJWUs/WdOV/6oFKy+4NiGKHk4uqH1AOn
         lzqSzrIewrosoBSFUxtGCJQboSQIBpaBxJZph5wgHNCVVrpagNKe0ejW6HbDpe5Hnq4m
         ZKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265632; x=1748870432;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ej9FiKr0JkEdWsFsmolvJ2gLB0Q5mF9UscCZJ16sQU=;
        b=uMXSd1M/RLIIywoLXDxHrm80zzDY5SVFZh79bYsuGHUT5SFp3s4DmqU8Qq1YFr0mTv
         RZ5DDe7JffuwzzzS9wXgTceG1Vk+e17uJ6rqf14AZdwV3X7dSHV0JmsFexMTyPqeJvVU
         YWHpS0Jr5l1CWz7H/KsovHHu2mHUlFGepLavpETyAuUCW39xFkuHQWekvoYBvKojsjxA
         IGCBeLzFFO/KpyO+SGx8V9JZJ7I0i77llVWSV9bneFlYRDrI0C/HyAvz9+kKOlzUGBwB
         d2RoHhm8as1qBIf+VFsUrL1u7/xcMVtqQ87rCQgK4CfXE9gnHdc0cq4WEsZCCzxwF/BY
         rE2w==
X-Forwarded-Encrypted: i=1; AJvYcCX5NDlUE5oHPCm1Qre/gEqRji03hS8T/d8f14eZxmOqFOtXQoyFl8Hg3Mpva16T7mtFD88s6JnZlePYm6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/g0qQjf6sJ5WrHguWqltssUdfAALHexfqGrPZN3KqLytCLK35
	rqkUSZAFXIc0qT7vyzaVg3B7FK2GDt+FizvcxnuRYPH74Bz8YhLP8gCf5TijKpBhVLg=
X-Gm-Gg: ASbGncuvNBOlxUFML2bmpIsY4cmIxMK/eDZiMczVyGadkagUKDcwBaR13pUxBsiqHlI
	zphgCMZMX/vwSAEYapPaNkyT5geIpZZ/2WZWYheCPEUiqdGckiVqPi2EYtTvA3vAxRGOCYhrTeT
	wroHHgh9NVynQjJUyBYPVE3u049nKFCYSJBNwU+EdSHmA/3ORpOlzOnN1xVm69EotaVoY3/3+c+
	DHv6gc29BCuXnQ3l3dWr9P0433udxhCM4qZkLGxcoZO1VAHCSWF7/aMThTDPbvYzu8nHG1EzKl8
	/CueyH1gXSnUbn3iEKT+T4x32Eey2CzhMTioj3GsCw0awBiFL4wDbKp35rOJnA17hIuruUPQLg1
	Xxiyqk8FjutCXGJYH82f9h/mIZVTbcrM=
X-Google-Smtp-Source: AGHT+IEuz33WELmldIakkzi+3/fUP8upZSU2yYSV4bJxcgAOZc9F6u0AC/YiVsjAsgx/Vbe9PrzSXg==
X-Received: by 2002:a05:600c:1385:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-44c93da7c08mr68123765e9.6.1748265631739;
        Mon, 26 May 2025 06:20:31 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7ca2dd9sm232876545e9.37.2025.05.26.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 06:20:30 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 26 May 2025 15:19:08 +0200
Subject: [PATCH v2] dt-bindings: iio: adc: adi,ad7606: fix dt_schema
 validation warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-wip-bl-ad7606-dtschema-fixes-v2-1-9bd56d039489@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAEtqNGgC/42NTQqDMBBGryKz7pQkJopdeY/iIjFjHfCPRGxFv
 HtTT9Dlex+874BIgSnCIzsg0MaR5ymBumXQ9nZ6EbJPDEooI4zK8c0LugGtLwtRoF9j29NoseM
 PRTRUWJdrRULnkBJLoGtIhWeTuOe4zmG/3jb5s3+GN4kSfSV12TllZVXVzu4Du0D3dh6hOc/zC
 8C0qQ7LAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=luRRUAmuf+DebA1gbJsvFSTK+6YkNQgeGlpopVKHTIA=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwyQrikMv/5S2z+MzMnsjzXjvDBWfNPOj+XHf+0x+mD
 hprvZIfdJSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZhIQQEjw2VXqcfTqnIaWWd1
 6vcW5bcv4Hqx2dpZdaPiajU3UfZPjxgZWjICNb2TQ0z/st05kPamQrNhT3rhkX2Fz7oKdRXZr59
 jAgA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix following dt_schema warning when offload is used:

  DTC [C] arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb
/home/angelo/dev-baylibre/linux-iio/arch/arm/boot/dts/xilinx/zynq-zed-adv7511-ad7606.dtb: adc@0: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'io-backends' is a required property
	from schema $id: http://devicetree.org/schemas/iio/adc/adi,ad7606.yaml#

There isn't any reason that we couldn't have interrupts wired up at the
same time we are using io-backends or SPI offload, so dropping off the
related "oneOf" block entirely.

Fixes: ccf8c3f106a2 ("dt-bindings: iio: adc: adi,ad7606: add SPI offload properties")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Fix dt_schema validation warning.

Link: https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
---
Changes in v2:
- Change removing the related oneOf block. 
- Link to v1: https://lore.kernel.org/r/20250523-wip-bl-ad7606-dtschema-fixes-v1-1-d9147fb2a199@baylibre.com
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 29f12d650442b8ff2eb455306ce59a0e87867ddd..1a5209139e1338f803c66ad2b4d63ad53cc11d96 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -223,12 +223,6 @@ allOf:
       - required:
           - pwms
 
-  - oneOf:
-      - required:
-          - interrupts
-      - required:
-          - io-backends
-
   - if:
       properties:
         compatible:

---
base-commit: 3964c6e5877f054497ffccc7d00f8f7add307d0d
change-id: 20250523-wip-bl-ad7606-dtschema-fixes-5e6ab342e043

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

