Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3602DCBE2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963312; cv=none; b=P2wS0BJx3J50v+PRUP5lpJUP2q7nbujybiGOubOsNoSs/n99vjXW00CjtN81u1wHOkpq7UeXWIlVqvnT6eTSiloykZn+Iblu8iBTeN1+cBRV/vYQv7kZMSBrBZsokHVtSmuvAbx1dSjPtp9R8zYcleB/ZsRoYTANubDKpgfu7Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963312; c=relaxed/simple;
	bh=EGNfvm8HxbIrRIgCr3ULkmuxiqPn3f6PmZHSWQ2iTbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjtEW6/faEtSJlCj7smCXPDptAoegiQLf0uRq9HJEQAYWfDTdtzdtc28iCMSBGRYqzxJRRLFpTGzegAQ2BTXOY1fVHpGnE+ZuuSNPQFnnKWP/0CUE+sjBSE1i1YVNZ/4YafhFdDgW/3VdHLh66rhMZrXd4IwLoUzOX4S3uR9574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xakkota8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xakkota8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963311; x=1779499311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EGNfvm8HxbIrRIgCr3ULkmuxiqPn3f6PmZHSWQ2iTbw=;
  b=Xakkota8fIz9YHTvFJefKWrFHv9OejTAjPj0Zje0BaO+i9msXojgXMCp
   zpViKFZNu5LxhdMxRVJ0ikQkP94W7Yr3FmWRZEvk7BaTCWx415gTHbLjT
   /U2c34KUaO3DLYWjd3iL69fBGnBWWp4RP3iNBA7mev/Du7Axmf+aqIVfu
   j3TulF9D9brbw34JRIlfERNE9DvSSrOvOJAfhsVXq1hdcv5hO7HQjN4yy
   iNN5MEn9lbrsvQrZLmwqb8RzOxE8ahc0Pw0NbM5mDyNN9UrSnvYXZk2rh
   wScuAmisafZO+bPW7PRe9M1TksAwH/SyPdbc8L1+kEY2Swdf+wzrTuir5
   Q==;
X-CSE-ConnectionGUID: 5iI/NmwmTIGVhvcVzbFe3Q==
X-CSE-MsgGUID: 5Ch/jk3qS8ON7Jj0CfjYFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50123739"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="50123739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:50 -0700
X-CSE-ConnectionGUID: W3xam50xQjivgT7l4EBC+g==
X-CSE-MsgGUID: /Q5shulPSgSai4gkgphz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="141406504"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:50 -0700
Date: Thu, 22 May 2025 18:21:49 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v3 6/7] x86/its: Remove =stuff dependency on retbleed
Message-ID: <20250522-eibrs-fix-v3-6-12704e291e1e@linux.intel.com>
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

Allow ITS to enable stuffing independent of retbleed. The dependency is
only on retpoline. It is a valid case for retbleed to be mitigated by eIBRS
while ITS deploys stuffing at the same time.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 7cf2b6e42b70b665842de5a3a96e10a356d343c9..3d56e258876234b802b6682050c46917a6cf7401 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1471,13 +1471,8 @@ static void __init its_update_mitigation(void)
 		break;
 	}
 
-	/*
-	 * retbleed_update_mitigation() will try to do stuffing if its=stuff.
-	 * If it can't, such as if spectre_v2!=retpoline, then fall back to
-	 * aligned thunks.
-	 */
 	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
-	    retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
+	    !cdt_possible(spectre_v2_enabled))
 		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
 
 	pr_info("%s\n", its_strings[its_mitigation]);
@@ -1489,8 +1484,6 @@ static void __init its_apply_mitigation(void)
 	case ITS_MITIGATION_OFF:
 	case ITS_MITIGATION_AUTO:
 	case ITS_MITIGATION_VMEXIT_ONLY:
-	/* its=stuff forces retbleed stuffing and is enabled there. */
-	case ITS_MITIGATION_RETPOLINE_STUFF:
 		break;
 	case ITS_MITIGATION_ALIGNED_THUNKS:
 		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
@@ -1499,6 +1492,11 @@ static void __init its_apply_mitigation(void)
 		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
 		set_return_thunk(its_return_thunk);
 		break;
+	case ITS_MITIGATION_RETPOLINE_STUFF:
+		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
+		set_return_thunk(call_depth_return_thunk);
+		break;
 	}
 }
 

-- 
2.34.1


