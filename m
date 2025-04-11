Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE09320FA90
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386269; cv=none; b=Gv6PEh4r5XZdSfuqJPPUyYGl/IjnYmERwCWB/rXpB1NITLAXvPgkBwuQLVXnwoyfSD09MyrLNaJdpYr7v06KzzesPGCGg0B50SapwdObDhnEflvto3xR6tnT7L4nN4UQ47blEu/wL1alHcSTKQEQqce3EnWuo+ynWuFOpympUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386269; c=relaxed/simple;
	bh=7ZoS0xY5agHPaulRb3cD8XGDbf5Uto+nLhFfKAqokok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNBcDsfg9mf3k+fOllMw+cZR1jrMmYe6+UEireYqoxILpbwMyttrci5zuYDQQ42WGxnSn+Ti6cpEgOd4EdAuNnS2xqXneiWMbdDI8CCu7n5BCzd275XC06eHQDMbyYtrJQoPBwhzpICYYyxdFtWs91Vr7wmi0Po8VLCaBNfuRYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=A69/LT6O; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="A69/LT6O"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-86142446f3fso54612939f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744386266; x=1744991066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNEtTIi2VK5ry0lwico5I+3DkBAdLoSFhiEvmP3qbmk=;
        b=A69/LT6OOQYLw6YgRDIh8Ai1DI8+jzG2Hc/PYn/2+PWrr2HKTGOp2dvELDPepwMkAD
         G0KT/qMjkHc4SINyIzbxdG7KVNGP2at4C+E3tllBE9xpASKBknB02KI9kXbEd9SikXcF
         3xvLvIZlsgbn80AQgpf/4OJIWLobGbfoFDQru8DkSPe/Gegn3hlhL8wGicZhEXzpfS+P
         ZGCWOkzmEIHiZ2oGJpRjCx3jot1UnyKERe13Ls6XUUVWrwpb0hgLkChOq5hsU17eW9H2
         imEc9t3nHytqu2oI7j7O+JS3u2moAoh7NFlslq8EUgylGz70ell9EVs+8GCaZDpL99RP
         uoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386266; x=1744991066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNEtTIi2VK5ry0lwico5I+3DkBAdLoSFhiEvmP3qbmk=;
        b=Y8GcjCXxk43EiYlkHhQYAW5+0rHcsKCRzxmbxiS8+Kx3G2q7SQHbukLJM/jVEX+0hA
         IAkSvJSqWvbz4snPvdoqUvhCOS8KjyEtQp38j0IAUabEiLyPG8yrmWEUOqvqq9Pk9AP4
         afiNGhnRV+nQzdUwHm4LjcpDOwYjwKxAgSz4oSup83MXtYD5Qd3q5bF9H6SCyxy8q7WH
         HSoHDSpjLaoCaYC7XXXi/0kxUcDYs0rXbg99xPEA8kTUaMOQT62dADDv/4O16D74xfOx
         bo0tb+BJxHjvSi5vmjsRxFxZDDTTkQcAifauai3MuUnw/E7TnpaPV7eDec/K7LD2XSSt
         B3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVHll5X96OEFHSs+CyhRYTI42CFE9tU9JLuDxCDbBILBrWBo2mlFYFg0i14GKaJ9gIDsLUbST0cTrDH0a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDlT9nMmZXuCJqkgL0w0378EZQqQQr9VOGcd5iv2FJ6tsPXMAQ
	gjGnYsBSDFIBABuQIEq9XlNgM7doxxDfVLXtjwQ//DBa6U1EZbRo/bxYPk80yAI=
X-Gm-Gg: ASbGncuQ3xJ4WuJ01vqWNNzYf9W0GmsQGTH8ML2QRXq4EyQoMzD0hycN0i4WL/klRoF
	qDIV7Uh40OB6IxIvfWviRp2DyyfVOsATs0nyTbio55MDXqf5LHdpStY8XG3MS16A9Y1isd6H+wP
	pWBjkoIhPIf2RhE/RSGlhP4kuOfIbBvx7hVPlNRCUk3xuYLVvZavMX8R5MJVCa/94OLpQJ3ZkxI
	LwfypQjGMpuSdoUZuU8+o8BD901DEnrCjkXz9bsp8WPuEgmgqiiJvYjyFAJqEeg0qHgDhAoiU+o
	DZF1r5+pocW0rm6PcCupHV/mZbaOpleOVESSVbaPFp/bcnyGrVDjinN3RwoDWYsss89ou4QYzua
	ofsW0VMcfYDWySQ==
X-Google-Smtp-Source: AGHT+IHmZJkLUp0ElYixFb0pqy12kzxcoZbzdEnj5SOiajP/nfCU4MY0cVdJxZEZG4e9zsnEIRAxIQ==
X-Received: by 2002:a05:6602:3789:b0:85e:2eba:20ad with SMTP id ca18e2360f4ac-8617cb4660cmr336071839f.2.1744386265918;
        Fri, 11 Apr 2025 08:44:25 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf812dsm1276326173.18.2025.04.11.08.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:44:25 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: serial: 8250: support an optional second clock
Date: Fri, 11 Apr 2025 10:44:16 -0500
Message-ID: <20250411154419.1379529-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411154419.1379529-1-elder@riscstar.com>
References: <20250411154419.1379529-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART driver requires a bus clock to be enabled in addition
to the primary function clock.  Add the option to specify two clocks
for an 8250-compatible UART, named "core" and "bus".  If both are needed,
require them to be named.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3: Added Rob's Reviewed-by tag

 .../devicetree/bindings/serial/8250.yaml      | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index dc0d52920575f..33d2016b65090 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -135,7 +135,16 @@ properties:
   clock-frequency: true
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: The core function clock
+      - description: An optional bus clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: bus
 
   resets:
     maxItems: 1
@@ -224,6 +233,25 @@ required:
   - reg
   - interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k1-uart
+then:
+  required: [clock-names]
+  properties:
+    clocks:
+      minItems: 2
+    clock-names:
+      minItems: 2
+else:
+  properties:
+    clocks:
+      maxItems: 1
+    clock-names:
+      maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.45.2

