Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD804610D;
	Mon, 12 May 2025 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747034224; cv=none; b=KIVJtPnnYxMS3h1RHtJPxs5BcCE8mJzueDhQ/mMHre9a5sQ8+Riy5YtmyE7Y0oT63hKJx3RzLDnFwoLhoj/yUhHbsjhXHHGbohz54APUZoc7LV+DNLy21ReCFQsCs/1MNAPnN7teuFszuQQZ7gUAX7N/eShM//KAzlMat8n5Fi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747034224; c=relaxed/simple;
	bh=fhSkgYhOgYnJveTzTY3zf3sNJ9lxN064UAaKeMMZTKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0DaDA6b2eBSwd4ErbJALt+Z00fllWwjg7VlkVx25veRLMfvRq6T3Z0rJMejKVYpZgGGqBRrlWh0cp4unlodMRhknA//3JsFYu5NVzv7muf1/UZTD1k6gZKEXuK4/8ZykW8apmsv9J3UJOq4ELkOPhoZ3gseJjOFSobh+rvUpYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ceo/HOqi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ceo/HOqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747034223; x=1778570223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhSkgYhOgYnJveTzTY3zf3sNJ9lxN064UAaKeMMZTKQ=;
  b=Ceo/HOqitkuX46tL38cn2qEGlEAjsrmRmD+263VpSqHXMcWpsE+2UxJN
   YmS4DfU9m6lANqsSzYYQ3lA7yxK4CvmWSq2kywnzia7SGV1LCgED4k/ur
   3N3Y4el9YW53uY4lh/tlbUXaHU0+DdFNJz/uq9NHTTDPPACTbWY0aomWo
   ceJqID9yHDRqvcXPy6HMdpfng/yYlJsVLg6PE3lYTSNW/Fmq2mPudw4NR
   T682bybtUs5QomLVInwdiF0j/jQYglEIT9KMFa2/12T8oY2QPAY07xa2h
   NKQnM2xb4+/E26lnSxMYg1vrSyvC7sc47LPARcR36/HmdUfJvIRESrvWP
   Q==;
X-CSE-ConnectionGUID: usoiYEKwTs+SMe+mmXVKEg==
X-CSE-MsgGUID: mmOL78MtSQGNCDZgoNnoWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48511036"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48511036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:17:02 -0700
X-CSE-ConnectionGUID: p5INCGhZSRuJg4+0ALt83g==
X-CSE-MsgGUID: 2I1NM1htTvWRbkgxgOe3ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137183989"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:16:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENPA-00000000qRb-2YWK;
	Mon, 12 May 2025 10:16:52 +0300
Date: Mon, 12 May 2025 10:16:52 +0300
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
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/23] ACPI: property: Add support for cells property
Message-ID: <aCGgZPJUQdAnWa-z@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-16-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-16-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 11, 2025 at 07:09:31PM +0530, Anup Patel wrote:
> 
> Currently, ACPI doesn't support cells property when
> fwnode_property_get_reference_args() is called. ACPI always expects the
> number of arguments to be passed. However,
> fwnode_property_get_reference_args() being a common interface for OF and
> ACPI, it is better to have single calling convention which works for
> both. Hence, add support for cells property on the reference device to
> get the number of arguments dynamically.

You can reformat above to make it deviate less (in terms of line lengths):

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects
the number of arguments to be passed. However, the above mentioned
call being a common interface for OF and ACPI, it is better to have
single calling convention which works for both. Hence, add support
for cells property on the reference device to get the number of
arguments dynamically.

...

> +			if (nargs_prop) {
> +				if (!acpi_dev_get_property(device, nargs_prop,
> +							   ACPI_TYPE_INTEGER, &obj)) {
> +					args_count = obj->integer.value;
> +				}
> +			}
> +

> +			if (nargs_prop) {
> +				device = to_acpi_device_node(ref_fwnode);
> +				if (!acpi_dev_get_property(device, nargs_prop,
> +							   ACPI_TYPE_INTEGER, &obj)) {
> +					args_count = obj->integer.value;
> +				}
> +			}

These two seems to me enough duplicative to have a common helper:

static unsigned int ...(struct acpi_dev *adev, ...)
{
	// define an obj variable?

	if (!nargs_prop)
		return 0;

	if (acpi_dev_get_property(adev, nargs_prop, ACPI_TYPE_INTEGER, &obj))
		return 0;

	return obj->integer.value;
}

Yes, the nember of LoCs most likely will increase, but the point here is better
maintenance experience.

-- 
With Best Regards,
Andy Shevchenko


