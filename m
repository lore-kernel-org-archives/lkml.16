Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF82E7F1A;
	Thu, 26 Jun 2025 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946697; cv=none; b=cVlW1dwoJ1QoekAgIjJBrsgCFVgzvEj+paVYhaGF1dZ27S5K3onGxxSd6mF7xHfgqR8FwcbRTi15w6fNRfSdZmypemTKwqRF5KvRM+5ZLV095pnwB1Q11x3KZGVVR8NXeKUX/B0TuOkt+erNEOAftw1iZfcko0yxq3F0/D+Kp78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946697; c=relaxed/simple;
	bh=Xv1/jTGG/gJJ+hk3TVLJdp3KpK3nW14NGkQC7jd6LHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXtmsNOhNSfqI0iOUa6tE2llx+Zw55Ov4C+mIMTk46CcgxNxpDJCeWp0h39m+svXmxtsmuPSxOqbw8iDrATdllIwKbc/KjBYuuZD8+I02HVdQfgSkuyenfTV0gqjWnXFPnUDzjDs6uwsRhWia0I1Vu/GRAqrIuBGCNDUoBvvKpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnnyptqX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnnyptqX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so1664624a12.1;
        Thu, 26 Jun 2025 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946694; x=1751551494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+obfMbUjPeqPgweHt8NQmSnWbRdROIck/DPZLknRG7g=;
        b=ZnnyptqXcoYLKNv84vOJ4y9XeszY0HwFDothDpZxgtxftrMx7t6kouGob73dsFB4iy
         WTpQOjFC2zy1pNa+NMVsNibY6ZdFfwE9gR8cJPjTLl+GIzlR0meZcoBhxHnOzee2gnax
         iIUSh0YrG8mO9ZyTroiflZCJAi4iBFDPkSqff+4PHosEokI5H7N6z3xHbhwqXDrFvRTl
         xLETl6LQimADOK/Nu6ZsIrlGdISEvyG0L05mhu7r9LzIBl2waQz0plcMSnHxVC1EuiOu
         CJPyRkJRKYpBS9r9SprMiPCgQjvircmKfTPxV6r7wlTjvzcplP0Znz1zDPn5GpFdYJik
         EkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946694; x=1751551494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+obfMbUjPeqPgweHt8NQmSnWbRdROIck/DPZLknRG7g=;
        b=N6Fffy/Zae8cgrQtCXvivCq1LxwL+4nNUMOLWCT+OjyJ5AF7HgwkBiyFar0mCBfTbW
         bJ/ssU0zz9xC0yiFhZoNicztPrAkhaaVKWvdcYoyHSxSLrzmerdbkmUPH/x1HL2YGpFM
         b5McjABXsMdqtz40QTaJW+Fs3qF9mTZUoD5Cv8iBDCtv59lSMdGB4maM1GeIaOIXVoxj
         jylPKia8HsL02yqnrDeTULelkN9rUmSr/O71EkykJceS1w9Mxg1MWjf/Jq9NSoJD/0cn
         P5PM8O+/qRFBzGk74J9Egz3RrKnRLej5708AQ44sEZFRjPvWA6ov0w5JPwcADtpGNO5Z
         rkAA==
X-Forwarded-Encrypted: i=1; AJvYcCWcARE9hnXACAaIuBb+82gadTrNpDPbB6ucDta2v4AHBLqZKi9bb5Bz0FLjv/d0YbRQH5k3CkdKDoC7q+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhEhl3SAHjJsfdKTJBLqz0MZZEcKHU9t7wgh3f9d5amakP3ZPc
	ngovg/k0IFrL0ZZvddYjXcWKjL/JQDYeVGRBeI0VVbRJ1JuD814OGtcb
X-Gm-Gg: ASbGnctJXjdMQtgVQJz1ffAmvA1Vtu23HbKVRUI+Nmmd8d4KDTKv/yMD4tKmkf2qkbo
	Ca1cdylx1cOuG0mnfojoMNARaQI0Avd3zbnGnVyQRcZXUbFkXvWzLCyWizP5JqHpdyZ/RNUGreV
	QV235UmHQa+1gINxsqgNIAkvlsBXBS2ak62Bp6V/GSa85ZDLQsU9UU2nyby1LQtUN8HpRSHjeLo
	6JNAcwtHfeZ5sUS/cmMRfoIfKZvNiRoFd8Ve51mtrYKP2qXvc/4GNGIN2P4pjhIlFbiMJPgCjl9
	30kZVOI0Do56+ANt3QjbRz+9lb/39om7etgzzxrtWlSB42AO8s9Io1B3dAuchXxzxiMJi53aWOY
	rUDqGnhvbhDE=
X-Google-Smtp-Source: AGHT+IEMa7N6/JICwBktUg284CtZPfAM6zetq6FSZBNGjtmxX0wPaJpuk1XXGA4WwOHUjAZ88L3sfQ==
X-Received: by 2002:a17:906:d54c:b0:ae0:cc3d:7929 with SMTP id a640c23a62f3a-ae0cc3d9616mr532689466b.1.1750946693173;
        Thu, 26 Jun 2025 07:04:53 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:04:52 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 1/5] dt-bindings: mfd: khadas-mcu: add cooling-levels property
Date: Thu, 26 Jun 2025 17:04:28 +0300
Message-ID: <f4d27c690b562cc72997c9ae00c6145b3722561a.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746518265.git.efectn@protonmail.com>
References: <cover.1746518265.git.efectn@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add fan controlling step property which is used by Khadas Edge 2.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
index 084960fd5..f69643aae 100644
--- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -11,7 +11,7 @@ maintainers:
 
 description: |
   Khadas embeds a microcontroller on their VIM and Edge boards adding some
-  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
+  system feature as PWM Fan control (for VIM2 rev14, VIM3, Edge2), User memory
   storage, IR/Key resume control, system power LED control and more.
 
 properties:
@@ -22,6 +22,13 @@ properties:
   "#cooling-cells": # Only needed for boards having FAN control feature
     const: 2
 
+  cooling-levels:
+    description:
+      Max speed of PWM fan, from 0 to 100. This property is necessary for Khadas Edge 2.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      maximum: 100
+
   reg:
     maxItems: 1
 
-- 
2.49.0

