Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA127A935
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145992; cv=none; b=YnKWG6BonaE+QVe9b28jDvxK8ER34VS1NLPwN0zKHyqGxyR7HJbM/EibMRQ3qUSr4FkF0/LkTnYt95eh08ucr5f04Ux08XqDbN4tPh5q3/YcrmCiy5mSelfUoOvUhecBuhvEBpcCdmSXHxS2+oI+u+3l3kTnWC+/tvENweZkwmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145992; c=relaxed/simple;
	bh=NngJ6Yx0t8C9t8P4XXbFrpgjfgvwAkcfBnBpT4lxGFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqBmuMmLpG/paEOLzCB5PqgLIh4XP0Wux5t/1asCgM/OH/4NaozchkK9oAkOpa7HZaKqbAkczAYNbnpvLw1CbBWAA2rJ4GBcOhgI/pD5gDbJfbzZu+NPvakxSdEj6+ebs/nE0l6a1klHazAT67HFGApw3yCahz2tM8n5c+Jue6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1VnEq3T; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1VnEq3T"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so1309723e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145986; x=1749750786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar8+oEy28CepxnVsr2jEiRDXTfDok/weLPLs5Z9kVHA=;
        b=I1VnEq3T8ddqhvoQ5NQEukgf98kgl7JFV0+hJFR08RpOZNJJecr1c0dpbMFgc2cV05
         0qvwE/NiO1qE7Mp+j7Wh7nVnDoL2Ul0nM8dMnVCvPQiR8V5swuaCtKPfusjdb1M3GaMR
         wlX1GOuM584IpO1TFQgHjYERmMzoyas7NAhKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145986; x=1749750786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar8+oEy28CepxnVsr2jEiRDXTfDok/weLPLs5Z9kVHA=;
        b=VsA52h+XCQj/sivnYvMaePM5AH2+6uPS78xU7I+2J0uq4HG5jDMyxVBhnPAOic/SeD
         3D5NrygJxP5L+X9plBNWlp3voGclzyue0xDSXzPb5W8TdGTsMZw/Z2MPjUmxdIkBZJf1
         XGVvYCUm6wNcnGRYkmstopKk+WEG0nMlN8TccZGSfjV7REY3hxZyzGeI7D+K44LvkHXn
         CsKBOaLd7yIhhn9+B3z3YDbFyJ0SmTabyjyAPVoEANBkIkHIWgce1sN0h2JxjrrWK4O/
         WQMiId5LWeHyWg2pzaOg7rcUzBCgvBYzeQQdGZiBkQ9QhvKbAbsTxPXliqIIbEJXbSM1
         ZLLA==
X-Forwarded-Encrypted: i=1; AJvYcCXi6rjCwlo+DzH8LSliv3tpwlzGidEOPboQ0N8G61MikLrZjnehOivPZzd6vBPBgH+I9tUkhmpdSlGKBlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJryzX9wgpALNUmhc6gf48+114qQn+0ouKpIaDIK0uBfooQJG
	1xdOQXKRmculBPUe4WfRVBNXH4A9NvlSs48EM5xBNu4TxI8pJGFv4papbjMg+JSSqv4MdqnNQsd
	Rs9E=
X-Gm-Gg: ASbGnct9JDYgD6KGW6xQkC94mqX/pAqYDi+cUTKQ+QC1Kra32lXWDGMofv5LOeapfI4
	syWTmoKqy3nAAf5yUumPDd/9kefw4kvRFvKljerJfK3BRXn6BqDgMsRx1ScPKxlNOqqKcY6PssU
	8ul6dbwdXeQUZhU7lqqdztZNgikjHxg8a85mBvtKs0GW0cgpKN3hGaVYLCXx4Y4H/ZQKEUi0c3w
	7DQ7NEcp6XCa/qlRHC6c4bHRQqB+agkL5QLaodAXO5D30HP2uaPcuQ7KtLlHHvv52XGvvEI/KMs
	V6qGlDcw9YV7gL46TQHAlki0NzApJNS4sIJAqa7LgIrLNj9YopOixniANsxHBFogQIbVvjwogbr
	n2KdGsUXtmeV2wJtz8SD5SfQ3wn/y7vLGPxKr
X-Google-Smtp-Source: AGHT+IGuo9eAuj3/ZulUgVYVuEINR6TV4aJnWcXikBTGTDNlZ8YqpVl3rERmqVeHdcMBB1locGc5IA==
X-Received: by 2002:a05:6512:2242:b0:553:3892:5ec3 with SMTP id 2adb3069b0e04-55366c354f4mr16249e87.46.1749145985864;
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:59 +0000
Subject: [PATCH v2 06/12] dt-bindings: usb: usb-device: Add orientation and
 rotation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-6-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

For some devices, such as cameras, the OS needs to know where they are
mounted.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar properties for video-interface-devices called
orientation and rotation:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add rotation and orientation for usb-devices that matches the already
existing properties of video-interface-devices.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index c676956810331b81f11f3624340fc3e612c98315..a44eb24c657993f88145377a4706ec419b6cd998 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -44,6 +44,14 @@ properties:
       - minimum: 1
         maximum: 255
 
+  orientation:
+    description: If present, specifies the orientation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
+
+  rotation:
+    description: If present, specifies the rotation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/rotation
+
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
       should be 2 for device nodes with interface nodes.
@@ -103,6 +111,8 @@ examples:
         device@2 {
             compatible = "usb123,4567";
             reg = <2>;
+            orientation = <0>;
+            rotation = <90>;
         };
 
         device@3 {

-- 
2.50.0.rc0.642.g800a2b2222-goog

