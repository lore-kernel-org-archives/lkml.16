Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9982E610A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646764; cv=none; b=OOTcYjHPpYDgo+7T8sVQVdd25C+UhWj0kjCh9ecBqRPzM5sAVm/Bp+lLzNHyNsrlENMcYtw1op/NSEHvZz4jdFLrlNc+i3E6/eLo2qdjKNmU9gxBLNJRCf0fYKzxYNO87M59KAUmE2l1NMRLcah8BOT0600hbWvjrA1RzTM10Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646764; c=relaxed/simple;
	bh=mfvf7YBc75gKcXozHj9WT3obpDew9OmkoOmyIZbUJOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIQznyZ60V6UsDgJrEH0x0HpYcAeNwCmYmQ6LedYIrys8z6nGH6hWlcSD8Q3rOYLPEkmooGg1DRPgs+5vDy7qHRBumnDOmRcm+Il3Vv6e0IBdPA+wxHdoBoz3OWSzqjm+1Z5UoQC2r0O0Lz3fHo0k9n8MooLl8H1yjlmE7Vg3WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hM14zkjr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hM14zkjr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235e1d4cba0so55418595ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646762; x=1750251562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgXKWx6LT0v0t2kW4DENrP//N1tJL1EVc4tejq3gXuU=;
        b=hM14zkjrM1Ob8vaP99XQIs1taUKdX/jLl2V0nQTw87R2W1T3Gca1eoLENIDYvm0lVu
         WMtT06rB7UI3i38v4/k3A5AzDPnpxk19swoDBbdEujfm7tuIICkkch+pepJH9/f+Z4Q7
         nMWQqC+w/Dbtib0ItgoIJKIRpjZdt7KgMPWZKvkFi0hXPEZu75eONtrSk1AEnwfAdcA3
         C36riXVgYF/XeK8mEqe6HkV066cJsUeEyGgIhU9UauS+WZZrSsClQoPi3cekf2dTO6Xf
         R0XDH9nSn/ag9vFosJMa03nLYpbaDG1iaLdRkW5TvtYpjGCISMOOR65fX0c+B3gMWdwq
         dL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646762; x=1750251562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgXKWx6LT0v0t2kW4DENrP//N1tJL1EVc4tejq3gXuU=;
        b=dr6I92UmKmy7+Ayy84L4EULhTvMl7unPdHuV26qY/CEyQvpMXpdbDypi+fgY8KfgD1
         nXmeOzgXRL49/zjTHQe7H6jaUwk4QLh93djub9/9qWwHU+VQ+qg7imp2ynDdghy0LFni
         G4Ue3ecBcs4edgKFosxK4+l56yFuraS1w5udQWduUfvziG91C1evIZ/gNDI6CrrLmsF3
         lV0BhnSSFKr2+SnAaTWuhG+5S7RMiEpb2kvvv7/c4xWMEONHte4+Xh/EyzRc/dOX81L/
         3QqThHGMCYmwa7O/+y/iDqvNctiAq5mS1KbsTP+e2G06ceHnWVAaq08O2iOTp49UVTmo
         LE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKzu50QmzZooknUP46P70ZsdEZQtUivLoas45ZZ2mFMW+D870ug5hVGRZZcAdiXgpnk+TXA0dVgpZ/YZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtJ25/SINTyRLMxGvdL20Eu2HJH6GSywvikaUurIrAQCrYO+DS
	bNoP6vLc/bIWiKS+rrQI6UbFYJeMIyfkkCGc4SV6BI5MWkcT/rkA4U6IngekMwPZs5w=
X-Gm-Gg: ASbGncuyJJOTdPeS5AOiAq2SqVS9UW2kHyUXyyFgFsejdHpsvVshVJvq0UKBSUl2QsC
	kkegTCsLGvUL9LApugRZykqdotyeuCKjotZLyVJJmFiqRSeB2RXoQs5noCsk28RRavdbMgm3o8L
	2YwsQvJGy7AlDwUAxpWv4uhk0G81UiGEmvFnaN/JwVWapee+5v/4zuKFq24ES94SzcnTag06f2k
	ddm8qJQ5zua0q3MBt5LlCVEX2JfKFhU4Ok/9zF9bPQmoFobkeVaskugBnvQk99eNvu7iIYWiKIF
	8I4HmVeFwWBBSgEHQasAtXkzVcp1S40bUzkvtngHt6pEzX5tMvMzS6wqQ89bSkM6C9OEFZviW6u
	s7XMGBsBXvV9Rngu24ggC4mB2DaYYpd46
X-Google-Smtp-Source: AGHT+IHP+0owmszooM6L86XNZc5ha8+zkwg20Qojl6bQqCgBkl02MT2JBYiauh7dcDoSUFp6EUtZTQ==
X-Received: by 2002:a17:902:f78b:b0:234:b131:15a with SMTP id d9443c01a7336-23641a8aad8mr44833385ad.4.1749646761961;
        Wed, 11 Jun 2025 05:59:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:21 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
Date: Wed, 11 Jun 2025 20:57:16 +0800
Message-ID: <20250611125723.181711-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
controller in the Marvell MMP DMA device tree bindings. This enables:

- Support for SpacemiT PDMA controller configuration
- New optional properties for platform-specific integration:
  * clocks: Clock controller for the DMA
  * resets: Reset controller for the DMA

Also, add explicit #dma-cells property definition to avoid
"make dtbs_check W=3" warnings about unevaluated properties.

The #dma-cells property is defined as 2 cells to maintain compatibility
with existing ARM device trees. The first cell specifies the DMA request
line number, while the second cell is currently unused by the driver but
required for backward compatibility with PXA device tree files.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
index d447d5207be0..e117a81414bd 100644
--- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
@@ -18,6 +18,7 @@ properties:
       - marvell,pdma-1.0
       - marvell,adma-1.0
       - marvell,pxa910-squ
+      - spacemit,pdma-1.0
 
   reg:
     maxItems: 1
@@ -32,6 +33,21 @@ properties:
       A phandle to the SRAM pool
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  clocks:
+    description: Clock for the controller
+    maxItems: 1
+
+  resets:
+    description: Reset controller for the DMA controller
+    maxItems: 1
+
+  '#dma-cells':
+    const: 2
+    description:
+      The first cell contains the DMA request number for the peripheral
+      device. The second cell is currently unused but must be present for
+      backward compatibility.
+
   '#dma-channels':
     deprecated: true
 
@@ -52,6 +68,7 @@ allOf:
           contains:
             enum:
               - marvell,pdma-1.0
+              - spacemit,pdma-1.0
     then:
       properties:
         asram: false
-- 
2.43.0

