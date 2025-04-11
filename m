Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A01280CCD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403917; cv=none; b=OS7HpIq+BzUjzxzYk6wC7RsiebMt8/qfptyW92aHHOXOxVfraWHj3lB7ehORn7XTRrCTMhpacEOEgmjXj6qyNX5aR13I+ZNKa+v38k3e5SqvgECMYXQoa65tJFciK9tAXYu3Z0hfeKtGwXxBuIqis/YGNcSWge8TPelGriRL92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403917; c=relaxed/simple;
	bh=kgcUq4gxhAS41S/CjHcT1RY9hEDolidwVa0J5wWVKTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lO3SLX+VQtDN1IszSvxaeLMIsQhsz5f/u2OZP0LWvpuILxmuGuHruS4aqgXLwOFMbABHkzZO/oWO/BxETWd0wyXxLVvxvRYRFdxCGgG48xJfqBylVfrzx8YVFiYm8dZUhmVtpdsUBS2mjE5k5t3KtfvLcSlG5e2kA/+UdHtvWNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=viIHxl+S; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="viIHxl+S"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso19676425ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744403914; x=1745008714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT3eKW0OgVfu/zUbqU6ev7ARx/bWRnIm3eKXRAL5nSo=;
        b=viIHxl+SZtwF02PI5YsOlOCPiJ24FIfJ+pCJ9eeG8IufUMlxpmaSxPJiQbgFxRPgEc
         SdLo6tTgugssKSzDZYngYwASkRh+AmP6hVMEyiZ1yuJa9behcZHMPgkIXjc6VV7XkxT8
         LACIvamGBwcRx+96p18EFkxPz89EZ74ME9by5wP/pqgEzt2Al1u6Np+etIEOfP8wvfqQ
         OhSlVfELR47ZCQyg3lwgGGsYI0TRpUxVrCvWp6VTzD2ZVieS+IZUEUJgVh7xH1rb3FXo
         b2JN/q7Glnazk4BfJus5CuHBo5etSWnbnHn+nYiaZNa+2qI3OPa2vCwGjuXRVwg+jTOk
         q4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403914; x=1745008714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qT3eKW0OgVfu/zUbqU6ev7ARx/bWRnIm3eKXRAL5nSo=;
        b=sUDqD02o0bU6ahP59Sg+Fqj0mOgFIaj+1KfVdH/Y7vlcTrIWVhIDtGwCrzTA0G46Wc
         2L8Sy3h9exbbvZdMzzTDyXjyI6tuVBRMosvWADi8ayXMxOKWCtT1iIZZHmo4LZs3jL6u
         LeuYC/8dKnQcI7SJhtr9R97LyGt0C5m7IeppX8pjMQ4VBk14MUwdYbbADSUu23hpg/od
         fvHiXPlrqtMiTdW/8mi8BYiRvYzvuijyVverzxneVH4snu/LCQcN3/a+ftgbM2p5vYE+
         tyXAKOGHYwZfdz4RuoLcDTbLWpvVRhIJBZUvOtnkeNW5PhY/3kIDAdfnQ57yz+gZHqIJ
         VBQg==
X-Forwarded-Encrypted: i=1; AJvYcCVwJdvaf61ITmi69ZPJ+cBKhA/ie7K7iwCKJ9r+ATQ9VRA2iYZ8vYY28CzF2AcZLioO2xoFt9tEP9zlgNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YweRg3slnht1e0yLMtg3L7JUPT+QC9xzDKC4lP1gL7pwQcP/wRw
	h6+FmFBLemZrlLUaJP5w/9/6qfWKv1TGSPei20+nuFnYLcytel1oBOwG0LjUNRk=
X-Gm-Gg: ASbGnctS9m3oedDHUE86FDbemghf+kldKBXpjNff1sYms5pjH0sCs7KSkOiAKFxyfM4
	CUtwU6XQAC1prwUKe3wNN9fZebeoXTnfm+d0NImtvsfA6/uSFD1Z1SHLMF4yNIiPFzZYYq6qMhw
	RNMgjwBy6jbDRdAgmHz4xAc4lrPHEjpVGEL6dyIPKHbsxyNfPncfs5L2h4T0it+2VZNnLKMDu0A
	JhhmtOPeTL/aQDIAlIIKN2REoUH3fuSCpSMc/BRqOvnKO/Us2PZuqzGcy6Binq9kBL62WQI55WS
	tlRl+OlisjeUI9bkwxonZn32dv9EaXZQmlrFNFqRxP3M1fokLCWSpMmv+K40fmmsD3aB3zuKPG7
	I/aG4FS8X0rc9XQ==
X-Google-Smtp-Source: AGHT+IHNU+YtLYKKg9Rbak8AqmRKKNb3APAoh0D667oTnKj2dbdwTHDE6V53boBISDwawaoWJ0qvsQ==
X-Received: by 2002:a05:6e02:23c9:b0:3d4:3556:741 with SMTP id e9e14a558f8ab-3d7ec26b630mr50230125ab.17.1744403914302;
        Fri, 11 Apr 2025 13:38:34 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2ea1esm1420787173.123.2025.04.11.13.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:38:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: andy.shevchenko@gmail.com,
	dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: serial: 8250: support an optional second clock
Date: Fri, 11 Apr 2025 15:38:25 -0500
Message-ID: <20250411203828.1491595-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411203828.1491595-1-elder@riscstar.com>
References: <20250411203828.1491595-1-elder@riscstar.com>
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

