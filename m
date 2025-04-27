Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218E12512ED
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745748301; cv=none; b=BQIiiQR/K2N6jvzcnrWShvSoZ6tG1VPcMjo/TWvtZvcC3FFs2gMutb++klSxv64pdc5AI8w5unh6dyy/aF+p5uWTpAaVopblfeAW5NXBXmrDVRfwci8ZcsS9TxQWevFWtNJ/wqExJeb/lEDkFn715IDlqAP4tdPictWzLD0QHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745748301; c=relaxed/simple;
	bh=lL7p8RT66GHHZlIHqFx0KN/mJgxQUJS29/Uta+I56Y4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hn6YlTrwr73tGAIFLDeaxmlE5spmTL3gJ1xEf2hXclg33kbeEKDTAz1lFb7x6fa8hnD5tB9dqB6AlunDCtjmHeCULgxQgCxsBb7CAuA3RALbdpkrYAXpfN6thyamBsnQ/UhEfyZZ+lXomde6/qpSYdNJiSqZ9/f4sDDvqGF2/8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WjpksMWS; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WjpksMWS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745748296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XKKLGxZU8OZ2xGEdKDaDexux1b0MqIrEZ+95uLGz+D4=;
	b=WjpksMWSRMcE8F8KxbqeV1cjbX+wDqK4BuuChXc4mi7qsHRsc/1iSo9Q/yCcEh268rwn4j
	pDWluFmC9NpuQd0lvXyo5a6nozSR8s4D02IkiIv9TExrWI4lNyRen8Rjiv1/JQTMUL3JmT
	Kf/5gN5EHDdrxrFh6RQVhStNNkOO3ZQ=
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
Subject: [PATCH 2/3] mm/debug_page_alloc: improve error message for invalid guardpage minorder
Date: Sun, 27 Apr 2025 18:04:41 +0800
Message-Id: <20250427100442.958352-3-ye.liu@linux.dev>
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

When an invalid debug_guardpage_minorder value is provided, include the
user input in the error message. This helps users and developers diagnose
configuration issues more easily.

No functional change.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/debug_page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/debug_page_alloc.c b/mm/debug_page_alloc.c
index d46acf989dde..6a26eca546c3 100644
--- a/mm/debug_page_alloc.c
+++ b/mm/debug_page_alloc.c
@@ -23,7 +23,7 @@ static int __init debug_guardpage_minorder_setup(char *buf)
 	unsigned long res;
 
 	if (kstrtoul(buf, 10, &res) < 0 ||  res > MAX_PAGE_ORDER / 2) {
-		pr_err("Bad debug_guardpage_minorder value\n");
+		pr_err("Bad debug_guardpage_minorder value: %s\n", buf);
 		return 0;
 	}
 	_debug_guardpage_minorder = res;
-- 
2.25.1

