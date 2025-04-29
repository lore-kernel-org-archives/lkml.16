Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6021A459
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938471; cv=none; b=XVV4no4qd3UaMgHe8InK7bqPqgpGt9HGvJgy1J4uQRfCK1EvXs+ScO5UpKYYfIHBTPx7niyzKgFkr55xii1J6Ow49vqFO+dJfFjz1VsaIn/rpq3Tr5W5t6GPblJisY7uORiHylHnEKXQUwO4eoTnqkbL2AXDO1obK1QI/xzI5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938471; c=relaxed/simple;
	bh=+iHpSbBUhNnZTbvbRKviPombVeI2GCj2dHPnprswxjQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r3FIO2ZsOCUBvilTPsPCs180C6RKfiA9eabEezOFW3VntKIqOw4IN0Uc7Igls8jw7w+4etor2ZQMpsvBRgIeizJVrg6yv0jado8u9yJYqPkpxHAQrSeita3JMUIrNOptpvgXSSNnFUiJZWR/Iy1QHwWQdkcAcmz78scThngpRRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3qq4LYTY; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3qq4LYTY"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740270e168aso954887b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745938470; x=1746543270; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jLW668bYFr2NDKsH4shPhScDbZqrpr/6UHmMH06olSA=;
        b=3qq4LYTYiBiaUOVY2T5+FHXZwu5HCTx0kC7lbHjPJGa2BwlJNpQSN/abZMBqy/vrhy
         Kn4iEHON1fRMOVCdbFC5GrMRBfWNsVmkxjdmy926hQcUsuflL+F2jAgL7mIjwwimqS8F
         QKcuh09C0bDiaoTn3R0/ENC7WtV1NZ2Jyc83LuHYvRUzPqkrKBC82wF2QRcF6zEJX5JJ
         iQ+2smcXj2vhLbL/r4dZCPXCmfmLqLLIsa4H8AflgucSgxrnEgaynX4Z2N6a/wLZD382
         5EDGMgWmbSYhj3aLoak1YobDaFHwBqNy7/dPdKPtG+mmFsx4DwEE/cWj0E7I6NXgS0PM
         7BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938470; x=1746543270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLW668bYFr2NDKsH4shPhScDbZqrpr/6UHmMH06olSA=;
        b=rL2dri/RFhMZjYnNbvOaalYEEndOqILuabJdnxmQ2TJgEGZKmHcQvzEhn5nyfAxZT8
         wyPokM/6OJ1N6uSnk/mNDNqDTQ+JkUeqBXaApd6Hhb2poc9/qJUxNRJEtvX7uWyPo42E
         RWRBWvyswkwHAKhoGhqyvlJ+b4EqULG0qo5qqVn29JwUX9iah77MxDsVTaN4srfth03D
         AQQ76PXVMoBkQ2hTrlMPJuT0xG9qAeZ4NxI7nGBgV3f3zxd/eoiQAg7k1vOQaWjFxucE
         iDk5SR639lUH5jC2vyFCBXTsyuMQab42czenlDqAofqtaJhYKxL7R+LpWFyU40zqXMfQ
         TOcA==
X-Forwarded-Encrypted: i=1; AJvYcCXCC7ukfapO0R3zn1j3ZyQYrVRxIVYYiPMqIfBsE0j9ALHe3Zpi+aHFUUf1NC4OlT6pcGp6kohkZEoWop8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyExuk/o+g171RrMu2QDWHxGLAsPP6xKnAu41JqCsnhR0ekCwIY
	HmmBl55+jRqVJDh93rdKX5YvsB0cxIP7O7h7L5XIyPPE8DxdK+KW8XgtOOuPwLt8zsrmVb2TXjl
	g9A==
X-Google-Smtp-Source: AGHT+IHoFoK6EzlogQvH1clo+33w9XKzMhHFU2au3d/1uXwGlpvnl9hPIhErLtff+iW/CClsBK+MAZsJ08I=
X-Received: from pfbb10.prod.google.com ([2002:a05:6a00:ac8a:b0:730:7485:6b59])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1907:b0:736:53ce:a32c
 with SMTP id d2e1a72fcca58-74029530629mr3997624b3a.17.1745938469659; Tue, 29
 Apr 2025 07:54:29 -0700 (PDT)
Date: Tue, 29 Apr 2025 07:54:28 -0700
In-Reply-To: <20250428215952.1332985-2-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org> <20250428215952.1332985-2-carlos.bilbao@kernel.org>
Message-ID: <aBDoJLyiBcSZiAHm@google.com>
Subject: Re: [PATCH v2 1/2] panic: Allow for dynamic custom behavior after panic
From: Sean Christopherson <seanjc@google.com>
To: carlos.bilbao@kernel.org
Cc: tglx@linutronix.de, jan.glauber@gmail.com, bilbao@vt.edu, pmladek@suse.com, 
	akpm@linux-foundation.org, jani.nikula@intel.com, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	takakura@valinux.co.jp, john.ogness@linutronix.de
Content-Type: text/plain; charset="us-ascii"

On Mon, Apr 28, 2025, carlos.bilbao@kernel.org wrote:
> diff --git a/kernel/panic.c b/kernel/panic.c
> index a3889f38153d..2cdd83b4afb6 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -276,6 +276,30 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
>  		crash_smp_send_stop();
>  }
>  
> +/*
> + * This is the default function called after a kernel panic has been
> + * handled. Higher priority alternatives can be set with function
> + * panic_set_handling()
> + *
> + */
> +static void after_panic_handling(void)
> +{
> +	mdelay(PANIC_TIMER_STEP);
> +}
> +
> +static void (*panic_halt)(void) = after_panic_handling;

The default implementation clearly doesn't halt, which makes this unnecessarily
confusing.  And if you're going to provide a default implementation, why bother
checking for NULL in panic()?  Just leave panic_halt NULL.

> +static int panic_hlt_priority;

Uber nit, pick one of halt or hlt.

> +
> +void panic_set_handling(void (*fn)(void), int priority)
> +{
> +	if (priority <= panic_hlt_priority)

If panic_halt is NULL by default, maybe do?

	if (panic_halt && priority <= panic_halt_priority)

> +		return;
> +
> +	panic_hlt_priority = priority;
> +	panic_halt = fn;
> +}
> +EXPORT_SYMBOL_GPL(panic_set_handling);

This doesn't seem like something that should be exported unless it's absolutely
necessary, and it shouldn't be necessary as of this series.

> +
>  /**
>   *	panic - halt the system
>   *	@fmt: The text string to print
> @@ -467,6 +491,9 @@ void panic(const char *fmt, ...)
>  	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>  	nbcon_atomic_flush_unsafe();
>  
> +	if (panic_halt)
> +		panic_halt();
> +
>  	local_irq_enable();
>  	for (i = 0; ; i += PANIC_TIMER_STEP) {
>  		touch_softlockup_watchdog();
> -- 
> 2.47.1
> 
