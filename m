Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DF01E51F2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226542; cv=none; b=S/I387jPn2anSeDzJHu/2os3pzujJNTQWIGF1oLkf3cpRkPEmgIUopgDYbojT457v+DvML1iuWaVnlUtbfoww403jphcTfl3Aimo1NYsbQHTt8GlZ2oCq+BtQ5D5z0NRCefQZLYu18Y51H6jgk/vAyRXCg2/UVQ2FQ8xoKnmbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226542; c=relaxed/simple;
	bh=he9IA1+sEmtGpV+RfD/yvwaHIPJw7FZcA+CsPKHLNsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbdB5dRPf0enbUU66vKbKU4MwDKpkNMF3t9zFT22ijah+IJOgOrPxz/dtyFpx8CCdTy8ZP4f3JIRHQijeXNVLWEVxTZSm98bcqE9j8NiWBiSBG/brysOUwrCHpPKsgNaTbwNGN3s3y+qpPZgkDZLWM+ZR9usOW7h1c9rUjYPUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lut8q8Ni; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lut8q8Ni"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so319605ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744226539; x=1744831339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAZLFz1IGr5iGWJpnMiF/uKgFNwzC6PY6kuRk72SglQ=;
        b=lut8q8Ni1hbyZx9cevMEU3YqMOUhsQhPKqmJAgDc6cYYex6kdQ/QLfIU60sQNgD7g8
         JimgNl640PCTK+FpDRplBPvlvuKDdRe6DUfPxjQSM+hsymxq8POEfX7A2Jf0n5YkrxKn
         f2ybj/ajrmfvuGMqT49IAmXdrgFnKaf59WioJQUSS8Ps2mHdslboQOxOGOsLfx2ib2G4
         GVt2GgaIfyRLLfRPSkfyytr0BVe2WYI104UkkYW8TaVcTvJ2koBiG1++5uepyrKQeNvB
         7o9kqfqEWR5pfcB7Qu+7/dlXSkLuGLwauXtrcZ6AVTn3XRwcK6hI3E7fnIAQSLvRMEWC
         pKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226539; x=1744831339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAZLFz1IGr5iGWJpnMiF/uKgFNwzC6PY6kuRk72SglQ=;
        b=LaGa7QfxNAgBPTHMMXsGe7R9rn1Yr2J1kI4tYQYGkgQX0PywU6s6QAaq2WIU1BPHFV
         xoqTcHDemM5MdaCBoB17dWLv/teytRrqCy3tPXc0yksfL9e0kkGEhsEfOb7NqEvrVWdg
         HX7JjIHt70KVRmhQCSEYu7zDjY5OyzlmE4mF0k7k6fjTxSZpBr9ECmtsJPuiYwJLHK9e
         Omq1BgmpMgZSywwvdv8gEy1pQVLgagTRbawR9AdXvwehxcUpv+COnq1X1NPzNVHwsATc
         3CT1i6YhDaG+J4mLmn3IflzwbUNB2f1qDuAnbHQU+1wjBA9XO6pPi8VvAvFOBAwIxmRs
         lvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxEBBwTe5hpuIfKKaPJvwXGiQIA4rDb4FiyKmz5rv1iP4DNzY+0mtaXjgdEIDIHIe0Cn9HuM1tgg1z/DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaSobNmbUsIYiIds9d5P8A2hT6m8cBKtKqh0fOeOrt01k/U54
	FzUO04uMfsu+8/oCgc4B5SapQtfWudfy8plFBPyWdPTey6sGU1vJ7LjjpetdXxg=
X-Gm-Gg: ASbGncvq8uyVRRVzOvFwQh/EhFHSmC240sKeBVmzmpmoU22Jijj2KOvFMGIT58YzmzH
	QgWfHbAVVXCc3Q9DVHdTLNDKJzUL78JWuUHjpwqgl6+1A3BMiZJDNkil03GvDr6gq7zojJiVG+N
	1fU2lmLEgyOfr1B+009JFEQUYLfsSJC2yLFImUjqvM0/szjURpGF7LoDD5oCWMSuyGrsmNidxRL
	qZIImQQH9jP7icSf5KAFkjI0lvQ9uMZN7K5bEJYHdOupEpc26m0iD90niMuYxS3vP4HTW/KTDKJ
	IlTrLamXv7MXTSu1JFD1FWJRRC0dShp9K+gC1OWpPb9Ml+6J9BoIBIh0C28MMGRknkqYINH7aFs
	gS0UyP8iGwL6ApQ==
X-Google-Smtp-Source: AGHT+IEGuxmewmQbb75m5X7vBqHuIXERuCuTlAE6AMgAdiu3tfh0rm83MqrIv2yAApon5oQTbElRjA==
X-Received: by 2002:a05:6e02:1446:b0:3d0:4b3d:75ba with SMTP id e9e14a558f8ab-3d7e46e082cmr3195055ab.4.1744226539359;
        Wed, 09 Apr 2025 12:22:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf81bcsm373459173.10.2025.04.09.12.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:22:19 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: serial: 8250: support an optional second clock
Date: Wed,  9 Apr 2025 14:22:11 -0500
Message-ID: <20250409192213.1130181-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409192213.1130181-1-elder@riscstar.com>
References: <20250409192213.1130181-1-elder@riscstar.com>
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
---
v2: Require both clocks to be specified with names for SpacemiT

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

