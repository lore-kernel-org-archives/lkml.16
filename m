Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B222172A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698852; cv=none; b=NsZ/WJAUlQuFPxvCnhQvDsgBWGL7uX4kxwY30/EHCSGEJBgwh1mwKrQ9XalvG3TaJDn4P1UttcY6WXHTlSyCTmf7QVH9e6gDE2dVZpqPWOqgyDlt8LXfqvj+/6cE9M6xSClfV/xcWj7i35RaneWdyFWyeuUmYEFzIUu2JwFhCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698852; c=relaxed/simple;
	bh=NtotUFQE861trIH/6KVUMJlh1RHFkSekY2PpGsDNTzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lHoWXz7YpqsaiFOIFIqZVPJJCwAj4zC1d7m7M8qs7oMuAnfQszn56OhHm8JS4puZIfBVtK2HN0r0Rn7dM6/jR5RSnvgbPWA+wb4nLs7NUZ9OBD5DIJbeAVJ9fSYMQzDvU4jReLL7SgxRemoRLmOCLeLk+6RQ6PGJR6XEOYcr6FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zlIIc3n2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zlIIc3n2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso7528255e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746698849; x=1747303649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSPYC82OHD2BI/YU/tjmuoLa3AQcRKZBypSGl/10x2A=;
        b=zlIIc3n23bJg3eu8yMN5fJTMRh0ow+Js/vIlhe2XbP2rQRUc8vbObC2DCEVGr7DlNW
         Wd5Y8CN6/8WdKBpPAOv4W1w6XhrTdNUn0AbWO5Y9kQvnUZb862UQmx/X5CK+IYXzXcoZ
         zhgQ8gNXigpOObY25scRLf+6faQZsHsslxwtWR6k3Rk/tt7QLezhr2He6Gz+qbZv8Z95
         Imfr9MG4a3fNV8Khq+Sda7rZ1fnthYE1hBcvy/hFRgNNAn+dM3Qwl/WUIXjUsDW0hKXW
         vJAYICadmH8h4ORtO3IVgxpDjjR7BI6J/W/J2BMzxiCpsjtfo+ONfIuZlWUUFeafJYSV
         fiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698849; x=1747303649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSPYC82OHD2BI/YU/tjmuoLa3AQcRKZBypSGl/10x2A=;
        b=n0GRA2cO67UN3+eulPHyMEFTgcOeOUodxkyjqekn58VgxpcmXdWkE+lcnq6qdz1r5f
         7Yc+eFZ2J+II0ujdpToDr152o8sELZKtNPyjuKioo35VBfP/N8ldI7vxhZSh+WLnBIEp
         jRfOCQqh39ycr5LgvoGg2cM321DQpVOO7YhDlXGl8TGwMvX6kf6HIUjiZEHr92/iErdv
         +xDV97AuvRGMSq5GhOc3rbM+ow3GGyMZRsX69xA47jo5NPZ1PqumpDaxOlINbnz3iN5Y
         cy2lzpt8ehX7uWCl6b26MKV7XEjC6/+g+NXPsZxbp5upRpNxc30ToqeIsn4TkJj+0+eE
         Z+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbu2R1N1yB8zxjN9pCCys5+1Piqzx6IncdJl8sg+cWEimuu/arFSsDDivKIBU1gWNvn8GYMPvLHf2rzEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2gs4cVaRAfShBIHfh5UXwanWGGWEltY+DG84Nv9CbwGEf3GgS
	gHOW8UwURKOYpXS/p2hdZ6A4+pfhJEW6YgQrkV74dGMg9KFH2bl9aS2Mlk0PvyY=
X-Gm-Gg: ASbGncvBmVEBz29tospK0jR3qMdfDRIj6ju7DI9DLiC1vLZz7wl5/ffdAtuTXzqQODE
	bX/px4rd3pCGGmYo5BleLwkCAlKFIOOGdTs/AIMH5vRqssmrXKyKmp5GIqrCihyF/4GooCap4fh
	7+48eWO2wIw8/+7r/TJGveTU3xPGjdUQsfS3Y5XhnFuO1FJcmt+7yOQyOBCPCPKa8iVvPogXRMZ
	XV3CpRr01VyKNzcRPaZKyHIznul0gNtekvL8/I/bdctTTo3vZq+8fbGEGstIY7fAzP5H83ocHBn
	tkpbmYYGa8t4DLvj2Ev8s+5Yqztj2PMsI/NtVX+k22tvIoD7k6MKh6cmMnkCtnQj7+gpMmly3At
	OC/Du+JOjcruV
X-Google-Smtp-Source: AGHT+IGpDbCqxpxY735RLxLLHAIg+lMhMz0zWLomF7rSFCaox77DmoVETCv4H/UZDLyD9MPEbRiFtQ==
X-Received: by 2002:a05:6000:310d:b0:39e:cbde:8889 with SMTP id ffacd0b85a97d-3a0b4a05ddbmr5637369f8f.6.1746698849462;
        Thu, 08 May 2025 03:07:29 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd363940sm31699665e9.25.2025.05.08.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:07:27 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 08 May 2025 12:06:08 +0200
Subject: [PATCH v4 4/5] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-wip-bl-ad7606-calibration-v4-4-91a3f2837e6b@baylibre.com>
References: <20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com>
In-Reply-To: <20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com>
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
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiQaeLn/HnBYqH6+X9lTv882Ez2PTadkePx7Bbbj5ytp
 7VW3RBP7yhlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjARWR2G/8UtIUePNRSzbeba
 /dvxwOpY3qXGAUL3Dvzu8ZcKuOx8SIDhv+d0LeGkEn9ly/qiNy1x6y2Cu4MNSwqTk3e9b8y+fra
 KFwA=
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

