Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6882BF3ED;
	Tue, 13 May 2025 16:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154233; cv=none; b=AFfyVEg/ZOTXTwBiK1o7c9uYXTqigiYIUxyLsNG+ENfJMmVz05vtD2Se0wUEdzYXiWoO/+NTYsEmXfn2mNKQQNzkuN5xT35Hkmp4OnejxMYy7zTabKBGcc0ALfKzrCM6B+idPzwbG+q2PgNB8m5IL7XusaCGCvj9tWBS5MSAPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154233; c=relaxed/simple;
	bh=6xJchB9Ej9qCTPrteESID4+eHPSThGpusksbi+f5Jmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t2y8++uqVT2pc3no7YvI1XfUocAdNP/YeoPSaadZaM2HJfe/sjVUJfQHCXXF5yj4nu50Tfrok+4pMiKCT3rU20I8V+Xy9facG7VQrtN+0NQkduPruOafB6DsbpL3mG5GdqD/FfhJgD2MCMrYLw/vFN+0pOm0BQxuilVoZdxIwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpgz12t1747154119t284e3be7
X-QQ-Originating-IP: 8uXPQpioheAdZ3NtmZqvxBvM7bPXQlo+Ap4Eyie6yeA=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 00:35:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15007006065327461002
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
Subject: [PATCH v1 0/3] Add support for Sakura Pi RK3308B
Date: Wed, 14 May 2025 00:35:11 +0800
Message-Id: <20250513163515.177472-1-i@chainsx.cn>
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
X-QQ-XMAILINFO: OPHbpUvlYj5kf0/5CT50sV+o2xrXMSEOlMIgbWi/qgk/jTnkcFi0kikR
	PuVgCyJUI95hyFK+dOcHIhToK/OBmJdTvowawbFQ261bXXw1tFASOT606U6p/7baKtTYssa
	ZuLJxa29ul8FsiQ6Y4alyRBrxfX/Ahh4CRKseiHu3T/Dc3aSdbVoUOh8NmOg917GYB1+rvC
	rj3Ya2Us/FDBVB/UEDZ6E+vzw/YdnjflGNo5kTu6MhX8yz+00g00ndnaz0tidqVy6gOlRl/
	Q7JQm3JUI5KAOuky+IV7X2lAE2sIvEXpxAIt80vr66gb2bQs59F9f/CA+Lqgj3pV4+ZUqQF
	F6Ck9HfuJ8/4GgORxAlkdYcBkAnmll1a14PMNQM0fZt/yeYqKPrp0egPceQH3IXqZjO5cdY
	Z5qzrAQ+K6vMTEh/6fhI4jFTRKj3UaIhZn3RF+X9Q/e48LAXM8lqNDdLB7DeYzW3+oytd23
	Cs1nq2/Vk3vvzA42G9K+flTc+KAvtRpPxMEW3IJC8O8BMjhCGsFAp4H0W23f74IM5LqUqnM
	ldUWzGwJAbicAVpj4k7XEdD5JP1hCSpuOoXPdSXDIueHG7QmdhDuDw/yye9zat0sqC63Oqk
	lLvQZhb0zZP0y3Gi7NgETUYr0rI4HCIaQfpGB4DE4Rh931af/8EtxUn6svDF886DY7J2J73
	4BxVt8YTURCjK5eFHaJ/1Y0Xy2BXnerAlGSr76Qna/LkzVQROHzyFL7lPnyyXUygUof0p4Y
	mncdBpv3/QYykFR0vplHgJB7XvUClkne2x/Rv57/Lq1kC8vRVB/3gcHOVWNdSvV5/lJ8odQ
	gx2IO7I8KCBLFQ9fgDQ5QkRDGCey359OYyD8pRq3ShHx31oGmMbcbdJYeKz/JMVIXFvyb7W
	AGO3pAXASqkGOzDyKcAdVMfJsHQiDp4J0FSDZvHEZYNNA3FkxfprmjHBJVodJTldaH44nid
	nmt/w5ZNdIa5ILv0tuTYSKA2U036dI5Ir+zA=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

This series add support for Sakura Pi RK3308B.

Info of device can be found at:
https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Changes in v1:
- Add support for Sakura Pi RK3308B

Hsun Lai (3):
  dt-bindings: vendor-prefixes: Add SakuraPi prefix
  dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
  arm64: dts: rockchip: add DTs for Sakura Pi RK3308B

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 295 ++++++++++++++++++
 4 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts

-- 
2.34.1

