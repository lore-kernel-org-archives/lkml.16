Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302CC267F53;
	Sat,  5 Jul 2025 21:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751751617; cv=none; b=i3C1FFUR60E8emT3baowseAjijXJhZq+0sRD8mVjE8JZaCmPHgprHuGQ6l3SExV2WFEY7LRkuM5nSPK5y3IGbt/wlu7+8nXbqXKgpf5k0xpktASKa8qQB7fjw4T7sdgpVLejeK5Q3vVHkiMbw1D5q9M/Yos2j4S/cCOuQ+KCLP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751751617; c=relaxed/simple;
	bh=Oz8o23fRdQsdbpa1sI/19xyzcSLFV1J62fl0qQ9ql3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cm6+I/Urw16SQpmGaLtarE/hGi6sI8Xz/FLCjTgL5Mum/UWYIutR1Lu3s9pdoZDejqHR0B0vRvtrE+1fWLPQVLCmC3o30NsSueL7vllsDJNHLwcmFcQgzWdxb4pkfkb7dctUQEypmpfutSVSoRL4FZMGwvaz/hFtoN9Todj3ZdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=C0LHqQXl; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="C0LHqQXl"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=K4dhUf5EUx1y51YwBgAVDy5aAK6OAX9vCrrn8rQSuDo=;
	b=C0LHqQXlTzjYulBR0K9YD/2vM26EjlZOj/SX3dvD9/x2XWHfyBmbGaW7fFqFrgN9FfVswoTVPvYFDdy5M0VLy3oAvWYvgPdWBzD47UPTKnIwal041wNGpjWDlsFeYCwVVrfRVDUyJXlsKFgN0O2B1PgA3JahaHAz+Ilx7N/pQgY=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 5 Jul 2025 23:39:45 +0200
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
Subject: [PATCH v1 2/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami Basic Carrier Board
Date: Sat,  5 Jul 2025 23:38:53 +0200
Message-Id: <20250705213900.3614963-3-lukas.schmid@netcube.li>
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

The NetCube Systems Nagami Basic Carrier Board is a simple carrier for the
Nagami SoM. It is intended to serve as a simple reference design for a
custom implementation or just evaluating the module with other peripherals

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 3c4353884..7919b5bf5 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -604,6 +604,12 @@ properties:
           - const: netcube,nagami
           - const: allwinner,sun8i-t113s
 
+      - description: NetCube Systems Nagami Basic Carrier Board
+        items:
+          - const: netcube,nagami-basic-carrier
+          - const: netcube,nagami
+          - const: allwinner,sun8i-t113s
+
       - description: NextThing Co. CHIP
         items:
           - const: nextthing,chip
-- 
2.39.5


