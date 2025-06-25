Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16E264FB3;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857425; cv=none; b=mL5MO1Z7MuMpMZaAIW/Pq2Jdiqjl3D3ZSGHVnTjIFLbkXBXYIf0/E7XiVz9NFiFTLXxxwpmPFXqonwnohMMdf5ueh0+63dWWoa1G9Dg92ei11GoHlzwWsY1LZn3YBOB0RnwXcE7gMXa40DH8BrQ8TJzE5ggEQIgNP+25Nz04oCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857425; c=relaxed/simple;
	bh=rY5b8vRqdXfrxDOAn0nZ9LkgMlPuDFO9Y76rv/I7xqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qDCEe7g+YQA8s0UaFoK2uTMivNIzN+pYoU9uKlBBMo4yJRziGyeFCRdBemh7KW2ZS/12uqXzK7w9bEG/yMz9Se9NNnUUty6By9tGrT1AA7EHp6i/+PPKmTpmyQ8y9Vo8LokXXnfVpFODvy/niYVo01LDBK3Vp4PxasV1680HuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZFq04FJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZFq04FJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDD9C4CEF0;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857425;
	bh=rY5b8vRqdXfrxDOAn0nZ9LkgMlPuDFO9Y76rv/I7xqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZFq04FJczg0EJNQiggiT9bTqrGhHGfEryGsPeCBi4zbJnm9eHI+gjO4qQzu4MJgu
	 j0ZzvH1Dg1GMBraQAtBe/EjWQg6RamqjKKaz6SgQfbvyHxJKurD0Ac0q/KSjaRcdON
	 TNWBCs7dOb5BBdiTEz6Re1hxpuRe0bNd4E0aezKDvmSDWdjzmUs6P24EImmwRMGkyv
	 u6RvSd/8etVRpK0eoxi+t4YCaeXN+pxYkuvLMVfbLgOmnfFzXowaWAZdo8d0alJuaH
	 ukskJTj6qxHRhe1pqbXL9TNasHg9Rak9Euc8f/cUZrw/dlFsBhNm2M5nb+23y7yMUz
	 rQrRU5muXWGkA==
Received: by wens.tw (Postfix, from userid 1000)
	id 587075FAC5; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
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
Subject: [PATCH v2 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
Date: Wed, 25 Jun 2025 21:16:48 +0800
Message-Id: <20250625131652.1667345-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131652.1667345-1-wens@kernel.org>
References: <20250625131652.1667345-1-wens@kernel.org>
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

