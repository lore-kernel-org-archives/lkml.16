Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42643238C11;
	Tue, 13 May 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154242; cv=none; b=Q/h7O2ujZG1d4ld+bHR9CdzUYvY36yVWYe8XNcVuDmQNgD4CrDDkuanwcEBCwcXjxarQhl2ZocfKoO9uCCjxBOKYgRbdoD+po4DZ1/RYR0l/chrU9Jzf+Y3mZrkJeN4hJ/oPFZNST0lgWUuH6X9mjEXPevv+oQ5Jx4pS5CM7Mwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154242; c=relaxed/simple;
	bh=zzX/zyvL1qhidDZQdDjNHvuORFlIIrAwehDPHC4BnPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ic+Hl/c+P/M4Rw4H/A43TZSep/GBnuv6zvqLP5PiR9a3V4Zwm2/ahWxwYZY3UcK4iJDTwzSJe+QfiPsCSWELNhUevHT++DwXY2/A330USKxnd4W84r1j6tAxSjXPJpTpg0mf0g2anUpSjQGnK9AUy8zxxAIZyO3rQdVNl2WZkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz12t1747154125tace0e82e
X-QQ-Originating-IP: irLgkyjuJOT7lIbfJFFjJhR4H1BuzcVGXYnvBLH7KwM=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 00:35:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17771367300780483269
EX-QQ-RecipientCnt: 11
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Date: Wed, 14 May 2025 00:35:13 +0800
Message-Id: <20250513163515.177472-3-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513163515.177472-1-i@chainsx.cn>
References: <20250513163515.177472-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NvH2zBBgt3uTqoyUDzUCf8W9dMvYPcJ4TcQUUoUpHrpMnvn0iJjd++0K
	gsVnHN2mWDrMvWlLYDWjXk5xV9d+ifahyeosUBETbQC8GG/55VtIjYn31WXIGcwTDHgRvyR
	YR+nA2brDudTSy0cLq2Z7yfex/6IG+Ej7vQ5h4l2mOnaSaDbprtRFkb5a/MCGD0ZhkQdR45
	pkU6l17OYmXZX7LGere2JwvY4f4HQEu9ypuzGIjbHJ9PdkAd2W/sra9UIR8YNMo3Pt9eyhB
	Q6Izw4zrzQ65ETYh3Ylysu8fjXkRMgDKKPd+RA1IwSMa2mBJu2DXFlNw4WMBLgLE1hYRD2g
	Ljb8diE7Wfnnb/n4YWoTsr/JB1WdWUwqTBKmW2xbXvTFUxx867+TGl7QhHkfCDFyzIl+58v
	gud4sSOJN3A/xsnsotL1B8MELiuIrJpOjnMTjCSv8X+UKHHtC3VINJzdT15VId5GN3MLMUr
	vpjuUrbVkC8ohV9TYc6p8rSmH+JcqKvGouLhjtRB/AxiMmgrPzfJs4mazs3p7S9nWuXXnhQ
	jO0ZjvxR8o5aKkeCQXvtY1kYVa9OXLWjDzOI7hNxsNzMMCwqMFof056nL1hIUVw1habRXX9
	wtBcgEXcmDBAkWKmhpImVMzMCl1HEoCmpg0bzo7RoxSOkuP6Ii8CawSi963zIIn4LkePs/n
	TANp0SC6QX76v+Ai7KccIAt+0SThX4eiBa5UwLuV8IFptRd11S4GfsVi1suCPATTLVzRLwn
	S2qGwvxuXdhtXfgypU5rXfuIoXEZP8K6M6mOu5iCTWYbrva03Bc7jg7ca2kFuJxQBB9W4yM
	kFTbsl9klBqeiCH20eicTb1vmr+gESpOcjqusovqjg2dp8xvXJNZFR5Q7+Hmr2A/UYDWh4T
	Yutgh/ESPRCHoR6tQcomDfpnt2KVrX+6hd4nZJLuXO5Ij7jEDmHRT16O0qeGzv8+AtU6QFU
	h9qORHqXNPMQiiaIaNSXVY+9cGLo8VE+hux3d5sKwgV35noT/qZUxBxvp+/VXWw99UyGDZ5
	RH214eiA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This patch adds device tree binding support for
Sakura Pi RK3308B, with compatibility for the
Rockchip RK3308 SoC.

Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

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

