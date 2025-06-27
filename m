Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33219F461
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025619; cv=none; b=niZkl+WibXk3xCdp9Wq9cjy0KilYaPUxueIucfEpJb5GGtf766g8C5KhUewZhS1YfGqWkopMPCiseN6ALV4YDI78Q3znh47acm78o+IkqlIFo14q1yxP2LXIDbMiVsXQkWQmSXwvd2WVDUw76+qmBAxTDu+bhSvB/OQFcDBV7Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025619; c=relaxed/simple;
	bh=909P6nH0p1HOpbVXQE7Al8zLxx5mdQNGBOcx64yDYLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzYPz8YhpA6N1QhxPhh0byMcOppSaD56rNkTqnyiCGtmZYGXgBwQ+b/Cn+HT8d8lYW6hw1ERDqoCCxgQ+HMqiEFEOIk4qbkGjqRZWDhRs2H1QQ6x1eifLvuFYz1CoP0+qIvMHL233oHbI+wPKZ9KhdP41H/u5kbSDBv3snX50LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUNp4+Bh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUNp4+Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751025617; x=1782561617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=909P6nH0p1HOpbVXQE7Al8zLxx5mdQNGBOcx64yDYLE=;
  b=SUNp4+Bh+AjhuCIwlAnzUEHedz5/KV2os9UsZ77J/A6ecQApR8aSy2gC
   4bvNsh7drI3hlg5ifrFcpJjSKzZeYStwxA50pQfGxrJx2ydRR0iR6zfOg
   F5PiRTYnlbKqRyB1yYEQOeZoOnN8yk7apksGQE5GXK9S8cTtUYrDGfKQD
   8vxqQvOPHfjmjOB3txOOiwxKBfLr+NC1pyLI5rRmQNHiTaTA9UL8MlWWZ
   g4SWPxUksP+iHKDTIhMwXTSrWSQ+MCnwzJcN/Hu8kDR0vXQIPVHq3YGaQ
   5scfRX49L5VwdqIH+pwwFVBzHN72OS3wNHjT+5woQkxgy2FFyARDv49p8
   w==;
X-CSE-ConnectionGUID: YCQUcRC8S3Ow7C1OqOMnMg==
X-CSE-MsgGUID: 1+tLp1YVQju4wo26ZMKtVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53418108"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53418108"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:00:17 -0700
X-CSE-ConnectionGUID: spZfFjjVSRSQdtFc9S4VFg==
X-CSE-MsgGUID: w/VF5bZjR1+RUTnwQHhLFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152879032"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:00:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV7kZ-0000000ATLs-1tZ5;
	Fri, 27 Jun 2025 15:00:11 +0300
Date: Fri, 27 Jun 2025 15:00:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org, Borislav Petkov <bp@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add missing sysfb files to firmware
 framebuffers entry
Message-ID: <aF6Hy5Yv8PrxKENX@smile.fi.intel.com>
References: <20250627113328.2703491-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627113328.2703491-1-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 01:33:04PM +0200, Javier Martinez Canillas wrote:
> The commit d391c5827107 ("drivers/firmware: move x86 Generic System
> Framebuffers support") moved the sysfb*.c source files from arch/x86
> to drivers/firmware, because the logic wasn't x86 specific and could
> be used by other architectures.
> 
> But the drivers/firmware path is not listed in MAINTAINERS, which led
> to the files being orphaned and scripts/get_maintainer.pl not listing
> a mailing list to Cc anymore.
> 
> Now that we have an entry for all the firmware-provided framebuffer code,
> add the missing sysfb files to make sure correct folks and list is Cc'ed.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


