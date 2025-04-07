Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918DB208993;
	Mon,  7 Apr 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043940; cv=none; b=jpfGcYkRnS1HZJrxp4hueyQiKEWVXYiyQrPZsYzgiAkjyjbKo92lC++jsKx2URjb7AcH5dZ5GtMbc7BQ6RxNPfaa15V5vxD2c5MEjiT+vdADTuZ/z9xA++aKLa/ADHnQetsNp4/wwGyv34tFb9FAVBevYoWW9gbQmFQSNSYoBec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043940; c=relaxed/simple;
	bh=b5Bcf4bgH9mfTxOjTTOwooVPb+WHPpMcRRDPk4qIZbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8kJobZt3WWZkRawDNCzz4oAI+V0QKy03LdXIwohOeh9PHNg4f39CG0Bsc5U0/476LWoKblFc7Y2LdyD3fAV++vsZ06uel5N9PgQ4HjEIe5wNxEPqAMltjjgOQ8eNlh8TGa+OfJf0awYzvtf7gJqFKIk2oSm4yOKHiA0oovjFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jx4KxV9R; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jx4KxV9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744043939; x=1775579939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5Bcf4bgH9mfTxOjTTOwooVPb+WHPpMcRRDPk4qIZbg=;
  b=jx4KxV9RN5gDv6kTMtkzg3/Xvf6h8tIC9XRd4s3Vym0zaGOuwtpwoD5R
   8nxfqlAy8m9MPBnZJ+AKwVT7MjoXrpsTVU5+/zVJbbCuZFcb0LZedpcwp
   9KLf9sSCMlX03KDH0dfODU85gMPpw11RhvMkdcDQBwmYG8ymobjgeGLPM
   f4HP7Ke8iVNyxHlycnsKNOajsVrqeWgrhLWu2wVAfXeDXn/6szoj8DCyR
   MS1mo0/VCIcCwqdvL4xfy/Op6hd8PcAtdzYjsvxQauccOMGT4SXdC6KQX
   VMrysvcVUPUKhRzO+fSJE51LBT7l+4Ip/dCIuDQ0obAvr3fp7vDt+E+kS
   w==;
X-CSE-ConnectionGUID: WgQnuPr8TdOmbiA6GR/hdQ==
X-CSE-MsgGUID: WvXpTZgAR9ub/Lhu4bQ4WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="67915103"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="67915103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:38:57 -0700
X-CSE-ConnectionGUID: a3D7z+wCQ0+4GqgKioce9Q==
X-CSE-MsgGUID: Hc8LHqKdTLC6Iacr22IIeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127867940"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 09:38:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A63D3F0; Mon, 07 Apr 2025 19:38:53 +0300 (EEST)
Date: Mon, 7 Apr 2025 19:38:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Denis Mukhin <dmukhin@ford.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] x86/early_printk: add MMIO-based UARTs
Message-ID: <Z_P_nWrl4JQJVy2c@black.fi.intel.com>
References: <20250324-earlyprintk-v3-1-aee7421dc469@ford.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-earlyprintk-v3-1-aee7421dc469@ford.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 24, 2025 at 05:55:40PM -0700, Denis Mukhin wrote:
> During the bring-up of an x86 board, the kernel was crashing before
> reaching the platform's console driver because of a bug in the firmware,
> leaving no trace of the boot progress.
> 
> It was discovered that the only available method to debug the kernel
> boot process was via the platform's MMIO-based UART, as the board lacked
> an I/O port-based UART, PCI UART, or functional video output.
> 
> Then it turned out that earlyprintk= does not have a knob to configure
> the MMIO-mapped UART.
> 
> Extend the early printk facility to support platform MMIO-based UARTs
> on x86 systems, enabling debugging during the system bring-up phase.
> 
> The command line syntax to enable platform MMIO-based UART is:
>   earlyprintk=mmio,membase[,{nocfg|baudrate}][,keep]
> 
> Note, the change does not integrate MMIO-based UART support to:
>   arch/x86/boot/early_serial_console.c
> 
> Also, update kernel parameters documentation with the new syntax and
> add missing 'nocfg' setting to PCI serial cards description.

Just for your information: Have you seen this rather old series of mine?

https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Fx86%2Fboot-earlyprintk

-- 
With Best Regards,
Andy Shevchenko


