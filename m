Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6222DCBE9
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963282; cv=none; b=XR4nLSzMydBmzC07gARZagWyglty9zWQ1MqMaGxXkAytFj16qRcHI0C++/25m/wNpNxLHbsiyq8mmkPGGYE93lshC0kxNSs+m2zLrmTv8OVdWemBUcidedyaBQ0RykRuNRvC/qultMTzc+J5UrX7pom51DsVF4ifiE5mvYU9PAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963282; c=relaxed/simple;
	bh=w0txYmP34P0IcuajJSUgB4w0i/NMu0DT6MjHFWhdUzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBMaLqyPpgC5GvDn8zv67R/s4UcO5zfBd/hwqBgNTEWG0SgLS1Rv3GlbACcOngHbJygxVB0+PvcF+Zq2lfVc375BHoeDUfWk1ipFpnq8Ok+hdJEzkbaMIQ/ApuCWAiQlVIguDqBXkwn/JGVEK46ztRNJSTy6dwicQw2Kjg1oifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APaUqFSp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APaUqFSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963281; x=1779499281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w0txYmP34P0IcuajJSUgB4w0i/NMu0DT6MjHFWhdUzk=;
  b=APaUqFSpzx/Glpq0B7mquk7feioECF7gG7mxk48FrMylaHUGI2X4qLrR
   3UIQwJbSAJ2sLFcpj7/f7D2VAfadgbdzDRlIF47QaFotfK80akold/KcA
   3phwL4BBPgFuHvs3C4A4+QReKE9G+LjyvsThh4ijXHENWiT0GSx0tyDtH
   0g1AX3jIaTZ2A6SpZsyFcoalDne60OSY5xBFYuBWB2c0tUKV3cBuUx1Y7
   aE5nYWG5Vhdi53DzzO4iUFn3iLTTEm+hZy1qyh8m8/lzZoJZgOE8lZ+BE
   sictL/aHI7yljM+NIOgxGPsXv0mC+DGD97fnwkgZuUcQiQWsp5YIJo1bC
   A==;
X-CSE-ConnectionGUID: LGIaqCJ8Ry28BzbzNZl45Q==
X-CSE-MsgGUID: DJrNo2iLSUyXgsAgn3eiKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49909114"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49909114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:19 -0700
X-CSE-ConnectionGUID: 9aaF8ZtbRQmxvG45wjpyiw==
X-CSE-MsgGUID: XijRW6SIRyalFd70vq3rxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="146098429"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:18 -0700
Date: Thu, 22 May 2025 18:21:18 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH v3 4/7] x86/its: Use switch/case to apply mitigation
Message-ID: <20250522-eibrs-fix-v3-4-12704e291e1e@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>

Prepare to apply stuffing mitigation in its_apply_mitigation(). This is
currently only done via retbleed mitigation. Also using switch/case makes
it evident that mitigation mode like VMEXIT_ONLY doesn't need any special
handling.

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 354593065025fd7c5727e955d76523777b3da9ee..aa51fa8d6e8c8f7b2f5020fdb2e44a274badc0e7 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1472,15 +1472,21 @@ static void __init its_update_mitigation(void)
 
 static void __init its_apply_mitigation(void)
 {
+	switch (its_mitigation) {
+	case ITS_MITIGATION_OFF:
+	case ITS_MITIGATION_AUTO:
+	case ITS_MITIGATION_VMEXIT_ONLY:
 	/* its=stuff forces retbleed stuffing and is enabled there. */
-	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
-		return;
-
-	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
-		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
+	case ITS_MITIGATION_RETPOLINE_STUFF:
+		break;
+	case ITS_MITIGATION_ALIGNED_THUNKS:
+		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
+			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
 
-	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
-	set_return_thunk(its_return_thunk);
+		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+		set_return_thunk(its_return_thunk);
+		break;
+	}
 }
 
 #undef pr_fmt

-- 
2.34.1


