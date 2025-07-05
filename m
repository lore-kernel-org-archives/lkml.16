Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC4266EEF;
	Sat,  5 Jul 2025 21:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751751614; cv=none; b=bE/+ywSFm/rNlmSQ9simRlo49mL/6EBGRCxHL6xLUQDVtHXrzzm2RYJ4cGdf45mRKSkFITcTu5JMSnODU1+ZC+uPrU/m9uLddo1JnqjDPTA8PHFOAZ/zlrMg50PBAMJ3Jcr0oykvtqrDGa2bKo15IFrJs8jnY2A8jTdUT6NMlfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751751614; c=relaxed/simple;
	bh=OT1/udH0LiMxF5Z8PEbU0qGSsawL5z+PeYOdft9WpwE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aJ+bTab37AcZeuKCdXWKZZYY8ZJcFzDm2aDGNQlrNLDzevjsfR8H1SZIYN2z7RbCHM9HquucmnKpokjbzCyHC+v7eL6FnLs3KK2T8hwDgxZlGgLM6Wf8K8nMyRs0uEP78q8aUYkGRilLgEvac8PgwSKT9fXfo9o0s62VwnArnFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=blC1gYzo; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="blC1gYzo"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=qDj3M+WsTW7HyachIHYD0AhPIpwkOUh0ftW3rGGli3g=;
	b=blC1gYzowzcq+2MeaUzdanDN06tZ+ZQCm0u2/xg+Kgr5MVUfqWXib5jxI16eLtWvIG+8H/jMWMXAFEivJvizpoNF7fGprzRH6XHRwQUGEIUxjHVP7Q1p+XUjkUBD8sBgteLgnqItQlbaqL+rcmjqEvw9Pq6Q9B9x+slexozNhgY=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 5 Jul 2025 23:39:42 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM
Date: Sat,  5 Jul 2025 23:38:52 +0200
Message-Id: <20250705213900.3614963-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250705213900.3614963-1-lukas.schmid@netcube.li>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetCube Systems Nagami is an System on Module base on the Allwinner
T113s SoC. It is intended to be used in low cost devices which require
simple layouts and low BOM cost.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613..3c4353884 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -599,6 +599,11 @@ properties:
           - const: netcube,kumquat
           - const: allwinner,sun8i-v3s
 
+      - description: NetCube Systems Nagami SoM
+        items:
+          - const: netcube,nagami
+          - const: allwinner,sun8i-t113s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.39.5


