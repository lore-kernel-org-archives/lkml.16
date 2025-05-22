Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1301854
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881880; cv=none; b=n+z2Pt/5zFasXa/YAk3VI3ihnl0Y0H3visrFXCVy3cXELgKWIH6DrjfUdidqQeyl31ysMoALEBxB1f0B6AF7pBLXMD7mkHwHTu9inBMgrWlJiL3iKzyj4c/wrKxKaW1oQVf6hYkvvfPhrNGX9ojBymc4fYoyD5TEojE7UThBses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881880; c=relaxed/simple;
	bh=gHyfi/x4hhxxOCHpSqek+JEmz54vd0Rcsk+LbxrTN3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHYViErBhRNjvocAGuzPYeli2/voLL/Bm5/lWbYST4NRpGr5Hw+URzO/Q2AiyHNBre1WojSERcMDiNNrfd+A6nR2be3BksmGiHw+Y/W31xxp2LhFFXazuE9UMo2NkGFt1e3uTQ+vyo25NiQY6cuJmmmq7DZYYJm4oolPSswDQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZ9JOFgQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZ9JOFgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881879; x=1779417879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gHyfi/x4hhxxOCHpSqek+JEmz54vd0Rcsk+LbxrTN3Y=;
  b=XZ9JOFgQKMPSmTt21T380L3UOVO7AWzX7m79vJU+mRXTkNMfBBwqrFaQ
   lfTVbEKE1Gux9YYp3DHYbhZB6ZGeg/dgdmyW7rH1+pSx4LFTeJsSatwDH
   9hev/gKO9yiBa9oS0ZYdl5j1euUUTbfXDcRU1I9FYVTC/C+M2g4U5sRH0
   xAIBKztTPiyq2q4F6rw8qcPnDbb4ES0THzL+9exNAlH8NZnd2RKKlyffz
   i9AZ22y1qh9er9ueHk7gH24Re9Wi3sWF5EGBevktFI61eyQ4FKHEqRwvU
   pKLzPJyCUiqeVARnHJGYDp4xDjcL9nTRrLAFszbAG/gk9Eb0WW83NZY7k
   w==;
X-CSE-ConnectionGUID: vanlLjxMQPO+8vfAJJgyfA==
X-CSE-MsgGUID: U7zjxWkJRHSyXxaTPeuEWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61233958"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61233958"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:38 -0700
X-CSE-ConnectionGUID: I+LagGgbTAGbiRj50qfy9w==
X-CSE-MsgGUID: wi4CQbAOSQ6S4sJsWNK+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140136577"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:38 -0700
Date: Wed, 21 May 2025 19:44:37 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 2/7] x86/retbleed: Simplify the =stuff checks
Message-ID: <20250521-eibrs-fix-v2-2-70e2598e932c@linux.intel.com>
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

Simplify the nested checks, remove redundant print and comment.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 19ff705b3128eacad5659990ed345d7a19bcb0f4..20d7d14b08298d4f610f2ebc7f13a490ee3d957a 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1258,24 +1258,16 @@ static void __init retbleed_update_mitigation(void)
 	if (retbleed_mitigation == RETBLEED_MITIGATION_NONE)
 		goto out;
 
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
-			retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
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
+		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 	}
+
 	/*
 	 * Let IBRS trump all on Intel without affecting the effects of the
 	 * retbleed= cmdline option except for call depth based stuffing

-- 
2.34.1


