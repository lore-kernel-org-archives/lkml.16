Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AEA2494F5;
	Tue, 27 May 2025 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344601; cv=none; b=tpNiLDMGawjfS8CHgHLiIwlY40DinjWyloQgBWhanwrqGHcZbctK/pJ/1x6QfiH+wdEDckr5D8Yr8XTFIDi2c8eZrhTRV7NfUYTCe8w4O7MLObLAB81Ha+wRUt4mfvPg4Mr5IZn/ipzKzVWUyQ/9ZPARZIsB455AMGhMGRfyFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344601; c=relaxed/simple;
	bh=EjudQlGVvEOYUmNh3s6EppvuvaihZA4yyvfSDP84JIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzCGP8/xUHmJC4SJCtTsx7xk7Y9/O1AlkRbkIMG+2J8sdc+ftf5nZmOpciZ0X8CrWIstOorVhtZDLk8qNEPveG2C2mit1srK57QTavnFJ1avtQiw2WYtn3n/Og4jUJY2qEG65p/IO29ULmfb9pitQHHQ0GziaQrsXo7QMWW/A5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaeEzJ4i; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaeEzJ4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748344600; x=1779880600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EjudQlGVvEOYUmNh3s6EppvuvaihZA4yyvfSDP84JIY=;
  b=RaeEzJ4isCmrnRiSP4/U3CiVh/Ke4EmNI9CyYoNPmtaPk8n3qRVoL+/s
   TNS2g3tX7Jn9kKjJyAKd9F2kNBrF+GdeNYlu4DRdOuwc21Xl8YU3Sck2w
   BkKIEuishVcxnT3uH7ZLUGA2dgfWiKsl/o1HqBN/XXsAd5KMuKt2z7B06
   g8to1wBdUrQxJNu1kis3HTi68tt8540uqlhzThQlBmilQ/Ybkf5lCuRSR
   cIpmM1ZSymf+P1ez7w8rpWWtNXztsLxIoARXsCswrUPvWE0uHMndDU8XH
   iQMQ9xgFuM25pBtjrtziIPqkfHGRIz5Nzj0bHHdgL7lJocs7se9Jpni22
   A==;
X-CSE-ConnectionGUID: Yx34kNu+Twmda3VqBYR/MA==
X-CSE-MsgGUID: MlSq9AC8R6i1t9QxvafJbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="72861599"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="72861599"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:16:39 -0700
X-CSE-ConnectionGUID: Bthi2lKHStCiZp2BfkKx3w==
X-CSE-MsgGUID: E2k9PfJMRXCzgCXjmF9wIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="142775629"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 04:16:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uJsIH-000000019FZ-3o0T;
	Tue, 27 May 2025 14:16:29 +0300
Date: Tue, 27 May 2025 14:16:29 +0300
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
Subject: Re: [PATCH v4 05/23] mailbox: Add common header for RPMI messages
 sent via mailbox
Message-ID: <aDWfDZ_rmdZeuvX3@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-6-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-6-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 25, 2025 at 02:16:52PM +0530, Anup Patel wrote:
> The RPMI based mailbox controller drivers and mailbox clients need to
> share defines related to RPMI messages over mailbox interface so add
> a common header for this purpose.

...

> +#include <linux/mailbox_client.h>

This is not even closer to the list of the headers the header is using.
E.g., types.h is missing.

> +/* RPMI version encode/decode macros */
> +#define RPMI_VER_MAJOR(__ver)		(((__ver) >> 16) & 0xffff)
> +#define RPMI_VER_MINOR(__ver)		((__ver) & 0xffff)

Same comment as per previous patch.

...

> +	RPMI_ERR_NO_DATA		= -14,
> +	RPMI_ERR_RESERVED_START		= -15,
> +	RPMI_ERR_RESERVED_END		= -127,
> +	RPMI_ERR_VENDOR_START		= -128

Leave the trailing comma, as it doesn't sound like a terminator.

...

> +		return -ETIMEDOUT;
> +		return -ECOMM;
> +		return -EOPNOTSUPP;

+ errno.h

...

> +/* RPMI linux mailbox attribute IDs */
> +enum rpmi_mbox_attribute_id {
> +	RPMI_MBOX_ATTR_SPEC_VERSION = 0,

Why do you need an explicit initialiser? If it's a HW requirement, all of them
should be explicitly defined. This makes code robust against potential changes.

> +	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
> +	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
> +	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
> +	RPMI_MBOX_ATTR_MAX_ID
> +};

...

> +/* RPMI linux mailbox message types */

linux --> Linux
(everywhere)

-- 
With Best Regards,
Andy Shevchenko


