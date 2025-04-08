Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD453217F54
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123496; cv=none; b=UcCxUyjAvrFuPHJ7rsbdpacxEHGDj2fa/NfVmO0wEMmave2AGaR2XlmAdBnXx1VRr3+vEEmpUEaMYFXD91lJBZ2e0w9NckvrAZaqxTjqOQCaJiqxBTUyMqk2PcoA/yDpKdO9Yl49d5IG/EEtGoJ3vjFxpa2qNtN/lP+0i529gq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123496; c=relaxed/simple;
	bh=qKfLUJOVmjIhLZ5rBf6uzzEt80+a0moD3VpVZ5BMQNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBjyab319SwvsR7eYqkkp7h++YDiP5lFEi+fB6aDSFwFxA13hLsPkvtyVkROvLdq2hoMdAfUpCzkPMZrDOjhLn75OCzvvcd8at64ES74KUP75jHhkMhatXDBBVUHjg0kC0PsSSE2aYH9OeHF7NNLZBYSNuHkIPRMG10Owm1cH8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: D44sYblnRa+t9WOKxjchXQ==
X-CSE-MsgGUID: vHHPhFLjQzaUhGWHNX6ukw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="68035629"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="68035629"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:44:54 -0700
X-CSE-ConnectionGUID: GWlHOfUWTo6sn7jOkSFpgw==
X-CSE-MsgGUID: MZP0rQ4JTeON+y0zx0hDVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="129139183"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:44:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u2AC1-0000000AQry-2MQZ;
	Tue, 08 Apr 2025 17:44:49 +0300
Date: Tue, 8 Apr 2025 17:44:49 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v7 1/2] staging: rtl8723bs: Add spaces and line breaks to
 improve readability
Message-ID: <Z_U2YXpteKmxXriG@smile.fi.intel.com>
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
 <8e582c7166200e618ff56ec10ed16b4a4e73eece.1744117091.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e582c7166200e618ff56ec10ed16b4a4e73eece.1744117091.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 01:31:41PM +0000, Abraham Samuel Adekunle wrote:
> The code contains no spaces around binary operators with long lines
> which reduces readability thereby not adhering to Linux kernel coding
> style.
> 
> Add white spaces around the binary operators and use line breaks to
> increase readability and ensure adherence to Linux kernel coding
> styles.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
See one nit-pick below.

...

>  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
> +							(tx_seq + 1) & 0xfff;
>  
>  						pattrib->ampdu_en = true;/* AGG EN */
>  					} else {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
> +							(pattrib->seqnum + 1) & 0xfff;

Probably it deserves a blank line here as in the above case.
But it was in the original like this, so at least it not worse
than that.

>  						pattrib->ampdu_en = true;/* AGG EN */
>  					}

-- 
With Best Regards,
Andy Shevchenko


