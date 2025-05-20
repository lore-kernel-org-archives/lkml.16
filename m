Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D331A5B9D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744112; cv=none; b=nB90VZ1ioDJUNtO0FR7pQDKtmzGid8tK8gJpWdE5Fu7JKdBoOqQ+G4ul3ycvEDGsPjyYwAuMBL2d/s8fD5shrvJH/FwnBz4yOwGIaCHEoYGuAfwFGb42GUbxle1VwWCndYK3dI4aIF5zrqYfDdcYYHiZNeThknOfurwhUBrlnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744112; c=relaxed/simple;
	bh=1w99zC5ZUIQPq1ZgWC4AK8q+MslsDz+45iZdr52x4Ro=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qObvuo20GjGzfuXjBVSMfNKDVLL8OW0XqWHtxUfTDmQHlrV68hvHR4OVdsbwKGJbwlSTbolLTemZSyrZTSI/ufeVILHR3KqOaEX2gCP+mbQKhKGY38LctpPIrbfw42igi5/H+BHUj+1CHIRR5GzBQ5xeuKG+NNT+F9+2QXD1vrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/r4CUd2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/r4CUd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747744109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5b8DwmjJyWtIWKCLaPFDNUFZFc5vK3ljotcJ3QRFsxo=;
	b=c/r4CUd2toBIQladA+NcijLStWr5C0OCmodgSHNjW4fe8uei8djz1P7yX7J5wxBpv8/T4f
	7RAx+3A99wNZduWl+m8k8PjvJEue37eAUAT4OOBCTC9/eofNpOwcavp0m+6oIvHNz1FHeE
	YN4d5CXk676L4zY1ckQpOiNaYx+/Cww=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-8OLyftD7Ney1YL1AQLVFbg-1; Tue, 20 May 2025 08:28:28 -0400
X-MC-Unique: 8OLyftD7Ney1YL1AQLVFbg-1
X-Mimecast-MFC-AGG-ID: 8OLyftD7Ney1YL1AQLVFbg_1747744107
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so440774f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744107; x=1748348907;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5b8DwmjJyWtIWKCLaPFDNUFZFc5vK3ljotcJ3QRFsxo=;
        b=KPXdOid+g844rVpHXHSxtz/M55mT5rSv0J+spQ8WkA+2nrW3d5IzeZukcaTmqP3KJE
         K4NftLz594wn7E5TNlFrqxvj+TkZkMmjhy0Jhe0t42dKPmdNKXciNcOAf7GmASLqzAYl
         KJ/omCr/BS85Ga9zdadU/1CJ1FcOe6UTHZx1D8fHNhdyxzR/vDF9N5ZtTvYFIi+lURTO
         R8W0UQOltBaa1ZI8o1pMMx5tB/VUTYoi3kLNnbHENlz8Y9OXBPwjyPNvmYc3HQUf71jG
         3BDsRQpr55eL9vnqITgynjhM3xkak6qNjdcmJ4/X4TJMTu2n2f4Yde5A5os7vtgjX4Jt
         P2Fw==
X-Gm-Message-State: AOJu0YzEN7eMgC8CIXqDMGqRZsmMvrPkTOqFyixNiwMfI6VjOxccpL/y
	Myv7tGHxNR3O4tjDJI+s16mIlS3rLw8pAKmM9W/vFP+vSj79pBIVOeh9E94FlRjP11KAteVDNkR
	eRmyq7aqMfm9xHop59NcWOVoMNdwm8tTINkafYvqnTbJlp87XYWTvkwYceLL+3PaV8g==
X-Gm-Gg: ASbGncuqxYOi4xcbfJbGtVEZq2zEJ+8RmTQN++VvfTegCYTsdpQucehr75F0vaEzuQT
	fYSgLqNk4CPb6adgOQcYQnNKot1zkN+7jReJU3A1g618C4ZRmgQcvm6ltHe+LT6GuiGKVpQCzsJ
	dtfsqFFgDjaMtOjIv0bpIpyyAIKEEA79YkO9FDkqSDmvUqSQIj5aY243HyKbmmmpCgxQ1N//Yz/
	c120l9/2iZ0Nb8kkUXIcmIT5MnSqR8/T5Ep1eA56tSc5FThZ8mGOarpWQJ/d98NBKhbKJB7MyjI
	DVlRUrFNRARQoemcmD11OX4sRVyfQ890wy3CNg==
X-Received: by 2002:a05:6000:2012:b0:3a0:b58c:dd8 with SMTP id ffacd0b85a97d-3a35c82fa3bmr12951135f8f.30.1747744106808;
        Tue, 20 May 2025 05:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE08pFhTtIs4KPEaviYrIQse9rZTjPMnj74Ezvbe/ZZWj5AOJUJmvZKZFBoGQFPg5C6yij2fg==
X-Received: by 2002:a05:6000:2012:b0:3a0:b58c:dd8 with SMTP id ffacd0b85a97d-3a35c82fa3bmr12951123f8f.30.1747744106416;
        Tue, 20 May 2025 05:28:26 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36835ef41sm12046155f8f.94.2025.05.20.05.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:28:25 -0700 (PDT)
Message-ID: <7e6f50e5ffc31c512ca5e57c36ecfd733fdccf63.camel@redhat.com>
Subject: Re: [PATCH v5 4/6] sched/isolation: Force housekeeping if isolcpus
 and nohz_full don't leave any
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Waiman Long <longman@redhat.com>
Date: Tue, 20 May 2025 14:28:24 +0200
In-Reply-To: <aCxvQxSS31PcHsDR@localhost.localdomain>
References: <20250508145319.97794-8-gmonaco@redhat.com>
	 <20250508145319.97794-12-gmonaco@redhat.com>
	 <aCxvQxSS31PcHsDR@localhost.localdomain>
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



On Tue, 2025-05-20 at 14:02 +0200, Frederic Weisbecker wrote:
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
>=20
> I wouldn't even bother recovering:
>=20
> pr_warn("Housekeeping: must include one present CPU neither in
> nohz_full=3D nor in
> isolcpus=3D\n ignoring setting %lx", flags);
>=20
> goto free_housekeeping_staging;

Yeah good point, that would simplify things with the tick CPU.

Thanks,
Gabriele

