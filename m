Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF021B9D1;
	Wed, 14 May 2025 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209634; cv=none; b=L3l9fimKxjBevnRCSF8aVoi44ZAVte5Yc4qBt7s/mJ4A/DGJ6x+vybv28mn/lvEzTs605lYWKz1ZTrPSlFEPg8R2bZ0qLTt6R3tm7kIGFwqRw1OgZoN1FT2aPFpIfZ2UbKJ6qVKMxMO7u6I612nfivGKrVp66XaTWLf6OvMytYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209634; c=relaxed/simple;
	bh=1L5dxb3w3mSwMAqrdtId+6ZWwiYG5boKi1N16EaiagY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PtOfYuL7OMR2RRl6kGz3oK4LVCCRg7u/YSjHFJnGlyUtwJIZHllx3eJb3VT1RQhaYl60Fzb/uCYD9bLFunWebC9vc79CzMYCiO/8l4DfqdfmpNSN4wPQhZNCvm0U9yw7r5cidIJSK0H6hV0UTeOJ4KBuHcrsh7rDqDGrFVUyFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz12t1747209560t57538c21
X-QQ-Originating-IP: UkugXRb1Btj1MtZ3FYGKjn7tGsu8nL5lEn2522Dv+Ag=
Received: from chainsx-ubuntu-server.lan ( [182.242.225.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 15:59:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4869173618778214123
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
Subject: [PATCH v2 0/3] Add support for Sakura Pi RK3308B
Date: Wed, 14 May 2025 15:59:11 +0800
Message-Id: <20250514075914.194651-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nn0cKypYUfjdbV0acRFjxyMfhlNsFPYKbPTemBtgV+o0QPcQh1HAEhXz
	oK3cPe9JXPRSKMgi84MytHxDPJ3ara1RffGPyWNmQq7LHq9UaLnELd+LuCeeH6wTsybLu6q
	1HleJyJat0zXWAzTcn1y6djXejyc9nNCKlCPXVKtFbMbtmB3QjbF50E9mERqV5F1KcwWYsq
	xUIKzzKvAaZooREHD5gXtde9T9GY/gRdblhu/yNvPyhHz6ANlTBd9ocO61VxXSa38/C+tek
	fCvRG1FDhYu/5Qeh1Y91HOpNUW7XLdTQcR6VoWe0LE8WpDu7N891Ax4ITyaEShuvZK4Bafa
	X9EYtDW4aPEs9KWHh/S5z857BdNqFxST6lZZbXIjpGzPbXOhrFtzI2CRCGYzN4vESfQYXAg
	tL3xQe3WXHA5jQg9386P4jCCcvbfET6u60QSJWWC8zdzH91zJUIoy9P9QjHb+kOItXQ1bsJ
	GJ+Xw+0tBJU/rpxS0XrYoJc/Y9F+kqHFdF85iwQ4Bhkx3UllPlmLzXs34DSksgl9Ye27ViL
	mPNClXXqNnqmry8HNb1GLE4qbDpmdgUQAbT63dXRsInpPskOJq8gHE7XAw6MRe7m5fwDdNm
	Sr/bU84YF5WVeTr1Fo77TbyZeaTTBiuxQ5y43crCxOnQxK7S8luTutvZDFg4yAU9pT1tH/w
	G4H8h8q7Gp2+pOQ8fTpAnpcg2EEv/bTiBWDADifVaVfi/KJgn7sP1XWDwzLGyG5z1BkH0eM
	P0W30mqfRAP/qSOy7XjLcOiHzfnwcow1rQ3EjGdaU1IlfagCJrfo7QgqVSr2lH1Q7vmzM2H
	1VEMBBbhzDLrEFQZBE8mfrtzg9R1j7xPlZt+/gnLOREI1wiYPP/yoRonFisLusJ04yYKlOP
	v29ZN+XMSvxOeaPkOmgd2KMvbKvOnw0bYLpJM1Tmfa1EbjlkTeirq/kn1xrLuBfX9gDvuSj
	u405XmtiOC1VZ08UnKbrPwNKN12BXs5dcn3ClWCaIuA09d+g9iPhN5Qio
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

This series add support for Sakura Pi RK3308B.

Info of device can be found at:
https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Changes in v2:
- Update regulator names

Changes in v1:
- Add support for Sakura Pi RK3308B

Hsun Lai (3):
  dt-bindings: vendor-prefixes: Add SakuraPi prefix
  dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
  arm64: dts: rockchip: add DTs for Sakura Pi RK3308B

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 274 ++++++++++++++++++
 4 files changed, 282 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts

-- 
2.34.1

