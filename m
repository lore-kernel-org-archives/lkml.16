Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76243FB1B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774012; cv=none; b=HOWYKhRlFYT55k1YvBKXzne8O3S301sRM0krI2199kRUd1pihG0Sz7MSqYgYkqg+i9WlCkm0IvZexGozWxwCcnQ7Ny7Q7I/nxyG7XQ7rXMcGhoDQWlOsF61gGk4BYJr6hX5vnV/3kFkeRfLsqw+LGMPGQj55qMU0hd/mtTy8lEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774012; c=relaxed/simple;
	bh=UJRHi8VtXi0j/haWMkbtDJW892NNvRpaYGNjw5eC2rk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Im37gq+vdeT+lPf3uCOxY4yJUNhJw1CEGZ7E0dJ3lOHAGn56h0zp33yPivcURQZW8xT0gmsTxXAhLYyFx2Yx+s43GckFrO/hMko52QGBl2lLT9CT4ZmF2i3kMMi43c5gNG8q4U9EnGo84QEydSRdjp2KBQSx8Qcd6B3DAM/PHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fbFdQ33T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fbFdQ33T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750774009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=brO5UuNwsnXhxkPr+JOlVZidvfGcar9TQL7N5I3jMjU=;
	b=fbFdQ33T9njlZocZwr1cXAr2k4IzlNGjrdB3mwHrV8t1h5+xXxui4vuappoNoUoi4pdTnp
	dmpnQLI5vg4+h/CNn1NjGSStZ2wzcPfd4HNPqG+vbRgq4l10wWFw7GGmutTqnLEI0lM1tG
	Ohq1uRIE6k/KgYRR8F3aUFt++0H0BXE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-CeehLaTOPqyf9kQgxTeUgw-1; Tue, 24 Jun 2025 10:06:48 -0400
X-MC-Unique: CeehLaTOPqyf9kQgxTeUgw-1
X-Mimecast-MFC-AGG-ID: CeehLaTOPqyf9kQgxTeUgw_1750774007
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so3023835f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774007; x=1751378807;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brO5UuNwsnXhxkPr+JOlVZidvfGcar9TQL7N5I3jMjU=;
        b=lwaluHTpPGWSGyETYmVWpLuVv7b5ximRUTedsmSlwQ48eI2k73LxIZpEEB+iElLuOn
         PWEIRIBSTHrVYL03vofRdP5N4OQvC5QOLoieMDscmnuqm/PvaQ0Ui2NR1YfXsP52wHUo
         jLzE9mI8s2yLJYNURCh66oHfVBmOS8WcsIEPIQBTBgE6vm+SzMsSzqfpnEdkQHfiUXQZ
         WhiOom99ZAyxm0H/b2ppiR8acpkY15QBVhTT3Xbi+HpOg7jkLKo9uMMdr3w06o4XyLlY
         +h9TL2HNcdz73GG6Bs3e2pJ9J+hADgUsq4LFrpxjul9KNTgbzgwjm5S+et0P1tE/6vGE
         KfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJZDYrfK01c7EkvE67wfpHtYBC3IdHfR/X/hhNi/ceru2QaR2XD89Et3elw0RKobp2m0YOFKtjInYRmtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzTk3mNhmSc8dGvCzjYt+Vsn2VDIcx9bQhvhALEimUQ9pI783t
	lMlBI9KSLISNTJYQI10wRqbuGffT01fBYi1pm2k7DapAGU7ZyB9B618W6+GSKwlnKx7yhP4HbVI
	zhWzu4cgih8cEr6Na7+xXGZnDQRp1muj1Q2KPHVmhiddqNyMmMzSz5vByVbwUaBbR9g==
X-Gm-Gg: ASbGncvqX9r/O72W9zvB7lu91p7YaHQvCZm8fDKW9pa5pukt4joqID0b1+5QD0I4+6k
	5q2vfOsYjPLP6JfD9anYML6S1L/pYxukV581mdLOEH0a/0MmS9z/PvKFNf/K/5Rp1Z5K2FR20cQ
	otHZgvAmCUK1DxgXv1sLRAX6wfBSIjVh06HUaVaCzMngQ/qwf5+KsI95ipqgifds0ymUk5d5L1m
	mMGeSdQ640aEMandZrRjjFql/X5zQDxTpTZXjdVPomYF5UWAM7HQMnFPB/1CWRSSTbgp0XvvwAp
	yWVGRjxYNMCO4///TVu8KTueEYiVMifuT8hmoDmoQSdj+E8C
X-Received: by 2002:a05:6000:2f87:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a6e71ff6f8mr3308743f8f.18.1750774005262;
        Tue, 24 Jun 2025 07:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVp06bRQQvPg3FHzH2flFRw42os0cqFBHF8/BB9ghA7E2Q+8IGEbezOEuwDl14iBcDWO2ncg==
X-Received: by 2002:a05:6000:2f87:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a6e71ff6f8mr3308533f8f.18.1750774003248;
        Tue, 24 Jun 2025 07:06:43 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45366b4d0adsm131794625e9.14.2025.06.24.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:06:42 -0700 (PDT)
Message-ID: <1bc41a7a5bd46860318b0417fa27121758f28448.camel@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Date: Tue, 24 Jun 2025 16:06:41 +0200
In-Reply-To: <878qlhnunz.ffs@tglx>
References: <20250530142031.215594-1-gmonaco@redhat.com>
	 <20250530142031.215594-7-gmonaco@redhat.com> <875xgqqrel.ffs@tglx>
	 <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
	 <878qlhnunz.ffs@tglx>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-06-24 at 15:20 +0200, Thomas Gleixner wrote:
> On Tue, Jun 24 2025 at 10:05, Gabriele Monaco wrote:
>=20
> Please trim your replies. It's a pain to scroll through 160 quotes
> lines
> to find the gist of the mail...
>=20
> > On Fri, 2025-06-20 at 19:00 +0200, Thomas Gleixner wrote:
> > > > +	if ((!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
> > > > +	=C2=A0=C2=A0=C2=A0=C2=A0 cpuset_cpu_is_isolated(cpu)) &&
> > > > +	=C2=A0=C2=A0=C2=A0 housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) &&
> > > > +	=C2=A0=C2=A0=C2=A0 tick_nohz_cpu_hotpluggable(cpu))
> > > > +		return 0;
> > >=20
> > > Same nonsense as above.
> > >=20
> > tmigr_cpu_available is called at boot time and is applying also the
> > boot time isolation parameters (tmigr_isolated_exclude_cpumask is
> > only
> > used by the cpuset code).
> >=20
> > Now let's assume a machine booted with the arguments isolcpus=3D0-3
> > nohz_full=3D5-7.
> >=20
> > Without checking for tick_nohz_cpu_hotpluggable() here, we would
> > not
> > set the tick cpu (0) as available at boot, ending up in the
> > unwanted
> > corner cases discussed in the v5 of the series.
> >=20
> > I could remove this call here (which is mostly redundant after
> > boot)
> > and enable explicitly the tick cpu in another way, but this still
> > seems
> > cleaner to me.
> >=20
> > Does it make sense to you? Is the comment in the code unclear?
>=20
> It does not make sense and the comment does not change that.
>=20
> The point is that tmigr_init() is an early initcall which is invoked
> before SMP is initialized and APs are brought up.
>=20
> At this point CPU0 can neither be isolated nor nohz full for obvious
> reasons, no?
>=20

Right, but as far as I understood, the first call to=20
tmigr_set_cpu_available() happens after the isolcpus parameter has been
parsed so we know at least cpu0 is going to be isolated.

On my machine it works reliably this way. I'm a bit lost in the init
code but seeing housekeeping_init() before rcu_init(), which in turn
should be required for some RCU-related early_initcalls, makes me
believe this order is guaranteed to be respected.
Or am I missing something?

Thanks,
Gabriele

