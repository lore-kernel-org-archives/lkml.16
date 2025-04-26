Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8535A1474B8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745657817; cv=none; b=TyElHl8Qf7+vv2J4dLRQ4+Jmtao+v5tBCvnuUBIljyPZo1DCsr2yv1I+tvfgJpdgzG1fygxjFsA9F6Cg3uKnjbmc/1I5lfZJXjCHY5DMRwQVdYE1ZjHhB6696mKHrYmYhEVssvAXiX9r53QyvJBvBY6hr4KadzQeKPOpMrO/79E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745657817; c=relaxed/simple;
	bh=+okRqECAD/FxpyKfQF7OwJM595pE1E5eRGmV9+FtLLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9vBT+7AD4WqY3TAmkUr//gkCw2yqAK58dxKGHUeIC32tbqIPyslwUHt2HVpA+QHkku2gRm9Ut0kKzdnEbNB7zti9RU9O11kEqGUwmlWi5LEan8SeXi/yme/db+m1UfcDcXmI8Eb9cwvVW/DJfTDWcK9ytENQFbgAgJwgDOVElA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QF8LID/W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QF8LID/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC35C4CEE2;
	Sat, 26 Apr 2025 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745657816;
	bh=+okRqECAD/FxpyKfQF7OwJM595pE1E5eRGmV9+FtLLI=;
	h=Date:From:To:Cc:Subject:From;
	b=QF8LID/WNlWV3OJ4nifXcX1e0Fx5HqCENfgbQQ9PMF0CCCOfe/4MPw/GgmXjXRMFO
	 7yOuWWqat3TJQ9IhRJ64RnfyQEV+k/QpfbRXRLtnrB/pATCDJfHIxSppX0w2zTIhCV
	 ZA31qvVVb5V1ou5T4p7W1Ux1+1LO9XnQcPcTeoJH95Me+c+vhHgJZbUHnP+yjlZHO/
	 Drtysjyc2GOA4aKxmvbacdUk/lTxFqtmD4pQ7XiHBEtOkKwD0CYzwkLL4mNKUDmXwG
	 D/O4p7rirvJpGZB7TvdtywhkLe9NEpg/RDh0D2KsZJ/7VSM8Ehk0rdfHd0s2QVMT+r
	 3u/Dz/dEZl3fg==
Date: Sat, 26 Apr 2025 10:56:52 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fixes
Message-ID: <aAyf1K5VDFjt0rsN@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-26

   # HEAD: 85fd85bc025a525354acb2241beb3c5387c551ec x86/insn: Fix CTEST instruction decoding

Misc fixes:

 - Fix 32-bit kernel boot crash if passed physical
   memory with more than 32 address bits

 - Fix Xen PV crash

 - Work around build bug in certain limited build environments

 - Fix CTEST instruction decoding in insn_decoder_test

 Thanks,

	Ingo

------------------>
Ard Biesheuvel (1):
      x86/boot: Work around broken busybox 'truncate' tool

Juergen Gross (1):
      x86/mm: Fix _pgd_alloc() for Xen PV mode

Kirill A. Shutemov (1):
      x86/insn: Fix CTEST instruction decoding

Mike Rapoport (Microsoft) (1):
      x86/e820: Discard high memory that can't be addressed by 32-bit systems


 arch/x86/boot/Makefile                |  2 +-
 arch/x86/include/asm/pgalloc.h        | 19 +++++++++++--------
 arch/x86/kernel/e820.c                |  8 ++++++++
 arch/x86/kernel/machine_kexec_32.c    |  4 ++--
 arch/x86/lib/x86-opcode-map.txt       |  4 ++--
 arch/x86/mm/pgtable.c                 |  4 ++--
 arch/x86/platform/efi/efi_64.c        |  4 ++--
 tools/arch/x86/lib/x86-opcode-map.txt |  4 ++--
 8 files changed, 30 insertions(+), 19 deletions(-)
