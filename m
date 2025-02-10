Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD801ADC8C;
	Mon, 10 Feb 2025 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174812; cv=none; b=Ash3yddc4A2awe3dbu2G0N+UPk0APj/YcmldDABb7EbdReARMJNLFoWE/jcH/SZx6kYMKmMKMMho4UcaCSGgwD5z4ZPsgOVZYmNvj46NelIZP8oxP8Us1Ya6ttZMkyzNYX0waXG9N8Kud3EoLKpZgKBraaOpnV86g+z6+/g9mEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174812; c=relaxed/simple;
	bh=M+MWhRxTA1Um+KeGexerlO1TUKACbx3fXo7FZ3qwQQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbOgqRhL7FMLmHT/n21telTdQRvWESF4Gg1QDFqtxjgNDGY31MxTCgRa2SFWbSNsYdx4fV8bI9VZH4oMHT833BSXt9ea02IjyxonDQFMkiaFFbY6+S9bEHdBLs4Lz40cDXuU72RDOmDN0X0w3dgytBU8C2Ir1cmr0hSqQfCqF6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaOSp3kX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaOSp3kX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739174811; x=1770710811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M+MWhRxTA1Um+KeGexerlO1TUKACbx3fXo7FZ3qwQQk=;
  b=MaOSp3kXfrAcIjip6hXiZO5kvgGz7Sp+c3FnB0CWPltnhfZFRIPd6RH+
   21VM99NLOhOk7a39qX5LG2CulXeBWzhoLjS/KwFrV6GqwYa5eGuAMsxNm
   ASbXawKnusyu0Pa/O6C1v+gAI1jhkv5al3GQ0JU3Kr1pUxiFI67cwPVyM
   yRluRN7JAOKBUI4haLn8h7wG6uXsVQl9+6Tb+tW25setMIKQhbyNJJc/p
   koZT1VZzxPj+KXdYZXzti8dTTsTlayErQIgh1RBRVsQqdE8mVsVvwx6v6
   FWBf44wBjbPHcuD4KFiJv+Xfnx77MSmUlLXL3+dkvu38OE0zqHq6s2do3
   A==;
X-CSE-ConnectionGUID: XFYiJVBsStC+Hbdn+VLq6w==
X-CSE-MsgGUID: gspeWAtkSjWeKvVF0B8Naw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39891440"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39891440"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 00:06:48 -0800
X-CSE-ConnectionGUID: L+QhWWd8TpaaesaS+g9ZVw==
X-CSE-MsgGUID: /nZzuL4ITbSVmPEy+iuELw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="142970262"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 00:06:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thOoT-0000000A3lL-1uz7;
	Mon, 10 Feb 2025 10:06:41 +0200
Date: Mon, 10 Feb 2025 10:06:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: subramanian.mohan@intel.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
	tglx@linutronix.de, corbet@lwn.net, eddie.dong@intel.com,
	christopher.s.hall@intel.com, pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com, david.zage@intel.com,
	srinivasan.chinnadurai@intel.com
Subject: Re: [PATCH v13 1/4] drivers pps/generators: replace copy of pps-gen
 info struct with const pointer
Message-ID: <Z6mzkWxOYtFXyZL6@smile.fi.intel.com>
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
 <20250210050421.29256-2-subramanian.mohan@intel.com>
 <Z6mXC7loE3qRYpUQ@smile.fi.intel.com>
 <73539b96-fc89-48f3-81e7-53af0066bc22@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73539b96-fc89-48f3-81e7-53af0066bc22@enneenne.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 09:00:16AM +0100, Rodolfo Giometti wrote:
> On 10/02/25 07:04, Andy Shevchenko wrote:
> > > Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> > 
> > Hmm... Is Rodolfo indeed a correct to be mentioned here?
> > I think you wanted Suggested-by with somebody else.
> 
> Honestly speaking, the patch was written by me, tested by Mohan, and
> suggested by you. :)
> 
> Then I proposed to Mohan to send the patch with other patches in his patch
> set, since this patch is logically connected with them.
> 
> Maybe we can put:
> 
> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> Tested-by: Mohan Subramanian <subramanian.mohan@intel.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ?

Sounds good to me! Whatever you agree on.

-- 
With Best Regards,
Andy Shevchenko


