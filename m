Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739451DD525
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745234; cv=none; b=uHAfwDlZs0vEa91ZUaKZohZgKdHcByiiPgDjjzVKutZACaFCKoXZk3xxZ37ePXfBHjEmpIDLkt9eM3Et1/t8qrNGR9pRFNRQUiAMYZLPo3hO84ubSWiQXtXSkVz4+giIVy8PCeEUhmn9uw2x8EUs4lTB+3Ofi+/nkwbVGDz/kP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745234; c=relaxed/simple;
	bh=fMmw7OIovbFo5qKQquhjY8dK2KzaNwruMuVDAEtq/aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUnf2MRbCIASUsGuBFlrLhhwwzJKOZP46eCbVM84KnNeKIvNRvmKT7npFI61wTQvI0bR/xJjxSMH+cfzG69TkYPyyV+YWubKnlhKkEJfX9lF3cYt1JThni2axPBe4zYb/GE0eueWSjFZmemyC4VjFwNvJA8b0u11e9q5dywoyoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2iEmm2m; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2iEmm2m"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso1597099276.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 16:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746745230; x=1747350030; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+bapZu+7+8ii9uaxEr00bkaFLq2Btk4QlNw3sk4w/X8=;
        b=m2iEmm2mJ6EuWnAurBQbTlNnlP3VGhL0Qz80c9T3bOrVOPhfeX+Uq9GWlU+Bc7N0BF
         20ODGOH5Sux/o0RjnvtO7f7ASA+WzwLqQWY+e1QXxZflq0o2M7Ub1AR9z7jvSPCKEc59
         JkwnwnOhAkgk5XUaYBbiX4y8mCahEmU2nWYZhyCDyUMrQA1DZzn3W+DoD3e58+09qJ5G
         qXybVtb8ZwfebjqfNUJX3LB9mrhgHIlPNKigBVx9O/Kl3BkXVZNiyFehLbupBGckIfeq
         Y81F2U4vId6hd9OUBNComYcFCLv1uemzTsR/0KfCn5kk8fmi54yHe6u8dEtBixdOWJYX
         E0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746745230; x=1747350030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bapZu+7+8ii9uaxEr00bkaFLq2Btk4QlNw3sk4w/X8=;
        b=Im6bagUWZdT5cnPHm60/E/vieN+d9YSP0wDOs4/JAHG6xgaOrs2UPbjhqgKNmBP8PA
         l4fNLXdlYuN/ZpyDGXfPgHJ1w8DN723kffwR+447QIVV0wAXNdzP6pID+VggzQW1EZyJ
         OwD+PcqXmuerRkwZyB/P3CIUGcOl0JNjoE+AZ0qUZCKEtuyhrz9/iTKvhGY6ixdCJojV
         BF3Q1HW+ykeUHhqXSKmP78hmYqBUb9gUGfNHY07Y7dfAobELq0vWszz43Hk9eeBEv0RU
         l9Y536c3cm67W/ILurql/oxMO2kyLYR43xHA2c867QeHa3LlmYqPMLI40DyccOhZJvkc
         +E9A==
X-Forwarded-Encrypted: i=1; AJvYcCWGW9OXdUtY5+lh7IPZOG7YWnIHopVIGqjZyavb+epgZCKsgySZlbNJ06KABlFGI300bC9m/ynN6xpXo1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2317ci2EhIw2z6Q+RSYns1NXOMrP95vOmjDGQJ47H+H52Gdn
	g5j4be3+Cfbh5zhjVH3t9iyA3uBwOiIccdg7YxrwgPv/fLvS0k0ttzt2PDDSbK7yC3CLV6OyeFR
	G2NUcEnjzNf9qi2zvV7DN4dxYwUT9GnQCBVDpwg==
X-Gm-Gg: ASbGncvUGO93a9nXIkE8eXYPPqj39hDWmMdynIEgFbQSB80dOKVbknjO03ZtXyi1OyC
	M6VsGdfC87VW+cl+HR5YAVVjCBSgBi4UJ2N09ShFlkXadCa9Kxvy6NDJYy3eYvwfHpx8U67P8MZ
	tHCreVHYj4qGyRKVqzmsvzhSg=
X-Google-Smtp-Source: AGHT+IFBK34kEw6k9Gbs7tpztCZHQCppLlMyx6P7FSEVBCzMKhZuqQC6LR0YjDuCIV/mZwKmjxcJETe3mXUTbTSis8M=
X-Received: by 2002:a05:6902:490e:b0:e75:bea4:5ea4 with SMTP id
 3f1490d57ef6-e78fdda3cd1mr1712002276.46.1746745230131; Thu, 08 May 2025
 16:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506095118.2239459-1-o.rempel@pengutronix.de> <20250506095118.2239459-2-o.rempel@pengutronix.de>
In-Reply-To: <20250506095118.2239459-2-o.rempel@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 9 May 2025 00:59:54 +0200
X-Gm-Features: ATxdqUHVSpTTECsTQ-EyBxjlXRV1bMtNFM8zH5maGVUUJfC8dy1QtleF_mwdIhY
Message-ID: <CAPDyKFqa3Fh4UB1LuSk=i9ri_odZHyv289jQT98uCoW1jZT+bA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] mmc: core: Handle undervoltage events and register
 regulator notifiers
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>, 
	Christian Loehle <christian.loehle@arm.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Avri Altman <Avri.Altman@sandisk.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 11:51, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
> Extend the MMC core to handle undervoltage events by implementing
> infrastructure to notify the MMC bus about voltage drops.
>
> Background & Decision at LPC24:
>
> This solution was proposed and refined during LPC24 in the talk
> "Graceful Under Pressure: Prioritizing Shutdown to Protect Your Data in
> Embedded Systems," which aimed to address how Linux should handle power
> fluctuations in embedded devices to prevent data corruption or storage
> damage.
>
> At the time, multiple possible solutions were considered:
> 1. Triggering a system-wide suspend or shutdown: when undervoltage is
>    detected, with device-specific prioritization to ensure critical
>    components shut down first.
>    - This approach was disliked by Greg Kroah-Hartman, as it introduced
>      complexity and was not suitable for all use cases.
>
> 2. Notifying relevant devices through the regulator framework: to allow
>    graceful per-device handling.
>    - This approach was agreed upon as the most acceptable by participants
>      in the discussion, including Greg Kroah-Hartman, Mark Brown,
>      and Rafael J. Wysocki.
>    - This patch implements that decision by integrating undervoltage
>      handling into the MMC subsystem.
>

It is certainly nice to get all this information when reviewing, but
for a commit message, I think it may be a bit too much.

Would you mind trying to focus on describing what patch does in more
detail instead?

I would appreciate it if the above information could be put as general
information instead, along with the version information below "---".

> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

The above said, from a top level point of view I think the approach
makes perfect sense. Thanks for working on this!

> ---
> changes v3:
> - filter supported cards at early stage
> - add locking in mmc_handle_regulator_event()
> - claim/release host in mmc_handle_undervoltage()
> ---
>  drivers/mmc/core/core.c      |  30 +++++++++
>  drivers/mmc/core/core.h      |   2 +
>  drivers/mmc/core/regulator.c | 124 +++++++++++++++++++++++++++++++++++
>  include/linux/mmc/host.h     |   8 +++
>  4 files changed, 164 insertions(+)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index a0e2dce70434..c502d83417cc 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1399,6 +1399,36 @@ void mmc_power_cycle(struct mmc_host *host, u32 ocr)
>         mmc_power_up(host, ocr);
>  }
>
> +/**
> + * mmc_handle_undervoltage - Handle an undervoltage event on the MMC bus
> + * @host: The MMC host that detected the undervoltage condition
> + *
> + * This function is called when an undervoltage event is detected on one of
> + * the MMC regulators.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int mmc_handle_undervoltage(struct mmc_host *host)
> +{
> +       int ret;
> +
> +       mmc_claim_host(host);

Rather than claiming the host we need to make sure we don't race with
card/host removal, which are those paths that may clear the
host->bus_ops.

In other words, I think we should call __mmc_stop_host() here, to
avoid a card being removed.

Moreover we need to extend mmc_stop_host() to unregister the regulator
notifier to make sure host removal doesn't race with a call to
mmc_handle_undervoltage().

Or potentially we could use mmc_add|remove_card() for where the
registering|unregistering the regulator notifier, let me think about
it some more, it's getting late over here.

> +
> +       if (!host->bus_ops->handle_undervoltage) {
> +               mmc_release_host(host);
> +               return 0;
> +       }
> +
> +       dev_warn(mmc_dev(host), "%s: Undervoltage detected, initiating emergency stop\n",
> +                mmc_hostname(host));
> +
> +       ret = host->bus_ops->handle_undervoltage(host);
> +
> +       mmc_release_host(host);
> +
> +       return ret;
> +}
> +
>  /*
>   * Assign a mmc bus handler to a host. Only one bus handler may control a
>   * host at any given time.
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 622085cd766f..31e5918f6e95 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -31,6 +31,7 @@ struct mmc_bus_ops {
>         int (*sw_reset)(struct mmc_host *);
>         bool (*cache_enabled)(struct mmc_host *);
>         int (*flush_cache)(struct mmc_host *);
> +       int (*handle_undervoltage)(struct mmc_host *host);
>  };
>
>  void mmc_attach_bus(struct mmc_host *host, const struct mmc_bus_ops *ops);
> @@ -59,6 +60,7 @@ void mmc_power_off(struct mmc_host *host);
>  void mmc_power_cycle(struct mmc_host *host, u32 ocr);
>  void mmc_set_initial_state(struct mmc_host *host);
>  u32 mmc_vddrange_to_ocrmask(int vdd_min, int vdd_max);
> +int mmc_handle_undervoltage(struct mmc_host *host);
>
>  static inline void mmc_delay(unsigned int ms)
>  {
> diff --git a/drivers/mmc/core/regulator.c b/drivers/mmc/core/regulator.c
> index 3dae2e9b7978..1074567e242f 100644
> --- a/drivers/mmc/core/regulator.c
> +++ b/drivers/mmc/core/regulator.c
> @@ -7,6 +7,7 @@
>  #include <linux/err.h>
>  #include <linux/log2.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/workqueue.h>
>
>  #include <linux/mmc/host.h>
>
> @@ -262,6 +263,107 @@ static inline int mmc_regulator_get_ocrmask(struct regulator *supply)
>
>  #endif /* CONFIG_REGULATOR */
>
> +static void mmc_undervoltage_workfn(struct work_struct *work)

So devm_regulator_register_notifier() doesn't provide us with an
asynchronous notification-interface. In this way, it becomes the
notified consumer's responsibility to know what fits best on a case by
case basis, possibly delaying others. I guess this has been discussed
earlier?

Don't get me wrong, I think the async/workqueue fits well with MMC.
Yet, it seems like it would be nice to have an async interface too.

> +{
> +       struct mmc_supply *supply;
> +       struct mmc_host *mmc;
> +
> +       supply = container_of(work, struct mmc_supply, uv_work);
> +       mmc = container_of(supply, struct mmc_host, supply);
> +
> +       mmc_handle_undervoltage(mmc);
> +}
> +
> +static int mmc_handle_regulator_event(struct mmc_host *mmc,
> +                                     const char *regulator_name,
> +                                     unsigned long event)
> +{
> +       unsigned long flags;
> +
> +       switch (event) {
> +       case REGULATOR_EVENT_UNDER_VOLTAGE:
> +               /* Currently we support only MMC cards */
> +               spin_lock_irqsave(&mmc->lock, flags);
> +               if (mmc->undervoltage || !mmc->card ||
> +                   !mmc_card_mmc(mmc->card)) {
> +                       spin_unlock_irqrestore(&mmc->lock, flags);
> +                       return NOTIFY_OK;
> +               }
> +
> +               mmc->undervoltage = true;
> +               spin_unlock_irqrestore(&mmc->lock, flags);

Rather than having to do the above checks, how about instead
registering the notifier only in cases when it makes sense? For eMMC
for example. In this way we would need to do anything here, but only
queue the work.

Another option is to defer to let mmc_handle_undervoltage() bail out,
if the bus_ops->handle_undervoltage() has not been assigned for the
card type. That should be good enough too, I think. Right?

> +
> +               queue_work(system_highpri_wq, &mmc->supply.uv_work);
> +               break;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
> +static int mmc_vmmc_notifier_callback(struct notifier_block *nb,
> +                                     unsigned long event, void *data)
> +{
> +       struct mmc_supply *supply;
> +       struct mmc_host *mmc;
> +
> +       supply = container_of(nb, struct mmc_supply, vmmc_nb);
> +       mmc = container_of(supply, struct mmc_host, supply);
> +
> +       return mmc_handle_regulator_event(mmc, "vmmc", event);
> +}
> +
> +static int mmc_vqmmc_notifier_callback(struct notifier_block *nb,
> +                                      unsigned long event, void *data)
> +{
> +       struct mmc_supply *supply;
> +       struct mmc_host *mmc;
> +
> +       supply = container_of(nb, struct mmc_supply, vqmmc_nb);
> +       mmc = container_of(supply, struct mmc_host, supply);
> +
> +       return mmc_handle_regulator_event(mmc, "vqmmc", event);
> +}
> +
> +static int mmc_vqmmc2_notifier_callback(struct notifier_block *nb,
> +                                       unsigned long event, void *data)
> +{
> +       struct mmc_supply *supply;
> +       struct mmc_host *mmc;
> +
> +       supply = container_of(nb, struct mmc_supply, vqmmc2_nb);
> +       mmc = container_of(supply, struct mmc_host, supply);
> +
> +       return mmc_handle_regulator_event(mmc, "vqmmc2", event);
> +}

Looks a bit too much to have one callback per regulator type. Please
convert into using one function.

> +
> +static void
> +mmc_register_regulator_notifier(struct mmc_host *mmc,
> +                               struct regulator *regulator,
> +                               struct notifier_block *nb,
> +                               int (*callback)(struct notifier_block *,
> +                                               unsigned long, void *),
> +                               const char *name)
> +{
> +       struct device *dev = mmc_dev(mmc);
> +       int ret;
> +
> +       nb->notifier_call = callback;
> +       ret = devm_regulator_register_notifier(regulator, nb);
> +       if (ret)
> +               dev_warn(dev, "Failed to register %s notifier: %pe\n", name,
> +                        ERR_PTR(ret));
> +}
> +
> +static void mmc_undervoltage_work_cleanup(void *data)
> +{
> +       struct mmc_supply *supply = data;
> +
> +       /* Ensure the work is canceled or flushed here */
> +       cancel_work_sync(&supply->uv_work);
> +}
> +
>  /**
>   * mmc_regulator_get_supply - try to get VMMC and VQMMC regulators for a host
>   * @mmc: the host to regulate
> @@ -281,6 +383,13 @@ int mmc_regulator_get_supply(struct mmc_host *mmc)
>         mmc->supply.vqmmc = devm_regulator_get_optional(dev, "vqmmc");
>         mmc->supply.vqmmc2 = devm_regulator_get_optional(dev, "vqmmc2");
>
> +       INIT_WORK(&mmc->supply.uv_work, mmc_undervoltage_workfn);

Probably better to add this in mmc_alloc_host().

> +
> +       ret = devm_add_action_or_reset(dev, mmc_undervoltage_work_cleanup,
> +                                      &mmc->supply);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to add cleanup action\n");
> +
>         if (IS_ERR(mmc->supply.vmmc)) {
>                 if (PTR_ERR(mmc->supply.vmmc) == -EPROBE_DEFER)
>                         return dev_err_probe(dev, -EPROBE_DEFER,
> @@ -293,6 +402,11 @@ int mmc_regulator_get_supply(struct mmc_host *mmc)
>                         mmc->ocr_avail = ret;
>                 else
>                         dev_warn(dev, "Failed getting OCR mask: %d\n", ret);
> +
> +               mmc_register_regulator_notifier(mmc, mmc->supply.vmmc,
> +                                               &mmc->supply.vmmc_nb,
> +                                               mmc_vmmc_notifier_callback,
> +                                               "vmmc");

As I indicated earlier, I think we should register this far later
during card-init. Somewhere *after* we have assigned the
host->bus_ops. So in mmc_attach_mmc() or possibly in mmc_add_card() -
if we want to make it more generic for SD/SDIO too.

Also note that SD cards may support a graceful power-off via
sd_poweroff_notify().

>         }
>
>         if (IS_ERR(mmc->supply.vqmmc)) {
> @@ -301,12 +415,22 @@ int mmc_regulator_get_supply(struct mmc_host *mmc)
>                                              "vqmmc regulator not available\n");
>
>                 dev_dbg(dev, "No vqmmc regulator found\n");
> +       } else {
> +               mmc_register_regulator_notifier(mmc, mmc->supply.vqmmc,
> +                                               &mmc->supply.vqmmc_nb,
> +                                               mmc_vqmmc_notifier_callback,
> +                                               "vqmmc");

vqmmc is for signal (I/O) voltage for eMMC and SD/SDIO. Do we need
really a notifier for this?

>         }
>
>         if (IS_ERR(mmc->supply.vqmmc2)) {
>                 if (PTR_ERR(mmc->supply.vqmmc2) == -EPROBE_DEFER)
>                         return -EPROBE_DEFER;
>                 dev_dbg(dev, "No vqmmc2 regulator found\n");
> +       } else {
> +               mmc_register_regulator_notifier(mmc, mmc->supply.vqmmc2,
> +                                               &mmc->supply.vqmmc2_nb,
> +                                               mmc_vqmmc2_notifier_callback,
> +                                               "vqmmc2");
>         }

vqmmc2 is at this point only used for SD UHS-II cards and there are no
proper power-management in regards to graceful power-down support
implement for this yet.

I suggest we ignore vqmmc2 for now in regards to the notifiers.

>
>         return 0;
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 68f09a955a90..4e147ad82804 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -11,6 +11,7 @@
>  #include <linux/device.h>
>  #include <linux/fault-inject.h>
>  #include <linux/debugfs.h>
> +#include <linux/workqueue.h>
>
>  #include <linux/mmc/core.h>
>  #include <linux/mmc/card.h>
> @@ -342,6 +343,12 @@ struct mmc_supply {
>         struct regulator *vmmc;         /* Card power supply */
>         struct regulator *vqmmc;        /* Optional Vccq supply */
>         struct regulator *vqmmc2;       /* Optional supply for phy */
> +
> +       struct notifier_block vmmc_nb;          /* Notifier for vmmc */
> +       struct notifier_block vqmmc_nb;         /* Notifier for vqmmc */
> +       struct notifier_block vqmmc2_nb;        /* Notifier for vqmmc2 */
> +
> +       struct work_struct uv_work;             /* Undervoltage work */
>  };
>
>  struct mmc_ctx {
> @@ -493,6 +500,7 @@ struct mmc_host {
>         unsigned int            retune_crc_disable:1; /* don't trigger retune upon crc */
>         unsigned int            can_dma_map_merge:1; /* merging can be used */
>         unsigned int            vqmmc_enabled:1; /* vqmmc regulator is enabled */
> +       unsigned int            undervoltage:1;  /* Undervoltage state */
>
>         int                     rescan_disable; /* disable card detection */
>         int                     rescan_entered; /* used with nonremovable devices */
> --
> 2.39.5
>

Kind regards
Uffe
