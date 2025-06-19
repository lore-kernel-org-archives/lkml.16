Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C968928B7DF;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354214; cv=none; b=Bbxq05f44zkH9DtbiwnKc5BSgMRun8BTDPIEXyr0Bu/PuLsrp+5g7ts07IJeX6hJq0JN4TydOK8U/+y03B6CNEZCUqZqsdsAsWs/M1swPGdNk4FY1d9ROvezR86mTG39cELOGvUy20xRPU8zJAycBu2rJM0d5dQtURTekD5XCE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354214; c=relaxed/simple;
	bh=q6nrjT2Dpercv5DoePpH+dBXKOMzG9sjRP9CjTTCRFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sTRUcDEg5/eKZ7VUGg9rZ8LbcKlEkPY4L27yeOapWZyWKIrSBWCP/7yla8GNyz4jLAR9e8GSCeGbCfmukGwBhpEQqo4ey1TdQeLb/rz9Bico5HVMZ6Qn68dH8tpqEvWQhKussnNVDCjGOjjop5YYCeIFMjY8l9x0x/duxW/IWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pT9Ouj/J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pT9Ouj/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369AEC4CEEA;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=q6nrjT2Dpercv5DoePpH+dBXKOMzG9sjRP9CjTTCRFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pT9Ouj/JeTRfyA+9Nv+N2klirdDENDpWxZMDFqGzbQzxJaKbewkF05a1GUWrJ4NUq
	 ziWjJqcoKvIbVk83Ze0XqjdkJUHZ8o+oUuKy60SZQBlHeEGeQfKrL7iJRbHgg2xD8M
	 XucpkGHYAe3h0hvGC5VL0wzZkYVmNChU20yFmqIxpf9s9OTICKf9ZYPBhrO6e76hoZ
	 /xQPRGr5YrkdZg5P/JI64s6arkvyCF6Pm/hVTRR2W3hS0IeG1dMmThtlOTPAAiI42i
	 rZ82WhiFUPnM2cMdv3rVz2CwAj9f6NXXrkyqxdobNI0rPPHOS8eX4QuUuZNULVSpc+
	 cS/y5yZtL3Q9A==
Received: by wens.tw (Postfix, from userid 1000)
	id 1BFD85FE81; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
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
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
Date: Fri, 20 Jun 2025 01:30:03 +0800
Message-Id: <20250619173007.3367034-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
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

