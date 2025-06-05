Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE46C204090
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110794; cv=none; b=sujXVGrlv1rIMd0FcnpUvVXaq5nBgBxLKncYXhNFEW8EKqLFGU9emfRwElGeIhOTiFYEeRZWy9xbSTv4RJQ5Ckx1z97cQyKNvhd9nPWaQ5iqop6mG9/sG4COdrH4LugQXB+pkt+S2e6AZE+uU+8Lkstcuv6gDngvDm4EF/GH+i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110794; c=relaxed/simple;
	bh=mV7CMmKMk2TdQpYUxPGiEFsEtLtGCRM8Cq9BYpwksRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Z8jtz1mcHW5WHolnO2h2fwISOMcFrVzAhrYy4POfReCfvfyHwattIgLJDbaZJJmUx/SuCSi4tknePt4SU8frPk6cQ/H58yQdXLKzTB8fFzTvB+Q4Nn8tIdqy2CZ61RkHOfg+xMSi5BZogrDcP5Azw9t3zY4mz6DpstP4yU3WFCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=b1Y+xyGb; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="b1Y+xyGb"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250605080629epoutp032a6eba74f095edba2d9f416be48ac461~GFv7zK-PT0547405474epoutp03C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:06:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250605080629epoutp032a6eba74f095edba2d9f416be48ac461~GFv7zK-PT0547405474epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749110789;
	bh=rP3UP61mxoFrLO8WD9zcBlebR6Levrvot/u712wS9wc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=b1Y+xyGb/kYQ3EUJWUZgMr24/3TXSK09LF1TzQ4nQoxg1kiRYsZRh1QRsjCvsslTI
	 bfVLwbHK4kEgMNl5EsrZRFFjxLleEyxwsb6ZRczDIE16VT1kPoXNRe91Tc2hmn81ll
	 7n0N1rGcpZsJHUET5I6vIZ76/34zRUDtm96DBYpA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250605080627epcas2p4292d73f92ba1bf4f5bb61efa4c9b5d82~GFv51Bvln3167431674epcas2p4d;
	Thu,  5 Jun 2025 08:06:27 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bCcTv0wNqz2SSKd; Thu,  5 Jun
	2025 08:06:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250605080626epcas2p16a1005b2d8992296144759d0e4b91cb8~GFv49Xy8x0571205712epcas2p1B;
	Thu,  5 Jun 2025 08:06:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250605080626epsmtip10a426d4c9d92923bb9f3a83881fb4ed4~GFv43UWAQ0467304673epsmtip1_;
	Thu,  5 Jun 2025 08:06:26 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Hyesoo Yu <hyesoo.yu@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] mm: gup: avoid CMA page pinning by retrying
 migration
Date: Thu,  5 Jun 2025 17:04:30 +0900
Message-ID: <20250605080436.3764686-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250605080626epcas2p16a1005b2d8992296144759d0e4b91cb8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605080626epcas2p16a1005b2d8992296144759d0e4b91cb8
References: <CGME20250605080626epcas2p16a1005b2d8992296144759d0e4b91cb8@epcas2p1.samsung.com>

This patch addresses an issue where longterm GUP requests
could inadvertently pin unpinnable pages (such as CMA) when no
migratable folios are found. This regression was introduced by
commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked").

This patch fixes the logic to return -EAGAIN when unpinnable
pages are detected but no folios could be collected, allowing
migration to be retried instead of incorrectly pinning the page.

This v3 drops the cleanup patch included in v2,
per Andrew Morton's request. It now contains only the regression fix.
The cleanup changes will be proposed separately for the 6.17-rc1.

Hyesoo Yu (1):
  mm: gup: avoid CMA page pinning by retrying migration if no migratable
    page

 mm/gup.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

-- 
2.49.0

