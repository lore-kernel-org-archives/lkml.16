Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0C23505C;
	Thu, 19 Jun 2025 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750347545; cv=none; b=DVcEObZIdzg9ARWqnmd/VThk+R5ZOsCwlsmucuYYfvUZcrN+r68mqJZS7IkOSY1chlySOkglWdOcSzolL6J2AKzOshYM9UwDjqI3DhCRX/VXT4MBjtwcG+JElT3gLVnK1SCk6D8eGA88WhWLaYwvvejX2UnPIsVytm/pp3/8ny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750347545; c=relaxed/simple;
	bh=qWn0uC6liADYd2fNdSq+3xV/EBcjTFETNx8WJJKkQs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUEMAvjJkvxsEfEgIVQQmsQRnsOADyR2TA4FNEgjyHbf0LQyySQik8wvSZb9MOVLclgiGAilpkhC+n2mUSNnxECIECVWollVgL+ewzvdJcrrZP6W3nfMCX18WOMTFg82pz4wBMUCFUhPfK6VsP+ECVHaqYlzi+FF1V4HaRW9RvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzDP5Tb5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzDP5Tb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750347543; x=1781883543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qWn0uC6liADYd2fNdSq+3xV/EBcjTFETNx8WJJKkQs8=;
  b=RzDP5Tb5cnQ/jjoX7H4QA2RJJ0NMCvPwzr5dRdYpw4wENYig9FIFtYxh
   9ZSRsM9lJGeRWTLRdwmQR/+eqYW71iHyQt6Kg5ElBwDCyX3OaZA78csda
   3Bpz30a+JP/y+qONB2Xwy1Td634FGr7dvWNO5S+3GRQatiujd6q7EuviJ
   FNN4VmkzUyDQ0qD4eIUn2OjCCtOMf0OGmifi1lsPUGAcMn7dmomwsde4a
   nTJ+SjH1xs1dFviQBdlnMk/stYT7oj5rcQE5TdIQi2nqvDxZfQv3zVaZT
   NF4nOTm4UDIiYBVckGgu1WneDzKLd40qTlkabNM4zo5r4LSQPftry5yPL
   g==;
X-CSE-ConnectionGUID: oi+EaJQSRwGWA7nRX2eD1w==
X-CSE-MsgGUID: b7TIwGwDSkGnAG5US4UEXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63292231"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="63292231"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 08:39:02 -0700
X-CSE-ConnectionGUID: 3ILzQEcaQaiYnVu6ZkqivA==
X-CSE-MsgGUID: 8X0c9595SEmHRw8t/GFiVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="156479039"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 08:39:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uSHLu-000000086j1-0lUv;
	Thu, 19 Jun 2025 18:38:58 +0300
Date: Thu, 19 Jun 2025 18:38:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: perex@perex.cz, tiwai@suse.com, phasta@kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ALSA: intel8x: Why incorrect codec index used setting
 ICH_DI2L SDIN
Message-ID: <aFQvEYdQfiJn-29o@smile.fi.intel.com>
References: <20250618191929.2382821-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618191929.2382821-1-alok.a.tiwari@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 18, 2025 at 12:19:21PM -0700, Alok Tiwari wrote:
> Correct the index to use codec[i] to match the loop iteration, not codec[1].
> 
> Is this a mistake or intentional?

You marked it as a BUG in the Subject, can you elaborate more, please?

-- 
With Best Regards,
Andy Shevchenko


