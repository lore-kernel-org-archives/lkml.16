Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C6127A126
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513292; cv=none; b=rgU59ZvXRxptogwcFr2Prv9eSKwTIHdUBYauOoQF7lK8qk8qRnhFlqh5GT5ii+Wdamxzl1fD6LOcIo9pW3y3rUOUPL5tXA7+2erHO6zHBdN84ynxjzr3GNbboOmLMhOhU7hYAYNCB4V3XuQADjAs4J/5J/uYcyYayR0SvZCe2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513292; c=relaxed/simple;
	bh=ySwKksoJVylHv17+76jDGSBW5NovddheXIa8c/3FWGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oat6pmO3TGtRJd7ZDJiLsezy2zfvylu0GdAsTUibvm+YsMsew5nlX+5c05NNR3znY5GNfQ6Us+Oj0AF9DAnQ2uBiSoWLTWeeaV6sr6i6IJnMsiPiYArLUFSTfj3sGro7dGOKgKW4Zd04jR9VtOik7Y6ZFQZz1OmC8BK6zLJeeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POHImNsL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POHImNsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745513290; x=1777049290;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ySwKksoJVylHv17+76jDGSBW5NovddheXIa8c/3FWGc=;
  b=POHImNsLrQssdm2bjdASlda8hS1oV8buGi4M4vPq4Cj2yTHBBd9rW1C1
   vsUaEc+Wv17TghpsDpCQSWvga+XJ3/iHs7KpFaVaQPF4gRXzYR/D8Rh94
   +LKb3yazNq3ENFMWq+AQwkP1dgPICnK4yxln+//Py/pvod0v5idb+J32O
   pxHPlYHzrSc1bBt/qOn5h2H2q5/FB7z/bI8lTkLGgT81DFRqhJb5zz1LF
   QydKE24mIVY04Dojg7F1l1PLyvBAr3g6MKc226oqH+4Z2J96RGaLFbKG9
   9fmuCRE03UBgfztnVAsdQbTvWU8n2FQ5GRf2Zx5AUhnLc7d6w0wNgR6F/
   g==;
X-CSE-ConnectionGUID: udOCCI9FSqqFp0VOR8r0JQ==
X-CSE-MsgGUID: P5GUYVgxTNCwl7HPRe7CRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="49816908"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="49816908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 09:48:09 -0700
X-CSE-ConnectionGUID: rQ1ocbUzQhuWSA1zOhprqw==
X-CSE-MsgGUID: sO9y2MC2RBmDNooNgnf5Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132661087"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2025 09:48:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D4F221AC; Thu, 24 Apr 2025 19:48:04 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mm, slab: fold need_slab_obj_ext() into its only user
Date: Thu, 24 Apr 2025 19:48:00 +0300
Message-ID: <20250424164800.2658961-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

need_slab_obj_ext() is used only in one place, fold it into there.
Without that, clang can't build kernel with `make W=1` when
CONFIG_WERROR=y, which is default in the x86 configurations.

mm/slub.c:2079:20: error: unused function 'need_slab_obj_ext' [-Werror,-Wunused-function]

To solve this, fold need_slab_obj_ext() into its only user.

Fixes: e33b7ae3d802 ("mm, slab: clean up slab->obj_exts always")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 mm/slub.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 966785362a62..50e9730828a6 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2048,18 +2048,6 @@ static inline void free_slab_obj_exts(struct slab *slab)
 	slab->obj_exts = 0;
 }
 
-static inline bool need_slab_obj_ext(void)
-{
-	if (mem_alloc_profiling_enabled())
-		return true;
-
-	/*
-	 * CONFIG_MEMCG creates vector of obj_cgroup objects conditionally
-	 * inside memcg_slab_post_alloc_hook. No other users for now.
-	 */
-	return false;
-}
-
 #else /* CONFIG_SLAB_OBJ_EXT */
 
 static inline void init_slab_obj_exts(struct slab *slab)
@@ -2076,11 +2064,6 @@ static inline void free_slab_obj_exts(struct slab *slab)
 {
 }
 
-static inline bool need_slab_obj_ext(void)
-{
-	return false;
-}
-
 #endif /* CONFIG_SLAB_OBJ_EXT */
 
 #ifdef CONFIG_MEM_ALLOC_PROFILING
@@ -2128,7 +2111,11 @@ __alloc_tagging_slab_alloc_hook(struct kmem_cache *s, void *object, gfp_t flags)
 static inline void
 alloc_tagging_slab_alloc_hook(struct kmem_cache *s, void *object, gfp_t flags)
 {
-	if (need_slab_obj_ext())
+	/*
+	 * CONFIG_MEMCG creates vector of obj_cgroup objects conditionally
+	 * inside memcg_slab_post_alloc_hook(). No other users for now.
+	 */
+	if (mem_alloc_profiling_enabled())
 		__alloc_tagging_slab_alloc_hook(s, object, flags);
 }
 
-- 
2.47.2

