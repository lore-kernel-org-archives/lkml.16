Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8833617A305;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127372; cv=none; b=TkTwA+Hx+omfHEsvpSQ7c7yTOvOu9/s6UEwvsVTlgbvSfFHNO45Pm4q3KVdMyO0n35LJE6AB1H8yh1EBw7c7+XTDmQK5z4lyBrov9LbV0vXktDRm4gaPeXVw1EmlBM5w6nO/i23GmrMYRPixTg3duoISbrE9dyvvQo8Mx+O7a90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127372; c=relaxed/simple;
	bh=rY5b8vRqdXfrxDOAn0nZ9LkgMlPuDFO9Y76rv/I7xqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QIy0h4Gz+FKJyguojrfJcbfRPtLSt/SS4M1NjJgUqrxyRWF9VyF2PZyBPSG+ADO3ylwKsc1Ry48yRPBoz2uPU9Xk54hNJF54ZKLcisK4ngV4Liw8hTvITTITw0ZK2Y4MFTRNJyvoxpRsrcU+JfYfOL/A4H+vDKLF9JYiHaiNbz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sph/C58F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sph/C58F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117DBC4CEF3;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=rY5b8vRqdXfrxDOAn0nZ9LkgMlPuDFO9Y76rv/I7xqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sph/C58FoShQ8ZeW1fkWGQ3Wd54JKn2/xOnPwbsO1TISvMdye+RGxwAM83zavc558
	 m4r7MLl038PeGnuaqD4C/bMT96ltpbyOeWijlonfWsb2yFJ1TTYe/plcrnDwcUMLjT
	 V6R+NMidPLidHhTMmfylDp9SjgqcJQjlCYB41IEAl6kli5c7xvbu2a0nz8PpOg4PPV
	 E/sk+Y62g2Ktx8gyC3laCl+htwEPyvLQ1ehkC921PCaxbjlgDYfmmLWr8Zp8SD0lQj
	 OCu1Y8tnKCs4EMdPWJ7iInydjWB/4moQC+4QFyGFN7rSbFVuBnspbDnsRi+UiVh5Pg
	 PXbKb45lcQidg==
Received: by wens.tw (Postfix, from userid 1000)
	id 4A06C5FE36; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
Date: Sun, 29 Jun 2025 00:16:04 +0800
Message-Id: <20250628161608.3072968-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

The OrangePi 4A is a typical Raspberry Pi model B sized development
board from Xunlong designed around an Allwinner T527 SoC.

Add its compatible name to the list of valid ones.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613258..c41d0a0b89e6 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -996,6 +996,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 4A
+        items:
+          - const: xunlong,orangepi-4a
+          - const: allwinner,sun55i-t527
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.39.5

