Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF07255222
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196870; cv=none; b=KIcBl7aCJGbeXJ/roppw6fmv8AXBjUkGHjSgsK28bJYtMzk1bCVbyzn9lhM6y6x6juThL3AGdcviTH0KcJimvvBzZT6ltCa72SbC6tZQ33NwuRcv53/L0uG/fBfTBfKTxpni39b82Un3a+niB2RxcIuSOKxmA/p08t5cXCG2Wos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196870; c=relaxed/simple;
	bh=y+n51iImtiIlXRtQ/rosKQuO6qDa2MLr2Vy5kp5nFLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jidhvf5Zu8bY825J2Qjup5A45MB/vjaU5hzB8r/S+c4F+4WkYleLGiz+mjaXuKieLbrL4U9wVthPR+xGBVOjxVTwd8uqvar3ZDWQAMJCGkQceqlo0HauvGqO10uvs5m0n+vlRIV/n+F5nK+TNobv4jAkkck6SdVnWh+aL2IaQwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jb0SIPta; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jb0SIPta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744196870; x=1775732870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y+n51iImtiIlXRtQ/rosKQuO6qDa2MLr2Vy5kp5nFLA=;
  b=Jb0SIPta6SSZ11HFMnbSzRousup9Vtya7ipyA+feX4UIPa3MX/+TLcAQ
   FvQE1gvbHZC3c4Q3liPVL7DQQXy1i+KnnF33SnkVcvms3FZcYfNoBqWm1
   f7S3um+0dlQllcd9YWW9qzwfo0+RD4jQID+haG9m6C6qLy62g8abev9Qw
   w12sRmbrNNY7zjkIPP9EFivwouwSI+6kV7wD0PQDWV+7YpfWUedbrhNpj
   9GbHybIGZBfNtwd2a5L3ItvCtsEn5trj66qBRI9u1iy+RxbqVmsVPs/k+
   50ulXLltQNJz2wa9Z6v/gJ8P3olrNf35EfqpddybGsuVVI4t4E6S68ios
   w==;
X-CSE-ConnectionGUID: Xy/yY3+JTzewp3yci6VMIg==
X-CSE-MsgGUID: jHu5XdJPRNGUQfpLjqqIqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45789471"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45789471"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 04:07:49 -0700
X-CSE-ConnectionGUID: lmFMqlPXRF2SfjrsA/YO4Q==
X-CSE-MsgGUID: ANg59rW3SxCfsN8OOilYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128548008"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 04:07:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2THT-0000000Ahtp-415i;
	Wed, 09 Apr 2025 14:07:43 +0300
Date: Wed, 9 Apr 2025 14:07:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v1 1/1] x86/early_printk: Fix comment for "pciserial" case
Message-ID: <Z_ZU_9Fe5sTR-cQx@smile.fi.intel.com>
References: <20250407172649.792996-1-andriy.shevchenko@linux.intel.com>
 <Z_ZL04J10YbsBaYz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_ZL04J10YbsBaYz@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 09, 2025 at 12:28:35PM +0200, Ingo Molnar wrote:
> * Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> Note that I merged this into the other fix, in part because the title 
> isn't accurate anymore, this patch isn't purely fixing the comment.

Thank you for prompt act on this!

-- 
With Best Regards,
Andy Shevchenko


