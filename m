Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B31AC44D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837591; cv=none; b=IxE028rzD2QCd4MIUZit1BFQXWIlctpR+om2PZJy7SpZWfkxBiVJkCxqTbY/VaWhOjjLw5c3aLk+qYiRP8mFOMLeqmzw/m0F7+L/mNuiujvzZhVepziWtWyTCSOAz7vy0ba63Es5YwIRs9aKyHzlCLEZPGeqBVhdqmb47DHhvaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837591; c=relaxed/simple;
	bh=LVQ136RWyYRc2fD+t9t3p/5kJXBOfZ/prV2pR22/y8I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=K5QEe5dXI+R5x/E0MQG2nICZyu0EFETRCGL6Yjm83UFN2P/tKAMX+ovL5HktsvUmREa2GG16dOIgwd2C2x7NenhUBzwiBYYz3oJCTzvjWhxenK3A0mP3tgppjzkd438BTvFapK4f9SjOf1EsQsRG6DEdghBiUljGwTi4O5l9MXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UIfkN/8d; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UIfkN/8d"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250428105307epoutp02f8eea1988d88875268741ac778578373~6dgkm6qZU2676426764epoutp02D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:53:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250428105307epoutp02f8eea1988d88875268741ac778578373~6dgkm6qZU2676426764epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745837587;
	bh=ZpOykj4NyH8OeDmsrqGV4eLwknuE5Llb0rONDyJLoLM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=UIfkN/8dbmzA7aDQcVeanqNL6SDCSC8EpNW+N+dQuyzNDzCGv2RCnmvP+OuUhwc8J
	 bKdb5RWEKGJl3raj2/tJDUW8d/JYGW+hEDHesJVYCwm8XDqN+DGY78ROocoRIfAUD6
	 KRjGJAJta39e+WRlODxnnss6GI3QmyoH/A9k+u+w=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250428105306epcas5p10398f853ddd88927a174a6dba33abfe8~6dgkLeGqC3228032280epcas5p1O;
	Mon, 28 Apr 2025 10:53:06 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZmKzj2Jhdz3hhTC; Mon, 28 Apr
	2025 10:53:05 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250428100738epcas5p3eb82b4ea94b229634f9319d23d7d7e14~6c425zY3r1485614856epcas5p3z;
	Mon, 28 Apr 2025 10:07:38 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250428100738epsmtrp23a2e80870d794866303e307fb14311ae~6c425FNh62525625256epsmtrp29;
	Mon, 28 Apr 2025 10:07:38 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-7f-680f53698ae6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.FA.08805.9635F086; Mon, 28 Apr 2025 19:07:37 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
	[107.99.41.245]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250428100736epsmtip11694115ac09e75b0c4231033e257f9a3~6c41j-q6U0417804178epsmtip1A;
	Mon, 28 Apr 2025 10:07:36 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro
	<viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>, Christian Brauner
	<brauner@kernel.org>, Keith Busch <kbusch@kernel.org>
Cc: gost.dev@samsung.com, nitheshshetty@gmail.com, Nitesh Shetty
	<nj.shetty@samsung.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3] iov_iter: Use iov_offset for length calculation in
 iov_iter_aligned_bvec
Date: Mon, 28 Apr 2025 15:28:48 +0530
Message-Id: <20250428095849.11709-1-nj.shetty@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsWy7bCSnG5WMH+Gwc0kiznr17BZrL7bz2bx
	+vAnRoubB3YyWUw6dI3R4vKuOWwWO540Mlps+z2f2eL83+OsDpweO2fdZfe4fLbUY9OqTjaP
	EzN+s3j0bVnF6PF5k5zHpidvmQLYo7hsUlJzMstSi/TtErgypq76ylrwl6vi90vJBsY/HF2M
	nBwSAiYSs97tY+pi5OIQEtjNKPH85nY2iISkxLK/R5ghbGGJlf+es0MUNTNJLG2fAuRwcLAJ
	aEuc/s8BEhcROMYo8XPJZkaQBmaBGoktfW3sILawQIzEvok7wIayCKhKtG44CTaUV8BK4s2b
	DnaIBfISqzccYJ7AyLOAkWEVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZwoGlp7WDc
	s+qD3iFGJg7GQ4wSHMxKIrxVBvwZQrwpiZVVqUX58UWlOanFhxilOViUxHm/ve5NERJITyxJ
	zU5NLUgtgskycXBKNTDV3D6cNzVrjpZy+OKTx8Ij/5+WifXoM83d8f79kb7uJW/5qtWjmarZ
	Kr6vvMZ1Watn+b9ktwPpESXvM7a03TKa86T9lv6Lj9I3ORovNdfecC73vps3pbJtb+KsrVum
	evZ95dl0a/7F+vQbs6vKfyz+avHDc35V+0yT1xK3hT+m7srT0Nqn1a8jVfe5sSt++++IO1zb
	l15VsRecpPhrXkTtpj2zl5WkKvd4/U0o6XSaLdH38Pe9gxfZL6bbi2zOyxHJDHmV8KKCYUv/
	hbsbf4f2xcUEla6Rn7Zt5cnNn2b55LVodUhLlu0yLNgQLSy/nuuIPlf86eQGG9fABwVJ2VM7
	HTVT1xpy50W9XLZMbbYSS3FGoqEWc1FxIgDsv7BFowIAAA==
X-CMS-MailID: 20250428100738epcas5p3eb82b4ea94b229634f9319d23d7d7e14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250428100738epcas5p3eb82b4ea94b229634f9319d23d7d7e14
References: <CGME20250428100738epcas5p3eb82b4ea94b229634f9319d23d7d7e14@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

If iov_offset is non-zero, then we need to consider iov_offset in length
calculation, otherwise we might pass smaller IOs such as 512 bytes, in
below scenario[1].
This issue is reproducible using lib-uring test/fixed-seg.c application
with fixed buffer on a 512 LBA formatted device.

[1]
At present we pass the alignment check,
for 512 LBA formatted devices, len_mask = 511
when IO is smaller, i->count = 512
has an offset, i->io_offset = 3584
with bvec values, bvec->bv_offset = 256, bvec->bv_len = 3840.
In short, the first 256 bytes are in the current page,
next 256 bytes are in the another page.
Ideally we expect to fail the IO.

Fixes: 2263639f96f2 ("iov_iter: streamline iovec/bvec alignment iteration")
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 lib/iov_iter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index bc9391e55d57..9ce83ab71bac 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -820,7 +820,7 @@ static bool iov_iter_aligned_bvec(const struct iov_iter *i, unsigned addr_mask,
 	size_t size = i->count;
 
 	do {
-		size_t len = bvec->bv_len;
+		size_t len = bvec->bv_len - skip;
 
 		if (len > size)
 			len = size;

base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
-- 
2.43.0

