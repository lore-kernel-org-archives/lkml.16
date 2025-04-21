Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5CD2110
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225863; cv=none; b=jwXME8//B2ATIYcFHiQLbGwcnDU8Xf0NqxMl/E43Lqn+wSiaXLXXNvjWFXsQ6+oyBIiN6l4oYF4ad2L+dtbWMFBN4hSX8Wqe5G3wTH0pd7kCYs8/4XtmXeB/bJOzUihEy+XguRbveyl2IRtC/ks5VuOQ2xiqlE4+KmNkl0JtCuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225863; c=relaxed/simple;
	bh=ZI4lBWosvSlhzsUQXidgv4371UTy/mQQ4nfBPMzvL0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tyIBu0U13Tz6cIZsAZvgTbffK4Ae1qoN7ODfTPjbJO+NQDvP2f/yACEgHDHJPThexigCklH1w61egTqlcTgabM4y8+kM6riUtF11+el8OXXI65Bbb84zoo9F5Xl3GYgS/OxQBJP8GK1xfsxxqUu+lbx32zB1HuBx3tS255VOxHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xcg1b5lv; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xcg1b5lv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745225857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N5odKrkhnQNC/y9CXmBltCu2so23pLsN3BbjxBaHBvo=;
	b=Xcg1b5lvKfh+10Ltbo82q2HrkHEpGFNiKXXXebRF/hZKQK/KHFX1TAFiIdxmqpt91lUz2H
	hb1L4Rz1im3kODgQUh5mPFPY48VVG1qsPXb93Y/uhqjED8qVUDhenylpDmiVul4sT6Vreh
	lJOXj+XukBjJDT4bbf0EU6m3bwT4Ejc=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org,
	nao.horiguchi@gmail.com,
	linmiaohe@huawei.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	david@redhat.com,
	harry.yoo@oracle.com,
	riel@surriel.com,
	vbabka@suse.cz,
	liuye@kylinos.cn,
	ye.liu@linux.dev
Subject: [PATCH v3 0/2] mm: minor cleanups in rmap
Date: Mon, 21 Apr 2025 16:57:27 +0800
Message-Id: <20250421085729.127845-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Minor cleanups in mm/rmap.c:

- Rename a local variable for consistency
- Fix a typo in a comment

No functional changes.

Changes in v3:
- Rename variable from page_anon_vma to anon_vma.
- Link to v2: https://lore.kernel.org/all/20250418095600.721989-1-ye.liu@linux.dev/

Changes in v2:
- Dropped the "mm/memory-failure" patch.
- Kept only the uncontroversial rmap cleanups.
- Link to v1: https://lore.kernel.org/all/20250418075226.695014-1-ye.liu@linux.dev/

Ye Liu (2):
  mm/rmap: rename page__anon_vma to anon_vma for consistency
  mm/rmap: fix typo in comment in page_address_in_vma

 mm/rmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1

