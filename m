Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071BC372
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833625; cv=none; b=gJ45EuDdttX81PFcXtG77GNEWnv5XS8beAcGj91EtrAns1VaqrWxFTENL2hset7Dl2qIVc3gilnKw7zOVmR9/MH1UJHOJy4AyhnLyZ1NVaD+m3CpPsL/ZxhifcAeLCGKPJsLNXiLbkvVBtS2FiMrj3MQ9KRFI2rj3KLPNIDk8o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833625; c=relaxed/simple;
	bh=of+RfkyUwUWB1N7PLvaD8Hi+cZYOEmZpwBeNPbXpgqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RHKwDAeh4RhyMhwicYtWTCrafk8v+D6REhs1ZxKMPnad6bh+om/LpftGub0JMD7ihpGkSSohK2gNj+vzcYF/OMKkv9r6NWcGx5/KDF5RJEc/EnAK54Xejh13vb29snx6f4nOoMoe09rHQR7TDPsjynnqr0/OgjlEduskHrtYZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=orYpH9ZB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J/N8+M7I; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="orYpH9ZB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J/N8+M7I"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749833622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA8riBJ4L+Yt6U8k+OhYniJyX6AVY098DQeeteAuS0I=;
	b=orYpH9ZBvaL1mER9+h8JZnggsG7WQz6Qe8H3r4QAr+Zq2rgpJulsh5gZldvuZzThi/LapO
	b519Xnhjq+bcPiF1jrJWFc0z4IYBTFecpFBObttRRiE+MmQCllD7mwVZ9Vgeixj+GVGNr5
	ybhTekXC5ote7dfjXeQNMZMBi7fwHiu/C1UNfn29rlxsmeJdGBMW9BBE0AbrpwcUaTNG/1
	OiaE/zVAg0WwStR3rIu9EK6NHq8zK7xWjgkDBGEo3kbcwtWyjBJaWQ2qR+6e5LgDwVW3b8
	dUDVqo/AzrXqvq2bM20kJEAskVIMCt35thCqpTPIeZDO6jV7L8JgUqPaTOvqTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749833622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pA8riBJ4L+Yt6U8k+OhYniJyX6AVY098DQeeteAuS0I=;
	b=J/N8+M7IocoFkop/kYDdfvQOiJSkwcyYFX5YAnLLdxbRChdEdTGsNTOqkuVbG+axl0HK6G
	rsdE4gsixUGGb4Dw==
To: Liya Huang <1425075683@qq.com>, linux-kernel@vger.kernel.org
Cc: Liya Huang <1425075683@qq.com>
Subject: Re: [PATCH] posix-timers: omit posix_cpu_timers_init_group when
 CONFIG_POSIX_TIMERS is disabled
In-Reply-To: <tencent_92F5880EDEB07D078301A561B64F06F9AC0A@qq.com>
References: <tencent_92F5880EDEB07D078301A561B64F06F9AC0A@qq.com>
Date: Fri, 13 Jun 2025 18:53:36 +0200
Message-ID: <87y0tvpoq7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 07 2025 at 19:41, Liya Huang wrote:
>     When POSIX timers are disabled (CONFIG_POSIX_TIMERS=3Dn), the helper
>     function posix_cpu_timers_init_group() is effectively a no-op=E2=80=
=94but it
>     still consumes valuable code space. To avoid generating an empty stub,
>     we should conditionally compile this function out entirely when POSIX
>     timers support is turned off.

I have no idea what you are trying to say here. See below.

> This logic was originally introduced in commit b18b6a9cef7f ("timers:
>     Omit POSIX timer stuff from task_struct when disabled"), but was
>     dropped in commit 244d49e30653 ("posix-cpu-timers: Move state tracking
>      to struct posix_cputimers")

Can you please format your change logs properly as everybody else
does? These indents provide zero value.

> ---
> Signed-off-by: Liya Huang <1425075683@qq.com>
> ---
>  kernel/fork.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 168681fc4b25a9fddcb90ce155c027551455f4ee..9632e863c17b44424fadc40b2=
445034ec5cd20d6 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1883,6 +1883,7 @@ void __cleanup_sighand(struct sighand_struct *sigha=
nd)
>  	}
>  }
>=20=20
> +#ifdef CONFIG_POSIX_TIMERS
>  /*
>   * Initialize POSIX timer handling for a thread group.
>   */
> @@ -1894,6 +1895,9 @@ static void posix_cpu_timers_init_group(struct sign=
al_struct *sig)
>  	cpu_limit =3D READ_ONCE(sig->rlim[RLIMIT_CPU].rlim_cur);
>  	posix_cputimers_group_init(pct, cpu_limit);
>  }
> +#else
> +static inline void posix_cpu_timers_init_group(struct signal_struct *sig=
) { }
> +#endif

If CONFIG_POSIX_TIMERS=3Dn then posix_cputimers_group_init() is an empty
inline function and the compiler optimizes posix_cpu_timers_init_group()
away completely. If it does not, then the compiler wants to be fixed.

And no, we are not adding ugly ifdeffery just because.

Thanks,

        tglx
