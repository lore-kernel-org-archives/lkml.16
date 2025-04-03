Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A8F1AC44D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743718807; cv=none; b=eGl0VlZyqKEF0uZdKyA4YmFqGk8XEDmokk/jezwiHYfJxRcercAQBexJgySWXlCb8lQqcupazA6ntByI7XN63kTND1tjNWjmpyItChk8RuE+Ep4pRl1cz92FyJXIzWbDVH7Lh33UcSbhyl+KY/A54YDtyj5u2F6dsCEsSOzEQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743718807; c=relaxed/simple;
	bh=LoDzcayjYOUVn7+roeHQFd9L6nfgHgMTRhDioiPdDi0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XzuJe+iWEMjy4S0GTk/9JZZDpn0Icp5HAUPZNSNsRyeyBlN2B2RE3J3wmQ1o1wTO4p5qe+xoKHmblzNIJglnWsrvQY8UIm3s9dLwRw2sEzXEHaEn4SE6cHCTBc91wIH71WPURN0xRcmRIn1GShg22UUC8rOsAa18pEwWt76ExUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baWrpWBu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baWrpWBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79369C4CEE3;
	Thu,  3 Apr 2025 22:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743718807;
	bh=LoDzcayjYOUVn7+roeHQFd9L6nfgHgMTRhDioiPdDi0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=baWrpWBu64sEwVU/dNy9X1V8386+nKuCLIPkmrFoStqrITBEtkupXipnoAlhUE5cT
	 rLiNzYRHsy6ZRELzj8FiodYNVhqGa00Tgga+LIakxUJ5kokc80JTYVDyHEkYUR1vIm
	 5v9cKNW78YyzMa2sRyYrxdavj/Zft1HyfYzRzmWzIHMllLuqwgjszNN2RHEQr0UXxJ
	 OMeK3sHF2dwlx2og8rkuGRPaPGcMCyv8sf7fN4qIOek7tUygHRlRnaSDpXPA/0rGHY
	 02M+8wJ+592JPUkY31gBI45YB7+LbDhJbDhaE/EVhy2ODk58BqR9roRrQySpM3dg/5
	 zhrGFKA0nR6ig==
Date: Fri, 4 Apr 2025 07:20:02 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v3 3/3] driver core: fix potential NULL pointer
 dereference in dev_uevent()
Message-Id: <20250404072002.f67036ea3f57e6c3f48cb103@kernel.org>
In-Reply-To: <20250311052417.1846985-3-dmitry.torokhov@gmail.com>
References: <20250311052417.1846985-1-dmitry.torokhov@gmail.com>
	<20250311052417.1846985-3-dmitry.torokhov@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Mar 2025 22:24:16 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> If userspace reads "uevent" device attribute at the same time as another
> threads unbinds the device from its driver, change to dev->driver from a
> valid pointer to NULL may result in crash. Fix this by using READ_ONCE()
> when fetching the pointer, and take bus' drivers klist lock to make sure
> driver instance will not disappear while we access it.
> 
> Use WRITE_ONCE() when setting the driver pointer to ensure there is no
> tearing.
> 

This looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

BTW, since other drivers still assigns dev->driver directly instead
of using device_set_driver(). Would we need another patch to replace
those?

Thank you,

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v3: addressed Rafael's feedback and split device_set_driver() helper
> into a separate patch.
>  
> v2: addressed Rafael's feedback by introducing device_set_driver()
> helper that does WRITE_ONCE() to prevent tearing. 
> 
> I added Cc: stable however I do not think we need to worry too much
> about backporting it to [very] old kernels: the race window is very
> small, and in real life we do not unbind devices that often.
> 
> I believe there are more questionable places where we read dev->driver
> pointer, those need to be adjusted separately.
> 
> 
>  drivers/base/base.h | 13 ++++++++++++-
>  drivers/base/bus.c  |  2 +-
>  drivers/base/core.c | 33 +++++++++++++++++++++++++++++++--
>  3 files changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index eb203cf8370b..123031a757d9 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -73,6 +73,7 @@ static inline void subsys_put(struct subsys_private *sp)
>  		kset_put(&sp->subsys);
>  }
>  
> +struct subsys_private *bus_to_subsys(const struct bus_type *bus);
>  struct subsys_private *class_to_subsys(const struct class *class);
>  
>  struct driver_private {
> @@ -182,8 +183,18 @@ void device_driver_detach(struct device *dev);
>  
>  static inline void device_set_driver(struct device *dev, const struct device_driver *drv)
>  {
> +	/*
> +	 * Majority (all?) read accesses to dev->driver happens either
> +	 * while holding device lock or in bus/driver code that is only
> +	 * invoked when the device is bound to a driver and there is no
> +	 * concern of the pointer being changed while it is being read.
> +	 * However when reading device's uevent file we read driver pointer
> +	 * without taking device lock (so we do not block there for
> +	 * arbitrary amount of time). We use WRITE_ONCE() here to prevent
> +	 * tearing so that READ_ONCE() can safely be used in uevent code.
> +	 */
>  	// FIXME - this cast should not be needed "soon"
> -	dev->driver = (struct device_driver *)drv;
> +	WRITE_ONCE(dev->driver, (struct device_driver *)drv);
>  }
>  
>  int devres_release_all(struct device *dev);
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index 5ea3b03af9ba..5e75e1bce551 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -57,7 +57,7 @@ static int __must_check bus_rescan_devices_helper(struct device *dev,
>   * NULL.  A call to subsys_put() must be done when finished with the pointer in
>   * order for it to be properly freed.
>   */
> -static struct subsys_private *bus_to_subsys(const struct bus_type *bus)
> +struct subsys_private *bus_to_subsys(const struct bus_type *bus)
>  {
>  	struct subsys_private *sp = NULL;
>  	struct kobject *kobj;
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index b000ee61c149..cbc0099d8ef2 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2624,6 +2624,35 @@ static const char *dev_uevent_name(const struct kobject *kobj)
>  	return NULL;
>  }
>  
> +/*
> + * Try filling "DRIVER=<name>" uevent variable for a device. Because this
> + * function may race with binding and unbinding the device from a driver,
> + * we need to be careful. Binding is generally safe, at worst we miss the
> + * fact that the device is already bound to a driver (but the driver
> + * information that is delivered through uevents is best-effort, it may
> + * become obsolete as soon as it is generated anyways). Unbinding is more
> + * risky as driver pointer is transitioning to NULL, so READ_ONCE() should
> + * be used to make sure we are dealing with the same pointer, and to
> + * ensure that driver structure is not going to disappear from under us
> + * we take bus' drivers klist lock. The assumption that only registered
> + * driver can be bound to a device, and to unregister a driver bus code
> + * will take the same lock.
> + */
> +static void dev_driver_uevent(const struct device *dev, struct kobj_uevent_env *env)
> +{
> +	struct subsys_private *sp = bus_to_subsys(dev->bus);
> +
> +	if (sp) {
> +		scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
> +			struct device_driver *drv = READ_ONCE(dev->driver);
> +			if (drv)
> +				add_uevent_var(env, "DRIVER=%s", drv->name);
> +		}
> +
> +		subsys_put(sp);
> +	}
> +}
> +
>  static int dev_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
>  {
>  	const struct device *dev = kobj_to_dev(kobj);
> @@ -2655,8 +2684,8 @@ static int dev_uevent(const struct kobject *kobj, struct kobj_uevent_env *env)
>  	if (dev->type && dev->type->name)
>  		add_uevent_var(env, "DEVTYPE=%s", dev->type->name);
>  
> -	if (dev->driver)
> -		add_uevent_var(env, "DRIVER=%s", dev->driver->name);
> +	/* Add "DRIVER=%s" variable if the device is bound to a driver */
> +	dev_driver_uevent(dev, env);
>  
>  	/* Add common DT information about the device */
>  	of_device_uevent(dev, env);
> -- 
> 2.49.0.rc0.332.g42c0ae87b1-goog
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
