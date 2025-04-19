Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328A19343B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079912; cv=none; b=KWB6R0BNrIpRIgJIMl3dnT0x5oCQHvZgb9i5Ss78qyl7VJisNpB7QNVrCg67iJ2x1EHMSDnlCXdgtedJbH2lh9N7VQOgh8ezwDA8/6s5x2KGxfNJIzmDUugqcrRpoxBMMPsifrP41o7ICfc+O+lLxYg/UhsuuV9f7tcs9OB0fdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079912; c=relaxed/simple;
	bh=ZCTbZYsz3i673XjwYNGUdoYKgUhBD5x8hbDix4gS4DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYOe6bDf8qX+7ztHQbRfGw65mJSeiJjTWhtlEM3xN9J03TskGehgj+sKkbB1CBZ5V7zu+lqEmPZoG6bsTV0YQPr+pE8V/r8yptzcxdQJhB1Lg7w1LwxzXsg5SCLfmF/3pgC/hCA1Kh5NEcLcO10Ny4sPW+HguiAb957i5CAhwrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: BygiXtrURQmhK/mOr0UhOA==
X-CSE-MsgGUID: q4gxoHZeToCmHh9QaCYtQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="34297472"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="34297472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:25:11 -0700
X-CSE-ConnectionGUID: e2+yuJEHRRm1I9Etldu8ug==
X-CSE-MsgGUID: Rw/4HmKVTTCmLUkwaJcpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131889650"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:25:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u6B06-0000000Drda-2NxT;
	Sat, 19 Apr 2025 19:25:06 +0300
Date: Sat, 19 Apr 2025 19:25:06 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: julia.lawall@inria.fr, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v6 2/2] staging: rtl8723bs: Prevent duplicate NULL tests
 on psta pointer
Message-ID: <aAPOYhdJoD23b4np@smile.fi.intel.com>
References: <cover.1744990405.git.abrahamadekunle50@gmail.com>
 <4fb8314f1ca4c273a1f2c2f648c7993d7708224c.1744990405.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fb8314f1ca4c273a1f2c2f648c7993d7708224c.1744990405.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 18, 2025 at 03:41:57PM +0000, Abraham Samuel Adekunle wrote:
> The psta pointer had previously been tested for NULL after initialization,
> as seen in the code below:
> 
> 		psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
> 		...
>                 if (!psta)
> 			return _FAIL;
> This makes a second NULL test on psta unnecessary.
> 
> Remove the second NULL test on psta to avoid redundancy in code.
> 
> Found by Cocinelle

Missing period.

P.S. Here the commit message is fine, however misindented
(check the indentation).

-- 
With Best Regards,
Andy Shevchenko


