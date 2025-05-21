Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC4381BA
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747805707; cv=none; b=Iodg4DH3Jm4lFJn43ooukKWpRCLVuUODk8D9mKQCMIgp+k2DwTxx+olJN8zyKmzpnLBS+ZBUbLl+5vGOWhoBjpHfOVxRL3DyBednqEYl+feLXJ1Y6+p2ZRiYqmbm5Nf2jUVvbaMnRPkcwhjWQDIkreaWOjt2PzZqelOR33Ccb0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747805707; c=relaxed/simple;
	bh=nbRBmLQJ/sS83FNFaw3HUtMqWrzXnQYs4/zhd0vRRbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tl48ohFKSOiQ3H1sSi/RMErxNHmZSib9Gru0uqHB6bgkssRJBvCUPtzuZ9EI3b3VdX1CjB1TgS4ZIqjsdCAtrT5BW4G5mhhzzGMdXdrPLQYmdX4885qpwmGTrfWYFS7IXIy1Di/hEUa2hPHvKWr6F8ypIM/WQV0PvnpXDRnkesM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhyGwMlV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhyGwMlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747805706; x=1779341706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbRBmLQJ/sS83FNFaw3HUtMqWrzXnQYs4/zhd0vRRbY=;
  b=fhyGwMlVdeOqngAHecstdxViSlv+fQsHumoirzv0D4sVqJdirIJwcp1v
   2rbnmzMVv0K4nRR/Sb6/t5rOqusXQNfufn2424EgzGNnwMR3CHdf945ZY
   DOLmnimEfTWmoeO89Tvu71MIyJFyw084XexJOE7xujWGdJnOr6vCE61qz
   Yxdvui+2OYtwig48uQa4LEHeTz/EWkOStqgqrpxbl2SARuh6pwRZhgVsv
   wwbpgkLfMO8XxwBJRH/QBwWNUiK7SLdLs/BCcePLgCp0ccE9ZlUPVxc4z
   Xel2+n61o6YoUMz1tWP/m0fWKjyOXlSMjMWWA1FzihQE6AIZWGN33qnBC
   w==;
X-CSE-ConnectionGUID: hcujqtDhSNui6IEaQIiRVw==
X-CSE-MsgGUID: Es4vRRKGTc2NfSuDqfvsCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37383376"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="37383376"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:35:05 -0700
X-CSE-ConnectionGUID: 6ezdw0IyThCxHQwsAu/93w==
X-CSE-MsgGUID: SZB/OzbBQhG2EKln58B0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170919535"
Received: from nsridha1-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.22])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:35:05 -0700
Date: Tue, 20 May 2025 22:35:04 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 0/2] eIBRS fixes
Message-ID: <20250520-eibrs-fix-v1-0-91bacd35ed09@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAGFhLWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMD3dTMpKJi3bTMCl2zZBNToyQzS/OUpDQloPqColSgMNis6NjaWgA
 PXM8JWwAAAA==
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

Hi,

tip/x86/core that has restructured bugs.c including the recent ITS
mitigation has some disparities compared to upstream:

1. Spectre-v2 mitigation defaults to IBRS on eIBRS supported systems.
2. RSB stuffing mitigation for ITS is not allowed with eIBRS.

These couple of patches fixes the above issues.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
Pawan Gupta (2):
      x86/spectre_v2: Fix mitigation default on Intel
      x86/its: Allow "=stuff" mitigation when eIBRS is enabled

 arch/x86/kernel/cpu/bugs.c | 104 ++++++++++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 35 deletions(-)
---
base-commit: 8c57ca583ebfe879f99007d10c8f2b66baa18422
change-id: 20250520-eibrs-fix-6c452b697dbf

-- 
Thanks,
Pawan

