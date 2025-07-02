Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9D51EE7A1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447584; cv=none; b=tssVD5njj0Zzerz8r246j6dAgNzXJvj5UQYIz0c/3WtM3AA0DK8RyAgQ5FEO+Vk4qBKbAaxT2T82GFQIK6tBRI6H4T5wXS12bP8gUuSBvEHfD6i7No3uwGRz7OLfae340vN+1M0GP4It2eJgIftWmQYrm5akQ4RLKnu2EovylXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447584; c=relaxed/simple;
	bh=Bw+luCpgfro4plTSzFDqCPmRYgzWS01RJtIYCu6pB2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Cuktz3VUUnBgv16fH+Rk9/H9Me85ypCX43QnCIGOUpS4/yng5z0Ffhi09aybMSNF/FMPlYoCcDzdwPjxcD52MUMvIB56zhgHGjFo0BUn7qsTnauSxJkKQDSHkRJZJFHYylX5DRliKLNfoX4UIErl81bVgYcs9D9rp5ZzYtDXKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=N9Wy0j0I; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="N9Wy0j0I"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d41cd4114aso1142691885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751447582; x=1752052382; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=05oSeZnKkOuwHRWSxX5BsGUyoGxJgB1j6SCGcyk/mG8=;
        b=N9Wy0j0ICRCwFRBtyvAhAbj63REf0h0DMlAczkhotv/LrB439b6jhb5Zp6hqC3byt3
         MKS6tpP3ESEDek7ZreGzitOQzCb8AKDLAH3pCDy36Q9X+LJzrlGj21mdU4Ilwc3kGl9m
         SVkNpdus/dMgu3daps7Q+AvLxAvfvLcWOEhA3tDddUzDHd3mf1/jeilRwgS2KfVlXLKP
         07XdM+FOy38b6tXPkkPmUaEJZGZhzu6DqD0soEnehU7J4gt9cVeQAFCyd5S+JdKE83CB
         xY0945R9GhCe5p2X+NzGphGSmwoFn/lUbcVxU+6ZT5lyGoz2+VfdRRvp9NwbG+Mx0td3
         LZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447582; x=1752052382;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05oSeZnKkOuwHRWSxX5BsGUyoGxJgB1j6SCGcyk/mG8=;
        b=Sdw/WKOQDxm3xMZN+cCW8LPfajwJWUmW3UF75mWAmfPpRvokqVna150TQncK9xmEgW
         ApRPxdsu88+Zj2QNi0u8Ypz3CQGPi75bo1IqXirOZs0utbvtX/5pkRACJQYED3182tT9
         mMOlIBFzuJx4tIPe2snO2cMWvM3x47SeiPFn9kIK0IrizxCtgH3eUqSrRIYFp19pJ392
         QViuJOdYolo+RH5/Ze1pP9YNMYGA8tC1X1PWIfZMxQF1nqU48pskWzgcmjgOz+tDso1V
         vODEuyYlNyX5IS1PRkq79ZnP9yIxzHSe3+9ybUGg2iZOl1xrtFGbeFrUQ4v0coJAF7XY
         EF7w==
X-Forwarded-Encrypted: i=1; AJvYcCXd15aiw3twDI580fRp1jIfCm1Du2/d/VjioyaXzd3cnTzv18DqwC30bRZcGbCapcEaF1pG4MNa2Uplsv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9etYCgOCkgm5IT32mYCFTk1h0Ts6yLeiMsnSc0lCqhg+5q7C6
	aP4+2PvAvnZoNPsMAOnFlSYadjPsfUqb4pvzobUes78l/W1Ttmm84T0cOJ2my/oTZt8=
X-Gm-Gg: ASbGncvUOHjnTqNxaieU8G6qsfqE7Fc9R4KAT5eLWmd504raKMu2WHGZqTxG7Mwk0bE
	ennFMhAQ+rliwPQRTnASZROdP63Owm6BJg1wUROk46jovfGMJSk1wgs0GzVsooozIGLht3Umlyt
	EPsawHUcoVIB7nhsLpw3igeOtNI4JGd9cNoK43GMC1vs/FvJ4ire2NMZxqsYslnmmf66e+g15gq
	JAlM4ojy/6l6rWf5OJAIzGnW9r+OzwK/IfWDBPsFs7Ez4td4zDrfdf5YkVmCLvctNC2qV2l7XBw
	r/Xz6katpMoZzXnTgcgsIAyIPneE4Iavph+K+th/5CC5PuFvK4Mer9HAO+Bj/X74WmCyZz1oAe1
	ywcA6VOYJ
X-Google-Smtp-Source: AGHT+IFJq/oyXbT34XXbgyZs+VaHr9wzfkSMmLdoDz1YCb55z55iK/HwDroOxqnoVByLo9PegJxBuQ==
X-Received: by 2002:a05:620a:439c:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7d5c4718eccmr335297885a.32.1751447582153;
        Wed, 02 Jul 2025 02:13:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431344f7sm911736285a.2.2025.07.02.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:13:01 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 1/3] dt-bindings: power: Add SiFive Domain Management controllers
Date: Wed,  2 Jul 2025 17:12:34 +0800
Message-Id: <20250702091236.5281-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702091236.5281-1-nick.hu@sifive.com>
References: <20250702091236.5281-1-nick.hu@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

SiFive Domain Management controller includes the following components
- SiFive Tile Management Controller
- SiFive Cluster Management Controller
- SiFive Core Complex Management Controller

These controllers control the clock and power domain of the
corresponding domain.

Add `- {}` for the first entry [1][2]. Once the SoCs are ready, we will
add the SoC compatible string at that time.

Links:
- [1] https://lore.kernel.org/lkml/20250311195953.GA14239-robh@kernel.org/
- [2] https://lore.kernel.org/lkml/CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com/T/#t

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../devicetree/bindings/power/sifive,tmc.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml

diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
new file mode 100644
index 000000000000..4ab2b94785f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Domain Management Controller
+
+maintainers:
+  - Cyan Yang <cyan.yang@sifive.com>
+  - Nick Hu <nick.hu@sifive.com>
+  - Samuel Holland <samuel.holland@sifive.com>
+
+description: |
+  SiFive Domain Management Controllers includes the following components
+    - Tile Management Controller (TMC)
+    - Cluster Management Controller (CMC)
+    - Subsystem Management Controller (SMC)
+  These controllers manage both the clock and power domains of the
+  associated components. They support the SiFive Quiet Interface Protocol
+  (SQIP) starting from Version 1. The control method differs from Version
+  0, making them incompatible.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,cmc2
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc1
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+# The example will be added once the SoCs are ready
-- 
2.17.1

