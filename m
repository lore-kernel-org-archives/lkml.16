Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F4230BE8;
	Wed, 16 Apr 2025 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795115; cv=none; b=ksB+vzXrbUjtx+mjnfmcYkqIlTPowoY0xg/Y5c6E23z8WUuAQ4AVfvnUoZvmTPucQeCCQyYuytSmpr4TsVZwV5PiufRLbwfUKr3eYo9uluohZWhjwNPxD7nuIZq0B4ogqCibNYTJdzfg//IFeo5Rk2dsDoysmHOaiTdo9BryA3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795115; c=relaxed/simple;
	bh=Kg5lZuKcFqCe4BMj6rPjNOgc2HxEm8zkUdWh24qw648=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGyvVYUAF6M1Gnu0FbiqHlEiLQR4wYPJ1ZH1W3cs3MYTU6wps5Tz6trW71lwMDhZifAqSjOaNDkWnQmIatSwKwb2nyXBXOlKMUn2XCQVyodjVU87oYJR/LGAqqAF743BTh4+Rcd0lccb3eD0OI6//SgBDY8pCc5cqY2Kw/og0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9Xt7GIG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9Xt7GIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744795113; x=1776331113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kg5lZuKcFqCe4BMj6rPjNOgc2HxEm8zkUdWh24qw648=;
  b=J9Xt7GIG8Hf87xybFAgMXaPujfMwZVar/PuaMQvqqujeIais9hp7GQfU
   3nhk0zoxnN5ry5pmLGQuJ5UncutzAo6iB7aWlfrcRN1vg31RwrTujbbpN
   OmERtzWxXdBjLx9b0nG+Giqnp+S3QqV7X09dTvQgWsIaMx53pjdvv8JfD
   zK8KVWUDX5AvdLa8/A4CgisAlqWrnhwLdvr8M0icStzd74XK92uMjH2Ve
   df3fKLoErQl3s4Jq3xR/Oq6zwSQd0bU6dkA/tYa0KEp4roasr54t0h+Ya
   Qfr0bLjjiXdKG9/aflVSuchdmziYwKZDZDi2z/eA9w1ZZll39jiNQDm2r
   g==;
X-CSE-ConnectionGUID: 3XeZemp2SGC1tVOYZEBfgA==
X-CSE-MsgGUID: tIlKKqcAT4m/DrH+PrM7nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46494669"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46494669"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:18:33 -0700
X-CSE-ConnectionGUID: KZQxJZKWQ8e3zbdgM0C+8A==
X-CSE-MsgGUID: CFb94+BoTmq2BV6K9auZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="153604593"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:18:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4yuY-0000000Co2i-2i8g;
	Wed, 16 Apr 2025 12:18:26 +0300
Date: Wed, 16 Apr 2025 12:18:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] .gitignore: ignore Python compiled bytecode
Message-ID: <Z_914nf_HQZNl_NI@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <6f597205d5b2ec0e4d07c47f4b66c9df5da8203d.1744789777.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f597205d5b2ec0e4d07c47f4b66c9df5da8203d.1744789777.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 03:51:05PM +0800, Mauro Carvalho Chehab wrote:
> While the building system doesn't create any Python JIT bytecode,
> if one manually runs kernel-doc.py or get_abi.py, Python will,
> by default, create a bytecode and store it under scripts/lib/*.
> 
> This is normal, and not controlled by the Kernel itself. So,
> add *.pyc as an extension to be ignored.

...

>  *.mod.c
>  *.o
>  *.o.*
> +*.pyc
>  *.patch
>  *.rmeta
>  *.rpm

Same comment as per v2. This list seems ordered.

-- 
With Best Regards,
Andy Shevchenko


