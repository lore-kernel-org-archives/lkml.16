Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9768F2BF017
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019648; cv=none; b=ZdDAMquz5xjPDhoKTSnMcWU1xtOT51SujcNp+MltAG0dtX8tFJdWa+NX1bISvg/zN1NegxCfNQYsJGqqJfOcvDXUkyILebY5k289uJRYC2Yzz01UG3BxpFXGaIC6gN4QvDfL7fKRheezakB7fnfOP0nQNFRvOfpzHorZAld0ttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019648; c=relaxed/simple;
	bh=pC0l6WHANk7+BDn4DSC1TDZ/W9QIUe5+pxJCXm1fLz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q91pyyYmX9pliNFRClO4xIbYCN8tiHh/nZMyWfKtuxHe5nmQUOSGHwYk8lXNlT8P/b9WBK2k5l7ElWejY+dmcl01FbYlKFsHn/gHHCfybncnSGGyCKZhLdLwqhdn2sxWvFG7I0KMdYdif0lQU6exvndWIjYyDrHqSq7wzE4+/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=VQNmMWZH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="VQNmMWZH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1300190f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751019645; x=1751624445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aq559hpnsPALC3Gw2Iq/fQPfs7dODjMgP+m9Jus9x+s=;
        b=VQNmMWZHVzeL0mVBpx7BRB9YshokMKuy5XmYkd55pfjczrubIUPxxnHeuKFXl79lSK
         lu8jflTmGa6NQ8lVbGsXmQ+PDwQ2wLrVBvzF/6SxfoOC83hODDMetVCFpW96VPAFMQ0b
         0xE1RSRwVmmuTLrWYLXTuw+5aSLbeOYfDe8SSGGdJpj53QvRyVFyrzP6NGfXH2xwckUC
         0l0to+teDyDtcvueK3WkukSoM/Mmc04amEZRkWrbdWIDKU+zlMFYQF9QEfzummMDItNU
         Xpr79f4H9Q/6sa7EbJ9tvNPDxPzKifNmlM5ceVJ8DAc6NSSVKUPElpP0G/PXjpq6nbRf
         VImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019645; x=1751624445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aq559hpnsPALC3Gw2Iq/fQPfs7dODjMgP+m9Jus9x+s=;
        b=PkNOPU2ioRp9q9Negau2u0OoegYG1xSbxcxqGFBCHCuBzuFMzBngFkfXxGVeoo4SXj
         M5XXc/iL0tzSClwCkB69f+WGmagAVp4zqTk3bfZ9AgATZV3WaZJrR8ImA4JwqNarpaU7
         8i3kJOipg8baUBtizviDYiDS7R6vC1q/oZj9rlRSKiyXjv+vE5cMuJ6Yvkr/8PDZ7KMv
         FaiKGkzW2JvljVjn7qFwEI+aJLFdM6VxCOlf8lcE9UJ1Rp+qU58b1ksqG0O4WK3swmdO
         oKdv+3zHh3dUu7eMSMwqmO2v70ZvgxG8FXQaPLF0smNZtB5POvfGFfSFv2AmE7ugrrQd
         YtwA==
X-Forwarded-Encrypted: i=1; AJvYcCUuOLoelrCsPYUSBsQY+yuRsReqQLDl4v9zMQVyrz0piZzdvVnE7YMiy5IZe32HK7LITtWTL8REkKZW0b4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8dCu2wKgOd1Y8hpSHq4J9dPG0TzbOeHo3AOklen5rYOogo6hK
	BZwlOkFUirA3lw3aC7GTYEO0CSR3KZQvBRhyBSHbj6niYPZBZvYR5YVOtcR/HmEmk8o=
X-Gm-Gg: ASbGncuQ5G4Zrc5IcWZKa1AUuZoGlzkKV483dFaifFTAzOu+EQvIsWJlqpEROGff9Cb
	Ko5HMYnk0WYEAj3/8u06E0JwKKyfcvq9LKLF+qGBusqodOYtpBNYSvXEbIUH+wwdtrDNei8PVR2
	4BvKN92QFn0Axj1M6ELfgJW1G4N2AYkmEawlLQZQ0ZxVgeT/IZXfOCbLcvZB+937U3UdUpak2M2
	rpOs/AhZjdYRCc2dg91ox8SGxrHnDcyYhNuXdoWxN1Km0mbpTlAgJaeIH6toqNq2Q3ZwFy/LntP
	gEuXfdhNE0wlAe2qu49DM9y+gpzWPaTTBYV8foaS6VMiVzUUpyvzy6Sl/voF9vK496QKy01Ygb6
	O4wTqYWOZPV3VJw==
X-Google-Smtp-Source: AGHT+IF6vUJQw7zfzcWiAUbOQNcZ/wL7goXlO+7umDbwfPrBooPMhK6yAVqjRPepYyvldjekGiZ3iQ==
X-Received: by 2002:a05:6000:430e:b0:3a5:7895:7f6b with SMTP id ffacd0b85a97d-3a980296d2amr2004224f8f.7.1751019644761;
        Fri, 27 Jun 2025 03:20:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:1a4a:198c:c191:f3d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm2331700f8f.12.2025.06.27.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:20:44 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 27 Jun 2025 11:20:37 +0100
Subject: [PATCH v2 3/3] dt-bindings: leds: is31fl3236: add issi,22kHz-pwm
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-leds-is31fl3236a-v2-3-f6ef7495ce65@thegoodpenguin.co.uk>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
In-Reply-To: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751019641; l=1100;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=pC0l6WHANk7+BDn4DSC1TDZ/W9QIUe5+pxJCXm1fLz0=;
 b=37L+LM2vw4vz1KW53lZHMXE5vyMJwCaux/OoJrnYWkR7OK4MA9KkFhQrj9SsHiTziBPHg7JRi
 q2gGD9QZRBPCM5BpWv8kpMgb391bih/Sc/uIMZG4H4jlPafGui/Ckxd
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

Add an additional and optional control property for setting
the output PWM frequency to 22kHz. The default is 3kHz and
this option puts the operational frequency outside of the
audible range.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
index f26340850647d1c642fb345b7cf90764200e13ee..cea93f4d8fe0bcc80d6932be1f346bad321bcd38 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
@@ -42,6 +42,12 @@ properties:
   "#size-cells":
     const: 0
 
+  issi,22kHz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
 patternProperties:
   "^led@[1-9][0-9]*$":
     type: object

-- 
2.48.1

