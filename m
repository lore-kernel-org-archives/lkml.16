Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546CF1494D9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315314; cv=none; b=B0iBMRVebq42G5LczkOIrz9/w6H+1luNXF7/mcorZC3D13nUoxddCFNn+ZOFpqsENdf1Ge7H8Hh+59/V7E4tGkaPgbfN0gTeT9G5Dy2bnEq3XurmjrUtEK1HSESelH05sHVMVPNe4DQODaA+a7/pemQfCSx0JqMK5Lja8O0ec0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315314; c=relaxed/simple;
	bh=PYJBSP5qzxlLC8smDMxenYtbRdsfru950/4gPxU/fNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rfjEjMuYoegzjLeOUR13KebWMWbcR/FwDdXhNorDs2+h3Dky3o5IGZmiLdkBdPM/NO3VYQMmPoytKHuasxeIBNyuBIiZhoq+dYJoCFXrE627DwALX7c2nZCjA//17mTjH6LjU0WxTwOBWI8lZuESUYpFSOgM7ynY+U7GZeImUOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vR3Z5Avk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vR3Z5Avk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A658C4CED1;
	Fri, 31 Jan 2025 09:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738315313;
	bh=PYJBSP5qzxlLC8smDMxenYtbRdsfru950/4gPxU/fNE=;
	h=Date:From:To:Cc:Subject:From;
	b=vR3Z5AvkBtrJDFEalMo0Z+E33XVbz3Sad4PWi61wWVMX4eum6RT62x2awqBrBdM25
	 SzKk7ApV98ZumOVK4AVmSI+s8p666SWwKWsVopNFLfOvwJqwNqZ2wU8mITNOdBXiXP
	 HLzsnUWFtid66f/dji6JII0dUF8JuBry+ZYHtsPTGDgEJJiojWMM/RJRWl3Bs/ZHC9
	 F/uu3yaY1Yb+tFaRFlXjPOnIUUrbLWpjxPwIdpfyeG/6seYzQyG/y9CYa3K7ay3mbt
	 PcfqtlQtjEMlGu3JrcLI3MTFPdDocvULJzCA/HQFDcVP7aYA4EjpxeJCqyVe8mWzP5
	 P50YjYOpAfAwQ==
Date: Fri, 31 Jan 2025 10:21:43 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] x86/mm changes for v6.14
Message-ID: <Z5yWJyDkAjuuJT5p@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull the latest x86/mm Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-mm-2025-01-31

   # HEAD: aa135d1d0902c49ed45bec98c61c1b4022652b7e x86/mm: Remove unnecessary include of <linux/extable.h>

x86/mm changes for v6.14:

 - The biggest changes are the TLB flushing scalability optimizations,
   to update the mm_cpumask lazily and related changes. This feature
   has both a track record and a continued risk of performance regressions,
   so it was already delayed by a cycle - but it's all 100% perfect now™.
   (Rik van Riel)

 - Also miscellaneous fixes and cleanups. (Gautam Somani,
   Kirill A. Shutemov, Sebastian Andrzej Siewior)

 Thanks,

	Ingo

------------------>
Gautam Somani (1):
      x86/mm/selftests: Fix typo in lam.c

Kirill A. Shutemov (1):
      x86/mtrr: Rename mtrr_overwrite_state() to guest_force_mtrr_state()

Rik van Riel (4):
      x86/mm/tlb: Update mm_cpumask lazily
      x86/mm/tlb: Add tracepoint for TLB flush IPI to stale CPU
      x86/mm/tlb: Also remove local CPU from mm_cpumask if stale
      x86/mm/tlb: Only trim the mm_cpumask once a second

Sebastian Andrzej Siewior (1):
      x86/mm: Remove unnecessary include of <linux/extable.h>


 arch/x86/hyperv/ivm.c              |  2 +-
 arch/x86/include/asm/mmu.h         |  2 ++
 arch/x86/include/asm/mmu_context.h |  1 +
 arch/x86/include/asm/mtrr.h        | 10 +++----
 arch/x86/include/asm/tlbflush.h    |  1 +
 arch/x86/kernel/alternative.c      | 10 +++++--
 arch/x86/kernel/cpu/mtrr/generic.c |  6 ++--
 arch/x86/kernel/cpu/mtrr/mtrr.c    |  2 +-
 arch/x86/kernel/kvm.c              |  2 +-
 arch/x86/mm/fault.c                |  1 -
 arch/x86/mm/tlb.c                  | 59 ++++++++++++++++++++++++++++----------
 arch/x86/xen/enlighten_pv.c        |  4 +--
 include/linux/mm_types.h           |  1 +
 tools/testing/selftests/x86/lam.c  |  2 +-
 14 files changed, 70 insertions(+), 33 deletions(-)
