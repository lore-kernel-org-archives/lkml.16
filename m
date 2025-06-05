Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3851F50F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094454; cv=none; b=O/KrRJX16vGjFDJWrE2c+C0wCIMCd+tvinBzjJT31PXgyeUIkTjUhsvUMKhp5t/WgrmxK4ieS9VcNGeq7A4FDohrYpJ1wenKnDu1uFSDLrLRV9OaCpPycHalZrieQbFhtnAIVbBDkyKqhZzzTsQW4VACF2ylVsLg9nhJIFkkcbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094454; c=relaxed/simple;
	bh=lJfZHCjTwiwmpOgV9rG7yOZTKtDaemNLPpm5Me68uUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=EzMMNipekoBmfF3mJ+l8Kx0jfA/Xq7F8x7VwXndrBZA3rqkNG7PM0iwjgWYw1xx+zZ5SLkl7w0+G6TrTzHrBsodG/07OIKt5+q7VtvFy0wLeHTlPdmHmSdh5MAhG/tEjGEZTyZjOpfzQQ3Acu15I0Sgusx6bexUlOgAmxhisPxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TKcMe0SF; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TKcMe0SF"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250605033403epoutp024ddc9c4ec2d24a8130692f9e3a31fe91~GCCExP_jV3203932039epoutp02H
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:34:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250605033403epoutp024ddc9c4ec2d24a8130692f9e3a31fe91~GCCExP_jV3203932039epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749094443;
	bh=hqvoyvvaQ3+MpXNWTvYlgfno/RK24poe88itru5s6bc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=TKcMe0SFBpREpr/XbxPOTNGvGq67x/S7Kwdz90Un6cHBvk35uak9WqvYNnMMKDQ9Z
	 hwbQl21p4X58ljsYaj+aBY68gLmKhKBOUMIbsrpF5zSeRJ19G3ltYz5u1mQbcq47Ob
	 /yjuvkWOSSaS8rPUZ0T7HjuW7foQSmJV4aVHrvKk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250605033402epcas2p3da4aaaca52cd3da2c8ac24cd41d991a4~GCCDWUR9p1118011180epcas2p3Q;
	Thu,  5 Jun 2025 03:34:02 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bCVRZ01d4z6B9m9; Thu,  5 Jun
	2025 03:34:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250605033401epcas2p46651837ba85629a50ed69db9665a52a2~GCCCYKKXZ0772307723epcas2p47;
	Thu,  5 Jun 2025 03:34:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250605033401epsmtip114e46e8514ceb9e025eaa40dcda29f19~GCCCSP5LH2772327723epsmtip1W;
	Thu,  5 Jun 2025 03:34:01 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Hyesoo Yu <hyesoo.yu@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mm: gup: avoid CMA pinning and clean up stale logic 
Date: Thu,  5 Jun 2025 12:32:05 +0900
Message-ID: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250605033401epcas2p46651837ba85629a50ed69db9665a52a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605033401epcas2p46651837ba85629a50ed69db9665a52a2
References: <CGME20250605033401epcas2p46651837ba85629a50ed69db9665a52a2@epcas2p4.samsung.com>

This patch series addresses an issue where longterm GUP requests
could inadvertently pin unpinnable pages (such as CMA) when no
migratable folios are found. This regression was introduced by
commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked").

The first patch removes stale codes and unnecessary logic left.

The second patch fixes the logic to return -EAGAIN when unpinnable
pages are detected but no folios could be collected, allowing
migration to be retried rather than pinning the page.

Hyesoo Yu (2):
  mm: gup: clean up stale logic in migrate_longterm_unpinnable_folio()
  mm: gup: avoid CMA page pinning by retrying migration if no migratable
    page

 mm/gup.c | 58 +++++++++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

-- 
2.49.0

