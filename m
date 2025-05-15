Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703417BB21
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310756; cv=none; b=L1up5GOaPG9qkPUPN+DqaOQigBr1QlvQZJdJH9MKE2jZF40jD7jYCYy/iRz+SVDUKG3PZRxcMQE/FkjVToKVDROfWJ+5vbpbCzK3UScDdJ4Sk4NAJ2hoPIR5RtuqImSD5UrtY6zszgdUZ2mAek4pCcVqYGVfnUsttDosEVGmERY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310756; c=relaxed/simple;
	bh=Ek3q35eEpSN5jOqeQGcZqs+oZjUTxVloFkdKMcgcyec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxxRCH9nO9ml4Yb4GWddsC6O6/DZWCxwIoSbtiv7Zc6XxEARV5Kyh/Sn4/dGw9XG3yEOJJwSmitcBdZWXJ30nELlBoRKp1B5vDFHimYxKGMmGfW90eeNZocz8uBPpMJOotvumEnFe+ysbJJDsnivdXuCUfdFIIA7+AiByaHk98w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfnupBQI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfnupBQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4782DC4CEE7;
	Thu, 15 May 2025 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310756;
	bh=Ek3q35eEpSN5jOqeQGcZqs+oZjUTxVloFkdKMcgcyec=;
	h=From:To:Cc:Subject:Date:From;
	b=lfnupBQIDJ43SndLDhPJIQSMLeLxhsZYtCpPgFvjSg/vIhmo0Vrnh0Kh3+0kQ44lu
	 tv8tcqu/6MYhRxxE0zCEXGuJvkCHTa2msT0khtii5kpIE5szM8cM55RObrqm3IXjq0
	 N2LYezsSPG/x9zs3gzwKgvT03ohIJ8AlBAAij67KBPqTgBpOMYAMxhFmTAKxrvHt5c
	 kPRuaoAc9PY931mRGr/0khumhAMMQfVf30or4PdrlkKvlRgaQ9RFtMBZlmpQ4auxsz
	 mfg7H4kpADpSaXnMCWwOIbmDdGXdVSUPa8haQUx83kZMxzOsk7qqe/bEoGBiwXWoAa
	 MOn8MS7qmDuAA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH -v2 00/32] x86/boot/e820: Assorted E820 table handling features and cleanups
Date: Thu, 15 May 2025 14:05:16 +0200
Message-ID: <20250515120549.2820541-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in -v2:

 - Further refine type-13 handling as suggested by hpa, and
   don't change behavior for other undefined E820 types.

 - Incorporate review feedback from Mike Rapoport and Andy Shevchenko:

    - Clean up the ppro_with_ram_bug() quirk some more
    - Use FW_BUG to print out firmware bugs
    - Simplify the new size-printing code
    - Standardize on the 'System RAM' string for E820_TYPE_RAM
    - Change e820_type_to_string() to take a 'type' parameter
    - Unify e820_print_type() and e820_type_to_string()
    - Move index increments outside accessors in e820__update_table()
    - Reorder the series a bit for easier review
    - Utilize more SZ_ constants

 - Rebase on top of v6.15-rc6 + tip:x86/core

The latest version of this series can be found at:

   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/e820

Thanks,

	Ingo

===========
Original -v1 announcement:

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

Thanks,

	Ingo

===============>

Ingo Molnar (32):
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
  x86/boot/e820: Standardize e820 table index variable types under 'u32'
  x86/boot/e820: Change struct e820_table::nr_entries type from __u32 to u32
  x86/boot/e820: Clean up e820__setup_pci_gap()/e820_search_gap() a bit
  x86/boot/e820: Change e820_search_gap() to search for the highest-address PCI gap
  x86/boot/e820: Rename gap_start/gap_size to max_gap_start/max_gap_start in e820_search_gap() et al
  x86/boot/e820: Simplify & clarify __e820__range_add() a bit
  x86/boot/e820: Standardize __init/__initdata tag placement
  x86/boot/e820: Simplify append_e820_table() and remove restriction on single-entry tables
  x86/boot/e820: Remove e820__range_remove()'s unused return parameter
  x86/boot/e820: Simplify the e820__range_remove() API
  x86/boot/e820: Make sure e820_search_gap() finds all gaps
  x86/boot/e820: Introduce E820_TYPE_13 and treat it as a device region
  x86/boot/e820: Change e820_type_to_string() to take a 'type' parameter
  x86/boot/e820: Unify e820_print_type() and e820_type_to_string()
  x86/boot/e820: Move index increments outside accessors in e820__update_table()

 arch/x86/include/asm/e820/api.h   |   3 +-
 arch/x86/include/asm/e820/types.h |   6 +-
 arch/x86/kernel/e820.c            | 555 ++++++++++++++++++++++----------------
 arch/x86/kernel/setup.c           |  10 +-
 arch/x86/platform/efi/efi.c       |   3 +-
 5 files changed, 328 insertions(+), 249 deletions(-)

-- 
2.45.2

