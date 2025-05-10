Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72858256C7C
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876062; cv=none; b=S9jEmy3Gzf3wVDFSMokX+39ni/mAqUmVA+cm9dzcqw9SPuqU8mn4NmORECZuXcZ5q0H5ULuXpNVV3vQ3bImxiXOvuobxlgF0xybGl8pp2nF/tuj3IZjJc935sGFz9I8tMmT7aPX+O3hLRLkakKBlvNUoFh0W8nv9d8DS9243aQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876062; c=relaxed/simple;
	bh=Q9mkgBrLw5Vvpn5yhkzCOPbo1CBdGkbMGBJZom8Q4DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdENxzBuejON6Kj4s+TFYHRCAs08ivFgyOFx1yKzDVgqsP22ntxh802Hc75F2sWXfnvCtu4sJRY5+Yh2cXhEei5hkOsc7mw30zQLIALokgocg6oKpEnMcSAb719wl0pIAPVnnV+AzpsCrbU6kTUJ3l2Xq0kNEIT3AZrB496qij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5myGUQv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5myGUQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876060; x=1778412060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q9mkgBrLw5Vvpn5yhkzCOPbo1CBdGkbMGBJZom8Q4DM=;
  b=P5myGUQv+RqNJ/sjwh94L+dzihoEN5wc69jZQYBB+c5+9q+BOHIIFJSR
   B+naWpydR7R1PtWI83GKOHNn/GsK77VHEG6y8sc6r3q+/uw/THtUkMNAu
   ObSU7fDsNrJ91e9h5d8aAZEwWSyPKSQ1el+B/GGgdk3OQm8EJ8JOYHAUI
   0DsG7iOs/QQlMQe3yb+2qHMWOp4Bz9oaEuoEZG2pY5Tjgpm8/8OHXc6Th
   RqA85s0BcCqf1pRMARcX32orSfkZA4AQfV1eYVzcUcumXkRuxJardJt5o
   +VVof/Md73KAgp1u1iKERyrUN0pBJ/KNNsj0sVA/oBJssN4/TGqz+DkY6
   g==;
X-CSE-ConnectionGUID: k/eMxB99QL6qXkmpcyRKSA==
X-CSE-MsgGUID: ak14BP+yST6vmJ8Mb19QEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71219325"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71219325"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:21:00 -0700
X-CSE-ConnectionGUID: zBkVGW2nQDKUH1x0QLFKwA==
X-CSE-MsgGUID: to6iWzxDS+i3cGHfO4dBuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136566503"
Received: from server.sh.intel.com ([10.239.53.23])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:56 -0700
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
Subject: [PATCH v2 4/5] x86/virt/tdx: Remove the !KEXEC_CORE dependency
Date: Sat, 10 May 2025 11:20:08 +0000
Message-ID: <0c0d9d250a7961e4aca325f970e73e204d650ad9.1746874095.git.kai.huang@intel.com>
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

During kexec it is now guaranteed that all dirty cachelines of TDX
private memory are flushed before jumping to the new kernel.  The TDX
private memory from the old kernel will remain as TDX private memory in
the new kernel, but it is OK because kernel read/write to TDX private
memory will never cause machine check, except on the platforms with the
TDX partial write erratum, which has already been handled.

It is safe to allow kexec to work together with TDX now.  Remove the
!KEXEC_CORE dependency.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0f63f550ab52..bd576bc8843a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1923,7 +1923,6 @@ config INTEL_TDX_HOST
 	depends on X86_X2APIC
 	select ARCH_KEEP_MEMBLOCK
 	depends on CONTIG_ALLOC
-	depends on !KEXEC_CORE
 	depends on X86_MCE
 	help
 	  Intel Trust Domain Extensions (TDX) protects guest VMs from malicious
-- 
2.43.0

