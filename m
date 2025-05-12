Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184E2AD11;
	Mon, 12 May 2025 07:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747033689; cv=none; b=d+GXmGQgk1tzTu9RXxOtsuOnIdIrostni356XBsJ8X8FUj5TXOyNBE8QOP/nwyAXV2aGrrusgVLoXTERhWVJnAUP7QSfZe2E/ZTYEn6AmgKdT+gu7IfhrfZPKIix7KJtc3m5WLliu9MXTsgzBl8bwGkpUIpLtd+mNos8X3Rzqe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747033689; c=relaxed/simple;
	bh=Mul8tNeRrypv/NSAZe83gZO8+DlWm98zYe0h3LwG4jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UL8PbMYg2E7YyvxAF8VPg+9dI2xGOoK52wNA3wR7PpnD7GsxVJGweH1FiNfx+HrQZped0R7TK14YQU+DzN94m+53gZJ518WsCySWUX6IRsL/FwsNpy4prY4TKrwuxpPl2PJt9cAjrTyVYVdMVCTjFaFNilTWaAd3frpZwymoIng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mb5DRkWr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mb5DRkWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747033688; x=1778569688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mul8tNeRrypv/NSAZe83gZO8+DlWm98zYe0h3LwG4jg=;
  b=mb5DRkWrGJvnAdL32F2ztPSRwxcEv2tViRGrHjaAGQ24+FmHhs/HKR3+
   mLCJEfsE/iHsSdnklQeASC+EpJGfWplDSNpEe7P8cPTjk8nZLj/Fp0/nC
   adD8hEXTm0Sa3IS+eLg5lhdwn7LxdL5F0E6AAp39odijDeDpF6z/tu9uo
   U6+sSzUvP9g59bQqO+rh3L3Mt3XjA+o9/MqYTVcLlev9EMWxV3KaSD28F
   zEgfvOtRTx59/dTMQpnK0iy/KqJqXB0ArZmUw6XtH/OsOLMWDCz3roMEG
   uxm3SiijVAl1QGBdCxzt0XNi8e2H8TR+HqIN6LzjWAlE6r6Yn1cSGKo75
   A==;
X-CSE-ConnectionGUID: /AgWA6jBSoqMKjcNtP1ZwQ==
X-CSE-MsgGUID: 6u7NJRIGSg6CfnnJzRhREg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66355112"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="66355112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:08:07 -0700
X-CSE-ConnectionGUID: +NC4/pH6QHKeJIQkvRlB3Q==
X-CSE-MsgGUID: zFExEVxoRFiOmm8OdIwj5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="174434482"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 00:08:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uENGX-00000000qLL-0P5S;
	Mon, 12 May 2025 10:07:57 +0300
Date: Mon, 12 May 2025 10:07:56 +0300
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
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511133939.801777-11-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 11, 2025 at 07:09:26PM +0530, Anup Patel wrote:
> From: Rahul Pathak <rpathak@ventanamicro.com>
> 
> The RPMI specification defines a clock service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.
> 
> Add mailbox client based clock driver for the RISC-V RPMI clock
> service group.

...

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>

Just to point out again that the above misses a lot of headers definitions
and/or APIs this driver uses. Follow IWYU principle.

...

> +#define GET_RATE_U64(hi_u32, lo_u32)	((u64)(hi_u32) << 32 | (lo_u32))

Hmm... Perhaps add this kind of macro to wordpart.h ? IIRC not only this driver
uses something like this.

...

> +enum rpmi_clk_type {
> +	RPMI_CLK_DISCRETE = 0,
> +	RPMI_CLK_LINEAR = 1,

> +	RPMI_CLK_TYPE_MAX_IDX,

No comma for the terminator. Please, clean all these cases.

> +};

...

> +union rpmi_clk_rates {
> +	u64 discrete[RPMI_CLK_DISCRETE_MAX_NUM_RATES];
> +	struct {
> +		u64 min;
> +		u64 max;
> +		u64 step;
> +	} linear;

Have you looked at the linear ranges library we have in the kernel? Can you
utilise it here?

> +};

...

> +struct rpmi_clk {
> +	struct rpmi_clk_context *context;
> +	u32 id;
> +	u32 num_rates;
> +	u32 transition_latency;
> +	enum rpmi_clk_type type;
> +	union rpmi_clk_rates *rates;
> +	char name[RPMI_CLK_NAME_LEN];
> +	struct clk_hw hw;

Just a reminder to use `pahole` to check that your data layout is optimised for
memory consumption.

> +};

...

> +struct rpmi_get_supp_rates_rx {
> +	u32 status;
> +	u32 flags;
> +	u32 remaining;
> +	u32 returned;
> +	u32 rates[];
> +};

Is it ABI? (I mean if this is interface with some kind of FW)
If so, Use proper endianess aware types. Same Q for all data
types defined in this driver.

...

> +			for (j = 0; j < rx->returned; j++) {
> +				if (rateidx >= (clk_rate_idx + rx->returned))

Too many parentheses.

> +					break;
> +				rpmi_clk->rates->discrete[rateidx++] =
> +					GET_RATE_U64(rate_discrete[j].hi,
> +						     rate_discrete[j].lo);
> +			}
> +		}

...

> +	devm_kfree(context->dev, rx);

Why?! This is a red flag to point that here is misunderstanding or abuse of
managed resources approach. Either use __Free() from cleanup.h or don't call
devm_kfree(). The latter must have a very good justification to explain why.

> +	return 0;

(this is even not an error path, where it might have a little argument for)

...

> +	/* Keep the requested rate if the clock format
> +	 * is of discrete type. Let the platform which
> +	 * is actually controlling the clock handle that.
> +	 */

/*
 * Use proper style for the multi-line comments. You can
 * refer to this comment as an example.
 */

...

> +out:

Redundant label. Note, the labels are recommended to be named after the flow
they will run if goto. This one can be named as out_literally_with_return_0,
which makes it obvious how useless it is.

> +	return 0;

...

> +	rates = devm_kzalloc(dev, sizeof(union rpmi_clk_rates), GFP_KERNEL);

sizeof(*...)

> +	if (!rates)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rpmi_clk = devm_kzalloc(dev, sizeof(struct rpmi_clk), GFP_KERNEL);

Ditto.

> +	if (!rpmi_clk)
> +		return ERR_PTR(-ENOMEM);

...

> +	ret = rpmi_clk_get_supported_rates(clkid, rpmi_clk);
> +	if (ret)
> +		return dev_err_ptr_probe(dev, ret,
> +			"Get supported rates failed for clk-%u, %d\n", clkid, ret);

Indentation issues. Repetitive ret in the message. Please, get familiar with
the format dev_err_probe() uses.

...

> +	int ret, num_clocks, i;

Why is 'i' signed?

...

> +	/* Allocate RPMI clock context */
> +	context = devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);

Ha-ha, you have even inconsistent style in the same file! So, go through the
whole series and make sure that the style used in each file is consistent.

> +	if (!context)
> +		return -ENOMEM;

...

> +	/* Validate RPMI specification version */
> +	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to get spec version\n");
> +		goto fail_free_channel;

This is simply wrong. You should not do goto before any devm_*() calls.
The error path and ->remove(), if present) is broken. Fix it accordingly.

Here should be

		return dev_err_probe(...);

it's your homework to understand how to achieve that. Plenty of the examples in
the kernel.

> +	}

...

> +enum rpmi_clock_service_id {
> +	RPMI_CLK_SRV_ENABLE_NOTIFICATION = 0x01,
> +	RPMI_CLK_SRV_GET_NUM_CLOCKS = 0x02,
> +	RPMI_CLK_SRV_GET_ATTRIBUTES = 0x03,
> +	RPMI_CLK_SRV_GET_SUPPORTED_RATES = 0x04,
> +	RPMI_CLK_SRV_SET_CONFIG = 0x05,
> +	RPMI_CLK_SRV_GET_CONFIG = 0x06,
> +	RPMI_CLK_SRV_SET_RATE = 0x07,
> +	RPMI_CLK_SRV_GET_RATE = 0x08,

> +	RPMI_CLK_SRV_ID_MAX_COUNT,

No comma in the terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko


