Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787DA47
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686921; cv=none; b=Bt3QBrOGbFcLWnyTLMyiFeB3ewj7rjl6n7vD9P4bqEXcg3RYUstHaDrN2GgU5U1jj+RiPDWgHTzQ0EKUXLTOk4cA1MX3/uj1HioJK/F49xJuc9VMpFSlOJV5RvQQq3+DWNU1loyjWB9sp1lBFMwXk5PIVD9TSqy5xJCVvlV9fuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686921; c=relaxed/simple;
	bh=dO1aGfOK0X87wPcIYoNPCRhKa9bKA09E+iK5IxpsaZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6IvtaPcm9Tmpy8gIckGEOsc1FW/5YEt2fpvFu5idmyu9sviV4dn9XJE7HvEl8ARnQ6Z/r5EMEw6KGlYndSaIKHGsjHyUi0YXIyV/VX0hYaEYyAnkrxJ79FnABn9ePEV/6DhUViMtmFxLkthftx4qevCxDFEXl6aFjeQMwiMIAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dh1fpUM0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh1fpUM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749686919; x=1781222919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dO1aGfOK0X87wPcIYoNPCRhKa9bKA09E+iK5IxpsaZo=;
  b=dh1fpUM0I16qJRR7ZKfMFxmxvFcKVcXXoi5YjMo1nCqhJdKoad0kdskj
   2b/cX15Ji1rgv3LeLY29L7kY7KUr8R98sFf/pUsMu80kvt6Kz5pLiyVAo
   eGx1kEKDSB1wj6dfJvZ77dvhg3ak/4Xu+6D8kWcFPUV9XXrUqcTbgngSQ
   AwiG7S2jYa0eU2NbxFRXVfF/rz0cZjvTm2QSlivUDtYli3FFDAtmZF04j
   1PjfcZ5ux02/AuxDNj7pWT4fFYcJx336nTGe8VR7JOtZbxpr8P3+49O1i
   RgYB5hJjGuXB3B6Lz6xS9XjDclr5wv/9RT3p3yZRjroP9Xq1umFIWVBjy
   A==;
X-CSE-ConnectionGUID: VQ4RtehsTJ2p3sSG0xkqJQ==
X-CSE-MsgGUID: lBhYkuamQeOGkTDGDi+mUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51726706"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51726706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 17:08:39 -0700
X-CSE-ConnectionGUID: OBv3cnc6SK26yAhoDhwVvg==
X-CSE-MsgGUID: EVotz/hPRwy3RjVTZL1gfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147899068"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 17:08:39 -0700
Date: Wed, 11 Jun 2025 17:08:27 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH] x86/its: Warn when microcode is old
Message-ID: <20250611-its-warn-v1-1-02eb9a75ce9c@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAN8ZSmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3cySYt3yxKI83SQjS6MkQwMLS7NUYyWg8oKi1LTMCrBR0bG1tQA
 hxjEhWgAAAA==
X-Change-ID: 20250611-its-warn-b292b10896e3
X-Mailer: b4 0.14.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A microcode update is required for IBPB to be effective against ITS. On
Intel, X86_BUG_OLD_MICROCODE is set already when old microcode is detected.
In such a case system is tainted and a warning is issued.

Also warn that userspace could be vulnerable to ITS.

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 7f94e6a5497d9a2d312a76095e48d6b364565777..7aa3ae00e6b4daa5e42217b66c50cd46d6bcc115 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1427,6 +1427,10 @@ static void __init its_select_mitigation(void)
 		return;
 	}
 
+	/* For IBPB to be effective against ITS */
+	if (boot_cpu_has_bug(X86_BUG_OLD_MICROCODE))
+		pr_warn("Old microcode, userspace may be vulnerable to ITS\n");
+
 	if (its_mitigation == ITS_MITIGATION_RETPOLINE_STUFF &&
 	    !IS_ENABLED(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)) {
 		pr_err("RSB stuff mitigation not supported, using default\n");

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-its-warn-b292b10896e3
