Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008351F5849
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530796; cv=none; b=TDvGg9cdpfVMfuguFDhcoVllu4j3t/0swMD+Wy8fszBno1NoKtLHaxpvpy2QO7ApeSDP9j5r8EMF36JnlIDwkBuYJDOWlG6ey1aEPzg7Yd4O9yBeCzUrk6C1hzXNbtSVV99BvTHBxX1my9zkljo7GreOWgSgDof/s+mgEuXMrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530796; c=relaxed/simple;
	bh=L/0tBLvdotzSr0mCCXPOKmtUk90V1JFkS32z0UASBow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3WBiUp4UviyJesRz6igSuw4eVsDGP9oZl2H+QCsMjKOvPAHgulnw8SWpgWErghX/ghZSchwFR0nVZV/qZx+l3YDeIAbnHjrEiwmJKa2xOvXD45fnE+ImAplgb7jVkdNIRmuvLjKjg3tq4cJIkIH0BGMwK3DAols30O0eZLobsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktWPFT6x; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktWPFT6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746530795; x=1778066795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L/0tBLvdotzSr0mCCXPOKmtUk90V1JFkS32z0UASBow=;
  b=ktWPFT6xpA3kW6fa0Fd0ooJM64nUkYXqktJeNgn/zstMtFmFPxJ8wLf1
   EHxC8JckuDHxrHC0y31MIijqn+PHYgXutl619wOz2CiW65Y0N/BeMXnBo
   +B8DGfeyaQkcIA7y16jEjd7D0FfXiG3PsEksp8kucI2IZRgy5aSKRLD9y
   xR4h3/3ap3+mnJjLRcSQ+LzRtfEQali0TCVZ2eeYFPNms7etS9hy5423s
   XxF7h727Si+sZuG8qSYIAriyQeGFfTxo2DBDDFAWzIIzazpGaJSMDfe6N
   DTX5YuFdGTcJb3y4o+7YvM1JpFNUWbXXx4yWhqlKploHIaLsOZakh8eMK
   A==;
X-CSE-ConnectionGUID: Red3AQFiS5a2ATLlPbC+hw==
X-CSE-MsgGUID: dxZJdWgzRQCghgj/xNQSUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="65728324"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="65728324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:26:34 -0700
X-CSE-ConnectionGUID: huj7syngT8+YpRhNHSd7Ng==
X-CSE-MsgGUID: RLG6kC3VTNy+lTIri76euw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="139647495"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2025 04:26:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id A4C3E199; Tue, 06 May 2025 14:26:30 +0300 (EEST)
Date: Tue, 6 May 2025 14:26:30 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, xin@zytor.com, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/6] coco/tdx: Rename MSR access helpers
Message-ID: <ytnvnsmpx3l4hauayhaerhkj7n6gm6z4thjpv3fmtw2pnwfjwt@5exu3imowllb>
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-2-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506092015.1849-2-jgross@suse.com>

On Tue, May 06, 2025 at 11:20:10AM +0200, Juergen Gross wrote:
> In order to avoid a name clash with some general MSR access helpers
> after a future MSR infrastructure rework, rename the TDX specific
> helpers.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
