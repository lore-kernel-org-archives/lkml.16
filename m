Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162626A1C9;
	Mon, 19 May 2025 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645034; cv=none; b=H2E4HOxdtDxnWMyMbuC7Jw1+iLOY4/VZqw/nR2KiB08CcCkmf+B5hZP5J2yBkChV65GQgCzPmmgSYh89w3RAmkoC+HxLpUh4TiwJjORapSNF1IXYquSQSQZ1jZ/VWa4x9ufnCtLCRM9qC89MIID9maYsO2O7HyQiBkzb0WY8yqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645034; c=relaxed/simple;
	bh=dYhjbV/+rEQ9Mg3Mizvz04VcwRwhCUiqf2+R1uJ0tm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K6tXwiipvLpatpNt2Lq724+n/khUVyEr/OuaF8fvG08l1TN8aHPA/GLr85raiptn/LVYi/uXJLBnQHog1yhV91Bnc8+Pj0EQF+dkKYpH+nwu10/tXzY4t7ClGxS4JGnPqAxN7+0FwVAZQFP8vu3B7f9lizi2q11fJGxs8xgkWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpsz19t1747644985t3448e8f9
X-QQ-Originating-IP: KewNoiMQncWF6172/GixGn+r8xA+9YghBeeHMdJoq/U=
Received: from localhost.localdomain ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 16:56:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1955181229310767366
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
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Date: Mon, 19 May 2025 16:56:13 +0800
Message-Id: <20250519085614.2245892-3-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519085614.2245892-1-i@chainsx.cn>
References: <20250519085614.2245892-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NKv2G1wnhDBn+Dox2tI6ftS3Hlw0lkqqK/EMoRG3orfNt2M2yRO4k1m7
	540F0ljzSOxetHlbnmKrzMNmsrpbmWk4sSyf5U7Lpauv71Q6vc69tbidpxIdVSyv/ZWJ2wf
	KqKM6RpMMenmv0urtyc11OgNbcyi/WBu3oCxsIAEVB57l3zQR+qK//O/2TLxHRVmhQIYG7N
	bV5HcQlXJ/24BU7TgtCymi096WZmiUzNldofbZkGf2qdWCko5dorRehaxZIR4sTx9MLtqCC
	TXDxgA0B/Dsv8G8GNoOVbAe786xM3TeH/fUwtOVzz9BuAcT4ftStSAWSxsOYdiz/zcjsxlZ
	r+7RfLBCO5PrGcrTkOvbyrJ0zXZvrVYEInanOaqjll0VIOSa49ZOMez6Maj4lGWsalLIw0u
	K1YXiY6avAJ5iRc8R4hiTQf+oBM9sjx09T9WngZm4cPYymx/UZecMp1jJXOhfduz/7Nju+o
	qhy8d4MXKDSucSQq/v229abtjn/RCUVIVrb5KgB1xQFMy8uv/12ga5w//so4BbrxfKuzQCf
	Z1OdClJXYKgKXYbcmiKlqQPhqxFFlReSsmg43uprisPeOa7DXETbkK64dvS5a2x9GP2vku3
	O7w+HPPqH3VW/O4c4oRphiKPEdcwgh50Stlciz6P7FCBQTqKBLkFj3dn+vNtl3HT6Zj5d3v
	G9yoY2DiQM5er/cbC5AjimvzZvdWL1cxSSzSTplb+WmJVpF38DOXljtEio/fah1wNn4oT04
	Pu4xUpNK16wBPkcrsMpRPdmv5MQ3ZxduSERmy5hOORcTI2lu91f43K7ivs3YYNKIUiDTKiA
	Z/VUNL2S6oa44N0qOOVu2diTLx77B8KSl2TB3YXI5Mj9jmMOJ8nSfCjyco4trTlGmsl2ySW
	hV6tp7uImZWuhQKcvYYcMD+MleXBhD3x38StJtwOsCuIeKdVfoqGz5GZboZSjXZBpa6klsR
	r9/tbJTGqtLnjCo4Yamy/7Y/x4ngQGmvJwGT21gKEAEt468qyWTozkcKS3DZDwTYfZk5Bc4
	hkv2UCgCfzMQ3rbt5j6OlZOkqqe2BLXQe4xsJrgw==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

