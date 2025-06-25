Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF7C1E3DFE;
	Wed, 25 Jun 2025 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831139; cv=none; b=VbzQfOIb4etO46LFMVtmEqpWxjhKPTd0sOg3Bopv8rvc5BSpvUMvheOtGqHuk6q9swdEuw/IdgzxmYV+urmS9Wp9n+Jauyh/CKynEzVY6cJsHA8nM5TykE+f0ZCfmVcFSacFqesFbwcuoSYNkpd5KXlLjehGly1jn1IkS9WrDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831139; c=relaxed/simple;
	bh=AfvqYQr7U6vmV9e48vb2V3EQqebU9NTdJEJaTXiNebs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWrzksm3Pp/h9lHRxyRhnAJTsKEFmKXMG5WrGHcFwvP7ngQ2ABZ1Li9SrkawFZwM2mgUiLWE5Zqnoosl5FlM1d1KQfGNyyF0CY5sPMyiWWOlz9ZNgVX1xaylvbgbodds++91Zimy7xZiHN5bYoGxJAAAudPsf+J8GnMSQZNzJC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMtAs2qE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMtAs2qE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2853FC4CEEA;
	Wed, 25 Jun 2025 05:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750831137;
	bh=AfvqYQr7U6vmV9e48vb2V3EQqebU9NTdJEJaTXiNebs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMtAs2qERnJ68/BiXdKAODjkaqn+v0+bs/Jxi77/Vb4Frvdr+cNOO2CMIGyLGn/vB
	 o4K/5OffWtCWLRa3LMqX9npJJVPEb8zf5jf7S8KBOpvVvFRdH1CjDyMrjt92EsLxvY
	 ynsgMh+hkHjDAp4WlyntSrr1STwVh97TxbhsKHNw54acjLL0KezfMO+R0lTeOdlUZ9
	 uj/NamCNiEDkZE6Xz9PYnu6u2tCUKARKDPjr3vogsd5B87trVprxYL68ojKtBRtQ06
	 QEbnhzC5+fajUzQBM03bKxY/q4ZbrGokTosXo2gWMN8gqJK+HfF8mmA1797fKKEVQY
	 fRf2/ghNr6scg==
Date: Wed, 25 Jun 2025 05:58:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aFuQHqSd9kT87tsF@google.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>

On Mon, Jun 16, 2025 at 04:01:13PM +0200, Michal Gorlas wrote:
> Places a blob with Linux-owned SMI handler in the lower 4GB of memory, calculates
> entry points for the it and triggers SMI to coreboot's SMI handler
                   ^^^
s/the//?
s/Places/Place/;s/calculates/calculate/;s/triggers/trigger/.

> informing it where to look for Linux-owned SMI handler.

How about repharse the message to something like:

    Load Linux-owned SMI handler:
    - Place Linux-owned SMI handler in ...
    - Inform coreboot the location of Linux-owned SMI handler via SMI ...

    On success, the Linux-owned SMI handler takes over all upcoming SMIs.

> diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
> [...]
> +
> +# LinuxBootSMM related.
> +payload-mm-$(CONFIG_COREBOOT_PAYLOAD_MM)	:= mm_loader.o mm_blob.o
> +
> +subdir-						:= mm_handler

subdir-$(CONFIG_COREBOOT_PAYLOAD_MM)?

> +obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= payload-mm.o
> +
> +$(obj)/mm_blob.o: $(obj)/mm_handler/handler.bin
> +
> +$(obj)/mm_handler/handler.bin: FORCE
> +	$(Q)$(MAKE) $(build)=$(obj)/mm_handler $@

mm_handler/ isn't visible to this patch. Separate them into the following
patch of series?

> diff --git a/drivers/firmware/google/mm_blob.S b/drivers/firmware/google/mm_blob.S
> [...]
> +SYM_DATA_START(mm_blob)
> +	.incbin	"drivers/firmware/google/mm_handler/handler.bin"
> +SYM_DATA_END_LABEL(mm_blob, SYM_L_GLOBAL, mm_blob_end)
> +
> +SYM_DATA_START(mm_relocs)
> +	.incbin	"drivers/firmware/google/mm_handler/handler.relocs"
> +SYM_DATA_END(mm_relocs)

mm_handler/ isn't visible to this patch. Separate them into the following
patch of series?

> diff --git a/drivers/firmware/google/mm_loader.c b/drivers/firmware/google/mm_loader.c
> [...]
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/cpu.h>
> +#include <linux/delay.h>
> +#include <linux/gfp.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>

Please review again if it really needs to include the headers. Does it need
to include cpu.h, mm.h, and slab.h?

Also sort them alphabetically.

> +struct mm_header *mm_header;
> +static void *shared_buffer;
> +static size_t blob_size;
> +static struct lb_pld_mm_interface_info *mm_cbtable_info;
> +struct mm_info *mm_info;

No. Please allocate a driver specific struct and access it via
dev_set_drvdata() and dev_get_drvdata() if the context needs to be kept.

> +static int trigger_smi(u64 cmd, u64 arg, u64 retry)
> +{
> +	u64 status;
> [...]
> +
> +	if (status == cmd || status == PAYLOAD_MM_RET_FAILURE)
> +		status = PAYLOAD_MM_RET_FAILURE;
> +	else
> +		status = PAYLOAD_MM_RET_SUCCESS;

No. Please use -errno in the kernel.

> +static int get_mm_info(struct coreboot_device *dev)
> +{
> +	mm_cbtable_info = &dev->mm_info;
> +	if (mm_cbtable_info->tag != LB_TAG_PLD_MM_INTERFACE_INFO)
> +		return -ENXIO;
> +
> +	mm_info = devm_kzalloc(&dev->dev, sizeof(*mm_info), GFP_KERNEL);
> +	if (!mm_info)
> +		return -ENOMEM;
> +
> +	mm_info->revision = mm_cbtable_info->revision;
> +	mm_info->requires_long_mode_call =
> +		mm_cbtable_info->requires_long_mode_call;
> +	mm_info->register_mm_entry_command =
> +		mm_cbtable_info->register_mm_entry_command;

Does it really need to copy the data from `&dev->mm_info`?

> +static int mm_loader_probe(struct coreboot_device *dev)
> +{
> +	if (get_mm_info(dev))
> +		return -ENOMEM;

get_mm_info() isn't necessarily to be -ENOMEM. How about:

    ret = get_mm_info(...);
    if (ret)
        return ret;

> +
> +	u32 entry_point;
> +
> +	entry_point = place_handler(&dev->dev);
> +
> +	if (register_entry_point(&dev->dev, mm_info, entry_point)) {
> +		dev_warn(&dev->dev, ": registering entry point for MM payload failed.\n");
> +		return -1;

Please use -errno in the kernel. -ENOENT or -ENOTSUPP?

> +	}
> +
> +	/*
> +	 * Gives SMI some time in case it takes longer than expected.
> +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> +	 */
> +	mdelay(100);

This looks weird. Are there some ways for Linux to be aware of the SMI has
completed?
