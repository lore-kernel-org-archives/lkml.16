Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAC2046A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662959; cv=none; b=hKS9+l0kAOfD59XMf/gl0yfijW09nSQSbnMnFtBrnRTVSxZN3OD3r+S7VytWk5wEaxtyMXMpNlRxW3MTQPWslbEDpGQaBXCsaVF5X7AwfyAe782CQdfxBvReih8z9Wb0obxv2FwHUA5z7tuURnYuVO/pUnAk+N/X4dorvMARBOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662959; c=relaxed/simple;
	bh=yeVFmiZES5grJGugM77Upm7BOodcgl2QIbyrfHzbqKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxoYnohEMBULfsAHXM9Y0w68R8fkOo1n4yO1dcKnt/C4ITb44beJNhi/nnvgmGMJYtKyU+UaJdARTiZaoSxnpoLz984G5Z76EfCQWVByUKoVZMeNWxFNyFktVGYwf+2MTgQaVVUkciprfv3iem5LuWX6cIocuUzNZMn5TscLZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUkIB3dX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUkIB3dX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749662957; x=1781198957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yeVFmiZES5grJGugM77Upm7BOodcgl2QIbyrfHzbqKo=;
  b=MUkIB3dXDP6on1DbDgiN7vCEEgFShbnzAgy44hJUuO/Vyz5kh5BnckK0
   DAApU+GSHMX/6d1+QpV816UCfjuAuUDUsI2tP2oXXp7BI3wCmtlO27qHR
   elOPVryzj2oDQqHQWaFfuTXnLePs3kILCq4PAxMqHhLLJ0CpElqHXx8hb
   qAdLD0othUCQR7z06Jr6uxeqlqQVyqLprWaCp07eNPkQtEcqOHzK9w4Af
   1APCjMLWs+nc8vZ+QzpllzUbHccmKWg+LQrSWUbv1x+h9obu6vU+pCY17
   fGniCPdseOkf+N2/gkWVv348QhrG8nCznEExE5sWMVvbE2uoVv5LjMNKx
   Q==;
X-CSE-ConnectionGUID: HcfQ4GjgRe64MBMxjdwL4g==
X-CSE-MsgGUID: ZG1uGF+dRVGK7cWIV6L6tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55611751"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55611751"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:16 -0700
X-CSE-ConnectionGUID: bczaPzSDTZmsFf2jiaX/LQ==
X-CSE-MsgGUID: Ab1gDdW7Q8CgmUUgtjZ1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="148166463"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:16 -0700
Date: Wed, 11 Jun 2025 10:29:15 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH v4 2/7] x86/retbleed: Simplify the =stuff checks
Message-ID: <20250611-eibrs-fix-v4-2-5ff86cac6c61@linux.intel.com>
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

Simplify the nested checks, remove redundant print and comment.

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
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


