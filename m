Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37BB2517B8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745748307; cv=none; b=uyLLgnc3NLKYZVbscKBL/2DRywC3QSo5aSHcEkdrWbfJsBbf6aw66O4iDWgO4p+g2mSQnN2pou5cpNkzAjReiGo4Zh468RfngiQ/+UPJ9wOafuo2Fbw3G9WZ9CQnPqbryUTjuTCxAJIMXazVpdgAt1X5GmlLN8Tua7tkAjA9pVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745748307; c=relaxed/simple;
	bh=ljEY+bxunLMA8SJBNpd9fExsjEpK7FDnRqpECM4hgXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bp0P9Xi2Za8R4nWDfjQ2+Jf0wOGLL/sXOqg4XomG8MoYOx5oBexi6OsRVVlRuEZv01LglV8YB7bCP8RzIENQN2+Hrdp0IZsTNJFndQzqLqd4j+9yJdEaiuRt5Zq0lxOIBt/9rwznMKvu/tXa7pL0Z0Ikk+ewZscRI86VBtz7mnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZmqKWeE8; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZmqKWeE8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745748300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsxLrijwsdqk8P5G6bYDVUq36qmeIQy/hfJ4ADbTjxc=;
	b=ZmqKWeE8OudYZ5p9qrIgipYIvk7iwNTk/A/H7mQF4eVBqxTzSr2F4vhBj4LN4UjHMNAXG5
	lCoVsUJRHtsl5k2rNujBS52tYzykC0xmzwB8QFgdaOfOFIy5OJ+t53xzd4EPTqQKbHHZ1K
	CvH37RClbzMLNHxilh3iS08TUhuRIpk=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rppt@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	david@redhat.com,
	harry.yoo@oracle.com,
	riel@surriel.com,
	vbabka@suse.cz,
	liuye@kylinos.cn,
	ye.liu@linux.dev
Subject: [PATCH 3/3] mm/numa: remove unnecessary local variable in alloc_node_data()
Date: Sun, 27 Apr 2025 18:04:42 +0800
Message-Id: <20250427100442.958352-4-ye.liu@linux.dev>
In-Reply-To: <20250427100442.958352-1-ye.liu@linux.dev>
References: <20250427100442.958352-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

The temporary local variable 'nd' is redundant. Directly assign the
virtual address to node_data[nid] to simplify the code.

No functional change.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/numa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/numa.c b/mm/numa.c
index f1787d7713a6..7d5e06fe5bd4 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -13,7 +13,6 @@ void __init alloc_node_data(int nid)
 {
 	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);
 	u64 nd_pa;
-	void *nd;
 	int tnid;
 
 	/* Allocate node data.  Try node-local memory and then any node. */
@@ -21,7 +20,6 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
-	nd = __va(nd_pa);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
@@ -30,7 +28,7 @@ void __init alloc_node_data(int nid)
 	if (tnid != nid)
 		pr_info("    NODE_DATA(%d) on node %d\n", nid, tnid);
 
-	node_data[nid] = nd;
+	node_data[nid] = __va(nd_pa);
 	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
 }
 
-- 
2.25.1

