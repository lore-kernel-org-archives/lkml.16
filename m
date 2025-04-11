Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71C1F4616
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380226; cv=none; b=RopfxEtxBLsAw5nO2m3lZPI1UiTyyAosH/bRhnNUgMw+XbyjoQYWxdnlVSNuk7x8oVnpGE+c+oacL5SMnUVQTfYm+J/RxTKNaq0s5iq2Z3TrpoqQ7yviRFWQ5DF+EQ1r39BdTvI4ONkr/PxMHsrUUfjVu7CZlRb/qrie0vKwLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380226; c=relaxed/simple;
	bh=i/7zlwAJIjzPQYT2vnSF8gZ49qBJM600G17+gPhJlFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3z8xWW0eGvwoorl9SgZnKpOc2WmYNgAZt1Su7IYJUT6cSWKiPQPn6XhznT4FnVVNkUXg4fcmGLdhgam7NIILWtrAUztObDoVElhOl/ylk832GQqI6aE7nFeno0vGlMrEUnB/NISVipva6KcUG5kukcS8UT+wBawYo31btcYQ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eIhXh+Zf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eIhXh+Zf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso9860555e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744380222; x=1744985022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WapZo+xzIjTKewOPVPt6LLWBOyxWAzBf4gfdfN+8PBo=;
        b=eIhXh+Zflsoko/pmrj5KDrMWUxvyZCiISxSpqzzlFFFpjjauGcUDXMi9r+17wXsecV
         JYQNzsV+whnx6cczY06OEqOl9LhO0qUzTb11TWKZ95JHBYBvQ7zp0WslEkEvIaRRmYhU
         4bhG/kVeRGERi1GAV7O5bKqrimmB/izKAe4RbAxL/HaeLpw+guNyogWqWblp87EQbEmE
         S7ydak35X2oSokuqyGoRFo1jrlqpDJEmHc2R1W8rlbIjnTygO3a9GByPIsWQIoeO3RjT
         +2dc8qGgJN4R98Dtlbqgr7cIrrU7eUMJ8fXKDJlOUx5xvR1gbLgzxpQdgwGpMR78aJdT
         DmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380222; x=1744985022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WapZo+xzIjTKewOPVPt6LLWBOyxWAzBf4gfdfN+8PBo=;
        b=TvT/4HLmIXWNPJhOdolgwSmpmL/bp4xAYpvS4wZVNE0shPOC0F8wEMoJyK8mTZxpvk
         Sb/7H5z//FH9Jd5D3GlMNdFk6vR/U87vJ2e6M0hXqk2pUbMePCSvvY0KFv6a1bGT0KMK
         ez0g72CemwgO+CnmKKG4e9DGF7rDSdewr/YSoNVxWC3p7TuUoK6rg1JOZetNoaHAjjBr
         A7T5tbJspI/++ZQl3BjPzDv+JIdXa8e4p48UNqj9E463y0IYzQvSHBOAAZsMGysI9qlQ
         GYokM7b4UYzq703DP8u2wc8pUUhCRLDAkDtInK5UgeKALsJsHxifL0AdCzufdCKpIOX7
         4diw==
X-Forwarded-Encrypted: i=1; AJvYcCXAoaJdDIfUmMlRvm8NDGxUWaNxeQlBq2C0S14HhwA4rlDkHmlYAycCZ0zuhjatQiFLPcRGBtlAgOxCYOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi7+ZMQ6WpRr3aCztpmR0f9hfSLvesNxwMrTins5ojuQ8pMROb
	SMASSvH60jzX5BC+muPSVDDfryDUEJGoYGkmU4Jn7fPb4nc+ZXH0gS+sNYseHgKyRJdegFpURpF
	W
X-Gm-Gg: ASbGncvKM9op6IOj6jLASwfkexdrGZM9We057fzIdiHPWotVmxQ5TFx9g/ME+c5DkAe
	Ar+o19l1Ta4Fhlm8sDgrLbUz8IYQGojMqq5eE9derQIN+udnRCq4xmKXgvZGojlhHhhhMnrwQe4
	nHndYNr9JIyiD26Qkw8u9Le+pSiySMNahWAFPESFaSUwJkCdHrCLyFtvGJiZYYhmrTc3++lfl3o
	xaXXyzHPK+QVBKznQVAjWj76o+lHYE+ooGUu1vEUlE2xzd5yrfuomhTFfGNe3fYm/CEhV/xx2zd
	pyJyXo1Esdk3+Al7ow09xLZjF2WQCUczPHUKnZre+B15TeARu8JwTQ==
X-Google-Smtp-Source: AGHT+IEmky7QdW0XPdHOi9QKSyqguYVdEl1Cs0e8F/bsOgGuHfphpW56d1/l8duOACJXebBDlLQDZQ==
X-Received: by 2002:a05:600c:35cf:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43f3a9ab0f2mr19660595e9.23.1744380221383;
        Fri, 11 Apr 2025 07:03:41 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c81f6sm83339045e9.20.2025.04.11.07.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:03:40 -0700 (PDT)
Date: Fri, 11 Apr 2025 16:03:38 +0200
From: Petr Mladek <pmladek@suse.com>
To: carlos.bilbao@kernel.org
Cc: tglx@linutronix.de, bilbao@vt.edu, akpm@linux-foundation.org,
	jan.glauber@gmail.com, jani.nikula@intel.com,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	takakura@valinux.co.jp, john.ogness@linutronix.de,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 1/2] panic: Allow archs to reduce CPU consumption after
 panic
Message-ID: <Z_khOuvPGEWBAQbp@pathway.suse.cz>
References: <20250326151204.67898-1-carlos.bilbao@kernel.org>
 <20250326151204.67898-2-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326151204.67898-2-carlos.bilbao@kernel.org>

Added Linus and Jiri (tty) into Cc.

On Wed 2025-03-26 10:12:03, carlos.bilbao@kernel.org wrote:
> From: Carlos Bilbao <carlos.bilbao@kernel.org>
> 
> After handling a panic, the kernel enters a busy-wait loop, unnecessarily
> consuming CPU and potentially impacting other workloads including other
> guest VMs in the case of virtualized setups.
> 
> Introduce cpu_halt_after_panic(), a weak function that archs can override
> for a more efficient halt of CPU work. By default, it preserves the
> pre-existing behavior of delay.
>
> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
> Reviewed-by: Jan Glauber (DigitalOcean) <jan.glauber@gmail.com>
> ---
>  kernel/panic.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/panic.c b/kernel/panic.c
> index fbc59b3b64d0..fafe3fa22533 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -276,6 +276,16 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
>  		crash_smp_send_stop();
>  }
>  
> +/*
> + * Called after a kernel panic has been handled, at which stage halting
> + * the CPU can help reduce unnecessary CPU consumption. In the absence of
> + * arch-specific implementations, just delay
> + */
> +static void __weak cpu_halt_after_panic(void)
> +{
> +	mdelay(PANIC_TIMER_STEP);
> +}
> +
>  /**
>   *	panic - halt the system
>   *	@fmt: The text string to print
> @@ -474,7 +484,7 @@ void panic(const char *fmt, ...)
>  			i += panic_blink(state ^= 1);
>  			i_next = i + 3600 / PANIC_BLINK_SPD;
>  		}
> -		mdelay(PANIC_TIMER_STEP);
> +		cpu_halt_after_panic();

The 2nd patch implements this functions using safe_halt().

IMHO, it makes perfect sense to halt a virtualized system or
a system without a registered "graphical" console.

I think that the blinking diods were designed for desktops
and laptops with some "graphical" terminal attached. The
infinite loop allows to read the last lines, ideally
the backtrace on the screen.

I wonder if we could make it more clever and do the halt
only when the system is virtualized or when there is no
"graphical" console registered.

One way to detect graphical console might a check of
the existence of the c->unblank callback, see console_unblank().
But I am not sure if it is good enough.

Best Regards,
Petr
