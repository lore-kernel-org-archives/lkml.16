Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ABF148857
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748581279; cv=none; b=oQPT6e7a2D7DyIG28Br7UbM+nF5hyaiR6D8UZ/DKIy4AZxQgukZnavglZXqQfmENthXVs5QHn836eOZ+jlgro2dCKOfYiTvoZiLoPIrqRYi+QMPLJrhKOY+AW0haIKFvdBXeCu9nmE5JCXMqFibBpHXI58YYEZKcocAZCjJtBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748581279; c=relaxed/simple;
	bh=ajONNee7DSFh9hzWW1WkECibcgt3MTxMZ7o6cVRbDfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChmWNIGfmnRBoNKpiEGy/bstngQx8Meg50XWFiUdvl6DlEMKScYXZCXfFJ9vMWG+SpxjhFqNTpQwiSwA+tDwFgydZXVR/f5BuRkk9uIZnkE075O+qPeXMRB1LX2J2fAKCtcUg5Kykh+NMWVJm4ZAS3oSk7dnsUfTktTk0UgF+1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=cbGwXyQx; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="cbGwXyQx"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72c3b863b8eso1150873a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 22:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1748581276; x=1749186076; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YunbdSs6YerLx1tbMdF1KtWTH3umX9wbCKgI+0kPVQc=;
        b=cbGwXyQxPCRxDBXg6blezO/wgcfScZng2I30mmCt5O2Iym1lCgI7QBO5/EYKslblbR
         yUWNv7OX6nAH9S9IhqUJ6WiJq+LQSfuUZs+FCM11Du9EyrlXW7spU+i1QFgJE3RivGwc
         DlvjDWxqD32M/LH5aZ8Cdp31R9RaPFZlYh9z3CYU9NAmpEg0bgUlB43nIiQD2meDYxXd
         1HwnI0coZK9Tg/sruAYHsfbn5eDVaNz+F3fXr9XN/bZ9xCP7FQ4sMtbK5f8W4N7Aqmk3
         bMRd8vj7oz5k4EUVe+6g2wfgIzEd7xvy8Nf3GYrovW+FW+LX5u7izyvcIG7Mlba3t9vc
         bPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748581276; x=1749186076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YunbdSs6YerLx1tbMdF1KtWTH3umX9wbCKgI+0kPVQc=;
        b=jtLlYTpgTiW5eyNskNVkSi6RQKX2+/fxsk7e2iAVjRpRTkirax3xJC5WG2ggXDdeul
         DP7TJGfx4UvQTu3PU48EVQV1yGo/AWahX98NWAGilar0KeaIQJsrdXhCmSM+D/qIOGiE
         GiNqIVnhsI3x+Mzz3jkmrCKfainmLkyIkpCMoH4ngl3W+RVM/7wYvRoFmFfmFYVHyIeo
         J6MUOX1brWSBi+zuq+UDHivTmJQrZ0rjtPg92yYMLyTCvtwPQHHdnmnkf4/Ax+j6Q8XB
         ZAU1vTDsRxTJ9TqDVDq4HvH5Ha2ruN6uuQZmeX+T2hWJd9XTUBwQcMYMZqS5sz+lNI2L
         rXhg==
X-Forwarded-Encrypted: i=1; AJvYcCX0dd6JL+rjp7fV0YezDyfoUU31oeFIjbFXkNZB9FfrglaBJyrhOCKsE2hayIMu0VPM4KjZkaqBe8I/Yps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEvE4zdkg3E8/L/rrH3W2L3TVwIDWsJ0P6SmWHNIcMqh3G/wl
	iZwdT0UF+G5KIQnl+i1s22CPpRVyJYxQGxjtXgQ1/T7a8XfLtwEgDQyY+THTNOjqP1WpyovhOnh
	BxpRVB0T7jNYSRaApJtjUZJOUeT7h1CxyXm3QAQrZwf2ExtbWHmMJ+Sw=
X-Gm-Gg: ASbGncvoeWEoOxC/XWjBajJtlx8O3olYIL0P8J5V0XZ6FG+sbd7Sx2FqOkQrq1tsmjX
	EP4YfMmj5S9ZoXB8/sz7eLlWjzzskw/Lr5IAwqnjXyXrOb8PIIbvp0268yKJecK4jkqUZKqNVII
	VIdXGs8RrW1QOIWdKSQsX0m2YPefNuvg==
X-Google-Smtp-Source: AGHT+IEu0lOSPJ9gaj/CnOwHje1qwXsd2Ga+tHw7jydiVfOP0oJ25upss+fSU4AYeKjvCe3VkINEKEXkzD1honycBcI=
X-Received: by 2002:a05:622a:2305:b0:4a3:e3df:f9de with SMTP id
 d75a77b69052e-4a4400691d9mr41392931cf.23.1748581265568; Thu, 29 May 2025
 22:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-5-pasha.tatashin@soleen.com> <aDQKrOjtHXbJqG9n@kernel.org>
In-Reply-To: <aDQKrOjtHXbJqG9n@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 30 May 2025 01:00:28 -0400
X-Gm-Features: AX0GCFsuGxA3WBHfUh4AZ4DEUOnu93SjPzxpR3IzxCxUZLpciEuTt-_BKbMOu1g
Message-ID: <CA+CK2bDWVu137cPdbu7yOBNGm_ixoeJkQucZW_gPXV3FzTPMKQ@mail.gmail.com>
Subject: Re: [RFC v2 04/16] luo: luo_core: Live Update Orchestrator
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"

> > +config LIVEUPDATE
> > +     bool "Live Update Orchestrator"
> > +     depends on KEXEC_HANDOVER
> > +     help
> > +       Enable the Live Update Orchestrator. Live Update is a mechanism,
> > +       typically based on kexec, that allows the kernel to be updated
> > +       while keeping selected devices operational across the transition.
> > +       These devices are intended to be reclaimed by the new kernel and
> > +       re-attached to their original workload without requiring a device
> > +       reset.
> > +
> > +       This functionality depends on specific support within device drivers
> > +       and related kernel subsystems.
>
> This is not clear if the ability to reattach a device to the new kernel or
> the entire live update functionality depends on specific support with
> drivers.
>
> Probably better phrase it as
>
>           Ability to handover a device from old to new kernel depends ...

Updated

>
> > +
> > +       This feature is primarily used in cloud environments to quickly
> > +       update the kernel hypervisor with minimal disruption to the
> > +       running virtual machines.
>
> I wouldn't put it into Kconfig. If anything I'd make it
>
>           This feature primarily targets virtual machine hosts to quickly ...

Ok

> > + * The core of LUO is a state machine that tracks the progress of a live update,
> > + * along with a callback API that allows other kernel subsystems to participate
> > + * in the process. Example subsystems that can hook into LUO include: kvm,
> > + * iommu, interrupts, vfio, participating filesystems, and mm.
>
> Please spell out memory management.

Done.

>
> > + * LUO uses KHO to transfer memory state from the current Kernel to the next
>
> A link to KHO docs would have been nice, but I'm not sure kernel-doc can do
> that nicely.

Added a link, a simple path to rst, is apparently correctly converted
to a link by sphinx.

>
> > + * Kernel.
>
> Why capital 'K'? :)

Fixed.

>
> > + * The LUO state machine ensures that operations are performed in the correct
> > + * sequence and provides a mechanism to track and recover from potential
> > + * failures, and select devices and subsystems that should participate in
> > + * live update sequence.
> > + */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/err.h>
> > +#include <linux/kobject.h>
> > +#include <linux/liveupdate.h>
> > +#include <linux/rwsem.h>
> > +#include <linux/string.h>
> > +#include "luo_internal.h"
> > +
> > +static DECLARE_RWSEM(luo_state_rwsem);
> > +
> > +enum liveupdate_state luo_state;
>
> static?

Fixed

> Hmm, luo_state is initialized to 0 (NORMAL) which means we always start
> from NORMAL, although the second kernel is not in the normal state until
> the handover is complete. Maybe we need an initial "unknown" state until
> some of luo code starts running and would set an actual known state?

Added: LIVEUPDATE_STATE_UNDEFINED that exists only before LUO is
initialized during boot.

> > +const char *const luo_state_str[] = {
> > +     [LIVEUPDATE_STATE_NORMAL]       = "normal",
> > +     [LIVEUPDATE_STATE_PREPARED]     = "prepared",
> > +     [LIVEUPDATE_STATE_FROZEN]       = "frozen",
> > +     [LIVEUPDATE_STATE_UPDATED]      = "updated",
> > +};
> > +
> > +bool luo_enabled;
>
> static?

Fixed.

>
> > +static int __init early_liveupdate_param(char *buf)
> > +{
> > +     return kstrtobool(buf, &luo_enabled);
> > +}
> > +early_param("liveupdate", early_liveupdate_param);
> > +
> > +/* Return true if the current state is equal to the provided state */
> > +static inline bool is_current_luo_state(enum liveupdate_state expected_state)
> > +{
> > +     return READ_ONCE(luo_state) == expected_state;
> > +}
> > +
> > +static void __luo_set_state(enum liveupdate_state state)
> > +{
> > +     WRITE_ONCE(luo_state, state);
> > +}
> > +
> > +static inline void luo_set_state(enum liveupdate_state state)
> > +{
> > +     pr_info("Switched from [%s] to [%s] state\n",
> > +             LUO_STATE_STR, luo_state_str[state]);
>
> Maybe LUO_CURRENT_STATE_STR?

Done

> > +     __luo_set_state(state);
> > +}
> > +
> > +static int luo_do_freeze_calls(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void luo_do_finish_calls(void)
> > +{
> > +}
> > +
> > +int luo_prepare(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +/**
> > + * luo_freeze() - Initiate the final freeze notification phase for live update.
> > + *
> > + * Attempts to transition the live update orchestrator state from
> > + * %LIVEUPDATE_STATE_PREPARED to %LIVEUPDATE_STATE_FROZEN. This function is
> > + * typically called just before the actual reboot system call (e.g., kexec)
> > + * is invoked, either directly by the orchestration tool or potentially from
> > + * within the reboot syscall path itself.
> > + *
> > + * Based on the outcome of the notification process:
> > + * - If luo_do_freeze_calls() returns 0 (all callbacks succeeded), the state
> > + * is set to %LIVEUPDATE_STATE_FROZEN using luo_set_state(), indicating
> > + * readiness for the imminent kexec.
> > + * - If luo_do_freeze_calls() returns a negative error code (a callback
> > + * failed), the state is reverted to %LIVEUPDATE_STATE_NORMAL using
> > + * luo_set_state() to cancel the live update attempt.
>
> The kernel-doc comments are mostly for users of a function and describe how
> it should be used rather how it is implemented.

SGTM, cleaned-up.

> I don't think it's important to mention return values of
> luo_do_freeze_calls() here. The important things are whether registered
> subsystems succeeded to freeze or not and the state changes.
> I'd also mention that if a subsystem fails to freeze, everything is
> canceled.

Added

> > +/**
> > + * luo_finish - Finalize the live update process in the new kernel.
> > + *
> > + * This function is called  after a successful live update reboot into a new
> > + * kernel, once the new kernel is ready to transition to the normal operational
> > + * state. It signals the completion of the live update sequence to subsystems.
> > + *
> > + * It first attempts to acquire the write lock for the orchestrator state.
> > + *
> > + * Then, it checks if the system is in the ``LIVEUPDATE_STATE_UPDATED`` state.
> > + * If not, it logs a warning and returns ``-EINVAL``.
> > + *
> > + * If the state is correct, it triggers the ``LIVEUPDATE_FINISH`` notifier
>
> Here too, you describe what the function does rather how it should be used

Fixed

>
> > + * chain. Note that the return value of the notifier is intentionally ignored as
> > + * finish callbacks must not fail. Finally, the orchestrator state is
>
> And what should happen if there was an error in a finish callback?

Scream, warn, panic, we cannot allow running a system past liveupdate,
if some state was not properly passed from the previous kernel to the
current kernel. This may result in catastrophic memory leaks.

> > +static int __init luo_startup(void)
> > +{
> > +     __luo_set_state(LIVEUPDATE_STATE_NORMAL);
> > +
> > +     return 0;
> > +}
> > +early_initcall(luo_startup);
>
> This means that the second kernel starts with luo_state == NORMAL, then
> at early_initcall transitions to NORMAL again and later is set to UPDATED,
> doesn't it?

In the next patch, in this function we transition to UPDATED. So,
technically, we go from NORMAL to UPDATED. However, I added UNDEFINED
state so, in this function we either go from UNDEFINED to UPDATED or
UNDEFINED to NORMAL.


> > + * @return true if the system is in the ``LIVEUPDATE_STATE_NORMAL`` state,
> > + * false otherwise.
> > + */
> > +bool liveupdate_state_normal(void)
> > +{
> > +     return is_current_luo_state(LIVEUPDATE_STATE_NORMAL);
> > +}
> > +EXPORT_SYMBOL_GPL(liveupdate_state_normal);
>
> Won't liveupdate_get_state() do?

Yeah, we can simply return state, and let caller to compare. However,
I think, caller is only interested if this is normal state or if live
update is in progress. I will keep them, and also added
liveupdate_get_state().

> > +
> > +/**
> > + * liveupdate_enabled - Check if the live update feature is enabled.
> > + *
> > + * This function returns the state of the live update feature flag, which
> > + * can be controlled via the ``liveupdate`` kernel command-line parameter.
> > + *
> > + * @return true if live update is enabled, false otherwise.
> > + */
> > +bool liveupdate_enabled(void)
> > +{
> > +     return luo_enabled;
> > +}
> > +EXPORT_SYMBOL_GPL(liveupdate_enabled);
> > diff --git a/drivers/misc/liveupdate/luo_internal.h b/drivers/misc/liveupdate/luo_internal.h
> > new file mode 100644
> > index 000000000000..34e73fb0318c
> > --- /dev/null
> > +++ b/drivers/misc/liveupdate/luo_internal.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +/*
> > + * Copyright (c) 2025, Google LLC.
> > + * Pasha Tatashin <pasha.tatashin@soleen.com>
> > + */
> > +
> > +#ifndef _LINUX_LUO_INTERNAL_H
> > +#define _LINUX_LUO_INTERNAL_H
> > +
> > +int luo_cancel(void);
> > +int luo_prepare(void);
> > +int luo_freeze(void);
> > +int luo_finish(void);
> > +
> > +void luo_state_read_enter(void);
> > +void luo_state_read_exit(void);
> > +
> > +extern const char *const luo_state_str[];
> > +
> > +/* Get the current state as a string */
> > +#define LUO_STATE_STR luo_state_str[READ_ONCE(luo_state)]
>
> IIUC you need the macro to have LUO_STATE_STR available in all files in
> liveupdate/ but without exposing luo_state.
>
> I think that we can do a function call to get that string, will make things
> nicer IMHO.

Done.

>
> > +
> > +extern enum liveupdate_state luo_state;
> > +
> > +#endif /* _LINUX_LUO_INTERNAL_H */
> > diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> > new file mode 100644
> > index 000000000000..c2740da70958
> > --- /dev/null
> > +++ b/include/linux/liveupdate.h
> > @@ -0,0 +1,131 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +/*
> > + * Copyright (c) 2025, Google LLC.
> > + * Pasha Tatashin <pasha.tatashin@soleen.com>
> > + */
> > +#ifndef _LINUX_LIVEUPDATE_H
> > +#define _LINUX_LIVEUPDATE_H
> > +
> > +#include <linux/bug.h>
> > +#include <linux/types.h>
> > +#include <linux/list.h>
> > +
> > +/**
> > + * enum liveupdate_event - Events that trigger live update callbacks.
> > + * @LIVEUPDATE_PREPARE: PREPARE should happens *before* the blackout window.
>
> should happen or happens ;-)

Done

>
> > + *                      Subsystems should prepare for an upcoming reboot by
> > + *                      serializing their states. However, it must be considered
>
> It's not only about state serialization, it's also about adjusting
> operational mode so that state that was serialized won't be changed or at
> least the changes from PREPARE to FREEZE would be accounted somehow.

By serialization, I mean is to save their state, but I agree, the
devices and resources are also should be in a limited state where the
serialized data should not be altered between prepare and freeze (i.e.
no memfd resizing, no new DMA mappings, etc).

Thank you for your comments.
Pasha
