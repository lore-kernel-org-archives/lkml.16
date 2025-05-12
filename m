Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E5252288
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027300; cv=none; b=lM2h8TNt1J5BdrjiBODJQmMABNDDOioOWN2v2wJY9qyU/NlOMqt5equCBm1dJiAwBQEymIen/lrPZyQfISsbJGZP/MLCiS/H0syPaA/jW1SX5smai+4Rsb/Vx8gB51HXFajp4XlpphTAKrheFvCvC2JG6v2hQzZS+Icg18YyHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027300; c=relaxed/simple;
	bh=uWIwm27Xx6h9k+ZFZ43drH0mCUZ5SmQfh8mZjJSshm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=gjRCa7g86Njkeo5ebNDYycCtyewQGTPY2plUkjmE9Ix9d4GS+db90axj2kd2IwMGD410WefOM68Jsp/Jzy1ZqBHCZbbQUcwAnxCExpwRtS0LYJ8qi2tgJe3hoTRpFW9LdPVMj/uvP8q4QXVrxDgMvmgs1+GmlbLUQ6V+z6aDBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lyk/WSUR; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lyk/WSUR"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250512052134epoutp03f8ec1d7de367ba7ac8872faf8ff96b66~_sBGLH6rR2098020980epoutp03g
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:21:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250512052134epoutp03f8ec1d7de367ba7ac8872faf8ff96b66~_sBGLH6rR2098020980epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747027294;
	bh=zQ+bqpfD75ldKum9gz+YRfmll4JEtTfolJjIbmeko4w=;
	h=From:To:Cc:Subject:Date:References:From;
	b=lyk/WSUR1mowbDSK/3KSXYF2T4/ExRyPiTFYLL/xvi0r4tUOXPmzsukzWo2MF5C+f
	 d6ZUiszYzdkexBLgbU1OFTxGbMzSpwCcqFlSFUFSN0dxUd96HJBPBlNZrr2knuymZx
	 mZPQDBDu/lNeTs/q2YhBfGMlL2AXHOegq2jMYLYg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250512052134epcas5p3e63f97efc15347ace87e9948ad4b98f5~_sBF3YimM0094000940epcas5p3t;
	Mon, 12 May 2025 05:21:34 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.174]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zwnyj0K1Sz3hhTB; Mon, 12 May
	2025 05:21:33 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250512052032epcas5p46bb23adcb4a467aa7f66b82d3548b124~_sAMTT5p82311423114epcas5p4a;
	Mon, 12 May 2025 05:20:32 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250512052032epsmtrp2838fa1980d2e36da6e1ab489ae60a16d~_sAMSnkss2784527845epsmtrp2w;
	Mon, 12 May 2025 05:20:32 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-07-682185209b86
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	14.D9.19478.02581286; Mon, 12 May 2025 14:20:32 +0900 (KST)
Received: from testpc11818.samsungds.net (unknown [109.105.118.18]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250512052031epsmtip2da7f230191d0ec969ea4c1333f2301ea~_sALgxSTq2067820678epsmtip2Z;
	Mon, 12 May 2025 05:20:31 +0000 (GMT)
From: hexue <xue01.he@samsung.com>
To: axboe@kernel.dk, asml.silence@gmail.com, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: hexue <xue01.he@samsung.com>
Subject: [PATCH] io_uring/uring_cmd: fix hybrid polling initialization issue
Date: Mon, 12 May 2025 13:20:25 +0800
Message-ID: <20250512052025.293031-1-xue01.he@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWy7bCSvK5Cq2KGwev3ahZzVm1jtFh9t5/N
	4l3rORaLX913GS0u75rDZnF2wgdWi64Lp9gc2D12zrrL7nH5bKlH35ZVjB6fN8kFsERx2aSk
	5mSWpRbp2yVwZaxsvMxesIW9Yt6qPrYGxi62LkZODgkBE4nJZ3+ydjFycQgJbGeUmLztLlRC
	QmLHoz+sELawxMp/z9khir4xSny7u5kZJMEmoCSxf8sHRhBbRCBT4vy7mWA2s4CCxOfT/8Ga
	hQV8JOb2dbGD2CwCqhLbX3aDxXkFrCQu3trDArFAXmLxjuXMEHFBiZMzn7BAzJGXaN46m3kC
	I98sJKlZSFILGJlWMYqmFhTnpucmFxjqFSfmFpfmpesl5+duYgSHpFbQDsZl6//qHWJk4mA8
	xCjBwawkwjuVQT5DiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJ
	g1Oqganf0Xvq6kp72Xt1+7ZYXf53W07NKMs+bO2qnqaXdbtNllfu2t76ZJlCYOhz8wy3Cy1a
	6XPSU9gON3Ms3vxE/s2ig++uHFs47fSx67OnnWspX3PpvMbFuy7vtWwDHj+dlHp1zgk3tQMb
	da/9Zp9wJf4xQ0ZHzcQMm5/HdtRc9txy/+jWLZsUZmzY/ksqOfnPKzbVNrHNre/6pvZZ5S0P
	KHn89m/aezNn/YeRKVZa3h7JZQkS5lszf8zt0hK/ke2cfXKOworo7XpzJoZxfxZgvTqz9ceW
	2UrzK1/v92vekVDIuUjlSMrhGSGL30170NLSz7ysaZW3v+fMWyJ8swV7BRUqkzqjUywdJ3ey
	5taxr+5XYinOSDTUYi4qTgQA/K5KILgCAAA=
X-CMS-MailID: 20250512052032epcas5p46bb23adcb4a467aa7f66b82d3548b124
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-505,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250512052032epcas5p46bb23adcb4a467aa7f66b82d3548b124
References: <CGME20250512052032epcas5p46bb23adcb4a467aa7f66b82d3548b124@epcas5p4.samsung.com>

Modify the defect that the timer is not initialized during IO transfer
when passthrough is used with hybrid polling to ensure that the program
can run normally.

Fixes: 01ee194d1aba ("io_uring: add support for hybrid IOPOLL")
Signed-off-by: hexue <xue01.he@samsung.com>
---
 io_uring/uring_cmd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index a9ea7d29cdd9..430ed620ddfe 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -254,6 +254,11 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
 			return -EOPNOTSUPP;
 		issue_flags |= IO_URING_F_IOPOLL;
 		req->iopoll_completed = 0;
+		if (ctx->flags & IORING_SETUP_HYBRID_IOPOLL) {
+			/* make sure every req only blocks once */
+			req->flags &= ~REQ_F_IOPOLL_STATE;
+			req->iopoll_start = ktime_get_ns();
+		}
 	}
 
 	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
-- 
2.43.0

