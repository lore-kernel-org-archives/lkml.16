Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26B200130;
	Mon,  3 Feb 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575819; cv=none; b=UEUsUh6YkaSK+Y3r+XhP+k5uyoJrQzjnzl7Y/UAuN890Sz3ruxSA+6veowviGsJSjP2f8197q0ASXGwTOMKhEzTTqqUZHf7EUdrY9oF65w9E2kZD4IwciSekjjI/xizahMhbf2Q61jA/Fs4ztBv1I9FCqYZri7wq8IW0WADsLWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575819; c=relaxed/simple;
	bh=aQY5nT189S5QUoHa13vFWQRg/WET3r3m2ffZ4yejuzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLyMCASCZs6A4f8na0izI1fmehJSWuY4cn9XIz8Rbpo5pMfDSnvVOmerz9Rd3t4Xbq0LRwjXcreqzqveveiFXmbEyidSN81e/dH0Y7tuivWP6SPglIawvQGEGBFhHWOou0ONssgTV1F/x4l2nBpv+7goZkpbMF6vSqp4oF2bFVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHBh3SPc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHBh3SPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738575817; x=1770111817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aQY5nT189S5QUoHa13vFWQRg/WET3r3m2ffZ4yejuzQ=;
  b=eHBh3SPcLRimgSFdiQ6rrfE69oukDuc5ycUmeQOgmy6xsuisuCYdrG4S
   P5DoKIXNN+z4isPK86fiW9M6S9Z6W8uHEMoFtqN+d5tLWKCgtKoeJuPmW
   QO/1T5WN3isxcSmLoz1wkhqIktExv8Yhy35hUAFyv5JeA4tzzVnW4y5Gc
   80l1JihWYInQEQPstxD4pRvlvDctSn/eF4Fkdc2gAmqNw5jIf4Lb9FO0R
   RRkNqIowTYQ6m8muPZE1vMQmsutQqbS2kqroRd9IhCb0BbPhEuIQDmyc1
   oKgwcT0SsrMRb9CQmoxP6NAgGYC3Gv5RHIR2eOkwWnFoFaFBfdGVeZxkf
   g==;
X-CSE-ConnectionGUID: f0awBSW7S9GPRK2Qpxdzzw==
X-CSE-MsgGUID: 0MtTElyXRzO6Qbr3hY7aAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50476119"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50476119"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:43:36 -0800
X-CSE-ConnectionGUID: LLrcAqr0Rlm/ruY5605yCQ==
X-CSE-MsgGUID: oFZ70KHIRg+AEWH/Kc4nCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115392397"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:43:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1teszG-00000007mu6-17QX;
	Mon, 03 Feb 2025 11:43:26 +0200
Date: Mon, 3 Feb 2025 11:43:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <Z6CPvteWv89Xo70j@smile.fi.intel.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203084906.681418-13-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
> 
> fwnode_get_reference_args() which is common for both DT and ACPI passes
> a property name like #mbox-cells which needs to be fetched from the
> reference node to determine the number of arguments needed for the
> property. However, the ACPI version of this function doesn't support
> this and simply ignores the parameter passed from the wrapper function.
> Add support for dynamically finding number of arguments by reading the
> nargs property value. Update the callers to pass extra parameter.

I don't like this (implementation).

It seems that we basically have two parameters which values are duplicating
each other. This is error prone API and confusing in the cases when both are
defined. If you want property, add a new API that takes const char *nargs
and relies on the property be present.

Your patch becomes much simpler, and solution is robust against potential
confusion on how to treat the corner cases.

Note, Rafael might have different opinion and his has the last word. But
here just my view on the implementation details.

-- 
With Best Regards,
Andy Shevchenko


