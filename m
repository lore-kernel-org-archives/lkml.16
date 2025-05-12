Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414524EABF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747069114; cv=none; b=jOgZz8NFH12LEDVQiX54Z9PUgEvFpiApjwlpb8seYvD2TyATN1RvFpVBCuvRrhtfwWzuUMOSPj5iwQxLNMcHW6dtcSR2k2ve2ssiFnBOCZj5ksxJPHUPz3M5Yn0I54HBX/5nj+rh3LJWpYjKWYHJ+nz6Q0HaSQj4h7MlB9I4y/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747069114; c=relaxed/simple;
	bh=i8q8kM0p5d1UpApcOtaLV9muc7KIycSXnVuollgBWOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1eRVL1diS6DGidjVmRDBm/zAnLwgb64FCASJ+9XaNHVxPqHBMelyaHFo8AYvohHAs2O3Z1xri3TKEf/wNzTeYHQ43Ifk4XgMUvrKRcT2J2raZqy+inxDXCS/Ey2yAJMBZNgvWfmgUiyAPF2w1N7OWrnWt/Awp7Uufd3IFJ5/ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com; spf=pass smtp.mailfrom=manifault.com; dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b=NEH5fmlM; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manifault.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b="NEH5fmlM"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4766cb762b6so54224841cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=manifault-com.20230601.gappssmtp.com; s=20230601; t=1747069111; x=1747673911; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocor+59mt/IAy8HEqt/0Z2Sz311NpY0ypp2t4nPjEfI=;
        b=NEH5fmlMt6jJSf0vNhICDvthZnVzVl94unKkTq7/spRUbs+9u/09RcIi4pV8aOTO6H
         7bMI7V4e0TyoP58U6r/YU6H90MPqgWBHCyHdcB1EeHVTOwW6EneZTaUGQOON08AZKYsC
         XbWDaiC1YJuWrL0w55qGV79bDv8AIBBamwfm5+3kp+AAc8GwDoiVta4kcxOpw2b7ShYz
         AnkYYNdtPjd2gzhDhIZtsHwpSDE0oRYb4p1WHd6msWR39BzXkEAJKzj8ar2vQZUfJ1Tn
         oeUQqM6xyiBGpTX/W1aIbfqBEmr4t82FCdf7ucwUumgTIiwas+KXzteS2cv8tGflMHsT
         RHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747069111; x=1747673911;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ocor+59mt/IAy8HEqt/0Z2Sz311NpY0ypp2t4nPjEfI=;
        b=Q2Ppxec6zFiwNTCD2X914E+f2RjBwCaHff8pJTUkQeUzJbgufgCeX3sXfkeZ78Bnbf
         W8zB1UiCCHJAp3cd9dXIQ6xG1U+DICC+0FdbMOXhdjMwNajmf9MZX3FKTERDjr5g4Fe1
         meSITNEnIGCkKtL6cpy1CgJbnRsqrE0JNGjayNfd+b2ocHflg2efkHXUGVicVEl1Vmrt
         Qcm8FLwX7cPa9WKHfLxVhJtQvjBjYO6spnF8spvXaAwIBqMJDWazWRC0TGlxb/2/6JrT
         KDXojPVMf3gP7oBUwM1MtaWcVRKAEjFl+935aqerxpn5L8cGALlaY6KTcu5j6yQ2v/Rf
         1Nzg==
X-Forwarded-Encrypted: i=1; AJvYcCXEVuFYMOBZSaBm4XXD/v+ffOmC8mqo3iPIbXoIH48b0T+Wx2Y79l9ueWiZ3vOaRJxmreekrFIu81C/s4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2DaC8ndkhbhrM/gEsXAQbTvYSY/pmBMH6m0iqxNcfRBKF3OD
	7Dmseiz62/I66/hDpgrAjUF8fdqp/oFuci2BYfLMKBI2l3RADeqOQA/JtnqrEpMA
X-Gm-Gg: ASbGncvjAPEpWFWOINz/ZeXBOnTbf1XRYZl7+lVaT5QvWDB/c6twIY1pe434vyfw89d
	kM2kVAj8Wrx/JFBebPYw34n7r/3E/Fk+YBCaPwBzurMZFln2MTZ1wEcO1n3fBSNEzMCX2pGHcPF
	NizXWD7s3xo99i9GdaA3C0WdR++M6b/XjZcnqK4iAAKbxqrJpL5WOIqwTPpaZ+7dcKOCSWjVB8g
	A3laH04+daWlzn4hOSw42zKG+vcnuYjvf7IcVr4691FJrgmqVnDLTDsUh8o+VYLOFyeoz1WkUD3
	DUB/+z3t+p5+4LxQ3lq3tn9aKLHg6apvoa5ii0vgNYPhaKVDaYix0OFgQ5pNX6/cceMQcg==
X-Google-Smtp-Source: AGHT+IE2iERXu2oE5ANEycnDrf2+QMTlqVyGLZYawg7Q+8SRfRDxBS/4q1S+Qjs3BI+VE+Lw8ptlKQ==
X-Received: by 2002:a05:622a:552:b0:476:8edf:8122 with SMTP id d75a77b69052e-49487376d1bmr2674481cf.15.1747069110765;
        Mon, 12 May 2025 09:58:30 -0700 (PDT)
Received: from localhost (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4945248a915sm53097251cf.28.2025.05.12.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:58:30 -0700 (PDT)
Date: Mon, 12 May 2025 11:58:29 -0500
From: David Vernet <void@manifault.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
Message-ID: <bylpnof6h3mmeaovba573fer4ikrr5zhr53htbso6zzuw5czzj@tihl7ajm4eaj>
References: <20250512151743.42988-1-arighi@nvidia.com>
 <20250512151743.42988-3-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrrxxgz6rl4xipc6"
Content-Disposition: inline
In-Reply-To: <20250512151743.42988-3-arighi@nvidia.com>
User-Agent: NeoMutt/20250404-dirty


--lrrxxgz6rl4xipc6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] sched_ext/idle: Make scx_bpf_select_cpu_and() usable
 from any context
MIME-Version: 1.0

On Mon, May 12, 2025 at 05:14:56PM +0200, Andrea Righi wrote:
> Allow scx_bpf_select_cpu_and() to be used from any context, not just
> from ops.enqueue() or ops.select_cpu().
>=20
> This enables schedulers, including user-space ones, to implement a
> consistent idle CPU selection policy and helps reduce code duplication.
>=20
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Hi Andrea,

> ---
>  kernel/sched/ext_idle.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> index 6915685cd3d6b..5373132db02b6 100644
> --- a/kernel/sched/ext_idle.c
> +++ b/kernel/sched/ext_idle.c
> @@ -943,10 +943,15 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_=
struct *p, s32 prev_cpu, u64

FYI it looks like there are a few comments sprinkled around here that speci=
fy
that only the .select_cpu() and .enqueue() ops are allowed.

>  	if (!check_builtin_idle_enabled())
>  		return -EBUSY;
> =20
> -	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> -		return -EPERM;
> -
>  #ifdef CONFIG_SMP
> +	/*
> +	 * If called from an unlocked context, try to acquire
> +	 * cpus_read_lock() to avoid races with CPU hotplug.
> +	 */
> +	if (scx_kf_allowed_if_unlocked())
> +		if (!cpus_read_trylock())
> +			return -EBUSY;

Hmm, so this now assumes that this function can be called without the rq lo=
ck
held. I'm not sure if that's safe, as scx_select_cpu_dfl() queries p->cpus_=
ptr,
which is protected by the rq lock. Additionally, scx_bpf_select_cpu_and()
checks p->nr_cpus_allowed which is protected sometimes by pi_lock, sometime=
s by
the rq lock, etc depending on its state.

This might be fine in practice as I _think_ the only unsafe thing would be =
if
p->cpus_ptr could have a torn read or write. scx_select_cpu_dfl() does do
preempt_disable() so no issues in querying the per-cpu variables there.

As long as this is safe (or can be made safe) I don't have a strong opinion=
 one
way or the other. I think it's probably a good idea to allow users to remove
code duplication, and in general it's up to the user to use this API correc=
tly
(e.g. if you're preempted during a call to scx_bpf_select_cpu_and() and
prev_cpu changes out from under you due to the task being migrated, that's
likely just a bug in the scheduler).

Thanks,
David

>  	/*
>  	 * This may also be called from ops.enqueue(), so we need to handle
>  	 * per-CPU tasks as well. For these tasks, we can skip all idle CPU
> @@ -956,10 +961,16 @@ __bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_=
struct *p, s32 prev_cpu, u64
>  	if (p->nr_cpus_allowed =3D=3D 1) {
>  		if (cpumask_test_cpu(prev_cpu, cpus_allowed) &&
>  		    scx_idle_test_and_clear_cpu(prev_cpu))
> -			return prev_cpu;
> -		return -EBUSY;
> +			cpu =3D prev_cpu;
> +		else
> +			cpu =3D -EBUSY;
> +		goto out_unlock;
>  	}
>  	cpu =3D scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags=
);
> +
> +out_unlock:
> +	if (scx_kf_allowed_if_unlocked())
> +		cpus_read_unlock();
>  #else
>  	cpu =3D -EBUSY;
>  #endif
> @@ -1266,6 +1277,7 @@ BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu_node, KF_R=
CU)
>  BTF_ID_FLAGS(func, scx_bpf_pick_idle_cpu, KF_RCU)
>  BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu_node, KF_RCU)
>  BTF_ID_FLAGS(func, scx_bpf_pick_any_cpu, KF_RCU)
> +BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
>  BTF_KFUNCS_END(scx_kfunc_ids_idle)
> =20
>  static const struct btf_kfunc_id_set scx_kfunc_set_idle =3D {
> @@ -1275,7 +1287,6 @@ static const struct btf_kfunc_id_set scx_kfunc_set_=
idle =3D {
> =20
>  BTF_KFUNCS_START(scx_kfunc_ids_select_cpu)
>  BTF_ID_FLAGS(func, scx_bpf_select_cpu_dfl, KF_RCU)
> -BTF_ID_FLAGS(func, scx_bpf_select_cpu_and, KF_RCU)
>  BTF_KFUNCS_END(scx_kfunc_ids_select_cpu)
> =20
>  static const struct btf_kfunc_id_set scx_kfunc_set_select_cpu =3D {
> --=20
> 2.49.0
>=20

--lrrxxgz6rl4xipc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCaCIotAAKCRBZ5LhpZcTz
ZLayAQCNzwhP3LV8KTvp53+FL3lSh33/NaBXudHNw87XyyYmFwD+P9JqXilg5XIU
hrCPEUBzFa4pUPnpEAIa2mVs5gOhpQY=
=bxfg
-----END PGP SIGNATURE-----

--lrrxxgz6rl4xipc6--
