Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5878121420A;
	Wed, 28 May 2025 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429585; cv=none; b=UWA0/DWFB76HDxxKRG5GoySO4cXmOmxdtW4StppU1jvpvS2jtyZrBTYvmJ1AmW7tyA+w8GX+rtfVxchcLqGyrl7SJ85GDXh1eUto28Yd/spazLadqygGcA6ql8Hvh2lDJpzQ9C6M0lPCPN28yH5z8rxrwL35LLv0GofWa4OX6P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429585; c=relaxed/simple;
	bh=NAQa13db1BCPMZRo+1ORViw4igtX5oFCHLsMQq5GQkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUXem8HXlX8xFnyzyhamQw40oPcGdyIus7KFmBS0zNcV/8sYUM018knG1gw459W9jtFG50jGGbbj/rYGvTl+VZVIf9e+xW0YlUK2NR74I2UXeioG1eyD0hG2+TpxsnriNERVN/80igVNu9bn5FSeruQkOWeNaLa++ZQFdWuj9Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgzlkWPE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgzlkWPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748429583; x=1779965583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NAQa13db1BCPMZRo+1ORViw4igtX5oFCHLsMQq5GQkc=;
  b=KgzlkWPEw9E32usoT3zlpBWAHXWjvPXq9aCNbxzjHjL+8gcd+585rELW
   Lp8sU8oOB+fSuRGEL1+xwwCNcQkiSpxICJjOqsm01jAisSmjiBTRnCn5t
   jYy3wKWyxOJwGYHw5zN7tGEM5MmmJjYADtUa7HZtDY9Uqzg7kxggAUswS
   qPUqUM3LWUHYLx6cuoJWSYbUH+MfndvebemrMGvzWRlsbzspiARjNu9xQ
   ikahm7TOxGnDMH5qN4CyU0hnRFhHvAWW2s4a4qxEH+F1a+7r+4DTrMu7x
   4pbKcEJS+BFkvDrt6j+Nkw+ODo5cCMWVJITToVufBcMEJRqFoQyXd21GN
   A==;
X-CSE-ConnectionGUID: Uy4VPVUlQOKnv54X9ypo2Q==
X-CSE-MsgGUID: sScb+9CSQE2lSIXT8Pg0PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50606312"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="50606312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:53:02 -0700
X-CSE-ConnectionGUID: LyqcDhdHSYOoQV332uUgFA==
X-CSE-MsgGUID: twjzfp7dR5G/KyU02as1yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143237950"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 03:52:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uKEOy-00000001QBJ-2Avs;
	Wed, 28 May 2025 13:52:52 +0300
Date: Wed, 28 May 2025 13:52:52 +0300
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
Subject: Re: [PATCH v4 07/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aDbrBFcgaJxgBRVZ@smile.fi.intel.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-8-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-8-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 25, 2025 at 02:16:54PM +0530, Anup Patel wrote:
> Add a mailbox controller driver for the new SBI message proxy extension
> which is part of the SBI v3.0 specification.

...

> +#include <asm/sbi.h>

asm/* usually goes after generic linux/* ones. Why here?

> +#include <linux/cpu.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/jump_label.h>

> +#include <linux/kernel.h>

What for?

> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_irq.h>
> +#include <linux/percpu.h>
> +#include <linux/platform_device.h>
> +#include <linux/smp.h>

Please, double check that you follow IWYU (Include What You Use) principle and
have no "proxy" headers.

(E.g., types.h is missing here, but it got included via one of the above, like
kernel.h)

...

> +
> +	get_cpu();
> +
> +	/* Get the remaining and returned fields to calculate total */
> +	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
> +			 0, 0, 0, 0, 0, 0);
> +	if (!sret.error) {

Can it be standard pattern?

	if (error)
		goto err_put_cpu;

Ditto for other similar cases.

> +		remaining = le32_to_cpu(sdata->remaining);
> +		returned = le32_to_cpu(sdata->returned);
> +		*channel_count = remaining + returned;
> +	}
> +
> +	put_cpu();
> +	return sbi_err_map_linux_errno(sret.error);
> +}

...

> +static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
> +{
> +	u32 remaining, returned, sidx, start_index = 0, cidx = 0;
> +	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
> +	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
> +	struct sbiret sret;
> +
> +	if (!mpxy->shmem_active)
> +		return -ENODEV;
> +	if (!channel_count || !channel_ids)
> +		return -EINVAL;
> +
> +	get_cpu();
> +
> +	do {
> +		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
> +				 start_index, 0, 0, 0, 0, 0);
> +		if (sret.error)
> +			goto done;
> +
> +		remaining = le32_to_cpu(sdata->remaining);
> +		returned = le32_to_cpu(sdata->returned);
> +
> +		for (sidx = 0; sidx < returned && cidx < channel_count; sidx++) {
> +			channel_ids[cidx] = le32_to_cpu(sdata->channel_array[sidx]);
> +			cidx += 1;
> +		}
> +
> +		start_index = cidx;
> +
> +	} while (remaining);
> +
> +done:

It sounds to me like an 'err_put_cpu' for the name.

> +	put_cpu();
> +	return sbi_err_map_linux_errno(sret.error);
> +}

> +static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
> +			    u32 *attrs_buf)
> +{
> +	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
> +	struct sbiret sret;
> +	u32 i;
> +
> +	if (!mpxy->shmem_active)
> +		return -ENODEV;
> +	if (!attr_count || !attrs_buf)
> +		return -EINVAL;
> +
> +	get_cpu();
> +
> +	for (i = 0; i < attr_count; i++)
> +		((__le32 *)mpxy->shmem)[i] = cpu_to_le32(attrs_buf[i]);

Don't we have helpers for this? They are suffixed with _array.
https://elixir.bootlin.com/linux/v6.15-rc6/source/include/linux/byteorder/generic.h#L168
Don't forget to have asm/byteorder.h being included.

Ditto for the similar case(s).

> +	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
> +			 channel_id, base_attrid, attr_count, 0, 0, 0);
> +
> +	put_cpu();
> +	return sbi_err_map_linux_errno(sret.error);
> +}

...

> +	msg->error = rc;
> +	return 0;

What's the point of having int and not void function?

...

> +			       sizeof(mchan->rpmi_attrs) / sizeof(u32),
> +			       (u32 *)&mchan->rpmi_attrs);

Why casting? What about alignment?

...

> +	while (1) {

Do it as do {} while, it will give an idea that the loop will run at least once
(without looking into condition), ideally it shouldn't be infinite loop, but it
might be harder to realise.

> +		rc = mpxy_get_notifications(mchan->channel_id, notif, &data_len);
> +		if (rc || !data_len)
> +			break;
> +
> +		if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID)
> +			mpxy_mbox_peek_rpmi_data(chan, mchan, notif, data_len);
> +
> +		have_notifications = true;
> +	}

...

> +static void mpxy_mbox_cleanup_events(struct mpxy_mbox_channel *mchan)
> +{
> +	struct device *dev = mchan->mbox->dev;
> +	int rc;
> +
> +	/* Do nothing if events state not supported */
> +	if (!mchan->have_events_state)
> +		return;
> +
> +	/* Do nothing if events state already disabled */
> +	if (!mchan->attrs.events_state_ctrl)
> +		return;
> +
> +	/* Disable channel events state */
> +	mchan->attrs.events_state_ctrl = 0;
> +	rc = mpxy_write_attrs(mchan->channel_id, SBI_MPXY_ATTR_EVENTS_STATE_CONTROL,
> +			      1, &mchan->attrs.events_state_ctrl);

> +	if (rc) {
> +		dev_err(dev, "disable events state failed for MPXY channel 0x%x\n",
> +			mchan->channel_id);
> +	}

Redundant {}.

> +}

...

> +static int mpxy_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mpxy_mbox_channel *mchan;
> +	struct mpxy_mbox *mbox;
> +	int i, msi_idx, rc;

Why is 'i' signed? Also make sure either they use POD (like unsigned int) or
exact data type the upper limit does or API where you pass it in.

> +	u32 *channel_ids;
> +
> +	/*
> +	 * Initialize MPXY shared memory only once. This also ensures
> +	 * that SBI MPXY mailbox is probed only once.
> +	 */
> +	if (mpxy_shmem_init_done) {
> +		dev_err(dev, "SBI MPXY mailbox already initialized\n");
> +		return -EALREADY;
> +	}
> +
> +	/* Probe for SBI MPXY extension */
> +	if (sbi_spec_version < sbi_mk_version(1, 0) ||
> +	    sbi_probe_extension(SBI_EXT_MPXY) <= 0) {
> +		dev_info(dev, "SBI MPXY extension not available\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Find-out shared memory size */
> +	mpxy_shmem_size = mpxy_get_shmem_size();
> +
> +	/*
> +	 * Setup MPXY shared memory on each CPU
> +	 *
> +	 * Note: Don't cleanup MPXY shared memory upon CPU power-down
> +	 * because the RPMI System MSI irqchip driver needs it to be
> +	 * available when migrating IRQs in CPU power-down path.
> +	 */
> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sbi-mpxy-shmem",
> +			  mpxy_setup_shmem, NULL);
> +
> +	/* Mark as MPXY shared memory initialization done */
> +	mpxy_shmem_init_done = true;
> +
> +	/* Allocate mailbox instance */
> +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +	mbox->dev = dev;
> +	platform_set_drvdata(pdev, mbox);
> +
> +	/* Find-out of number of channels */
> +	rc = mpxy_get_channel_count(&mbox->channel_count);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "failed to get number of MPXY channels\n");
> +	if (!mbox->channel_count)
> +		dev_err_probe(dev, -ENODEV, "no MPXY channels available\n");
> +
> +	/* Allocate and fetch all channel IDs */
> +	channel_ids = devm_kcalloc(dev, mbox->channel_count,
> +				   sizeof(*channel_ids), GFP_KERNEL);
> +	if (!channel_ids)
> +		return -ENOMEM;
> +	rc = mpxy_get_channel_ids(mbox->channel_count, channel_ids);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "failed to MPXY channel IDs\n");
> +
> +	/* Populate all channels */
> +	mbox->channels = devm_kcalloc(dev, mbox->channel_count,
> +				      sizeof(*mbox->channels), GFP_KERNEL);
> +	if (!mbox->channels)
> +		return -ENOMEM;
> +	for (i = 0; i < mbox->channel_count; i++) {
> +		mchan = &mbox->channels[i];
> +		mchan->mbox = mbox;
> +		mchan->channel_id = channel_ids[i];
> +
> +		rc = mpxy_read_attrs(mchan->channel_id, SBI_MPXY_ATTR_MSG_PROT_ID,
> +				     sizeof(mchan->attrs) / sizeof(u32),
> +				     (u32 *)&mchan->attrs);
> +		if (rc) {
> +			return dev_err_probe(dev, rc,
> +					     "MPXY channel 0x%x read attrs failed\n",
> +					     mchan->channel_id);
> +		}
> +
> +		if (mchan->attrs.msg_proto_id == SBI_MPXY_MSGPROTO_RPMI_ID) {
> +			rc = mpxy_mbox_read_rpmi_attrs(mchan);
> +			if (rc) {
> +				return dev_err_probe(dev, rc,
> +						     "MPXY channel 0x%x read RPMI attrs failed\n",
> +						     mchan->channel_id);
> +			}
> +		}
> +
> +		mchan->notif = devm_kzalloc(dev, mpxy_shmem_size, GFP_KERNEL);
> +		if (!mchan->notif)
> +			return -ENOMEM;
> +
> +		mchan->max_xfer_len = min(mpxy_shmem_size, mchan->attrs.msg_max_len);
> +
> +		if ((mchan->attrs.capability & SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS) &&
> +		    (mchan->attrs.capability & SBI_MPXY_CHAN_CAP_EVENTS_STATE))
> +			mchan->have_events_state = true;
> +
> +		if ((mchan->attrs.capability & SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS) &&
> +		    (mchan->attrs.capability & SBI_MPXY_CHAN_CAP_MSI))
> +			mchan->msi_index = mbox->msi_count++;
> +		else
> +			mchan->msi_index = U32_MAX;
> +		mchan->msi_irq = U32_MAX;
> +	}

> +	/* Free-up channel IDs */
> +	devm_kfree(dev, channel_ids);

Just no. This is most likely (99.9%) wrong use of managed resources. This is
the biggest issue with this patch so far.

> +	/* Initialize mailbox controller */
> +	mbox->controller.txdone_irq = false;
> +	mbox->controller.txdone_poll = false;
> +	mbox->controller.ops = &mpxy_mbox_ops;
> +	mbox->controller.dev = dev;
> +	mbox->controller.num_chans = mbox->channel_count;
> +	mbox->controller.fw_xlate = mpxy_mbox_fw_xlate;
> +	mbox->controller.chans = devm_kcalloc(dev, mbox->channel_count,
> +					      sizeof(*mbox->controller.chans),
> +					      GFP_KERNEL);
> +	if (!mbox->controller.chans)
> +		return -ENOMEM;
> +	for (i = 0; i < mbox->channel_count; i++)
> +		mbox->controller.chans[i].con_priv = &mbox->channels[i];
> +
> +	/* Set the MSI domain if not available */
> +	if (!dev_get_msi_domain(dev)) {
> +		/*
> +		 * The device MSI domain for OF devices is only set at the
> +		 * time of populating/creating OF device. If the device MSI
> +		 * domain is discovered later after the OF device is created
> +		 * then we need to set it explicitly before using any platform
> +		 * MSI functions.
> +		 */
> +		if (is_of_node(dev_fwnode(dev)))
> +			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +	}
> +
> +	/* Setup MSIs for mailbox (if required) */
> +	if (mbox->msi_count) {
> +		mbox->msi_index_to_channel = devm_kcalloc(dev, mbox->msi_count,
> +							  sizeof(*mbox->msi_index_to_channel),
> +							  GFP_KERNEL);
> +		if (!mbox->msi_index_to_channel)
> +			return -ENOMEM;
> +
> +		for (msi_idx = 0; msi_idx < mbox->msi_count; msi_idx++) {
> +			for (i = 0; i < mbox->channel_count; i++) {
> +				mchan = &mbox->channels[i];
> +				if (mchan->msi_index == msi_idx) {
> +					mbox->msi_index_to_channel[msi_idx] = mchan;
> +					break;
> +				}
> +			}
> +		}
> +
> +		rc = platform_device_msi_init_and_alloc_irqs(dev, mbox->msi_count,
> +							     mpxy_mbox_msi_write);
> +		if (rc) {
> +			return dev_err_probe(dev, rc, "Failed to allocate %d MSIs\n",
> +					     mbox->msi_count);
> +		}
> +
> +		for (i = 0; i < mbox->channel_count; i++) {
> +			mchan = &mbox->channels[i];
> +			if (mchan->msi_index == U32_MAX)
> +				continue;
> +			mchan->msi_irq = msi_get_virq(dev, mchan->msi_index);
> +		}
> +	}
> +
> +	/* Register mailbox controller */
> +	rc = devm_mbox_controller_register(dev, &mbox->controller);
> +	if (rc) {
> +		dev_err_probe(dev, rc, "Registering SBI MPXY mailbox failed\n");
> +		if (mbox->msi_count)
> +			platform_device_msi_free_irqs_all(dev);
> +		return rc;
> +	}
> +
> +	dev_info(dev, "mailbox registered with %d channels\n",
> +		 mbox->channel_count);
> +	return 0;
> +}

...

> +	if (mbox->msi_count)

Is this check really needed?

> +		platform_device_msi_free_irqs_all(mbox->dev);
> +}

...

> +static const struct of_device_id mpxy_mbox_of_match[] = {
> +	{.compatible = "riscv,sbi-mpxy-mbox", },
> +	{},

No comma for the terminator entry.
You should apply the reviewers' comments on all of your code, not just where it
was commented.

> +};

-- 
With Best Regards,
Andy Shevchenko


