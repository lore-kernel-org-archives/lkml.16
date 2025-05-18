Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F783610B
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 00:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747528827; cv=none; b=oskGsA0y9dXcec2aOkew2qu512Vh2PW/261hf+bFlQC+L1/xFFF2MUsYyC15PcQkBu5IpxXvDmkmCTHEQjUZPbHvja+IuiUuVyrePfTdkw99KszUnAs+ipukXrDSMzvTUDzmwI2Z6ZDPQW5kCW7GSjyuaSELr8gIpkcHjsMZ8GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747528827; c=relaxed/simple;
	bh=AWYHQkRcyJ4Z1+tGAJEKHNjC6MY6Oio2PbzXCZIxbVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWP4sCsyjeHOR1iGlBTf2CRdht/nuhhfjILz2w9MZHkrg/eYysbdTwkmcO5Wofzn3Te3wULEBToOqr2YweTTF+/tVEmBuUTORaBfDknn5HIEilYJ6MsTZMuOIK0RHKLUFOXTwA+t0ghMkHjbzqDQoBS6KMaoeIC+lhLuU3mC1qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com; spf=pass smtp.mailfrom=manifault.com; dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b=X62H1AVM; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manifault.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b="X62H1AVM"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5b2472969so341347685a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=manifault-com.20230601.gappssmtp.com; s=20230601; t=1747528824; x=1748133624; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWYHQkRcyJ4Z1+tGAJEKHNjC6MY6Oio2PbzXCZIxbVo=;
        b=X62H1AVM8TPxEyLOhy8w+1v2AzSS5MzYq5bHvR78hNlysG+On9yCwy5RiT3i6Go5Hu
         awyUBe8gBfLYdEofoYSYSDeCOh8VXZhgcxfuYGFRw69F8P6URxM3b6vIXXb0YmQL2Y0T
         2TrMuzQ2IjTsbNIFmfuK/DIoKqD7qN6J9Jf+qQueylKma71TkOjMkvZIkLCSFBp2ElHz
         mDkimSnHgDZWpLkYvwZBymfeTeSIKN0KLSfJ6VTX5K+1BYYIMf3PNdl2NdHkDA4eljdF
         61PMqgNICBD9JGAWbYmznWKhMm8qza3s5f3FC8S4eLfU6IqMja/aPSQzHnZp9pX8p1pu
         O3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747528824; x=1748133624;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWYHQkRcyJ4Z1+tGAJEKHNjC6MY6Oio2PbzXCZIxbVo=;
        b=SW9Ze0VG4KgUZG0SgJqInEzRP3tZMDpoZKSadizvTvw4HnoLMCasf3AZAMGn1vMuND
         i2lDTPWOEbGyEC4pEQK5XZdLeMv5TDWAaiMwrimeAW9ARRP0Ul68snX2vmDkxhgefycd
         pQrVZZz2nbDUbZeG1aPwtqQA6RVJrnPIiNENc2XpbwB8zj6JhiQWi2SM64V4IxhexD8o
         BKhPvbNKhEuCcY4yZi/pgRL2Dnv6wVgX9jxJbrz7ApSXoKr283Vuj7afyADN0/If3mMY
         Dy6i6RaSuFM4+J4WEdNEE9DSpG0qJ2R0X0iEFwl9RZg8iAqzZCgFEIJh0imZ41RzJ1dX
         j5ag==
X-Forwarded-Encrypted: i=1; AJvYcCWkd0WlEGYT+mXVTQooJpn/U9Qg82LP5K7mV0GxlEuc4nLNRENV/PyyrpwVDQp7un0m595X1WLGro+VhMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdb2CcGcUrmsMq+PWgAKG9eWgtC5auRD8f/QS/JOAVJq5x71N
	eKTWOIuNiHwZeMGRMccv6tpy6nWnTk/2DvhMIVqJkOx8jZJ1MiTdC/HeIoBqfKL4lFOH
X-Gm-Gg: ASbGnctW0aJtdWP9OU/qClvOEzOqoUcC40kEhW6CEoH8wZcH0yfEV/LgN0evlJaVTA3
	lAWvhEOynJFytqQaLSqRnk5HIisZccga+c23h0cZtOOiDT7sxiWxugoT2ekALHodNcbUoNxBm09
	IZHeD3XeDC/oAyh6GSNHBApn8AJBf1WERKXITK9mqnooet26J84dpHxKMHrFNT5B8qnL4a4y+lf
	vVZowaDTxmF4+DUe/IEPGUHC63DF37hgdhl/rOaFCQCEW+11bpp7Q2rXn/kfs2EsZ/sTkoaGU27
	UIF4kCNcawYrhaRQhtv4QWHjuRGK9PcKA8r3JNTws/+2PHHSQxosr0qbcw8poV+j83jcPg==
X-Google-Smtp-Source: AGHT+IG4xEdkUxPZ7qMiJwwm4rs01OJCogdpFVr5/T9Jb1AGhrX8vCPQttD0nmf9OoDisibI687mNA==
X-Received: by 2002:a05:620a:269a:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7cd467adbb2mr1173191185a.58.1747528824171;
        Sat, 17 May 2025 17:40:24 -0700 (PDT)
Received: from localhost (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd468cc782sm332895585a.101.2025.05.17.17.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 17:40:23 -0700 (PDT)
Date: Sat, 17 May 2025 19:40:22 -0500
From: David Vernet <void@manifault.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
Message-ID: <py6tcjya3nxhmicvdhytyuu43rdw3j5wjw3bc5j66tsj2ngcax@gzifqgx72um6>
References: <20250515191716.327518-1-arighi@nvidia.com>
 <20250515191716.327518-4-arighi@nvidia.com>
 <wdjlm556njybe4bgxk277xj4skryh2qnvd57yoenyf33vd4oyh@gz3ouesvc5vf>
 <aCkStT1QTGWZ3B50@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z4vglimw7jtdrcqq"
Content-Disposition: inline
In-Reply-To: <aCkStT1QTGWZ3B50@gpd3>
User-Agent: NeoMutt/20250404-dirty


--z4vglimw7jtdrcqq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
MIME-Version: 1.0

On Sun, May 18, 2025 at 12:50:29AM +0200, Andrea Righi wrote:

Hey Andrea,

[...]

> > I wonder if we should just bring this into scx_select_cpu_dfl()? It see=
ms like
> > it would makes sense to do this optimization whether we're looking at
> > cpus_allowed here, or p->cpus_ptr in scx_select_cpu_dfl(). I seem to re=
call us
> > having this in there before so there may be a reason we removed it, but=
 I've
> > been out of the game for a while so I'm not sure.
>=20
> Trying to remember... probably it was removed because ops.select_cpu() is
> never called for tasks that can only run on 1 CPU.

Hmmm, I think it is called even for pcpu tasks, no?

> > Anyways, if we could do this, then we could bring both scx_bpf_select_c=
pu_and()
> > and scx_select_cpu_dfl() into the scx_kfunc_ids_idle kfunc group and re=
move
> > scx_kfunc_ids_select_cpu.
> >=20
> > What do you think?
>=20
> Are you suggesting that scx_bpf_select_cpu_dfl() should also be allowed in
> the same contexts as scx_bpf_select_cpu_and()?

Yep that's what I was thinking.

> I did consider that, but was initially concerned about the potential
> overhead of handling different contexts, even though these extra checks to
> manage the contexts would likely be negligible in terms of overhead. And =
it
> would give the possibility to use scx_bpf_select_cpu_dfl() in ops.enqueue=
()
> as well, so overall I see more pros than cons.

Now that you mention it I don't see any reason that scx_bpf_select_cpu_dfl()
couldn't be called from ops.enqueue() even now, as we do hold the rq lock on
that path. But in general I think that if we want to make
scx_bpf_select_cpu_and() callable without the rq lock held, that we might as
well do it for both as I don't think there's any semantic difference between
the two to the user; it's just that one version also does an AND.

As I mentioned in the other thread, I don't have a strong opinion either wa=
y,
but in my opinion it seems more consistent to move the extra context-handli=
ng
logic into scx_bpf_select_cpu_dfl() if we do decide to allow callers to use
this.

Thanks,
David

--z4vglimw7jtdrcqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCaCksdgAKCRBZ5LhpZcTz
ZKG2AQC72nU+uzStP4p3a9q+1YHYT4KWQEzCD5M0em5VlZJGtgD/aNDXP+wUiHMl
K5uXpxTe/XryHd0m8GUAPtj+FxppOA4=
=uZ9u
-----END PGP SIGNATURE-----

--z4vglimw7jtdrcqq--
