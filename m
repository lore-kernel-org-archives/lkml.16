Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED1EED7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881942; cv=none; b=jQSOb2vpo21TGE3YM/3oNO6vzQaZlKniv7unsdPLRRfdf59IJ+ABbR4VQS7ZNJmPcBF48hmd7kaKcWIDwMzv9P81gneNEo4sBEkEGvbLXl3kEwkxctuelqna+8qZLP5QL+YwvCfn9Pk+nM6kk/sADbVf1Cx/U8k5pJVPQf2LH9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881942; c=relaxed/simple;
	bh=AzwgqYH4O83LKm2csj9Kj5EkndNBU6z3Sf7FIPsCCbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYqa1KOKjVV9ImMnzgQFxLjwpT9LWJdW8fuBbic7m/o0NtL3iOFzWCX7H09hHYKc8g3vqIaBzaSS+MgBfQ1bjzGJTqCxu0ohPkGiDbJx8dDwRbYFvR8mIO56JT9gUcMnu1UW+dtZlf+/UOmyGssdfVdAysvWViMiwFr3srLBTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4hRQ8gP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4hRQ8gP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881941; x=1779417941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AzwgqYH4O83LKm2csj9Kj5EkndNBU6z3Sf7FIPsCCbc=;
  b=e4hRQ8gPi8rwjO+8grPc1vSVtZ93GhMZKd4KekCH9TGbkDVBjtvvSoJC
   7zzl5iYn4ADWXkfNqHnM/UgbQQNEuYXyWoBFkq3SAkbnrUCFrvauXZj/0
   fWvPDut0CSa/FWsp88zAnZIX4G1hWZd1+sXLcdccNNtl1ZjCxt3KDa5Zl
   SYkAswNVr5G2+r+ZMN/CnWPOyASYX/uoLHfnsoLox041kuugiGT6uefvZ
   besUzATJ0qwSB03s/364l1rc82B3JmDQCYgwJkkfxX9s9D1RFmd2JVQ6a
   LtlwWj7T774LvIzcXqXiSJZ3Orn5uSJ5NLSXK4iZtbW8SoG5eoHWdqBJJ
   w==;
X-CSE-ConnectionGUID: jhsgjZh/QIue1Lw2wCKt8g==
X-CSE-MsgGUID: lX3CoI0XSqSofSmP4Vb/sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60524437"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="60524437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:40 -0700
X-CSE-ConnectionGUID: W8VxJMaDRN2jYBEnzGmtlw==
X-CSE-MsgGUID: 37p21kuIR/WXD/F0ga1u8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141289735"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:40 -0700
Date: Wed, 21 May 2025 19:45:40 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 6/7] x86/its: Remove =stuff dependency on retbleed
Message-ID: <20250521-eibrs-fix-v2-6-70e2598e932c@linux.intel.com>
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

Allow ITS to enable stuffing independent of retbleed. The dependency is
only on retpoline. It is a valid case for retbleed to be mitigated by eIBRS
while ITS deploys stuffing at the same time.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 59a1f59bf6e2ceda624b6567c5b09ebc524cb9a2..043da9eaf99c5e1f92ae6c56cb7f779bbceae0e0 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1470,13 +1470,8 @@ static void __init its_update_mitigation(void)
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
@@ -1488,8 +1483,6 @@ static void __init its_apply_mitigation(void)
 	case ITS_MITIGATION_OFF:
 	case ITS_MITIGATION_AUTO:
 	case ITS_MITIGATION_VMEXIT_ONLY:
-	/* its=stuff forces retbleed stuffing and is enabled there. */
-	case ITS_MITIGATION_RETPOLINE_STUFF:
 		break;
 	case ITS_MITIGATION_ALIGNED_THUNKS:
 		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
@@ -1498,6 +1491,11 @@ static void __init its_apply_mitigation(void)
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


