Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00079278E61
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374694; cv=none; b=V/VhslCk0w0NuPPDbHOn886dzD+SYm9hHiPHnBqGJktEAjipNq2+5dcK/o7mbjw0r3voaS9KOISSOiV7v/cYpX3kPaV3O+craeakWdeMEx/zmrZK9+3Vqy7KvT8EgtK1Qe1Tq5MPi9sJUltCPnCHX5mcviHeAvP9tD3qeegDkRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374694; c=relaxed/simple;
	bh=YpPcsptMufE/WHTUS+gVSlWyG8WFSv1tw3X71o3wf7s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DnWsvI8DErejhb78i9hcd3GnyLw8b7BtfwtvlL8o6Sd44pnpJwhYF3wvT9aTQu9XLoHC31C4+lFCPZyGekZMcffs0yzrVQ3wEUL7PiFfbNLRb0F9rmFIBW9aQQNLv5cBguDomP3oALSUMoqt2U7eE6h6GPXT7mY3jxCNMrbaQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OQuFWqc+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OQuFWqc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744374689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GJEeKS7xxB01iKq/G87oXV/bErhCVG//vypcEKNjGjk=;
	b=OQuFWqc+dAc6iCYr01YzanvFXKod5iGkxf9CPb+GdVtl0G4GFn9zm7n7NDjQ4m70K+aDD6
	syX3vz3O7o5E6Zuv4PKeD9qyji/qKVw2VJ2+exyUqCZNGBzpiGnQMNM+b54XlHoXycKKfk
	Z/sdXje53dIoutfKx/6BnZL3miKAIvw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-k13iFzNXMieb4tPpxFIXug-1; Fri, 11 Apr 2025 08:31:28 -0400
X-MC-Unique: k13iFzNXMieb4tPpxFIXug-1
X-Mimecast-MFC-AGG-ID: k13iFzNXMieb4tPpxFIXug_1744374687
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso1250763f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374687; x=1744979487;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJEeKS7xxB01iKq/G87oXV/bErhCVG//vypcEKNjGjk=;
        b=wuyXksnHkMd58asBi19A2Kl3/KsGL7JIF1c0Ua4+6IjNUBgk70u+kUaCOhZiG4FRQe
         +sXGP+Y/gjWVqXKgOi21e7u5Zn1xoOklcch4KTr7shcSxkOBQHgItYr94Gwc/XisEFgC
         UVG41oZ/KKHbYsgvGDKgJZXVkHEhLs0ANoz8YFYncH5Z09bcVFod1lPfrZGGoE2Fl1EI
         XH6NLWLTVbDXUYwWsdMPuK72mc7HXv8azqxcLsFiCWsU0MsDfueQ9nR9t7fh1E927EoT
         /+YS7S+nGXBfyo9MZmCB2pPlzFjUIyTDP/HTDVm4O/Pht1yveWDR0VaiQXAHYvUAWiC/
         Wfkg==
X-Forwarded-Encrypted: i=1; AJvYcCULJASFRkXOhBn7rmEr21p3+XVGcfuMUhHOvruXHBdXRjLRY8ivD3uW6Czzu0bK/Qpoeoe1sxLzL3X8Goo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+npAE80FVWMVoBw4lcS+v1S3vr9HimSr0agP/CC1mGUeFvVEP
	nl59BgE0JOyALC21hpB5UcKUBcFlFOtyT+/zlkryaxrMFnSf5lXaJmfCEm3hDMiXTBuY0OqC6Ps
	MvwIaAcTMkaFkvgP2WUxt4Xox846vnux5L3cMcC+X/3pRulII8aYvGgf/bYFoAA==
X-Gm-Gg: ASbGncshPwVXaktAfn4wjxnry3WKIUwY4g8phWi4BLjzHo80m6dLT9dYrVaQWpUeN0p
	MHcNa99HXSMgAunQIafFfnMYPR8noWxllNSIQVaCiC7sbOD9bTA6rakn0YK3QPHVfj4lhM1gVNf
	o2zIFIvq0vybBKgGbqGdagLaL55N1vp79fCkFWzr2BZdb8ndE7I3M6/KtYkTP0L5aOwZVdW4jJP
	/O/fAUpTW6ZqpVf4tiR2n/N10MCnyWHa5Co2+xtnurXJLqS+eaTYIXtHNS5lPO7gzSOOVVsH75a
	i9SbUmjhkf3lcsfPsLCZMoQk8ooU3rVKvjbJxw==
X-Received: by 2002:a05:6000:2ab:b0:391:2fe4:de0a with SMTP id ffacd0b85a97d-39ea51d101dmr2302713f8f.2.1744374687191;
        Fri, 11 Apr 2025 05:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHgSNQW/JrpVf7gPQ5mPM0FUzJgYSItETaWW3fszkPMzJM3Wg+Up54VDrNGuVjgCiRDthFxA==
X-Received: by 2002:a05:6000:2ab:b0:391:2fe4:de0a with SMTP id ffacd0b85a97d-39ea51d101dmr2302665f8f.2.1744374686645;
        Fri, 11 Apr 2025 05:31:26 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c123sm1943076f8f.36.2025.04.11.05.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:31:26 -0700 (PDT)
Message-ID: <3856012ded193df3685d9a11724612896165179a.camel@redhat.com>
Subject: Re: [PATCH v2 22/22] rv: Allow to configure the number of per-task
 monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Fri, 11 Apr 2025 14:31:19 +0200
In-Reply-To: <2591d725ec3dddfa27ad1826e7440fca71671770.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <2591d725ec3dddfa27ad1826e7440fca71671770.1744355018.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> Now that there are 2 monitors for real-time applications, users may
> want to
> enable both of them simultaneously. Make the number of per-task
> monitor
> configurable. Default it to 2 for now.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0include/linux/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0include/linux/sched.h=C2=A0=C2=A0 | 8 +++-----
> =C2=A0kernel/trace/rv/Kconfig | 9 +++++++++
> =C2=A0kernel/trace/rv/rv.c=C2=A0=C2=A0=C2=A0 | 8 ++++----
> =C2=A04 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/include/linux/rv.h b/include/linux/rv.h
> index c8320fa3a94b..204436a73bee 100644
> --- a/include/linux/rv.h
> +++ b/include/linux/rv.h
> @@ -75,7 +75,7 @@ static inline bool rv_ltl_all_atoms_known(struct
> ltl_monitor *mon)
> =C2=A0 * these are justified.
> =C2=A0 */
> =C2=A0#define RV_PER_TASK_MONITORS		1

We could get rid of RV_PER_TASK_MONITORS too I guess.

Rest looks good, thanks.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> -#define RV_PER_TASK_MONITOR_INIT	(RV_PER_TASK_MONITORS)
> +#define
> RV_PER_TASK_MONITOR_INIT	(CONFIG_RV_PER_TASK_MONITORS)
> =C2=A0
> =C2=A0union rv_task_monitor {
> =C2=A0	struct da_monitor	da_mon;
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 45be0fa7a5cc..560782493292 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1623,12 +1623,10 @@ struct task_struct {
> =C2=A0
> =C2=A0#ifdef CONFIG_RV
> =C2=A0	/*
> -	 * Per-task RV monitor. Nowadays fixed in
> RV_PER_TASK_MONITORS.
> -	 * If we find justification for more monitors, we can think
> -	 * about adding more or developing a dynamic method. So far,
> -	 * none of these are justified.
> +	 * Per-task RV monitor, fixed in
> CONFIG_RV_PER_TASK_MONITORS.
> +	 * If memory becomes a concern, we can think about a dynamic
> method.
> =C2=A0	 */
> -	union rv_task_monitor		rv[RV_PER_TASK_MONITORS];
> +	union
> rv_task_monitor		rv[CONFIG_RV_PER_TASK_MONITORS];
> =C2=A0#endif
> =C2=A0
> =C2=A0#ifdef CONFIG_USER_EVENTS
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index 942d57575e67..c11bf7e61ebf 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -32,6 +32,15 @@ menuconfig RV
> =C2=A0	=C2=A0 For further information, see:
> =C2=A0	=C2=A0=C2=A0=C2=A0 Documentation/trace/rv/runtime-verification.rst
> =C2=A0
> +config RV_PER_TASK_MONITORS
> +	int "Maximum number of per-task monitor"
> +	depends on RV
> +	range 1 8
> +	default 2
> +	help
> +	=C2=A0 This option configures the maximum number of per-task RV
> monitors that can run
> +	=C2=A0 simultaneously.
> +
> =C2=A0source "kernel/trace/rv/monitors/wip/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/wwnr/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/sched/Kconfig"
> diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
> index d493fddf411f..ebd4b4b228bf 100644
> --- a/kernel/trace/rv/rv.c
> +++ b/kernel/trace/rv/rv.c
> @@ -165,7 +165,7 @@ struct dentry *get_monitors_root(void)
> =C2=A0LIST_HEAD(rv_monitors_list);
> =C2=A0
> =C2=A0static int task_monitor_count;
> -static bool task_monitor_slots[RV_PER_TASK_MONITORS];
> +static bool task_monitor_slots[CONFIG_RV_PER_TASK_MONITORS];
> =C2=A0
> =C2=A0int rv_get_task_monitor_slot(void)
> =C2=A0{
> @@ -173,12 +173,12 @@ int rv_get_task_monitor_slot(void)
> =C2=A0
> =C2=A0	lockdep_assert_held(&rv_interface_lock);
> =C2=A0
> -	if (task_monitor_count =3D=3D RV_PER_TASK_MONITORS)
> +	if (task_monitor_count =3D=3D CONFIG_RV_PER_TASK_MONITORS)
> =C2=A0		return -EBUSY;
> =C2=A0
> =C2=A0	task_monitor_count++;
> =C2=A0
> -	for (i =3D 0; i < RV_PER_TASK_MONITORS; i++) {
> +	for (i =3D 0; i < CONFIG_RV_PER_TASK_MONITORS; i++) {
> =C2=A0		if (task_monitor_slots[i] =3D=3D false) {
> =C2=A0			task_monitor_slots[i] =3D true;
> =C2=A0			return i;
> @@ -194,7 +194,7 @@ void rv_put_task_monitor_slot(int slot)
> =C2=A0{
> =C2=A0	lockdep_assert_held(&rv_interface_lock);
> =C2=A0
> -	if (slot < 0 || slot >=3D RV_PER_TASK_MONITORS) {
> +	if (slot < 0 || slot >=3D CONFIG_RV_PER_TASK_MONITORS) {
> =C2=A0		WARN_ONCE(1, "RV releasing an invalid slot!: %d\n",
> slot);
> =C2=A0		return;
> =C2=A0	}

