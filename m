Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BDC1FE478
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108913; cv=none; b=Nl4ZjUDIBq+/12ZB6GRBd/thJrx/oyPzINVeciIEkjyCJL3vGGsfKJ6qpvt6/plzvQOHDCWusYMD1VbbhkQ5Crq/EiB4aCBgHIboEfRipiw47pEH6nlgec8BKCpphL2in77UX5FajxjPcp+GX8YGKNh2Sn1qz71Ax/zxhM1sUIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108913; c=relaxed/simple;
	bh=aQn1IMuNWEzPzCM2QlviwU5M5BXYHAYMr6gHofPyD/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbNzxpNGpOA+zSsqlXS3tJz06gfcxFDxPHb4AuzCOEuWuP+KFoWw+CCQiXIteH3vanZnB4kmQqVuO3iT4AAQQ7clqNlMyjzswVIvPBQjjhp0fmK2vzM48AKhUQjpX4DXQfTUnnGNf3VJ+4/l9SwfIYpWPBTUO76N8KEbHLeYPDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mniHxcTO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mniHxcTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DE1C4CEE8;
	Thu, 27 Mar 2025 20:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108912;
	bh=aQn1IMuNWEzPzCM2QlviwU5M5BXYHAYMr6gHofPyD/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mniHxcTOHD9MJreBwlnXOktb90Qdd3uhJ4x8H9zfARNdsQOUGJ/q4w6UOFsqr95am
	 LUDycNG1YHPAE6WiOzwVpo0bfrOu5+uMG/CGhoWSpqM2uFKmfqPhj6PDpHY7fbFwLT
	 X+swV4UWf4gJEbPNS3r15+oa26y/ESpHjlUK7qyP3HbSPQxEZCFyuUonmp4DHJvtgM
	 aSBIUf2D0DgRf5xpZZ9W8u15aIMmC/VgZOBdtuxxDr2Qz/PGpGnZUOLVq8AHIaredf
	 O+e8OizBkac2hNv8lggxuL6hAevQq15zhmqWPKdGzFRNLyVTGaN93PCBgu7JYCcS6W
	 1wSihEI+3hR4A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 30/41] x86/alternatives: Simplify try_get_tp_array()
Date: Thu, 27 Mar 2025 21:53:43 +0100
Message-ID: <20250327205355.378659-31-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to return a pointer on success - it's always
the same pointer.

Return a bool instead.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 0b11f53d6e6d..244119066672 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2475,15 +2475,14 @@ static struct text_poke_int3_array {
 
 static DEFINE_PER_CPU(atomic_t, int3_refs);
 
-static __always_inline
-struct text_poke_int3_array *try_get_tp_array(void)
+static bool try_get_tp_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
 	if (!raw_atomic_inc_not_zero(refs))
-		return NULL;
+		return false;
 
-	return &tp_array;
+	return true;
 }
 
 static __always_inline void put_tp_array(void)
@@ -2530,9 +2529,9 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	 */
 	smp_rmb();
 
-	desc = try_get_tp_array();
-	if (!desc)
+	if (!try_get_tp_array())
 		return 0;
+	desc = &tp_array;
 
 	WARN_ON_ONCE(desc->vec != tp_array.vec);
 
-- 
2.45.2

