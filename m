Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED9425E806;
	Fri, 18 Apr 2025 01:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940973; cv=none; b=rrIz5cnvYRElhI+5Buq0FExWV5yMk2MqjLJG+RC1REhxwD3wdw+BpyPO6jRrg/W5h6zrEz6STi6gCUGtkgSFdGhslgaGQKYROYVVZq7k9YG/hEBREw2lqIaZd1fF+LSOtaCcIiH6lMICBcwVGAiI/3nCvi4edEto1pR97QV8Q9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940973; c=relaxed/simple;
	bh=/8a5mLEI5UEQSmLbE8liiHB9ztaIjPYAXnVs77qlR18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=asioKxvXIm0RUc4yTifpqX7sSQqS39D2p6gNOfvy8+KnzkwQQfICxWNbeSixcsggyJHPeO0ByNLOdGGf69+hjZR+789oLHTHUVSB91FYoXJYVVefT2GYzmbI2CiAAlTWTN2cu/bZq23K+PrgIIK6ekRIyTXH9k4nKQE2PtFWrRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=airkyi.com; spf=none smtp.mailfrom=airkyi.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=airkyi.com
X-QQ-mid: izesmtp80t1744940897tacfebf76
X-QQ-Originating-IP: 1/RhFsCMqFycRYtj3mLsaPlfRGcihZnNKNg8dOyeGe4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Apr 2025 09:48:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13519601627997338796
EX-QQ-RecipientCnt: 20
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3588 evb2 board
Date: Fri, 18 Apr 2025 09:47:56 +0800
Message-Id: <20250418014757.336-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250418014757.336-1-kernel@airkyi.com>
References: <20250418014757.336-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NY6OurWw+pG/jA8BsncHgmx6s5Fe/MGMLPsyfTo3dyYZwQrb37G1yvya
	EPERJawYzgk9wGov4raH1MUlnv134y+iurxUeqBxgrZDMpJTRN/rFBPv0HVGpHuiQx/NViz
	STMcX+3tgQA0pXc1ZI6/RSJRpDThVgZHgDZZqpFsRevgeT9e0FLXneGYwBgV3UFKmT1kAT9
	g4GBz9kDxfaYy6y6Z+btKbPE1fX7JWsHY3KRMed+/uYcqUWyO9U0XWqt8CwG8ryMCCmL40+
	8riJd1+X6/DrFzkht2WNGPdHldPtvThJgFRBZKRNVHa4H+0Py1hr97BbsIEleYTQWAuyMWy
	8W/TR+xBH1a//wBxKHsN4DWalEjjehjRSKGTun6RKkrW6zifnJKkvGQVTr3gtGNBJlGlEUf
	DlkfhW+3rGXZeXrx0rt+mIn8Te6a5kcf/fx6F43ZetKtGeWdsDLUB7oXn1sZSB1Hi09r9Sn
	z+hcw+NBPj3hEioTjF0JzAP4Oj0bp9OWKgmi31fupOIoKGRMY//QmVfLtv+rH/4NQD47Ukd
	jrDKkJhmtaEepDoscoYimo6Xryhoq94wOaZLhju056blxZByD7zehiDyHod3IpzKazZltuF
	gY9wTE8jEqa46D7NUBkpqIu5D2plGvlB3ubUxIYbCTChkmDL8UBP51D7lK0SMhkijNgGlpJ
	gMurtRjHt90jKSfyQSUVHS+6vhSrF8AFt0r5AQaVRnPzfhbzBBhVzzS88jo0WReeBMhqfFS
	I1e20Z7pGVZoQv0sur3JAI79kUxBmmL0syGJoOECSaPpfQJiX80J1KR4wPCcQvhJcoZ1p5U
	LBdHw7lpGNwNuqd4RfsToIlgBXKpQKDDee96nwz3vF1InQcrFFduHo1rKRs3Rw3SZSSg+XP
	dtyY4bkTueGcmwgktrQecQqDTatpXOO9koz6i/D5+V4ngOcw1YJ6Ns7UIxixaJFW1lnvAuW
	H2/2f5FwM/rl8kbjXVLOoRPoZtjaFQLN7iu49/z9IwGaevZO08sLJqi+Bv3nWFgksh+T/D2
	vBbr0zA4vs0DrHtFG+1sfH7DiE1Wz58C/tRHlYFV6VgGD3Xpcw6dU2G2K3RAw=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add devicetree binding for the rk3588 evb2 board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..455fbb290b77 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1074,7 +1074,9 @@ properties:
 
       - description: Rockchip RK3588 Evaluation board
         items:
-          - const: rockchip,rk3588-evb1-v10
+          - enum:
+              - rockchip,rk3588-evb1-v10
+              - rockchip,rk3588-evb2-v10
           - const: rockchip,rk3588
 
       - description: Rockchip RK3588S Evaluation board
-- 
2.49.0

