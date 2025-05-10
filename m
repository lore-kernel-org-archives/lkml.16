Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523D2566E6
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746876057; cv=none; b=Yb/KSFypDttdIKvOPLo0Y4Okki3kqyyfczL0tAlXADslJn2TI0R88SCNpa81m2c15OQs4JrI/ugT03w8yxxcC3i5cKAX+kqA4kL+FGz8bN2gyC742Gh0tsMi73hfsfgXJC739QyTHkVS+gVKKfemm+lqhxkIGxVxJ6zeuJXyTps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746876057; c=relaxed/simple;
	bh=pYm2R2gUfeL0wsx9E20viwhqSY3XgOz0aapKWvuh+Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJWhv6GfSXAqdkBL6ufaOt5AbptvfoxxelAw/uXB7oeRkzfB/1BZ3+paGI9jzQhKnYHGXsM6rxPvCIXLZQTsBhDTx+mGOrv81xkWTJSKZZSmH+iDQcErNJlGjqCb9NRDZdtdNJBrb1X6E27maL8M6sHAM6Y3KxfCpexjqIBnBPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbKL+y1j; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbKL+y1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746876056; x=1778412056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYm2R2gUfeL0wsx9E20viwhqSY3XgOz0aapKWvuh+Uc=;
  b=bbKL+y1jLRMwxHh+31w02Ja+6faxBRJq8nGOOKUOSlD0y3vGzdZua5m9
   29fBCV1bX2gYCGuGDrij3Z/yOOE8NWG+WKrb8dzcVa/srGM1Lj7PR4qNt
   Ol3UCo4hNA8PbgQWAxq7t+zpURZSaARv5pwJbM/h3xvJrGBeMCTOPhy7m
   +8gXwIVVpmF7SE9VvPFLpUhj1V5KM0wI6HbThMK5NBiP+/UJRuqGDuTas
   j7XR95mXJt9AfjvWFTnZcRHLPRdJXyopl7RiS2SPgkng0yLwO4IWsHy0H
   e19WdGC0F4+Slqmogndd1783xVU7J3fJXqBA2kaUfJXloUuMFz39QYJ59
   A==;
X-CSE-ConnectionGUID: r4GHEayORN++rD5PfJdt6A==
X-CSE-MsgGUID: 9M3CwZRUSNGdBDPdiM8a/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71219314"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71219314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:56 -0700
X-CSE-ConnectionGUID: 3tqTCSJ9Seyy+vquA9SOxw==
X-CSE-MsgGUID: OLhSmXwiQW+x62S09qU6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="136566499"
Received: from server.sh.intel.com ([10.239.53.23])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 04:20:52 -0700
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
Subject: [PATCH v2 3/5] x86/kexec: Disable kexec/kdump on platforms with TDX partial write erratum
Date: Sat, 10 May 2025 11:20:07 +0000
Message-ID: <3e81d02d2780a0636a69b948acabf4641b8c416d.1746874095.git.kai.huang@intel.com>
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

Some early TDX-capable platforms have an erratum: A kernel partial
write (a write transaction of less than cacheline lands at memory
controller) to TDX private memory poisons that memory, and a subsequent
read triggers a machine check.

On those platforms, the old kernel must reset TDX private memory before
jumping to the new kernel, otherwise the new kernel may see unexpected
machine check.  Currently the kernel doesn't track which page is a TDX
private page.  For simplicity just fail kexec/kdump for those platforms.

Leverage the existing machine_kexec_prepare() to fail kexec/kdump by
adding the check of the presence of the TDX erratum (which is only
checked for if the kernel is built with TDX host support).  This rejects
kexec/kdump when the kernel is loading the kexec/kdump kernel image.

The alternative is to reject kexec/kdump when the kernel is jumping to
the new kernel.  But for kexec this requires adding a new check (e.g.,
arch_kexec_allowed()) in the common code to fail kernel_kexec() at early
stage.  Kdump (crash_kexec()) needs similar check, but it's hard to
justify because crash_kexec() is not supposed to abort.

It's feasible to further relax this limitation, i.e., only fail kexec
when TDX is actually enabled by the kernel.  But this is still a half
measure compared to resetting TDX private memory so just do the simplest
thing for now.

The impact to userspace is the users will get an error when loading the
kexec/kdump kernel image:

  kexec_load failed: Operation not supported

This might be confusing to the users, thus also print the reason in the
dmesg:

  [..] kexec: not allowed on platform with tdx_pw_mce bug.

Signed-off-by: Kai Huang <kai.huang@intel.com>
---
 arch/x86/kernel/machine_kexec_64.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index f5a7b1894fcf..39e133dab7cb 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -347,6 +347,22 @@ int machine_kexec_prepare(struct kimage *image)
 	unsigned long reloc_end = (unsigned long)__relocate_kernel_end;
 	int result;
 
+	/*
+	 * Some early TDX-capable platforms have an erratum.  A kernel
+	 * partial write (a write transaction of less than cacheline
+	 * lands at memory controller) to TDX private memory poisons that
+	 * memory, and a subsequent read triggers a machine check.
+	 *
+	 * On those platforms the old kernel must reset TDX private
+	 * memory before jumping to the new kernel otherwise the new
+	 * kernel may see unexpected machine check.  For simplicity
+	 * just fail kexec/kdump on those platforms.
+	 */
+	if (boot_cpu_has_bug(X86_BUG_TDX_PW_MCE)) {
+		pr_info_once("Not allowed on platform with tdx_pw_mce bug\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Setup the identity mapped 64bit page table */
 	result = init_pgtable(image, __pa(control_page));
 	if (result)
-- 
2.43.0

