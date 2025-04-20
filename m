Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498491BD9F0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132682; cv=none; b=u9w/6EgNa8sWfe275hhwDESFRg0ry23+3J9CKn2l5XkLqwESpkmR3JPJX7XQjbHVWPbW8yappJJdYMTo1uQn0pDoUdMHfA7DBqtriTNGdYLYYqFJuv3gb2C+XLz1mDRtCwTQzKdtjaEmEMG0kdYdrdF5dVXz6Rao+V+ekAVge64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132682; c=relaxed/simple;
	bh=t4jNLYsfRo4vYlN02mWCuLhLvvlCbpD5ApBbAIbVkFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRlntF9zXHWqGc7M6/u6nnxx8vCmOxEkcBdnu9uafM7E3w7Gq80fgqoycyxqdcJe14UQ8Y5naVBMZ6hx+iieWjXqqMG1M3Y0I6lnTlg5Lz0WYYOFyPTEhTtIfu5/yQ2WcbaZhfsxGcWBg8puk3imEElJtw5S4fUUGKQwqkIWJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ljkXWUDF; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ljkXWUDF"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b34a71a1so3438035b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132679; x=1745737479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEr4zoqSDPSh3q/NPZGQ8bjJudfKjj9SBhXWOyMRmJg=;
        b=ljkXWUDFEOkdT4k8eBQ81mnVqk/Tch1l7gUvwprY7pDij4+6+oR/kPGkp1z6jgsRld
         hPEjKp9Cuh1tIEdaFKz4yESWc0Rsb5hh9Ip/22QJnBv4LjcTcUmWzcMMSR64Pt9ejK6d
         +DNd2BpY4kTB72/Q5i5juua3zMhyEpRitioYAdi0btQ89ti0h6U76yVAMZVvrxDpSqZw
         aZU9wOBs/60p/So6tlN+5Jlr88d2sa0/jZKiYinBDcflcGF6wBCygBWf94sRHv/5cd5G
         6f21e58bD/sTVuBqUf3D4Pivslff4QaOw+tRmcLaVm6Ag8Em3cR1LtuK8hEPBuiMaelq
         ctGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132679; x=1745737479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEr4zoqSDPSh3q/NPZGQ8bjJudfKjj9SBhXWOyMRmJg=;
        b=gZBFVEqu1gj1V9Q1/50bqklLA5a5BIlJYMXwWQTpRwD5Wy73ZEW7yDKdN9tMQcMVVY
         3u2zo07w/3U0EdCth2dYF3nOVc6bKH817I7tl5oer57EJv2iyhuxSz+T9KK+JZ9W5Hnl
         sQIhNHNiixf9MgdMOfXyh0J2Zdeumrh5YPGDwH54KtQpKTEoZaWgHzl0N5PkoP2XCene
         hcqTjS5ppfBBHiFEXXv915Um8j47pjAHR5HGOLsAU/phqOuMzOUVRpQXoNOARfbiG89q
         kUF42MTpXdEJcBCZupjnpd4CpnRThv/hYwrC7oios4nRcUxSBdqj6AMtPmL+jAyeZ54M
         PiaA==
X-Forwarded-Encrypted: i=1; AJvYcCUqxLJ2yCYuf6Pz8TEJLkKKAKEY06Lt/OsIZOTMvKCTH0vLLTHU5yRu05BeJF44manvT+d1jU31641nj9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+56TmA7hoglKcmLj6IA7MwxWgTZt4y4Gu9C8gY9wJJVkegEg
	aDtzBNW/GNAvAEQQ5GxfpTcZncBWXmBU+vR6YyFHiofZ2jeeSDtQSk8d+XSXXwE=
X-Gm-Gg: ASbGncvO1DFKvJp9APbmxGVpbsfTSA5ubS3BnQUQtuJ68iDPLSRy+0Xcu1Nwflns/M7
	kuDILr4sOPeECOoe6xQaYkZQFJtX3K0AstZhQjdicJj25woa/FH40FEWBUAKz1BnCvYxJc9nJVY
	nQhrZWNpG8+Gss0ANQ/Zlze8LlKxCN1IIEPns1Eq95GO3Yypb5WpKGC4mmsX4UlCYACEpw7e2yZ
	Qaa468Gb3F4kPH06EiPuZgM2aru5GrRuLOL7+3cajKZBDXQN4st1c9vO2itA9/PVPtsn3YTry8P
	rxpRdHIwd5J9oQmxsV3OSf7DtBI9lA==
X-Google-Smtp-Source: AGHT+IGtYXVmqBAFmbk7LXbpDxQMyWUw0KBDYgsDqkcEnZhWP8dgPJ0odqZrRswxh/DPQhqrHeH9wA==
X-Received: by 2002:a05:6a20:9f46:b0:1f5:9d5d:bcdd with SMTP id adf61e73a8af0-203cbc056f1mr13712467637.1.1745132679468;
        Sun, 20 Apr 2025 00:04:39 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:04:39 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 1/6] dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K1 PWM support
Date: Sun, 20 Apr 2025 15:02:46 +0800
Message-ID: <20250420070251.378950-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC reuses the Marvell PXA910-compatible PWM controller
with one notable difference: the addition of a resets property. To make
the device tree pass schema validation (make dtbs_check W=3), this patch
updates the binding to accept spacemit,k1-pwm as a compatible string, when
used in conjunction with the fallback marvell,pxa910-pwm.

Support for the optional resets property is also added, as it is required
by the K1 integration but was not present in the original Marvell bindings.

Since the PWM reset line may be deasserted during the early bootloader
stage, making the resets property optional avoids potential
double-deassertion, which could otherwise cause flickering on displays
that use PWM for backlight control.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Accept spacemit,k1-pwm as a compatible string, when used in conjunction
    with the fallback marvell,pxa910-pwm

.../bindings/pwm/marvell,pxa-pwm.yaml           | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..0d97333c7fee 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -14,11 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - marvell,pxa250-pwm
-      - marvell,pxa270-pwm
-      - marvell,pxa168-pwm
-      - marvell,pxa910-pwm
+    oneOf:
+      - enum:
+          - marvell,pxa250-pwm
+          - marvell,pxa270-pwm
+          - marvell,pxa168-pwm
+          - marvell,pxa910-pwm
+      - items:
+          - const: spacemit,k1-pwm
+          - const: marvell,pxa910-pwm
 
   reg:
     # Length should be 0x10
@@ -31,6 +35,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0

