Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6BB20B80C
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747504475; cv=none; b=UlxyJ6zwsrL9MOXGmWhgub3ooBps2B3Sq6p2EsILX2DVFo2W95RmjoJgRIE8Kh8fnCtjdsSfddpdhb3J3vqi4RLXGPJbemc4W9HE4y8jsmbTXYCuwb2eNFiUVOqGuPurAqaStHVRFKr84Sy8gbTjeB5EPjImxyaHkXlZjiB2rf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747504475; c=relaxed/simple;
	bh=98QB6jx10oLzQSjZMn9OoPWii3+DhKR5HIfsHznnVIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g77Bea8ZaFf17RuOQ/8eMzSZcHQ8b65o3/mtx+8IOW1KwpPAzFLMA7kUsLgqkvRXBnioXbvLd3xTbFjga38KPXOnkxaPiwmWEDdBhr/b16OJgXbQATu3v7HPy+e3E2kZXSv+oPMmedgfP9ts/UKx20e0dX7pqLG6KtjFb/CefoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com; spf=pass smtp.mailfrom=manifault.com; dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b=Ww++qYAT; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manifault.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b="Ww++qYAT"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f8c0c8da93so19293756d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=manifault-com.20230601.gappssmtp.com; s=20230601; t=1747504471; x=1748109271; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUlqFygE+MGINVaY2EyOGLtIb5yHMCDfEEc4yGF9VDo=;
        b=Ww++qYATo7xng9+AQkTKcP9DOnGMeE9/4F6DnA0TPrJCraPeAvDZ7rd63D295jl/SP
         Y+r21fCyHgNHKivAkejVP9TX0NMV3QOF9qtbTe6xfVHLMIDpZ9YZTw1FeC87EOY5Ztk5
         ivXabGeTGlundC09wBxjTcPn7gvr36kCHe1vOghFlwIefkLwl1SdlJ5rCDLH9xfXgLnp
         bGQhgZWYYU7l+usouthZ8a8ZzajXXSFObQaJrq9gXrOijubLIpqA6yYwoJrHH4lJPb+2
         SrspLn2Vqx6TzFCM+G2+4DALnKNp0j0PePP44KA7vziDHufcu44gYS7iZGezEJZhArd6
         TnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747504471; x=1748109271;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUlqFygE+MGINVaY2EyOGLtIb5yHMCDfEEc4yGF9VDo=;
        b=Uk2Hm1znwvEzKlTK8WSJPME5cMWaCaEWPfc3R7j4e7D6kOgistZjp3RG5yRI7rzoJU
         tFR6SKf9Xtej/Z9rbA3yvw6D0FPZhLs/67hKJ5WeuBIVnp2L/8NnIenbK7PIQVbcIkny
         K8Nv98qINt1/ZMr/OX5nEkIpo4ps8oyIeKLzUbynrEuXu7NXtfVWKNbM4DYPWYQNR8hf
         VaY81ILqLBlAVV3Ey+fY9DmjmV02Ay7NW3bGMINTkY4nN1jX1PpIHFSnsD7Za9glCrIC
         ky4fFXXZYgMqg0UOCOvLMwPdIoibe+G2Zch32e1WrHwKEbk+mI4LTQOIJsQPByE+ESxM
         /k1w==
X-Forwarded-Encrypted: i=1; AJvYcCUjhIsttwu0M6F0h9ezNaPL7Ka/EwcXqQP6dq8dHZC2k7mnHyltK/jBcnSDop3Y2H4AQWIU33Y0oWQYEEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtBnuTGofm2dhGzDPnGhmbmYwnEZIzVF+Oh1IV6+6anVlQsQVg
	K/Hxisbu/IegHWj29YqWAdjNFD6MWeq7TeAdYHydZTQlZPdN0xJaWV/Iyrmn6PNH7aT8
X-Gm-Gg: ASbGncv0et1AwRVzDJhL+MtOrA3vCrne4C5Y+ShXyTcK9sEGy2b5h0Fc9thewnd/c+3
	kGEGzc3Wy1Z9atQ4P9vKFFnIzSNCsrRlcPyhVc5+0OkOSeQINgJAsVjj08dXTjkmEcrStCnCPRz
	F81ZjCnsvJcDZu4c1fXxOCkerxlS8HI0eWgzSIHcCsIZhTA8yImdFvRsD+kCUqk5dmwbiYBs+SC
	DdQ+/e9AzrwANiMqmJzz1h58BqtUK5LFh9++KpIhRTX7yZB1dCftuM0kpNJRQvMs7liqygbf3DZ
	bRm3qMRWuPgnCVYtXs6E9H7hVry0U16vhxHR6knhTO4NcFEnmVF9+ueYU/GfgA9NSHA9ng==
X-Google-Smtp-Source: AGHT+IGatFBVgm7Oj1P8MfwcgsCGZneUVj74kLKF6Gvl/pM/BDL0TZc4ed8XV7jkyueCbP2WTlkuYw==
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id 6a1803df08f44-6f8b085299cmr128506326d6.33.1747504470926;
        Sat, 17 May 2025 10:54:30 -0700 (PDT)
Received: from localhost (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b0965b7asm28230296d6.80.2025.05.17.10.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 10:54:30 -0700 (PDT)
Date: Sat, 17 May 2025 12:54:29 -0500
From: David Vernet <void@manifault.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
Message-ID: <wdjlm556njybe4bgxk277xj4skryh2qnvd57yoenyf33vd4oyh@gz3ouesvc5vf>
References: <20250515191716.327518-1-arighi@nvidia.com>
 <20250515191716.327518-4-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mxcpfuoti6kzdpwp"
Content-Disposition: inline
In-Reply-To: <20250515191716.327518-4-arighi@nvidia.com>
User-Agent: NeoMutt/20250404-dirty


--mxcpfuoti6kzdpwp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
MIME-Version: 1.0

On Thu, May 15, 2025 at 09:11:44PM +0200, Andrea Righi wrote:
> Allow scx_bpf_select_cpu_and() to be used from an unlocked context, in
> addition to ops.enqueue() or ops.select_cpu().
>=20
> This enables schedulers, including user-space ones, to implement a
> consistent idle CPU selection policy and helps reduce code duplication.
>=20
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Hey Andrea,

Nice, this looks correct and reasonable to me. Just left one suggestion bel=
ow
that I'd be curious to hear your thoughts on.

> ---
>  kernel/sched/ext_idle.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)
>=20
> diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> index 716863f1f8cee..37279a09900ca 100644
> --- a/kernel/sched/ext_idle.c
> +++ b/kernel/sched/ext_idle.c
> @@ -922,9 +922,10 @@ __bpf_kfunc s32 scx_bpf_select_cpu_dfl(struct task_s=
truct *p, s32 prev_cpu,
>   * @cpus_allowed: cpumask of allowed CPUs
>   * @flags: %SCX_PICK_IDLE* flags
>   *
> - * Can only be called from ops.select_cpu() or ops.enqueue() if the
> - * built-in CPU selection is enabled: ops.update_idle() is missing or
> - * %SCX_OPS_KEEP_BUILTIN_IDLE is set.
> + * Can be called from ops.select_cpu(), ops.enqueue(), or from an unlock=
ed
> + * context such as a BPF test_run() call, as long as built-in CPU select=
ion
> + * is enabled: ops.update_idle() is missing or %SCX_OPS_KEEP_BUILTIN_IDLE
> + * is set.
>   *
>   * @p, @prev_cpu and @wake_flags match ops.select_cpu().
>   *
> @@ -936,6 +937,7 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_st=
ruct *p, s32 prev_cpu, u64
>  				       const struct cpumask *cpus_allowed, u64 flags)
>  {
>  	struct rq *rq;
> +	struct rq_flags rf;
>  	s32 cpu;
> =20
>  	if (!kf_cpu_valid(prev_cpu, NULL))
> @@ -944,15 +946,26 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_=
struct *p, s32 prev_cpu, u64
>  	if (!check_builtin_idle_enabled())
>  		return -EBUSY;
> =20
> -	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> -		return -EPERM;
> +	/*
> +	 * If called from an unlocked context, acquire the task's rq lock,
> +	 * so that we can safely access p->cpus_ptr and p->nr_cpus_allowed.
> +	 *
> +	 * Otherwise, allow to use this kfunc only from ops.select_cpu()
> +	 * and ops.select_enqueue().
> +	 */
> +	if (scx_kf_allowed_if_unlocked()) {
> +		rq =3D task_rq_lock(p, &rf);
> +	} else {
> +		if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> +			return -EPERM;
> +		rq =3D scx_locked_rq();
> +	}
> =20
>  	/*
>  	 * Validate locking correctness to access p->cpus_ptr and
>  	 * p->nr_cpus_allowed: if we're holding an rq lock, we're safe;
>  	 * otherwise, assert that p->pi_lock is held.
>  	 */
> -	rq =3D scx_locked_rq();
>  	if (!rq)
>  		lockdep_assert_held(&p->pi_lock);
> =20
> @@ -966,13 +979,17 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_=
struct *p, s32 prev_cpu, u64
>  	if (p->nr_cpus_allowed =3D=3D 1) {
>  		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
>  		    scx_idle_test_and_clear_cpu(prev_cpu))
> -			return prev_cpu;
> -		return -EBUSY;
> +			cpu =3D prev_cpu;
> +		else
> +			cpu =3D -EBUSY;
> +	} else {
> +		cpu =3D scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flag=
s);

I wonder if we should just bring this into scx_select_cpu_dfl()? It seems l=
ike
it would makes sense to do this optimization whether we're looking at
cpus_allowed here, or p->cpus_ptr in scx_select_cpu_dfl(). I seem to recall=
 us
having this in there before so there may be a reason we removed it, but I've
been out of the game for a while so I'm not sure.

Anyways, if we could do this, then we could bring both scx_bpf_select_cpu_a=
nd()
and scx_select_cpu_dfl() into the scx_kfunc_ids_idle kfunc group and remove
scx_kfunc_ids_select_cpu.

What do you think?

Thanks,
David

--mxcpfuoti6kzdpwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCaCjNVQAKCRBZ5LhpZcTz
ZD3eAP4gHrae5D5JP/8bsjJEGFJFdTVxcDyG3m1WSe3ri+4W1wEAgco04Wj9zQj8
dgg8Meu5nftccBOWukt+MY+wlACKdw8=
=YrL5
-----END PGP SIGNATURE-----

--mxcpfuoti6kzdpwp--
