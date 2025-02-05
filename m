Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035DF25A62E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 04:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738728210; cv=none; b=f4aNFyLudbq9IvU2aqGC/D0IdJcHTTsK5nWpAlaLP1S90/8+5oZ/o+8iasIqEStod/gLmtQ4JR9nAEtgnvkWCwXet+tqBZ+vXmqNJy7pmUY1AMx+MGdhe0Vf+gHzgh80jvl7h6jB01xmMp6IG9R3KFGNOzq0PXo7r9L9hPcRvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738728210; c=relaxed/simple;
	bh=+QSS84F7x9iEHUkQqxmEe0tNZLTaSS9aJlAqyITbIGY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OhOex19sNzBYebwC7SIGwrXWrHE9Oc+sTGJbRq8JQtNi1dMFu+OLDH4QRohUVVnpZxqvhSchP1jlxaZ7Zhkec/9ZO7jHZBIIk+yiFB8PJ7O5Lgby4F/UMxPA3/fZmC5FnEJeTwivHBD/0OVMOurFeKSYWVB8X1KK7If7Ou1AFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KDf/n0/k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KDf/n0/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738728206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QOpz6Nfj41N1pcyoHujuyKK7jTBMXlNPAoBHd322E+A=;
	b=KDf/n0/kiaH7D7po3KYGWyHjmd3txZlPPXw7ns4kfxcvzCvOSi5bn8NHRqcZ1IMWOMO3L8
	aCVUVo3Y+i7UHTzKjsqw90BP6NyufLuVozBr2OdQHx46sxzgeB0Q78P2Bmgi4btOLOLGoA
	PfbbDJRWkBjyP1UQtqCeozFRx4BJmVg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-ZYqVxpHfOHmRtMcFOh-zPA-1; Tue, 04 Feb 2025 23:03:25 -0500
X-MC-Unique: ZYqVxpHfOHmRtMcFOh-zPA-1
X-Mimecast-MFC-AGG-ID: ZYqVxpHfOHmRtMcFOh-zPA
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6eeef7cb8so1090143885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 20:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738728205; x=1739333005;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOpz6Nfj41N1pcyoHujuyKK7jTBMXlNPAoBHd322E+A=;
        b=SSYMGBvLGl7+lHwM1BisL6sRgt74VQPVWgAuLopSq7lfdGk6GKd4kjIsXvC1nWmiHo
         XBcOJ5L/wd9+CuqWPOjUB2gKmomEVZCXa8XxVVQntNQzIT4Cdc5d0f5bCVTUoSUpcm0C
         ptzEJg4RK+N8tOs0AP+YG3FAy206Jd2r8WxJIguLRJkV7Da7Yfot6O3K9tKIYpRQ6tCL
         s+FTYDZT5AFe+fH9A7SDMkg8Nw1zCJ48XNymqnEgih3jauOQzbxooJkhIQkl7VDaSMnd
         qb1FAyaqtf1H4EWZDK7EkhQBV7xedWpIUAz6u4M/3lyxxw5LebZdP4wWNd8qJ51HXpQO
         osRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwJopQVopHMKs9xZBpR8DvHojdrGMEVIwmKAfrfEXK5W/6ePM6COJtdFMrYsB16YCncq8bczGFoDAVVBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh+Ht5+3lMyUQ6G/b5IlQXmfVTq0XPH3jpZBvsPhRJ0FfH5u+k
	Copp0dU2VqGsk/f/foEGVLQK1YxF8g3TDGfHmYlzZb8Uyg6QLo9rMMuYnTkSrVqV96uW/yANf6z
	KwOcSizBDp2EGbgWSTXxLZVIpGkXkh/+uaJ2DH29BoNytXbWUEMObeXuvknwsjA==
X-Gm-Gg: ASbGnctAdqInysuMCzxsLCnwfAy02MxeMThdN64i3CMNZPXEzI+hSrbiyDt2agYxepx
	BkUHHrKOTsaPDHiUKpnF+781HinpaW3vAeQTwi1JhAOeXyC7t5qff1bGUTX/hvnQFDHSCtsoy8R
	mKn/dcnVuSn54dvYbjCAB5B6BUZ20e/w+MG31I4T9WYFR+AeMZ9XgOClrRtqin78xu6f7n8XXvR
	dhwmpOm8AYqN4sP2d6ZnuAbkkWHqB40lCpdU/V41y7+r7O6p7vyGlaAu3f4Uk4ZoODlgVEWKy/m
	sx2/obFi5lZskp7OD969v/2skEFjJasOZmP+wMY4NVFm7JkU
X-Received: by 2002:a05:620a:1993:b0:7b6:d998:4fc5 with SMTP id af79cd13be357-7c03a02beb3mr220603885a.35.1738728204939;
        Tue, 04 Feb 2025 20:03:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMGVo20LMt9+4qbEpwl9+Oehv3/34fZOO/Qu/qQiEHAvffKEPa7j4BToXxbxP05KI+6ox+ww==
X-Received: by 2002:a05:620a:1993:b0:7b6:d998:4fc5 with SMTP id af79cd13be357-7c03a02beb3mr220600985a.35.1738728204523;
        Tue, 04 Feb 2025 20:03:24 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d07esm708885485a.108.2025.02.04.20.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 20:03:23 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <50e7cfb4-4edd-4fa0-ba3e-b22d8d324b69@redhat.com>
Date: Tue, 4 Feb 2025 23:03:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nmi: Add an emergency handler in nmi_desc & use it
 in nmi_shootdown_cpus()
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Rik van Riel <riel@surriel.com>
References: <20241219150653.349177-1-longman@redhat.com>
Content-Language: en-US
In-Reply-To: <20241219150653.349177-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/24 10:06 AM, Waiman Long wrote:
> Depending on the type of panics, it was found that the
> __register_nmi_handler() function can be called in NMI context from
> nmi_shootdown_cpus() leading to a lockdep splat like the following.
>
> [ 1123.133573] ================================
> [ 1123.137845] WARNING: inconsistent lock state
> [ 1123.142118] 6.12.0-31.el10.x86_64+debug #1 Not tainted
> [ 1123.147257] --------------------------------
> [ 1123.151529] inconsistent {INITIAL USE} -> {IN-NMI} usage.
>    :
> [ 1123.261544]  Possible unsafe locking scenario:
> [ 1123.261544]
> [ 1123.267463]        CPU0
> [ 1123.269915]        ----
> [ 1123.272368]   lock(&nmi_desc[0].lock);
> [ 1123.276122]   <Interrupt>
> [ 1123.278746]     lock(&nmi_desc[0].lock);
> [ 1123.282671]
> [ 1123.282671]  *** DEADLOCK ***
>    :
> [ 1123.314088] Call Trace:
> [ 1123.316542]  <NMI>
> [ 1123.318562]  dump_stack_lvl+0x6f/0xb0
> [ 1123.322230]  print_usage_bug.part.0+0x3d3/0x610
> [ 1123.330618]  lock_acquire.part.0+0x2e6/0x360
> [ 1123.357217]  _raw_spin_lock_irqsave+0x46/0x90
> [ 1123.366193]  __register_nmi_handler+0x8f/0x3a0
> [ 1123.374401]  nmi_shootdown_cpus+0x95/0x120
> [ 1123.378509]  kdump_nmi_shootdown_cpus+0x15/0x20
> [ 1123.383040]  native_machine_crash_shutdown+0x54/0x160
> [ 1123.388095]  __crash_kexec+0x10f/0x1f0
> [ 1123.421465]  ? __ghes_panic.cold+0x4f/0x5d
> [ 1123.482648]  </NMI>
>
> In this particular case, the following panic message was printed before.
>
> [ 1122.808188] Kernel panic - not syncing: Fatal hardware error!
>
> This message seemed to be given out from __ghes_panic() running in
> NMI context.
>
> The __register_nmi_handler() function which takes the nmi_desc lock
> with irq disabled shouldn't be called from NMI context as this can
> lead to deadlock.
>
> The nmi_shootdown_cpus() function can only be invoked once. After the
> first invocation, all other CPUs should be stuck in the newly added
> crash_nmi_callback() and cannot respond to a second NMI.
>
> One way to address this problem is to remove all the panic() calls from
> NMI context, but that can be too restrictive.
>
> Another way to fix this problem while allowing panic() calls from
> NMI context is by adding a new emergency NMI handler to the nmi_desc
> structure and provide a new set_emergency_nmi_handler() helper to
> atomically set crash_nmi_callback() in any context. The new emergency
> handler will preempt other handlers in the linked list. That will
> eliminate the need to take any lock and serve the panic in NMI use case.
>
> Signed-off-by: Waiman Long <longman@redhat.com>
> Acked-by: Rik van Riel <riel@surriel.com>
> ---
>   arch/x86/include/asm/nmi.h |  2 ++
>   arch/x86/kernel/nmi.c      | 45 ++++++++++++++++++++++++++++++++++++++
>   arch/x86/kernel/reboot.c   | 11 ++++------
>   3 files changed, 51 insertions(+), 7 deletions(-)
>
>   [v4] Just twist the C comments, no code change from v3.
>
> diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
> index 41a0ebb699ec..6715c123eff4 100644
> --- a/arch/x86/include/asm/nmi.h
> +++ b/arch/x86/include/asm/nmi.h
> @@ -56,6 +56,8 @@ int __register_nmi_handler(unsigned int, struct nmiaction *);
>   
>   void unregister_nmi_handler(unsigned int, const char *);
>   
> +int set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler);
> +
>   void stop_nmi(void);
>   void restart_nmi(void);
>   void local_touch_nmi(void);
> diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
> index ed163c8c8604..2cb75a53c0c4 100644
> --- a/arch/x86/kernel/nmi.c
> +++ b/arch/x86/kernel/nmi.c
> @@ -40,8 +40,12 @@
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/nmi.h>
>   
> +/*
> + * An emergency handler can be set in any context including NMI
> + */
>   struct nmi_desc {
>   	raw_spinlock_t lock;
> +	nmi_handler_t emerg_handler;	/* Emergency handler */
>   	struct list_head head;
>   };
>   
> @@ -132,9 +136,22 @@ static void nmi_check_duration(struct nmiaction *action, u64 duration)
>   static int nmi_handle(unsigned int type, struct pt_regs *regs)
>   {
>   	struct nmi_desc *desc = nmi_to_desc(type);
> +	nmi_handler_t ehandler;
>   	struct nmiaction *a;
>   	int handled=0;
>   
> +	/*
> +	 * Call the emergency handler, if set
> +	 *
> +	 * In the case of crash_nmi_callback() emergency handler, it will
> +	 * return in the case of the crashing CPU to enable it to complete
> +	 * other necessary crashing actions ASAP. Other handlers in the
> +	 * linked list won't need to be run.
> +	 */
> +	ehandler = READ_ONCE(desc->emerg_handler);
> +	if (ehandler)
> +		return ehandler(type, regs);
> +
>   	rcu_read_lock();
>   
>   	/*
> @@ -224,6 +241,34 @@ void unregister_nmi_handler(unsigned int type, const char *name)
>   }
>   EXPORT_SYMBOL_GPL(unregister_nmi_handler);
>   
> +/**
> + * set_emergency_nmi_handler - Set emergency handler
> + * @type:    NMI type
> + * @handler: the emergency handler to be stored
> + * Return: 0 if success, -EEXIST if a handler had been stored
> + *
> + * Atomically set an emergency NMI handler which, if set, will preempt all
> + * the other handlers in the linked list. If a NULL handler is passed in,
> + * it will clear it.
> + */
> +int set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler)
> +{
> +	struct nmi_desc *desc = nmi_to_desc(type);
> +	nmi_handler_t orig = NULL;
> +
> +	if (!handler) {
> +		orig = READ_ONCE(desc->emerg_handler);
> +		WARN_ON_ONCE(!orig);
> +	}
> +
> +	if (try_cmpxchg(&desc->emerg_handler, &orig, handler))
> +		return 0;
> +	if (WARN_ON_ONCE(orig == handler))
> +		return 0;
> +	WARN_ONCE(1, "%s: failed to set emergency NMI handler!\n", __func__);
> +	return -EEXIST;
> +}
> +
>   static void
>   pci_serr_error(unsigned char reason, struct pt_regs *regs)
>   {
> diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
> index 615922838c51..12df9e402d3c 100644
> --- a/arch/x86/kernel/reboot.c
> +++ b/arch/x86/kernel/reboot.c
> @@ -926,15 +926,12 @@ void nmi_shootdown_cpus(nmi_shootdown_cb callback)
>   	shootdown_callback = callback;
>   
>   	atomic_set(&waiting_for_crash_ipi, num_online_cpus() - 1);
> -	/* Would it be better to replace the trap vector here? */
> -	if (register_nmi_handler(NMI_LOCAL, crash_nmi_callback,
> -				 NMI_FLAG_FIRST, "crash"))
> -		return;		/* Return what? */
> +
>   	/*
> -	 * Ensure the new callback function is set before sending
> -	 * out the NMI
> +	 * Atomically set emergency handler to preempt other handlers.
> +	 * The action shouldn't fail or a warning will be printed.
>   	 */
> -	wmb();
> +	set_emergency_nmi_handler(NMI_LOCAL, crash_nmi_callback);
>   
>   	apic_send_IPI_allbutself(NMI_VECTOR);
>   

Ping! Is further change needed for this patch?

Thanks,
Longman

