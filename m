Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165C1DF271
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743197431; cv=none; b=BZCABfxIXhySnBbGOSuMB9vY5ucNzaDQRoXuL+0hJ+AlhekDh/HRhRzLlKurFGRAsPaHfYW5Ecr1y96vC04xRgJfwxYmMxDavD8EuM6AfLTRKxt17AgiUvHefwYM6/SV3JzEOatkk3RoYabZAuWbBH/0cMIkwZYz6+lQ2rCP6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743197431; c=relaxed/simple;
	bh=MHGEsogHFFwE7WkNKtSTcvQMn8z0I848+p9Gjn1hx0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xzbxl4UiCOnA2+i+sn906iJqcOBV2nPRHiLIbTT6Cz4FWCc5E+sb5n65XMuqX0+v/fR/Mzff+xf8U5pXj6WCK6n57Y4FEPTufo9AuPXEoHvv4JiQpbLkYpyb+9JUonvoCwpI6DLdb3bHIi4nOJB7/o+xZEWgfKZHjui51MxeVFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcW6/o9X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcW6/o9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155BAC4CEE4;
	Fri, 28 Mar 2025 21:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743197431;
	bh=MHGEsogHFFwE7WkNKtSTcvQMn8z0I848+p9Gjn1hx0c=;
	h=Date:From:To:Cc:Subject:From;
	b=LcW6/o9XsSNF5H9y1JykoXtESqeTJzdwLPzhK5GlLVGVKf9C4K5S+aotbx8mpRXU8
	 Ddn/TahM185DwWjuFNMW39akhJgfaVMJkCX6cJCHAvdFyrShs2jznHix+Eg4SPoxlD
	 x3JgUHuJ9B2enbh6AxPXpkNgEN6Lvi/wbs0euzRA0aVTMi+FIV90AfxB2z2TfQDoQG
	 IFTtO41bWc2udpRc3lvCxYp/CQ6JLtaGpZ/fw8nRpxZ9+gsHgP0h+l4Y3VvcdH5pVB
	 eFKrrlgaWXPhCbMsboh4o2t1jb2IFelZIqnl4Af9Q+Owh5uIqUuAfdCB+HMI4/nu/d
	 Xxh56LIt77G6g==
Date: Fri, 28 Mar 2025 22:30:26 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fixes and updates
Message-ID: <Z-cU8qfH1dd7Bmmb@gmail.com>
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

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-03-28

   # HEAD: 31ab12df723543047c3fc19cb8f8c4498ec6267f x86/microcode/AMD: Fix __apply_microcode_amd()'s return value

Merge note, one of the fixes touches core kernel code non-trivially:

  out-of-topic modifications in x86-urgent-2025-03-28:
  ------------------------------------------------------
  include/linux/pgtable.h            # dc84bc2aba85: x86/mm/pat: Fix VM_PAT handl
  mm/memory.c                        # dc84bc2aba85: x86/mm/pat: Fix VM_PAT handl
  kernel/fork.c                      # dc84bc2aba85: x86/mm/pat: Fix VM_PAT handl

Miscellaneous x86 fixes and updates:

 - Fix a large number of x86 Kconfig dependency and help text accuracy
   bugs/problems, by Mateusz Jończyk and David Heideberg.

 - Fix a VM_PAT interaction with fork() crash. This also touches
   core kernel code.

 - Fix an ORC unwinder bug for interrupt entries

 - Fixes and cleanups.

 - Fix an AMD microcode loader bug that can promote verification failures
   into success.

 - Add early-printk support for MMIO based UARTs on an x86 board that
   had no other serial debugging facility and also experienced early
   boot crashes.

 Thanks,

	Ingo

------------------>
Boris Ostrovsky (1):
      x86/microcode/AMD: Fix __apply_microcode_amd()'s return value

Chao Gao (1):
      x86/fpu: Update the outdated comment above fpstate_init_user()

David Hildenbrand (1):
      x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()

Denis Mukhin (1):
      x86/early_printk: Add support for MMIO-based UARTs

Jann Horn (2):
      x86/entry: Fix ORC unwinder for PUSH_REGS with save_ret=1
      x86/dumpstack: Fix inaccurate unwinding from exception stacks due to misplaced assignment

Mateusz Jończyk (9):
      x86/Kconfig: Enable X86_X2APIC by default and improve help text
      x86/Kconfig: Always enable ARCH_SPARSEMEM_ENABLE
      x86/Kconfig: Move all X86_EXTENDED_PLATFORM options together
      x86/Kconfig: Update lists in X86_EXTENDED_PLATFORM
      x86/Kconfig: Document CONFIG_PCI_MMCONFIG
      x86/Kconfig: Make CONFIG_PCI_CNB20LE_QUIRK depend on X86_32
      x86/Kconfig: Document release year of glibc 2.3.3
      x86/Kconfig: Correct X86_X2APIC help text
      x86/Kconfig: Fix lists in X86_EXTENDED_PLATFORM help text

Pawan Gupta (1):
      x86/speculation: Remove the extra #ifdef around CALL_NOSPEC


 Documentation/admin-guide/kernel-parameters.txt |  9 ++-
 arch/x86/Kconfig                                | 83 +++++++++++++++++--------
 arch/x86/entry/calling.h                        |  2 +
 arch/x86/include/asm/nospec-branch.h            |  4 --
 arch/x86/kernel/cpu/microcode/amd.c             |  2 +-
 arch/x86/kernel/dumpstack.c                     |  5 +-
 arch/x86/kernel/early_printk.c                  | 45 +++++++++++++-
 arch/x86/kernel/fpu/core.c                      |  2 +-
 arch/x86/mm/pat/memtype.c                       | 52 +++++++++-------
 include/linux/pgtable.h                         | 28 +++++++--
 kernel/fork.c                                   |  4 ++
 mm/memory.c                                     | 11 ++--
 12 files changed, 172 insertions(+), 75 deletions(-)
