Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D672D3A98
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932092; cv=none; b=MU8umXH1BD4/QvZN3HM4uMYUmpT+5aEvg9VEQ1uPyivXUor3bqTHKJ6a98UtcstklyX29ltXn8l7pQfrVg097hkL3xzG2oTurNW85aBsD99AS+JnLQPPJbnNvHMa/153NjUd9VDBdspOrcCxjwnO12+Bz+CPQWqudLNMn33yKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932092; c=relaxed/simple;
	bh=HBmxpZciOAW/VYfHssuC6jJRRkEjnj8J3A1g2SBS07g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7ueWU5igfe3EzLv7OPAMRlgfFUtxhEJO+2kJcrsA/yuMZjJwNaD8x3RyRDttoXvyuuctRLLqWAs7/9xbKaZNbsflV3k/SnyYxYFBGwkQqk/bJU8YMBkGkA33QVNlipLj6CXVx5SX3PEwxdrJUifx9Z8VZO0T4hsq1fAGXU+ow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Obg+DasV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Obg+DasV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so53660635e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745932087; x=1746536887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8R6FT1oxQXzrDZcdreVJobT+CqIzoRZsPEzY7WO80w=;
        b=Obg+DasVn7dqcAbo7mWqRV66QzFxEalFH5Ncf6S2M6NG3lqlC+KgTes17Q9L2X648v
         z7bjLtzl8M5JUyAvRGXROezFXS4ny1K4uSZ6o2ZgKs/QUVh0qnKR13q4Z6qWEBtIqp7X
         dI9tikUt+psg4vmJ1DmWckq/EKF5EFUfulwkBta6dfp7Y3A9n4bQFB+azjteOSgcltwJ
         hSSf7zTa9ASsys3+0DIfQo1GzQtkquFwiR1iNPjJ3PWKK6uYTkHMpQgMe/11XMTQxqGf
         72JP7A3+R6BR3D33NX4BdEQ6jJ1Us+RM6JYQXOm63MBBrtGAE0sVQU3ab6RikyXOmrM4
         MCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932087; x=1746536887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8R6FT1oxQXzrDZcdreVJobT+CqIzoRZsPEzY7WO80w=;
        b=AcAwBXut96wv9izzDAjNERtERBPhQ7UnslxxdZhe4Ot2kIYFu3eJFpecsDFY+wtgDC
         ST16/T+RJm9Zardv0nF6CACuPidH1koLlxHPUeWw1kIkeK2ddQpCp1MJf8KxEMUho1an
         s97aDEIMZdIfCo0Q/jM0Y8oaC1il8TVlW4r3HahBNUHhu1w2Ul9C9bKwW0MoLUA9SF8j
         wMwdRM+jYBv7C/LEgsqIwQa0rT6J2CgD5Aoz/3/FjxZu6f9GBjIE8qdZTk536nOjtM0v
         VgbpDY4bvE+2eqTMxFSTTN2ucD3hUhvNer0V4Qqs+d92JI+rdGgPdBww8oaeeByW0Vhd
         dYew==
X-Forwarded-Encrypted: i=1; AJvYcCW74esf7m3L52TEVfyiqMDs77S5wCR2j570yqAonnGYSDxGokkXbKHByoPR7SZ1+orxMHQPovAB2bv8pj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YylA5rrIB9Tf+DwnUHLCEkz2yEoe9jbCbMmkeZB3cW4TzX1bYrQ
	dg3auk7n9IgSGg3mgiKiFgsMZJZodX2xFMHZTkppnl8d+T9poD4ioqm0I+81iDM=
X-Gm-Gg: ASbGnct1LlwhBSuALIBwY5LEh/ySq/mlaWOQS3jQGaTHZon35UVRQjm8KO8sxRfguej
	uGK1vj6sEUv8uD0mknqryEhz5opq7kHMLP0lpIlXLcaha8fUHhgpAZjm34UagyxZsiHLs8r/dV/
	Rr8UPmUiCLfca+bcWYDcppzwGa/HXkSgdcStL6biHQ4jRfCbv6LIqdGYQbnXW9h3ns9/M1bVXqR
	JIPZu89oc61/TEF/dyGM1GdLaMrnfRoO+eedihGr1+8HtdvjEjvWgD4+PCCfJVRU/uFqBpFvfN6
	gPsH2dci4u//aViajJGyBzd0TxAby+DAhh+yUjSTtlUosBAVBNrvbqVaeiey8/FO/X2yncmczSy
	+2tecZgkOYF2x
X-Google-Smtp-Source: AGHT+IEtku98x9HGlishYck3lT1JS2udDr9PjtAJq4TGkcmL0aByUaNhPb4M+Ekj7jdhcNEmDmJnHQ==
X-Received: by 2002:a05:600c:1c18:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-441ac8ce1abmr29753305e9.7.1745932087329;
        Tue, 29 Apr 2025 06:08:07 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm155550565e9.21.2025.04.29.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:08:06 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 29 Apr 2025 15:06:48 +0200
Subject: [PATCH 4/5] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-wip-bl-ad7606-calibration-v1-4-eb4d4821b172@baylibre.com>
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
In-Reply-To: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=WQzJ5n70BF+PZdPHAwkyXb1KZDyvBmnjpW4OFJADjjo=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgQOPdC6XZ99AvRBzWTawPnyAmp9XfMuLXro3mYWOYFx
 epTxc97O0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAEzEXISR4ZTcf/Zr4tfe3LyV
 WJBwTV/u0MTt+59NPpUXu3zjK087iUsM/xOrK6MVw+YrPf0ernbn5pld1YbOioeelQiXXOX5Vnx
 8Jj8A
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add gain calibration support by a per-channel resistor value.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 29f12d650442b8ff2eb455306ce59a0e87867ddd..df30545fb52c89a814257443183303775a06a7f2 100644
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
+        maximum: 65536
+
     required:
       - reg
       - bipolar
@@ -271,6 +280,10 @@ allOf:
     then:
       properties:
         adi,sw-mode: false
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            adi,rfilter-ohms: false
     else:
       properties:
         pwms:
@@ -398,6 +411,7 @@ examples:
                 reg = <8>;
                 diff-channels = <8 8>;
                 bipolar;
+                adi,rfilter-ohms = <2048>;
             };
 
         };

-- 
2.49.0

