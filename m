Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032FA1487D1;
	Fri, 30 May 2025 03:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748574722; cv=none; b=NtGXQus2V0DASFTudTGWPA1qHLklkfJT1N4AbZY2X7bk4lEr6TRmonDNsvsVzgvD7vkkg5i95RnNOzQfWJQYF/lL9m+xEbwXYi1u1yLdWqtyrIk/Qv/1XoJTxaF8nfHyJc/JdgXPYGBe5pFQ0babDMD7FsPAS/SPjEVaLkPIYvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748574722; c=relaxed/simple;
	bh=n5dHRGrWYAtPBjkROOdK7fTKrRqPRD4wAZpO/YnM55E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sGS+vPa0xtvpIHl+UVCzJUEbvRIhPHbKwqWC3bMv3QGt3/rA9/+THQTtNOz1siPq83ol5Ix3LtW7rWalDcL2KBtviOJaZuxHeRrjwDnZBSNmCjoj/9DrsdbNE6Ukd0wk872BpqNB5Erex5vt5remJww8LONwyKJhi9ezpv4OWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz3t1748574654ta3bc7e8d
X-QQ-Originating-IP: bFSBAXbZGjY65746zkohba5EnhI/xku4pGYbgqCLo3s=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 May 2025 11:10:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13257807080784473651
EX-QQ-RecipientCnt: 16
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
	linux-rockchip@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Fri, 30 May 2025 11:10:45 +0800
Message-Id: <20250530031046.166202-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530031046.166202-1-i@chainsx.cn>
References: <20250530031046.166202-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MSyoPQEuxKCuQ9ZQ/jC7O/sFL786EHz9nsvkzSbOXYXFhRgano/bzVXn
	FNvVsWeawm4R6l5Fw4QhDJ5nPEMJ6p8Fz2hsLUmpOQKUpATzmzMeFw1JMgclNFqwf70g26X
	/WW4ChfrGJbixrqJXysO+2HPokxu/8EkzvzGOaqtqVkNEPnye19neb5gyfJ9YDWPGF0cQOC
	+ZwyMDK7r6EeFlJ2gvXrVQPZW5WOtRLox3SHkFTQNDg5QUutLF/gaQnvFe1PmARkKEY+L/H
	Tzz2x4dBrzpnx1rkidswKd1LFunBCJQpvmbddnyt7vTCO/pXpfKIPMW4y1FFGxRrssNH9+O
	J7Izoueyf3NGIdlDlgr978EiJakkUeqLkWem+kabqXT5FD5CFZwlhyrLgIewtKtBaZuSVlK
	kOYySZ3UcTDlctB0obxy2A5sHmzyK3/Vsp1aRO/2Zbku9aLE6iVlnVjrcQTfrTA/mGPvTLs
	ofzS9sZ+fAHFOc5xtKYjcbWnCDEC8yk6ldUwKfgdmvGJEeiaTqoJ7aYUBlMHVzo0wZCOw4c
	vIrLNRtVqlqlarT2YpDo0sQuatspJ5+tJc+tLXdaYOmbB61VWa8DN7EzT/vApc0jEGw1XmJ
	NSiumwddFXJ1RD684oGMoswnyc7xtwkaNXDUPdNW3wDklX+QA62CduumjtPJU+X2+vkUChR
	qi8WuS8sFjB1mNUjsfUGSP5Y1mZ+nlKmD9+kR2mC72wDieG17cJYj8Tc1TC3d8+SDhWkm07
	H1hVlVhh/hpmBQb+uTl/Mu8CaZlq4ktSCmLuCy6dyvf1FWh9z6pJGmp5hsCGbHNrdlfkPz/
	HlJ0uyLFK7m+E7rvdsHkK2mEYZNs3SRP7Rh39kqJwfKhkvoox7/Afrh+l3TL+2oF/kNzHal
	+Cn+1IadErinRW6kGa6OngBPUz/25gc5JomMN6v9Mr4E3PXCGAcTDKqJozyneK47h1A79nY
	zmr+iIM0UcfCiDNlgoniEAQLToG4RdpHVBO6/bLx8YiTSSecqPzDwNaO4AhERGnjEsdI=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <i@chainsx.cn>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..701d68aca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1

