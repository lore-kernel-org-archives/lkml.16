Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2331E47DD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587154; cv=none; b=r3iJvqKYibIhZSOjHnEeOdiPxEGhSdbQh6yh/BZmr049Ioz0gdGnSAqS/yn8qrCP5Y9iWBy7O8X9s8kbAZJU7/Xc0hez3g4HrC55emWF3LGX+Opy4Kayp70eduI3S9a0TWaBSlXOVlAvhOMHe1IKhVD7grGHiYXofpFS9sps6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587154; c=relaxed/simple;
	bh=PI+2ULxmE/DTgvzraKY8zkyVcwAkMEPkrxN0O3sDM98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rDEsJKtMENGl++zdrHCOZYp83R4bS3foj7MC9P7nE0nJeoRPPhzR+c9PblORW4a2nfJzOncbSnUDcU00Emqj5WrR4Vuyu6RgGKWBbLZThrdG6y66UuJMJB567Vi6gr1+/63zkrIMxup7lOUdPsIcm+I5dKzRSJihWCBnn7tAVR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4jsXC+Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4jsXC+Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50448C4CEDD;
	Wed,  2 Apr 2025 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743587154;
	bh=PI+2ULxmE/DTgvzraKY8zkyVcwAkMEPkrxN0O3sDM98=;
	h=From:To:Cc:Subject:Date:From;
	b=e4jsXC+ZAsdkzBKR42x9V+I0oLViatNn+tIQG8B12s3ttSuNJvPM++2ays682wOeg
	 6cSjzuP59WqufqHSR7EgcJ61WR5DVZjMnr72ZGbwlTIVPc+YWeAjXdOZRT2ixiZ0MH
	 CxZz2yK3BhE2yaW1ije6+rAtGK1w5/Au4qtwHuTSkBWhf1oVDHFKmAx91xc7lx/JQD
	 1JDMk5o/wQhmCvyErEl9RWJMfGoRjWU2HjeiX6TjYEi/dSF/gSr+LEepbD4rpc5J+g
	 sksZDIWAjqxhzGuTX8IOiA6LZAZ0mctK0qLgxzm6wfgUpsx5Z4G6CkpmTNnjZb2yUB
	 V1tZRYGI13a1g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 0/7 -v2] Factor out, clean up and use the use_/unuse_temporary_mm() APIs some more
Date: Wed,  2 Apr 2025 11:45:33 +0200
Message-ID: <20250402094540.3586683-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are a couple of cleanups and micro-optimizations by
Andy and Peter around the x86 use_/unuse_temporary_mm() APIs,
which were posted back in November, and which I merged on top
of the WIP.x86/alternatives tree:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/mm

Thanks,

	Ingo

===============>

Andy Lutomirski (5):
  x86/events, x86/insn-eval: Remove incorrect current->active_mm references
  x86/mm: Make use_/unuse_temporary_mm() non-static
  x86/mm: Allow temporary MMs when IRQs are on
  x86/efi: Make efi_enter/leave_mm() use the use_/unuse_temporary_mm() machinery
  x86/mm: Opt-in to IRQs-off activate_mm()

Peter Zijlstra (2):
  x86/mm: Add 'mm' argument to unuse_temporary_mm()
  x86/mm: Remove 'mm' argument from unuse_temporary_mm() again

 arch/x86/Kconfig                   |  1 +
 arch/x86/events/core.c             |  9 ++++-
 arch/x86/include/asm/mmu_context.h |  5 ++-
 arch/x86/kernel/alternative.c      | 64 -----------------------------------
 arch/x86/lib/insn-eval.c           | 13 +++++--
 arch/x86/mm/tlb.c                  | 69 ++++++++++++++++++++++++++++++++++++++
 arch/x86/platform/efi/efi_64.c     |  7 ++--
 7 files changed, 94 insertions(+), 74 deletions(-)

-- 
2.45.2

