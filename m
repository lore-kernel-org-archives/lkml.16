Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356137263C;
	Sun, 25 May 2025 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748200095; cv=none; b=b+iK6jswuLgKSvbiOCPDwRXLMot62ft35TAoWX1ijF8juV3uRSjXafWrBqHqXyaJDwZpePZqOGkxEm0VNUjKDk1+D92Ws7whQ3Kb/ZT3WZTkYMj7G4hKsOETrmoRHXw3ElcbSrZp/rkLLxJMF9mjYGnOQ0xt/HOwnNwuqqRQ8Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748200095; c=relaxed/simple;
	bh=sZ5P5mw9se3f5g6UprF5EyyvVvan6Sobm0FAyN+z3b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdcJjKwgj58Tshtfiy/S72itRHdUAiDlJhJkvAV8RYMhyQEJV64NUEpJGOwtIaQ9sltx5h0iC/FuU/HrS/o6+0fYr5qq1ClgTmPP6pnAPWUmt6RosEQw60p6Lt/b11HMBeAWI6J3ynLuZG1jqtt1ACowt64GRdkmnLTE3qtVdU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0w4ikkG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0w4ikkG"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b0d638e86so2775857e87.1;
        Sun, 25 May 2025 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748200091; x=1748804891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCXQuVtRhMPnFp/GIoALd4PIYpi+ZMj5q2i+9emJxis=;
        b=e0w4ikkGXABZq8UuLgCMGN9eNmLoP2wp7E+W/3CIXLdMZv/fSHJd67wCCO+H60mWJU
         cm1xR7Wx/s6yedqZLdnecyd5I95998ksbxp0/cHAY8FrIq7R1bg83p3YpUQn9f3e/tkr
         1yeQvLYjqmFYbmYQNy3zdeo4SFYXpDC4+H68gsKRHPN9tAQ+ROMsiqU3qhm5647QulRh
         4ZiNGCHIyjcpGzoTzVDFbhgsq/eYgFjFCHwVE+HixZHhpA9d2DwLg5EnmGVZpKEeVPNj
         SuZa6n6gkiWG8Mvs3fAgxM+iPlB4nyMpHKgL7zmqhYc8I7Ogf0OPNdZqn3g/fEvuPeKW
         K1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748200091; x=1748804891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCXQuVtRhMPnFp/GIoALd4PIYpi+ZMj5q2i+9emJxis=;
        b=mr3a0ZrTVZjKXdNu3HHMhIU2/vNMTCgv9ivVJxLJAr8uAxcJ9N+P6xNTA7WJG03YXQ
         X/edwaDAPDL9gNsFuuOJOOxHd9blyGxPIAadzkry1o+q/LY63A2WlJnHQqTgEGYSD9IX
         F5WIE+K6vyXjpberfOPC6m8CTRlCzPdl4oUg26XJ6WIEu4/Ma67v92E1gqWzy1RFLKQM
         Vsi8T2smM/WfsbtycQnGmPHTqBfAOTDv6dfjiZYgq7kaWQsjPWw/TNbRqMLRjWy+ZVH7
         FkitDBussO+HBTZiOWA762GOE8zhZqAGqhprzAnCnee83ebVJ+XIC04DokPktzwqmk53
         MwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv2ERri4f/DlEWMCv0GthMZxOzPBszMBTarwyFeaQZEwiWfC7Of1WlvG4n8Hfp+9bUzzWmmtODIXnxoCME@vger.kernel.org, AJvYcCWjiJOv5wgb6H3U3l7xPYBA54iabmyRpG0JmbnU2m4yqAF18QwS6gspPhtr0V7anXUHOttpO3xfvb+g@vger.kernel.org, AJvYcCXWRf8YEq96Fy9MqXF1xm7AjmqXbmvqJF0h7cnG0wLR+OB19/eDqLuVs2mcIn4TuPlnNcdnbna+D6nh@vger.kernel.org
X-Gm-Message-State: AOJu0YzC1yFTEFm2VnNcEzFxmqs9WZffkMAKqvfuyeA4nIytf7dwDSGe
	iDYYEuJQE+kJ+w2UGadBKqinIalvzAxqVcPXpioVD0EvuRjZ2ee1h3r+
X-Gm-Gg: ASbGncsJ9SSi0ph7HQ8LGdsVpG7TF5KN/9r19UUTHtGi5LO7yTPp6ddf9NNS9Bo7ZFr
	G/SJqAftGPbcH1eoMnokh6brhSPPE02TNS8QrnCF18HtEQN3x+0RX5S9GeNlOH++R8PfmoN61go
	JvTdl2APp36ezF8n+11v04kznSi5pz0zRH5rvvJCJdx9qN5qpRqxEluTxTXIXwY+O121B8LMvRt
	6uur1UFJdjkJ9v3gkl9kfxtf8MW6zuWJWiG+D/P1ocT4SLoOToyyakyWbANqq1WGX+rzc1BPw5u
	ibvFguYfxhCX3aa9xbHkDUWW6a2Slss9W+vsoaGvGVwIchS3iywaXc2a1ozXF1l7VvDeELd+Yjx
	RENH5BDvA2SfIhGR66YlapBo=
X-Google-Smtp-Source: AGHT+IGFtM813f/BltvPo1y58g5K6ByAWOFf6/IyKN7x5J6HlznthWBxaFjM/XqubyecxmfG8NQkaQ==
X-Received: by 2002:a05:6512:b98:b0:54f:c402:c55b with SMTP id 2adb3069b0e04-5521c7a8328mr1752663e87.10.1748200090934;
        Sun, 25 May 2025 12:08:10 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e704026esm4756078e87.241.2025.05.25.12.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:08:10 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jank@cadence.com
Cc: edgar.iglesias@amd.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clk: fixed-mmio-clock: Add optional ready reg
Date: Sun, 25 May 2025 21:08:03 +0200
Message-ID: <20250525190806.1204531-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525190806.1204531-1-edgar.iglesias@gmail.com>
References: <20250525190806.1204531-1-edgar.iglesias@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add an optional ready register and properties describing bitfields
that signal when the clock is ready. This can for example be useful
to describe PLL lock bits.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 .../bindings/clock/fixed-mmio-clock.yaml      | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
index e22fc272d023..90033ba389e8 100644
--- a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
@@ -10,6 +10,11 @@ description:
   This binding describes a fixed-rate clock for which the frequency can
   be read from a single 32-bit memory mapped I/O register.
 
+  An optional ready register can be specified in a second reg entry.
+  The ready register will be polled until it signals ready prior to reading
+  the fixed rate. This is useful for example to optionally wait for a PLL
+  to lock.
+
   It was designed for test systems, like FPGA, not for complete,
   finished SoCs.
 
@@ -21,7 +26,10 @@ properties:
     const: fixed-mmio-clock
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Fixed rate register
+      - description: Optional clock ready register
 
   "#clock-cells":
     const: 0
@@ -29,6 +37,25 @@ properties:
   clock-output-names:
     maxItems: 1
 
+  ready-timeout:
+    description:
+      Optional timeout in micro-seconds when polling for clock readiness.
+      0 means no timeout.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
+  ready-mask:
+    description:
+      Optional mask to apply when reading the ready register.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0xffffffff
+
+  ready-value:
+    description:
+      When a ready register is specified in reg, poll the ready reg until
+      ready-reg & ready-mask == ready-value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 required:
   - compatible
   - reg
@@ -44,4 +71,13 @@ examples:
       reg = <0xfd020004 0x4>;
       clock-output-names = "sysclk";
     };
+  - |
+    pclk: pclk@fd040000 {
+      compatible = "fixed-mmio-clock";
+      #clock-cells = <0>;
+      reg = <0xfd040000 0x4 0xfd040004 0x4>;
+      ready-mask = <1>;
+      ready-value = <1>;
+      clock-output-names = "pclk";
+    };
 ...
-- 
2.43.0

