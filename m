Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2337280A29
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547631; cv=none; b=c+BONKsRwahGzuK1J/2rSUGwOZu7Vvt8qzBpKonxviFZ8KYa91+kzOjfomzRN7PW8LtOwn4EdHR26qKxOzxJR54tZ2qeAJpp+pkFkA4G8fPdRdLwufWmfKp94+HgZRMh5GONsgDKaJOTA9SXT818otiCd4Aukv15UY9zXHcQRNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547631; c=relaxed/simple;
	bh=zS+Ot369NOytTIYKYVR0UEWEYha70OWsfEk07mgYWN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlBpYA+16QyBH1tttQD+u7JoU3pYkaxCNB4LIPdTmoinHJaxIyo4QrwiBk67komHH6RUldy2Fa4D/cHqq6Xa/XWUC0BBUhs3X5oAGAwiPS48wqPvbGv0iG8yqKyNI/t8Obml+z16XU8w3MXEqOqH27W7gbGtPPvhs6wl26qiI2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEj6fCgO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEj6fCgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F87C4CEE4;
	Tue,  6 May 2025 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746547631;
	bh=zS+Ot369NOytTIYKYVR0UEWEYha70OWsfEk07mgYWN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NEj6fCgOm1vX9hV9mYqnRQ6ZUy/n/Bqy7hW7QR6PsXgWEQ95GaoS0yTChJkV2io2X
	 nKr2Qhzv0A5RA5viaNm0aBnIsodd3fa8VjOx2JZcpvC0IzIh5kd9D11xEAJqCzFgZ+
	 wfxavSHCzag2MPXfoIoN1ZAOM23aAhrhqiEyziqusdunCNDz/CAXwg7/xfCQV7Tk7V
	 oK2bRRfSVWiDgBMs3ooYtJFJsH4yymfIaUjlfDJnyVzo/+rrAt8QbGNtHxmjVfFGMy
	 txwRm+9YoRom4UwOBH6HBwgcPtyUWIPbYpaOh9LieWN5oG3tN6lchVIKbOttlEZzwP
	 WAJXVVZN31n1Q==
Date: Tue, 6 May 2025 18:07:08 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 2/5] timers: Add the available mask in timer migration
Message-ID: <aBozrJ0C6yzW7oB_@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
 <20250506091534.42117-9-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506091534.42117-9-gmonaco@redhat.com>

Le Tue, May 06, 2025 at 11:15:37AM +0200, Gabriele Monaco a écrit :
> Keep track of the CPUs available for timer migration in a cpumask. This
> prepares the ground to generalise the concept of unavailable CPUs.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>  kernel/time/timer_migration.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
> index 7efd897c7959..25439f961ccf 100644
> --- a/kernel/time/timer_migration.c
> +++ b/kernel/time/timer_migration.c
> @@ -422,6 +422,9 @@ static unsigned int tmigr_crossnode_level __read_mostly;
>  
>  static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
>  
> +/* CPUs available for timer migration */
> +static cpumask_var_t tmigr_available_cpumask;
> +
>  #define TMIGR_NONE	0xFF
>  #define BIT_CNT		8
>  
> @@ -1449,6 +1452,7 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
>  	raw_spin_lock_irq(&tmc->lock);
>  	tmc->available = false;
>  	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
> +	cpumask_clear_cpu(cpu, tmigr_available_cpumask);
>  
>  	/*
>  	 * CPU has to handle the local events on his own, when on the way to
> @@ -1459,7 +1463,7 @@ static int tmigr_cpu_unavailable(unsigned int cpu)
>  	raw_spin_unlock_irq(&tmc->lock);
>  
>  	if (firstexp != KTIME_MAX) {
> -		migrator = cpumask_any_but(cpu_online_mask, cpu);
> +		migrator = cpumask_any(tmigr_available_cpumask);

Considering nohz_full CPUs should be still available.

I don't think there is anything ensuring that, in nohz_full mode,
there must be at least one housekeeping CPU that is not domain
isolated.

For example if we have two CPUs with CPU 0 being domain isolated
and CPU 1 being nohz_full, then there is no migrator to handle CPU 1's
global timers.

Thanks.

>  		work_on_cpu(migrator, tmigr_trigger_active, NULL);
>  	}

-- 
Frederic Weisbecker
SUSE Labs
