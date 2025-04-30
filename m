Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2720C489;
	Wed, 30 Apr 2025 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999436; cv=none; b=eVmuj/xq82dwWbC9TQWtCG96ctlsxfjIDCRYpak35eVUJLsNXeJUEhXPLDqMeOzgriiHemt3HtdGE0sm/uAS2/KerE5XdsWldvPfUEgZ6d0OM7NZRyULGZgV9xdDmRv/q2rsQHtIlHTiSbXg+sNLyIUTO9+Y0WJPqrjki7THdp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999436; c=relaxed/simple;
	bh=/2vgeX76RqNtdA0U0Zy/xciEEyCJ8TvRTjhRQFyqgWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ePKi85rRI4exFft8aeK6JEIHYQUQKZu7qQrhfB2AYiqH9ptkkLGkNFnnfuQoLm0Laszd1VMYDMKYtAX5AYL2+KJlQ07KMSmberYaWGqmhPEEmZxIFw/bdOYYHb/KctLwdsbFsFIncLqMRYysxPlF/HTR4kEhz8giM+QaKjXNT5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=EbUAMf+3; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="EbUAMf+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1745999356;
	bh=RtbWXu1Lq4oqcNF7F9S6wJjaCfZrKW9sN45LGyNkuKA=;
	h=From:To:Subject:Date:Message-Id;
	b=EbUAMf+31sUqFXdzW+G9uuu4h/owyzfuykHCFXnXtAhSqFw2Nv6sQRu1zz6CFdnPm
	 TYsq3fY4mOVc5tmwW8hRwovTaqkbZI2UuiGExrQZ0XXsxxStfhoHNd4CRmx/D9JGPH
	 D9a16j/FYoQdZj/ffVBnBNZbQzmtKHVkJNiiSlak=
X-QQ-mid: zesmtpsz5t1745999345tbad6bb5a
X-QQ-Originating-IP: mMG6lTOs1jj7ZfCB8QDuvDT3HCvOcEXEIRd00n7uVZA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Apr 2025 15:49:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 708952558315222896
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
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
Date: Wed, 30 Apr 2025 15:48:47 +0800
Message-Id: <20250430074848.539-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250430074848.539-1-kernel@airkyi.com>
References: <20250430074848.539-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Md8NwmqZYy3fGFbeVKWadYOXuN0hE2n1euAcwBemCKk80UQMyeVF2j6E
	ie3+AbiOfMcMNOkMr4oy26GcE32e6Wf/pg3ul8x7DcWdasdlFUkCpG9l///q/+dSoCs9Ky7
	cyVSiQ+s+mGfs4zaVPWbRf+SxJ3hQQzDeKpndsRc0Z6Qje5M/S5uCu7Bt93NKT3Lum1yVzx
	eJXoOhFZkky7F19t9EZdfa/2xKt9rn/ZLRdkhZZn4Jam+kl+9LU7gN3k+dR3qYgvscRQ0DL
	l4K3bv08qOUq3UAnhDTxywXBTMne0l6tq4JUOKiVbLVDzVYDRPLwW8+bjl0PYB6P0HwEQ3k
	TAu6CP8Zi0buqOmuJ7w+S9iFrEa//4GVfcboyNOSMJWkCFKBrKssWHc9/Yq7lrs3DVFMtXr
	842e+Jg6uATVbXzKXBAqgfKtDv8p2Q3/8/rZHK6oxGOqtAgVZolLPKrlGooVhVF8zXpcEYn
	hKbb2CeRGGo08RdLTATWbtjuUJAoN9fXsLuSnOH83gz7bG+zxnQ+6dwgJNvCnMpIKbnINN/
	2DWznzw2D/4T9GwMVZovqjtMQXCNrWTir2GRQSyqXUev4g0QL9dzFL7BZ/TX1txul9x/0V9
	7qYVFPHqchki3RRgDj9HA+zGsx9zuq7RtHRReRe8dHmLOeZrplxpIjdmtWbzQPpFmRYODxQ
	lNrqGJNdBG4NRNb34y0hjzszE7DBghx1Stnkn2fiUpbBagoFWPtcDhSsrPNlbrsfIs+JZLg
	ENH1lz8i9lneuSoDMR3UqWuXtv5x6js1OC0BnI067Cgbnw4vh2Kp9Nkj39+owYlqfp5+bC6
	qaou/fRcnJDFks0hfdpkLGoKVHGAo1DK/mMaKDmJpISAp0Uaa2RMNI7j0lHRJ+lUMw+Qa16
	d7rFIsh2gQTvWxNjfQ9tWV0+GnQz0iNLen7RUOObixybdLLnPHn44N9E5uj/rSLUXBrwoMC
	eF97L5jFb+K8rEjmGWgKOO4cl8kjHw+GaYAWj6Ko1lzqZlkBwdDXhDPipcK9OO4VtjAsWEH
	R7HqZKVWtSiYQCZVymG7GGJ8B00EZg2wKZD1vKhxrhxTLdlXcjyabtFTXHDGA=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

