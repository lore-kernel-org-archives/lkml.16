Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3DE264616;
	Wed, 21 May 2025 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833131; cv=none; b=bL2SBZFRFSA0IoRU9PO0H8m++0n9jqO1Gtbe6ghIcejpzWiUTMTT0oWlK0pmZ0RS9P2M7KjTNMAsEo7CrKRXXh5+RwxAJ8VZp39nXc0Zg3QjS/YT4b2z4XY/M698H9Fqps0uZ+7NHSOUvgA66ErovviGAky0ZthYPnMQfcfEh/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833131; c=relaxed/simple;
	bh=hF+oG7v1AWVhgu9lPf1uizRbLhlMrZBB343LLtoUJhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ugCwFkyz27hugPR0g/6hsYkMNQYWxXDCayEwFwu7lxxkTH9bVDTItfK5n8okd7CzCadrsFPjkTPtL7EvIr/ji4Ln2mL3vIk3iZYZ6/u8IGcmgI14Bw1jKUBx99sN4jVnrJ/MJ8HXjlLKRGu4xeGxKFeIx3ftMGU4E9JKMHtr7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz16t1747833073t96ab1b52
X-QQ-Originating-IP: eJZV5Pq/27UhC6wbS5MVd9IwULhg6bRfY+vB2uhghy0=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 21:11:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16382578765588849597
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
Subject: [PATCH v4 0/3] Add support for Sakura Pi RK3308B
Date: Wed, 21 May 2025 21:11:05 +0800
Message-Id: <20250521131108.5710-1-i@chainsx.cn>
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
X-QQ-XMAILINFO: NbLKFbIf58WKJLsowGlccw++xJ0jWmihH0hHJ2pWLJMAh4lyqgcKpCIW
	Ux8uRet127EE3Z3XWUQBJOAV+u/5KHv2b2nNalcLINhC6Py2+UPx+Rzv7Ay21A3/rnTFqro
	GFZo16UCrdfh2+/AZmuSNVVGFIMf0FXSqgIYHjN18agbgMQzLRtpb+nSBIHDby3TCgCcoox
	XuBIGyPu3zdUddY0sySb72ViiWIEgxdNygwRNbWv7NX1R89ps/0nkBlphiAQBpzp8xaXufJ
	auLlwuuVV4uGi6WJ4s42dKwZBrMXug7hmzkuGEqdAlusS3HgkrZlzHH75cOZbZFxIfkhJLW
	9EVjfrJRg/Ea8Lw/X4jOPTUpPx4yhZYwCrda6K9makaqxu9Vnani2Lk2uYBCpGI9Pd7nd5o
	YYLBs3w9BoRTc6JGutIVhBpB+rJBocngZ8NYmrtAe12xIc/0QqyRw3WGUkMcOYZzTF5yybM
	r15+kl1uYLoDsUXYVq7qvqGqguwmzLwi9sj6/ob39v5Cm9TaYzF8M591Jirw5GKwN6IiIYg
	6TU/08iZGpOoK41o2b5zWL07AR8fuGIT/OEQnuICBMdga1uQ4+bYjM0xUbEp1DLS0DICsZ0
	rukC1sKk38z+TpRHMSNZiLJUto9sRGaaJfFJHsX9x7Ib9zISMXQHONlR3elcs8AH49Gcsl5
	TCG4RlBsVwR6G3wckMH3+O1sY2uLs/y21lP7EaJeuXVM5Vc7+jnYLFuXUX5/YzxJllhzmLM
	k4tT43ynl+vrYOFM8KZRwGuNdj+icuuNfbmnu/qLDa44zT0oHS+cJPV8F0Vo/AAgGFYbcaZ
	AqTpjJb4c9pQZGiTVVWs7B+m/tei4rotQjhd2fIGH7D28p+FfzO/PCvBexOcE9vpWaIcsTi
	FDY1X61fuosJnw8OmrxARSjgL8TzDJdHFLUKkUBQY2F8tmRkdht3d0dyHnNSl9XUCqv0pnM
	rlrHfUO5K21C26WTzzKO3xPM0ZwCmyzx47evi6dAk4dvwbXf6S9AP+3QDzEL0GUoJK/ctyO
	2BCZ++ww==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

This series add support for Sakura Pi RK3308B.

Info of device can be found at:
https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Changes in v4:
- Fix vendor prefixes error (Krzysztof Kozlowski v2)

Changes in v3:
- Remove empty i2c controller (Heiko Stuebner, v1)
- Remove unused spi nodes (Heiko Stuebner, v1)
- Sort nodes alphabetically (Heiko Stuebner, v1)
- Put status as last property (Heiko Stuebner, v1)

Changes in v2:
- Update the names of the regulators (Heiko Stuebner, v1)

Changes in v1:
- Add support for Sakura Pi RK3308B
- Patch 2: Acked-by: Conor Dooley <conor.dooley@microchip.com>

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

