Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481F822FF3B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879806; cv=none; b=iKSGJddpHL0PegW0/kV9Bgkjmf5VUNvO6T/kKGqRUu+AiJrrJsYnyqKFaze0CuV0HrJYohrDSKXlRUGNAoxw9Mu0TVs0lVbn4xbUELDhV7dEp+fv9fQc0f3ME3G5B/cAvrCs1fE1ubjZhRqVERq/SD+4F0WhyWYL7bi9NPOLd0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879806; c=relaxed/simple;
	bh=AL/Q38C8GaSxB2X7k5q4eSMpVP3I19XETccxZ0i5coM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=h0b6y0Z6kKD+UHrrQZmjKgojA5LBeOLZfFUGUq5d+klNWN6DxDITnta3qsuJrSmIzPz4qaVmeXu6TSRsKLHCBqLiODdMWEDIG629A3Jcsg67LZO6Fea2f1gpwOlKoXx7yz0AJsdbeo7SFq0cIkPjOXAXLMcVk34AO4S3I141aCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=c4Qdvfg8; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="c4Qdvfg8"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5fa22d0b88fso834615eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738879804; x=1739484604; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/a4xSagbqmb3UAk03PlQCeWIa4LP7rwRFx2VsXaGsc=;
        b=c4Qdvfg8OlT6hyAxhE0d+XDrCrKjQhneFcw+wMCTWxYPXacw52kid/Jd/SC6Sl7evx
         IdXx1uSIpY/Lr27wJa3GcPSYn0SzMe+EG4QFt1CApbBqizkLIZErceIuTUkpqgX6VCVe
         DFHRdCvC5rDiUXNr8bwVYvglhWF8xfip6GBxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879804; x=1739484604;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/a4xSagbqmb3UAk03PlQCeWIa4LP7rwRFx2VsXaGsc=;
        b=URmPTeMYGTub+qYvmhHUM3Mhw3WEEtxK1lDokQ6KYkOJsQ3QMVigp/CcpoOcburmlD
         W0KyW2g1BDjJpileVSd0nEAa9q5yfksDS4Cp2wl38SzXSs7761v2My0JBW5o2hbAr3/p
         qM8WhXCTgaeVA31KchYJLIgFaXeame0ezQg9HXtRtD/mmNsRcgZxdspyzpAHVBBM7ZjK
         pPEGZzVgMTKkxW9Dy507ssR+OJ6oVmOXQLsCr+6z5NRgsZqCdk4d/MvHPmATRXCFTfGc
         VvwrmRrpQJyQ6Ym2Pq/iajk/PKMvGyEegaN9pOn98tVAzBU90ebS3UEVAV3bENSJrBG8
         8FGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsIP4/6pqiskarUFIgFuQ3FnCHa9nqBj1iS5xNCVhPsJLU2BasbML18Kqr857zpDcQS7ZAphz5LeD9XvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzivmiyvQ/kQ7chSnS1ISH34MiCXyjqOe/djf5DgbaOxL/ybK92
	fYDhlw7KdfLUxNWM8nmZ5tlcVinWkd1YVIz0UMqr1RKQwry02hH10oVWyhlY3w==
X-Gm-Gg: ASbGncttio3NxNOW92Mru6YVNvVB7kmjnoHEWdX+OL9KnMsYWjJpq3/ADBBpRNMBL5D
	gx7F3vcHTo1WASTntL0//XAsdm//YadoRU1xN2Dw1DDtaVa9OWPrbztwCJo6p7QyXBaIkI1iyhB
	ukllFB093oBHh8OGAKV1vCDRCATbAFw8uicpP0G4lY0hEU7O8cPPvCvG/MR5S0SXAnBjKDRgAB8
	d4XW+H1meEOzIm4cnY9d+uz7GJctBlXr40vhft+VVy/skPzgFp4viWSx/Grk/6READWdCIycw1b
	SXG8pL4dC5Gxebeat6W2wc8fXyJx1jSlyBTFX+H/vSj3qCn53Hk=
X-Google-Smtp-Source: AGHT+IFUhC9g3GBMlrCIsfgANO5KdvzDEnLHzgT9bVl7MomkcLWvLwEBIiP+tF9jny8ui4xtcfFe6w==
X-Received: by 2002:a05:6820:1689:b0:5f8:b916:2516 with SMTP id 006d021491bc7-5fc5e45b47fmr729717eaf.0.1738879804274;
        Thu, 06 Feb 2025 14:10:04 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544cf88esm454109eaf.15.2025.02.06.14.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:10:03 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH RFC 2/3] dt-bindings: mmc: brcm,sdhci-brcmstb: Add sdio sharing support
Date: Thu,  6 Feb 2025 17:09:39 -0500
Message-Id: <20250206220940.10553-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250206220940.10553-1-kamal.dasu@broadcom.com>
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Kamal Dasu <kdasu@broadcom.com>

Introduce emmc flash sharing support using hardware semaphore
and SDIO share register to synchronize between TZOS and linux.

Signed-off-by: Kamal Dasu <kdasu@broadcom.com>
---
 .../bindings/mmc/brcm,sdhci-brcmstb.yaml         | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..b0ee39aeccb1 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -27,15 +27,23 @@ properties:
           - const: brcm,sdhci-brcmstb
 
   reg:
-    maxItems: 2
+    minItems: 2
 
   reg-names:
     items:
       - const: host
       - const: cfg
+      - const: share        # Optional reg 
+      - const: mmc_sem      # Optional reg
+      - const: flshr_ipis0  # Optional reg
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+
+  interrupt-names:
+    items:
+      - const: SDIO1_0
+      - const: recv_ipi0   # Optional interrupt
 
   clocks:
     minItems: 1
@@ -76,6 +84,7 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
   - clocks
   - clock-names
 
@@ -111,7 +120,8 @@ examples:
       supports-cqe;
       non-removable;
       bus-width = <0x8>;
-      interrupts = <0x0 0x27 0x4>;
+      interrupts-extended = <0x1 0x0 0x1f 0x4 0x18 0x11>;
+      interrupt-names = "SDIO1_0", "recv_ipi0";
       clocks = <&scmi_clk 245>;
       clock-names = "sw_sdio";
     };
-- 
2.17.1

