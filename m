Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9563B1C9EAA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174925; cv=none; b=PuKWq+MZX9R0k+TN32qohB/v0IQ5banKvnDkd/TW3yXYHSmfq6vs0Y/4Cat6AZx3d0TpZ+kLDMB3zsxQpf/9PyqeC17hShlASVgUsFTPcUNLPhYgGebDzZOGRVtgzGPFwea8JhJecXWyWwhx629brrV6oJSO2FXRlLs6GKxV2B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174925; c=relaxed/simple;
	bh=3IHdPt3ilrvQl1EBzfBDUJ1zVOOCJvrWeRswwbDNyTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXVHhSscVKOm7JtJs4pTLDLJehGXDpeJUkLUnHVBmbSCVjobJCszutEjun9M3rD0AilFOO9Qej+GgxzX3hBVRkyTIdzi8aEVLiEMAIq9gHsKzu0vlTCdYqcuczQTMDl8pEk7hyaAjcVX/+dgOhP9figobtdJjBFibkeMVHD2Y3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IH398ePK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IH398ePK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so4191796a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174922; x=1743779722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZ/A5NQVl/i0LPvXyGUfZOVhC0YHLCb1cbCkUXx5q1Y=;
        b=IH398ePKiwLnuh3h26ii9r7jxNDP2xXDTEGPpQOj42EwtTGH9tTwsbTCQqeYYVMpUy
         xEncPRM7eeGr7+GoYK9anAJRCoviaa8j8wpRcW3an/5JOrPqX44GItY+54NMQqV83oh0
         GJRgi0mWIM+t13ORyBg4a499lqGkhI7BBTLTGhxQBqP1CVyogWY2DfnK5wFe2Tv3gu9E
         4nFngFgzdxywxJ3lA1JldAtoS3Sm25SPqdQJkNvjI3btHdhLFzSpgXrGEITL/SEk04uv
         VnmHShLcX5bzZTmkchj/xl3ka5738eR3DFj04FA4+brtKoZiMaGxrisYN1D5Cn2gJUaH
         zHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174922; x=1743779722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZ/A5NQVl/i0LPvXyGUfZOVhC0YHLCb1cbCkUXx5q1Y=;
        b=b2gtgbzu/s4t0BlYTy9wPyuYtEdjRpCMhqALdJaC4dmbePz6qMu9LqDtZjIZC/1cXx
         EFZDEnORWunSvXRdaKL5DjuGHRVo9vFa7YOYW5RKk9NBDkvc4O8ULELXeAs0Ng7N6GIQ
         CVMJ78iMCNthKY2UyfIq7nmMI3PAD/9OqE1lcsPeyEcpOzoKdVC9feFLQazZ8utFmEGH
         PE7HICTIFrw94s4RWKUZ6FzTqOXbjojeyJtkBrHmyrWkatcCjqgO6yEn7yi/EHh/3qle
         XxqEZXpklm4xqN5VKoc6l6MW0LtHmGmAFZFzAJQIU19QqjDBGjv9ymqDbHmeaima1XcV
         5xNA==
X-Forwarded-Encrypted: i=1; AJvYcCVdroJDVHv7ns3Ox/Wn2oyv+oXSWII7GybOWDmhFwYf0m1jHnJ9UZuKEAAVNFytSInUDqEeMa1izIIaKBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3edzXYSanDuV6icfpByBE0ljUa6FGtDFNeKGadBNmnUfeHGdc
	kaRHAwosdWJ//pSlBJri7V6BEBZDJLDZJaz9sAJQe533RVpp4Bviaq+QMmKAOWQ=
X-Gm-Gg: ASbGncu/i8dDHG2lVmox7owg5ypiyUKK6U1rjSuO0PlojGnQ01aWrLxzeIdHhcIAzru
	DQrYdr8PJ6AYdnCpWRjZ/gs8YEqVxk9J5N7n/hTDCpqAiU7Hj8cgSa7GCcaXvZBQPSOeRK8mhLV
	zNcJ/6dqD7kKpH+d2DKMVaCiOfi4+5xic6cx11tT5z62DzK893mKni6uwNkWAikZY1RYLo/crhn
	LEdtSE8emtJzyi8BRT1Iv86M60BNzRdKI+n8ugm3PaKTPCIGVaWUU+04z7XZ+zLHjRsjw/Ltfjr
	8vtC7mt4MtJNVCTDQWPIw2y3Cc8aPNFqLP6jjHRNqxYFmhfC+CMleQkakd13AMVbLfidBz420kx
	0InBojwGuIluFYDhxO17Gp69hNjaW
X-Google-Smtp-Source: AGHT+IF/SAGXajaIJE2fIq4KovdnKXhHLZoUZ8JDIQJu039BLgAJUBx5iZLh2HzQlSqeRVtqSuVgwg==
X-Received: by 2002:a17:907:96a5:b0:ac3:8626:607 with SMTP id a640c23a62f3a-ac6fb122244mr749440766b.38.1743174921576;
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b742sm178789266b.65.2025.03.28.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 15:15:19 +0000
Subject: [PATCH v4 1/3] dt-bindings: power: reset: google,gs101-reboot: add
 Google GS101 specific reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-syscon-reboot-reset-mode-v4-1-77ba57703ace@linaro.org>
References: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
In-Reply-To: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

GS101 supports a couple different reset types via certain registers in
the SYSCON register map.

Add a binding for this.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/power/reset/google,gs101-reboot.yaml  | 32 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml b/Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cbd0a1d9b45af0cb994d616c56b96440c43ab971
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/google,gs101-reboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 syscon-mapped reset
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+description:
+  GS101 supports a couple different reset types via certain registers in the
+  SYSCON register map. This map is retrieved from the parental dt-node. So the
+  gs101-reboot node should be represented as a sub-node of such a node.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: google,gs101-reboot
+
+  priority:
+    default: 192
+
+required:
+  - compatible
+
+additionalProperties: false
+
+allOf:
+  - $ref: restart-handler.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 322ee00547f6e494a96d2495092f72148da22bd0..e27f5e672bc5a04777afd098355898654654659d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10080,6 +10080,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	Documentation/devicetree/bindings/power/reset/google,gs101-reboot.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c

-- 
2.49.0.472.ge94155a9ec-goog

