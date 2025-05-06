Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC48148832;
	Tue,  6 May 2025 03:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746503141; cv=none; b=ht/SwifJ9vMPG3FIllM1x0RLvNaFyyfS7yKQLWood2K7kuxDpAJh4P4ZapHDiq57+YMdPJN3BRCNET4tjkAIW93Dxi3p2nR1Mc1j2A5SdtZ3crY4YFRbQUYJVZlRNOET8Qq+hSE5f5Pa/kSmZ5HnDbB7luXW7hCMe+tGz0OLmfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746503141; c=relaxed/simple;
	bh=SlaHaxL39ZAHuQEK77QuDhaC9LUwXDS4IxUK1/hUB/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=MeSpboM/MsQQl6UfCO5/VX/wQmJJ2WhK/w42Dhu6TWX0cWDM1neSpCbBedqpfRo/M+ugCXsTC/bisP5GHmLJgjj9N2Hiktb0wO2w2BVOOswtuC6nqcIWMBcUPmdBtv9vw4R673i/9M6CE11RBfKK4R06QQbb/jCM6f+8Z5sXocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=t8zA8px6; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="t8zA8px6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746503061;
	bh=hmPl2NWCW6l/GgyaS45T1TTxOQfLNoKS3ckGIaEtrfU=;
	h=From:To:Subject:Date:Message-Id;
	b=t8zA8px6pjfuSw5DCGUYiq1PirqqdGYgcY7y0NDQb1DykLZeVPTHu0CIVBfmPUC1U
	 yCAsosW8Q6ZlBRQKWwR2jVlgA4HnZjCV7TiNDCORPPuVKdbOHiAvr77fGIyW4czQnv
	 y9+4UmEpBFqeI0OUZ7DjvwYYwzkYB8IGriwT7C7I=
X-QQ-mid: esmtpgz12t1746503054td3df7c82
X-QQ-Originating-IP: dNySWQ84WQkpugi5Xu4JmUqBvfVdu/gFrsoHSj/33uQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 May 2025 11:44:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12369147248136889238
EX-QQ-RecipientCnt: 21
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
Date: Tue,  6 May 2025 11:43:46 +0800
Message-Id: <20250506034347.57-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506034347.57-1-kernel@airkyi.com>
References: <20250506034347.57-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NV9lVvsB36OpbcFDcLZiJ/ikIK2DxiaVcijEusjpLtC41OeTUEx2/Mu2
	jSpreWP+d511Tt4jsQMBbd1O18IQwPUaudmb/TKZo/wq3OmDqyzuu2p5R3LysZbIC4tbaCb
	hBLzU1PIa6MCBvgQj/lFnIvtzKaasoJiFqan/sg/9VySeTO7XPzoZIWuk3RmqX2ar+kWSyP
	W3va/vqw2Jy00v6eflkybYcqToIUxUsGoLMi9Vj/BQcnT4h9i+9kxvCunliZo7fjvNndw8j
	Dbm69sdUS7E0OKQYLSUKsTp95UsBD5Dpx0eZl3SQaNvn5lF3ebo3CGIOv28Aj+Y0g9uj7Jm
	ay89W2Pq5nCOZ0QblQewxWqIRCVfvsucA2fB+qGr+JQYqGaKMzXHT0hAnQ/yPWPxCR188uY
	ar2JnvPYk+zFCmyEESf/5fnhVE70wjdOpWApYd9GnoFCOurOvRMyBAgJVKFUua1Ge2SAKl0
	8TRFJccxEdSwaEGQXqwtXwkPM9o70CZdTzmISvcXLUEolc5DadNYAn1PdkOSqGas/KRcnqC
	kOD0yOrTyy0ZG6ieeXJcxoS+6tbY1XsyGB1BUBF/3t7kS/2V/m2AB8MWTMxUXCSNh9zjbZl
	hYc6Fs7jeCoe8JNGEDUVJVcpu9MsEqeVw4Et3UA2C4YWM+Lw7BZbfKjIltGMfr0xlMpdQla
	ThTl5ts2uOQq8QstrywVrUyNish3XiZbzDVgmGPOseuYuW2RWZhV8DDat+Rp1vMZQ9Ojojy
	cNX+iHFudGbDJisVb5eJhO5LnzKscTXVwFNe6dAO7mAWPjlxgTRA9ZHAV/AVXUYZvOfsEI0
	PyJy7GO05Dh62y9i8YdAvSG6gNG3r2pXGE0v+G1TaBL9feLr1KEczKrIRXjQ0iP40Uldb06
	+zM2bfJgryWCTpiht6Jn3o7aDF8py2woqm+KB219ma3NKHPxmULdMIRWfiK1S3WvD6zj9YS
	Qb25FCbRUAqfqHDu7NeW229coz+rqNyIAhxNwA9Shz1qzcnO51H6n2V/CHdJIIztRm1g=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add devicetree binding for the rk3399 industry evaluation board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v1)

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

