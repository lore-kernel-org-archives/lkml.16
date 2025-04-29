Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85792D0297
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928346; cv=none; b=Up4LtNvluh3dOMqPugK1BRqGqNd3h4EG7I+BF4EDYYNXIEOEjDJDtVQ/ms4G88nOCki5hNyXOBoMO6oLj1V46BlRt1ptq6juOst5qi+C7yehn68gxjNOsi3GsaALZhtbqsuV8nrxScioIU7f6iMRjWNS+BWars3BteKWThs4KHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928346; c=relaxed/simple;
	bh=PAAjyCxZGBIUTEBraJHgwf/vjhPZsyRdV+OwUH1P2mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btvs6z3UVORuCkYA9KcnerOZSvd0YerXt8XPx9sWTQBE3b139zpio9kKi+S6X5BFFsP7h68gUcYYYbkf8hrrg9+IB8yF1kCwFSTeNSlqaper+5P6axfWKcrUYgG3chVljikKNP6RwPSjvU0rEoBO0Xquz3f5OZAZ4zBpYU4wog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NKJsXX/S; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NKJsXX/S"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso6589a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745928343; x=1746533143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9r/4N+f+7PaHLHb2f9S5WBuIucietvGqQf43oEfV+AM=;
        b=NKJsXX/S4mQpUzYC8hLgeAoYUivbm85cBtVbnBRHElFO5U8pnqYJ3gzrdErCG2/7vw
         alCkkN5unLXdODOiz1AJojgJANOjE8nQQe4sVH8pHrigW4Mqb4KL+O+kOPYsNsW8x53j
         cXNK7wb+nbrkIkWcszOxzgBpYn1qEIYLt+GguFMb6IiqClMoOkqioRWa/2WarfV2fIeg
         NJKzWA1q7j9L3HyrSZtY05j1LCh0HOPOXBRAZJJ2rG7JNt8dWhgXabTdLzqQw8nfC3G1
         ELQhC7atiF4v2ep+YPIwUR0MEiE5+4YJMlrIte36Cmhl3kduZ3UwG7WDO2trn82EM7SA
         iXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928343; x=1746533143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r/4N+f+7PaHLHb2f9S5WBuIucietvGqQf43oEfV+AM=;
        b=anOpfLOHff6s0WO3TiT2L9/3Kcrq/oy17eSilFKaT/ahFkyIEPOwX/kFH7Uk0NMIHg
         GNR4zVRXXXEUt3fw64WjJpbgcce6EQii1vIBpJfVMuEUkcbLs0fD+E0OaPt/sKpzNVLf
         Lcm5NdiEB5j7W4mmMR2UQoGDVkmyUPXpLRiu31a7Irf13ab8i3dzsxCeSEFfuE1AW5Mu
         Cg3boj+GHwBXUxJ1xAmOJbFxNdzIyFv0K0pqcUozcWkmI6IrlNKlkHcEy/de+A0BaEsf
         PYxQgVzKSKaeGP0h6sgL6nP+kntOAkk7BxXm628PDVnuysW2uVJoUTAnr319P85oHH8K
         pMlg==
X-Forwarded-Encrypted: i=1; AJvYcCXSaC9Jl4ArP6/K51391xYSwopGQWNllmxxu1HPiInkhmsSTWEHjv30vAPzJW/eLM0/oxfM9IpCAq6iDyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfHGYHZczpJfN4bEqboLFFwH9AeL45QzIKD8Y8WSgOc4lPuRx
	f3J2mJ2K3hEyGEOJinV3PZBBGTLI67gdVC/6IDtYXv09ZJOwiEYKrRfKs++vKCU=
X-Gm-Gg: ASbGncv6lIR9snu6OcgcqRWJSMiEe2TW+p4XWJhMgckwldPi2t/K8/ghMCECR/RDAF5
	feTzr2DZ/t4MrT7Bvg2tdgRWGfZu2ekYdDPTQvh34b1t2qbga3QdKT8qXnmzlqCvAtqoV0OqMgP
	yO1VXzFkfAqp5Yfd5xF8QTjQwXxPSe5k8WPBCykTYtziGRx/f9aEvBzjDDp+YF+l84YCKvvFE85
	Xd48wvvZERjdsWxKhjy5CiTtcd3uhi9h+Iypm1VyuUwDSC7mbAmcCwHM+5eMQQWCJrFazyHF54s
	kQj/HypFoB99ww0Jvfe8OaOjU5i5XlcdsDcszrkWQEM=
X-Google-Smtp-Source: AGHT+IHmuO1Gx5rMmBnuAer3bucqMZAIYa2NRJ4DgmXE88/sxb/L8pifgAqHItutkUFGsnCnWrzcmg==
X-Received: by 2002:a17:907:1b0e:b0:ac2:842c:8d04 with SMTP id a640c23a62f3a-acec4e0506fmr403932166b.17.1745928342825;
        Tue, 29 Apr 2025 05:05:42 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e6a05sm778144466b.57.2025.04.29.05.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:05:42 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:05:40 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, David Matlack <dmatlack@google.com>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] KVM: selftests: Build and link
 selftests/cgroup/lib into KVM selftests
Message-ID: <gbuucm74bt32ozem6o2p2kd26xwnwpizbk5ihrwr2swboblfio@jw7pilz2pjjr>
References: <20250414200929.3098202-1-jthoughton@google.com>
 <20250414200929.3098202-5-jthoughton@google.com>
 <aBAlcrTtBDeQCL0X@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="52kytrr5hdefn2m4"
Content-Disposition: inline
In-Reply-To: <aBAlcrTtBDeQCL0X@google.com>


--52kytrr5hdefn2m4
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/5] KVM: selftests: Build and link
 selftests/cgroup/lib into KVM selftests
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 06:03:46PM -0700, Sean Christopherson <seanjc@googl=
e.com> wrote:
=2E..
> E.g. slot this is before making cgroup_util.c a library?
>=20
> --
> From: Sean Christopherson <seanjc@google.com>
> Date: Mon, 28 Apr 2025 17:38:14 -0700
> Subject: [PATCH] selftests: cgroup: Move memcontrol specific helpers out =
of
>  common cgroup_util.c
>=20
> Move a handful of helpers out of cgroup_util.c and into test_memcontrol.c
> that have nothing to with cgroups in general, in anticipation of making
> cgroup_util.c a generic library that can be used by other selftests.
>=20
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/cgroup/cgroup_util.c  | 78 -------------------
>  tools/testing/selftests/cgroup/cgroup_util.h  |  5 --
>  .../selftests/cgroup/test_memcontrol.c        | 78 +++++++++++++++++++
>  3 files changed, 78 insertions(+), 83 deletions(-)

This reorg makes sense to me,

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--52kytrr5hdefn2m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaBDAkgAKCRAt3Wney77B
ScQbAQCK3C6jnGaSeFIPYQcKO55mROcnzexc8fp4M92Ozbpb1wD+PM1uo+nC/F3w
HBvm09u1g8FO4HnRhVxrvuDQzXj+pAY=
=SDcj
-----END PGP SIGNATURE-----

--52kytrr5hdefn2m4--
