Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BD028850D;
	Wed, 28 May 2025 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441367; cv=none; b=cRdnYsemEbcSlPLHbvja9yMh1p2YKT2gfJ6tVhCVew3ZSOr2vIyTa4Pk+zdjbf7S2LNUiaddWk3bJZcEK9OVKHOmOy43NN0oYkQOiJXEiU2Nqt9/IeniklnkUuF/leSZoPCVyldDgyEqKbTJGind4Ye2AT/S13bvxE6D+k++rmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441367; c=relaxed/simple;
	bh=0l7IyD1PyOaJwVzZrY+VbZbwmJfSATFaL3URmnvCnO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzC7XQhBiExKWhucuV382ASAdVlxatj/hnlSfgUTkZeJ/MPnHbPhnclUYwrryMdT3LLNcgacOJvKSTkcPG+CKoOq3dUe6xFnND9ZDCRRINgvHso7snR5Q6DLrvdxQX4uUTX4L2DmQNVIxsG6KUNiPWHvz0QfjUBRz0aZvc9vDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEw6jAMk; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEw6jAMk"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3280ce0795bso43966281fa.2;
        Wed, 28 May 2025 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441363; x=1749046163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkQmm/gioi3gmAXZMIqfVwvbbPw33JSg0RZs+1a/uyU=;
        b=OEw6jAMk26phMWaeD24klBt5ltl6zT7WrC2Au2srKKZqUWhMn23Cd4XU/K6R9Wm0QU
         +Zj/o7UPrzm1p5GJT5tvgI08uX76Py45BDUP48UoXAE5zpIzQH2jloW9qtfAtQIozoo4
         r4mfmmc0ZZyfNi9Sc9WXdOsfr8Qlco5N21P4ywo82sfp+UV2G/BzvAqkCx0Yc8wbpx0Y
         jExeY5EVYHWpIA9zRNjG3EBcW/XINyAMVXVXwa/2wxzNusUVfyDQQ8wx4CAwunzfAgwL
         Ej34ih4zdZyKCHnChPHmDUiXJihCYyJ208vvDbVS0uWv1XIoOrSPd3MY3DJV55mpehxQ
         tbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441363; x=1749046163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkQmm/gioi3gmAXZMIqfVwvbbPw33JSg0RZs+1a/uyU=;
        b=tuJC6cJM2SXbKfLEINzmoBM0qLAKhNBWsnfM0VHjZ6S09SsvAZyyHFrdpvnnYi3DAd
         FM2GzS9t6zRBQNx6KiZumypCWnLMgLKVVxv8LrBrEM88769jpDSItTer+Spa1g7EvsXR
         1JYarZmTqTq9tMYTopNjrAhCNomQLeEr56HBB7GCz11aNmQxZUGNgb0JNAq+cXk16TXi
         1BhHaKYIKI6a1Ve5dSf8Y2tnIoh3FjXAK9J9JN7fbeBbhDXhOSQMn7gyDAdLjJjwunWE
         GQ1j9SoG11YgR2lnYP4mwqd2wvKJXwOcy+mEPTD7G+fwlmNRotm09kjLyttqNVPR7Jjy
         2ALw==
X-Forwarded-Encrypted: i=1; AJvYcCURrqsTJh0jj9+vv6/642C8AIyG4VN1x6td5sSNAtmP1H9DSSBOT1QaoZsHtvZHtiCQDhC7j+z1lKRJ@vger.kernel.org, AJvYcCUgkTsX1yPrm/MOuNgl1e3SYKd1/7yfIHZ0BiG/gGzFSqfpP1A4poU/xnu59+B0jR8Zze5tng45vxud@vger.kernel.org, AJvYcCVAIsEKiW4pR1YfDvn9U5wETmjQBAOSpIItjHWleNqP/6xgnRnxqvq4hbqqsYOr8OCmAacKQFl4iFiGa0OR@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ+gEyl7ppNLWRshYWrTdJQa0LeynJkFsfNiKiB9LXmXaWwZEV
	5NnUJre1d3r4bt4I8y7fTaHz3zea0s/0WRdrgNKNPQz2urJ/5b0b+BwfQ5YG8oxvhS4=
X-Gm-Gg: ASbGncvs9iJGnC90YjyaOgzPVcymxt/q9qIdABWfmNJR8Xl2AC/5Y/CZ+lI3rcwYEqL
	McPknrA6rpWmAmBnPbZUHoZcSLpbrjZYy3qQ1XRqr9I+BVacEBzXZ/7IYEmJjseshnO1p/1l4XC
	hEF0QiFeTM3KJ+k8xxWWaAKouWWvgYU6CUQupnxH+MWSWw/l7k745frjoY60O/W1v+B94Yuyyae
	xsPzTYNwYVBytbCzQ1uER6pSYP1vvL0q/ie1bXACbQrWQ7zzpxatp7kc0LcFuOM/8Lpzs91nptH
	dKkvkzp8y3Leefks8ZjgHNHxiwIA8F4vJXfpOt+wnitBPv11U/VEzb7wOsoIU0mA+96L66AECR4
	jb3oR15XqGz2BoTmPCez2TIU=
X-Google-Smtp-Source: AGHT+IF97u69sZZS/R60n7jejBcfArSpYTBnl4M0lKfAJC66H6RU04HITU+/63ETFHC9psvysJoGyQ==
X-Received: by 2002:a05:651c:3123:b0:329:2135:9cb2 with SMTP id 38308e7fff4ca-32a79b831c9mr7611821fa.41.1748441362956;
        Wed, 28 May 2025 07:09:22 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79f698dcsm2594311fa.92.2025.05.28.07.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:09:20 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: clk: fixed-mmio-clock: Add optional ready reg
Date: Wed, 28 May 2025 16:09:16 +0200
Message-ID: <20250528140917.876453-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528140917.876453-1-edgar.iglesias@gmail.com>
References: <20250528140917.876453-1-edgar.iglesias@gmail.com>
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
 .../bindings/clock/fixed-mmio-clock.yaml      | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
index e22fc272d023..57419b4de343 100644
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
@@ -29,6 +37,24 @@ properties:
   clock-output-names:
     maxItems: 1
 
+  ready-timeout-us:
+    description:
+      Optional timeout in micro-seconds when polling for clock readiness.
+      0 means no timeout.
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
@@ -44,4 +70,13 @@ examples:
       reg = <0xfd020004 0x4>;
       clock-output-names = "sysclk";
     };
+  - |
+    clock@fd040000 {
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

