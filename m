Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2CC23814A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587175; cv=none; b=LrZmv+ym8T4zofXRgmjgswwXx8w/8iziqvr5Qd4o+9qLhSIOM0GIEDqUcKutgCYRt3MIL0ZZs3AEi3aSEhdf/vjNmENqmI/dxvPxF3F1rE9W/DXLeR5p0SB5mJwWGGQaGbgNkCZlAjmbYf+PLt3BIxQUkIYWW/P3eneGXEY2iog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587175; c=relaxed/simple;
	bh=UM46Z3LywVA8SgF6vCR4JHx+WH4GLGG/jRvAXsdQuKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXDQCwQMORqJcwkyXUCeokhAqfw1LF45g4Vk784ObB6EKEdf8symQVB2h49Hm66jUX4NAga63/vQw51omrT7jgahSTpIt+DoTjs3Ghb3Add4R8H0OCsFg9XB910EDNgZ3C6tqbmtpi/IV0FKelZheApv+KHCrtWqHBiW2EQE4+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kB7v57eZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kB7v57eZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207D6C4CEE8;
	Wed,  2 Apr 2025 09:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587175;
	bh=UM46Z3LywVA8SgF6vCR4JHx+WH4GLGG/jRvAXsdQuKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kB7v57eZ5YAJXipGlLqcskI5To4WGavXLSdxv96UgnMcU78H3tEM3ydAAfwNhJq17
	 eTaoRKwA5V7PAli6MdHnXcLIAf8RAic6cnFc1FafsIhCc3Qoliy45sy0ETxmcgAyhB
	 J0rJrhFmHIPInDk1IOt6sQcHfBhVL2IRma4m7KQ6GOL3nJLzHwE6RkBG2BcltHAtCv
	 HorHOpnnl51htcdw5UeCKv0nh4O6Y4nt1dt3tGlurABUev9emJPqK89uQKRhIvZ6xE
	 cDx+1oCFO1ide/j2SOt4isZioUSrQHh+RpoxLaQvo9EJBrlcIqsyZ7NPQ0KLMT6y9C
	 UaHSjGYFvoUGg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 6/7] x86/efi: Make efi_enter/leave_mm() use the use_/unuse_temporary_mm() machinery
Date: Wed,  2 Apr 2025 11:45:39 +0200
Message-ID: <20250402094540.3586683-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250402094540.3586683-1-mingo@kernel.org>
References: <20250402094540.3586683-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Lutomirski <luto@kernel.org>

This should be considerably more robust.  It's also necessary for optimized
for_each_possible_lazymm_cpu() on x86 -- without this patch, EFI calls in
lazy context would remove the lazy mm from mm_cpumask().

[ mingo: Merged it on top of x86/alternatives ]

Signed-off-by: Andy Lutomirski <luto@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/20241119163035.877939834@infradead.org
---
 arch/x86/platform/efi/efi_64.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index ac57259a432b..a5d3496d32a5 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -434,15 +434,12 @@ void __init efi_dump_pagetable(void)
  */
 static void efi_enter_mm(void)
 {
-	efi_prev_mm = current->active_mm;
-	current->active_mm = &efi_mm;
-	switch_mm(efi_prev_mm, &efi_mm, NULL);
+	efi_prev_mm = use_temporary_mm(&efi_mm);
 }
 
 static void efi_leave_mm(void)
 {
-	current->active_mm = efi_prev_mm;
-	switch_mm(&efi_mm, efi_prev_mm, NULL);
+	unuse_temporary_mm(efi_prev_mm);
 }
 
 void arch_efi_call_virt_setup(void)
-- 
2.45.2

