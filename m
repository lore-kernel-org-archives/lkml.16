Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A82426058B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598411; cv=none; b=qEbWe9NONhD4WkM4vu8HhWT8d2MMEHJwVA8ybDdsgcV/4yGKxmMNq/qUL19QDPPBFbDX1c9Uvi3u0j1QClOrFGtX+WERBx7GthKKcZTIplecnlqbO/TQKAaSR01saRl2yqtvLn5OY1z+mi32ub/NMReKp8sW7d0csiHOLr4St2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598411; c=relaxed/simple;
	bh=ruZJQCh9ryZ+I+XuYigqxnoLTdidbeWj9HQUWJc2Zmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCRZZUC4vljNo5e7cqkA89Cv2+I3idt+QA6vp7q8LSZmtCtt+gzDa6i0XhrX+M+gWN3TtOSrpMWuyvA/elvctV7IVlP7KTIXKwGHyn1GTwpOH5yNXeLXwfILX3Jd19uV2JQquwPhvL8gFTc3I1corV5yM+g+t2VB2DMaoUuFfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FgTugazE; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FgTugazE"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so242303241.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749598408; x=1750203208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5EtFSny9a3QKkQNZQ4QZE664zRM6QOaDf/5gMSog4w=;
        b=FgTugazEJMPVHSD0OdCn3ysJqPhZwcSAn507/47D76BOTt54cFRm4G2QDygc+g2P+h
         boakBVHS/9+9VLNwnlm4mfHbntNQwzYfxY1E9sGJ5GqfotmQYj9xaaGbEhoj4sYCPvZV
         zE3KpKkIuLrLBUzsm4HMrOmdbEckTp9jNSPGWrP5QSUxccz4nip2l963L/Ky5olqEVXm
         Lw1zkfL/8S4P4bQYJCMNeaSse1RiYShJMhs79cTtEFCesltCJgLE7l4PE3f4JDxgMNg3
         Tlqf2O0Gc8Yr3jRI7c/Lv2jyAAvZokm/4hoTKlh6muzzzbVLwyXWdLQ9KMx2q0tdwvvb
         zBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749598408; x=1750203208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5EtFSny9a3QKkQNZQ4QZE664zRM6QOaDf/5gMSog4w=;
        b=m4FjBkVmdFvkuLPF9IickA6BtdTQj/2C1BewIXlOFzB5G5r+6YvvdiXUqOPqUCIG4x
         wXtfv+HhBVFHGqf1QkYYpYxfm4hCmGtuT7vdi7Tmstmr2PJl461dvi4j4Xdncw799cVc
         9bp169uxaTv9zcyORdUa8WeMAo5DK+l9dSI4vZpxtqZWravxSjoHmq74GF2xfKU6hk2n
         kk8vovSE990RtaJfGax5MhksmzbiqRU1LiVhJHDcNymmXv+ZQe0CoQUoZ+y2KGe1tw8p
         OGUY6mkHNUgwVZlG4WPfc4gIQ/wcNs3sj1x808Mhc6ldkMROJtlrsvCI2LTp+AWSF7N0
         MFvA==
X-Forwarded-Encrypted: i=1; AJvYcCWIMnoJsVNlu2b+tugD/pDgnf7B4qjEIs2Kt93Squ72/votuORnhDTT+zZGl8er5QkeeooWFsXIOX/3wWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OQZFbv6p/tAz6L1yWZrl2DcoQutzSBJF+qPhk0FduosgAgQy
	lBVblc8P5CM5UzTbtCjixGBUFgdNFvV8pFZ2npqQlvwgDncy7yp8c+JBwFaVwwkqs98rYGw83zh
	rPcOM95KUW0f57rJkOHg9vgzZZNUmj9O4SHtVvKlU
X-Gm-Gg: ASbGnct6hUr52OR5c2QalcaO+XsfzFfM2sqq5kgFAjSwCKPaSE90gdu0HbkXShtrKND
	fsd4OLscFTqpFkVGk2jjyeJxvbXq3UkUJpH05b21DIuY6TGpVUuuz2y+paSVbr50un1L6CX1fp9
	VXqtqWBmx0AemKNiNsGtUXqvSgylfTTsBV4xzu+gvU9C4Ob8w+Ty8IfZCJ1q9TyWwaFwzVn/3E5
	1Sj59nZt9eE
X-Google-Smtp-Source: AGHT+IEcsSHhHIIu81SM+BOR5aTDT1K9zkwKsejYm+2eolXTze4JNqYutalDoK6kpHgBOnvztSJ6wFzNmFGMZzgT5a0=
X-Received: by 2002:a67:cf4a:0:b0:4e7:70cf:b537 with SMTP id
 ada2fe7eead31-4e7ba5b75eamr1323852137.6.1749598407852; Tue, 10 Jun 2025
 16:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev> <20250610183459.3395328-1-sean.anderson@linux.dev>
In-Reply-To: <20250610183459.3395328-1-sean.anderson@linux.dev>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 10 Jun 2025 16:32:51 -0700
X-Gm-Features: AX0GCFvKgpTxqr1mM_UL-c0KtL5e6Pwn-8QrXYyRkrz6mEh3bGy2fWkm5gxu91E
Message-ID: <CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com>
Subject: Re: [PATCH] driver core: Prevent deferred probe loops
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:35=E2=80=AFAM Sean Anderson <sean.anderson@linux=
.dev> wrote:
>
> A deferred probe loop can occur when a device returns EPROBE_DEFER after
> registering a bus with children:

This is a broken driver. A parent device shouldn't register child
devices unless it is fully read itself. It's not logical to say the
child devices are available, if the parent itself isn't fully ready.
So, adding child devices/the bus should be the last thing done in the
parent's probe function.

I know there are odd exceptions where the parent depends on the child,
so they might add the child a bit earlier in the probe, but in those
cases, the parent's probe should still do all the checks ahead of
time.

Can you be more specific about the actual failure you are seeing?

Thanks,
Saravana


> deferred_probe_work_func()
>   driver_probe_device(parent)
>     test_parent_probe(parent)
>       device_add(child)
>         (probe successful)
>         driver_bound(child)
>           driver_deferred_probe_trigger()
>       return -EPROBE_DEFER
>     driver_deferred_probe_add(parent)
>     // deferred_trigger_count changed, so...
>     driver_deferred_probe_trigger()
>
> Because there was another successful probe during the parent's probe,
> driver_probe_device thinks we need to retry the whole probe process. But
> we will never make progress this way because the only thing that changed
> was a direct result of our own probe function.
>
> To prevent this, add a per-device trigger_count. This allows us to
> determine if the global deferred_trigger_count was modified by some
> unrelated device or only by our own children. The read side does the
> work of summing children because I expect most deferred devices to be
> childless. The alternative is to walk up the device's parents in
> driver_deferred_probe_trigger.
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>
>  drivers/base/base.h    |  2 +-
>  drivers/base/core.c    |  8 ++++-
>  drivers/base/dd.c      | 67 ++++++++++++++++++++++++++++++++++--------
>  include/linux/device.h |  3 ++
>  4 files changed, 66 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 123031a757d9..54263b186d1f 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -201,7 +201,7 @@ int devres_release_all(struct device *dev);
>  void device_block_probing(void);
>  void device_unblock_probing(void);
>  void deferred_probe_extend_timeout(void);
> -void driver_deferred_probe_trigger(void);
> +void driver_deferred_probe_trigger(struct device *dev);
>  const char *device_get_devnode(const struct device *dev, umode_t *mode,
>                                kuid_t *uid, kgid_t *gid, const char **tmp=
);
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index cbc0099d8ef2..8ba231ec469b 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1858,7 +1858,7 @@ void __init wait_for_init_devices_probe(void)
>
>         pr_info("Trying to probe devices needed for running init ...\n");
>         fw_devlink_best_effort =3D true;
> -       driver_deferred_probe_trigger();
> +       driver_deferred_probe_trigger(NULL);
>
>         /*
>          * Wait for all "best effort" probes to finish before going back =
to
> @@ -3739,6 +3739,9 @@ int device_add(struct device *dev)
>         kobject_uevent(&dev->kobj, KOBJ_REMOVE);
>         glue_dir =3D get_glue_dir(dev);
>         kobject_del(&dev->kobj);
> +       if (parent)
> +               atomic_add(atomic_read(&dev->trigger_count),
> +                          &dev->parent->trigger_count);
>   Error:
>         cleanup_glue_dir(dev, glue_dir);
>  parent_error:
> @@ -3899,6 +3902,9 @@ void device_del(struct device *dev)
>         kobject_uevent(&dev->kobj, KOBJ_REMOVE);
>         glue_dir =3D get_glue_dir(dev);
>         kobject_del(&dev->kobj);
> +       if (parent)
> +               atomic_add(atomic_read(&dev->trigger_count),
> +                          &parent->trigger_count);
>         cleanup_glue_dir(dev, glue_dir);
>         memalloc_noio_restore(noio_flag);
>         put_device(parent);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index b526e0e0f52d..8ce638c02275 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -156,6 +156,7 @@ void driver_deferred_probe_del(struct device *dev)
>  static bool driver_deferred_probe_enable;
>  /**
>   * driver_deferred_probe_trigger() - Kick off re-probing deferred device=
s
> + * @dev: the successfully-bound device, or %NULL if not applicable
>   *
>   * This functions moves all devices from the pending list to the active
>   * list and schedules the deferred probe workqueue to process them.  It
> @@ -172,7 +173,7 @@ static bool driver_deferred_probe_enable;
>   * changes in the midst of a probe, then deferred processing should be t=
riggered
>   * again.
>   */
> -void driver_deferred_probe_trigger(void)
> +void driver_deferred_probe_trigger(struct device *dev)
>  {
>         if (!driver_deferred_probe_enable)
>                 return;
> @@ -184,6 +185,10 @@ void driver_deferred_probe_trigger(void)
>          */
>         mutex_lock(&deferred_probe_mutex);
>         atomic_inc(&deferred_trigger_count);
> +       if (dev) {
> +               smp_wmb(); /* paired with device_needs_retrigger */
> +               atomic_inc(&dev->trigger_count);
> +       }
>         list_splice_tail_init(&deferred_probe_pending_list,
>                               &deferred_probe_active_list);
>         mutex_unlock(&deferred_probe_mutex);
> @@ -216,7 +221,7 @@ void device_block_probing(void)
>  void device_unblock_probing(void)
>  {
>         defer_all_probes =3D false;
> -       driver_deferred_probe_trigger();
> +       driver_deferred_probe_trigger(NULL);
>  }
>
>  /**
> @@ -308,7 +313,7 @@ static void deferred_probe_timeout_work_func(struct w=
ork_struct *work)
>         fw_devlink_drivers_done();
>
>         driver_deferred_probe_timeout =3D 0;
> -       driver_deferred_probe_trigger();
> +       driver_deferred_probe_trigger(NULL);
>         flush_work(&deferred_probe_work);
>
>         mutex_lock(&deferred_probe_mutex);
> @@ -347,7 +352,7 @@ static int deferred_probe_initcall(void)
>                             &deferred_devs_fops);
>
>         driver_deferred_probe_enable =3D true;
> -       driver_deferred_probe_trigger();
> +       driver_deferred_probe_trigger(NULL);
>         /* Sort as many dependencies as possible before exiting initcalls=
 */
>         flush_work(&deferred_probe_work);
>         initcalls_done =3D true;
> @@ -359,7 +364,7 @@ static int deferred_probe_initcall(void)
>          * Trigger deferred probe again, this time we won't defer anythin=
g
>          * that is optional
>          */
> -       driver_deferred_probe_trigger();
> +       driver_deferred_probe_trigger(NULL);
>         flush_work(&deferred_probe_work);
>
>         if (driver_deferred_probe_timeout > 0) {
> @@ -415,7 +420,7 @@ static void driver_bound(struct device *dev)
>          * kick off retrying all pending devices
>          */
>         driver_deferred_probe_del(dev);
> -       driver_deferred_probe_trigger();
> +       driver_deferred_probe_trigger(dev);
>
>         bus_notify(dev, BUS_NOTIFY_BOUND_DRIVER);
>         kobject_uevent(&dev->kobj, KOBJ_BIND);
> @@ -806,6 +811,47 @@ static int __driver_probe_device(const struct device=
_driver *drv, struct device
>         return ret;
>  }
>
> +/**
> + * dev_get_trigger_count() - Recursively read trigger_count
> + * @dev: device to read from
> + * @data: pointer to the int result; should be initialized to 0
> + *
> + * Read @dev's trigger_count, as well as all its children's trigger coun=
ts,
> + * recursively. The result is the number of times @dev or any of its
> + * (possibly-removed) children have been successfully probed.
> + *
> + * Return: 0
> + */
> +static int dev_get_trigger_count(struct device *dev, void *data)
> +{
> +       *(int *)data +=3D atomic_read(&dev->trigger_count);
> +       return device_for_each_child(dev, dev_get_trigger_count, data);
> +}
> +
> +/*
> + * device_needs_retrigger() - Determine if we need to re-trigger a defer=
red probe
> + * @dev: Device that failed to probe with %EPROBE_DEFER
> + * @old_trigger_count: Value of deferred_trigger_count before probing th=
e device
> + *
> + * The resource @dev was looking for could have been probed between when=
 @dev
> + * looked up the resource and when the probe process finished. If this o=
ccurred
> + * we need to retrigger deferred probing so that @dev gets another shot =
at
> + * probing. However, we need to ignore deferred probe triggers from @dev=
's own
> + * children, since that could result in an infinite probe loop.
> + *
> + * Return: %true if we should retrigger probing of deferred devices
> + */
> +static bool device_needs_retrigger(struct device *dev, int old_trigger_c=
ount)
> +{
> +       int dev_trigger_count =3D 0;
> +       int new_trigger_count;
> +
> +       dev_get_trigger_count(dev, &dev_trigger_count);
> +       smp_rmb(); /* paired with driver_deferred_probe_trigger */
> +       new_trigger_count =3D atomic_read(&deferred_trigger_count);
> +       return new_trigger_count > old_trigger_count + dev_trigger_count;
> +}
> +
>  /**
>   * driver_probe_device - attempt to bind device & driver together
>   * @drv: driver to bind a device to
> @@ -830,12 +876,9 @@ static int driver_probe_device(const struct device_d=
river *drv, struct device *d
>         if (ret =3D=3D -EPROBE_DEFER || ret =3D=3D EPROBE_DEFER) {
>                 driver_deferred_probe_add(dev);
>
> -               /*
> -                * Did a trigger occur while probing? Need to re-trigger =
if yes
> -                */
> -               if (trigger_count !=3D atomic_read(&deferred_trigger_coun=
t) &&
> -                   !defer_all_probes)
> -                       driver_deferred_probe_trigger();
> +               if (!defer_all_probes &&
> +                   device_needs_retrigger(dev, trigger_count))
> +                       driver_deferred_probe_trigger(NULL);
>         }
>         atomic_dec(&probe_count);
>         wake_up_all(&probe_waitqueue);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 4940db137fff..9c9153adb8d6 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -486,6 +486,8 @@ struct device_physical_location {
>   * @p:         Holds the private data of the driver core portions of the=
 device.
>   *             See the comment of the struct device_private for detail.
>   * @kobj:      A top-level, abstract class from which other classes are =
derived.
> + * @trigger_count: Number of times this device (or any of its removed ch=
ildren)
> + *              has been successfully bound to a driver.
>   * @init_name: Initial name of the device.
>   * @type:      The type of device.
>   *             This identifies the device type and carries type-specific
> @@ -581,6 +583,7 @@ struct device_physical_location {
>   */
>  struct device {
>         struct kobject kobj;
> +       atomic_t                trigger_count;
>         struct device           *parent;
>
>         struct device_private   *p;
> --
> 2.35.1.1320.gc452695387.dirty
>
