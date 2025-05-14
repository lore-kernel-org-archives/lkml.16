Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF15279329
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227109; cv=none; b=DEh47ZON6lf0lU32dgco+T6Yxtq3wv1ApAFwx7KeB+6V+dKMM7bbg68L7Rq1mIWYldUuyCOoTrBAZ8zzkxUweNWLndq7DQWqJ/WpGbawKLU6uACmjZYvWh8GcrVrqFLNWz7Li36Sy5YwEFwkozxOx996spatPafE9OmmUZb2fFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227109; c=relaxed/simple;
	bh=qFzqK2fj1HCSeZvxxjuZEOJdMePJq2O0RxP7hWzNXos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZkTagNS1JG/GvshhHCMaSphDfpTpJJiq9rZUqYn/IYVHrrpU5Lh1sNd5EGpwVDQ3AqpHhSI/xuGGc2jwcFoPTxp+t+edjWVQK2lW3SUkdvCUsKfJqwuzwDfAv5GW0RVD4gh4kNZywqeEHZb0BLg4gS1Hqa+0iEfotQ3zbnanZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdc6/miz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdc6/miz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441c0d42233so6789365e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747227106; x=1747831906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G96WwZNOynjvqyGyKipx2eszkDBgYS84tw9/9TdkKxc=;
        b=bdc6/miz6LnbAOtDGMp+rti5xxxoYPUuocP4rtE7bDSXtGhFLC/DUGI23z6lPi+W7s
         IsElHn9MwESvX902ThEHbm6ClzVuvzA8RwhYYmVW9qG5I5uKmThRSLmHx3HeKwhLBhSS
         gjodoRR+31kPoTzK8CLASlHwBqf2MTrecPUeEq4ppHKQwXZDOjbOF2A+vbL8yqhHVp+x
         3OQlquL6JuEvlMpw0Ruo4Y+OY0BSM7oeIdvJ+4AQu1i/u2qU/AAczMvLnNUy0UW017F7
         7sCFleQR67cSXRX+0WIXvWJe6JXwMTqNKfrF1+62Gjjfv91+YP5qFo9SG0yC+k/NMGcn
         Ij3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747227106; x=1747831906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G96WwZNOynjvqyGyKipx2eszkDBgYS84tw9/9TdkKxc=;
        b=lqd1sHT4hWUR/tK7ANBjMpiPzueloORvUSVm9gwDh8MgNQPagvFTrCoQDCIiWM+I5X
         n+nEyYIQ2nVM2k6qe8lxEUOg9HSGRK7O5rJtdtGAO+nrfZ63R5OLl/NAdiEWUkuJWeNR
         TXOEN3FXdOVVqZoR9Sk0Lf5BO2UQ7IznV2LLnRleqoRTOq07XVABavpTJGlnJUi0Y7VR
         mZE4mvb/eRoDEir0GlQ90MAmdkZLWZ1JE1qVrg6F6XfHcXXJXv4DcIkxJYRrzUV2FtGs
         Se5+JYfPD5CqmDgeT+oN7POQNaJ1DWXDndzl2xD/40+79Lhp+mYFijtks4KsVamRo6tH
         sBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/bf6bA10AoH2AkB5m9YKp8zYfLxfk53INnTQCvHdqO6RW8mKKFNQgPJMFYY1QkIeTqDtKLLQgAMQseHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQiFz+OMNaPphwoGS6Dg6MVf2vrbM7oeSsm62WrmgWRHsnU5QE
	GNM4bnLY9hEUIjCtM1bERW+Rg/8LUPW7GlryHTtHRrRb01rzbB3NKWoKP7qkEjJPr8FxtmPwYAb
	CwjI=
X-Gm-Gg: ASbGncvfVv3e/GOjU6l3/59IqEiCmsI7VxOxI3y4KbiAiWQm43Pwem2HO/Q2+KuUqMx
	7U8BajomenLROWd6oiDA0+Q9TuudAcgMRhOMlDJ486+DMH9/VJeecS1TfJTubCIlpTyNTxTRj4Q
	0zlaJT9UHcpK0Tfbo4z3PB7fUtz0cIaO/8Yv4cVjUaG7QFRrf4QNc8439nQjL5+8qDwUw+3T59B
	YmwALdVNdKvU6pLoukWC+EK2xqNk9x2IvM25Co3K5isMh5sHjBqCKgVZD2BuWYuFv75WY2EBIRf
	S9sS7hf/VM6lc+Bx2N2XrrIO+deAFjc/iOQ7FrsihTN/jgz0FsT1585Dy9qUF4iHq11q7FWbewX
	39XJjLHW6hrxmVRU979q/7Ol3u6IVWO05c3O7Jto=
X-Google-Smtp-Source: AGHT+IFZIaPFeS+MCIGc/n0k7HQIiRGAtaHoEjEST/i2knk0UNX+vPMn1mIz7kEQxw5X9yopq23eiQ==
X-Received: by 2002:a05:6000:40ce:b0:3a0:6c12:237e with SMTP id ffacd0b85a97d-3a349966539mr949736f8f.16.1747227105716;
        Wed, 14 May 2025 05:51:45 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a22ea7a53asm7745942f8f.23.2025.05.14.05.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 05:51:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: serial: 8250_omap: Drop redundant properties
Date: Wed, 14 May 2025 14:51:28 +0200
Message-ID: <20250514125127.56149-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=qFzqK2fj1HCSeZvxxjuZEOJdMePJq2O0RxP7hWzNXos=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJJHPtqHSU1Qk8BxXvilLaKyVFgAjZk+a0lzio
 oXCt1bupleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCSRzwAKCRDBN2bmhouD
 14RpD/9BzBk88TJILONuQMPpVKrbk05NXBDJsbdZ0Q1iJwNlspfgM7/gV2ey6liewYj6+SzZ6Jq
 4xRE3jSOzfCWksHPpevKlQF5LBTCORR9nl+NER6hX4Rc/7u+7nSO43SSNp7O0hoAP1De6n0I9LY
 Zw81y/qGJ1dpGf42tTnx/GyyE1F1j2g4hxlGLI3+1UvJr093vBMLqX6Bw2KaCyTzlJQkuOngtjr
 3JsASV2TEnkDOCq/PkiYqDJi64KukEhbTW0rP0oLKLBUQNM2OuAL92gJ86E4XubIi3/iMKbwt7H
 v4lk4TBgbqs4JtY9luz6A/qwPHkmus+XgZXiqxC6kasPea3zp+FHrsousGJyVIcvZHd7eS37GEs
 HWfI7PlDvef6/RKUtuQfKCWupFkU1KZRsFoYqJTRYfniKwRCL4JJ0L1jHwsdsoIdPHoDhctieNq
 KqBffAUvwZlKSBJ8WCo2PHNwIGGzZxllwKvLpXLTzTsY/5Ayx31E52AW33whTFdXbdV+YU8XFZq
 G10Y0InpyOMrs0F3kERufANk6nvXozHSfCcAg8rbMmNMkjVgnovc3hUATZiOlkjaYivuaW+/iPV
 84vqTRU3nSqyDuAt3dHJ1pHMG5AoZxhFymXWYo5m2iXob4xB21Ra18+VRnfQmg6uTA6F9QZmQ+R t3E5quDi45zWwZA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The binding references in-kernel serial.yaml, so there is no need to
explicitly list its properties.  Note that rts-gpio is also redundant
because DTS should be simply converted to -gpios variants.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

There are two cases of 'rts-gpio' which I will fix in separate patchset.
---
 Documentation/devicetree/bindings/serial/8250_omap.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 4b78de6b46a2..1859f71297ff 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -64,14 +64,7 @@ properties:
   clock-names:
     const: fclk
 
-  rts-gpios: true
-  cts-gpios: true
-  dtr-gpios: true
-  dsr-gpios: true
-  rng-gpios: true
-  dcd-gpios: true
   rs485-rts-active-high: true
-  rts-gpio: true
   power-domains: true
   clock-frequency: true
   current-speed: true
-- 
2.45.2

