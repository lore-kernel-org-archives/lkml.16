Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358512046A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662974; cv=none; b=Y3ddPRz5+6ERLyqxOjpxgF0AfasdVuFwmkne+5Nhad/n+h/u8FLOgP+neReJYtQ38gQaskXp739L9tD6oDcVOyFtqvbh5bUYhwjjnOMVx0E0V7F1yXOP1+DibVgDlvjL3EyrUxBl2OFV7E8zYvsjizl0uhy4avPD5Abro7cNdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662974; c=relaxed/simple;
	bh=XlirVStJyp27HTjzZL8NXGgIh9P9fk+Fj9BTIVpT8bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hraA/Jc1n47cuksK+RLjsF3FsV/wh0Vd/16TneM5APeBT4HiUBOJVKjEsqQbggwuKfbccaWwT1XjJnM3z4Jc+W3LRN+7u63xcmMqCosq45lcvaxi5fBxHbMM2yCa8k4GpivpjNXiluXX3nJJb3Ii6PyUmpuqe0nsfPSnBI7Pxtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAJTzExi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAJTzExi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749662973; x=1781198973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XlirVStJyp27HTjzZL8NXGgIh9P9fk+Fj9BTIVpT8bE=;
  b=WAJTzExiM1buO38ML1n4+4HPLHtaOTEWxsGJFvFxpCnUBXh0Dy3wFx+t
   LQaTHa0vN8qyeNZu2CEL3xmxoVnU0cZyLk8fosv7GEPhu9aP7xGe4CoA3
   hYKWAGuPbN1P9lU0R56eLiZ8LhztQHH/vGmDIN6b2rMiJkJCrUiy7xCbD
   3srHEbtBRWtqZwnNDDd3O8MupmR9b/KS0RADLC7oVVsiXUx0WHwjViam5
   rokF+f+55SZ/rGrcNfLguCO27iC7JX20vM/k92EJzF+27M1+F9qiS2Pio
   FKLOOz0RY/SnDx1uSJ1j/hc65p+UZmiDZaNZcf14CJYw+L8vJHKraufNF
   g==;
X-CSE-ConnectionGUID: oeFdt8VwS36eeq7T1pBirA==
X-CSE-MsgGUID: pgHGaEZ6REi457FOew2JDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55611795"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="55611795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:32 -0700
X-CSE-ConnectionGUID: qHBM9yx+T+64jEmavjwhHA==
X-CSE-MsgGUID: JzzYVMnSSKOpVmyqlFd2qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="148166549"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:32 -0700
Date: Wed, 11 Jun 2025 10:29:31 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH v4 3/7] x86/bugs: Avoid warning when overriding return thunk
Message-ID: <20250611-eibrs-fix-v4-3-5ff86cac6c61@linux.intel.com>
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

The purpose of the warning is to prevent an unexpected change to the return
thunk mitigation. However, there are legitimate cases where the return
thunk is intentionally set more than once. For example, ITS and SRSO both
can set the return thunk after retbleed has set it. In both the cases
retbleed is still mitigated.

Replace the warning with an info about the active return thunk.

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 94d0de3e61aec32b3b67c8d21f89a8c67b93dff3..20696abd1bef90aaf852fef1299b93d27c1f4da6 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -113,10 +113,9 @@ void (*x86_return_thunk)(void) __ro_after_init = __x86_return_thunk;
 
 static void __init set_return_thunk(void *thunk)
 {
-	if (x86_return_thunk != __x86_return_thunk)
-		pr_warn("x86/bugs: return thunk changed\n");
-
 	x86_return_thunk = thunk;
+
+	pr_info("active return thunk: %ps\n", thunk);
 }
 
 /* Update SPEC_CTRL MSR and its cached copy unconditionally */

-- 
2.34.1


