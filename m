Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9017B425
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749219646; cv=none; b=CnOTRdmpbRbppow92S0NkKhPZpfdlXF6W+obSfNoCaPwjaQjxaH+fN03Po0peRORISw5iIFi9OUU+2Qa+O3V+yJ6fpg5GaktX6IV3OXZHIqmM2dHC7esidFwG4JH5AgogKBjU+Q2VEFiCg+ZoJtSOInk0UqpprA0cQoU4e44Yps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749219646; c=relaxed/simple;
	bh=NtotUFQE861trIH/6KVUMJlh1RHFkSekY2PpGsDNTzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNrq3P9/ZhXQUxxb5gl5K9INAfyt9H5ypmMvMgT43a16QC6Q0ZHFSTuvWkgH6du6lsBi/fv2QrcLVLem0XCMg6Nip1ekzRadNVslF959wRprJ8RcrxQ6nzoHlrUtdXWYM58SwBsP3BKIm3rJg6opNy8l44lJvQHBtawG8GTEJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lLtuejX3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lLtuejX3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f71831abso2073682f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749219642; x=1749824442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSPYC82OHD2BI/YU/tjmuoLa3AQcRKZBypSGl/10x2A=;
        b=lLtuejX3slvpCHU5i4svKXMgnvnLvKMSNrDwTfrfZr4seE5NN7DXsUvdXy8mAhg8zc
         vLxQ5Z+RK7lcPCEH84kmRBoq1WU9PJHqXpVZVTqAAnGeb+Obw5hmv22WqkFDvfA3UtNh
         +0xUY1Lxb1DWn4INjEkWAWYmkh5LF5BqaeUMGrH2tgaLfnEA1qoMIv6jszDUagmREmWp
         BZ9ypARgXCHZ/5U2CMMJqRg8fXliJaMI+vMnAjwa1oo3r2ra7x+q5AlsCrVYF0venqFi
         jW5Plgraw/5hXShlLZ0Zhjm4kBFG6psp6PxVhpn7RrfTcJcgDwfamj+FMtI+viXtjwsA
         llmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749219642; x=1749824442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSPYC82OHD2BI/YU/tjmuoLa3AQcRKZBypSGl/10x2A=;
        b=lkGCiXoV4DHHsEhUfV58n+jBlyA4CoRbJ3yxmYP1Tg00qMTQAZAiWKaGgvVrIIlist
         emQfg2ytbaRYNX8zSWUkzZ5j/M9XsQGy7y1TNSXD4E4Rq0nvTsTvJQl6l4IB3zUTwWP0
         dvRGbkD5/h/ya4Y2it/DSPOQnzMEjNygQ2iehhEfGZsKUQxI9iMJEpQEZb6JUifaIJGj
         h6bQYE2m4ahZ0e37X1wnrQMihZSiXImemYO/0IAKWqibG7Pn60rltWlBKszLfC96BJyO
         ey+wYF1q16/U4ZCf7GM/QBFQrL43kkRIvC9qb8Qjx8u3z5X0Ex7ltjXT5P9aQm8TunbJ
         qokQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPvVu7+97xTgL8RI5uKF5ivOGaLe6jOpuYrGSy9vOfTs8KzwV3ZAeaQSXTa+TYxPMt+0ZnyPFrU3frvTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJb+aExzHG9nufysL/zq41fSN5UOgf5wvuJ6/slEDj4SUVlYJA
	QSCS5zD6zT8kKVX93md9y0X4mPIKBbGyPv94OjNMRLfEQKj4CvfZ2X4GEuQHZorG6ZM=
X-Gm-Gg: ASbGncvwBI3ICqC3NYPDCp4SgyOBTdC/LRn05jQP55LRoaazbFy9P/nU78fKsG4PtUM
	KknZjKWfEmADdT3yH4XZv301f8KwLSgtibPMCMvEwaLy+EnK5ID0kP5QXSi8t0KYybmNY1sfHve
	ttz5sQ0kiCnxvRcHTp04i7l/IIPbv7eGhuhjVOhoWaY0DslFvHY2kPfzXh6tprHiTseDv6294sq
	/WRBAM7F/4QdAouHLbZzpDe6DNsXd6Z0scIedYzWqD35Iderlo6gZk9lyWyu+dCSu/KniCWwYHf
	lwHLAKFhHWv/UKvkUEeWE66ql3pf/gLQq+TICTj6j7CYshvGFsZQXcLLcNTFBIMiOhNMuviA/T1
	rciTmoBoQslilSHOwhFAQffEicAJDRqrPxHbi1YeBlQ==
X-Google-Smtp-Source: AGHT+IEPSADRuivjsBAwnxDwELX3J0cYKMrPAlNjoba2OLvJNlyJgJfrVNB7PQfFuEos6eyJm7zU2g==
X-Received: by 2002:a05:6000:22c4:b0:3a5:2f23:3789 with SMTP id ffacd0b85a97d-3a53188d5cfmr2988081f8f.15.1749219641589;
        Fri, 06 Jun 2025 07:20:41 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213754973sm25686345e9.35.2025.06.06.07.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:20:41 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 06 Jun 2025 16:19:19 +0200
Subject: [PATCH v9 4/7] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-wip-bl-ad7606-calibration-v9-4-6e014a1f92a2@baylibre.com>
References: <20250606-wip-bl-ad7606-calibration-v9-0-6e014a1f92a2@baylibre.com>
In-Reply-To: <20250606-wip-bl-ad7606-calibration-v9-0-6e014a1f92a2@baylibre.com>
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
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYshw+vGszPKRm63gXMlsYU25p/+9pCYJzNvw3ZXJrWmy5
 gVJ5oV7O0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAEzE6jbDf8cJPqdERXo7/dob
 1gZM6W+U/um4QMru1QcHV5v1Fr//xwJVuF/PW/jn7zF1he36bNKT+jU05/3ebmv1ZN1pB4UAVQ4
 eAA==
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

