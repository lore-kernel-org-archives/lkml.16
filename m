Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30E6FBF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881849; cv=none; b=coBbkvRE1W9VLj4L5Y0Kc5tC5EnF24FaoZgxtPJOP2T16Sb1BzJL98n9RqrZ86Vc5BtAWrXDg0JiztUjk8v4xtLFBCrFF/3Hk2K4VVzsVo3XY1pgD3w12tSbljNSLBMlTtvwfcaQattR3qL/iPHy1eROB54XQp7lgpx4F65paRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881849; c=relaxed/simple;
	bh=KZWu+0mzo9TkmN9vMG55xKhaPdxWxRi6MrwSpC4A030=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YU3gB4UaJvp0LHIxGiL1YumhChHTWXFZwOJDJOPgpTuhEJrTuqE6uX2f5nbR+ubNVuowfxrMvTBL/+TCm6R8hR8gQEyoTdxBWMByetGmnt6p8H0jT3a8vCCCW4PAtV5tp0sQPpSoBXsEyZZLYBF2VAKNrgdS7Gl0TPzMWIeQ7Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPgV0hBE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPgV0hBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881848; x=1779417848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KZWu+0mzo9TkmN9vMG55xKhaPdxWxRi6MrwSpC4A030=;
  b=RPgV0hBEFgXlN/WoAkitv/DKiCy71JXMsfr8HnaLplfhax/KCr08vYc3
   BMcMYEjHUrv5yFP3Kt6wpYhiOHQvAJPFj9uuNYfMBW83EfdcgMLSfX2Oh
   buEW4MHsZqPL2jL+8XVsgLGf8bzrwz3JYidlkJxvANHjktfNmilTwNnyR
   cRnu/S+xN1KxtObCN+HUcr4G2Ew9jDkXOSGOz+qCqKmM2r0GxfWmumoOQ
   Lxeal0NppWlcScYTTRm7VNthC9Zin+C/seVeGDIZGKljSqhLgscfqXbpB
   XztH6vzYKFdGSUBkC6/D4x/KZzb1pmzqhy6iTFGe5dEFMBFKx4NwHc11F
   Q==;
X-CSE-ConnectionGUID: TgPUeuhfTzCkKYn59b9haA==
X-CSE-MsgGUID: TQl1osU/QAmiTF3x7mnEfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60524348"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="60524348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:07 -0700
X-CSE-ConnectionGUID: 2ClU40hbTdCiIj2knv4qSA==
X-CSE-MsgGUID: qgUOZtU2QwKQxmtQKEX1mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="177534669"
Received: from ssuvarig-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.23])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:44:07 -0700
Date: Wed, 21 May 2025 19:44:06 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH v2 0/7] eIBRS fixes
Message-ID: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAL+NLmgC/22MQQ7CIBAAv9LsWRpAqcGT/zA9FNjaTSo0UElNw
 9/Fnj3OZDI7JIyECW7NDhEzJQq+gjw1YKfBP5GRqwySS8WV5AzJxMRG2lhnL0qaTl+dGaH2S8S
 qj9ejrzxRWkP8HOssfvbfJQsmmRZmsO6s0HF9n8m/t5b8inNrwwv6UsoXYBcfUKgAAAA=
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

v2:
- Split the ITS stuffing patch into smaller patches. (Borislav)
- Zap spectre_v2_in_retpoline_mode() helper. (Borislav)

v1: https://lore.kernel.org/r/20250520-eibrs-fix-v1-2-91bacd35ed09@linux.intel.com

tip/x86/core that has the restructured bugs.c including the recent ITS
mitigation has some disparities compared to upstream:

1. Spectre-v2 mitigation default is IBRS on eIBRS supported systems.
2. RSB stuffing mitigation for ITS is not allowed with eIBRS.

These couple of patches fixes the above issues.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
Pawan Gupta (7):
      x86/retbleed: Check for AUTO in all cases
      x86/retbleed: Simplify the =stuff checks
      x86/bugs: Exit early if return thunk is already set
      x86/its: Use switch/case to apply mitigation
      x86/retbleed: Introduce cdt_possible()
      x86/its: Remove =stuff dependency on retbleed
      x86/its: Allow stuffing in eIBRS+retpoline mode also

 arch/x86/kernel/cpu/bugs.c | 82 +++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 34 deletions(-)
---
base-commit: 6a7c3c2606105a41dde81002c0037420bc1ddf00
change-id: 20250520-eibrs-fix-6c452b697dbf

-- 
Thanks,
Pawan


