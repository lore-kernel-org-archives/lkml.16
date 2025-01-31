Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E601F3FFD;
	Fri, 31 Jan 2025 21:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357732; cv=none; b=gpPnjDvcKH3ynJ0s4Q/mXMRgfgQLtTik8z1Ry7LfPlq54mySlE/531C6OaHbuW9YsiitNLze3FkPA5UzhiJCdpJIbxESmoYvojuVP722p2pKJtrZImiVRtj7rThkQfHe29Ug+euoPdxINyXO2nIRrjtwnv4CV3Ns9usDkvZEwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357732; c=relaxed/simple;
	bh=pA+myvP/+kW1tdoHHa/+v6g0X2wfWCQZqyzpEqfgcMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MkQ4a3Zi6sWuc03bSudE7B9As73FBRB+89IYX1PgNOKkBCGV1+rWOq0YM+ljQi0jKAyId/U4Mk59f8cJhzo+zuMfCK86IzgKhxgf10PC4Yr+u+gk3TOmtvYk1GVLz7raqUng/mdxB8n5csmw1ZY4OM0FqfHVzxQPRxArBkmtmV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohvzy+Ta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohvzy+Ta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C86CC4CEE8;
	Fri, 31 Jan 2025 21:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357732;
	bh=pA+myvP/+kW1tdoHHa/+v6g0X2wfWCQZqyzpEqfgcMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ohvzy+TabFrY6iS6xeJZEo4sxmIOz0CCgw/N9/H4opjDL8Mg+x+jq2Iw5bRy6wCD7
	 T84n0CStOA1aHBbZvKmg4wngVDvh9rmnkk6KOlPSkZzXiZZ2VCX+mUrL8upYQ/coaB
	 ZkQLBBBSH35F8G7qlXYTwR/hCIos52dcyyxa6jReOcq9HVC7Vro91wDLym1MFVEoqx
	 xG3isCLOYOmvJQGG3qwAu/oVtc69k/cuOhdk6VR+sbGSQmUKLod2hKdTMTYu9QBDyS
	 SYKqVexA/e5CqaWqo0GPhkXmNZbIE+XD7tZbQUYN/nehrD2rxX82nOej3+RSY4g3aW
	 GazuWSp/T2ZPw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:26 -0600
Subject: [PATCH 2/6] dt-bindings: marvell: armada-7k-8k: Move Armada 8KPlus
 to schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-2-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

Move the text binding for the Armada 8KPlus to the existing DT schema
for Marvell 7k and 8k SoCs.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml     |  8 ++++++++
 .../devicetree/bindings/arm/marvell/armada-8kp.txt        | 15 ---------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 538d91be8857..f1a7e6576306 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -39,6 +39,14 @@ properties:
           - const: marvell,armada-ap806-quad
           - const: marvell,armada-ap806
 
+      - description: Armada 8080 SoC
+        items:
+          - enum:
+              - marvell,armada-8080-db
+          - const: marvell,armada-8080
+          - const: marvell,armada-ap810-octa
+          - const: marvell,armada-ap810
+
       - description: Armada CN9130 SoC with no external CP
         items:
           - const: marvell,cn9130
diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-8kp.txt b/Documentation/devicetree/bindings/arm/marvell/armada-8kp.txt
deleted file mode 100644
index f3e9624534c6..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-8kp.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Marvell Armada 8KPlus Platforms Device Tree Bindings
-----------------------------------------------------
-
-Boards using a SoC of the Marvell Armada 8KP families must carry
-the following root node property:
-
- - compatible, with one of the following values:
-
-   - "marvell,armada-8080", "marvell,armada-ap810-octa", "marvell,armada-ap810"
-     when the SoC being used is the Armada 8080
-
-Example:
-
-compatible = "marvell,armada-8080-db", "marvell,armada-8080",
-	     "marvell,armada-ap810-octa", "marvell,armada-ap810"

-- 
2.47.2

