Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA72046A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662927; cv=none; b=Rn9H2dHCaA9saqdTgrhAHVZMF8x1Ae8UjY/cUQhyPLAwrTWqy1iNpPifGc7iS6vN5EuvVsOBuy5PXh7vWbGLdrb4LK+ezKt/UHP25eT776PeS4MyFXGykkKmYIhh0+cYZsu5gilaPsjYvVR6gm8djR313WxqpRJHE3qxYpqRrWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662927; c=relaxed/simple;
	bh=RMIoiiz9p1as1Ud+GnnDMjOkY32YOL7AKOJ1UDjy0LA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqS+89WOAhKgWRSKg6CWLcMghz77FhT7RDruOUVsv1RVvMVYWAnSPhWpdsxdXAWOFm7wQ4bTfkGwhaqX7VfnF1+7R0U+MVF7ZGVYZ8wqw0/UL55YLDueYFE0Dt13JBRK84j76ET7jy8qzOLsKv/Dqo9HY7Iaz2jQFpkfmKoCUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGPU5+dv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGPU5+dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749662926; x=1781198926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMIoiiz9p1as1Ud+GnnDMjOkY32YOL7AKOJ1UDjy0LA=;
  b=TGPU5+dvv9rwQB+nAEIomGGWa7bw8QiJJ2PSSTlIK4GhWeDZeR0YFbt0
   f1JLvUvVy1xSx4R2HDRO/7gXl2c+8c4mc86wqkyLEWGfTU3iWZdl1GM8i
   9fVo6eTGdCIpYFts8imHYXpMXRFIIXkfy1ZqlEojjAU++bMWtNmvDdn5Z
   SQppV6tcGFp4zhMDb1tMCYM/ZEqxxdXrJNP7oC5ndCUWdeu/EEx9jwCs5
   +RgeymRslkKF1f+dHNwH7qKEaZfXnNIrDoAYI2o5EB4odiSyarpX/Wlqe
   GeouHgnOozxTPYfFoZN4dF1xSLw/dUtRKKS6mJaJgqgrgRaeK9KpG9BQh
   Q==;
X-CSE-ConnectionGUID: iGZ66tPORD+L4OTizisG5g==
X-CSE-MsgGUID: 3axRROHJSjmpspyvnmH1+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62430059"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="62430059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:28:45 -0700
X-CSE-ConnectionGUID: Be/dsJxyT9qz2f8PPp2kTQ==
X-CSE-MsgGUID: 5B+q+cTlTCSGL1NEfKb4VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="178207790"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:28:45 -0700
Date: Wed, 11 Jun 2025 10:28:44 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH v4 0/7] Retbleed fixes
Message-ID: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAGa8SWgC/22PwWrDMBBEfyXoHBlpZUVRT4GSltJ7L6UUSV43m
 zpWkVyTEPzvVVIohvQ4w76Z2TPLmAgzu1ucWcKRMsW+iHq5YGHn+g/k1BTNQIAWGgRH8inzlo5
 8FWoNfmVN41tW7r8SFvua9fpW9I7yENPpGj3Ki/tfyig5cCu9C43S2Ai76aj/PlbUD9hVIR7YJ
 WuEOQ9SglGienxw9+vnp0+z9/t6e4ovZtO64T0kN2DVxeC6X1jNYTkvBy64EQjartEqCDfly7/
 XYc6pwpUNokawEiXejp6m6QcghP8MXQEAAA==
X-Change-ID: 20250520-eibrs-fix-6c452b697dbf
X-Mailer: b4 0.14.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v4:
- Replace the warning message in set_return_thunk() with an info. (Borislav)
- Collected tags.
- Rebased to v6.16-rc1.

v3: https://lore.kernel.org/r/20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com
- Get rid of AUTO check in retbleed mitigation. (Borislav)
- Update commit message to mention the preparatory patch. (Nikolay)
- Collected tags.

v2: https://lore.kernel.org/r/20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com
- Split the ITS stuffing patch into smaller patches. (Borislav)
- Zap spectre_v2_in_retpoline_mode() helper. (Borislav)

v1: https://lore.kernel.org/r/20250520-eibrs-fix-v1-2-91bacd35ed09@linux.intel.com

This series untangles retbleed and ITS mitigation.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
Pawan Gupta (7):
      x86/retbleed: Avoid AUTO after the select step
      x86/retbleed: Simplify the =stuff checks
      x86/bugs: Avoid warning when overriding return thunk
      x86/its: Use switch/case to apply mitigation
      x86/retbleed: Introduce cdt_possible()
      x86/its: Remove =stuff dependency on retbleed
      x86/its: Allow stuffing in eIBRS+retpoline mode also

 arch/x86/kernel/cpu/bugs.c | 93 ++++++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 41 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250520-eibrs-fix-6c452b697dbf

Best regards,
-- 
Thanks,
Pawan


