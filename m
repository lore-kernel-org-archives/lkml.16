Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F6221562
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662946; cv=none; b=U6+c6wr/DTJ44OYBURhMWMMlWjiAxwdRXGQuI4Yq/KDq6IK30ZwLSdoymLuedj9MbVaJ2dmQrr1MkQp7x8n/ni3/OHZuJQkj0kRnO4x7JkL8lAmje1NLKEXjbqrOYVeLKcGoQTnkV5psfvLpVW1UAUqHOwEpKrYqyRlFBpWvOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662946; c=relaxed/simple;
	bh=7dpv+UFGtwZrM6XSMTUgKpKz4FPWSIEhZU89Ce2+58o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLVRuf2+OmuN0HRoHQJ/I1XsqVxtVDo0VbTRLH1HbKLwWUvY7E6q5Z9vE5tVyh4fOxMhLHLbIpvAPhJWnJIjr+Be2oD50WDS+Rqf66YcA2X9tkqfjH33ZANMYWPwc9aMY+aMZ7//XSXrQXVfDVLW8hDCTnbjZg/ynssdYcncFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gx62Uz98; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gx62Uz98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749662945; x=1781198945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7dpv+UFGtwZrM6XSMTUgKpKz4FPWSIEhZU89Ce2+58o=;
  b=gx62Uz98TJpjx7+8QTUDVZVbvQWkyJEhjfer1hW7DZmRa8wdk3ym51P3
   7T60AK/ScS71ULw8mV92Be6DvjYAzRBYnkus2U0e+qkGnlZZHr+xH0Yjy
   DPS9j4kO+/ByYP2OklSYo5V4JuFny08j0/gtcM6brc2kBLIOsI7awb1vg
   xOQHO038dIioN5WUWF3XuWmkw5fohHO0whPcsTCetWQGMKUxX6gsK0mWv
   SqoeK6FhL4ZQ3WkbjiPpfsyfthApEbPU2JZjCGk9mtIiIzIiH1+PkX3By
   IxKGowlG12gPZWDcKtgWo80kYA1JA5lhJrvff31BDFC0IZSXT0BdJ9GaI
   w==;
X-CSE-ConnectionGUID: YcmQlEwSS3SOJ5oNtX5DFA==
X-CSE-MsgGUID: FlGLxF5rTBque8p8Dwlsvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51961454"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51961454"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:01 -0700
X-CSE-ConnectionGUID: CTV7Qh6cTtqfHk3CXLTqnw==
X-CSE-MsgGUID: wuC24KyNTTSrlhpxCNOk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147158525"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:01 -0700
Date: Wed, 11 Jun 2025 10:29:00 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH v4 1/7] x86/retbleed: Avoid AUTO after the select step
Message-ID: <20250611-eibrs-fix-v4-1-5ff86cac6c61@linux.intel.com>
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

Retbleed select function leaves the mitigation to AUTO in some cases.
Moreover, the update function can also set the mitigation to AUTO. This is
inconsistent with other mitigations and requires explicit handling of AUTO
at the end of update step.

Make sure a mitigation gets selected in the select step, and do not change
it to AUTO in the update step. When no mitigation can be selected leave it
to NONE, which is what AUTO was getting changed to in the end.

Suggested-by: Borislav Petkov <bp@alien8.de>
Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
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


