Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449127F4E4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350176; cv=none; b=lp5IgBNBVqKecl0gEoj34US3r+QRe0HfSKFkQYUGHyOeTYIMsdusOcyk+K0UC3QWvV+7bavXWYP0bpUcMQkWBzgScsC42OJmh0JLksXQmpeoT7MnD8XdWsb75xsiRl5eaaLa4RSVm9lHwC9kqdHiVfSQvFIsD31kXjh/BEJRHc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350176; c=relaxed/simple;
	bh=6zdgSV9K8OdJ8/4BsSMe+UCengCTWOkuOFeCX5WC8VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQXGFSZBWcX+Pl/CEESQkUrSjDoOF8R2AJcKIOt9EnfSJ4gLUImtFy5RovH0+62HNOQJ2ubWeqi20OFdPIJJd7x4g7kf/s/Uv3WgFdHX8q2lIxwuVKLqfLy0Kk6TT55NLmJ63z62pcEcoFA+hqGG1adnNDfO74DEBmEm9185hqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzISamqg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzISamqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D76C4CEE9;
	Fri, 11 Apr 2025 05:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350174;
	bh=6zdgSV9K8OdJ8/4BsSMe+UCengCTWOkuOFeCX5WC8VU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PzISamqgxRCstxoLN0GELLHQzkrYfaviJmMg7Zhn7Ej320+fJ+KHzYCA4qhImhNHG
	 yOFvhWr2+RIrXeiI2AKs/OOXiYnabjnErPtGAwWURsp4u1OEjZSumpSHgr56YIsMgz
	 cio4BPjltomfR0rpqnwnP1AyWLAvqNdalaHkpkDup1eUgAEXIhACZWJIedW8zU4fyg
	 ZgKWQlQj8UINj4TRuS4nufhdlzHms9ofRWMgqKSP9mhY641coLDop0miEPQbyHJxU5
	 PpBth1W1ZN8SefN/BtdKLmn0ZWnwrUYxDaIXjJgE6zXlh3QChtLt3RvELjbigTti7U
	 zYccJFqYLCiWQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 43/53] x86/alternatives: Simplify and clean up patch_cmp()
Date: Fri, 11 Apr 2025 07:40:55 +0200
Message-ID: <20250411054105.2341982-44-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- No need to cast over to 'struct smp_text_poke_loc *', void * is just fine
  for a binary search,

- Use the canonical (a, b) input parameter nomenclature of cmp_func_t
  functions and rename the input parameters from (tp, elt) to
  (tpl_a, tpl_b).

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 14ca17dc36e8..f278655f0950 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2498,13 +2498,11 @@ static __always_inline void *text_poke_addr(const struct smp_text_poke_loc *tp)
 	return _stext + tp->rel_addr;
 }
 
-static __always_inline int patch_cmp(const void *key, const void *elt)
+static __always_inline int patch_cmp(const void *tpl_a, const void *tpl_b)
 {
-	struct smp_text_poke_loc *tp = (struct smp_text_poke_loc *) elt;
-
-	if (key < text_poke_addr(tp))
+	if (tpl_a < text_poke_addr(tpl_b))
 		return -1;
-	if (key > text_poke_addr(tp))
+	if (tpl_a > text_poke_addr(tpl_b))
 		return 1;
 	return 0;
 }
-- 
2.45.2

