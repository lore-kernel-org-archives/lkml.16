Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC591A0711
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343527; cv=none; b=l69iLpWbsnxIJGLwUA6serzxkWmNGh+9rIxuvxCTPt3NRcQ/ECE42up5jhWqBzbtU79Jz/qz3ppfgGlj2IlfyYHC+17r+FDZuknjBzbav3PtwHtB/xI8q+0oDQApMakjcECnhV1lDSr6O//JuRkX1tTRMujRDc3HNQgglqWc+u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343527; c=relaxed/simple;
	bh=aCsnSR09CXHPp4CB77ALm9bD/YEFzIsui6DsRWUd6hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhUaCeXOnNrYXz5qJfHoXvoiWF/D3Gebyjvidx6dMOKbROrI1r8xal4MAixJA+iWnX8iw1Vvc9iF1UVKi53ZhyKPhqDzetIwwKi3tOY28TS9y556Uf4nWpEZuTWarYj17sPiqwcD9KIfmBvDlZHG5PFcxESMHG8febgbq63y3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BloDpSYI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BloDpSYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747343525; x=1778879525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aCsnSR09CXHPp4CB77ALm9bD/YEFzIsui6DsRWUd6hs=;
  b=BloDpSYIi7JOiLLwfi0Hnv1PDYpFXx5OzagBC0Kr5K4WkKzY9Um9S5F+
   YTXFj9TVJLX0J554JLADFleszAQ0mgPwUPMJdQgSQ/3+30b54ilKFjFZi
   wzRunXzEaYnb8Beebc32PtFoAkwkfmMokzJRArQT1KfmlJCbz0+HvgUS/
   iIUnJ/qthbq+CebJ2vC8wRLba8IO598OHi8a84ABuvXTV+nAIRPmetsmN
   Crrm74uijX7qbKPAoiAB6IBqGW/b84ysgq0fAMtwxRYZDTXtDVekUFoos
   RHNEfE4P+mGYiCnnpes8Y3pgIAfGmSgRDL3dYnMqcwrU0KQmjTpdDfXOP
   A==;
X-CSE-ConnectionGUID: HI4yY87MQ5ueCubjj9Z5xg==
X-CSE-MsgGUID: /5vIBl+GQ1KdAvEj86/0XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49231629"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="49231629"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:12:05 -0700
X-CSE-ConnectionGUID: 1Y9u3ZAvS/mxJGiMqV2YnQ==
X-CSE-MsgGUID: Yq9hk0zFQz6wHCye34e/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138541546"
Received: from gkhatri-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.13])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 14:12:04 -0700
Date: Thu, 15 May 2025 14:11:59 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
Message-ID: <20250515211159.njyxgxuxmyhqx46m@desk>
References: <20250515134756.93274-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515134756.93274-1-david.kaplan@amd.com>

On Thu, May 15, 2025 at 08:47:56AM -0500, David Kaplan wrote:
...
> +static void __init its_apply_mitigation(void)
> +{
> +	/* its=stuff forces retbleed stuffing and is enabled there. */
> +	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
> +		return;
> +
> +	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> +		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> +
> +	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> +	set_return_thunk(its_return_thunk);
> +}
> +
>  #undef pr_fmt
>  #define pr_fmt(fmt)     "Spectre V2 : " fmt
>  
> 
> base-commit: 04bdd560124ec4d02d1d11ee3abc88d51954d7b8

I am having trouble applying this patch to upstream and tip/master. I can't
seem to find this base-commit in Linus's or tip tree. Please let me know
what am I missing?
