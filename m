Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF2B293B4C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363072; cv=none; b=RNWfkQoahH52QngyRVHzpoZ9PlJfhlqm/9ANbM/r+dnafcMKUXZZv+3u6cewmKZfxIW6N0VQX+/1gj5O/MTk+/KqYYQSnV5zyF5pzEzJxzE02KPvF77libSICqDRx06EEbZdx81EbZNsmOH7vdFffYEPTy0C0xyPUUT9eLK0mIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363072; c=relaxed/simple;
	bh=/G8IG1xZPxtDHV7DySv4e/zsqlpmhImnBbQtUfTIgE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nmdzl7ZTB06By8E8+RbzWcJaYH2skAEV+Hn97V1wn0UKqbwnKFMHg22tRKxj730G6yGOa2URkQqa+7dTXY2WiOTAihrk5lJaYZLezzzqVa+QEPeA2l+yJNQVs+IZNjPf1bqE73eGRRIZI54o9TinBZtnNquJsWivLT0TES4bIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44125106F;
	Fri, 11 Apr 2025 02:17:50 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0DF23F6A8;
	Fri, 11 Apr 2025 02:17:46 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH v4 13/18] mm: Map page tables with privileged pkey
Date: Fri, 11 Apr 2025 10:16:26 +0100
Message-ID: <20250411091631.954228-14-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411091631.954228-1-kevin.brodsky@arm.com>
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_KPKEYS_HARDENED_PGTABLES is enabled, map allocated page
table pages using a privileged pkey (KPKEYS_PKEY_PGTABLES), so that
page tables can only be written under guard(kpkeys_hardened_pgtables).

This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
(default).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 43e35d41b850..411707dabe65 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -33,6 +33,7 @@
 #include <linux/slab.h>
 #include <linux/cacheinfo.h>
 #include <linux/rcuwait.h>
+#include <linux/kpkeys.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -3083,6 +3084,8 @@ static inline bool __pagetable_ctor(struct ptdesc *ptdesc)
 
 	__folio_set_pgtable(folio);
 	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	if (kpkeys_protect_pgtable_memory(folio))
+		return false;
 	return true;
 }
 
@@ -3093,6 +3096,7 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	ptlock_free(ptdesc);
 	__folio_clear_pgtable(folio);
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
+	kpkeys_unprotect_pgtable_memory(folio);
 }
 
 static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
-- 
2.47.0

