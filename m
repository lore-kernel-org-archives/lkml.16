Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D2282F5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744780345; cv=none; b=NtU09nV5b2XErvmwmV8NOcv5Q2IFz90E+naoCOcYuymSJXYYbt4ovdJleqlsV86ytfvQRsGo7h/vTswWQgiLa8vDsOwiBRhUX/tQQa+nVFM9gFaEOGCklY/N0dH6WiuVkpyvoB8OYcMBBSz9MCF8uQ5H6KJspEthx9r+mKbIWwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744780345; c=relaxed/simple;
	bh=6bzi3D22lEmU94cfFmZ/44w/jYRm3tcbTK2SL0b/7qo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=QdHfsZJShqSaZ5tP/XVYdvHLOB1lLYSblxNSS77cuymcXLuoUTmmAXp8381uGIAv+APSKZCHGu2kkZ+JvRgzRAFIB6zVdgsEAJY0V2tD1PwbzkSKfdojgdgGM8oi3PnMu+2stsI7V6JVIIL/T543chYayeNlt5ruMyap8kYXBQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZqWCGCTl; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZqWCGCTl"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250416051214epoutp03dfa284fe840efa3ae9314f397048b9fb~2tHhHPKt00647806478epoutp037
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:12:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250416051214epoutp03dfa284fe840efa3ae9314f397048b9fb~2tHhHPKt00647806478epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744780334;
	bh=dzQh9mvOLRGKcWm4cppheiYkU52WIlpYku50a1fRGtE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ZqWCGCTlCsHTPIS9VX9gZLstFaiZ59EhDfd100LI4LfMCsQVjQFN/xkkkQ/v2s+QS
	 WGu7WKegWzVG0RvxPGBVLflyP4G7NVLu1gSGOa83ko5Y4FtfVmJi4GiEqPxm6EeDZz
	 Jd2WsNAmR4F5+NQ6RHovpfi8sd+JfzeD1a8S43XE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250416051213epcas5p23c5d1557f05dbeb64502608569838a6e~2tHgoTyKp2406024060epcas5p2d;
	Wed, 16 Apr 2025 05:12:13 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zcpzw4R8Vz6B9m6; Wed, 16 Apr
	2025 05:12:12 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7C.B2.09853.C2C3FF76; Wed, 16 Apr 2025 14:12:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250415182307epcas5p4853044d013dbc943a8e54dca0f2a39c2~2kQwmVSOH2250122501epcas5p4M;
	Tue, 15 Apr 2025 18:23:07 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250415182306epsmtrp259a11fde6be21a409cc0b89808187745~2kQwh3gXP0804808048epsmtrp2Y;
	Tue, 15 Apr 2025 18:23:06 +0000 (GMT)
X-AuditID: b6c32a4a-03cdf7000000267d-2b-67ff3c2ca495
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8B.98.08805.A04AEF76; Wed, 16 Apr 2025 03:23:06 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
	[107.99.41.245]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250415182305epsmtip106aa6f26d8fc4664d70ea47fb308391e~2kQvaYugy3219632196epsmtip1R;
	Tue, 15 Apr 2025 18:23:05 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton
	<akpm@linux-foundation.org>
Cc: axboe@kernel.dk, gost.dev@samsung.com, nitheshshetty@gmail.com, Nitesh
	Shetty <nj.shetty@samsung.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] iov_iter: Use iov_offset for length calculation in
 iov_iter_aligned_bvec
Date: Tue, 15 Apr 2025 23:44:19 +0530
Message-Id: <20250415181419.16305-1-nj.shetty@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGKsWRmVeSWpSXmKPExsWy7bCmpq6Ozf90gyn/lSzmrF/DZrH6bj+b
	xc0DO5ksLu+aw2ax40kjo8W23/OZLc7/Pc7qwO6xc9Zddo/LZ0s9Tsz4zeLRt2UVo8fnTXIe
	m568ZQpgi8q2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXL
	zAE6RUmhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYFKgV5yYW1yal66Xl1piZWhg
	YGQKVJiQnXHo4jKmgg+sFT+frGRrYLzH0sXIySEhYCLx4Pk31i5GLg4hgd2MEk/PHmSBcD4x
	Stz9dQcq841RYsPO/4wwLY+eN7NDJPYySqzasJ4JJCEk0Mok8XGeShcjBwebgLbE6f8cIGER
	gUiJvQebmUDqmQU6GSXal/aBDRIWiJb4vXUOmM0ioCrRPx9kGwcHr4CVxI9nKhC75CVWbzjA
	DNIrIbCJXeLExZOsEAkXiaVzDjBB2MISr45vYYewpSQ+v9vLBmGXS6ycsgLKLpF4/qcXyraX
	aD3Vzwyyi1lAU2L9Ln2IsKzE1FPrwEYyC/BJ9P5+AjWeV2LHPBhbWWLN+gVQYyQlrn1vhLI9
	JD7seggNhliJrZv2sE9glJ2FsGEBI+MqRsnUguLc9NRi0wKjvNRyeDwl5+duYgQnMC2vHYwP
	H3zQO8TIxMF4iFGCg1lJhPec+b90Id6UxMqq1KL8+KLSnNTiQ4ymwCCbyCwlmpwPTKF5JfGG
	JpYGJmZmZiaWxmaGSuK8zTtb0oUE0hNLUrNTUwtSi2D6mDg4pRqYBCI784SrMmTPLpBeUudw
	ivXxkaeVC5zXLJrZN2nPqvwwB9dkdSm/jcc+u2rbhxr9+PKjf6fnEvtJZuvvHv+sWvDuQ61z
	Y+e7O37Lj3Zey15k3tD2T2PNqol/T7NWTBTtWvx3yjJnqwMxPb9nsdz8VKITJbxvwX1Onb2r
	+B3+H5J//OICs/CZWcrdj5amt2jpF3cx2x4xTniqZ7uTs7Ska/WkKxpzH218GSG87Nnfyjs7
	bRes9v23P7QyM3baw69Z947by67SeDQr+oHc3C0/c7IuSkWuCRfRTL176xnjFIkUrzzN9nVJ
	z4SXFj38e0nb/1PxO+87jwJKLnLc2frJxyK4zSQncGfse5bIZqP9z5VYijMSDbWYi4oTAVYW
	b1XpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpiluLIzCtJLcpLzFFi42LZdlhJTpdryb90g5/zDS3mrF/DZrH6bj+b
	xc0DO5ksLu+aw2ax40kjo8W23/OZLc7/Pc7qwO6xc9Zddo/LZ0s9Tsz4zeLRt2UVo8fnTXIe
	m568ZQpgi+KySUnNySxLLdK3S+DKOHRxGVPBB9aKn09WsjUw3mPpYuTkkBAwkXj0vJm9i5GL
	Q0hgN6PEsvZdrBAJSYllf48wQ9jCEiv/PYcqamaSOHr0K1A3BwebgLbE6f8cIDUiApESaw7/
	YgKpYRboZ5Q429DECJIQBkr8Ov0WbBuLgKpE//w7rCC9vAJWEj+eqUDMl5dYveEA8wRGngWM
	DKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYKDSUtrB+OeVR/0DjEycTAeYpTgYFYS
	4T1n/i9diDclsbIqtSg/vqg0J7X4EKM0B4uSOO+3170pQgLpiSWp2ampBalFMFkmDk6pBqbA
	lUlLYtLEKuOX8Zv9ibuSLMDoXOulcGK1eURg/QGVZ9VCc3+6XSjlVhXIzHNOetbSrj734m0L
	gXntdSJe3x1v9K22+P7tVTzPxv/T7X+ujvVdkFkeoHpj/5H7nB4mLFpL125V05mfyZg3pYw1
	a80jxdmH35sklxZycKT75J//2KL5wTuxya+br/FTttoNDuaireH6gTwXTOadjrq32cHxrX+H
	3sc1l/PEdcIn79/weMnClgXvI8zsNQvOiRvy37p7SVJ0Q+HOTf2/V736xSXzQOywgbSL5eIz
	m99xT7b8X8F32Md393erj3U2h+LZ9E9w+vkXXqsrsF+0KFUo9fnZgxxVbPmbtDIehPdrKbEU
	ZyQaajEXFScCAK9gQrWVAgAA
X-CMS-MailID: 20250415182307epcas5p4853044d013dbc943a8e54dca0f2a39c2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250415182307epcas5p4853044d013dbc943a8e54dca0f2a39c2
References: <CGME20250415182307epcas5p4853044d013dbc943a8e54dca0f2a39c2@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

If iov_offset is non-zero, then we need to consider iov_offset in length
calculation, otherwise we might pass smaller IOs such as 512 bytes
with 256 bytes offset.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 lib/iov_iter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 8c7fdb7d8c8f..aa80fb094004 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -820,7 +820,7 @@ static bool iov_iter_aligned_bvec(const struct iov_iter *i, unsigned addr_mask,
 	size_t size = i->count;
 
 	do {
-		size_t len = bvec->bv_len;
+		size_t len = bvec->bv_len - skip;
 
 		if (len > size)
 			len = size;

base-commit: 834a4a689699090a406d1662b03affa8b155d025
-- 
2.43.0

