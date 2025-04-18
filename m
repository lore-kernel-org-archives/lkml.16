Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBB26F440
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962762; cv=none; b=KppdY09UyIZMYLC3L2n5rX+ZLWLAMMSx11g9GlDt1lWFQRzHCWg1HePb2bwj8knOI3Ud2tdvltp29Ze9rsfiDZloeWHPrJIPWPc9wAnuBnOU6AHCoA5v27VjDgQAc8AtCfPHHx5C/2Hqvd3gcD6JURmBzqTxAdrU6zK636R6vrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962762; c=relaxed/simple;
	bh=LBaE/F1QcvD/Lvg9TxgK6v66T01sy1BB7QvxlMpl+eU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rrv3+i055YJxud3u9YRhMkVfv+bluLHw7d/1qNb/hk5FF17UGcieMJkO7W6BKbnZSJ2I1PICCk/1/1PPlyrtqlzNT8JEtZedUF7C/GEJHGtGELyS0Paz3KJIg6+8Zkj70tCxY280ATzDB3X4yYxAXZVr/MSd+k1D99xfVuRJag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b7/nnHZn; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b7/nnHZn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744962757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfNHyiDXaAMkKJ+cGlnyxg4krHqlNBlOgidwEUdtskI=;
	b=b7/nnHZnclVg19ysg8Nipk7mI3Dp+HjYg3vRA6vsim5CIgnseKXebJaEIpxWaY4n0930wX
	GDOn9Pn1bjFYUYeTA36963vnoeK1r+hPAbO1TLk5jyhwJkFrbsyneOEJFqwrvY8MOpYnQd
	yW9TPKizdK/bSXv+e8B0k2dGaldeIF8=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH 3/3] mm/memory-failure: inline add_to_kill_anon_file() logic at call sites
Date: Fri, 18 Apr 2025 15:52:26 +0800
Message-Id: <20250418075226.695014-4-ye.liu@linux.dev>
In-Reply-To: <20250418075226.695014-1-ye.liu@linux.dev>
References: <20250418075226.695014-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

The add_to_kill_anon_file() helper function only checked for -EFAULT
return values before calling __add_to_kill(). Removes the unnecessary
wrapper and moves the addr == -EFAULT checks directly into
collect_procs_anon() and collect_procs_file().

This ensures that error handling is performed close to where the address
is derived (via page_mapped_in_vma() or page_address_in_vma()), rather
than being obscured inside a helper function.

No functional changes are introduced.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/memory-failure.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index b91a33fb6c69..ec0041c95b27 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -486,15 +486,6 @@ static void __add_to_kill(struct task_struct *tsk, const struct page *p,
 	list_add_tail(&tk->nd, to_kill);
 }
 
-static void add_to_kill_anon_file(struct task_struct *tsk, const struct page *p,
-		struct vm_area_struct *vma, struct list_head *to_kill,
-		unsigned long addr)
-{
-	if (addr == -EFAULT)
-		return;
-	__add_to_kill(tsk, p, vma, to_kill, addr);
-}
-
 #ifdef CONFIG_KSM
 static bool task_in_to_kill_list(struct list_head *to_kill,
 				 struct task_struct *tsk)
@@ -634,7 +625,8 @@ static void collect_procs_anon(const struct folio *folio,
 			if (vma->vm_mm != t->mm)
 				continue;
 			addr = page_mapped_in_vma(page, vma);
-			add_to_kill_anon_file(t, page, vma, to_kill, addr);
+			if (addr != -EFAULT)
+				__add_to_kill(t, page, vma, to_kill, addr);
 		}
 	}
 	rcu_read_unlock();
@@ -674,7 +666,8 @@ static void collect_procs_file(const struct folio *folio,
 			if (vma->vm_mm != t->mm)
 				continue;
 			addr = page_address_in_vma(folio, page, vma);
-			add_to_kill_anon_file(t, page, vma, to_kill, addr);
+			if (addr != -EFAULT)
+				__add_to_kill(t, page, vma, to_kill, addr);
 		}
 	}
 	rcu_read_unlock();
-- 
2.25.1

