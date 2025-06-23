Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107651422AB;
	Mon, 23 Jun 2025 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669618; cv=none; b=lBh7RBt1MmgYXdynVpj2fNRkuhIjj9nlJYXNVV8SyXLxASJzStCrpeK4wGf63Z9EJqFAhfuFAs13l1SMBmaG4fRbnm+4fJHZWuIvte/JBchMefdfHzQx4/uMyoiQfP1qVO722XiydJM36o7dVMjp8NxzNtCpO/olDzhWXLjNExk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669618; c=relaxed/simple;
	bh=N6NaHDvMp+XKiFxoaV8IGSnGDM1wlAxKuzdd0haL8nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9T3gOsmZTEZIPLxtQD/YleXG/PziKypjtXktBXYgps/GRHu+eTVv8lZGuqvzPIBLoGI5PJg9BQK1fzsOlftYvzu037/T2/wYmrxBrRaj0eiCOPV/f3oJ1KovyKDA3xr+iRyTTfFiHwPTh8OXgyXTsCFWnL6qGzG1TDHh3utuBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHF84W1X; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHF84W1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750669616; x=1782205616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N6NaHDvMp+XKiFxoaV8IGSnGDM1wlAxKuzdd0haL8nU=;
  b=NHF84W1Xzpid4Q69pCjB9izfoo05veaCV8upaLRehlYIMPN6SflSG+CZ
   hAl/W3llYpaCXJ8I1HsH0Cui4hM9els/EjejoT501JvCVOTRjRbLcaZcj
   YRGdCYIUVNqG7vGcvadfplFFKRAJeXAQzJeGkfqUZ+5xmrF/n56+Kccgc
   pQ7zHlmWa02bENGKFPbnrG72I4F6ECUU++qdxGi3hlFa0PjqRw+nPMclf
   BgmxyBSFR2psLUgfZB0LT56wx0WWnrAu8HvH8TmLIk77vig+R3mjc8DYu
   IIR7mlxidbh7/LP7+orjRDYI9RA5JWJUNyUmMf5LB2WBuga5iu0zsabCy
   w==;
X-CSE-ConnectionGUID: HkkN/mCaQrC/Ec45UDH1XQ==
X-CSE-MsgGUID: Ci7fY7OUQ0yzlh3DQWE8Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="55501678"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="55501678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:06:55 -0700
X-CSE-ConnectionGUID: ULDbrthrTza/OK7dniYgaA==
X-CSE-MsgGUID: g3amiWPwQpiSTBU9viTDyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151828385"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:06:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTd8X-000000097K7-10Pe;
	Mon, 23 Jun 2025 12:06:45 +0300
Date: Mon, 23 Jun 2025 12:06:44 +0300
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
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
Message-ID: <aFkZJKnweqBi64b8@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-10-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 18, 2025 at 05:43:44PM +0530, Anup Patel wrote:
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
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/wordpart.h>

...

> +enum rpmi_clk_config {
> +	RPMI_CLK_DISABLE = 0,
> +	RPMI_CLK_ENABLE = 1

It's still unclear if this enum can be expanded in the future (and no, you may
not answer this either). Hence, to reduce potential churn in the future, leave
the trailing comma here.

> +};

...

> +union rpmi_clk_rates {
> +	u64 discrete[RPMI_CLK_DISCRETE_MAX_NUM_RATES];
> +	struct {
> +		u64 min;
> +		u64 max;
> +		u64 step;
> +	} linear;

Have you looked at the linear_range.h? Why can it not be (re-)used here?

> +};

...

> +static u32 rpmi_clk_get_num_clocks(struct rpmi_clk_context *context)
> +{
> +	struct rpmi_get_num_clocks_rx rx;
> +	struct rpmi_mbox_message msg;
> +	int ret;
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_NUM_CLOCKS,
> +					  NULL, 0, &rx, sizeof(rx));

...here

> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +

This blank line should be rather ^^^

> +	if (ret || rx.status)
> +		return 0;

Why rx.status can't be checked before calling to a sending message?
Sounds like the rpmi_mbox_init_send_with_response() links rx to msg somehow.
If this is the case, use msg here, otherwise move the check to be in the
correct place.

Seems the same question to the all similar checks in the code.

> +	return le32_to_cpu(rx.num_clocks);
> +}

...

> +static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk *rpmi_clk)
> +{
> +	struct rpmi_clk_context *context = rpmi_clk->context;
> +	struct rpmi_clk_rate_discrete *rate_discrete;
> +	struct rpmi_clk_rate_linear *rate_linear;
> +	struct rpmi_get_supp_rates_rx *rx __free(kfree) = NULL;
> +	struct rpmi_get_supp_rates_tx tx;
> +	struct rpmi_mbox_message msg;

> +	size_t clk_rate_idx = 0;

This kind of assignments is hard to maintain and it's mistake prone in case
some additional code is injected in the future that might reuse it.

> +	int ret, rateidx, j;
> +
> +	tx.clkid = cpu_to_le32(clkid);
> +	tx.clk_rate_idx = 0;
> +
> +	/*
> +	 * Make sure we allocate rx buffer sufficient to be accommodate all
> +	 * the rates sent in one RPMI message.
> +	 */
> +	rx = kzalloc(context->max_msg_data_size, GFP_KERNEL);
> +	if (!rx)
> +		return -ENOMEM;
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> +					  &tx, sizeof(tx), rx, context->max_msg_data_size);
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx->status)
> +		return rpmi_to_linux_error(le32_to_cpu(rx->status));
> +	if (!le32_to_cpu(rx->returned))
> +		return -EINVAL;
> +
> +	if (rpmi_clk->type == RPMI_CLK_DISCRETE) {
> +		rate_discrete = (struct rpmi_clk_rate_discrete *)rx->rates;
> +
> +		for (rateidx = 0; rateidx < le32_to_cpu(rx->returned); rateidx++) {
> +			rpmi_clk->rates->discrete[rateidx] =
> +				rpmi_clkrate_u64(le32_to_cpu(rate_discrete[rateidx].hi),
> +						 le32_to_cpu(rate_discrete[rateidx].lo));
> +		}
> +
> +		/*
> +		 * Keep sending the request message until all
> +		 * the rates are received.
> +		 */
> +		while (le32_to_cpu(rx->remaining)) {
> +			clk_rate_idx += le32_to_cpu(rx->returned);
> +			tx.clk_rate_idx = cpu_to_le32(clk_rate_idx);
> +
> +			rpmi_mbox_init_send_with_response(&msg,
> +							  RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> +							  &tx, sizeof(tx),
> +							  rx, context->max_msg_data_size);
> +			ret = rpmi_mbox_send_message(context->chan, &msg);
> +			if (ret)
> +				return ret;
> +			if (rx->status)
> +				return rpmi_to_linux_error(le32_to_cpu(rx->status));
> +			if (!le32_to_cpu(rx->returned))
> +				return -EINVAL;
> +
> +			for (j = 0; j < le32_to_cpu(rx->returned); j++) {
> +				if (rateidx >= clk_rate_idx + le32_to_cpu(rx->returned))
> +					break;
> +				rpmi_clk->rates->discrete[rateidx++] =
> +					rpmi_clkrate_u64(le32_to_cpu(rate_discrete[j].hi),
> +							 le32_to_cpu(rate_discrete[j].lo));
> +			}
> +		}
> +	} else if (rpmi_clk->type == RPMI_CLK_LINEAR) {
> +		rate_linear = (struct rpmi_clk_rate_linear *)rx->rates;
> +
> +		rpmi_clk->rates->linear.min = rpmi_clkrate_u64(le32_to_cpu(rate_linear->min_hi),
> +							       le32_to_cpu(rate_linear->min_lo));
> +		rpmi_clk->rates->linear.max = rpmi_clkrate_u64(le32_to_cpu(rate_linear->max_hi),
> +							       le32_to_cpu(rate_linear->max_lo));
> +		rpmi_clk->rates->linear.step = rpmi_clkrate_u64(le32_to_cpu(rate_linear->step_hi),
> +								le32_to_cpu(rate_linear->step_lo));
> +	}
> +
> +	return 0;
> +}

...

> +static int rpmi_clk_determine_rate(struct clk_hw *hw,
> +				   struct clk_rate_request *req)
> +{
> +	struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
> +	u64 fmin, fmax, ftmp;
> +
> +	/*
> +	 * Keep the requested rate if the clock format
> +	 * is of discrete type. Let the platform which
> +	 * is actually controlling the clock handle that.
> +	 */
> +	if (rpmi_clk->type == RPMI_CLK_DISCRETE)
> +		return 0;
> +
> +	fmin = rpmi_clk->rates->linear.min;
> +	fmax = rpmi_clk->rates->linear.max;
> +
> +	if (req->rate <= fmin) {
> +		req->rate = fmin;
> +		return 0;

> +	} else if (req->rate >= fmax) {

Redundant 'else', but I see the wish to tight the conditional together.

> +		req->rate = fmax;
> +		return 0;
> +	}
> +
> +	ftmp = req->rate - fmin;
> +	ftmp += rpmi_clk->rates->linear.step - 1;
> +	do_div(ftmp, rpmi_clk->rates->linear.step);
> +
> +	req->rate = ftmp * rpmi_clk->rates->linear.step + fmin;
> +
> +	return 0;
> +}

...

> +static void rpmi_clk_disable(struct clk_hw *hw)
> +{
> +	struct rpmi_clk *rpmi_clk = to_rpmi_clk(hw);
> +	struct rpmi_clk_context *context = rpmi_clk->context;
> +	struct rpmi_mbox_message msg;
> +	struct rpmi_set_config_tx tx;
> +	struct rpmi_set_config_rx rx;
> +	int ret;
> +
> +	tx.config = cpu_to_le32(RPMI_CLK_DISABLE);
> +	tx.clkid = cpu_to_le32(rpmi_clk->id);
> +
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_CONFIG,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret || rx.status)
> +		pr_err("Failed to disable clk-%u\n", rpmi_clk->id);

Close to useless message. You may improve it by splitting to two and printing
rx.status in one and ret in the other with different text. Or drop it.

> +}

> +static int rpmi_clk_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	unsigned int num_clocks, i;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct rpmi_clk_context *context;
> +	struct rpmi_mbox_message msg;
> +	struct clk_hw *hw_ptr;
> +	struct device *dev = &pdev->dev;
> +
> +	context = devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
> +	if (!context)
> +		return -ENOMEM;
> +	context->dev = dev;
> +	platform_set_drvdata(pdev, context);
> +
> +	context->client.dev		= context->dev;
> +	context->client.rx_callback	= NULL;
> +	context->client.tx_block	= false;
> +	context->client.knows_txdone	= true;
> +	context->client.tx_tout		= 0;
> +
> +	context->chan = mbox_request_channel(&context->client, 0);
> +	if (IS_ERR(context->chan))
> +		return PTR_ERR(context->chan);

Here is an incorrect order of the freeing resources. Besides that, wrapping the
mbox_free_channel() into managed resources reduces this code by more
than 10 LoCs! At bare minimum if will fix the bug,

> +	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, ret, "Failed to get spec version\n");
> +	}
> +	if (msg.attr.value < RPMI_MKVER(1, 0)) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, -EINVAL,
> +				     "msg protocol version mismatch, expected 0x%x, found 0x%x\n",
> +				     RPMI_MKVER(1, 0), msg.attr.value);
> +	}
> +
> +	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_ID);
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, ret, "Failed to get service group ID\n");
> +	}
> +	if (msg.attr.value != RPMI_SRVGRP_CLOCK) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, -EINVAL,
> +				     "service group match failed, expected 0x%x, found 0x%x\n",
> +				     RPMI_SRVGRP_CLOCK, msg.attr.value);
> +	}
> +
> +	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_VERSION);
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, ret, "Failed to get service group version\n");
> +	}
> +	if (msg.attr.value < RPMI_MKVER(1, 0)) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, -EINVAL,
> +				     "service group version failed, expected 0x%x, found 0x%x\n",
> +				     RPMI_MKVER(1, 0), msg.attr.value);
> +	}
> +
> +	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE);
> +	ret = rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, ret, "Failed to get max message data size\n");
> +	}
> +
> +	context->max_msg_data_size = msg.attr.value;
> +	num_clocks = rpmi_clk_get_num_clocks(context);
> +	if (!num_clocks) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, -ENODEV, "No clocks found\n");
> +	}
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, num_clocks),
> +				GFP_KERNEL);

(The above mention problem comes here after the successful allocation of
 clk_data but failing of any further code.

> +	if (!clk_data) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, -ENOMEM, "No memory for clock data\n");
> +	}
> +	clk_data->num = num_clocks;
> +
> +	for (i = 0; i < clk_data->num; i++) {
> +		hw_ptr = rpmi_clk_enumerate(context, i);
> +		if (IS_ERR(hw_ptr)) {
> +			mbox_free_channel(context->chan);
> +			return dev_err_probe(dev, PTR_ERR(hw_ptr),
> +					     "failed to register clk-%d\n", i);
> +		}
> +		clk_data->hws[i] = hw_ptr;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret) {
> +		mbox_free_channel(context->chan);
> +		return dev_err_probe(dev, ret, "failed to register clock HW provider\n");
> +	}
> +
> +	return 0;
> +}

...

> +static void rpmi_clk_remove(struct platform_device *pdev)
> +{
> +	struct rpmi_clk_context *context = platform_get_drvdata(pdev);
> +
> +	mbox_free_channel(context->chan);
> +}

This function will be gone. See above.

-- 
With Best Regards,
Andy Shevchenko


