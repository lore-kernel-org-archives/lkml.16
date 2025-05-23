Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111B82DCBE2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963296; cv=none; b=nl1vFzq3sflMNK+LRXAPu+G28FDNa9PajAvMrbwqhJo3m2P2yOQbyi8wR4GDtAL8pIfMTZ4AT4u1X/ye2v6ZRMzSEQj4htvj7Aer3YrkjQj7P7Kw3QmUq57zMbXoani2Q0U3D6Awn1mn/uT0c3Y+BYB+RY9W0Jv7kR5HTNg1dOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963296; c=relaxed/simple;
	bh=Qr1RxzvDZ19LZ3ciBesARWFHqbFxDdJf2R9q0eWmNlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC1PXv46Qroi0S92iMp2JK4U09WYV4oLOr14ofJCbWQ91vWQmZ4h0q46GFQ0+W++MpVx69GCr3LY+qVbi/HQ0ZfMUPGSuQlN690XcQzRirnu6G7efi8h52DkeFlAE5aAoVxkqKfoeKR9iFGIg+4WAy+TqLla1lJUT5YVBzo2xhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQWF4Fom; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQWF4Fom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963295; x=1779499295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qr1RxzvDZ19LZ3ciBesARWFHqbFxDdJf2R9q0eWmNlc=;
  b=aQWF4FomFA+SavB7p1w84tnST2H5MBO9yrmlxwV/Pd1v+WMns42eWHVV
   d3Ng0dNUIacgfmGJQmyZAQd3/pVcCSn9qoTcfA0L7BgZSNh0RsbhPP/jv
   j/wHFblTbAOrpXZJaQp8PPMiFT/XaCl7ffYrVCMZkCA/wYjZT1UVbOXu+
   SOnuM8i9cYGCF8JL+n2QVrxixQzJ0ImJISx94a4ta1UI/ZgsxhVf1IB6+
   JEeth1MtvM6tV/L6GCs7EDvmFczJGKcZnykfVhkhzZYCBBbV2Jbb8HdMD
   GxTxDJwA8bjQGD1RkMwrICort1oohlLyV59YLgToVw2GxUdB4c3ji68HJ
   Q==;
X-CSE-ConnectionGUID: Eyw2AFG+RlOxTDrtZR5c+w==
X-CSE-MsgGUID: PX+iLUi8TgqIOlQqCJjdOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49909133"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49909133"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:35 -0700
X-CSE-ConnectionGUID: 8v+zf87cRLu10c+6ueM6Ig==
X-CSE-MsgGUID: 0MZRJ404QZ+Om29mhD1wXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="146098487"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:21:34 -0700
Date: Thu, 22 May 2025 18:21:33 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v3 5/7] x86/retbleed: Introduce cdt_possible()
Message-ID: <20250522-eibrs-fix-v3-5-12704e291e1e@linux.intel.com>
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

In preparation to allow ITS to also enable stuffing a.k.a. Call Depth
Tracking(CDT) independently of retbleed, introduce a helper cdt_possible().

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index aa51fa8d6e8c8f7b2f5020fdb2e44a274badc0e7..7cf2b6e42b70b665842de5a3a96e10a356d343c9 100644
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
 
@@ -1271,7 +1284,7 @@ static void __init retbleed_update_mitigation(void)
 		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
-	    spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
+	    !cdt_possible(spectre_v2_enabled)) {
 		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
 		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}

-- 
2.34.1


