Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA6D221719
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655115; cv=none; b=ul+nZWj201jIVW8pbKAux44OpzH+ZwbcsRLEMSp0VADA2iNUYlHmRLBdShb9uI5t1YwVG0ZDJl3fyT2qW/q1PlGmmYkMw68hRbRWxq+lrlOwurugpDTOrjJg/umC8O3pUwTUQMlBKc/J5X11lx/WhF7RWSpA5ndg1PgKgaUMNRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655115; c=relaxed/simple;
	bh=fUao/0zNH0DgkZ1vpqY/8i593DHfgBHmukSrAR8PXCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=l57TqWDJ7CBLUcogHblqkuuHr02lFIbdaa9EgiKNxrqAPj08WG7cDn6iHQkkZgt0VMR7EhlNWIeKAePTj9pV2a2PXviS9Xd180D4SnNu25Zm1ZpAQ8Lm/SWOPJKFOVPTdHFTnuqI/ptgQ4kLMqM+b2jvDPa8hWDFHaOTBC3hGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fXDv/Ixr; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fXDv/Ixr"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250426081141epoutp013576dad9d1d33733dfdf1304c1f6e446~50BDoIyGK2840828408epoutp01G
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:11:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250426081141epoutp013576dad9d1d33733dfdf1304c1f6e446~50BDoIyGK2840828408epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745655101;
	bh=dSsoXkYUmwOkyr1PD748E4O6HThE8qvbiBOT0LR7VnE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=fXDv/IxrRiiEKmvivheGCJQ/wQ78aNnxQg7eUZKJwIOmS+CQbLjW94mPorlTgLQoN
	 ryU97MFTRD/pacLCKu6FHge/9gdhg/2JE/TheSf1gd2GCIIGt1MXddDUqANGj8Bxtl
	 bwTHtoBLw6U8gIrrbAkQZ4uBA3cFMcKGqcILiQxo=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250426081141epcas5p4df8d936dc585de80584b782998711ef7~50BDJKBOB0031900319epcas5p4F;
	Sat, 26 Apr 2025 08:11:41 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zl2VM1hGcz3hhT7; Sat, 26 Apr
	2025 08:11:39 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250426080212epcas5p2d0c592a4bd539eed242d5ac31d23b323~5z4xvU0mi2074720747epcas5p2t;
	Sat, 26 Apr 2025 08:02:12 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250426080212epsmtrp18ead141dd34116a54c8ea496e3d8887e~5z4xunzou1063610636epsmtrp1g;
	Sat, 26 Apr 2025 08:02:12 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-94-680c9304c56a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8B.78.08805.4039C086; Sat, 26 Apr 2025 17:02:12 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
	[107.99.41.245]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250426080211epsmtip132d515b1371c2289a6ca837bde3ae263~5z4wgAIg81307413074epsmtip19;
	Sat, 26 Apr 2025 08:02:11 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton
	<akpm@linux-foundation.org>
Cc: axboe@kernel.dk, gost.dev@samsung.com, nitheshshetty@gmail.com, Nitesh
	Shetty <nj.shetty@samsung.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] iov_iter: Use iov_offset for length calculation in
 iov_iter_aligned_bvec
Date: Sat, 26 Apr 2025 13:23:10 +0530
Message-Id: <20250426075310.6597-1-nj.shetty@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsWy7bCSnC7LZJ4Mg+MdShZz1q9hs1h9t5/N
	4uaBnUwWl3fNYbPY8aSR0WLb7/nMFuf/Hmd1YPfYOesuu8fls6UeJ2b8ZvHo27KK0ePzJjmP
	TU/eMgWwRXHZpKTmZJalFunbJXBlrJt/gK1gHVdF5yL1BsbtHF2MnBwSAiYSnQevs3QxcnEI
	CexmlDj0fxY7REJSYtnfI8wQtrDEyn/P2SGKmpkkfqz7B+RwcLAJaEuc/g82SEQgUmLN4V9M
	IDXMAv2MEmcbmhhBEsICMRJNZyaxgNgsAqoS56e8ZAWxeQUsJR5sXcwGsUBeYvWGA8wQcUGJ
	kzOfsIDMZxZQl1g/TwgkzAxU0rx1NvMERv5ZSKpmIVTNQlK1gJF5FaNkakFxbnpusWGBUV5q
	uV5xYm5xaV66XnJ+7iZGcGBrae1g3LPqg94hRiYOxkOMEhzMSiK8S625M4R4UxIrq1KL8uOL
	SnNSiw8xSnOwKInzfnvdmyIkkJ5YkpqdmlqQWgSTZeLglGpgSlu4b6IlM5fEqoXx5hOvFSQc
	Kz3VO1/60L1vIttviFawL4iflR5Y0Jzzt7h1Y8Orn4bfO980FsR03z14Z1ETd5jMIoaLtQf+
	2l8//e3d9hlSh2OYprfZSP52PN9+8qmbwBpbFtl1zzwU2rNNHmYaPNXhuX9Cv1EjPvlJak2q
	s1CYRJHMZoPZ22U9nabLbRZL5Dvp93vH9Z0f2do8XlybdzT4kJxZsZRqW9cbxo992VHZFYcf
	v9yzkKPdK4LNws9Bfs4nlrg5Ttf3/7izmtn4idUVpskboz47yK+5dsh7+V6zuE0uDL/W39l4
	JyKLa2eWcVNOAfOOw7aZk0Wmz9r8vGmF2hEb7+0ms1van7l9V2Ipzkg01GIuKk4EAK5t6Hrb
	AgAA
X-CMS-MailID: 20250426080212epcas5p2d0c592a4bd539eed242d5ac31d23b323
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250426080212epcas5p2d0c592a4bd539eed242d5ac31d23b323
References: <CGME20250426080212epcas5p2d0c592a4bd539eed242d5ac31d23b323@epcas5p2.samsung.com>

If iov_offset is non-zero, then we need to consider iov_offset in length
calculation, otherwise we might pass smaller IOs such as 512 bytes, in
below scenario[1].
This issue is reproducible using lib-uring test/fixed-seg.c application
with fixed buffer on a 512 LBA formatted device.
Fixes â3639f96f24a121ec9f037981b81daf5a8d60a

[1]
At present we pass the alignment check,
for 512 LBA formatted devices, len_mask = 511
when IO is smaller, i->count = 512
has an offset, i->io_offset = 3584
with bvec values, bvec->bv_offset = 256, bvec->bv_len = 3840.
In short, the first 256 bytes are in the current page,
next 256 bytes are in the second page.
Ideally we expect to fail the IO.

Reviewed-by: Jens Axboe <axboe@kernel.dk>
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

