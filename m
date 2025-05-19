Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8395B1C700D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657668; cv=none; b=Xsk9sThf2VQSLsfjLW+p79FcyHpld+ygnFt0+dIzUuMfqj2T7/vAqiuEI8RXqsKom6QbjA2rtpfC4JdAwC9D0EW1oxR6ny59VdIU9VMgiCv3YNv+TlgBAm+O7L4ObicSI7dCkUeibNzNueHfkd4XuUJMlUdeUPEN4sYkUkcorGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657668; c=relaxed/simple;
	bh=38v8omgbUNfZKYNtn77NW234H/KuOiAX2ZTPvdYPDqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkSGE50pK+ilObB07sZMfFwIs6bEng2IguST9KI4wQTioFqFAd7rqLquPDdSJvqxBTYM6MiGdNYUBYBM2o9RRyVYF+9smgvsu+TTulTwK+QwCY2ZLUZ7Ny4PWBY9DNfAMnlPplp2b7PBuq6DoeDN5FgTK+LFfujnehYW5W+G+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: R/mT1xaWTlKmlxqM783e6g==
X-CSE-MsgGUID: iYwOxXECS1ioFWwtC+MnmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49709669"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49709669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:27:47 -0700
X-CSE-ConnectionGUID: BeSu/fBrRYOep5K5Ed0h6A==
X-CSE-MsgGUID: Cm5EwYN2QxOdUymQLe+jZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140244022"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:27:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGzam-0000000323u-3uQJ;
	Mon, 19 May 2025 15:27:40 +0300
Date: Mon, 19 May 2025 15:27:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 09/32] x86/boot/e820: Call the PCI gap a 'gap' in the
 boot log printout
Message-ID: <aCsjvKT_FO7HxIt4@smile.fi.intel.com>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-10-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515120549.2820541-10-mingo@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 15, 2025 at 02:05:25PM +0200, Ingo Molnar wrote:
> It is a bit weird and inconsistent that the PCI gap is
> advertised during bootup as 'mem'ory:
> 
>   [mem 0xc0000000-0xfed1bfff] available for PCI devices
>    ^^^
> 
> It's not really memory, it's a gap that PCI devices can decode
> and use and they often do not map it to any memory themselves.
> 
> So advertise it for what it is, a gap:
> 
>   [gap 0xc0000000-0xfed1bfff] available for PCI devices

Why not use word 'range' instead of the 'gap'? This will allow to switch to
%pra without modifying the output.

-- 
With Best Regards,
Andy Shevchenko


