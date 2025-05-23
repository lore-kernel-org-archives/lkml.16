Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94602566
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747963219; cv=none; b=oEY11CeskKGvV6CMIe01AzvDLXWgQELjgBHyuGTkvBbEp1ABjhNp4rfedcoR33MET/3oANBYDlx8h+QgW7nZ3Lef3PjXDBIv/BzaLYMdfpR6j4y9LkF/5qjmh+qNJyEqywfp8Gd6R2UBwJXQLrr8PVgLSqeUkNWi7oEWKIZj60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747963219; c=relaxed/simple;
	bh=YEUaSTQuLP/mHjcUA+52MEhP4sildPgOz1CAmIvCVYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRHNlOKI6QsAQ3G3dMJGC+XdEWepLnpG0Ed44WoZ7ow6umXlKl3+eMSGUW0LG67gMsmOCb99thUP0Vi0lylLwpIe6jDGI3PxPBvZP+LsqmmFT7GqvJ8qCO6iUYCiiBbXzhmRX7Yw3mLjrg34uoojoocdAkBk+o1YyqGlRM+11sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTia1Eu+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTia1Eu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747963218; x=1779499218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YEUaSTQuLP/mHjcUA+52MEhP4sildPgOz1CAmIvCVYw=;
  b=OTia1Eu+1AYbwBuMtfQLCIPadt+NSc0pwehgJVmxG8GXwnvY4FREsPUD
   /YcK8kqJUvkSPlqrGjk7HH6VDpWz9jgq1lmi//Wgt3UfSwdjj9FlR911g
   glW/Yxx91VS3fBBpboXCBoRmx0R5m6agxjIgVa8YkfWGGFOe/A7f4ODQi
   HNTyHWk8j69WKN7SCReb1uu0sNd75Bme6frOB7ndCNQcUPnGVE8e377/7
   51m/z05q38DjVXj1hkdSiHQGMAtn4NkT2+kbCXan6Jk/wXALt8/hLdUg+
   ED8qXK/g3wmWiNiR3Y7vmJ07ZLRY3LqhSVtj3/PfGtZ25RiQl2KAKwnB+
   w==;
X-CSE-ConnectionGUID: qhKaRL5zTw+yOkZdydXzWA==
X-CSE-MsgGUID: sMJc3nsbSo6ZBlhD9EmPUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72540614"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="72540614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:20:16 -0700
X-CSE-ConnectionGUID: 0E4SWFD5RW2hmqqB7QpCqw==
X-CSE-MsgGUID: pCsKkTFkQDKyFD58c8EiXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="146020430"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 18:20:16 -0700
Date: Thu, 22 May 2025 18:20:15 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH v3 0/7] eIBRS fixes
Message-ID: <20250522-eibrs-fix-v3-0-12704e291e1e@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAGDML2gC/22NwWoCMRRFf0WybobkxRjjSii2iHs3pZQk86Y+n
 U5KMg6KzL832s1Au7yXe869sYyJMLPV7MYSDpQpdiWopxkLB9d9Iqe6ZAYCtNAgOJJPmTd04Ys
 w1+AX1tS+YWX/nbDUD9fbe8kHyn1M14d6kPf2P8sgOXArvQu10lgLu26pO18q6npsqxC/2N01w
 JQHKcEoUb2+uOflbnsyR3+cb65xb9aN6z9Ccj1WbQyu/YXVFJbTc+CCG4Gg7RKtgvD3fBzHH7u
 cCiclAQAA
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

v3:
- Get rid of AUTO check in retbleed mitigation. (Borislav)
- Update commit message to mention the preparatory patch. (Nikolay)
- Collected tags.

v2: https://lore.kernel.org/r/20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com
- Split the ITS stuffing patch into smaller patches. (Borislav)
- Zap spectre_v2_in_retpoline_mode() helper. (Borislav)

v1: https://lore.kernel.org/r/20250520-eibrs-fix-v1-2-91bacd35ed09@linux.intel.com

tip/x86/core that has the restructured bugs.c including the recent ITS
mitigation has some disparities compared to upstream:

1. Spectre-v2 mitigation default is IBRS on eIBRS supported systems.
2. RSB stuffing mitigation for ITS is not allowed with eIBRS.

These couple of patches fixes the above issues.

---
Pawan Gupta (7):
      x86/retbleed: Avoid AUTO after the select step
      x86/retbleed: Simplify the =stuff checks
      x86/bugs: Exit early if return thunk is already set
      x86/its: Use switch/case to apply mitigation
      x86/retbleed: Introduce cdt_possible()
      x86/its: Remove =stuff dependency on retbleed
      x86/its: Allow stuffing in eIBRS+retpoline mode also

 arch/x86/kernel/cpu/bugs.c | 91 +++++++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 38 deletions(-)
---
base-commit: 6a7c3c2606105a41dde81002c0037420bc1ddf00
change-id: 20250520-eibrs-fix-6c452b697dbf

-- 
Thanks,
Pawan


