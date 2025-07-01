Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7D23E352
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348265; cv=none; b=NY7MBPDoW3dqpov9EO4T4W70B+BAmfdy25e85qQ7ssqRD4D+37QNj8CTYermHvXX3i5b5Pg6zNMRMbEWXreC6wn1NbRTOcmgiy/LdgUTUZFFSFEg8QFilFZ0284JSEuQuPqcD0kQeA+MKQXW8CHIQ+9a6teVKgrDQS4HthSd/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348265; c=relaxed/simple;
	bh=NIlTRZr0gcC7/jQ4AsqDDf4lWRiohLEHahWEpxHvWxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJU9eBSld9pvWb4N5NzF0VQU67Tt35oSeXuY86tMIm1DZIfS6QxNYX2Fb/BXdVYw0ivQZ6+hSH4C+5pcD4SqJ7pdy0n1vWmNlpXEwXxjO+6CFsBjoa/kcO6afwkMJ1e6BE0VTRQhkvsbElAERKTzqinPZWMRPOpUlzZd2DCtyQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=y4qYTNfW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="y4qYTNfW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235f9e87f78so28334175ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348263; x=1751953063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8FP50QWAxhaRk638SaOf4ESK8SqYeIg7LMU7MbzlTw=;
        b=y4qYTNfWsaa1/MH4dkwr0ubJLibn6aMH6Ng2vz3Qa1Xkg+S/WP8b1C9jEC6J3C8JF7
         C52De6iuiGO3ufPmxZRo/yFrp1KAcKPcwtbBTehXfMZ+JubDIdootfPNCHp6vkz+u1Eu
         Y3WfK74PawiHiNT4zWgc53OAgWn5pOUK2dJhm46H3e6sfedHEtLePA9k2Q+Opq7huxHO
         tGAHZzqo/lsdQ7dPglBrQX15rzIHo6SnIWWnJLsgw0Xa5W9mfilUCn27kxvfLZOi1WxN
         lvb0XnTgTU1nH30QaNYDRS0eYkcRRVCXu3H2fwniu2cvfP4MLyvGu8lEvqC7bw4Ot+Cc
         eJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348263; x=1751953063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8FP50QWAxhaRk638SaOf4ESK8SqYeIg7LMU7MbzlTw=;
        b=CrlFCKcKD/5bsTT1t+AqACSFUH4rm3pWlRTu3G7uVNhqv6uqqok3BgwCp7lgLpdRaU
         YgAsHF2FHf27DoMrnARq5mb109oITBOC/YzUTEpnFVXycX58mTlrjKccFSayC2onvjG2
         PPhYxYcSlQDtPNrPt4qz5oj2JnJPvEng7VEA2peRSl7Y3Yk5199FC7lAWi+0VEuyWY08
         APeET7ea6rUmiADZ0MHs0EJbQBC6/8iHgtNJWpa184me3vBeZ5fNH3oF7XPjizf8y8D4
         4MlEUZhb+BA/Atg3fbekN/AFauEaVhirrPhpFelMJIbFksSZ0CVH+swWfjURqxMSwguO
         f1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVDyl3LNwlg6SKvECcACrkMECL5+QagOSS+tHTngU3i0K6HiAONC8Azsg5YSYKfDhbMyTcevTXj6i6ymKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEd6hKesTV2PSq7FhM/DkBICUROMx7Z6AGhWncEv5lAr6VE5e
	PnJP2QL9XJq+LeHCPbrJiv9uQ24amxIcqVtXhmnwECW06dv7Xfmbp6YYw9WQPEuVRMQj24t00BA
	hnLsEUWkG3IVb
X-Gm-Gg: ASbGnctUKddxlzhBs6iNv0Gkpmpx4/Q5Yy9ckolUSmwPx5JbifIL8wEoKiC40FumW+R
	ysBRmFec/AI6SCCmToSqjbb9lJ04gYCpvLiEW8wgGoYM/XJHdk3OvgaKoi0iydhFvvSXWbKe6PH
	XBFwK1uF9nRzKkxcpw/fMUdCU9RpQjfsbSV5QLOowglNqjcN2Vg0oqwNCvd9zc14S4+C0UZNhLB
	GW0dxJiFzZTXhcMQZ3Zhb3tGEQqPqZ3sNXNQzsfscP+oklChmdM1BHOS0z0sOhCXB21YAj4UqZk
	H9Z9bDCEwkeG8DcBzJZgdIDBNzLeMCQxyfVavwc=
X-Google-Smtp-Source: AGHT+IFdEG/r6gnSMZ5F+fn/H12Ii9bbpF2XMMeZ4mCGdFa4TwRSqSrBT/QNNdd/8YlLJFb2+ZPknQ==
X-Received: by 2002:a17:902:e94c:b0:234:f6ba:e689 with SMTP id d9443c01a7336-23ac46341eemr214284055ad.39.1751348262985;
        Mon, 30 Jun 2025 22:37:42 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:42 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:36:55 +0800
Subject: [PATCH v2 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT K1
 PDMA support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-1-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add "spacemit,k1-pdma" compatible string to support SpacemiT K1 PDMA
controller. This variant requires:
- clocks: Clock controller for the DMA
- resets: Reset controller for the DMA

Also add explicit #dma-cells property definition with proper constraints:
- 2 cells for marvell,pdma-1.0 and spacemit,k1-pdma
    - (request number + unused)
- 1 cell for other variants
    - (request number only)

This fixes "make dtbs_check W=3" warnings about unevaluated properties.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Used more specific compatible string "spacemit,k1-pdma"
- Enhanced DT bindings with conditional constraints:
  - clocks/resets properties only required for SpacemiT K1
  - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
  - #dma-cells set to 1 for other variants, ie.
      marvell,adma-1.0 and  marvell,pxa910-squ
---
 .../devicetree/bindings/dma/marvell,mmp-dma.yaml   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
index d447d5207be0436bc7fb648dffe31f8b780b491d..7b5f7ccfc9dbb69bfef250146cba5434548f3702 100644
--- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
@@ -18,6 +18,7 @@ properties:
       - marvell,pdma-1.0
       - marvell,adma-1.0
       - marvell,pxa910-squ
+      - spacemit,k1-pdma
 
   reg:
     maxItems: 1
@@ -32,6 +33,19 @@ properties:
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
+    description:
+      DMA specifier, consisting of a phandle to DMA controller plus the
+      following integer cells
+
   '#dma-channels':
     deprecated: true
 
@@ -52,12 +66,47 @@ allOf:
           contains:
             enum:
               - marvell,pdma-1.0
+              - spacemit,k1-pdma
     then:
       properties:
         asram: false
     else:
       required:
         - asram
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pdma
+    then:
+      required:
+        - clocks
+        - resets
+    else:
+      properties:
+        clocks: false
+        resets: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,pdma-1.0
+              - spacemit,k1-pdma
+    then:
+      properties:
+        '#dma-cells':
+          const: 2
+          description:
+            The first cell contains the DMA request number for the peripheral
+            device. The second cell is currently unused but must be present for
+            backward compatibility.
+    else:
+      properties:
+        '#dma-cells':
+          const: 1
+          description:
+            The cell contains the DMA request number for the peripheral device.
 
 unevaluatedProperties: false
 

-- 
2.43.0

