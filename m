Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D6B21B9CE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123561; cv=none; b=Dqoc8w9NUvoWLzwUyUI87uaEQCyHDD03/eBoDKM2A0meNxiivaxwKaLb92yWsX7v1x8n15Q9bblCRTxKXOvttBAo9mCosSdIS8mljvYpqBwfOOW+AkmSwzxrHU2XHETLGNTQnAz3zuiGxyDHaUOYu72KBCg44NhhUKOiV9Wu9us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123561; c=relaxed/simple;
	bh=17fijlTA6G2rC54COCxtVkROxnoz5A81tNXJFlfQFXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unqX/dVRr5k6KrKWNxlo1PVXB0vmJb52qnWoFnPX8jWrHzdQBqEHAVWTmJN1zB59Qv5NawjeddqeW+w1EouEzKW73Oxvxl+MFwvt5DW7ZiMabFUwq3J/09fGI89QPTryo8Jm/9T4gUM/yObs+Z3kYEGEXgHodQQsJT5SZsHaD/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: d3BAO8bURy+x7OdIMnnVRw==
X-CSE-MsgGUID: E3g+jDLaScKjLXgOpmV2vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44810778"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="44810778"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:45:59 -0700
X-CSE-ConnectionGUID: Hz2DcwVpQC6GxDPorRrIyg==
X-CSE-MsgGUID: 3lz9O+qMTKyhgddI2NLRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="132425284"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:45:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u2AD4-0000000AQtH-1qKX;
	Tue, 08 Apr 2025 17:45:54 +0300
Date: Tue, 8 Apr 2025 17:45:54 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v7 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <Z_U2ohN4wbbOtepn@smile.fi.intel.com>
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
 <c71ec1f13a2a5cc38a745314f134f6e7eb935227.1744117091.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c71ec1f13a2a5cc38a745314f134f6e7eb935227.1744117091.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 01:31:42PM +0000, Abraham Samuel Adekunle wrote:
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `& 0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
> 
> Using a modulo operation `% 4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the
> sequence number cycles through a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power of 2 value while

power-of-2

> the AND(&) works solely for power of 2 values.

power-of-2

> The use of `% 4096u` also guarantees that the modulo operation is
> performed with unsigned arithmetic, preventing potential issues with
> the signed types.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


