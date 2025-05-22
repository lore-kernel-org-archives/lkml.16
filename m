Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC03A1B6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881927; cv=none; b=QiGMlZAB6PWJXPv3LpNw0mcGBg+f9/o37g4Sr4fcZNyxrPlNmZE209C9cgXbM+K4V1cUAHX3DEitmkVYsW7gz8bdRiCFjlcfcBVvjjpm7JUj+F2XqkJVoxn+sNXjDU9yRkiKxHxRRpTyDJ5s6xlMLvUuVUklM4bY3H36gINRwV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881927; c=relaxed/simple;
	bh=z5J5+SWTzT7NrmMuX+fwbe0cvVwewDsWN4R+8UB22HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+8QeGmN0pgFxPXDUWjBb/CP6b0OtrWFGMa1szhlZmCVMwFHM6TKPQxh7OdiG+S55yX/FMbseG2i7ory0bc97AfuyuRyNRdUMt92VdRGxS+AX+SSHmTxazjeiC1BDvQX+rTjC3DS49UfsnuF3gKNpJeCsKmQKbsRjdLWlfwlJx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/pfpLGc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/pfpLGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881926; x=1779417926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5J5+SWTzT7NrmMuX+fwbe0cvVwewDsWN4R+8UB22HY=;
  b=V/pfpLGcALvC+soaWg6tNCjwa4vW2e7jPDZiyZke3fw+BoeAMcSNxfA2
   0zy8BtCukO++FlL8nrCIPkwjJUMMzCOWLd7gt5SCR7uPmnVgh9v7UbRav
   AVdxJXW3iinOWdJkjLxLamQxA0YAn3+jnnllhtooxLh0CFQAwUHUYIYI1
   HWtuClCIXsiOynrst9h9reqjCjmIfEQzrUdkVCxB02TE6i+V0nw46gj4U
   AdJCs8GnYmJiSufbQVO51DKaG/ZCvdth0NTzCwE+z1mFPXg590LtGXs3O
   BvspWlFJ150lDvdgCDAld2IIgMQdv+WxK3vS8tM5SCwSxGFSp657R8+uD
   A==;
X-CSE-ConnectionGUID: +KAp5gqoTNGBE6dRUP0/Og==
X-CSE-MsgGUID: xo3fKMJxTeq3Vqf8fSrTbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60524420"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="60524420"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:25 -0700
X-CSE-ConnectionGUID: 7qevmbKARF667KSnjjsneg==
X-CSE-MsgGUID: GR0IB1VsSjiQWEBTfVmidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141289716"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:45:25 -0700
Date: Wed, 21 May 2025 19:45:24 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 5/7] x86/retbleed: Introduce cdt_possible()
Message-ID: <20250521-eibrs-fix-v2-5-70e2598e932c@linux.intel.com>
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

In preparation to allow ITS to also enable stuffing a.k.a. Call Depth
Tracking(CDT) independently of retbleed, introduce a helper cdt_possible().

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index fbfc08f5f9f652beb677a1b5310e4322600082ac..59a1f59bf6e2ceda624b6567c5b09ebc524cb9a2 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1123,6 +1123,19 @@ early_param("nospectre_v1", nospectre_v1_cmdline);
 
 enum spectre_v2_mitigation spectre_v2_enabled __ro_after_init = SPECTRE_V2_NONE;
 
+/* Depends on spectre_v2 mitigation selected already */
+static inline bool cdt_possible(enum spectre_v2_mitigation mode)
+{
+	if (!IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING) ||
+	    !IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
+		return false;
+
+	if (mode == SPECTRE_V2_RETPOLINE)
+		return true;
+
+	return false;
+}
+
 #undef pr_fmt
 #define pr_fmt(fmt)     "RETBleed: " fmt
 
@@ -1266,7 +1279,7 @@ static void __init retbleed_update_mitigation(void)
 		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
-	    spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
+	    !cdt_possible(spectre_v2_enabled)) {
 		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
 		retbleed_mitigation = RETBLEED_MITIGATION_AUTO;
 	}

-- 
2.34.1


