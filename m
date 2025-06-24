Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71272D23B8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777165; cv=none; b=EVr9RN5pqNcHgodq1QUozEyC6I0JdUJ6r+6M5ekIEujxJLJcSvP1LpI6ensNBUtX9u9Apt5R+8db/Y8xAW6oh29TtYaNrZDeP3NXfdG0evBEQSEG7LfMtwhc7F34kD8H+KEVj/FYU7Fj9IA5NgHHVA3cmmFDtttMCKKJYU0L3hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777165; c=relaxed/simple;
	bh=gSrgyF7nkaMy9jgn9VB3Vel47cqINKRy4i1jm+eFhC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNj7fttLZMOCsW0fKAMBQl+VF+JyiSpswPMJeZJExynjCO3FIldJ2tzPJw2/mB8R/DHs920WiVyeK92ygdLdVtrxxE+5h1Jn2Jbgibq4/It5bGrgfJuWQUkl5O+6nv/7b+BDqlOTn6BtEiIaQFNsqtvxx2KNCsiBHLTuY2RzRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.helo=mgamail.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWTDlOAk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.helo=mgamail.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWTDlOAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750777164; x=1782313164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gSrgyF7nkaMy9jgn9VB3Vel47cqINKRy4i1jm+eFhC4=;
  b=gWTDlOAkJRQ0hmMhHdTCU67fZHRNaSsy/UnAvF+0hNsDaUz0He4GoheD
   e7myDV05nDjk9MPiiXwg2+kTRaZbv4vROK99vE6sKbnlWApiWLkq7ox6h
   vboIv1XoxDlwRbAKfH5bQ3DmgdB9g2c8IWMkKMPpknTizTor240uncjQs
   phU3l92cIziHKh6ef7eMVxpXNRiVBttlhIDNJG+EnuEqjPx8XSXP9/YHF
   jMnuMeiG+7/MeJuC/q2/IktfrUUHnrnjnXm1SoqbabPPRwYg7rzRVzAes
   oabHHhdlUQjGfNO8KRWBRHDoFQEA8r2Jtlq6YhyKfSQoz5/7bmgQRDXJ1
   g==;
X-CSE-ConnectionGUID: Uu/9ThEmS7amvCm64Zva1Q==
X-CSE-MsgGUID: G1B1uq5ZSGmBhd79kuDwSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64080068"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="64080068"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 07:59:23 -0700
X-CSE-ConnectionGUID: Io0QpRsIQ4OlnmQfnbD6Sg==
X-CSE-MsgGUID: 7EFsW7Y6QIeGEVJtNFNuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="152435025"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 24 Jun 2025 07:59:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 71D81224; Tue, 24 Jun 2025 17:59:20 +0300 (EEST)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: dave.hansen@intel.com
Cc: acme@redhat.com,
	aik@amd.com,
	akpm@linux-foundation.org,
	alexander.shishkin@linux.intel.com,
	andrew.cooper3@citrix.com,
	ardb@kernel.org,
	ast@kernel.org,
	bp@alien8.de,
	brijesh.singh@amd.com,
	changbin.du@huawei.com,
	christophe.leroy@csgroup.eu,
	corbet@lwn.net,
	daniel.sneddon@linux.intel.com,
	dave.hansen@linux.intel.com,
	ebiggers@google.com,
	geert+renesas@glider.be,
	houtao1@huawei.com,
	hpa@zytor.com,
	jgg@ziepe.ca,
	jgross@suse.com,
	jpoimboe@kernel.org,
	kai.huang@intel.com,
	kees@kernel.org,
	kirill.shutemov@linux.intel.com,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux@rasmusvillemoes.dk,
	luto@kernel.org,
	mcgrof@kernel.org,
	mhiramat@kernel.org,
	michael.roth@amd.com,
	mingo@kernel.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	paulmck@kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	peterz@infradead.org,
	rick.p.edgecombe@intel.com,
	rppt@kernel.org,
	sandipan.das@amd.com,
	shijie@os.amperecomputing.com,
	sohil.mehta@intel.com,
	tglx@linutronix.de,
	tj@kernel.org,
	tony.luck@intel.com,
	vegard.nossum@oracle.com,
	x86@kernel.org,
	xin3.li@intel.com,
	xiongwei.song@windriver.com,
	ytcoode@gmail.com
Subject: [PATCH] x86/vsyscall: Do not require X86_PF_INSTR to emulate vsyscall
Date: Tue, 24 Jun 2025 17:59:18 +0300
Message-ID: <20250624145918.2720487-1-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <265eef27-aecb-479e-a293-c2e88d69e6ec@intel.com>
References: <265eef27-aecb-479e-a293-c2e88d69e6ec@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

emulate_vsyscall() expects to see X86_PF_INSTR in PFEC on a vsyscall
page fault, but the CPU does not report X86_PF_INSTR if neither
X86_FEATURE_NX nor X86_FEATURE_SMEP are enabled.

X86_FEATURE_NX should be enabled on nearly all 64-bit CPUs, except for
early P4 processors that did not support this feature.

Instead of explicitly checking for X86_PF_INSTR, compare the fault
address to RIP.

On machines with X86_FEATURE_NX enabled, issue a warning if RIP is equal
to fault address but X86_PF_INSTR is absent.

Originally-by: Dave Hansen <dave.hansen@intel.com>
Link: https://lore.kernel.org/all/bd81a98b-f8d4-4304-ac55-d4151a1a77ab@intel.com
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 arch/x86/entry/vsyscall/vsyscall_64.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index c9103a6fa06e..0b0e0283994f 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -124,7 +124,8 @@ bool emulate_vsyscall(unsigned long error_code,
 	if ((error_code & (X86_PF_WRITE | X86_PF_USER)) != X86_PF_USER)
 		return false;
 
-	if (!(error_code & X86_PF_INSTR)) {
+	/* Avoid emulation unless userspace was executing from vsyscall page: */
+	if (address != regs->ip) {
 		/* Failed vsyscall read */
 		if (vsyscall_mode == EMULATE)
 			return false;
@@ -136,13 +137,16 @@ bool emulate_vsyscall(unsigned long error_code,
 		return false;
 	}
 
+
+	/* X86_PF_INSTR is only set when NX is supported: */
+	if (cpu_feature_enabled(X86_FEATURE_NX))
+		WARN_ON_ONCE(!(error_code & X86_PF_INSTR));
+
 	/*
 	 * No point in checking CS -- the only way to get here is a user mode
 	 * trap to a high address, which means that we're in 64-bit user code.
 	 */
 
-	WARN_ON_ONCE(address != regs->ip);
-
 	if (vsyscall_mode == NONE) {
 		warn_bad_vsyscall(KERN_INFO, regs,
 				  "vsyscall attempted with vsyscall=none");
-- 
2.47.2

