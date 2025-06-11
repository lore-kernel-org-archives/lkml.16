Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48923221735
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663005; cv=none; b=KZ7F+gLTAjc8JtoaRekX4w9wAS3+eVs63GmRVCGyikrVFseBxFI+ndrchJTZXuBavqF6AMj5XvHok20OwJ//gAYIcyKr3hpt7p//dnngVKaPHwmDSVfFjWiHP0U3sOtntz13z3Bxc+Wqlc2tmmnMm05KDrD6PJDMKrY6Pj9Bppc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663005; c=relaxed/simple;
	bh=yrL5SjkstpuqnV5rjKtSwKY2CB671I1HlxHx9bFwhNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnx4lN4GoaMtQf0HawgM+1UCr5UmHKO9aIHDid6FbTDgCoGd+yxrE2MKXNjb4/TJC8zdMYJNeTSJUlbe+RVzWXkiLO0pT6EuLmzoUCs069iw3lCL4sie1gPCkeWz5JWC7ecLDdgvdcC0qC7EoRypyNFdolFKE5R/q67b6F/Y9zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwLEeC5Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwLEeC5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749663004; x=1781199004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yrL5SjkstpuqnV5rjKtSwKY2CB671I1HlxHx9bFwhNE=;
  b=PwLEeC5QrLPDnLOZzeGNUomvBWSBKAjo8Q+u4bV4tYrH7Cw7d1edrDJi
   rtxE8bFpjR8+87SrOoqS6NK9t/OlEkj8jE7SvRJkCkSOFDxq2p8pMSN0b
   qF+TvcjsBkvInoLc+4QcfE3aZ+sqYOGVo4ZMQGX+E7eE8MzFM/+PVXBG0
   5cYslh9cFtEtfO8juabrTQ1+FKDA6xgNaRU9ckTYZmz6ceQ2imSQsUm+g
   F2a1bnujGu1WRkb3RizIjxsZbHqX9ZSXU0xn2ptTeBS0fNd+3wNh1fmYu
   fuSqd02qgZ45QhXcxE5ZT1DE/LJWXAp4giG+01wabHUmh4LyxG7cd+AEM
   A==;
X-CSE-ConnectionGUID: 0Hha/zOZRbusfXaFSs7zLQ==
X-CSE-MsgGUID: AKlAVs4JSjiM6JBjWHKNpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51961680"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51961680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:30:04 -0700
X-CSE-ConnectionGUID: +K9KfOo5TQSqe7JOIGURqA==
X-CSE-MsgGUID: TyICe5qVSXGE1poGlQjkUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147140738"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:30:03 -0700
Date: Wed, 11 Jun 2025 10:30:03 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v4 5/7] x86/retbleed: Introduce cdt_possible()
Message-ID: <20250611-eibrs-fix-v4-5-5ff86cac6c61@linux.intel.com>
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

In preparation to allow ITS to also enable stuffing a.k.a. Call Depth
Tracking(CDT) independently of retbleed, introduce a helper cdt_possible().

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index e861e8884d6b5e16f08d5bda0f47d5056d26c1f4..387610ad222d4dbd196bfb219145510a37979d73 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1119,6 +1119,19 @@ early_param("nospectre_v1", nospectre_v1_cmdline);
 
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
 
@@ -1267,7 +1280,7 @@ static void __init retbleed_update_mitigation(void)
 		retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
 
 	if (retbleed_mitigation == RETBLEED_MITIGATION_STUFF &&
-	    spectre_v2_enabled != SPECTRE_V2_RETPOLINE) {
+	    !cdt_possible(spectre_v2_enabled)) {
 		pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
 		retbleed_mitigation = RETBLEED_MITIGATION_NONE;
 	}

-- 
2.34.1


