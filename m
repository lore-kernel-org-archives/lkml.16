Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E925FA0A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216430; cv=none; b=ZDH3uoaCHYDgW4jyPR87HOzQHn9412S85T3nvephDgrM3w3/Byc7vqv/yJ9H4LM/q82sfy7RdMGc3Dre7qXZDsSRt4EtKvNTOOUgzDljfWlrln15ioRSdwoCMsx0BIhc5+wwk3cDKUo2C+lT5Sy/KoLDmTMYKR4gZB4OXywlHUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216430; c=relaxed/simple;
	bh=atyitCEKPo/sR39ot1ypGJArFGKNO7YqMSWVEsH4orc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=atwYmO8Idbk/M92MALYX+tL3DzsBPhCYi6rUNuwj6VceCY+/dyFFRwbLMLf2noLCABD4tDZAczxEI3aGSG1ePDbnfCEHPTcq7erj8JoWx5ik/Opu2TdxP28kCOecCObibN1ZFWAyMQ5XVLZKGmgTt9n8yJOM0yopgSZ7SiLg0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qLKYGqoN; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qLKYGqoN"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250514095340epoutp01a24e0e271708913e52cc660fe876cf5e~-XBPE89Il1870918709epoutp01P
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:53:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250514095340epoutp01a24e0e271708913e52cc660fe876cf5e~-XBPE89Il1870918709epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216420;
	bh=9Qg8cccbFqUOc2UTuMr4PQBF5rx3CZxXMxNVXLkP9iM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qLKYGqoNZWCpEPswjKSiL/jwZdfg6hKG8BNcTBVvm1RhAxDecxaNguhe/3/u7MbJe
	 nKWqNduRqYJm6mzpWQ9Bb1sGjKkSbuSC9lZwTwSz6A3+VEVTOmxtNFsdsxOvjGekIn
	 JZiYHE5P4jODE8PT4xIyT9c2ejiFARr/4kvve7yM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250514095340epcas2p35d5b5b07e4af0e655a1fcef524752925~-XBOxpJeW1373113731epcas2p3D;
	Wed, 14 May 2025 09:53:40 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zy7vl51Whz3hhTC; Wed, 14 May
	2025 09:53:39 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095339epcas2p1c0c174b1d2d5aba23899363d2fd5928a~-XBNzkFCu0288702887epcas2p1y;
	Wed, 14 May 2025 09:53:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095339epsmtrp1e4c02d91f25a0d152e7254ebea3b5f81~-XBNyzjhC1996219962epsmtrp1P;
	Wed, 14 May 2025 09:53:39 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-45-68246822f3b2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A8.AB.08766.22864286; Wed, 14 May 2025 18:53:38 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095338epsmtip18d6f3b10cccf8ea5db315f0b6ce9c3ef~-XBNnLVxT3233232332epsmtip1W;
	Wed, 14 May 2025 09:53:38 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 2/5] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Wed, 14 May 2025 18:42:17 +0900
Message-Id: <20250514094220.1561378-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsWy7bCSnK5ShkqGwYyTVhYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZexf2MlYsJ6rYulNpQbGJxxd
	jJwcEgImEo+Pr2DpYuTiEBLYzShxcft51i5GDqCElMS7Z5YQNcIS91uOsELUfGCUOHmwiRkk
	wSagIzH9320WEFtEIE7iWPtmZpAiZoFHjBJX5vUwgSSEBcIkDq45DmazCKhKLDx2gw3E5hWw
	ldjz7jYTxAZ5iZmXvrOD2JwCdhJzW1rZQI4QAqpp2u4BUS4ocXLmE7BdzEDlzVtnM09gFJiF
	JDULSWoBI9MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgwNfS3MG4fdUHvUOMTByM
	hxglOJiVRHivZylnCPGmJFZWpRblxxeV5qQWH2KU5mBREucVf9GbIiSQnliSmp2aWpBaBJNl
	4uCUamCaZjvnoFH7hqWzal+JNj74vneDusH/tf21N38UJBxjTv0sc/yCY9/UDpnN5rN8WpeV
	JlWwqxkI8x37t9aRL85E8nH+rsTq2clMutc+GGuqPXav/bVi2Zp9lhsufjZvb353RvLcpyV1
	E572iU7xfc7THPRKtTTjzo/7Qj2rz6z/uqaYb/oEiYVpvCc+7nX6LfPchbckxUOQ72J3ySyO
	nydyw1s3K/uotlQ9MJrF3KIzXyD7X2r7hzcpvYsZwoWYTCO+3CnIuLel6YvItiTVV7eXlt/x
	qt6j+0K+OP77KRaGp/EyXxg2vhXU5v4x/9fVkxG5d6p/71NX9WW1bv6wpHlawaaMcoGqlDWq
	ClqLMh8rsRRnJBpqMRcVJwIALDGlEOsCAAA=
X-CMS-MailID: 20250514095339epcas2p1c0c174b1d2d5aba23899363d2fd5928a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095339epcas2p1c0c174b1d2d5aba23899363d2fd5928a
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095339epcas2p1c0c174b1d2d5aba23899363d2fd5928a@epcas2p1.samsung.com>

Fix the issue of max_timeout being calculated larger than actual value.
The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
S3C2410_WTCON_MAXDIV is smaller than the actual value because the remainder
is discarded during the calculation process. This leads to a larger
calculated value for max_timeout compared to the actual settable value.
A ceiling operation is applied in the calculation process to resolve this.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 228f86d83663..c6166d927155 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -379,8 +379,8 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
-- 
2.40.1

