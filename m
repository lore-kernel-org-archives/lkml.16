Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93166274FE2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649739; cv=none; b=XcfcR/aFJJvqddT/ETQwUzlv5lVbE71lB2q0geXDGeCjnM3iVd4r+3jDyOT+q2Jqtq79boh8BB+i8iSNCMwnegKzVThV00Ana4N4DojplCsItzeieSMKE/u+SC2yVSR9F3pjAglIKi+/gZfhQAlfVWxRKGIpvqA4PeftuQ0qde0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649739; c=relaxed/simple;
	bh=NtotUFQE861trIH/6KVUMJlh1RHFkSekY2PpGsDNTzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDPv9FNeUY9UEG3qWaXbflxyuN9JkojdBlrtSwkYw5FbOO7gUsbgpWgTTRWlIEcVo7FltWKy9/9Zz715TTM9kFXwfbeKshnhdUIbe+oKKprWZWsgnzSTIxvLRkTqQh3m1m31zKfeu3LkY2wxGKCyHdAj34McZUiroMwpLXSNBTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S77uXptW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S77uXptW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a36abf5df9so842364f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649736; x=1748254536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSPYC82OHD2BI/YU/tjmuoLa3AQcRKZBypSGl/10x2A=;
        b=S77uXptWy4SfZBZU3DQgoAPg4xDp8r41EIOQdZQXzuENOOc7PBd+VFyUU+irlv54oI
         j+Zr8d8QCyZn9hvoUz032sYhZCP/ol/4eoDSs2UjrktGez0Cq1cUgIn3qQvQ4+XjT1w7
         PgyaexWsIRwwndy950Ktac7HxF9HBhPquuYPLKWUzewMjBMGpzlbY5kXh1S5Bcq0+/9f
         93teAzmYCS2r2jMA8Pdm8KTr/cT4OUCYhdGbOIPFlRmX1IsLA3vnMPdp6qOGATkpTeiW
         zmSG2I/GM2KrjuO2rF9D2dFq12exTv9j8PRewFjK+uSYVZ+pXOO9Z2e68AfgOAY02J09
         LgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649736; x=1748254536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSPYC82OHD2BI/YU/tjmuoLa3AQcRKZBypSGl/10x2A=;
        b=g4bTULcdQHnqE8O21TR8BJO9hA/j712GQRKRYm9GujA40J0Z2Wo0dQDNc7irzaN7dW
         Qo/hLCimQ05dTglBLeeJSm+gZUBZOqPP8T3T5cpHd1v5K7r+VgCgbhuMBdliRvWU0Gbk
         PLCZ50wHsen/VnAjFsYv+gz5LvU8WHFeTwuywLs85uxG8DaOZa46GtKPV4AOxZpXPWHh
         OXzydjdZYGX6SK40TU6P5yIB+cQ6jhZHEfdMxkopFD/j38n6ph1XQGnHMN60UjtMu7YO
         OVaO1WqMWRdDn9+otviS6E5IEkqJUBzO+uSFcHYQrF+awHqX2WHqjdNlLADjCgECwRO4
         ea9w==
X-Forwarded-Encrypted: i=1; AJvYcCWIHMhau5Cmt2xLlNjUNTxFa8tefUQYl9AzbaQ4ZW0/p9e3w0j1yAcbcJ4u9BAK++oJwa+DRUh2bidvQIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5QyRdwC3Qzy1rDJeM4OPbOrqzGP9d24c7fs+mlFMFMtVRHgyN
	yp1MWmynpOrh72uEABgvUU6lbTBWiXQdfl3sqikNbMsrIVSpo5K+JRs8e25mH8D0zIk=
X-Gm-Gg: ASbGnctapBrAoLhQSc4YAWr5qpyAAC1saX/sZy+i/XU4VTkPe5j+ArXxMg7fAKlSRjn
	ZyS5VxMVwTRc1+HbFm/twCSq3vnX8v4JjRklyo637NcGCnYIaFSvlI83odFMUXWsXUpLJxLWpzi
	QxQTBi2sS/k9wuyef5DUnEoAN27Hw5e5V+iiXetR0vjfFOTytm3LRfjR614MRfKCsjt9imbA+Ro
	66NqgxpNI5Jz5SExbHdYb6jQs7lqolBqMVM2mW9X3owum6z99Q082R775XJwJeU8q0gSTvyvATd
	JBaIWT6n/TU79LhZE42mm8AJ4zQxDLCG1KMvY2fQuRn3Kyb7n5RXf5en2CWbYjdUvIgd5wy3not
	VShhs/WGi+I+EWZzCO+SKHCt3/Nh++50ukcqmvJVZdg==
X-Google-Smtp-Source: AGHT+IER7v6KyF/cbFUflH1Cc5yxc79s6LmvGLxj7K8QrO5yV9tOzOi8ElwaaFJqW3KLhGCvw0DKcw==
X-Received: by 2002:a05:6000:2203:b0:3a3:4220:1bb0 with SMTP id ffacd0b85a97d-3a351210b0cmr13037471f8f.18.1747649735930;
        Mon, 19 May 2025 03:15:35 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d105sm12499021f8f.11.2025.05.19.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:15:35 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 19 May 2025 12:13:41 +0200
Subject: [PATCH v5 4/5] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wip-bl-ad7606-calibration-v5-4-4054fc7c9f3d@baylibre.com>
References: <20250519-wip-bl-ad7606-calibration-v5-0-4054fc7c9f3d@baylibre.com>
In-Reply-To: <20250519-wip-bl-ad7606-calibration-v5-0-4054fc7c9f3d@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=mK1GoQiX2hS20/yC/1czrPjfc5t1uAwSltJDkMx72Mc=;
 b=kA0DAAoWD8251fe2tzsByyZiAGgrBG+iKGbgWUSFybbH+6dfsu4AgBRpoFXy+9C4B77kkSgop
 4h1BAAWCgAdFiEEfmFYNFXbVRojoAGbD8251fe2tzsFAmgrBG8ACgkQD8251fe2tzvMrQD/Y8la
 WNUyw+5EqyElHuvKyoanDisVpJErB+/EOybLdtYBALcSFi3i1HOTJo9aYn+snFEKMixSwYVTDrK
 R6mSPW0YB
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add gain calibration support by a per-channel resistor value.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 29f12d650442b8ff2eb455306ce59a0e87867ddd..6926f5f090ad6bbbe7bfd9327dc5ae17dafcd1fd 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -204,6 +204,15 @@ patternProperties:
           considered a bipolar differential channel. Otherwise it is bipolar
           single-ended.
 
+      adi,rfilter-ohms:
+        description:
+          For ADCs that supports gain calibration, this property must be set to
+          the value of the external RFilter resistor. Proper gain error
+          correction is applied based on this value.
+        default: 0
+        minimum: 0
+        maximum: 64512
+
     required:
       - reg
       - bipolar
@@ -256,6 +265,25 @@ allOf:
       properties:
         adi,oversampling-ratio-gpios: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad7605-4
+              - adi,ad7606-4
+              - adi,ad7606-6
+              - adi,ad7606-8
+              - adi,ad7607
+              - adi,ad7608
+              - adi,ad7609
+              - adi,ad7616
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            adi,rfilter-ohms: false
+
   - if:
       properties:
         compatible:
@@ -398,6 +426,7 @@ examples:
                 reg = <8>;
                 diff-channels = <8 8>;
                 bipolar;
+                adi,rfilter-ohms = <2048>;
             };
 
         };

-- 
2.49.0

