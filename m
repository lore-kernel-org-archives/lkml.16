Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E1A250BE5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694247; cv=none; b=idSkOb8oiDFA4SsceLPoLXFuvbYwtq/RJZTWv0lykJ9s3Tks6hkg2baxwvovgujDn3rpsJKwEJsHtNGHtisbraAD+dyXzMTuSxs4UK/+/5qyDoL5b3lfKEFM2kjCWOCz5UyhQ4o0JBnczOqjJl2zEP8F/J9JFFMXk5hZUGRmv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694247; c=relaxed/simple;
	bh=6fydPulIi6D4rUSZt1fu2W4DQjIsC03ZShdGOWIFPBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RU8FSUtxlIoiCKg6VVwE1ho3IIotXqWFs7Gcj58lkkJggd2RH2VphrjjPlezRkGs/biiMxA7ugtmkHkJgvrctdAN/1EHPb4by7teeI1Mks0ImImyaY8NM9tm39m9dRqHVvSnP2vOKgAt42nsYJo0aaiu0Z0sSsqqdtiQfiESx+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjdfrAUW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjdfrAUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743694245; x=1775230245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6fydPulIi6D4rUSZt1fu2W4DQjIsC03ZShdGOWIFPBE=;
  b=IjdfrAUWZhQfMJku8L7s83sJ0WITcZAs2jW7JXwIYip0cCzdx5JT2Emk
   Z/SBpg59kNcdTBAG6Vgr1q1zQKwVnSadCd/bqGLls/XAR98zFhb4iKfTJ
   qQyQkVCaC1za+zI0PsD1ph3p6EQ+tjZj4/R2lBE7cMS0uiSJMzoE8T1wG
   KstHNNuT6HP8DEW5iGIu5Ae68kYK9AQBumLBLvrxyMTHYNCuTsVnu1nUL
   XpL4JmQ+jzTzB691XuKD6M7dXUDLHnAslHwWi/pMCNZyQqzbFGEfQ7N3e
   KMB4JTDb2ooVljaGRJsNc3BL6r7yxl0Tz3WCF8B9Yx56txxSGtwRonL8q
   A==;
X-CSE-ConnectionGUID: jiqecWfUTEWwVrqSDSHUZA==
X-CSE-MsgGUID: +WRjQcTTQJO3T0nCx5zb9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55741332"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="55741332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 08:30:45 -0700
X-CSE-ConnectionGUID: v8Rs/L0gRbCMT7B6kMqeVg==
X-CSE-MsgGUID: ShGQhdDwR7GRv3jo7ErNsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127558367"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2025 08:30:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 980AA109; Thu, 03 Apr 2025 18:30:41 +0300 (EEST)
Date: Thu, 3 Apr 2025 18:30:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/4] x86/idle: Use MONITOR and MWAIT mnemonics in
 <asm/mwait.h>
Message-ID: <Z-6poX1TFKLKn4mB@black.fi.intel.com>
References: <20250402180827.3762-1-ubizjak@gmail.com>
 <20250402180827.3762-2-ubizjak@gmail.com>
 <Z-6pDGR0pQavVQfq@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6pDGR0pQavVQfq@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 06:28:13PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 02, 2025 at 08:08:06PM +0200, Uros Bizjak wrote:
> > Current minimum required version of binutils is 2.25,
> > which supports MONITOR and MWAIT instruction mnemonics.
> > 
> > Replace the byte-wise specification of MONITOR and
> > MWAIT with these proper mnemonics.
> > 
> > No functional change intended.
> 
> Hmm... Is it only me who gets these, please?
> 
> In file included from acpi/cstate.c:18:
> asm/mwait.h:30:15: error: invalid operand for instruction
>    30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
>       |                      ^
> <inline asm>:1:16: note: instantiated into assembly here
>     1 |         monitor %rax, %ecx, %edx
>       |                       ^~~~~
> In file included from acpi/cstate.c:18:
> asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
>    95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
>       |                      ^
> <inline asm>:1:7: note: instantiated into assembly here
>     1 |         sti; mwait %eax, %ecx
>       |              ^

FWIW, revert fixes the issue.

-- 
With Best Regards,
Andy Shevchenko


