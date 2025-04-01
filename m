Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9C8F54
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743481651; cv=none; b=K24P528v9u4JEsrC1jjwONZiC2w5pBMvv9AKpJRBUmiATmf1ip1jmDa3TGjKHHX9Xgom8qYADyL3bOFxmHRY94pyF9Rrp2+m464ArBY5ERc+NYFnsZIBLJmcDSZQmuSXQ0AjeoQr7BmQ8lKZGU5iCI/WL2XITj47+w8ZzBI6ZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743481651; c=relaxed/simple;
	bh=YeqlNphdkNtKYNMTtEzWry8QY9jr1TP8/9KS705pUC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1FN/PJLqcWzFDC4L4/VK2X420k0t/SlddpqMvLrkaL/dgomen6CNOno8SacO/uOXaUs4DDL8J/1f/EF+oD/cLRftlO632knYcKl70cxlgYv0/Lk9z2RMDkForciBpiJuV7huUI6J1MotWB1k6PFBOxPRbwMsGYdPXvngpv33R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtK6bHoq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtK6bHoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9DFC4CEE8;
	Tue,  1 Apr 2025 04:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743481651;
	bh=YeqlNphdkNtKYNMTtEzWry8QY9jr1TP8/9KS705pUC0=;
	h=From:To:Cc:Subject:Date:From;
	b=OtK6bHoqhbb88k5FJnk6HuWxLTVDK6h4YFeBN0EN4W8QvWZ8nhfd2IS3PrniU05S6
	 /pmB/P8RFL8K6yCZr4sdBcCPHbB4H2B27wXpFXcXECNYekDBTXOxAR7zsME6iriM2U
	 kMCOdOP/izAR8pGWlwqVI0rKTjFX5k6tmWBuaK24OHILNA1Gc7SMq4gaYpk2Tr+va8
	 5AeeXNV/bavcqYz/vdmQ8JDjKsYgAPMuthemMo9/KNBPx/WE4b6rH/mLBSX+AytRcf
	 wAsclI8qY7u3zmGEXfnWbd2FvfVnY3bLHOc4iBvuDiyY7LII5wOS3TnteYcEBHsPU8
	 FqZkxLWIU8YGw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 00/11] Yet more objtool fixes
Date: Mon, 31 Mar 2025 21:26:35 -0700
Message-ID: <cover.1743481539.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

David Laight (1):
  objtool: Fix verbose disassembly if CROSS_COMPILE isn't set

Josh Poimboeuf (10):
  objtool: Silence more KCOV warnings, part 2
  objtool: Ignore end-of-section jumps for KCOV/GCOV
  objtool: Append "()" to function name in "unexpected end of section"
    warning
  Revert "objtool: Increase per-function WARN_FUNC() rate limit"
  objtool: Always fail on fatal errors
  objtool: Change "warning:" to "error:" for fatal errors
  objtool/loongarch: Add unwind hints in prepare_frametrace()
  sched/smt: Always inline sched_smt_active()
  context_tracking: Always inline ct_{nmi,irq}_{enter,exit}()
  rcu-tasks: Always inline rcu_irq_work_resched()

 arch/loongarch/include/asm/stacktrace.h   |   3 +
 arch/loongarch/include/asm/unwind_hints.h |  10 +-
 include/linux/context_tracking_irq.h      |   8 +-
 include/linux/rcupdate.h                  |   2 +-
 include/linux/sched/smt.h                 |   2 +-
 scripts/Makefile.lib                      |   2 +-
 tools/objtool/arch/loongarch/decode.c     |  14 +-
 tools/objtool/arch/loongarch/orc.c        |   8 +-
 tools/objtool/arch/x86/decode.c           |  15 +-
 tools/objtool/arch/x86/orc.c              |   6 +-
 tools/objtool/builtin-check.c             |  30 ++--
 tools/objtool/check.c                     | 172 +++++++++++-----------
 tools/objtool/elf.c                       | 150 +++++++++----------
 tools/objtool/include/objtool/elf.h       |   2 +-
 tools/objtool/include/objtool/warn.h      |  63 ++++----
 tools/objtool/objtool.c                   |   4 +-
 tools/objtool/orc_dump.c                  |  30 ++--
 tools/objtool/special.c                   |  13 +-
 18 files changed, 273 insertions(+), 261 deletions(-)

-- 
2.48.1

