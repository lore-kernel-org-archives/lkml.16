Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5BF210FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687114; cv=none; b=mJ6GGI3VJWaKSGtZ4G98hvKV2U0h31ZZCz0NXseLl4pnXjcm9nVKMQpvKBsFYqhZXHiFpnIIPkwRCEjbGDPuik30xnDtJZacvpWG4tRrqFuYh5FD6x8KmoS03xAGxEQpMM6wgJU6XFT5Nd/xyFo2Hhf3JvApPnjE30BFRyP4lGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687114; c=relaxed/simple;
	bh=Qy+WAD6qwidvTKc5AAMY2Gps0d4LuxHSNmmZhDTIFOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfVY4SfYWaDQaDGF3FmS/pDBW/V+BAFX4izzw5MVsnUNXJ+JuOE+QH9grbu0ArQNyfrnRW+Uk3RA3SK7JAhZ+E5QKkVxB1EnDvPg4XA+jgBxE0p1wpEMjvuLB3O0uOZJE19EiHuBp+Mu6AcHiGTxT3eOG/78Cy56woIc1ICzVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: eDbty31ERHujrhBfn1E2pA==
X-CSE-MsgGUID: HccBqJUWQ5Oqj54JY16VUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32697553"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="32697553"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:31:51 -0700
X-CSE-ConnectionGUID: 4myEwy5jSDKm34R8stvP3Q==
X-CSE-MsgGUID: 9S2/4JkCSCqXQtP0na2pVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131867368"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:31:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u0Kfa-00000008p28-2D1I;
	Thu, 03 Apr 2025 16:31:46 +0300
Date: Thu, 3 Apr 2025 16:31:46 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
Message-ID: <Z-6Nwp5RUdgYt55B@smile.fi.intel.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 02:26:41PM +0100, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
> 
> Found by Coccinelle

Missing period. And Subject should be as simple as

"media: atomisp: Remove ..."

...

Please, send this patch separately from the others.

-- 
With Best Regards,
Andy Shevchenko


