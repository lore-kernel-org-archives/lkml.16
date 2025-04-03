Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8B200B99
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707793; cv=none; b=l2G++nZ8wx1TNMoAU5/idmj1sFfY+Lj1yNRYHkg6mrCowMc0voL5fvI9tx6HuOmGLUOrK7AKYQyJHBSXI5rIGTE0K4ikMITXGrJus/xvCeZL/w8wWyp8YiosSa1zLBhRshREyGY519Tip+HO4zjaJNCfdXzxAGnPUoyuK0ZmI/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707793; c=relaxed/simple;
	bh=rQ2v20Ddln+4BwZ1YiM0h0pDo1Qau2cCuH+bpTFZT9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WxTi+ql8NmyIm3qMJbELhI4C976Lf9D64VpsT03uOjK2ZtuUN6zpOhqK+gpC8tINZ0lRMdnfeuDC06HNR9lCZAJFdG9To8EOtDWCNdLXQljKwnySnLIKeatCNQ7wcyDYsO5gfT9rBrEocf8rHL14utCsIhb/eH9o29RUV9AR8+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dA+tqKgx; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dA+tqKgx"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54298ec925bso1981526e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707788; x=1744312588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTsIlDstX0o+Mbqya+IkMyfr6mBLbjzx0t4rQvZShfQ=;
        b=dA+tqKgxMEyaBrWTZ+T7TXv+rs/eoD44/x4t7aWao13O3Gd7wAUFM4j25zZwpfUHFu
         ZQXUUs0mPlvA5pz1LwM3Ua+rHXzFoZH4XJ2e1gHhsQ7izxa1P3QgR3MdVLokoebMRP0f
         vCvsIUMwhvQWEHM5tPZl/sRAGTwB51FeYmlvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707788; x=1744312588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTsIlDstX0o+Mbqya+IkMyfr6mBLbjzx0t4rQvZShfQ=;
        b=nN4H6qhN4ILLRMCC7BaLxZoAvOUUvskPIz2UnfektFvycsSc23TzvFSp8k1eOUC0gO
         hxjEmGgYBG9cdsFspQ1veCM7opG3SfS9LmIuzYt3G1eTgXB6vcK9PMZSENNLbsHe64Gd
         kNeSC4mBRyD/kWGSY+9PlyVWJS2jlkMDGdrScKt/tHISs4fRiTHeuf1zJD+fx5D4aUdK
         bGwxx54/voUsvtAurX4QwGWiYc+e9LU8n3S7jU9085HAb9UOW0hrD7FchXlo2RPIvBUs
         etx6lbo83Lq0OTOsiHFiLI/ffquY5HOqr6AxTSJUoiZLmpp3ZQKl7wt5EkP1QhRGMclZ
         mRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUucOjQLPVVoV7x8gm1TMY7sGfnAJ1K6hoWmjBW7LogJb7hKSMrzwqcfi71tvhQiHzzAzcpl4Km0gR2aJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4O7Zer871Fwx3w01E6JRH3UK8aeFVgbe0wFX6aMZpi687FTXL
	L+Ft80KezCr5X55WoD4+KI0jfem20v7O7o21p/xUSM0m2EGg8lkUFJdSNvI22Q==
X-Gm-Gg: ASbGncvBQuJoHrUKXYmlDb5F85cfWGeDKEVi4s3y1UHI2UaiVlh3XSYBrM1Z3ag/bqE
	TdK7c5ySGjDiKToZsnfykG42420AQKVPTp7dwe9+N+bw9GvJs/4LywEsX7t7SwVHwXOy22eykEP
	SS0OF4X12XbCVbA7ohUqt6uVTRyQpWKM+LWXwhdEvJMV80gt0X76+AbT3ykN9Rr6nc20RK2QdQ7
	UslHXksPF7y32dQ8C9ZstoUo5SgHsiYxIY6O3fbeGWKxFB6xMcufDawi5LTECaXgYv4clgxmppU
	UUeZW1wvUTbrsJim04Ve88knhY+5529NC7iTCL0KMo3qa7xy8XBcX9ar+l/Q8mZPxpVlpTqwuF4
	cyRl9M+pw0vQMc1rAP7Qsz1S8
X-Google-Smtp-Source: AGHT+IHCXI3V2p507FEESs4oxanJZZsNHxyB6fAQHEoPMaOLxvmQtP8ckbT8u/hI65VR8pFcvY0x2A==
X-Received: by 2002:a05:6512:2253:b0:549:7c13:e88f with SMTP id 2adb3069b0e04-54c22795803mr113406e87.30.1743707787714;
        Thu, 03 Apr 2025 12:16:27 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:16 +0000
Subject: [PATCH 5/8] dt-bindings: usb: usb-device: Add orientation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-5-1a0cc595a62d@chromium.org>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
In-Reply-To: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

For some devices, such as cameras, the OS needs to know where they are
mounted.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar property for video-interface-devices called
orientation:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add a new property orientation for usb-devices that matches the already
existing orientation property of video-interface-devices.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6e71a11910c565b6f805470782e4f..bbcda28ec7d5695307efa797f57180044afda77f 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -42,6 +42,10 @@ properties:
       port to which this device is attached. The range is 1-255.
     maxItems: 1
 
+  orientation:
+    description: If present, specifies the orientation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
+
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
       should be 2 for device nodes with interface nodes.
@@ -101,6 +105,7 @@ examples:
         device@2 {
             compatible = "usb123,4567";
             reg = <2>;
+            orientation = <0>;
         };
 
         device@3 {

-- 
2.49.0.504.g3bcea36a83-goog

