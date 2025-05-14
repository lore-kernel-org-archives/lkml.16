Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C99200B8B;
	Wed, 14 May 2025 08:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209629; cv=none; b=pRlq7oID3qLUsDPQAc5d9sqCPLPGuLf+TT4VcxGVAFpazhh76AgewTPt2H8j4F227EZf5nDH7rF/j94oSjhhE0coLwH0JY4l9vAGau4XKxyC1VEaoQhdY/pcMD3bfa+sjFHNjwrUM/p5kQwDVTEmUI5EmXq+yUEm2mBfLp5tTKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209629; c=relaxed/simple;
	bh=+sc5xF/AgzBXcC4c/GiyV+457U3r/SGQb/fh3Xa2xKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MfgLhVrte5gIyQwEfLAeNG+ugNCjEtxSqXjF8lvzbyKxcSYmzNrz6k9+fCbWsONiD1ZvFhfQESLTi4tcnk3xV/aprGuHdzINSFbVtgLnzMBDRtiO4aJUopVpfDF2YPP2lhVii6WE3+VtPfaiUltxQ0VVtxtEBaOVi+2rT0LaJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz12t1747209566td5a1098c
X-QQ-Originating-IP: FI8528WaxG2H3euIWiQn4sbSZe3lWe01+6ZwNSM9swk=
Received: from chainsx-ubuntu-server.lan ( [182.242.225.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 15:59:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3460519599123491404
EX-QQ-RecipientCnt: 10
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org
Cc: i@chainsx.cn,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Date: Wed, 14 May 2025 15:59:13 +0800
Message-Id: <20250514075914.194651-3-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514075914.194651-1-i@chainsx.cn>
References: <20250514075914.194651-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M3uTjkO5QXGxU9dBLPLehe6v7aI1+EYgkxS7x8s0VW5KyeTM81Rp6hJs
	L7Y3eiAj+9mZ30tc5UiB1+5xfVWeL2/xN66oiRLANsDS0IqzUZKcVZxA+JvpeKXSr24OQI0
	OXJvfSqQj3Rv21e8EmzF5+PlwG9DpKgSkRvKgG757RZlliVhqDPSCTJrbe2Ff3PQBTNxoKs
	bU2m4jljspO8BJHfBcf4yAZzs9KTAnHYscr0Bh97qsFh8FF/mJ5CjBIbWAsonsQxlBvSZA/
	oimT2V3tX1yH5L8S4QJudLpPNRjDE7AULcHyTFAMPrPdQJyC1K62tcQFP2LFP3TBP+pePLZ
	nsJ1Vrz8YgekZ+jqMOUqngwmdubXg/f5NTd36/beTHyftpcfq3QWWAhhMfHCx9lrBZqcVzd
	zoABRSrZqiO+TLnaJikg/0Sr1Gkw7p7V+MvFJ0CmNhYuhcFKYE9ajhjd7PeA58+VwdBO4y0
	/XElK3rflcmjPlyAbp4NmxyWn46Bnrr9V7WBdWLI614SyDzRBrqQM2pBpA8LWIFVd+5ntL8
	Fnks8yQ+MZAIehJxuxw294pM8FfzUO+IK2uyBfCWVeSlq/WXod8Kp29agsyPUhTG6xCLUA9
	tMKC87I7vy5bhecBnmlEAB5sR4P+LYpCZ7q57jcEB97ZIb/sgTiP4dnzI6S9RbZaBQoaii3
	pNE+geiydvLrtYDyjiYOnAoKdIGsHCrVio+Sti6/bsOn8vBB9shJtExw/hHNtienhr0bFNR
	vBPIo7IQxg1z2cBwlPKw37J1kvrRU2B9bIXOsKa3ypkIQ4T7VHAUbBny152K18xuQ/Rm8Vt
	Mjmuw8+FfyomJn64wZ4p7bDcwjK9+VJKoiY+92uIs9zOOucxxedvQCCCFGUIPbcNUvYl0Gt
	89rx6Gmp+yoQ4b7vRn7RBYSInoHXZ8EjUdKI2oUfv3bog7VQG0y/FZDoDerR47fYlIBXImr
	I0X3BnHWVbYTM9sXgK8W15VeGfTRmdMAupO9tO2pzRshQ734kt7QFIdHYwwsWVFgl4fINWI
	JQKDZBymNzYwGpBa9Zs4YwihpBmWb0YETZQtl2Nq/93caMaxY6gk5wfPllkPs=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

This patch adds device tree binding support for
Sakura Pi RK3308B, with compatibility for the
Rockchip RK3308 SoC.

Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Signed-off-by: Hsun Lai <i@chainsx.cn>
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

