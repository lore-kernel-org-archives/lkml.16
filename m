Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35521293472
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744320356; cv=none; b=BNe6kIy2mseZYDI7693MTY1kylrq3140AsHGhhNg0Emq4tNmAHA4hUzG3HPlwKzkaVpVzIUIyFgJSryiKToWk7I0+DiM0tAOgNuSHsjQrxg7yB/2W64XllatTRqv5CE7cKumXpPlDCpq/rElygXwaNLXupxnEFNvY9IYAmr6T/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744320356; c=relaxed/simple;
	bh=bkjph6SPUsAaWyg1J7Tuay9FdQRu2xyNlV4328o6Mq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fccXP7sjYzU/U1LxneYfowrOL3jBvGdpdZFQO3YYS7CPze7paSMgFPQLLRoNFxeYdaJXX46ZQq14SFFXCOxq5L8DPTYxgqDPRgcbzX6kcCOuaMVVT/yydY9sL7kcWlc3uN2N3KH2fCL5ftWzlHnjazUAIWZ3afK+kf1Zt+ZHbDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MY6qucwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MY6qucwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13E3C4CEDD;
	Thu, 10 Apr 2025 21:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744320355;
	bh=bkjph6SPUsAaWyg1J7Tuay9FdQRu2xyNlV4328o6Mq0=;
	h=Date:From:To:Cc:Subject:From;
	b=MY6qucwMVZ4iKXN53ag8qwOtzSu3jRI9t7yPHFEvf362geNHLFTyBH+afY3OwQScc
	 tQlL2ujwtwkV4j+OrvppCu8mee8v9iRKzjpYQYhLtm0bVTziWKUvRTr6CYJTIDy9G0
	 bQqHi73K2MwT2GbOHHaYR91+hja8NonF9VxB/ziApVA68ryB0LZZXvMTGqbGZ1uXJd
	 LI2fXne1V2vI/aG8Fio5SE6kJMozhfvCS0IcMf6IrPQnz+5+b6NGqzneY4hIvhCksK
	 ByuDcSlsQGI3WS/8NE9rMHZ+y5TjS+zdhfxeT5xfXedGWyFEokNw0i1GGj6b9uAqki
	 LE0THBiM7y/5g==
Date: Thu, 10 Apr 2025 23:25:51 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fixes
Message-ID: <Z_g3X7JyBQ1HdZTa@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-10

   # HEAD: 1fac13956e9877483ece9d090a62239cdfe9deb7 x86/ibt: Fix hibernate

Merge note:

  The RSB fix series includes updates that are technically not 
  regression fixes, but updates to match the code to CPU vendor best 
  recommended practices, add documentation, etc. Given that we are 
  still finding bugs in this code I found it prudent to not fork the 
  code for v6.16 right after -rc1, but have the entire series in v6.15. 
  If this is too much for -rc2, will rebase and resend.

Miscellaneous fixes:

 - Fix CPU topology related regression that limited
   Xen PV guests to a single CPU

 - Fix ancient e820__register_nosave_regions() bugs that
   were causing problems with kexec's artificial memory
   maps

 - Fix an S4 hibernation crash caused by two missing ENDBR's that
   were mistakenly removed in a recent commit

 - Fix a resctrl serialization bug

 - Fix early_printk documentation and comments

 - Fix RSB bugs, combined with preparatory updates to better
   match the code to vendor recommendations.

 - Add RSB mitigation document

 - Fix/update documentation

 - Fix the erratum_1386_microcode[] table to be NULL terminated

 Thanks,

	Ingo

------------------>
Andy Shevchenko (1):
      x86/early_printk: Use 'mmio32' for consistency, fix comments

Borislav Petkov (AMD) (1):
      Documentation/x86: Zap the subsection letters

Dave Hansen (1):
      x86/cpu: Avoid running off the end of an AMD erratum table

James Morse (1):
      x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::name

Josh Poimboeuf (6):
      x86/bugs: Rename entry_ibpb() to write_ibpb()
      x86/bugs: Use SBPB in write_ibpb() if applicable
      x86/bugs: Fix RSB clearing in indirect_branch_prediction_barrier()
      x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline
      x86/bugs: Don't fill RSB on context switch with eIBRS
      x86/bugs: Add RSB mitigation document

Myrrh Periwinkle (1):
      x86/e820: Fix handling of subpage regions when calculating nosave ranges in e820__register_nosave_regions()

Naveen N Rao (AMD) (1):
      Documentation/x86: Update the naming of CPU features for /proc/cpuinfo

Peter Zijlstra (1):
      x86/ibt: Fix hibernate

Petr Vaněk (1):
      x86/acpi: Don't limit CPUs to 1 for Xen PV guests due to disabled ACPI


 Documentation/admin-guide/hw-vuln/index.rst     |   1 +
 Documentation/admin-guide/hw-vuln/rsb.rst       | 268 ++++++++++++++++++++++++
 Documentation/admin-guide/kernel-parameters.txt |   5 +-
 Documentation/arch/x86/cpuinfo.rst              |  69 +++---
 arch/x86/entry/entry.S                          |   9 +-
 arch/x86/include/asm/nospec-branch.h            |  12 +-
 arch/x86/kernel/acpi/boot.c                     |  11 +
 arch/x86/kernel/cpu/amd.c                       |   1 +
 arch/x86/kernel/cpu/bugs.c                      | 101 +++------
 arch/x86/kernel/cpu/resctrl/rdtgroup.c          |  48 +++--
 arch/x86/kernel/e820.c                          |  17 +-
 arch/x86/kernel/early_printk.c                  |  10 +-
 arch/x86/mm/tlb.c                               |   6 +-
 arch/x86/power/hibernate_asm_64.S               |   4 +-
 14 files changed, 405 insertions(+), 157 deletions(-)
 create mode 100644 Documentation/admin-guide/hw-vuln/rsb.rst
