Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9624086A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881916; cv=none; b=u+fxKQK3vV501rAmlKxpC9Zz+clLi09xN9zMUCe2EtCqjD78b0xPeHbPANrTf2z0TyPO3ORjqq6zCvGNtnEL+7eMWWZBuSiCijdJAbBZczeJ8MTEZgmjZTIm5TB6mh2kpAnOAClgc0CJPFqZmVb9K5dpJ0B3EXJQH1fXrmU+HJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881916; c=relaxed/simple;
	bh=nquVPncXX39k9Guyv3btazppR+HflSexO+EgPb58o/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4iROl0DxWUeEExcl78ze9lE/BLgjMVLQI7LhNgj6o3v/1Od1yquJq1sfvXm/TGeAkJYZumRYTOsOxEFzrD6nFpFILOo4fYmWz0AB+wbbsAuc3rCb7mOGkqL+4z7oLVpYpWNXaIMmJEcWhNUoWOYD3m0p+8j9CwrIbiyhKYgVmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGz8X0O6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGz8X0O6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881915; x=1779417915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nquVPncXX39k9Guyv3btazppR+HflSexO+EgPb58o/8=;
  b=WGz8X0O6b3wzTKnV0jFcRd8jwUKl39RyIXx1sEUL9NddXtk1IGXGNEPw
   GXhHVYzh6VIBGRzW893eMvB6IWchM8duXcrvT4nIsnBGwxuqFRxf6UmR1
   KBaD/nX9wFP9Hp7eliyO9xEt39Nti0qQ0aLtbkMtu9ygBoiugUDw0l8/o
   7L4YW30EgAzdmYI072pAWVDCtxtsxV/AuAneG0XvtCMYHZ8afLFr7D4WF
   IQZvA+ohfFnn6PYHaa1CrogSWTrxZ2Gv7N6VMeZDaxp8V9N7KtuN2c3g0
   tyQuHS1nyhcyH11F+ID5MxO9Qp2y+VWu+em+zFF+BvgA+Pwscrav/GZ8z
   g==;
X-CSE-ConnectionGUID: uZYRHm6WSuyJe+iRjrkCEg==
X-CSE-MsgGUID: FhC5iwJ2SGOPy04W9cd2Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50027072"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="50027072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:14 -0700
X-CSE-ConnectionGUID: +kq5HQXvR1GEl6YwmwxKUw==
X-CSE-MsgGUID: XVSeH6KGQI+p3W30HFiU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140889366"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:09 -0700
Date: Wed, 21 May 2025 19:45:08 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 4/7] x86/its: Use switch/case to apply mitigation
Message-ID: <20250521-eibrs-fix-v2-4-70e2598e932c@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>

Prepare to apply stuffing mitigation in its_apply_mitigation(). This is
currently only done via retbleed mitigation. Also using switch/case makes
it evident that mitigation mode like VMEXIT_ONLY doesn't need any special
handling.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index a088302b320cf68344e28be7710b5a3582bba9ea..fbfc08f5f9f652beb677a1b5310e4322600082ac 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1471,15 +1471,21 @@ static void __init its_update_mitigation(void)
 
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


