Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3FD1E9B14
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261570; cv=none; b=B/BGdqYuhTX8TobOnZdWy6gLezCbv8DgQNX8I+2TY8jh/z7EXiRH5aV+Xs2KXEdxIgd8QNIjXPNrMTiTQvCMHedewgpPQx9Z1UZmoIkD5Ab2HRgRS4yOTxmjgydHd2Y/+rI+oxJmO59kX14/qAfIgpu2Zx4jRfK5VA+BWXF1TQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261570; c=relaxed/simple;
	bh=n/05AM9cDZsJyylm38jCM67fcEj3iUy1XLO41j3i3/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ES0764CPjHEVY+qknuwLpNY7luXlr8vvBRiuWzrme+lhjd5h/krR/S5Zl8DLqIy8QcETZeeY8jijaerEgyoLUhK5D02CSnLRfhMJ91wsK4UXLCPsOuiQGkfR07ywUl+cWI5dVeMwOK6MWkWiqNTojLtDSRL3ZUcfvAAvPnKsi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srEblvVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srEblvVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E23C4CEE4;
	Mon, 21 Apr 2025 18:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261569;
	bh=n/05AM9cDZsJyylm38jCM67fcEj3iUy1XLO41j3i3/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=srEblvVmRAmmADNIcPqDoz5NiuJXl2NjfwBfZbdfSxs8mkS2ar/Jrn+CuWMqgaJ1G
	 1+UFOJzdH/NGeK8aLKqUifO6dPXomyDxOKE1vG6AzN2v7BO40lNJu1oOm9lXHj99Pz
	 2v/8LHBZYhjBQ4dhIZGA15wqp+2veA4ZVQkj4W7IYZHSa2s9JhcM/HJX4XlqDRFIH3
	 W6NOcnFcGpT4/uTvLnqEkvhXdUnRTgw46kZ9y6XuYa1wjK27bIFi/Ps15d/iQlcUVE
	 z3kBO93g7U0ndMFhQSyt5gM9rsISblKwGSOetEMMsvJLM3GZMNTrg+NDkoJvSlfAbI
	 hclLEKUWVxbzQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 00/29] x86/boot/e820: Assorted E820 table handling features and cleanups
Date: Mon, 21 Apr 2025 20:51:40 +0200
Message-ID: <20250421185210.3372306-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So I was looking into a E820 table related bug report by
Paul Menzel, and I wanted to implement the behavior
suggested by the ACPI specification, which bug/problem
results in unbootable Linux systems with certain bootloaders:

  https://lore.kernel.org/r/074c2637-1b65-428e-b3e2-24384780e936@molgen.mpg.de

One thing led to another, and now I'm here 29 patches later,
trying to explain what they all do. :-/

In order of importance:

 - The bugfix / change of Linux kernel E820 table parsing behavior:

      x86/boot/e820: Treat non-type-2 'reserved' E820 region types as E820_TYPE_RESERVED

 - A change to e820_search_gap() to fix an implementational oddity
   that would prefer lower-address same-size PCI gaps over larger-address
   PCI gaps. Now the implementation searches for the largest gap:

      x86/boot/e820: Change e820_search_gap() to search for the highest-address PCI gap

 - A rewrite of e820_search_gap() to search the E820 table in ascending
   order to make sure even weird PCI holes get found, as claimed by the
   comments around the code (but not properly implemented):

      x86/boot/e820: Make sure e820_search_gap() finds all gaps

 - Remove the exclusion of single-entry E820 tables passed in by
   firmware:

      x86/boot/e820: Simplify append_e820_table() and remove restriction on single-entry tables

 - A debuggability improvement, to print the sizes of the e820 entries
   and the holes as well, because parsing raw hexadecimal ranges is hard
   for humans:

      x86/boot/e820: Print gaps in the E820 table
      x86/boot/e820: Print out sizes of E820 memory ranges

   Before:
		BIOS-provided physical RAM map:
		BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
		BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
		BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
		BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
		BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
		BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
		BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
		BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
		BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
		BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
   After:
		BIOS-provided physical RAM map:
		BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]  639   KB kernel usable RAM
		BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]    1   KB device reserved
		BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]  320   KB ...
		BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]   64   KB device reserved
		BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
		BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff]  144   KB device reserved
		BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]  768   MB ...
		BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff]  256   MB device reserved
		BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff] 1005.1 MB ...
		BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff]   16   KB device reserved
		BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]    2.8 MB ...
		BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff]   16   KB device reserved
		BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]   15.7 MB ...
		BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256   KB device reserved
		BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff] 1008   GB ...
		BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff]   12   GB device reserved

   Note how weirdly broken up ranges are printed with fractional size
   values, while 'round' ranges are printed as natural numbers.

 - Assorted cleanups: type cleanups, simplifications, standardization
   of coding patterns, etc.

The tree can be found in the WIP.x86/e820 branch of the mingo/tip.git tree:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/e820

It's lightly tested at the moment.

Thanks,

	Ingo

===============>
Ingo Molnar (29):
  x86/boot/e820: Remove inverted boolean logic from the e820_nomerge() function name, rename it to e820_type_mergeable()
  x86/boot/e820: Simplify e820__print_table() a bit
  x86/boot/e820: Simplify the PPro Erratum #50 workaround
  x86/boot/e820: Mark e820__print_table() static
  x86/boot/e820: Print gaps in the E820 table
  x86/boot/e820: Make the field separator space character part of e820_print_type()
  x86/boot/e820: Print out sizes of E820 memory ranges
  x86/boot/e820: Print E820_TYPE_RAM entries as ... RAM entries
  x86/boot/e820: Call the PCI gap a 'gap' in the boot log printout
  x86/boot/e820: Use 'u64' consistently instead of 'unsigned long long'
  x86/boot/e820: Remove pointless early_panic() indirection
  x86/boot/e820: Clean up confusing and self-contradictory verbiage around E820 related resource allocations
  x86/boot/e820: Improve e820_print_type() messages
  x86/boot/e820: Clean up __e820__range_add() a bit
  x86/boot/e820: Clean up __refdata use a bit
  x86/boot/e820: Remove unnecessary header inclusions
  x86/boot/e820: Standardize e820 table index variable names under 'idx'
  x86/boot/e820: Change struct e820_table::nr_entries type from __u32 to u32
  x86/boot/e820: Standardize e820 table index variable types under 'u32'
  x86/boot/e820: Clean up e820__setup_pci_gap()/e820_search_gap() a bit
  x86/boot/e820: Change e820_search_gap() to search for the highest-address PCI gap
  x86/boot/e820: Rename gap_start/gap_size to max_gap_start/max_gap_start in e820_search_gap() et al
  x86/boot/e820: Simplify & clarify __e820__range_add() a bit
  x86/boot/e820: Standardize __init/__initdata tag placement
  x86/boot/e820: Simplify append_e820_table() and remove restriction on single-entry tables
  x86/boot/e820: Remove e820__range_remove()'s unused return parameter
  x86/boot/e820: Simplify the e820__range_remove() API
  x86/boot/e820: Make sure e820_search_gap() finds all gaps
  x86/boot/e820: Treat non-type-2 'reserved' E820 region types as E820_TYPE_RESERVED

 arch/x86/include/asm/e820/api.h   |   3 +-
 arch/x86/include/asm/e820/types.h |   2 +-
 arch/x86/kernel/e820.c            | 518 ++++++++++++++++++++++----------------
 arch/x86/kernel/setup.c           |  10 +-
 arch/x86/platform/efi/efi.c       |   3 +-
 5 files changed, 307 insertions(+), 229 deletions(-)

-- 
2.45.2

