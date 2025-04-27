Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294D7081F;
	Sun, 27 Apr 2025 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745747034; cv=none; b=FptFQMEmUxu5jAEk414rl/j+qCv79Yls0yslcIY3avdwUMjrxkx2X8FrQxPrEA6V98MB/Ag6UEmN6Ah1XoMy2SASyzH4/qdd8TguGq/qrLTcs/8c0Z2GvB+4kjHzqP4d6AKWN1I/EmnfHfquevJC/7B9jwsZ+U932mfPdXbPNHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745747034; c=relaxed/simple;
	bh=+NkiG3jX3SEIpGCj43Ct8brYjSD4g7Ru1t1WzHIo0UU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rmGr4Df6yPbQ1uUyv7m1PCSGpXEcAHRYchvTfApnRW79jmrffqWtOrT6iDLB6VnWgoIgFfNNLJ2PJBg7oGBJjH/+j7J461+vCq7xdXtxvOBgFt1zL33QrNXzjhPC1UBxene5mGMjRcBKGYayKkIvOoc8qrqdQxAnOlIqrOsQp7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=fo0JMPAv; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="fo0JMPAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1745746956;
	bh=kPSSrSb3jP6BCqf5pwKmn+N4eRAqsp/w9IrrNpu2wWQ=;
	h=From:To:Subject:Date:Message-Id;
	b=fo0JMPAv3B5Tbg1cDp42RKbPvmkAVbw2ryrf+xBoeOfM7RiT8ES85czoaLa/a/1om
	 ktKLzUcyBPqudHfqR0HJ6EAnwavQHu9uYPl4hiQWxwphaj3cM40W7ZTYgCIjqe5GMK
	 8EXdoFfB/pSm5F0snMChdotT8CfpC7ZCKLiEKIhA=
X-QQ-mid: esmtpgz13t1745746949tec797486
X-QQ-Originating-IP: /T03SnbxL73Bju9CPvvuA08Yp8+fugFNhO3ZT4bd8gM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Apr 2025 17:42:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7345639608399007083
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
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
Date: Sun, 27 Apr 2025 17:42:10 +0800
Message-Id: <20250427094211.246-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250427094211.246-1-kernel@airkyi.com>
References: <20250427094211.246-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MgQY1K25Ph0m69AjCHDG8dL3hBqrmdXSfid7xJf5VUMV91uYYBeZ1EI9
	UrqM9K0jxpexEz1Zc1hEobiDcaY4SPOQlv8uVcowEWgacqMU1+4ZmYRIlkDK6TnA7xc/RAc
	IJQanCak27/v/1UGeju/EFCc9IfUZ1g1rUUo/7HSPu+qgntwZIz3Rm7CyvE291HFkdt7XQs
	q1reLfQ8kWxKUTd3eG51jypywBf3FN97vwp6+nq0og1fQ8VgVgGk7Q7PpiJBZxmxeuuuHtx
	vc4oMQ0PDX0FTsSr2J3XoPm75HGHMCLynDT3BXJ/t4AHY27wpkOxqxxurG9U1yoz2sZzVk2
	5tR2Q7qffWU4z+7IlgjG0yd1Gr3u1rJG40AsAsHYFWUWkph7OS2WJH6zqmiAbuyVOaFGrg9
	IOu+rIF8vHxo4fM1vZ2K6c0ItcWBGo71K3A00Uo0Je6FyayFMjMz/lTB7aBC7CxG12oS9Rj
	sKbKO2FoRmBPrVo7+Yb3Pr4kMcr5hnIwa6k0iFA1llQupBmcs2igTn6qitvKniRO/HAsoK3
	Z0PRz1vrniZy11AOFwjLwvlIK7PVXAOj3q3q0DgEgZ4BfUvK3yi2Met5+Aec/4Nv4ligp7o
	f9tdy0+HWDU9yZr2dc7n2mft2o0mlTcdRUKTdaNZr5dVR9zPGrt8JqTioNwemZSlYH3OsRe
	PsJ3PklKE+WuJvDevnrmuGwQlIZjM2QHP+RJOCS0NlqCvSAG4oeHEhB7KF2801biY/dDGKk
	7D/N3Z4owRrPieTBdX9+DFOj2zyW/iix9NKdATTuuVr91jew56hIHSMSJanz5Y5IC5sn5/a
	ksKOVige01jJGcfIWGqch8gvqSMyo3Obo0HrXviM7frKCpezlNoTnp+k8EW/fkiib2rmZAh
	/yLIi/whi4D6u0N3mqP5jd2y5v8X59THrinRnb1XkzrUrvjUcoVzEYipL0781jgG9kfXIr0
	ufvaUYK4qz7ymITFC7iNBSLQsYEHvcWI/dFoXSmGdR1e678v765nbMdHcnDuJYv3TQUc=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add devicetree binding for the rk3399 industry evaluation board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..684d48ba20fc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1047,6 +1047,11 @@ properties:
           - const: rockchip,rk3399-evb
           - const: rockchip,rk3399
 
+      - description: Rockchip RK3399 Industry Evaluation board
+        items:
+          - const: rockchip,rk3399-evb-ind
+          - const: rockchip,rk3399
+
       - description: Rockchip RK3399 Sapphire standalone
         items:
           - const: rockchip,rk3399-sapphire
-- 
2.49.0

