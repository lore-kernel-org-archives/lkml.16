Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D88E1DB356
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297567; cv=none; b=dmfBvK846V/oPBy5A5WTMtwFPIWmZeKtglUsq6xvs0Uv1FQO9hoe/C/IZnyK+0JidjgaarZzdB3RdoPg6GtQm4lp1DzLPoYnzCwzxTy6gxGgQL89ntczGd2GaZL2Hky4P690NTcJFA9GJWvQHHZoPMdxObdilv4QKmGVoPcWpSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297567; c=relaxed/simple;
	bh=i/wV+cfAdpSCZ8frE82BhmUeyqZVWD/FpxbdA1lIrvk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QePGsf6GZcM9SF5nfm0UHdj9EXAFiIN/NHEmA9o6itj5fbAi9eMCANluygKQ2gQMR4yyengXu1uIWvHpo/oDGYFHsoGXm5lQzfXUjaK1HJxPxGMwM9zVU012KwgSKtc6128TlN3l2V3Xb80Kvo0WH/29dMjty6Nwgp97OUj0yag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGL79bH7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGL79bH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744297563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i/wV+cfAdpSCZ8frE82BhmUeyqZVWD/FpxbdA1lIrvk=;
	b=dGL79bH7EGt9R0y4SZoXAL22Du3hitF1cQ6udERSVVCB1miD48orT/qU7gdoYwzRJADhwV
	mLxEk5rIRE75chTGxbNQaphMQRUzr0NA4BnapeOnKMIc7nFIown+s5PN28KpBxahkEeoTj
	KZaC/EatuJw5GImmqg1SwQiS8P/hA0w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-hMD7JyVTPTakyswkZucrBA-1; Thu, 10 Apr 2025 11:05:57 -0400
X-MC-Unique: hMD7JyVTPTakyswkZucrBA-1
X-Mimecast-MFC-AGG-ID: hMD7JyVTPTakyswkZucrBA_1744297556
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39123912ff0so390352f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297556; x=1744902356;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/wV+cfAdpSCZ8frE82BhmUeyqZVWD/FpxbdA1lIrvk=;
        b=ttsWFmd65mQPeQaPyH6+nzUijs9cLIhi0qK5CZSEVUyyUjvaJ3ZZEFqQlUlClBMIMz
         NPdBKCo7m+tn0flgrKrTwXHwxMzvvouyMYxp6VuSVyjhodTpqxFRaFZhbtWaE6caB3os
         KO8gus3CjHjXc60mq9CekQm+3VlsqyQMmHiCg2YHAc2nSPXrbCHGxBuvfy4Mlre+ODRr
         gYJ57Vdv9LHI15FjfVd9aA6OZX28fuyUNPOiI4D1E4u5RDsbt6LeG6wd7ZWZKTMFQ2sT
         CXB6bK0qcpV3x6Xuz0i4FYUBpqthOci+8KfSPdHkvRzVOAXLUIf4pBDAS3Hm8MFNoflK
         SMIg==
X-Forwarded-Encrypted: i=1; AJvYcCX8aJuPbrGnaUFIT5N6K0OlhGesReqednhftU/F3kLXtB8eKGKERfa/en7uRTpDL66aefzFKemfy0kEgPM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DXpcpDAedWL07gL0dJpaP5x/hnoKOkJWMYLFKpFI5xmiolZ9
	PsSWC+72DDakrfe6h1pUkpt0cdfp0/9E3nkS4aUf29pas0uAzP0lnJzLG316/M/7KF4Y6UJ9geE
	RieJkVtiMw9ntkWouh+UlRf15Qc/elm/6b7JMu+ndM1xZySZHmWYR98d4XwCc7Q==
X-Gm-Gg: ASbGncsQ8qz6Dzno1rK7fgr3OvYFs8N9MAQjjX1bf7+8mzQvMZunEltgnTImigwVkrU
	+FS7GIwViq6KjxypyN40S9clUrFrYRexOYB6cd017m2r/+C58oYbC+RbSNOxgoFE9sLnL5+Fm8+
	B/SrryEPNbvIA26rtI1ghKN4RqdzQfgObSUo6reVRCE6L4/fgSqgAQrknFWgMuUB4wno3ndCjQ2
	4uvxhLSogBv/f57tORafwGQpUWHB4oecP+1bAa8WC814Q+7/vtkhSzYR6CxD20gkYs0wTLa4OLz
	0d0CdecGvjHZJwhC0QbUCs+qaE0VTzQlqjzXww==
X-Received: by 2002:a05:6000:1863:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-39d8fd8c55emr2956478f8f.40.1744297556128;
        Thu, 10 Apr 2025 08:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmaiNcWIdBg09PgEKL7T/ex4twD0QSzIRKCesXrCMhx/62w6Bk8o+vD9bC7DblS/CYIKAdLw==
X-Received: by 2002:a05:6000:1863:b0:38f:503a:d93f with SMTP id ffacd0b85a97d-39d8fd8c55emr2956295f8f.40.1744297554300;
        Thu, 10 Apr 2025 08:05:54 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89362fd6sm5205516f8f.16.2025.04.10.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:05:53 -0700 (PDT)
Message-ID: <1c60e19d1cebc09a8fd89f073c3dbec80c8ddbf1.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Waiman Long <longman@redhat.com>
Date: Thu, 10 Apr 2025 17:05:52 +0200
In-Reply-To: <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
	 <87ecy0tob1.ffs@tglx>
	 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
	 <Z_fBq2AQjzyg8m5w@localhost.localdomain> <87wmbsrwca.ffs@tglx>
	 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
	 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
	 <Z_fTmzdvLEmrAth6@localhost.localdomain>
	 <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
	 <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Thu, 2025-04-10 at 16:59 +0200, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 04:46:10PM +0200, Gabriele Monaco a =C3=A9crit :
> >=20
> >=20
> > On Thu, 2025-04-10 at 16:20 +0200, Frederic Weisbecker wrote:
> > > Le Thu, Apr 10, 2025 at 03:56:02PM +0200, Gabriele Monaco a =C3=A9cri=
t
> > > :
> > > > On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
> > > > > But how do we handle global timers that have been initialized
> > > > > and
> > > > > queued from
> > > > > isolated CPUs?
> > > >=20
> > > > I need to sketch a bit more the solution but the rough idea is:
> > > > 1. isolated CPUs don't pull remote timers
> > >=20
> > > That's the "easy" part.
> > >=20
> > > > 2. isolated CPUs ignore their global timers and let others pull
> > > > them
> > > > =C2=A0 perhaps with some more logic to avoid it expiring
> > >=20
> > > This will always involve added overhead because you may need to
> > > wake
> > > up
> > > a CPU upon enqueueing a global timer to make sure it will be
> > > handled.
> > > At least when all other CPUs are idle.
> > >=20
> > > > Wouldn't that be sufficient?
> > > >=20
> > > > Also, I would definitely do 1. for any kind of isolation, but
> > > > I'm
> > > > not
> > > > sure about 2.
> > > > Strictly speaking domain isolated cores don't claim to be free
> > > > of
> > > > kernel noise, even if they initiate it (but nohz_full ones do).
> > > > What would be the expectation there?
> > >=20
> > > I don't know, I haven't heard complains about isolcpus handling
> > > global
> > > timers so far...
> > >=20
> > > I wouldn't pay much attention to 2) until anybody complains. Does
> > > 1)
> > > even
> > > matter to anybody outside nohz_full ?
> > >=20
> >=20
> > Makes sense..
> > In our case, 2. is not a big issue because it can usually be solved
> > by
> > other configurations, but 1. is an issue.
> > Most people indeed use nohz_full in that scenario, but some users
> > may
> > not want its overhead.
> >=20
> > I find it misleading at best for global timers to migrate from
> > housekeeping to isolcpus cores and since it's "easy", I'd
> > definitely
> > change that.
>=20
> Easy but still a bit invasive so:
>=20

I'm not understanding what is going to be invasive in this case.
Aren't we just talking about not allowing isolcpus to pull timers from
other cpus?
Let's ignore for now the global timers started on those CPUs, I'm not
aware of complaints regarding that.

As far as I understand, the change would allow timer migration to work
normally out of isolcpus and among housekeeping ones, we are not
forcing any migration that would potentially introduce overhead or
missed timers.
Or am I oversimplifying it?

Thanks,
Gabriele

