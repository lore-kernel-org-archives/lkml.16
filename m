Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1496B11CA0;
	Fri, 16 May 2025 00:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747355251; cv=none; b=lwYP9H7UZAXsFSNZyOrUk0Dv/ZQZedXfVTGKLNrRGFZMsJEfTuBZI4xKYyLkpn+roSyvLeaBEwrfFO2hlEIzCT9tppT/S8MeRgi/U2/rQ+Y7HJIDhLExEPTQIuM9F+jqF4eVk89gffyPxTxT+6VBrqtHwC5m7+UiRDEJijgvrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747355251; c=relaxed/simple;
	bh=TpXA88ql4vXZNedFegzTpJos3ewJ+VZD+AsSJAG9XEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Na2WwIawzlrafU0Gbo5xQOCCkxA4D2dgDNxp+9/nlE/tWZtcVsMzeGj8+ZTg0soeSgv57/hVtrqgDHxxuHiMhhDU+HyDvTTgSSYtpzEo0jgdNWha0KlYBaYOCuynEvBvx+LXERuAwfcuWbZW4YWme3Dmu2AippseENfW40/RF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3t4ev72; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3t4ev72"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-476a720e806so15170511cf.0;
        Thu, 15 May 2025 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747355249; x=1747960049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSa81401b4zyS6qA0a4vLeim4ZysnMHWmu7eBDTP9pI=;
        b=I3t4ev728YbCo99qV33DJTQ9S0+0LCz5iheURh5dCCwnez+bv8+DYda/QjhfM9nTtc
         9B1mpZ+wNaCFd79/9iIyPuIaQ8Ysl29/rXa+DmdC8gpQbBBadFjCmwIb87zFvzitCcDt
         E5Rq3ZM5vo4OP+QFw/HjfN3Bsbc+awCoSuuhOE1Te0ys4TVzIu3sdytt9A85YYFCnfM3
         AoT6Db7bRtHZ4YC/NJFyvyOB81TeTKLAIsERRSzVUidJV7FGrlFwbWDOV6gkeeZcF3ny
         FySyDCKn0OJP87OzOor6JSacEBw3QpZVxulyoqE0z++h816ZJ6G7PvQ4ULk38fuy2zej
         f5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355249; x=1747960049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSa81401b4zyS6qA0a4vLeim4ZysnMHWmu7eBDTP9pI=;
        b=Ab1jcMQjzbEDnLwFK0s9cfBBGH91pt2t+TIWE0GHNGI8C8J4c0P+zk37WbxFugqux9
         rzvBsFWfyVFrZRuDvYaJzkpk4v9FrLpHmmWDYKQl1uqI4LPSLxonOPymN6nxJQ0qGa4n
         6lzjLI2hxThCNae1ihaHDBUrqxWYA7leViX74xKLAzH+xcK8+REoaQfKN+m12kpQ5OHc
         9foyO4lzfxcXrSutbFtTA5BdbhAqyyrZm5o4o51sfaXAREypbZI6ZA8Jlm6hudPgoewr
         k8PIUci9OZCzlKyma1mR/V6UHeFqHPHY9UIAilQJ7LRbvO6WQqElaomHudfDv0+5yqYW
         0znw==
X-Forwarded-Encrypted: i=1; AJvYcCVSo2S0S9RxScddyr4XN3MYezWKBOdMLxAdC7TeLEUWnFradsZz6OeUOM4i68qOGv+z7bgZNvQ/9uvum4uu@vger.kernel.org, AJvYcCXcO9EfIM6JCVyrvXyejHAZwRkb/vCKwK/Rkp/+bM0+C6wZ0fsg/7RZWZf+0lCiPPh8Gh85QuACtGo7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94DfsfrYzvb/grq3W5iRb21IzlzbqzRMDmP3sFdfsMgjivnC8
	sNX00DBCcW/Z7vbAlzvGuJ2UaKs/7sqpFrJTzogZSEZyTZsN13q49xD7
X-Gm-Gg: ASbGnctODCXJ+l2JRUJJuyXCR6Jr/wG53yN+bMoxzEZhCedozJG0LXk4u1oWBQ4JRCQ
	ccRNQ4QVHk4bmUH+i5r4AnPMr0lkENvWk67cVYBxOPQLxgBJVgnSngyhmsG3jhYroOzyOqKIubM
	DltVvopPEcxXqyytsu4J+tOwx0xedvPEbv2bpvRjUfqOrcxUxXWIXzZ4IFiZvm4vBtNBbgsriys
	7TtBYwR5jp2yvkrX7IT8PZfulmfNyUtvWtVK1jV85IK2U5gHzT466aiAeqYW1NbuHfhnE3uGYfm
	Vfn19V3hTuz7fglOpuNC8wdVwwFwSpnIDc9Wy4LXfeCP5d9oTdfD2JcdJruB/bXaWOzI/jyApg=
	=
X-Google-Smtp-Source: AGHT+IGY9gDIvQoDUW7e0xAMa0XYpwcmd5UyXBXiD3f/EUiU07xUR6ZkEpVF77phe/RPdGCJO/4i9Q==
X-Received: by 2002:a05:622a:5a0e:b0:494:ac5d:15f9 with SMTP id d75a77b69052e-494ae3a42d8mr27723371cf.29.1747355248929;
        Thu, 15 May 2025 17:27:28 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cef1fsm4563991cf.9.2025.05.15.17.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:27:28 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
Date: Thu, 15 May 2025 20:27:12 -0400
Message-Id: <20250516002713.145026-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516002713.145026-1-inindev@gmail.com>
References: <20250516002713.145026-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding for Luckfox Core3576 Module based boards,
specifically the Luckfox Omni3576, with compatibility for the Rockchip
RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390..6e0b6e49a3bc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,13 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Core3576 Module based boards
+        items:
+          - enum:
+              - luckfox,omni3576
+          - const: luckfox,core3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5

