Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B932F85B;
	Mon, 10 Feb 2025 06:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167507; cv=none; b=prM6T+e2QP/E4VJZUh1an7MS0mqK1MqVM4VvKE/iDNP/VFtOxNn0uStERfnVEq7fZNXt/2jDQAl2jy9qErO4ms7zZSr4hDdxhsjUsGh0vDs+sgBBWmLJq61bZW/fcl3hJ7Ob5KTf0KvVsbOmTRcvKGl5sPcHL6RGrewc0N0Yg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167507; c=relaxed/simple;
	bh=rRYJteOQgsHZbcvoZwYX3N714vayvL0FCI84xdksnrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoM3O9/hyKt6rsgSgkcxbvEqZCqtEYpF5EsdigGze9jcnGfnTgepKUJJGsdsSF+lPVPvhcDI0YDf4iduQ1vGZYlUW14Mpjc8ernFKLEah3j44On4hA7tXcJdSo+WAad9p7apIokpe+qfRqg0wozoPQ65q6biNEDC+D8oLK3VDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUxznfMj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUxznfMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739167506; x=1770703506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rRYJteOQgsHZbcvoZwYX3N714vayvL0FCI84xdksnrY=;
  b=UUxznfMj/TLniGMapgtZPKua9IZEdeZXG+FnDbhkERk4spJMTkYP8T1c
   T6MMu5YjY0/+pxo5TX0sJnY+uZzpF4nUFBwr/TPsnheVUyqjkugcSGnjx
   E0yMmHWQABJt+pX8s1IFJmh7B36K3pt7+jgWnwS7dDqeBshU+LdaN74lu
   vH0oeIMSxl/DTVgq2YQI1+QPR+hFFgNsqv62oe2pUMvu+ZmxkXOcN/LwN
   YhNslJOSRvAqNHJtJh2CzzGC9ebaHo2afradsivVRofD2l1Q6yrvcoH2+
   j6BL4m1i8TaHxFWL1JF4NSMLfXZagIgyZu+jpRlLieQPXvM3oIFkgbpp0
   w==;
X-CSE-ConnectionGUID: heXIHRHuRVW6g4QRjl0fMg==
X-CSE-MsgGUID: isVcMtsqRZettLawMEu/TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="65089297"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="65089297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 22:05:05 -0800
X-CSE-ConnectionGUID: ukIvttzbRHSU1vhKl0BCeQ==
X-CSE-MsgGUID: 7YuVGQOLTeGjdM/8qQ6T5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="111926110"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 22:05:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thMuh-0000000A23u-1NV2;
	Mon, 10 Feb 2025 08:04:59 +0200
Date: Mon, 10 Feb 2025 08:04:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: subramanian.mohan@intel.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	gregkh@linuxfoundation.org, giometti@enneenne.com,
	tglx@linutronix.de, corbet@lwn.net, eddie.dong@intel.com,
	christopher.s.hall@intel.com, pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com, david.zage@intel.com,
	srinivasan.chinnadurai@intel.com
Subject: Re: [PATCH v13 1/4] drivers pps/generators: replace copy of pps-gen
 info struct with const pointer
Message-ID: <Z6mXC7loE3qRYpUQ@smile.fi.intel.com>
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
 <20250210050421.29256-2-subramanian.mohan@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210050421.29256-2-subramanian.mohan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 10, 2025 at 10:34:18AM +0530, subramanian.mohan@intel.com wrote:
> From: Subramanian Mohan <subramanian.mohan@intel.com>
> 
> Some PPS generator drivers may need to retrieve a pointer to their
> internal data while executing the PPS generator enable() method.
> 
> During the driver registration the pps_gen_device pointer is returned
> from the framework, and for that reason, there is difficulty in
> getting generator driver data back in the enable function. We won't be
> able to use container_of macro as it results in static assert, and we
> might end up in using static pointer.
> 
> To solve the issue and to get back the generator driver data back, we
> should not copy the struct pps_gen_source_info within the struct
> pps_gen_device during the registration stage, but simply save the
> pointer of the driver one. In this manner, driver may get a pointer
> to their internal data as shown below:
> 
> struct pps_gen_foo_data_s {
>         ...
> 	struct pps_gen_source_info gen_info;
> 	struct pps_gen_device *pps_gen;
> 	...
> };
> 
> static int __init pps_gen_foo_init(void)
> {
>         struct pps_gen_foo_data_s *foo;
> 	...
> 
>         foo->pps_gen = pps_gen_register_source(&foo->gen_info);
> 	...
> }
> 
> Then, in the enable() method, we can retrieve the pointer to the main
> struct by using the code below:
> 
> static int pps_gen_foo_enable(struct pps_gen_device *pps_gen, bool enable)
> {
>         struct pps_gen_foo_data_s *foo = container_of(pps_gen->info,

> 	       			      struct pps_gen_foo_data_s, gen_info);

TABs/spaces mix.

>         ...
> }

> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>

Hmm... Is Rodolfo indeed a correct to be mentioned here?
I think you wanted Suggested-by with somebody else.

...

> -struct pps_gen_device *pps_gen_register_source(struct pps_gen_source_info *info)
> +struct pps_gen_device *pps_gen_register_source(
> +					const struct pps_gen_source_info *info)

Still leave it a single line.

...

Otherwise looks good to me, thanks for taking this approach!

-- 
With Best Regards,
Andy Shevchenko


