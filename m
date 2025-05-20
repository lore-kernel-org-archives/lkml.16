Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0CE2417F0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754670; cv=none; b=RfUqA/TFSmBNBcfGiqCq5d9TPYr58CHWCJD2iWmbb9VJu8PIkbtzuiIWJbCQ1giHsHk6myn9WalLM2umF1hsmst/EdowUp2dOE38cb5yoAVm3wuCv2UjsxMO0VOzWyIgEMPgNkjebWu/ZByFZK80x7ER5BQss2yJhcGKnTnv75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754670; c=relaxed/simple;
	bh=f0MpGbHeYx1NDD6wBepKitb5c9aZCB95bTd81EugfAc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qHeP6gM5DTWXT53JBcWG3aU7z8v75a83+zgkKPbZAjMN+gR4bqQKDrZ3HxDpm6X/IFyMkzQs+PhC+cKGatAxJKqJD5hBHpkgJdvFhw/HxIIvu+9aw2fV2NvMYBq3qqIz1REhBoak1cyQetoKjLgIMKY+S6gh6N4pJ0uQcVQxpy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yiq5FD8O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yiq5FD8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747754667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Mu98gf3Jl/zQTd9OBHRRLq1ew4Yr13gaRyYVNVUQ82U=;
	b=Yiq5FD8OxdsLigJjwNGBUGVBhvlgaCshT7m9PTJR5c7NkbFBvC3qiMXv9+1ZWmsBCpxgcR
	sbFwqnW73WTW5yDzu1QM3kxdx/k3kTnoWiu+eWNLoWhWLI7AIOlAe+6dOcYqzecIqsaCqP
	Z2ANBPJpp/9nwNAuIXfWAwHeQdLhjdg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-FJZOttIgOeuxD7I1K5d9aQ-1; Tue, 20 May 2025 11:24:26 -0400
X-MC-Unique: FJZOttIgOeuxD7I1K5d9aQ-1
X-Mimecast-MFC-AGG-ID: FJZOttIgOeuxD7I1K5d9aQ_1747754665
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c122fa56so28294465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754665; x=1748359465;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu98gf3Jl/zQTd9OBHRRLq1ew4Yr13gaRyYVNVUQ82U=;
        b=GArcGhsBU+OlARMgdwQgMoRdKGg14vdH73XX59R9IS+0YE9VT80XSeRBKgfZ7/Rfi6
         fZLFKoqm2isT6p1aetkv55Rdr7fAm+/ZX69bsmk5Jcoen4RflOhGX072Sdn0OthgBJK+
         25orKK1+GzVi/2Q4VrYyvfsEG20+vl8OgAsjo2ZpXC19/Uap0mroLXAzCuyaTzSi/EQP
         9MrNjaFJsqJIVAO13Hmeol6YVT2wTb6Ji7Uf/akmZaSBXpwmujZQWyNwQD51o//4zMmq
         5fHhPUBkgSkmQrmDa83QmvsiV0r1Ipi7ZZt1nGYzRBJ5Sl0fEJzE5TXeitHTlmsePyZp
         dqiw==
X-Gm-Message-State: AOJu0YwVO78URTueLs1HD0FWXfnG7S7xetY2jYft43TM5BaQyje49SHC
	ZZQu1Q5fZWD0Ex1KHHQtcT0Uzf04lk1DUSQBuw/JG1FRxJtz/RdHy5+q8R38o5ce6RcwSwoS42i
	a6do/+uLHoCJ0nVEFCqNxk19D7dPkZDtgzXImZdBjHng0/Jvw8zPKk9QkCOYnywuKZwaVjKNKLx
	OW
X-Gm-Gg: ASbGnctfekhfm0IsvS71N76qC+flHab59BI9ZqTGrQb4isd5VscDk4ILp0+HwNhoFcl
	yk5HuvFt4tHc6REb1QUIQuJaWeD5XWj083Ati3Uj7Br3Hi/19GIJfqKZqGM/otVaoflYX7rr5LF
	XUizq2kf0E4siJ5vre9rQ5cu32woI/pt8tE1fHljwhpkazt3xaCfswNVLelZoJ2YPC3D1Vl1vtq
	WsmmR+itx9fuB5qYcHW7pt6OfmOtMf2gzZEdCC73cdhkKG6q8cZZFKqzkXMpJa0stEPlqgusubg
	X4Hy9OCIwmrxV68dOSGRIv+LGcqzXAJ+2wfGWA==
X-Received: by 2002:a05:600c:c13:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-442fd627416mr163611685e9.14.1747754664843;
        Tue, 20 May 2025 08:24:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFiijNDiL4vFMPRretgaxAz9fWfg/hsvAlE0akx/D8RUzLNfLlG5TcDgmHaznHR4BEm4KjVg==
X-Received: by 2002:a05:600c:c13:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-442fd627416mr163611355e9.14.1747754664302;
        Tue, 20 May 2025 08:24:24 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm33712185e9.27.2025.05.20.08.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:23 -0700 (PDT)
Message-ID: <da1865ac15e46469e9b4bcf1933edb3959755885.camel@redhat.com>
Subject: Re: [PATCH v5 5/6] cgroup/cpuset: Fail if isolated and nohz_full
 don't leave any housekeeping
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Waiman Long <longman@redhat.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Date: Tue, 20 May 2025 17:24:22 +0200
In-Reply-To: <aCyRhAeGwLSVf2LZ@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
	 <20250508145319.97794-13-gmonaco@redhat.com>
	 <aCyRhAeGwLSVf2LZ@localhost.localdomain>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-05-20 at 16:28 +0200, Frederic Weisbecker wrote:
> (Please keep Anna-Maria Cc'ed)
>=20
> Le Thu, May 08, 2025 at 04:53:25PM +0200, Gabriele Monaco a =C3=A9crit :
> > Currently the user can set up isolated cpus via cpuset and
> > nohz_full in
> > such a way that leaves no housekeeping CPU (i.e. no CPU that is
> > neither
> > domain isolated nor nohz full). This can be a problem for other
> > subsystems (e.g. the timer wheel imgration).
> >=20
> > Prevent this configuration by blocking any assignation that would
> > cause
> > the union of domain isolated cpus and nohz_full to covers all CPUs.
> >=20
> > Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> > ---
> > =C2=A0kernel/cgroup/cpuset.c | 67
> > ++++++++++++++++++++++++++++++++++++++++--
> > =C2=A01 file changed, 65 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index 95316d39c282..2f1df6f5b988 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -80,6 +80,12 @@ static cpumask_var_t	subpartitions_cpus;
> > =C2=A0 */
> > =C2=A0static cpumask_var_t	isolated_cpus;
> > =C2=A0
> > +/*
> > + * Housekeeping CPUs for both HK_TYPE_DOMAIN and
> > HK_TYPE_KERNEL_NOISE
> > + */
> > +static cpumask_var_t	full_hk_cpus;
> > +static bool		have_boot_nohz_full;
>=20
> Do you really need to maintain those copies?
>=20

Yeah good point, I wanted to avoid allocating temporary masks but it's
probably better than maintaining those..

> > +
> > =C2=A0/*
> > =C2=A0 * Housekeeping (HK_TYPE_DOMAIN) CPUs at boot
> > =C2=A0 */
> > @@ -1253,10 +1259,26 @@ static void reset_partition_data(struct
> > cpuset *cs)
> > =C2=A0static void isolated_cpus_update(int old_prs, int new_prs, struct
> > cpumask *xcpus)
> > =C2=A0{
> > =C2=A0	WARN_ON_ONCE(old_prs =3D=3D new_prs);
> > -	if (new_prs =3D=3D PRS_ISOLATED)
> > +	if (new_prs =3D=3D PRS_ISOLATED) {
> > =C2=A0		cpumask_or(isolated_cpus, isolated_cpus, xcpus);
> > -	else
> > +		cpumask_andnot(full_hk_cpus, full_hk_cpus, xcpus);
> > +	} else {
> > =C2=A0		cpumask_andnot(isolated_cpus, isolated_cpus,
> > xcpus);
> > +		cpumask_or(full_hk_cpus, full_hk_cpus, xcpus);
> > +	}
> > +}
> > +
> > +/*
> > + * isolated_cpus_should_update - Returns if the isolated_cpus mask
> > needs update
> > + * @prs: new or old partition_root_state
> > + * @parent: parent cpuset
> > + * Return: true if isolated_cpus needs modification, false
> > otherwise
> > + */
> > +static bool isolated_cpus_should_update(int prs, struct cpuset
> > *parent)
> > +{
> > +	if (!parent)
> > +		parent =3D &top_cpuset;
> > +	return prs !=3D parent->partition_root_state;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/*
> > @@ -1323,6 +1345,25 @@ static bool partition_xcpus_del(int old_prs,
> > struct cpuset *parent,
> > =C2=A0	return isolcpus_updated;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * isolcpus_nohz_conflict - check for isolated & nohz_full
> > conflicts
> > + * @new_cpus: cpu mask
>=20
> The description lacks explanation about the role of this cpu mask.
>=20

Mmh yeah, that was a copy paste from prstate_housekeeping_conflict but
I agree, I should describe it better at least here..

> > + * Return: true if there is conflict, false otherwise
> > + *
> > + * If nohz_full is enabled and we have isolated CPUs, their
> > combination must
> > + * still leave housekeeping CPUs.
> > + */
> > +static bool isolcpus_nohz_conflict(struct cpumask *new_cpus)
> > +{
> > +	if (!have_boot_nohz_full)
> > +		return false;
> > +
> > +	if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
> > +		return true;
>=20
> Do we also need to make sure that in this weight there is an online
> CPU?
>=20
> Can you allocate a temporary mask here and do:
>=20
> cpumask_var_t full_hk_cpus;
> int ret;
>=20
> if (!zalloc_cpumask_var(&full_hk_cpus, GFP_KERNEL))
> =C2=A0=C2=A0=C2=A0 return true;
>=20
> cpumask_copy(full_hk_cpus,
> housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
> cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN));
> cpumask_and(full_hk_cpus, cpu_online_mask));
> if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
> =C2=A0=C2=A0=C2=A0 ret =3D true;
> else
> =C2=A0=C2=A0=C2=A0 ret =3D false;
>=20
> free_cpumask_var(full_hk_cpus);
>=20

Yeah that looks safer. I'll do with a mask.

> I also realize something, what makes sure that we don't offline the
> last
> non isolated?
>=20

Mmh, I guess we need to enforce that too then, I remember in some
condition the system was preventing me from doing that, but need to
play a bit more to understand what's going on...

> I just did a small test:
>=20
> # cd /sys/fs/cgroup/
> # echo +cpuset > cgroup.subtree_control
> # cat cpuset.cpus.effective=20
> 0-7
> # mkdir test
> # cd test
> # echo +cpuset > cgroup.subtree_control
> # echo 0-6 > cpuset.cpus
> # echo isolated > cpuset.cpus.partition
> # cat ../cpuset.cpus.effective=20
> 7
> # echo 0 > /sys/devices/system/cpu/cpu7/online
> [ 4590.864066] ------------[ cut here ]------------
> [ 4590.866469] WARNING: CPU: 7 PID: 50 at kernel/cgroup/cpuset.c:1906
> update_parent_effective_cpumask+0x770/0x8c0
> [ 4590.870023] Modules linked in:
> [ 4590.871058] CPU: 7 UID: 0 PID: 50 Comm: cpuhp/7 Not tainted
> 6.15.0-rc2-g996d9d202383 #10 PREEMPT(voluntary)=20
> [ 4590.873588] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
> [ 4590.875689] RIP: 0010:update_parent_effective_cpumask+0x770/0x8c0
> [ 4590.876858] Code: 06 48 8b 0c 24 ba 05 00 00 00 48 23 85 f8 00 00
> 00 41 0f 95 c6 48 89 01 41 8b 84 24 34 01 00 00 45 0f b6 f6 e9 90 fe
> ff ff 90 <0f> 0b 90e
> [ 4590.880010] RSP: 0018:ffffa4ce001ebd40 EFLAGS: 00010086
> [ 4590.880963] RAX: 00000000ffffffff RBX: 0000000000000000 RCX:
> 0000000000000001
> [ 4590.882342] RDX: 000000000000007f RSI: 0000000000000000 RDI:
> 0000000000000002
> [ 4590.883683] RBP: ffffffffbdf52f00 R08: 0000000000000000 R09:
> 0000000000000000
> [ 4590.885071] R10: ffffa223062d2388 R11: 0000000000000000 R12:
> ffffa223062d2200
> [ 4590.886604] R13: 0000000000000002 R14: 0000000000000001 R15:
> 0000000000000004
> [ 4590.888309] FS:=C2=A0 0000000000000000(0000) GS:ffffa223bc4d6000(0000)
> knlGS:0000000000000000
> [ 4590.890183] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 4590.891385] CR2: 000055ab80ada170 CR3: 00000001084ac000 CR4:
> 00000000000006f0
> [ 4590.892901] DR0: ffffffffbc8c8420 DR1: 0000000000000000 DR2:
> 0000000000000000
> [ 4590.894341] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
> 0000000000000600
> [ 4590.895765] Call Trace:
> [ 4590.896400]=C2=A0 <TASK>
> [ 4590.896938]=C2=A0 cpuset_update_active_cpus+0x680/0x730
> [ 4590.897979]=C2=A0 ? kvm_sched_clock_read+0x11/0x20
> [ 4590.898916]=C2=A0 ? sched_clock+0x10/0x30
> [ 4590.899785]=C2=A0 sched_cpu_deactivate+0x148/0x170
> [ 4590.900812]=C2=A0 ? __pfx_sched_cpu_deactivate+0x10/0x10
> [ 4590.901925]=C2=A0 cpuhp_invoke_callback+0x10e/0x480
> [ 4590.902920]=C2=A0 ? __pfx_smpboot_thread_fn+0x10/0x10
> [ 4590.903928]=C2=A0 cpuhp_thread_fun+0xd7/0x160
> [ 4590.904818]=C2=A0 smpboot_thread_fn+0xee/0x220
> [ 4590.905716]=C2=A0 kthread+0xf6/0x1f0
> [ 4590.906471]=C2=A0 ? __pfx_kthread+0x10/0x10
> [ 4590.907297]=C2=A0 ret_from_fork+0x2f/0x50
> [ 4590.908110]=C2=A0 ? __pfx_kthread+0x10/0x10
> [ 4590.908917]=C2=A0 ret_from_fork_asm+0x1a/0x30
> [ 4590.909833]=C2=A0 </TASK>
> [ 4590.910465] ---[ end trace 0000000000000000 ]---
> [ 4590.916786] smpboot: CPU 7 is now offline
>=20
> Apparently you can't trigger the same with isolcpus=3D0-6, for some
> reason.
>=20
> One last thing, nohz_full makes sure that we never offline the
> timekeeper
> (see tick_nohz_cpu_down()). The timekeeper also never shuts down its
> tick
> and therefore never go idle, from tmigr perspective, this way when a
> nohz_full
> CPU shuts down its tick, it makes sure that its global timers are
> handled by
> the timekeeper in last resort, because it's the last global migrator,
> always
> alive.
>=20
> But if the timekeeper is HK_TYPE_DOMAIN, or isolated by cpuset, it
> will go out
> of the tmigr hierarchy, breaking the guarantee to have a live global
> migrator
> for nohz_full.
>=20
> That one is a bit more tricky to solve. The easiest is to forbid the
> timekeeper
> from ever being made unavailable. It is also possible to migrate the
> timekeeping duty
> to another common housekeeper.
>=20

Mmh, if I get it correctly, this would mean we need to:

1. make sure the timekeeper is not in isolcpus at boot
2. change timekeeper in case it is included in an isolated cpuset
3. avoid picking domain isolated CPUs when the timekeeper gets offline

All those would be meaningful only if nohz_full is active, right? Am I
missing any corner case? Are any of those already happening?

Thanks,
Gabriele

