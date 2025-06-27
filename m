Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F62202C50
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020549; cv=none; b=qxSBrI5Sj4joJw6jmKT6ZhCY9IyRKKWlp8krEYH+GiSmYj3zsdLw58Gcj1F7qmsQsRvZqT0kGuU8fYzw6ND2caocFb3NzeV01ZG9TrENe0UhKBrImIw/Z2SOqU4zawnHvQiabE+JiK0gM+fkL5bq3gBZgpgYJxwe+tScEDKDups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020549; c=relaxed/simple;
	bh=RBwREQBixIDQ0GRomdtUv7pq4DezZSE5nCsK6+dpbcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCPLu62nPVZBSR3AF8aqQRmOIU2HKqOrMLMSHIV7JSGSYXQfO1lpTRnFg95KUXJQeON7J7s4L7ytit9uAXsk6hy6KKrl0X7NdwPey4PyPG3MYGCxru8SAyuzA9jj/oDapm/EGNB4nr6pjb4i5htLjom3objUEgOTLnwbsxekujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yhqk2rvF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yhqk2rvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751020547; x=1782556547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RBwREQBixIDQ0GRomdtUv7pq4DezZSE5nCsK6+dpbcU=;
  b=Yhqk2rvFXg5Jwk4gKCh6sjDuHx2xaMhePpGYG8bgc+SXpNmlz/qKlj1D
   iI9KAEvgTnhFjz0ghu7iQp7Pwdb1l09WR3+K5hUmSBrfq5WXWKNr4yif/
   bN8gOKL5ktlzvdiCLLyNh6JnDNwKxyWSmBuaxhSvgNFY4RC9d02VsRipJ
   rndsjZ51BHREyn1BZ6JlIElIlfEJj5rpIf1cVzN0mNT0/u+1/+E6aCCY3
   3qRnlC7R74J2eVL7nLbY4gwnSSFr75e5DFu/aYasV8INl3HOHzSvkjylx
   GtPrl47+URZBfBEvwokqw8WIhKYlANiP/nvNuE7P/CCl9K4++C2n8EUfr
   g==;
X-CSE-ConnectionGUID: 7nAlKNYzS3S/CLGByvAKIQ==
X-CSE-MsgGUID: zTRJ6HvNRTCWSyeQJGyQrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57010774"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57010774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:35:47 -0700
X-CSE-ConnectionGUID: XCK+x/mlTfe7Msiz5haSxg==
X-CSE-MsgGUID: k7OyMBZISJSub/hMyWskeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183667166"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:35:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV6Qp-0000000AS8q-0AjC;
	Fri, 27 Jun 2025 13:35:43 +0300
Date: Fri, 27 Jun 2025 13:35:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 2/2] firmware: sysfb: Don't use "proxy" headers
Message-ID: <aF5z_pS3y6howWhn@smile.fi.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-3-andriy.shevchenko@linux.intel.com>
 <87frfld0uc.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frfld0uc.fsf@minerva.mail-host-address-is-not-set>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 10:51:07AM +0200, Javier Martinez Canillas wrote:
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thank you for the review!

I just sent a v2 without first patch.

-- 
With Best Regards,
Andy Shevchenko


