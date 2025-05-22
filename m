Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125FE12E5B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881958; cv=none; b=dPXMQT1TZL2IF7OY8Dmd8VXvcmlIFiyVxEZ6mPc26I4rU2lWHf1bBsqHkvv0Z4nLUPjNAs7t3qvOjcMVh5z+z7NeIoIKXk/9gBwKUMPRCmUFLIrE1uVRkZDLPCf9oPXCj/DA46oOpp/QQTLku+BD3mdA1kWsinfwMA8AeDVIV14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881958; c=relaxed/simple;
	bh=gC9BADa8gs/PRrlJxAFRDjonfuQ7ZS0JubkzIetUW2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvBA2VwbRYti3SWPZz+C9tArnsAukuSSM654Dlk563UpdHityUz9GwHcYRkRsp5FyQwojRo9Q0pmwCFyTyQasxAo2Jb1TrDOgCxyuJImcTqpGQxZBuMuz2LmVqxPmjBChY1qqjty5Khd/CoKuGgMq7iMl/NfBkBXwfcliw8L3hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pk25gA9W; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pk25gA9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881956; x=1779417956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gC9BADa8gs/PRrlJxAFRDjonfuQ7ZS0JubkzIetUW2M=;
  b=Pk25gA9WPeVf1NJVZRjuPoNn/HR6ta118tNBha1bdLhN9Z3SbhYeRyKk
   pC25dQ4XOjIAYwec/HtXI9lQljeZf6W4AkaE9JdwtmKZH7G0eUcVP4Oef
   3uY8iOFEOPTmylmf8v5uoCmk/z1M9Xj2fgYAOjLmrrsJlKh6aOtFeW/wr
   j24AXF7uEjaUilFnxdsnIYj5Yierg/1O9cY0IDMMK3W3nxRGIX4nAxlW1
   9FnAmqHZ06xjnSX0LpVd/NsSozvvI5yc9ZqP7eS/6ualAnPcM7aA48SNM
   reA2iQ6CZ6FHdoh2q89ZN8fRJw2Py3piZc6KIE89lOxv5gjg9h0g7xq2k
   Q==;
X-CSE-ConnectionGUID: 0NmtlJs8TyuZoA3psMrutA==
X-CSE-MsgGUID: 3/fgL2cCQYCNsjDY69vgXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49990565"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49990565"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:55 -0700
X-CSE-ConnectionGUID: SP9NWN2NTIeYQpfnr5XjFQ==
X-CSE-MsgGUID: A5juF8e+Q3CXI7ByAIVyWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145609800"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:56 -0700
Date: Wed, 21 May 2025 19:45:55 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 7/7] x86/its: Allow stuffing in eIBRS+retpoline mode also
Message-ID: <20250521-eibrs-fix-v2-7-70e2598e932c@linux.intel.com>
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

After a recent restructuring of ITS mitigation, RSB stuffing can no
longer be enabled in eIBRS+Retpoline mode. Before ITS, retbleed
mitigation only allowed stuffing when eIBRS was not enabled. This was
perfectly fine since eIBRS mitigates retbleed.

However, RSB stuffing mitigation for ITS is still needed with eIBRS. The
restructuring solely relies on retbleed to deploy stuffing, and does not
allow it when eIBRS is enabled. This behavior is different from what was
before the restructuring. Fix it by allowing stuffing in eIBRS+retpoline
mode also.

Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")
Closes: https://lore.kernel.org/lkml/20250519235101.2vm6sc5txyoykb2r@desk/
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 043da9eaf99c5e1f92ae6c56cb7f779bbceae0e0..ad04da8711b24f2d070e84275a77a4e561fe4d2a 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1130,7 +1130,8 @@ static inline bool cdt_possible(enum spectre_v2_mitigation mode)
 	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
 		return false;
 
-	if (mode == SPECTRE_V2_RETPOLINE)
+	if (mode == SPECTRE_V2_RETPOLINE ||
+	    mode == SPECTRE_V2_EIBRS_RETPOLINE)
 		return true;
 
 	return false;
@@ -1280,7 +1281,7 @@ static void __init retbleed_update_mitigation(void)
 
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
 	    !cdt_possible(spectre_v2_enabled)) {
-		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
+		pr_err("WARNING: retbleed=stuff depends on retpoline\n");
 		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 	}
 
@@ -1457,6 +1458,7 @@ static void __init its_update_mitigation(void)
 		its_mitigation = ITS_MITIGATION_OFF;
 		break;
 	case SPECTRE_V2_RETPOLINE:
+	case SPECTRE_V2_EIBRS_RETPOLINE:
 		/* Retpoline+CDT mitigates ITS */
 		if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF)
 			its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;

-- 
2.34.1


