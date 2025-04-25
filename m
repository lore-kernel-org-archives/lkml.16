Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFCD25D907
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594330; cv=none; b=WckRr5BarDwm4WWb3IJUXNiLqkmhzXL0XrXJSaJz5SvZvINsv/62yT3czwAQzIoVS2TnpA4Rc8qIvcmkeLAAV8lOkEgsBIlsFsibkg+JjvoBmpesq1T8HofDwP5pW2bh/p5Mbpc3HcBBZcIXFKtpPveUivXZ1o7vHQBk6cuCcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594330; c=relaxed/simple;
	bh=wDYHCLa5R2Lm8PFv1HaWiPbvSjf5XzEvOyMvWi1H6CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNSH4CpTKMfJCUumMErUv5weEYgo7lBikzGi5gPYPK8Cka6xUS2yc40OCG+wvISDxKEbymV+hPdW+JcOZKfISt7rdhbQyhjCUuCl8pBNtXjCPurOtqoHjn8Z8d8uX7qRVB5Dtuda8qJhe9fMmyGVubc8d5IqQGdRMu0G/lk4+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com; spf=pass smtp.mailfrom=thaumatec.com; dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b=ZHwq+GeP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thaumatec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="ZHwq+GeP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac7bd86f637so678580466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594327; x=1746199127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGhABSDncyCkqMF1m9WG+uwjNnjeaT93SjRTLfv5Zno=;
        b=ZHwq+GePs+RKCQobQ9swTjG3tVZNiCPZNr0zGEbFHlxgRETxYR4W62+5S9Qsjuj1xg
         KNY1+TXArniXt/OBtRxLicDD2HoiXwbDS/lZHycrwnCpsa1YLnd3TQ8z4nBLFUvXk1mB
         K59QofHgU9nipZfx5dAY4eqcdoLepMk5Dkze2em4PnmpjAPyiqRB1UTMKgvFcEl9/zeK
         hEwqBb1SnpN3dFcQ1gRUZMQ3rrStUu9hrXjoSn7mq4++GE8gIHuCNTHEJnf0thS5gsk4
         oYbDFRx9Vs0a51dES32e1sVlTII1Z/DrpRmoxOO0wsnRVVwhNhCgvOBRW5LJKejjVLU0
         4K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594327; x=1746199127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGhABSDncyCkqMF1m9WG+uwjNnjeaT93SjRTLfv5Zno=;
        b=G/1lm/8RKO3RmCzQqLUd+CWL/d/aTQcOqGBqxLvlHr+7Lu67gMvbgEKK6TAVJH7rvd
         24aEg3yJ/QkSceDm7Q9/RZ5VZeOyQjsp0/KPaPiq7ZRMfaNqYOJb1CiUekFYbLO8poAo
         OYP/nEkAPUFfOtnyRytKeotZbo4mFMtlEpUmezVGvUoG6LU1AXp01nUUXeuxzmaWP6wL
         AWdSq4z9EBgFMchKOn1Ft/Yq1d7Vf3kzHHY+D+wtRWICpZrCLsw780kdJnB4XrvsNxIM
         4e5AxAd3MsjBVBUJnQIcb4QfHfL9bfuKEaXOS28c9f0Ni7YK7lo7yqzPMzYB4cZn8qfh
         CaZA==
X-Forwarded-Encrypted: i=1; AJvYcCXtiwMbj6gb/gI7u5QxcdNeZIF6D+Y6OlNWuiM6N7iHhiierQ1IfMXCihI3bQVY1SoD2Cma+D/IvnzoVQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr02aqN14h4ppoUvkEFRlY7wflt3DjcPE+OxSe+oQu/0OMZsoq
	KvXf3GAKB3gyTCTnWwv5TZVHSkI1cmMWhSPaumQveoBI8M2MImlrr7Yi2gWodBU=
X-Gm-Gg: ASbGncvOSj9RgGI3rsnx+9mUzmGLNprT2Z3g7DWZwjwaBYVRQY8OvI6TdHzWbIxLBDM
	7Wr/VPmEJNyeGNZrqyFBmecMg+IPmIPGAeWrC5vWBNj7eszPnm/vlqBrVJEDuhdGpZCLWnMYeN0
	I/KbHY9kIztajH9/3xJP7pQY/xdwP3wC6Mndhq5IVu/1vAz+kFogweBIRvGGCcPKP9a9FBrQRZl
	w66pVX/LhaFofe+4edK9WYiP0P5rppNHcVPvs9GHKrLpmUHYuPeVnRekV+ZaHW4fRVUzfy13dIK
	mnVPMAYmUQWx0PN1NrR5HW/AEz0zb/Zl+IIcMcFFG0CCapU9/TcxP4noPRmgQ7HU+hY/
X-Google-Smtp-Source: AGHT+IHtzafs1U3OlDFbdl1EHKhqDpSLv5FVfv0SchkozUHNmBnUPWs9GEdrQlZ8/5oMkLAgq6/HDw==
X-Received: by 2002:a17:907:72d0:b0:ac7:e4b5:4827 with SMTP id a640c23a62f3a-ace5a484e6dmr564732266b.28.1745594327250;
        Fri, 25 Apr 2025 08:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:46 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:07 +0200
Subject: [PATCH v2 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-2-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

The Cypress HX3 hubs use different default PID value depending
on the variant. Update compatibles list.
Becasuse all hub variants use the same driver data, allow the
dt node to have two compatibles: leftmost which matches the HW
exactly, and the second one as fallback.

Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3.0 family")
Cc: stable@vger.kernel.org # 6.6
Cc: stable@vger.kernel.org # Backport of the patch ("dt-bindings: usb: usb-device: relax compatible pattern to a contains") from list: https://lore.kernel.org/linux-usb/20250418-dt-binding-usb-device-compatibles-v2-1-b3029f14e800@cherry.de/
Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table in drivers/usb/misc/onboard_usb_dev.c driver
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 .../devicetree/bindings/usb/cypress,hx3.yaml          | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index 1033b7a4b8f953424cc3d31d561992c17f3594b2..d6eac1213228d2acb50ebc959d1ff15134c5a91c 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -14,9 +14,22 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - usb4b4,6504
-      - usb4b4,6506
+    oneOf:
+      - enum:
+          - usb4b4,6504
+          - usb4b4,6506
+      - items:
+          - enum:
+              - usb4b4,6500
+              - usb4b4,6508
+          - const: usb4b4,6504
+      - items:
+          - enum:
+              - usb4b4,6502
+              - usb4b4,6503
+              - usb4b4,6507
+              - usb4b4,650a
+          - const: usb4b4,6506
 
   reg: true
 

-- 
2.43.0

