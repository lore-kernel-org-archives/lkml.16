Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96719E97B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760676; cv=none; b=taaFwVo+EuzOpF5kS7IYwVgihxl6RNitsf1WWVNTds6sX2/YuMIyz807vHH7yNSdn+J0hAbdy0lLGiCXCurSnXYYxuN8U0O+Oi/6KB20DL6bdZmG+o5p49PdNM6GwAsGEeiqwQDatxDU/ockaKlKvgR0hEopKc0NETojmrt9oxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760676; c=relaxed/simple;
	bh=133y6QHD0vSYdiwceMtixI6A+HMdDKE3dICeMTWmXlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mv2cAF4Rdw2QhKpj9ll8R2ynjy+qmbCzOj/tIhXYpsrfEpPYtHA6NiPbDnHKAzw/Nz82z5mQ7IlOVNvSsm28Rws0A34D5q0kjO/sUCZqyp+IT0FPPPNXt6GtiMq0GbistKgEkhMspVThyFkATeyyXg1Al8pSKXEoY1L+b4fH0Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv8BSN1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv8BSN1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E360C4CEDD;
	Fri,  4 Apr 2025 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743760675;
	bh=133y6QHD0vSYdiwceMtixI6A+HMdDKE3dICeMTWmXlw=;
	h=Date:From:To:Cc:Subject:From;
	b=gv8BSN1GvkRhmvih3M9YnyQ2bpf3h8m79Uy20HETProPXsACYiW18DRfgouOWZqj4
	 zVeo+I6Y5XmcvoIfH5j2V7qxJklDorpllUtiaUOIh3rJOA5+qS9DMtIu97ye0pdfgr
	 FnS30T7V/MxAaiORkvY5K9GgNwQBb6Bs3mmexujtVuRtUR9d58tbeD5wq9miejFl6S
	 v6fWOXkyj9wavPpZN8X76GlHm+R/F3ASbLi5Irv3FrmgZJqPgZDtjuRKM0jObFjU3/
	 c2ErzQ+ez/ybTod7ea+StuoArEtD2u7urg4qIuhaIsuCGtYhPvl9MuCR8qLat8bXA7
	 2KRu1o+UyT3cA==
Date: Fri, 4 Apr 2025 11:57:51 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Subject: [GIT PULL] x86 fixes
Message-ID: <Z--tH31is0ge9a9M@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-04

   # HEAD: e5f1e8af9c9e151ecd665f6d2e36fb25fec3b110 x86/fred: Fix system hang during S4 resume with FRED enabled

Miscellaneous x86 fixes:

 - Fix a performance regression on AMD iGPU and dGPU drivers,
   related to the unintended activation of DMA bounce buffers
   that regressed game performance if KASLR disturbed things
   just enough.

 - Fix a copy_user_generic() performance regression on certain
   older non-FSRM/ERMS CPUs

 - Fix a Clang build warning due to a semantic merge conflict
   the Kunit tree generated with the x86 tree

 - Fix FRED related system hang during S4 resume

 - Remove an unused API

 Thanks,

	Ingo

------------------>
Balbir Singh (1):
      x86/mm/init: Handle the special case of device private pages in add_pages(), to not increase max_pfn and trigger dma_addressing_limited() bounce buffers

Dr. David Alan Gilbert (1):
      x86/platform/iosf_mbi: Remove unused iosf_mbi_unregister_pmic_bus_access_notifier()

Herton R. Krzesinski (1):
      x86/uaccess: Improve performance by aligning writes to 8 bytes in copy_user_generic(), on non-FSRM/ERMS CPUs

Nathan Chancellor (1):
      x86/tools: Drop duplicate unlikely() definition in insn_decoder_test.c

Xin Li (Intel) (1):
      x86/fred: Fix system hang during S4 resume with FRED enabled


 arch/x86/include/asm/iosf_mbi.h      |  7 -------
 arch/x86/lib/copy_user_64.S          | 18 ++++++++++++++++++
 arch/x86/mm/init_64.c                | 15 ++++++++++++---
 arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
 arch/x86/power/cpu.c                 | 14 ++++++++++++++
 arch/x86/tools/insn_decoder_test.c   |  2 --
 drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
 7 files changed, 44 insertions(+), 31 deletions(-)
