Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE61C6FE4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743718659; cv=none; b=G1Ka0B/4N7y6u5tdKFCrNpzfMkHjkbW0bAJRLX9qIof3aED9le9g86zW+Ho2vLKTSC+sh9Y6kDsMoZSi2bruauXtfKybC+nbv1tkZge5rdA2KaFQ11xeOp8ySjejW1u73BiqdsIbU0lyZb9hGqo+6Ed0RJrD/OQ5P407E89rE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743718659; c=relaxed/simple;
	bh=N/M7kavdPXwuKPAT7lhK6ja5VuZJuFzzz57znsVdMRg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tqwMfMaqxLfLb4sC3FM1iIAEdvp9D994LpK4YMjRP11mEsEnytqag2dUrxfYyIxjOInJDvcqGsL3GkBNgvrTHnyOM5aDGws1dCxXb5GPN5KChViqOiBQZbhEfMrm7R0PPde4dekijPyRJHOPXRASxmkoUC8j5Vel90uGIEriEYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f18em97F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f18em97F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE22C4CEE8;
	Thu,  3 Apr 2025 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743718659;
	bh=N/M7kavdPXwuKPAT7lhK6ja5VuZJuFzzz57znsVdMRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f18em97FHw210z7b0SVP15Y3QVv6yJN0BRGwuTIqA2ok2gd/mSKsP4C1QVFPy9YmS
	 CzesXHOSqyuPkSGB9EGVaft8p3cIHqeGY7FozNqK3rueNLq5AcMhzbQKWyUCLRwC81
	 UQS7SEcElWw1GUSUXTScBe77bkDU64hNChH0NiAnGVg3VATyTLXoz0LbCo0EpLysc2
	 Az6MwAd7Ddw+9GvOxe2KAJS1D/C2XdnFGL2Sw/utXdHCs92j9YemPTXsR64IGG8kEm
	 zC0TWt1KdmrJ980PATBRaWWnhhC/5PABj9GKViDxwP7LIf8Gu2J7TtUmPdRk0YRa19
	 MjxP2AniZ0YTA==
Date: Fri, 4 Apr 2025 07:17:34 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v3 2/3] driver core: introduce device_set_driver()
 helper
Message-Id: <20250404071734.29468deb59106b0310605c3e@kernel.org>
In-Reply-To: <20250311052417.1846985-2-dmitry.torokhov@gmail.com>
References: <20250311052417.1846985-1-dmitry.torokhov@gmail.com>
	<20250311052417.1846985-2-dmitry.torokhov@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Mar 2025 22:24:15 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> In preparation to closing a race when reading driver pointer in
> dev_uevent() code, instead of setting device->driver pointer directly
> introduce device_set_driver() helper.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

This looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> ---
> 
> v3: new patch introducing device_set_driver() helper (suggested by
> Rafael).
> 
>  drivers/base/base.h | 6 ++++++
>  drivers/base/core.c | 2 +-
>  drivers/base/dd.c   | 7 +++----
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 0042e4774b0c..eb203cf8370b 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -180,6 +180,12 @@ int driver_add_groups(const struct device_driver *drv, const struct attribute_gr
>  void driver_remove_groups(const struct device_driver *drv, const struct attribute_group **groups);
>  void device_driver_detach(struct device *dev);
>  
> +static inline void device_set_driver(struct device *dev, const struct device_driver *drv)
> +{
> +	// FIXME - this cast should not be needed "soon"
> +	dev->driver = (struct device_driver *)drv;
> +}
> +
>  int devres_release_all(struct device *dev);
>  void device_block_probing(void);
>  void device_unblock_probing(void);
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f9c1c623bca5..b000ee61c149 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3697,7 +3697,7 @@ int device_add(struct device *dev)
>  	device_pm_remove(dev);
>  	dpm_sysfs_remove(dev);
>   DPMError:
> -	dev->driver = NULL;
> +	device_set_driver(dev, NULL);
>  	bus_remove_device(dev);
>   BusError:
>  	device_remove_attrs(dev);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index f0e4b4aba885..b526e0e0f52d 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -550,7 +550,7 @@ static void device_unbind_cleanup(struct device *dev)
>  	arch_teardown_dma_ops(dev);
>  	kfree(dev->dma_range_map);
>  	dev->dma_range_map = NULL;
> -	dev->driver = NULL;
> +	device_set_driver(dev, NULL);
>  	dev_set_drvdata(dev, NULL);
>  	if (dev->pm_domain && dev->pm_domain->dismiss)
>  		dev->pm_domain->dismiss(dev);
> @@ -629,8 +629,7 @@ static int really_probe(struct device *dev, const struct device_driver *drv)
>  	}
>  
>  re_probe:
> -	// FIXME - this cast should not be needed "soon"
> -	dev->driver = (struct device_driver *)drv;
> +	device_set_driver(dev, drv);
>  
>  	/* If using pinctrl, bind pins now before probing */
>  	ret = pinctrl_bind_pins(dev);
> @@ -1014,7 +1013,7 @@ static int __device_attach(struct device *dev, bool allow_async)
>  		if (ret == 0)
>  			ret = 1;
>  		else {
> -			dev->driver = NULL;
> +			device_set_driver(dev, NULL);
>  			ret = 0;
>  		}
>  	} else {
> -- 
> 2.49.0.rc0.332.g42c0ae87b1-goog
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
