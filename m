Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8859522422F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663021; cv=none; b=eDnVActeYs2yxxOrtcPTb/ibgq4vHy3ENIhlmHhm+GD+fPAEQri0l8WSSMPT0GTJ1lqpxisRK5BY/SC8M6ExYl+ERJJSvyctbfNBxE9pbFAHfs00jMfy8cUAYKawkKch57B/xCdEH+NPhcNL5BDtvLTZ0KbjYQ+YXvvhcrJmlcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663021; c=relaxed/simple;
	bh=rhrfi7/7yEe9fGSTl6wltk5sJXQ8B3zVgDESowf09cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkO9hkj0AC5mJtOTs4DqVKzYgHWkFHFXV7oOhZiSGHqMDBNfRAbXTqSgbdWvhWqHYOWhMyh42hBQSubvgc4ua3cqKIs9QJfRIQ68RiKMBkuG42RYCknBTz7xNn6JMNT0U7mSAUoI4BZdAktkSlCy+tBKUZltebN1a2X5DMVfTyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2/kUrNj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2/kUrNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749663020; x=1781199020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rhrfi7/7yEe9fGSTl6wltk5sJXQ8B3zVgDESowf09cQ=;
  b=M2/kUrNjGqo7gD6LpdzeMsCarJ/y6u18rHin4ea2GiBRCnjTYsp2a5Zz
   OYnJQE80dcbOVCXEP26zhiHr4QCYZ0R1dhi6VGFePkOuL8ccuKxoIXXZL
   gYEaoA93aDHj/lq6/lmiuqPcZaJFH99KnFSRi/Dr900x5AfUGn4ao3S4r
   1UhBP0tkHNn/39u8PbZePSebUq/aANWAhkmMjWCU/n2Yd68sVhxFtKZ+X
   AwcHww9n3f2gc8VCYxjgOxtdJSPHCPPmgub/4cKX6aDbRz4eYdd/vyE58
   FjiwpceFW3MIOck+vQHvZiaOK1caMbNZra3GH5ctHFX70LF1Cr/KUPxnp
   A==;
X-CSE-ConnectionGUID: gKnZ1KY6TLGpqaN3VNNuxw==
X-CSE-MsgGUID: FxaOLthVTmmHfufY2yicSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51732970"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51732970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:30:19 -0700
X-CSE-ConnectionGUID: IlChh2tUSaisxD/S1RHj0g==
X-CSE-MsgGUID: oJhMY3pdQIeFakoSSYZmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="178168599"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:30:19 -0700
Date: Wed, 11 Jun 2025 10:30:18 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v4 6/7] x86/its: Remove =stuff dependency on retbleed
Message-ID: <20250611-eibrs-fix-v4-6-5ff86cac6c61@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>

Allow ITS to enable stuffing independent of retbleed. The dependency is
only on retpoline. It is a valid case for retbleed to be mitigated by eIBRS
while ITS deploys stuffing at the same time.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 387610ad222d4dbd196bfb219145510a37979d73..31f3db0a514ea3d6e2513c0f6e072b84e0117f08 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1467,13 +1467,8 @@ static void __init its_update_mitigation(void)
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
@@ -1485,8 +1480,6 @@ static void __init its_apply_mitigation(void)
 	case ITS_MITIGATION_OFF:
 	case ITS_MITIGATION_AUTO:
 	case ITS_MITIGATION_VMEXIT_ONLY:
-	/* its=stuff forces retbleed stuffing and is enabled there. */
-	case ITS_MITIGATION_RETPOLINE_STUFF:
 		break;
 	case ITS_MITIGATION_ALIGNED_THUNKS:
 		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
@@ -1495,6 +1488,11 @@ static void __init its_apply_mitigation(void)
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


