Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C772500AA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067463; cv=none; b=IgmkUfyfMtAbCW0Cpcsw5HTtKmN+Hg/7nN2qj7bmWV7yXR6jd/AzMZf2jseM8FYhpqjbwX9lavZFqtIQQPbZQiQ3nQGDjg+Dng1j1TvQ4B0eBEJARFkms2yp43uxllJcKOOmZim+SV+SYJS7bUVQm6oTs8bKvom0oJeShJ4wPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067463; c=relaxed/simple;
	bh=yuUA8tc5ZQqaQNeKWPw3vq4fpyzsoAnPGRVVajrP1Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBAvPlJkU4a+l+1gyXfvt0ZKsDHeQ6jOf1agN8sX/d3/L8q2szDd5ZyuwFVwj6j8oS32DT1r6DL23CQGTIfdJDgCXomSRkEQhGK3BPEiNRXyq1KM3mHIDhpYsaOXpUmVa4NKnW6UMaCGrWAdwhoY8PKNwd8fKBzls9okvH5jQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9giMf73; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9giMf73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8833BC4CEEE;
	Mon, 12 May 2025 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747067463;
	bh=yuUA8tc5ZQqaQNeKWPw3vq4fpyzsoAnPGRVVajrP1Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W9giMf73LsTUzZNJr9gPt9p1NMj5cDbRqADZxoP2tAfFMC77oInW8wkwnv/SqAp+B
	 nFV7yonnJvuO83Jm3OEwh3lCBSCuinNfJGTawYqXETtzQ1/aRVY/5Wr8mZfx4MRU7X
	 HGXQi7Z3swtqFnN/8LCa8DeZ2dgEQNIQen7LOszdERpG1ishKTHCjdAIDnqbODWsEX
	 3WC/NL6rk+4hWMiQbAFEfgsUfKsjBg/jr/nBpTfGQbZqK609ezrE6kS6ol2PAb8g9r
	 MlAQVRzg7/coHkJl6iUpvhj6KYqzikE67F93aji/tDg5HQqeNUwIgIapOfO7ehrDs2
	 HeGc8Ymw6rF6A==
Date: Mon, 12 May 2025 18:30:58 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 2/4] irqchip/gic-v3-its: Implement .msi_teardown()
 callback
Message-ID: <aCIiQmfDUNrOCC2y@lpieralisi>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-3-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511163520.1307654-3-maz@kernel.org>

On Sun, May 11, 2025 at 05:35:18PM +0100, Marc Zyngier wrote:
> We currently nuke the structure representing an endpoint device
> translating via an ITS on freeing the last LPI allocated for it.
> 
> That's an unfortunate state of affair, as it is pretty common for
> a driver to allocate a single MSI, do something clever, teardown
> this MSI, and reallocate a whole bunch of them. The nvme driver
> does exactly that, amongst others.
> 
> What happens in that case is that the core code is buggy enough
> to issue another .msi_prepare() call, even if it shouldn't.
> This luckily cancels the above behaviour and hides the problem.
> 
> In order to fix the core code, let's start by implementing the new
> .msi_teardown() callback. Nothing calls it yet, so a side effect
> is that the its_dev structure will not be freed and that the DID
> will stay mapped. Not a big deal, and this will be solved in the
> following patch.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-v3-its-msi-parent.c | 10 ++++
>  drivers/irqchip/irq-gic-v3-its.c            | 56 +++++++++++++--------
>  2 files changed, 45 insertions(+), 21 deletions(-)

First off, thanks a lot for putting this together, it makes an awful
lot of sense to me.

> index 0115ad6c82593..3472b97477104 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3620,8 +3620,43 @@ static int its_msi_prepare(struct irq_domain *domain, struct device *dev,
>  	return err;
>  }
>  
> +static void its_msi_teardown(struct irq_domain *domain, msi_alloc_info_t *info)
> +{
> +	struct msi_domain_info *msi_info;
> +	struct its_device *its_dev;
> +	struct its_node *its;
> +	u32 dev_id;
> +
> +	dev_id = info->scratchpad[0].ul;

I have just managed to get to a keyboard :), I don't think the dev_id
makes it to this point, we overwrite it with the its_dev pointer in
its_msi_prepare() (could use second scratchpad for the pointer maybe ?).

I was bitten by this while removing the old IWB code into the new one
(unrelated to this code but that's how I noticed scratchpad is a union).

Ignore me if I am mistaken, just reading the code, have not tested it
(but I am about to do it for v5).

Thanks,
Lorenzo

> +
> +	msi_info = msi_get_domain_info(domain);
> +	its = msi_info->data;
> +
> +	guard(mutex)(&its->dev_alloc_lock);
> +
> +	its_dev = its_find_device(its, dev_id);
> +
> +	/* If the device is shared, keep everything around */
> +	if (its_dev->shared)
> +		return;
> +
> +	/* LPIs should have been already unmapped at this stage */
> +	if (WARN_ON_ONCE(!bitmap_empty(its_dev->event_map.lpi_map,
> +				       its_dev->event_map.nr_lpis)))
> +		return;
> +
> +	its_lpi_free(its_dev->event_map.lpi_map,
> +		     its_dev->event_map.lpi_base,
> +		     its_dev->event_map.nr_lpis);
> +
> +	/* Unmap device/itt, and get rid of the tracking */
> +	its_send_mapd(its_dev, 0);
> +	its_free_device(its_dev);
> +}
> +
>  static struct msi_domain_ops its_msi_domain_ops = {
>  	.msi_prepare	= its_msi_prepare,
> +	.msi_teardown	= its_msi_teardown,
>  };
>  
>  static int its_irq_gic_domain_alloc(struct irq_domain *domain,
> @@ -3722,7 +3757,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
>  {
>  	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>  	struct its_device *its_dev = irq_data_get_irq_chip_data(d);
> -	struct its_node *its = its_dev->its;
>  	int i;
>  
>  	bitmap_release_region(its_dev->event_map.lpi_map,
> @@ -3736,26 +3770,6 @@ static void its_irq_domain_free(struct irq_domain *domain, unsigned int virq,
>  		irq_domain_reset_irq_data(data);
>  	}
>  
> -	mutex_lock(&its->dev_alloc_lock);
> -
> -	/*
> -	 * If all interrupts have been freed, start mopping the
> -	 * floor. This is conditioned on the device not being shared.
> -	 */
> -	if (!its_dev->shared &&
> -	    bitmap_empty(its_dev->event_map.lpi_map,
> -			 its_dev->event_map.nr_lpis)) {
> -		its_lpi_free(its_dev->event_map.lpi_map,
> -			     its_dev->event_map.lpi_base,
> -			     its_dev->event_map.nr_lpis);
> -
> -		/* Unmap device/itt */
> -		its_send_mapd(its_dev, 0);
> -		its_free_device(its_dev);
> -	}
> -
> -	mutex_unlock(&its->dev_alloc_lock);
> -
>  	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
>  }
>  
> -- 
> 2.39.2
> 
