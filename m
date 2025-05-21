Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30725D1FA;
	Wed, 21 May 2025 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833131; cv=none; b=GBVqWlaJYrijeHoqvv/D3TS35WFO4vsjc/p2dWd1aoFrYHO3ApD1RG6Ff69xv+yOS7GfYJJqOMjgstXLuxrBZmLmrht9DWs1uQIDpXSKJBbkBnyi8eAUy4L8qYXDrOZt+g+oUr3PvFHGqXn7KYX6/GqaZsS6h9M0/z2ADPOCLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833131; c=relaxed/simple;
	bh=dYhjbV/+rEQ9Mg3Mizvz04VcwRwhCUiqf2+R1uJ0tm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a4eQab3QmMGH2otImBC9JYMdC4tC94OPB4XsmvR6BtIrPh7ywPM4dqclW6RKDp7CZK4kiec/1U3ZKz9lssodRiugQ87FG/oC9+V/Iaie3Ffjmm8mlloiG4Ky+7OY38JQgSyefVsnboKIgjfiloP2wUYQpaifp77XOxZiDHhcoA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz16t1747833079t1c7928dc
X-QQ-Originating-IP: gG6HJvN2fXEpEODmJrjE4nv+Yyd6CjGdnbmLoMkfNyw=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 21:11:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14355936894611199779
EX-QQ-RecipientCnt: 17
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Date: Wed, 21 May 2025 21:11:07 +0800
Message-Id: <20250521131108.5710-3-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521131108.5710-1-i@chainsx.cn>
References: <20250521131108.5710-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OZsapEVPoiO6pOxc+d1hsRvTEZycjdnMbUMdAxht8nuPD/WMn1ou3LkK
	l1POvN+hze/a0YMxJvhF5Q1BgtIcofDAn88g7EEiftTdQz6R2wRz1N6JIXGhGBG7Ki/oErm
	NFpuz7por0eksPZXuY8YAMzW4D4A5ea+RuQD9jxPjQHk6rAgB+aGjvHRVUdkFNrXj4Yx3H9
	FsKHVeke+rbfUdeOprQCyMNzIgRphGOtXwJKcvXADO4+9WG2MJYoCGlTsKVbwlGPOBn0Kh8
	u/N/tomGZwu1IALmt2YkKJIZMjDj4s1Gx+aAi4l/lZ6zwP0ouJa5K6rSoiwuW0y2tutqrR1
	PR5kzrtEpggOXPt1oJhTgY1ZpmPTF7MvGK+yIhZQu/l+sWitgQ7QTIOt+gJqAkQqBSD74K7
	C2sEbRgEc8PWqXJG+4KCxz4Heri4hiAz7LUTsenYofiVcNGoOGvs7aGXrF8+wfRtRdl+0iB
	i//Yemn2X+MhK+Co84y1gBUR/uGxzKZ8IySrSYrltrMPA7w6p5SBDtbJ/QUcbggMcPcL4AI
	ZESEHbmybIFG0yRIcihqGTX0EvSnYq6nfNWxfc4ZtMBQeYqIRsB0numyOF0/69Hvg4E/HjF
	sC/h3dL1D50PlhQG7XJhOYadEfYodyG/c2+rdrzComrsA7w936nML5mg0yW3KiZOicRNXwR
	netkytewxmxOtlmJYNF1HcF8SGRtbhHw5wCD7FsWbxqQ4QgQoxO+nUnh5amjEwb+4qpdZyl
	FtR5AJtXQUBU6DpwbxUZun58YJpfsctnqjH5pNYCDZSEdq4SQTyq0xbhZQQLZKeXm9cRHdO
	hPksbuQ+iA1O+FOiXtrZ7B2H2DZz4de6OvDB38Scl+jAlSDfTKAtwlzxDLOYYooskwjmMLc
	Fxssj1pM8WclKUUr8TeZ9iHYQwcXUjKqzGdBaWeSZhFc/XnKRh2VKBfCd9CsO8/JC9recyG
	jRYpQdU/ex1ZZ4P+CMt+4EcsqqidBgNlf3rpl9lNPFePTfiwMkiK3+cFFNLKDV0JGDU0J2o
	yFr0uVzCZ80POD4+HyvjjIOjif+lg=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

This patch adds device tree binding support for
Sakura Pi RK3308B, with compatibility for the
Rockchip RK3308 SoC.

Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Signed-off-by: Hsun Lai <i@chainsx.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..c64adc0d0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,11 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Sakura Pi RK3308B
+        items:
+          - const: sakurapi,rk3308-sakurapi-rk3308b
+          - const: rockchip,rk3308
+
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro
-- 
2.34.1

