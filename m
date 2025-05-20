Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727C21CC70;
	Tue, 20 May 2025 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738501; cv=none; b=HtBRyB6exFZJh4ymEoRCAMA/rBKc0PfS6t9BOaAzi9Gr3IaZtbSSGivbEJUYp8U5sbWfDrH8ykjDBLPOba/01C26JJrzXNm1IpMsRBGZuvxHoeBTVevMRHK3atnSPuR8Q6LTAwRE98Rm3TNWS8ljdMJ2XxfppKmFi0roPCJ9m+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738501; c=relaxed/simple;
	bh=IONcLLIKAUAdYyDGYnYKRYYYv3wWmgXCXbOAobNUA9g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sUvEdQrjS60mDS10gnt9xgIph/J33Z9nDZChhDmnSzxL8iPmZ7ajbdw7htaXtiXxHdHqJK4jHsg2q8UK1ZV7oe6bjvKH7TTbRDspcVSQ9ItsGTY98Rit1mRikOzVAPL8w7WzbkgJwzq6aZ6Lpj6/g0DY5dphqidpI0oLAR7UKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfN0nf8k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfN0nf8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747738499; x=1779274499;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IONcLLIKAUAdYyDGYnYKRYYYv3wWmgXCXbOAobNUA9g=;
  b=kfN0nf8kxYcJDOtnAPQP2Pk+dZ4EgT7/5NW7l/foK81Flrk4WK0kp6YO
   I4+DFuX4mh30EQ2FBQaAX9LjqySTu6bb9ES3IsHo7sJ/tv04uH39nunqP
   FAcnlTmO6IImqlscoQhOp8DE52thozD4QS61Jg9al/H2a8JGDgceAqBlM
   OEqqW8fJMHBVg5mKisFbWqQMgI0+liFaImWq1hzGSxAovvNsec+brB/Ec
   Omqc1IXLlnYaCG4F0iGKoFrxJI8ovA8hOEK9RuHHCE+rhkNH6VKrK+bzK
   0mII6Gtio9nIPmSSHo0YBymwcVwV+8/ZkRliKraErrMnjNI2uV58pDV6R
   w==;
X-CSE-ConnectionGUID: Qev24EWdRG2s2Og4E11VcQ==
X-CSE-MsgGUID: Q2+qqxn0R7ybk+azrlpMiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53466523"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53466523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:54:58 -0700
X-CSE-ConnectionGUID: iF/CkhAwRPaykge14xm67w==
X-CSE-MsgGUID: ta1S8/pbTA2IPAnIAqafhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="162962005"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:54:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 13:54:53 +0300 (EEST)
To: Todd Brandt <todd.e.brandt@intel.com>
cc: platform-driver-x86@vger.kernel.org, xi.pardee@linux.intel.com, 
    LKML <linux-kernel@vger.kernel.org>, todd.e.brandt@linux.intel.com
Subject: Re: [PATCH v3] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
In-Reply-To: <a61f78be45c13f39e122dcc684b636f4b21e79a0.1747737446.git.todd.e.brandt@intel.com>
Message-ID: <360ee90b-c83a-b4de-f864-88ec90cb0648@linux.intel.com>
References: <a61f78be45c13f39e122dcc684b636f4b21e79a0.1747737446.git.todd.e.brandt@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 May 2025, Todd Brandt wrote:

> The ARL requires that the GMA and NPU devices both be in D3Hot in order
> for PC10 and S0iX to be achieved in S2idle. The original ARL-H/U addition
> to the intel_pmc_core driver attempted to do this by switching them to D3
> in the init and resume calls of the intel_pmc_core driver.
> 
> The problem is the ARL-H/U have a different NPU device and thus are not
> being properly set and thus S0iX does not work properly in ARL-H/U. This
> patch creates a new ARL-H specific device id that is correct and also
> adds the D3 fixup to the suspend callback. This way if the PCI devies
> drop from D3 to D0 after resume they can be corrected for the next
> suspend. Thus there is no dropout in S0iX.
> 
> [v2 changes]
> 
> Added Fixes line
> 
> [v3 changes]
> 
> Xi asked that I see if adding the arl_h_suspend call actually made any
> difference in fixing the issue of S0iX not being achieved, as there are
> 4 other platforms that use this same fix in just the init and resume
> callbacks. Upon further testing I discovered it didn't matter. So I just
> simplified the D3 change and left the fixup call to init and resume.

Okay, I've replaced the commit in the review-ilpo-fixes branch with this 
v3 patch. Thanks.

In future, put that patch vX history under --- line so I don't have to 
manually remove it (our tools cut the text below that triple dash line
automatically).

-- 
 i.

> 
> Fixes: bd820906ea9d ("platform/x86/intel/pmc: Add Arrow Lake U/H support to intel_pmc_core driver")
> Signed-off-by: Todd Brandt <todd.e.brandt@intel.com>
> ---
>  drivers/platform/x86/intel/pmc/arl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
> index 320993bd6d31..f9c48738b853 100644
> --- a/drivers/platform/x86/intel/pmc/arl.c
> +++ b/drivers/platform/x86/intel/pmc/arl.c
> @@ -681,6 +681,7 @@ static struct pmc_info arl_pmc_info_list[] = {
>  
>  #define ARL_NPU_PCI_DEV			0xad1d
>  #define ARL_GNA_PCI_DEV			0xae4c
> +#define ARL_H_NPU_PCI_DEV		0x7d1d
>  #define ARL_H_GNA_PCI_DEV		0x774c
>  /*
>   * Set power state of select devices that do not have drivers to D3
> @@ -694,7 +695,7 @@ static void arl_d3_fixup(void)
>  
>  static void arl_h_d3_fixup(void)
>  {
> -	pmc_core_set_device_d3(ARL_NPU_PCI_DEV);
> +	pmc_core_set_device_d3(ARL_H_NPU_PCI_DEV);
>  	pmc_core_set_device_d3(ARL_H_GNA_PCI_DEV);
>  }

