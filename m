Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7E2A50
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664850; cv=none; b=mOURFloLLR/pQNRVvei+zRU6fToXvc++iKxh1kLyMsXCQ+xmTswQnaLJJ/7ipcf8gdlSYPVfhEB+x0Luyo2qRBd6ymApYuvZpClIee/b1uPQqDTFt2f/zKy/+uRZmJySB2Z9maNQVO99ZWKPoGh0nbU5swmBka3odzfomE5tHYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664850; c=relaxed/simple;
	bh=mQSLWD9/xere2JF5WAfKE7gTGG8IzPl1blnKBELGi4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ip3hJFFEr2o3ZR/6IkKF730vdwcs1yJGOOHQkBzBN9MVGNUtrNQqbV7Za+K4pQWVcjSxaA9wCmqLnodOOTl5i4a+NMo3Ng3wunOWvw1uuv+7/5U1A89kHfWLMRcUtnt9so/P4VssEwvUTJF0WOaKLqv7eYwTjQiv/Hcmi6o7/cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjWsmaZo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjWsmaZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749664849; x=1781200849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQSLWD9/xere2JF5WAfKE7gTGG8IzPl1blnKBELGi4M=;
  b=XjWsmaZo+BUh745cSuTag5HAQ2AsZOLRsryFC2KlPUj6ULYEiULjuLhx
   5zeVGszTU0XnfT5AzePwUywasqgFnZ9VO2LqYeY09RLOYNf+C6qp2i+EL
   iZB7ruzt659HI4s1byUY3WMz6nVLQUmFD1KqXKacg0yIs0C9iLdxhO8lB
   +wnkWdrZksPG4t5OHnteTUt+YCpy87RD43NdQQ4m5tO59G4tCuB61m+7t
   q6d5CElxyD8ktmcPENqttJh0vwfhvZ5dS2/gZEx5iIFSTqeV5jzUPe54I
   VDipdh7FHNSv2Wlo9DSkMerR5hgvCbQzFYyK/kyiLsynKgKgj+uRTHVTd
   g==;
X-CSE-ConnectionGUID: 8kbLoim/S5CAhSpAhG9+tA==
X-CSE-MsgGUID: OvDwFcxmQU6432zvqKi0/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55622917"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55622917"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:00:48 -0700
X-CSE-ConnectionGUID: DlObzK+YQo2C3v8o1xbkGw==
X-CSE-MsgGUID: /oYFOTYsTree1FFQXv3Ilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147822577"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:00:48 -0700
Date: Wed, 11 Jun 2025 11:00:47 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: tony.luck@intel.com, "H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [RFC PATCH] x86/cpu: Mark Ice Lake model 7D and 9D as unreleased
Message-ID: <20250611-icelake-cleanup-v1-1-0f82472dbc8f@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAOfDSWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3czk1JzE7FTd5JzUxLzSAt0U80QLY0MjA5MUSzMloK6CotS0zAq
 widFKQW7OILEAxxBnD6XY2loAnoUQhm8AAAA=
X-Change-ID: 20250514-icelake-cleanup-d7a831204d96
X-Mailer: b4 0.14.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These models were never officially released, but they made it into
intel-family.h. There is no evidence that these models are being used in
production. As a matter of fact, Intel's affected CPU list[1] does not
contain these models.

During CPU mitigations it gets confusing whether to include these models
with other Ice Lake models or not. Add the comment in the intel-family.h to
indicate that these models were never released. Also taint and warn about
these unreleased models, except when running as a guest.

[1] https://www.intel.com/content/www/us/en/developer/topic-technology/software-security-guidance/processors-affected-consolidated-product-cpu-model.html

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
Please scream if you believe that the assumptions made in this patch are
incorrect.
---
 arch/x86/include/asm/intel-family.h |  4 ++--
 arch/x86/kernel/cpu/intel.c         | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
index be10c188614fe24ad41e2e1912b8d5640c6ea171..948e0a057a9629dc57671e4c666b5f62e762d4bb 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -110,9 +110,9 @@
 
 #define INTEL_ICELAKE_X			IFM(6, 0x6A) /* Sunny Cove */
 #define INTEL_ICELAKE_D			IFM(6, 0x6C) /* Sunny Cove */
-#define INTEL_ICELAKE			IFM(6, 0x7D) /* Sunny Cove */
+#define INTEL_ICELAKE			IFM(6, 0x7D) /* Sunny Cove, never released */
 #define INTEL_ICELAKE_L			IFM(6, 0x7E) /* Sunny Cove */
-#define INTEL_ICELAKE_NNPI		IFM(6, 0x9D) /* Sunny Cove */
+#define INTEL_ICELAKE_NNPI		IFM(6, 0x9D) /* Sunny Cove, never released */
 
 #define INTEL_ROCKETLAKE		IFM(6, 0xA7) /* Cypress Cove */
 
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 076eaa41b8c81b2dd9be129d14dc7c8041eb2e79..b7eb8d5ee4351bf4a31e6a2792d24f7dbc0773ed 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -337,9 +337,21 @@ static void early_init_intel(struct cpuinfo_x86 *c)
 		detect_tme_early(c);
 }
 
+static const struct x86_cpu_id unreleased_cpus[] = {
+	X86_MATCH_VFM(INTEL_ICELAKE,		0),
+	X86_MATCH_VFM(INTEL_ICELAKE_NNPI,	0),
+	{},
+};
+
 static void bsp_init_intel(struct cpuinfo_x86 *c)
 {
 	resctrl_cpu_detect(c);
+
+	if (x86_match_cpu(unreleased_cpus) && !cpu_has(c, X86_FEATURE_HYPERVISOR)) {
+		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+		WARN_ONCE(1, "WARNING: CPU family=0x%x, model=0x%x is unreleased, tainting\n",
+			  c->x86, c->x86_model);
+	}
 }
 
 #ifdef CONFIG_X86_32

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250514-icelake-cleanup-d7a831204d96

Best regards,
-- 
Pawan


