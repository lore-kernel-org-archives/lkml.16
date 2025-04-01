Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93BC218ADD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547839; cv=none; b=Y2P+hcMgqthcQyEoLmAI4DhvSaPizjQ78BHJJuotGhvPU6TGCuvzSwcKRjAl5cx2Ci6raFwhx1gVI2ROKV4T7VCr1u5BCtgN/9YOTKLTTX/RZiE9aA9lJx8Q7acEswb930ERn4ogI+4ZwVpkfLCIGJy33HVUqUYwVscKu/8cUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547839; c=relaxed/simple;
	bh=wllrbZcObwGAw2NDOjEh96guXeIJUG4ySHs9Mzrn5qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhymJb5Zat0GNwUjMlVmt0tlkA2YTezmgCObkO5LOpA5nnPMr9lXwgAVi3I3J7SoYeT5qRWbRxQhKHpy4xIaHjdOTL+CywIHDm+JZf1upIktjmt6q/GyB98gBtDtkOlUKoVc3h5WLWiYYic3JLeE1zQF6IoZECcLID5iBuLSGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bCuzmVoc; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bCuzmVoc"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c019869eeso2083323a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547837; x=1744152637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uY3LwKeQSjqjV8tkE42G4HURVFmjP7EU20VDalM/2sI=;
        b=bCuzmVocI9E3Eq/hhATmFlmERpucWHnxqY0UqiM/EG3dxoeB6UkKqDekxdcgg0ljDR
         3DikBxW7Ksh6ThBFM1OB16YeoR9E56SWFvOAHplXc13TmbswXBAK3Vld3yvJmvFzi44y
         EzPJf5QDBFxAL9aow0WhDODRlVWuPjo0hJYlESat9yIed6MOIP6lPOrx3Lv2wQAtBnKp
         2DGZ6cARoog9yxTOA+IcIdcf73p1UAbA6NDJSBiZZlDM88Pre64CRtqxvk5VZvb0NTtN
         GQbQcu+hUGJtM9TLZMKP4WxIWpIiK7bHV/Nzr/KO+8ekyYdNU3k3w33JUzlz33PPfGaU
         lnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547837; x=1744152637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uY3LwKeQSjqjV8tkE42G4HURVFmjP7EU20VDalM/2sI=;
        b=QT1F5roEulanPskRX4mhLMw8U4mO0YlW9CSFHCP0xSyrtGca3Hk/819+JxonK/Sf54
         ldd6p/mXH6pPyaWR5YhVU23t5J3qkAUhIgwWLKU3Pmoti3eXKIzUeNvqTiLWU1LJDlXE
         u+GWKZVD4yIvxnpJpU7FgmeDpzX9O9HOj9mVHZzsJLsl/4jw5fyTqnEpYuEtWSpESCbA
         DfAiIhQvgSgYjeDtk8nm/FX63vqFs843oneVq5KmYhr0Ndo/ebinrxHihALx6vSaAbiI
         Bkoke0ZCpt0TJpxZVVaqChJ180PTklkKUtTaC9FJu4tQl2SEe829IaccywaBOPV5LtfG
         tVTw==
X-Forwarded-Encrypted: i=1; AJvYcCXZdarNGl/wIYw0RESZ9Nnt3M1Txk6eySec/zTgw89QIBldhWaGaw3Fa45H4ek8IVgaxGbHVTO8M6R24/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yj7DCAxC1mD0HwC2moJ4snUyHMEFP164ofTSlIGtdwZmYEET
	P6oOANFjLZVeF0Ftg0pN+2j8XNScZJ8kD36nzz/vwEO0BtHvlL+br+lVteeY1wY=
X-Gm-Gg: ASbGncusWLJN6Mu8bjmpGyU3sPT5Qefqndu7se8pJw/1Nql6gjR8QeISJcDIB63ly+s
	6lHGu6lbcRJtCpyvIEiOInDDXfUWKFFlgvcfkA7qaVYriLroK3699e9zeqEEqp7geZkwCv55zmj
	uVFoT378tz7NFDJaRrlAHWHIdHoRStdaofqkZCJAkL6dDAEHWSHqbffWxQZj8ekUdj8BJQWEWuI
	pfOLCaPIl+ifHq7gH+LkkpCS3RMkJd4/eY2noyY036xW24GVAjRtgCcupF3e3jVtwyrwwWN0npn
	sAo39GQ0mEfL7p/pJWy6+4loTdsP64z4Emq0ordHwJzycwJA3xewfCqLBy0Dpms09uCaWh7VYBU
	l
X-Google-Smtp-Source: AGHT+IFDp0AhTF61Q48nqN3yJ3kD3UvIIm3ZCEgDN5dT9w+U8dAZ7ndt8F2LawR99JrCPDj14Qxqeg==
X-Received: by 2002:a05:6870:6110:b0:2c1:4e25:e67d with SMTP id 586e51a60fabf-2cc3822a497mr2416377fac.24.1743547836885;
        Tue, 01 Apr 2025 15:50:36 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:35 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Apr 2025 17:50:08 -0500
Subject: [PATCH 1/5] dt-bindings: iio: adc: ad7380: add AD7389-4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-1-23d2568aa24f@baylibre.com>
References: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
In-Reply-To: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=wllrbZcObwGAw2NDOjEh96guXeIJUG4ySHs9Mzrn5qQ=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G236w79skU8tariQuUPZDNW+cVxj4WjqBK51
 SAIlOIvdJuJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xttxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fAMwMg/9Edgch9EspXTEYY+1JOhAYpgOz7/utZQkuEugP1+
 WwGFOvvz3YncY1JSOHxF1TmFSzva8wuhTzJIBcQegux/n4r3/3sx89zqemdZXUhd/HGu8C9lxg8
 kUbW+hr48TcPubsoCH43NMmedD028osLHS8r9Dn70MpvCOT/rGmsCMHQjgXGKoPNeXVOmQFH2rq
 tOntr5Uy0Tq0QFnTUKh/WhqEiBcN8m0pp8QtHn5/b6sOkTI/2iPNFeK8TSDl2NpYZlmyqFVaHHI
 7I/FDCdm7li0ksgc80/NcF686dsh2fDXTjcKJMaB0kawSXWMl1K7GfSTQJQYOxHmEr8cI1ZEKNu
 s66jwGniuIFVo/+oBarBcXjMtCCB5ZNvuRTHWRn4D5Ivi37y2fYK8qgWAyT4SxFdobT4VYXRj2M
 KtMSMoJ+F3xE9zTBbwX0kYduwfQbwjFp+X82PdGbmYXXaSOnzx5glS94Z/eLVeYRPd1FOfbQoup
 v7319GkkzQm6ZTd9q8yVn56dIHnPdNIFxQr9HtuQRhibTIYIoprOtFokmkDy0rWIvzDAIqfrX7w
 4Dj3CNXlRjX1rG9wDsF1o+l3WZBeOH+ArChguo4PrOzybCsf0abvL5HIpNuQQ8QH8x6cWpKVUj1
 LL+QynRMc1Sm7ulcHfPuGhzaiN71DRyd5rt17XvlyhKw=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add compatible and quirks for AD7389-4. This is essentially the same as
AD7380-4 but instead of having no internal reference, it has no external
reference voltage supply.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
index ff4f5c21c5482b77ee2774b01ad6d426e68cf207..8dae89ecb64d723dcf2b4af1e0505fc5db49595b 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
@@ -25,6 +25,7 @@ description: |
   * https://www.analog.com/en/products/ad7386-4.html
   * https://www.analog.com/en/products/ad7387-4.html
   * https://www.analog.com/en/products/ad7388-4.html
+  * https://www.analog.com/en/products/ad7389-4.html
   * https://www.analog.com/en/products/adaq4370-4.html
   * https://www.analog.com/en/products/adaq4380-4.html
   * https://www.analog.com/en/products/adaq4381-4.html
@@ -49,6 +50,7 @@ properties:
       - adi,ad7386-4
       - adi,ad7387-4
       - adi,ad7388-4
+      - adi,ad7389-4
       - adi,adaq4370-4
       - adi,adaq4380-4
       - adi,adaq4381-4
@@ -213,6 +215,15 @@ allOf:
       properties:
         refin-supply: false
 
+  # adi,ad7389-4 is internal reference only
+  - if:
+      properties:
+        compatible:
+          const: adi,ad7389-4
+    then:
+      properties:
+        refio-supply: false
+
   # adaq devices need more supplies and using channel to declare gain property
   # only applies to adaq devices
   - if:

-- 
2.43.0

