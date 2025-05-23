Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE82DCBE8
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963234; cv=none; b=mRKayy66KjzK+YRpK6lBJmJAgY6b+iE0Z9gUIB9Dycig5oG17bMBnYnClBEWPucoPNP2H2zBfu4zRU3z0uksPwIkjj3zAtv77JA2yuf9aVdLpm0YdRSbmtvwahV+nL/KU/aR8g+Y6CQUFxBrERpm7M77VIfIEbFFFS9dHJADw0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963234; c=relaxed/simple;
	bh=hZF+K4C+8YMX2yIrXGyw419gmW2PPyReux4bOncG09o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSOsJ9TcOM2Fm/Gj/O+IMZ5e+g3mycigpaGMPcrF5jQWCWBWgPwp1woM+wC6/GpsxI3aEoqHN8kds5uq4636yFK/JEGFa8uTj1SRnSd5bD+Z2P1WhjoBvAPUyx18+zmGtsfXEtRlADL3YSq4VuF5qGyDdWjsyx3irOtGJSTUfr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7zUr8dL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7zUr8dL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963233; x=1779499233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hZF+K4C+8YMX2yIrXGyw419gmW2PPyReux4bOncG09o=;
  b=G7zUr8dLpjQENc8/GqmUa7yaA4YPpwhJoXt2m+cbT6NMQgpQ+J/sEyCQ
   qGwzvXSu7C/L5pBZoyqZPp900OU9QlKKiUpXQTn8OhvwauhQynW/9zYdi
   VKK7nIYk19iIgsSQKJcxxTEwoWews6D4QjphuVJszD/5v+mW5likcAi2v
   L9Xlb/QpElDykKkXzitbUavxwCvpGp+/fNEqL9qxomeBXV4UdeUVYDh5d
   qG1o9A0+lOVAHhveisu+wOrHIVcsJi4MFvik/A463eFrGKorJRbZT8DRY
   2Clbfs7MOBQ8jG2wO3UmZk8vJKel3nWcxsbf57ONmxQGfqNiF+NeQ4a3W
   A==;
X-CSE-ConnectionGUID: 6wmL2XKfTy6rSZM6mmOybg==
X-CSE-MsgGUID: rMrVgwu6RwepiwV8FD66ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49128351"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49128351"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:20:32 -0700
X-CSE-ConnectionGUID: PVlI8ayCRWOGN88B6fkWCA==
X-CSE-MsgGUID: 2cJbA49VQbK0Odt2wqwtUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140724632"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:20:32 -0700
Date: Thu, 22 May 2025 18:20:31 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 1/7] x86/retbleed: Avoid AUTO after the select step
Message-ID: <20250522-eibrs-fix-v3-1-12704e291e1e@linux.intel.com>
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

Retbleed select function leaves the mitigation to AUTO in some cases.
Moreover, the update function can also set the mitigation to AUTO. This is
inconsistent with other mitigations and requires explicit handling of AUTO
at the end of update step.

Make sure a mitigation gets selected in the select step, and do not change
it to AUTO in the update step. When no mitigation can be selected leave it
to NONE, which is what AUTO was getting changed to in the end.

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 7f94e6a5497d9a2d312a76095e48d6b364565777..53649df2c4d66c6bd3aa34dec69af9df253bccfc 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1247,6 +1247,14 @@ static void __init retbleed_select_mitigation(void)
 			retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
 		else
 			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
+	} else if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
+		/* Final mitigation depends on spectre-v2 selection */
+		if (boot_cpu_has(X86_FEATURE_IBRS_ENHANCED))
+			retbleed_mitigation = RETBLEED_MITIGATION_EIBRS;
+		else if (boot_cpu_has(X86_FEATURE_IBRS))
+			retbleed_mitigation = RETBLEED_MITIGATION_IBRS;
+		else
+			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
 }
 
@@ -1255,9 +1263,6 @@ static void __init retbleed_update_mitigation(void)
 	if (!boot_cpu_has_bug(X86_BUG_RETBLEED) || cpu_mitigations_off())
 		return;
 
-	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
-		goto out;
-
 	/*
 	 * retbleed=stuff is only allowed on Intel.  If stuffing can't be used
 	 * then a different mitigation will be selected below.
@@ -1268,7 +1273,7 @@ static void __init retbleed_update_mitigation(void)
 	    its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF) {
 		if (spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
 			pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
-			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
+			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 		} else {
 			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
 				pr_info("Retbleed mitigation updated to stuffing\n");
@@ -1294,15 +1299,11 @@ static void __init retbleed_update_mitigation(void)
 			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
 				pr_err(RETBLEED_INTEL_MSG);
 		}
-		/* If nothing has set the mitigation yet, default to NONE. */
-		if (retbleed_mitigation == RETBLEED_MITIGATION_AUTO)
-			retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}
-out:
+
 	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
 }
 
-
 static void __init retbleed_apply_mitigation(void)
 {
 	bool mitigate_smt = false;

-- 
2.34.1


