Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E013D2571B3
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876066; cv=none; b=nkgOYTsOeel2iHa0WOplyu+M39e1B6fF5Z/2Lec7mLFRXhrDQlPFL9m/uYYuxL++NLL/x+Buj1dAwP8jf7Tk9RI7UDyY+D5kdOm17XUd+0Q2fnv/wyg1q3R+Y6m83RSrSVmkToPBdDwwy6yyMMxS+NvGSzMG1Jc4DtBIQvORcno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876066; c=relaxed/simple;
	bh=G/buFMBPLQTYjzidFtELPQBT0aKuw0rQJJKvLBaZc5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQb9bih7wqN4PGuZGkg0JYmP3aRiFOplFA/jXc9uwq/6wZmmhoImv1bqH+6oEm+BwbAvaHojoaK5KQNVLet5FlqEbPFHG/CG2XnkvzzTZ+/9vbOtNqbBQvAjAbaKeTBAQQvlD2MwIqXs7iVXWvc2/hrVWetO1nVMjE5nmyDibfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1s0YsWD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1s0YsWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876065; x=1778412065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G/buFMBPLQTYjzidFtELPQBT0aKuw0rQJJKvLBaZc5s=;
  b=j1s0YsWDtDuoeSYvCjTeQ1fAuY5Lk+zkgKYW8Ax7ow/NpMyya76IcjCu
   0qH5iU1wA+wK1PP8ELzzqFiAD2W9FE13fkpFeZztJKvgVGJvwKEkuvAm/
   NjK2/7jmhdmxiuKxs8dJmqfrvQyBG7vlPdr+CPKPivBX1/G1tklH1c8bg
   J6j0F+u9V+TQdSDQcLrjsR44ntcve1gZ2V++L8dTTDWdkqkiVCvDmMveL
   K9RB2XeC0ISSlywEUj6gY8QBdDySH1/7Ra1e86IADHqnY6sGWNB7PjWNv
   +r4N02U74WqFOK/C1YsNoxxokON3hdytuQOA/LKJ0q33MzskHAoXNjLHc
   w==;
X-CSE-ConnectionGUID: nKuh63d3TTKZnxKxU7HdPA==
X-CSE-MsgGUID: rtpKGFZDQl+B0aBwjLznUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71219335"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71219335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:21:04 -0700
X-CSE-ConnectionGUID: bFd2BkfRRPS60x339gJD/g==
X-CSE-MsgGUID: bZvUi6/hQc2LGZyWeZlQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136566509"
Received: from server.sh.intel.com ([10.239.53.23])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:21:01 -0700
From: Kai Huang <kai.huang@intel.com>
To: dave.hansen@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org,
	mingo@redhat.com
Cc: kirill.shutemov@linux.intel.com,
	hpa@zytor.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com,
	rick.p.edgecombe@intel.com,
	isaku.yamahata@intel.com,
	reinette.chatre@intel.com,
	dan.j.williams@intel.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	nik.borisov@suse.com,
	sagis@google.com
Subject: [PATCH v2 5/5] x86/virt/tdx: Update the kexec section in the TDX documentation
Date: Sat, 10 May 2025 11:20:09 +0000
Message-ID: <b8c53a8ee18c02c61260cdfd3b0a307dc7948eaa.1746874095.git.kai.huang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746874095.git.kai.huang@intel.com>
References: <cover.1746874095.git.kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TDX host kernel now supports kexec/kdump.  Update the documentation to
reflect that.

Opportunsitically, remove the parentheses in "Kexec()" and move this
section under the "Erratum" section because the updated "Kexec" section
now refers to that erratum.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/arch/x86/tdx.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index 719043cd8b46..61670e7df2f7 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -142,13 +142,6 @@ but depends on the BIOS to behave correctly.
 Note TDX works with CPU logical online/offline, thus the kernel still
 allows to offline logical CPU and online it again.
 
-Kexec()
-~~~~~~~
-
-TDX host support currently lacks the ability to handle kexec.  For
-simplicity only one of them can be enabled in the Kconfig.  This will be
-fixed in the future.
-
 Erratum
 ~~~~~~~
 
@@ -171,6 +164,13 @@ If the platform has such erratum, the kernel prints additional message in
 machine check handler to tell user the machine check may be caused by
 kernel bug on TDX private memory.
 
+Kexec
+~~~~~~~
+
+Currently kexec doesn't work on the TDX platforms with the aforementioned
+erratum.  It fails when loading the kexec kernel image.  Otherwise it
+works normally.
+
 Interaction vs S3 and deeper states
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0

