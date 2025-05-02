Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9819E97B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195390; cv=none; b=IPKIWvvv6ejSklR0kN/Z2RmrjIbK4zbqy6uaYtspl/PmP3H8sZjTstsfe1QmqBVMmAnIM5ENwINPQIXx014ABkvNm9KtRaEHSISbSJ0i799/mCUrO6JIFWno+S0whDtcfRafwzekKPSq8S0Tjry1mlS1ig+ag9Mhlq3lnvKAAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195390; c=relaxed/simple;
	bh=6T1876wvbcbG8AOYxOGoCfN3fLqM0OcZr5nT1lQMJr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCC6tqZBM20ftkCzOR3UBhteoS2WjS5mIInUSZzYlK0AuIJRqZsLoOepBhJYniUr/rg3xWavqUdXJFhgXNdkHKC8B8rND3p/w9Pm0Ob7OXjQW8/HJJiyAbTfkWIJFHeQvJNHOXEyc9d8i7vftqXdM3svRju1W8pBzUY5miNDVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzNuR9B7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzNuR9B7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195390; x=1777731390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6T1876wvbcbG8AOYxOGoCfN3fLqM0OcZr5nT1lQMJr8=;
  b=gzNuR9B7GSN7XAVNNlGTG5Vs+qsrfgWuzwvQp7bTV5V72N0cCU8GLBnx
   Vx1uAoertMF7JqRACrPPmRNbJrmBE64wli6LxlAKKSvZ4n0sVAFU1L7O2
   tki4+Hicgy8rUTZJXJ979EWdD3sfRvsQFvYoEvpYby42EvkOJbu7bLsSX
   o9/pCIh63NDYUqR+nZAhmQBSn+Pumcs5MrM5iTzq6HsybxwSZ8/cqYvdv
   daT7UzkBdGRBYsAAsh8fOWnfG9/HDI3ZQfqP3p+fXfmlowq7eXY6CSMdK
   pGuirBtnbby19Ihv7sXWXVrIOKZwBlvZ+TprVaGaztDJn6NdPDZFMVLOY
   w==;
X-CSE-ConnectionGUID: v+DWoPtNST6jn12D8pYlaw==
X-CSE-MsgGUID: m8EHKzYTQl+X81C5x/CVFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58085256"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58085256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:16:29 -0700
X-CSE-ConnectionGUID: tmyr955KQceMFFzPjexz3w==
X-CSE-MsgGUID: CyaFM5uYRxy20T3bcEXejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135161988"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:16:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uArBf-00000002Dng-3Vxx;
	Fri, 02 May 2025 17:16:23 +0300
Date: Fri, 2 May 2025 17:16:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Oded Gabbay <ogabbay@kernel.org>,
	"Elbaz, Koby" <koby.elbaz@intel.com>,
	"Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <aBTTt0It5dopMDNO@smile.fi.intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com>
 <87zfh86rqi.fsf@intel.com>
 <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
 <Z_zeUAW7u8UgmEOo@smile.fi.intel.com>
 <deee9bc9-6af0-46fa-af50-866c58ddf7ad@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deee9bc9-6af0-46fa-af50-866c58ddf7ad@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 14, 2025 at 07:47:26PM +0300, Avizrat, Yaron wrote:
> On 14/04/2025 13:07, Andy Shevchenko wrote:
> > On Sun, Mar 30, 2025 at 02:15:50PM +0300, Avizrat, Yaron wrote:
> >> On 26/03/2025 11:55, Jani Nikula wrote:
> >>> On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>>> +Cc: Jani (sorry, forgot to add you in the first place).
> >>>>
> >>>> Do you think it's applicable now?
> >>> Cc: Yaron, Koby, and Konstantin who are supposed to be the new
> >>> maintainers for accel/habanalabs.
> >>>
> >> Thanks for the help, We’ll verify this change in our CI/CD pipeline and update you ASAP.
> > What's news, please?
> 
> Recently acked and merged into our repo. Will also push upstream later on.
> Appreciate the relevant contribution!

I still don't see in in Linux Next.

-- 
With Best Regards,
Andy Shevchenko


