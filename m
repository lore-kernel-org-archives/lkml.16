Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890CC20C480
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739849; cv=none; b=PodJrxsW+eYpbdNk9mcudbCUnMrYph73oRn3tUvf+PG96ky20VQ4r0n0lOoCxegFcnIWXQgT3J+Ltw8NySW86uVnnUnHXW/aDDX++SSDehZ5fPI3074yWt5J2GHh1YUAMK6C7Ku5xz3/Jq/8OXaynrkL2nVXq1Sp/qZ8MmEm6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739849; c=relaxed/simple;
	bh=JfjTBMu16c5RkKNNYFsWIsyKYGZLzHjNxj3/N+kUxjU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oxv1q9X2FLsWc7ZY/Chg7z51GILWwToLgzt62QOnjQolHijOx768qDJ30FUZXyuYycFr1VVyJRss1eJJKY6hH3lZ6scmS21oBrtc/EIdHGPtBfen7g2q4ySU81hNvO2UEtzV9BGJ4YETZ0gkJMkd9rfBI9SsXHtp6EaGmp4EP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXWdsRgF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXWdsRgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747739846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U3UgufN512Vdak9aIyicsmZQsOBDvnNU30Hrc1BKwh4=;
	b=eXWdsRgFb4/MHNeH8ryL3u7ZVstQ2ECnXxoYMf+SA/xzcXWk155wZ+NDn0bPxgmrBpLw9c
	b80xF99/hv3nGoUUErxYkjRQrQmROPSk0r/rbcLgDKM9e7vH2J8nTz1R027azl3gWz1u69
	fpRNTk/HNQ+LKRMt56ZuJZnh18Txs0w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-JuuSxkjnONmjkqBrJU48Vg-1; Tue, 20 May 2025 07:17:25 -0400
X-MC-Unique: JuuSxkjnONmjkqBrJU48Vg-1
X-Mimecast-MFC-AGG-ID: JuuSxkjnONmjkqBrJU48Vg_1747739844
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a36e6b7404so1445774f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739844; x=1748344644;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3UgufN512Vdak9aIyicsmZQsOBDvnNU30Hrc1BKwh4=;
        b=dxpfAOhb+otLeAxT40DGNEHc2fmWhtrOz0NJnv59Q9v0kti6qn0/jU0Nkp7HMHp4ID
         8GQDdA27Afqy45dF89JlboLBNgWGW3qAmitmQVnMGeYzsPf42tPKT0TRKhqG0FFXs1Nd
         f8gLUfarD4BR/DKFYxGjvY6hFXQ1r7IVgkL5UHiFpbPIw/lbb6f5QdzWFgU0qL/I/9H6
         H7FL5HMHx6HjI7W/ZbKl8Re0nxsKsBXLGIt72R3WAfW3nvicTUh2Gps6EhyjCc7XWBBp
         PAnVB6JAWYkgJLuPY6SBKkm8pGB5FW13zXVg+m5k8pT48gzWFKuiwqCT8eZ235i5pYJB
         tqOQ==
X-Gm-Message-State: AOJu0Yyqy5TfIPAt2B5MlMClP7vaGc7Dlm+yh6E+THziojzVWch3UuYF
	OcBJexQ3t/hcylACftVRioi8JGNsOgKd+rL4ww70Lm+X4MMsY4Mjr0Xg96gGyJezmy0BhO6Cd7i
	4p+KICthTZKBJ8RE3D6u1NZWGV4+YF/R/wyKxZ2eDXXbHO1DCeHRA7q1PWSOD1wDbcQ==
X-Gm-Gg: ASbGncuPcbnvoijOfQSbZ5DFo7wLZsCpAelYpeRA5CGBLGSsuyTc49MPnYDrEYT8Rno
	1yoz+qzjq5yZY62l08zhDphhHeGadDePhVHexiKhg/37nswUc5nw/BlQHgs3Nnw69hU6jWx0nku
	LUue/nrUfL+Os3ZtMzc8+s42BtDMIHQbqWWJxqozkhaGHPo9B6qt4ChIX3AmUlsw5GYyVZ+sNPT
	LqD/mNuuIWBm+nUEHwMowkMydBhfDvhX0TGGon7DoWgZA0Y8G9+BkRE9OfnlhYC7THYpDqD/LyO
	cpQ8Ig+32wkC2haxbCyKKqoxfeAAy4zZfnuUAg==
X-Received: by 2002:a05:6000:1b0e:b0:3a3:6143:1109 with SMTP id ffacd0b85a97d-3a3614312e2mr11123992f8f.55.1747739843939;
        Tue, 20 May 2025 04:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEXVmg8mcn9mrtbPZ6XilCSxcWyIS31h8rkzmqAfZO1WFO1xfsYRRAQIWj97Sutv1dEhMrzw==
X-Received: by 2002:a05:6000:1b0e:b0:3a3:6143:1109 with SMTP id ffacd0b85a97d-3a3614312e2mr11123974f8f.55.1747739843526;
        Tue, 20 May 2025 04:17:23 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1dfsm16384830f8f.18.2025.05.20.04.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:17:22 -0700 (PDT)
Message-ID: <685cdf5db59a8aaf0b7c0d9847d109d878da039b.camel@redhat.com>
Subject: Re: [PATCH v5 4/6] sched/isolation: Force housekeeping if isolcpus
 and nohz_full don't leave any
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Waiman Long <longman@redhat.com>
Date: Tue, 20 May 2025 13:17:20 +0200
In-Reply-To: <aCxWwVy2UUmvinyZ@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
	 <20250508145319.97794-12-gmonaco@redhat.com>
	 <aCxWwVy2UUmvinyZ@localhost.localdomain>
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



On Tue, 2025-05-20 at 12:17 +0200, Frederic Weisbecker wrote:
> Le Thu, May 08, 2025 at 04:53:24PM +0200, Gabriele Monaco a =C3=A9crit :
> > Currently the user can set up isolcpus and nohz_full in such a way
> > that
> > leaves no housekeeping CPU (i.e. no CPU that is neither domain
> > isolated
> > nor nohz full). This can be a problem for other subsystems (e.g.
> > the
> > timer wheel imgration).
> >=20
> > Prevent this configuration by setting the boot CPU as housekeeping
> > if
> > the union of isolcpus and nohz_full covers all CPUs. In a similar
> > fashion as it already happens if either of them covers all CPUs.
> >=20
> > Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> > ---
> > =C2=A0include/linux/tick.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0kernel/sched/isolation.c | 20 ++++++++++++++++++++
> > =C2=A0kernel/time/tick-sched.c |=C2=A0 7 +++++++
> > =C2=A03 files changed, 29 insertions(+)
> >=20
> > diff --git a/include/linux/tick.h b/include/linux/tick.h
> > index b8ddc8e631a3..0b32c0bd3512 100644
> > --- a/include/linux/tick.h
> > +++ b/include/linux/tick.h
> > @@ -278,6 +278,7 @@ static inline void tick_dep_clear_signal(struct
> > signal_struct *signal,
> > =C2=A0extern void tick_nohz_full_kick_cpu(int cpu);
> > =C2=A0extern void __tick_nohz_task_switch(void);
> > =C2=A0extern void __init tick_nohz_full_setup(cpumask_var_t cpumask);
> > +extern void __init tick_nohz_full_clear_cpu(unsigned int cpu);
> > =C2=A0#else
> > =C2=A0static inline bool tick_nohz_full_enabled(void) { return false; }
> > =C2=A0static inline bool tick_nohz_full_cpu(int cpu) { return false; }
> > @@ -304,6 +305,7 @@ static inline void tick_dep_clear_signal(struct
> > signal_struct *signal,
> > =C2=A0static inline void tick_nohz_full_kick_cpu(int cpu) { }
> > =C2=A0static inline void __tick_nohz_task_switch(void) { }
> > =C2=A0static inline void tick_nohz_full_setup(cpumask_var_t cpumask) { =
}
> > +static inline void tick_nohz_full_clear_cpu(unsigned int cpu) { }
> > =C2=A0#endif
> > =C2=A0
> > =C2=A0static inline void tick_nohz_task_switch(void)
> > diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> > index 81bc8b329ef1..27b65b401534 100644
> > --- a/kernel/sched/isolation.c
> > +++ b/kernel/sched/isolation.c
> > @@ -165,6 +165,26 @@ static int __init housekeeping_setup(char
> > *str, unsigned long flags)
> > =C2=A0			}
> > =C2=A0		}
> > =C2=A0
> > +		/* Check in combination with the previously set
> > cpumask */
> > +		type =3D find_first_bit(&housekeeping.flags,
> > HK_TYPE_MAX);
> > +		first_cpu =3D
> > cpumask_first_and_and(cpu_present_mask,
> > +						=C2=A0
> > housekeeping_staging,
> > +						=C2=A0
> > housekeeping.cpumasks[type]);
> > +		if (first_cpu >=3D nr_cpu_ids || first_cpu >=3D
> > setup_max_cpus) {
> > +			pr_warn("Housekeeping: must include one
> > present CPU neither "
> > +				"in nohz_full=3D nor in isolcpus=3D,
> > using boot CPU:%d\n",
> > +				smp_processor_id());
> > +			for_each_set_bit(type,
> > &housekeeping.flags, HK_TYPE_MAX)
> > +				__cpumask_set_cpu(smp_processor_id
> > (),
> > +						=C2=A0
> > housekeeping.cpumasks[type]);
> > +			__cpumask_set_cpu(smp_processor_id(),
> > housekeeping_staging);
> > +			__cpumask_clear_cpu(smp_processor_id(),
> > non_housekeeping_mask);
> > +			tick_nohz_full_clear_cpu(smp_processor_id(
> > ));
> > +
> > +			if (cpumask_empty(non_housekeeping_mask))
> > +				goto free_housekeeping_staging;
> > +		}
> > +
>=20
> Looking again at that, how is it possible to set a different CPU
> between
> isolcpus=3D and nohz_full=3D ?
>=20
> 		enum hk_type type;
> 		unsigned long iter_flags =3D flags &
> housekeeping.flags;
>=20
> 		for_each_set_bit(type, &iter_flags, HK_TYPE_MAX) {
> 			if (!cpumask_equal(housekeeping_staging,
> 					=C2=A0=C2=A0
> housekeeping.cpumasks[type])) {
> 				pr_warn("Housekeeping: nohz_full=3D
> must match isolcpus=3D\n");
> 				goto free_housekeeping_staging;
> 			}
> 		}

The isolcpus parameter can be used like:
1. isolcpus=3D1,2,3
2. isolcpus=3Ddomain,1,2,3
3. isolcpus=3Dnohz,1,2,3
4. isolcpus=3Ddomain,nohz,1,2,3
...

1 and 2 are equivalent (e.g. if no mode is specified, that's domain
isolation), 3 is equivalent to nohz_full=3D1,2,3 and 4 is equivalent to
1-2 in combination with nohz_full=3D1,2,3

Now, the code takes into account that there are 2 arguments that can
isolate (isolcpus and domain) and can be passed in any order, that
specific code guards against those two passing inconsistent maps, e.g.:

	isolcpus=3Dnohz,0-4 nohz_full=3D5-8

Strictly speaking it's guarding for any other possible inconsistency
but I believe that's the only one actually achievable.

Again, nothing forbids e.g.

	isolcpus=3Ddomain,0-4 nohz_full=3D5-8

since they're different isolation flags and that's allowed (not sure if
it really should be though).

