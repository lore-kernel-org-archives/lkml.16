Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A52566
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963250; cv=none; b=CadzTCnX1ZbLxDwn+f80RT0aQ1TjP5UuAK7pnU45UnRNeiDwAh52mDhzrgRJc5uMAfU0JSg82UqDpNxjdVUVdI3t8InJcR7WsE/5HacoB5DnAOT/5CV1hpwCFLEMcyIGn9VQOUPsmfEJT8M+QCL+C14QOmh6fiArTiHMGMREb5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963250; c=relaxed/simple;
	bh=N2zSwnsNcY6iN7PCWXdFwhNxq+FFO6jtPQrEfpompIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGB341dckiL+jVW/TieBMt6cBBUoBI/BYe3UmVluxInDpkFEngU1ueltRSesCGSdi8pADMX4QmC2Odwjh9KQM+Q5THDYLV9DEgKUPqZMTN1KrJ4Iz7VdHCgvE9ArWAFeixfpB6UFx8rQA963UifTftcUk60ngeF72Ck+j8GY0Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELry7+pn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELry7+pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963248; x=1779499248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N2zSwnsNcY6iN7PCWXdFwhNxq+FFO6jtPQrEfpompIw=;
  b=ELry7+pnOma+W2OguE6S9EFASkrkGsCAx7n2DkH+2lHn3OQ54SZf0vN/
   QabzXS+jM6ZAaFlgVpm5k2f+XhHSAi5LP3f+uArARwLUHCZZuRDBW7egv
   8hHUNa5BzZKLBVxL9BXF0Fn+jz5BNLOniMVzazghsSDCo7RDFSjS9zJ69
   fL66lIZsncJEQj7cUwZG4C+ExyrwogHFzYG+ML8T1N5IWxSNztEF9r+B1
   KOcImNk/3WKNzUpG9HbBQrsrg4o5psLTEtXt3xyHmw69mSNNF9PIwISeM
   Zino//BiWJvuuehPSzERB9S6Lswk7Vp9+pONNqX2fqov62DbX7BrqRxYL
   w==;
X-CSE-ConnectionGUID: 30tL6czMQzm5PLsgLQaf9g==
X-CSE-MsgGUID: Mf/iJkCxT9q25nUcYCObkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49128363"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49128363"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:20:48 -0700
X-CSE-ConnectionGUID: 4I++Fr35TCq0h32sxiQZAg==
X-CSE-MsgGUID: KmK7VqcrQcWC2c6Cb2Gy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140685424"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:20:47 -0700
Date: Thu, 22 May 2025 18:20:47 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH v3 2/7] x86/retbleed: Simplify the =stuff checks
Message-ID: <20250522-eibrs-fix-v3-2-12704e291e1e@linux.intel.com>
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

Simplify the nested checks, remove redundant print and comment.

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 53649df2c4d66c6bd3aa34dec69af9df253bccfc..94d0de3e61aec32b3b67c8d21f89a8c67b93dff3 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1263,24 +1263,16 @@ static void __init retbleed_update_mitigation(void)
 	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
 		return;
 
-	/*
-	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
-	 * then a different mitigation will be selected below.
-	 *
-	 * its=stuff will also attempt to enable stuffing.
-	 */
-	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF ||
-	    its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
-		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
-			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
-			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
-		} else {
-			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
-				pr_info("Retbleed mitigation updated to stuffing\n");
+	 /* ITS can also enable stuffing */
+	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF)
+		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 
-			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
-		}
+	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
+	    spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
+		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
+		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
+
 	/*
 	 * Let IBRS trump all on Intel without affecting the effects of the
 	 * retbleed= cmdline option except for call depth based stuffing

-- 
2.34.1


