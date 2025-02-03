Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27FF1FE470;
	Mon,  3 Feb 2025 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583115; cv=none; b=WjmaF4egO49A7NsuPSRG0pzM6oIaRoy9D+XL4EKxCkRhlrzJ+IAORAuXhCNPGOICt1o7fRDgyxex8rIj6thg5LdFrTOfZm/CVpdU/hbp3FBA9Zh9KpuFh27SmUZImiC/mxIlLpqAcRli7j5RnU5O9460TV6EYHyQplndaX+SO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583115; c=relaxed/simple;
	bh=Xv/IvcTb6EDLOIXRTfoQ1wIHxjilUWznCaYG6P2I/gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHl5E3VbXfCOnLn+3KF2VBOWu0fq/Qu/kk+lGfw14I4c7TNNLZVfSN7rKFL7UgKzFDGRfTmYdMNBvEzSjv5OTQmj66dwBcm5ihM1e0cwmBKILWs7daGqO50n17Ssz42qAjT9Fc2dlYzsN7VL3cH9OZO9wRkytJgNlQeeLp4VPpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COttmaMk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COttmaMk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee46851b5eso5407789a91.1;
        Mon, 03 Feb 2025 03:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583113; x=1739187913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j94Yf4ZljPIn55Egi5iO8+J8Nze+hzJTmB3wDQVymRc=;
        b=COttmaMkUE55kL8mnF03/XrXwWc+/t1nQiyXW7PW2VMcOZHy9QeQsJLZJhv5EDpvJr
         jlltABgkUg4eISElayfuFXw6MgrT75qPcLuSeOQ/PGicsQkuhtMwWFMy3qWbgNZNkyod
         wu26Czddg7VuPFhLUEgbQbyMUHLn6cCXmCi9fZvcqCt6bERG98HxKsHTh4hZvnYS+WNL
         Kc+1eiRVNGlVjN0Ra2/cf8TQlHzqcVbWgNP0qt0KQv+Kl7vOM8PMT35wdQ/0tm8hxrgP
         PCF7z+CmH0LQ3jAMIYXkvCpPdA5c8I14Vi17gISArDDuj7PUBiaukgNEBrxnJzdfIINZ
         9Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583113; x=1739187913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j94Yf4ZljPIn55Egi5iO8+J8Nze+hzJTmB3wDQVymRc=;
        b=LOBh7HpEFi7f+KzPb/YBaqsMWZHnKtkCAB0EOEuRShVx5XurvdA/JbN19eKH5seJox
         ojj5E6/cOfOQSpCgVcW2EvuGdeaCgegrv1x7s04Z4ckNmEtbaN2Gm9BpKF17eCEFS5ae
         8FAc2UweU8x9imtIUI05d+yPnTQYSCv1UQn+4PB2ixNmpVjBNofj+L86/4mvc3qHU+Km
         MJNpCrVuxYuxunT47WZMXbUYaYHJEOpszPSzMLKXmHem07BBFLjUHHjfVuR6XJcpROvb
         kJUWgHI2KV0AFwHAi1tlfgrbDMOcLOaDKOR6U4waKL0XZXB+HrRFBdaDxIgNldXytGa/
         D3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK8qmkJ7LwzlP+byL5PicjH7C+GvRs8B+0PCSG96wdrolMy60armgtX63IbQYa94NeIKEC3LZ48Zmt@vger.kernel.org, AJvYcCXmQpggZhNWV487eaMShOZCMGNkG94RuRlZQ0D0hMPM4lZSjDWo7Ek6Q4CqHsFKGmCpZXLzX4hyAeDdOU26@vger.kernel.org
X-Gm-Message-State: AOJu0YzZT2xZ2/0tGMeDc9f+CAcQvfGhSWZAdYvWjxam8qTbIuwY11lH
	YFNQZ5FRhOpJSYuI4ythxvXw5A9BZJEE7rYR/J0twnlr5Wa4rRhq
X-Gm-Gg: ASbGncuIJtmrvKw6iH444Ez4S3rBZEwfgSCBn97taBmUWT2tkAUGWn9f71VqUK9m8rb
	zgTlfJYycG47bGwiU1xDv+v9bwqzHyxQ/Nd0brjYJlqN02oIlFyz603iWg/Q55KX74OZDle72hG
	SdAv+kRhFqukuRUD3PLIQQZM7p/jmZdd/eopKfv5PUoTHN4BZi0nh8NPqgLb/yAAiTZQckQahzx
	yN0CpPFCdwxZJ0BYJkNfy/YYfNnDHvzyE+roIpAF8jLvdvU7ye37FqBAVUTedngyBgQLMaZubZp
	H5ZuqURDzK7Rf3CU
X-Google-Smtp-Source: AGHT+IFnveO9s5+KK6gY4LWAb4g+uJSFbjRZNtLOZaf363lRPvUyR79U3NW2XRf8Dv4Bb1w/KxOYGQ==
X-Received: by 2002:a17:90a:c2c7:b0:2ef:33a4:ae6e with SMTP id 98e67ed59e1d1-2f83abd996dmr37969938a91.12.1738583112982;
        Mon, 03 Feb 2025 03:45:12 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm9712490a91.3.2025.02.03.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:45:12 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 RESEND 1/2] dt-bindings: arm: apple: Add T2 devices
Date: Mon,  3 Feb 2025 19:42:52 +0800
Message-ID: <20250203114417.16453-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
References: <20250203114417.16453-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the following apple,t8012 based platforms:

- Apple T2 MacBookPro15,2 (j132)
- Apple T2 iMacPro1,1 (j137)
- Apple T2 MacBookAir8,2 (j140a)
- Apple T2 MacBookAir8,1 (j140k)
- Apple T2 MacBookPro16,1 (j152f)
- Apple T2 MacPro7,1 (j160)
- Apple T2 Macmini8,1 (j174)
- Apple T2 iMac20,1 (j185)
- Apple T2 iMac20,2 (j185f)
- Apple T2 MacBookPro15,4 (j213)
- Apple T2 MacBookPro16,2 (j214k)
- Apple T2 MacBookPro16,4 (j215)
- Apple T2 MacBookPro16,3 (j223)
- Apple T2 MacBookAir9,1 (j230k)
- Apple T2 MacBookPro15,1 (j680)
- Apple T2 MacBookPro15,3 (j780)

These devices have no offical names, the naming scheme is from
libirecovery.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/arm/apple.yaml        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index dc9aab19ff11..da60e9de1cfb 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -57,6 +57,25 @@ description: |
   - iPad Pro (2nd Generation) (10.5 Inch)
   - iPad Pro (2nd Generation) (12.9 Inch)
 
+  Devices based on the "T2" SoC:
+
+  - Apple T2 MacBookPro15,2 (j132)
+  - Apple T2 iMacPro1,1 (j137)
+  - Apple T2 MacBookAir8,2 (j140a)
+  - Apple T2 MacBookAir8,1 (j140k)
+  - Apple T2 MacBookPro16,1 (j152f)
+  - Apple T2 MacPro7,1 (j160)
+  - Apple T2 Macmini8,1 (j174)
+  - Apple T2 iMac20,1 (j185)
+  - Apple T2 iMac20,2 (j185f)
+  - Apple T2 MacBookPro15,4 (j213)
+  - Apple T2 MacBookPro16,2 (j214k)
+  - Apple T2 MacBookPro16,4 (j215)
+  - Apple T2 MacBookPro16,3 (j223)
+  - Apple T2 MacBookAir9,1 (j230k)
+  - Apple T2 MacBookPro15,1 (j680)
+  - Apple T2 MacBookPro15,3 (j780)
+
   Devices based on the "A11" SoC:
 
   - iPhone 8
@@ -211,6 +230,28 @@ properties:
           - const: apple,t8011
           - const: apple,arm-platform
 
+      - description: Apple T2 SoC based platforms
+        items:
+          - enum:
+              - apple,j132  # Apple T2 MacBookPro15,2 (j132)
+              - apple,j137  # Apple T2 iMacPro1,1 (j137)
+              - apple,j140a # Apple T2 MacBookAir8,2 (j140a)
+              - apple,j140k # Apple T2 MacBookAir8,1 (j140k)
+              - apple,j152f # Apple T2 MacBookPro16,1 (j152f)
+              - apple,j160  # Apple T2 MacPro7,1 (j160)
+              - apple,j174  # Apple T2 Macmini8,1 (j174)
+              - apple,j185  # Apple T2 iMac20,1 (j185)
+              - apple,j185f # Apple T2 iMac20,2 (j185f)
+              - apple,j213  # Apple T2 MacBookPro15,4 (j213)
+              - apple,j214k # Apple T2 MacBookPro16,2 (j214k)
+              - apple,j215  # Apple T2 MacBookPro16,4 (j215)
+              - apple,j223  # Apple T2 MacBookPro16,3 (j223)
+              - apple,j230k # Apple T2 MacBookAir9,1 (j230k)
+              - apple,j680  # Apple T2 MacBookPro15,1 (j680)
+              - apple,j780  # Apple T2 MacBookPro15,3 (j780)
+          - const: apple,t8012
+          - const: apple,arm-platform
+
       - description: Apple A11 SoC based platforms
         items:
           - enum:
-- 
2.48.1

