Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76236166F29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608999; cv=none; b=h74YQfXcRFeNZjL6ds12m43TvQ9PEmZSgRyzW9iUugiVKMBRtxlp+39AAEseVoaK8WobTxbBJOHCJIAlBKcaiM8hx/jAV3gl45IC4QOdDfVhv2mO/XDD1JBDefuTyjrVHy00qQ99HXyc4ctZOmhbhIiVS1wICj3QeEz+haTBFzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608999; c=relaxed/simple;
	bh=R1vtErKl2BzedEvjhWWXJCdtLNjDCmhp/prRalj0xAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foVrZXxoRwGkWYKd8odxSiIUbdwsBCDcksjteIIvEO+xLBchoOzxWVhR89BVzEHAfkssTaPiFcgp2dG65Sgu9XTOpKXkchpqiFvYYDa9LIhCywuROQBBw5q8YCWP/clRBOvOSI2goMZW9t14KHGyXTf7qRSLAjYKbwhPtfa6b5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q1texYzu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1texYzu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso75266415e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743608995; x=1744213795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f19WgeQ78sxdiIjTFJ2APJJGvVw1dxzyTwQ7DYBPLY0=;
        b=Q1texYzumRcfQRVNQeYCYZgZR6eWmf8PbQi/d259wQVf19ZERezxIvI2d/QoLlLjdK
         YUtPC7l4Q50GsAvmmG5q7bK0d8EXRT9UBjHBhUW/V8N55TBi9SJqWLUgc+GISkCOHnYp
         TW8C8ZfOl2LrCx3nMLj5njeZdhBP9ix8ll/RLgwQgERKCuY9+ZUySdKqdxhLbQrEDhcj
         RIS8PZuVJ9egjJ0an7TgEtZIBZJ5lmwo6pJ5BIy8p9M5my5v13LnBsAK3eSGH9Wtlbwe
         6LTONMopPFe5GEIB/ApoTuq6rIi0XyRFn4YOeisRP2OeAHwXa1viVQiZU88hgR+iKEC1
         Cb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608995; x=1744213795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f19WgeQ78sxdiIjTFJ2APJJGvVw1dxzyTwQ7DYBPLY0=;
        b=mvZa4cwG6C5E6LiCDYc8k3a84IUnC5ggHtQJzBEgtpEdssy8XPj6qQiVSPDGQL6zEC
         BHaXsZOLlAO0JrTbrccxpqZHcscvjJ+Mal/bVM8A3v25PX+aADSZ3gvx4a2Fye413mNI
         NPgbbCCXQnW1KD/5baQcFuSFeta+ygHCKLMT8P7XhNnPX7Dp8dylavE6qLXWNDaQA+aY
         M9B5Qx3ynjJ2aU7poSoNL1agzHuiTt1w5MVTidBr+lnL9lUsBQVbWCGMbYyK0r/+w+Ji
         O4YbYysnmk1Y0572hS76q+oirpCY1xso6nVeCpnGt5xgS290LK6ejaRqXnHEKRFtWaMb
         YA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjy0bOkhXjVufH4k1oQxOgfpCI2yMyrgLi3JYpNMzgBNcovU3yurcvD3rwHLSGlA7gNkJX7z3cwBDcOVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRaygeovNfFxdZhUG10kS9ym0upOwqzrC+AFEoJMDg7S6bK5Dx
	nM/pQFeK8rUgfW7rnjBoQA4ZoQWZVxunn/gwdEWUGwvLFwCusNoaTmnbYvk832o=
X-Gm-Gg: ASbGncsnUOalrXJbmOl1CeEIaF9Kb4FW8Kg37WTIH+Nrw5lGAVwsf2WDSnpTFiduqd/
	ioFyJyfLY6kOyMDztC0z27R4YStoqCN33gYALE6hbpB6hJKvNR262w1lcRVhyaAuCKIgtZwCgal
	mZgfotPm8JX21bmE6oJqipdCCUkovXclmIs2krNgzLn2NvYlkvrd1uiabxnKU6HRaCFxAwPTG8h
	QI03mcJIwAx0B5EK2lcLy8JJC7k1G747cDGaEEil/siUs0WnofeC9Jq4/yPSLVGV/2QudGrQhoo
	bbHakeSbe8+HeM9EvEdOgUI1EzjjfqDkx9CmL02aLfyTS2mMN0NRTHWtx1u5igvwhTY+h5A=
X-Google-Smtp-Source: AGHT+IGqxQcz+/0qde9VdZYOmDlRDKSETydjHtHNN863PVRigirhEFS9zdQVnVdG4C0KFu+Or92Y4g==
X-Received: by 2002:a05:600c:444b:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43eb5c18428mr23351285e9.5.1743608994610;
        Wed, 02 Apr 2025 08:49:54 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1194sm24674555e9.11.2025.04.02.08.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:49:54 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	S32@nxp.com,
	ghennadi.procopciuc@nxp.com,
	thomas.fossati@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog Timer
Date: Wed,  2 Apr 2025 17:49:39 +0200
Message-ID: <20250402154942.3645283-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Software Watchdog Timer available on the S32G platforms.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/watchdog/nxp,s32g2-swt.yaml      | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
new file mode 100644
index 000000000000..d5f2513c4e8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nxp,s32g2-swt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Software Watchdog Timer (SWT)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+      - const: nxp,s32g2-swt
+      - items:
+          - const: nxp,s32g3-swt
+          - const: nxp,s32g2-swt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@0x40100000 {
+        compatible = "nxp,s32g2-swt";
+        reg = <0x40100000 0x1000>;
+        clocks = <&clks 0x3a>;
+        timeout-sec = <10>;
+    };
-- 
2.43.0

