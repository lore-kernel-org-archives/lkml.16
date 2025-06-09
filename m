Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C484A3C;
	Mon,  9 Jun 2025 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.124.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749468741; cv=none; b=nP8IIjG60+9YuWaw4K2PQaaDYeVsNNB7/Infyl82GxkD2mvDxnnDRm/VmdbGUfgDBakJ7GK09v43Ld6mDp8FYXVIpINli1GAhITvQm9h93gPgm5/mEJs3IUNAbAvHzWJNwLF2j8CRjPVAXvSi0GjJcgFvFIWSTkzuZhOE224eKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749468741; c=relaxed/simple;
	bh=n5dHRGrWYAtPBjkROOdK7fTKrRqPRD4wAZpO/YnM55E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N3AdelbIY2gsHgrC5ZEXbHGchCKpmctqv5kBJo1dcF7ypEd9OAwZ+i68Wcg/FOB5Mn0bhpIv9CD+IUbs9GSxSrTGLaJc/Hc7hrJ8nP1L7zXU/ITyEqJILuHjoEqP+b+B8iHuf68E+cbOkr3Az5QbtifbfziQknKd9DxqvsUCKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=114.132.124.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz1t1749468653t1fe4a133
X-QQ-Originating-IP: Uamw/6x5U8w0+kK0fNriFhILhiB88ys8AygX1uwiwqY=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Jun 2025 19:30:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5652948970939848094
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
Subject: [RESEND PATCH v5 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon,  9 Jun 2025 19:30:43 +0800
Message-Id: <20250609113044.8846-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609113044.8846-1-i@chainsx.cn>
References: <20250609113044.8846-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N+ZDtxwW2zb5ikshhfMsrlyHYRW+PjCy6q6qQzE1JxmMpUMQspruBAoU
	c+C3EYzKmvSbE/lFyV4AcqpPhoKdKSxucQ+/cF6noc0ldmlgZGy40Kd6YJEVUHA2Ju/qoLG
	P7Hn7z5iDf+6MAYrS7ijTHBTlpynrMPbBJJcyobRXTcAgYY2oennuXdmwAuU8cnO4pkkTFZ
	+P4YnYc+C6WtWYwFfLhH4XoJtW4bUWFRCvqlhciKTVYDvrgSQYR1uG6v8awz34hTSrfemYo
	gtBJdKIe8mzKDrg/4t9GeATjj3r/kQjS69yTIOcARlxsCVi6N4NKKcf7lV1eycAbzxolnsU
	lVSWWyfViX7+sIjCmXstZfaL4FTUbyDGM7j9Ea9oCbQraq+hMYU65DpTZl2r1FTgtPRVwzJ
	S7tL47OW8O72ycOThPH09cSevcR8SV3HsGjtSDvQzgl7btzYTGP5b333Ww1DdACyagJO426
	AqxEkxQa23yga+0hiAf2nFifBwG8W9+Rz//qQ8SHZuxvUHmv+wdv9lVUNoFJg8X8lVnNDPm
	eBM/WMgud98EYcukmnSKKJjIYoJkAg1FzS1fQqByYDeHk6RALBL/iJuurBs9B/Za0uxG71m
	FIpMVfBE9nAY0zAGklmWFzG65nNqnp51kpcVmWT0Zhi267qtg8L7CIGOc6VhinBCerSbXn3
	PpnYvX2EriKOa7Jeb2MN0vvkGsM3l6UWCF+NCPUVTmMpeqC3eP11yofkoTyUVkNa9HVA6Ml
	2Ou78okyBp9va5Oy3DU/C5qWjJAopQ0xruN8DjmtB1wIQkacEKFqbBxBKwP6OzlD7Xh/oKW
	d9evW0YJ/wKAvHyVcPOs9b7HqbFfeA3X7e5GxdPiOlfwSy/7jcmwVUfPgTB+YjG/6Jh7N+P
	8WU0LEPs8mmu4eslBB7K94I4fWqO2xupUUKFNHcDihbWV03SiZtQb71E5ZG8Iq/4tNlohDp
	MyBSAUdmQ0JZRFKpRo0Q7yJ/ujPJkZyQSB45D6Z4/tDIwvPb/AwnnzADB2ezr49USGqVWxw
	nZxSOf1wgVAGRKDJqYJXI0SWea3XOmYPG+OYxX1g==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

