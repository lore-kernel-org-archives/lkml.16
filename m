Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B63F9C0
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747576176; cv=none; b=M/Dr7l893n5T+QIOE2I1D34zPG8tU74yV5QktaXi8Y8uUobvXNa19nUtgRwNrDiigsPJeW2q+tkjDTMpOJdbw4k04SpSB1tsLyiTBdi2hY3LxGRcacSVN0p/yUFp5X5NXcmNGgfDuvm92xFtNq5QnKPSsjHy6DMGJFS6gXUihJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747576176; c=relaxed/simple;
	bh=YYeNz8e6mIZ+vQBZC4fa38JWM8jZb0YVf/5rrgKbcKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kb4OQm5mgwtiWgjWnv8DfFlDJEds068xpjjiAZmWdHl9T0cRZs+hlXHNQBKzKuLwYN9QwUHi1rfQ1STHnRWBOlRDGZ2U2usTqL86M0AiWrxjMy/i1JXGJW+AOb5ranitnwy3ul/5sucqX587pk/kT1YC+h0qhOyBbjjM8Whajlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com; spf=pass smtp.mailfrom=manifault.com; dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b=K6jk7lbQ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manifault.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b="K6jk7lbQ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5a88b34a6so388615785a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=manifault-com.20230601.gappssmtp.com; s=20230601; t=1747576173; x=1748180973; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYeNz8e6mIZ+vQBZC4fa38JWM8jZb0YVf/5rrgKbcKg=;
        b=K6jk7lbQ5XCgTLT94iFhqXkuhIbrNk459sYqIAYADvOQj0zQqHqLhifYTbctgSmVoG
         hCNxnlUN1YSTD2Z1WAPHorBbL4QGCjjtJAW4H9ZWfB/MNMWXPa9b01SAUlrbT0Mi0wWr
         HrLmDaHeSzGXU11O0OhbVhGT6kGJrVlwpInOHD79BIcLL3LIEpIaYTNPygRvtJgpIcnA
         clkXd3C9WDxaIKpAZigsVZ3bxi0JwJ38TZk9w85vnrzN961cDsstvNypNUn0uN6zlIku
         Wb7Umq7dpMEzqg2Vg3YrkH+hDsGIuTSfPRwQiqNeVE6MboSnjBGVblhAPnu/EOvQEBd7
         t7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747576173; x=1748180973;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYeNz8e6mIZ+vQBZC4fa38JWM8jZb0YVf/5rrgKbcKg=;
        b=XFk5bgH51Zv0wCjBrL4oL/JOlF5UTPcqnyp2qRr9PVklR+5aoT7ivd2QRVmJOerlSk
         oaAsJc/NBxi55oj/vHsXBCEd77/F7lQZFYhOKIGcUJotX4ox8i8RxR3JcZaESXjvDpjs
         Rqy7m2VZPCFdYSFdIdxThWk71wXkxoeW3IoU/WBvUtxuMU5i/MTN8/urrcqCT+rxzq0w
         AHjdOJyJWveq8Qz0GL75dimAJDigjoI+cw9iW1q+5pMMy4TNxVWTQnczlDGoUtvGtx9l
         tVX4MfF2+bqXCkL9LTimP5rdmEQZkchybcY4SJcu3wKELOviyasTV/5Qg4Pdxiyyo+vE
         jHyg==
X-Forwarded-Encrypted: i=1; AJvYcCX6CsnY47Av2nlYaa6OPdvYYAIG/Md7sP0cGYWTIhivCBCaK9lj6kEKCgiGrTBVeFoDFEYLsS4EneSYLtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzouclYbcqENUtYJQ2jGJxDoHcsLTt6nG2JZaBHLQlFURQej3UF
	sZsh2+eDVYLwMDd+mrCgFlJom0IC2MT3wr20QQfwNG0TYJ7mzRP5LeNOrKH6paMVJw/K
X-Gm-Gg: ASbGncvy+hjziykqZefi5s8nYOFedGlXMR94ocE2keuexwoXnwHcdmvz/wGJ/C82a/u
	thMi/29XlcU8dgJ8RmXY6PjucJcyL+zkMQdjo1AsixjfYfNv/joROXjs8HUWbMH+8jw7dArfnlA
	MEYdvpg21QpU9Wy7qd9CBgRHiszvm4rwONS4NTLrgVxxy+rulMfpRL4wgxva1RfmeDBSzVahYUM
	r06Ojta003h8HOMtd7SQ622viSDIv3McBsjpJjte4sNGnlXPksO1F20bd9nYE3jTLpTThFJof5q
	mBOqoSOzdc11eLAqeQdOvZGqmhHKDMBpMEy9p0ju6RpozjuPO+16D1CZgNJFsJfeeaa2BQ==
X-Google-Smtp-Source: AGHT+IHb4VTrLpGptow8zbJRP1i8jCM3zafJtqOLzsGYKjimruMeJcXn+M055CoeLjs/21OkkKfxGg==
X-Received: by 2002:a05:622a:4005:b0:494:48b1:a03d with SMTP id d75a77b69052e-494b093a12dmr162253971cf.34.1747576172963;
        Sun, 18 May 2025 06:49:32 -0700 (PDT)
Received: from localhost (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae421a21sm38947531cf.37.2025.05.18.06.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 06:49:32 -0700 (PDT)
Date: Sun, 18 May 2025 08:49:31 -0500
From: David Vernet <void@manifault.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, Changwoo Min <changwoo@igalia.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
Message-ID: <y7bwaqjt43ejjrw4qscabr2ywd7wsang27fl27inkserg2czuv@ocovdxuhdi3k>
References: <20250515191716.327518-1-arighi@nvidia.com>
 <20250515191716.327518-4-arighi@nvidia.com>
 <wdjlm556njybe4bgxk277xj4skryh2qnvd57yoenyf33vd4oyh@gz3ouesvc5vf>
 <aCkStT1QTGWZ3B50@gpd3>
 <py6tcjya3nxhmicvdhytyuu43rdw3j5wjw3bc5j66tsj2ngcax@gzifqgx72um6>
 <aCl1nq0hUJ7IdtC5@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jfxo7rr4plmya274"
Content-Disposition: inline
In-Reply-To: <aCl1nq0hUJ7IdtC5@gpd3>
User-Agent: NeoMutt/20250404-dirty


--jfxo7rr4plmya274
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] sched_ext: idle: Allow scx_bpf_select_cpu_and() from
 unlocked context
MIME-Version: 1.0

On Sun, May 18, 2025 at 07:52:30AM +0200, Andrea Righi wrote:
> > >=20
> > > Trying to remember... probably it was removed because ops.select_cpu(=
) is
> > > never called for tasks that can only run on 1 CPU.
> >=20
> > Hmmm, I think it is called even for pcpu tasks, no?
>=20
> IIUC ops.select_cpu() is triggered by select_task_rq(), but only if
> p->nr_cpus_allowed > 1 and it's not a migration-disabled task, see:
>=20
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/kernel/sched/core.c#n3582

Ahh, right you are, I'd forgotten about that. Thanks for the link.

> > > > Anyways, if we could do this, then we could bring both scx_bpf_sele=
ct_cpu_and()
> > > > and scx_select_cpu_dfl() into the scx_kfunc_ids_idle kfunc group an=
d remove
> > > > scx_kfunc_ids_select_cpu.
> > > >=20
> > > > What do you think?
> > >=20
> > > Are you suggesting that scx_bpf_select_cpu_dfl() should also be allow=
ed in
> > > the same contexts as scx_bpf_select_cpu_and()?
> >=20
> > Yep that's what I was thinking.
> >=20
> > > I did consider that, but was initially concerned about the potential
> > > overhead of handling different contexts, even though these extra chec=
ks to
> > > manage the contexts would likely be negligible in terms of overhead. =
And it
> > > would give the possibility to use scx_bpf_select_cpu_dfl() in ops.enq=
ueue()
> > > as well, so overall I see more pros than cons.
> >=20
> > Now that you mention it I don't see any reason that scx_bpf_select_cpu_=
dfl()
> > couldn't be called from ops.enqueue() even now, as we do hold the rq lo=
ck on
> > that path. But in general I think that if we want to make
> > scx_bpf_select_cpu_and() callable without the rq lock held, that we mig=
ht as
> > well do it for both as I don't think there's any semantic difference be=
tween
> > the two to the user; it's just that one version also does an AND.
>=20
> Semantically speaking, yes, like you say, they're the same, except that o=
ne
> also accepts an additional AND cpumask.
>=20
> The only reason to keep them separate might be the slight overhead of
> managing contexts, but, again, that should be negligible and not worth
> preserving a different and potentially confusing semantic.

Yep, I think we're aligned.

> > As I mentioned in the other thread, I don't have a strong opinion eithe=
r way,
> > but in my opinion it seems more consistent to move the extra context-ha=
ndling
> > logic into scx_bpf_select_cpu_dfl() if we do decide to allow callers to=
 use
> > this.
>=20
> I think I agree, I'll send another patch on top to unify the two kfuncs.

Thanks, Andrea.

- David

--jfxo7rr4plmya274
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCaCnlawAKCRBZ5LhpZcTz
ZIN5AP9UFcuubvdYtWvbeViekrycobOfDiVzTJuVHx7x8GFpzAEAwau8OeWdTdlw
OluD55/UwX1SWHmxLASgQvILKcUtxQs=
=Lxmt
-----END PGP SIGNATURE-----

--jfxo7rr4plmya274--
