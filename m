Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574361607B4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526777; cv=none; b=RJrd9D59slR6iqfD/EjyaDNz0xbbRwxuobr320jTBC24diDoHYTmi7DhfFXMl+SJb4+X4qdfhdJPXmgJRJFSUCMzvaXwuKFVfgm7ewR9gmwv2Hm8uiNlq6wUdWrCGeUUkQ6y4IRzdwQEPxELddnaBqccK6Zh5w1e6KjfLB7L16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526777; c=relaxed/simple;
	bh=8j9csT7T3zFsxrVa5MUSaZdxw5xmhTU1QQJitylqOeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRBvbzhTK5l6nEkGSuuVyeNlI4tZVtQoSAX8C7Yw8VKkuU6iif+Rq5A53tnXzcfXDQ3Wf0SOIZTP+L2ljHWFIXpqxt0MEsumFT3ZPoY/8QJfyzshKOacwsYuXIm8J76og4ZlEtqAYFB7BVNlQTJAdTUo7ipqhHtkEaK2uigg594=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NcX85FE1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NcX85FE1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c2688619bso486630f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743526773; x=1744131573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8j9csT7T3zFsxrVa5MUSaZdxw5xmhTU1QQJitylqOeI=;
        b=NcX85FE1/CpHE6BWCyrLlqWi8jYUsrkGVmUdZOpLvhUZwc7ArFAV7Kdb4cuAu+9itT
         FPT5jUyXzx5A0ROWQK8as5XMvvS/a55CEJsK34WW+AIf/LZTjVNA72sr5F9mR2GfB+aF
         WCiTwvvhZ3lAmuHKfVPUC1P7hHwDldIIeAmD+mMOGItrtAgLuWODnb93mRMu86B13LXi
         pRErUxNsK/wFU2IVI4xLEHe3KKJGdes7wHT9Kxo3VkUOIrFTyOUgOjP/N43+G2YIlfuV
         vBPn05V3QXR6SzUBacXNOycDLiFLm0vUHig7g65vmExe33YAQNk4af1MddVbJtA5eFfB
         VG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526773; x=1744131573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8j9csT7T3zFsxrVa5MUSaZdxw5xmhTU1QQJitylqOeI=;
        b=NB4ESz4IRIj4jxbvOM1BUlnEhaEAuw4G6k5EcLnXYBQKekNA1X4Q/xIIh/uNNYsSse
         J/fwZGJSiRf3ey8GLxEncymb77Gjk9NovYxkm2lTFMOPI/OmjdN95V/xCkN+Jg31gMFq
         9cn4TGjnLuspXfimqPfVO8O1ZZkYcfFk8qQ2k8aq5Zau5NaXqa1QW8cvNOYYs0+C90Kv
         mCuqTGJ3uelYOrvRxusbDIzpMjmCBxA8VXm4yhusau9PD3quL3TC3wbtd6zeGmXCG1pk
         o83IaMtn53oZ+/vQSa1hYQBZhzC8Wxj/ot2zJr7JqISfoBsnlEPQfO+U3PvSednRaoT7
         VHsg==
X-Forwarded-Encrypted: i=1; AJvYcCUBS0NFY9aVS1dLpyxJ9q0vhLA8mDpPKDeU6virPyyVfIXiyaaCRcZaaWf2Czx+nIhq4kY6nLeLga1I6OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyfuRVQKZC39WsDWA2c7g+j+ddDf+GQZVXoBeiWW7jM7os/fr
	UbKjw2MvRKE2LfEj0DGGpg4nApDlnA36Tf7/PASVdPd6yrvFg6AoWvtUAYtASNo=
X-Gm-Gg: ASbGncvreocPQpMlf7kbwC32P0sdEYN+ddmdzaQ+8x3+aZM5MccWygs+XJ8dwoWVmht
	F1dJ1qEc9o5K/7NOrW435lI8fxItGK3H+Oxbsw4Pu9fOISWy6PkJpZNuOLtarf/APdWkd4id479
	GrgpRv+x39R0WF0xn7W86kJ+ZygVF3KyoGHjqSur/3UYOAx9vmXcP/I4pmg0HfS9ZBj+wsUb1zU
	xfWGLc1ihYJkAudQpDQJP6RiOvxZKrozEEGHSCGqFxBRrB+2brNQIkT2EEtGAtpEnqXzjNWnbgt
	B2Z0RpI996Qn/QmVuiYiIax9RG4c5fX9NbF8JZzJuKxosX4=
X-Google-Smtp-Source: AGHT+IGmGuZ7CH1h/J68rAu6ViUqsODA1aGv7bhMu084X5Uyc7AHBFxfQpvF9waMpSU3HwerGbLZqg==
X-Received: by 2002:a5d:47cb:0:b0:391:300f:749e with SMTP id ffacd0b85a97d-39c23646f8dmr3602896f8f.11.1743526773618;
        Tue, 01 Apr 2025 09:59:33 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe678sm204228865e9.20.2025.04.01.09.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:59:33 -0700 (PDT)
Date: Tue, 1 Apr 2025 18:59:31 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Greg Thelen <gthelen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet <edumzaet@google.com>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH] cgroup/rstat: avoid disabling irqs for O(num_cpu)
Message-ID: <454qatlzbtbfsh3vub7qrnropuyux4lxsokxt72fbiy2fpy2pu@dmfi22u5d64k>
References: <20250319071330.898763-1-gthelen@google.com>
 <u5kcjffhyrjsxagpdzas7q463ldgqtptaafozea3bv64odn2xt@agx42ih5m76l>
 <Z9r8TX0WiPWVffI0@google.com>
 <2vznaaotzkgkrfoi2qitiwdjinpl7ozhpz7w6n7577kaa2hpki@okh2mkqqhbkq>
 <Z-WIDWP1o4g-N5mg@google.com>
 <CAGudoHHgMOQuvi5SJwNQ58XB=tDasy_-5SULPykWXOca6b=sDQ@mail.gmail.com>
 <3mc7l6otsn4ufmyaiuqgpf64rfcukilgpjainslniwid6ajqm7@ltxbi5qennh7>
 <CAGudoHEF+dZmkoOJ2O_iaNEo5pR=BAbmYU8zuzKnfXcdKysj3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ckjmqmzjeeu6jrji"
Content-Disposition: inline
In-Reply-To: <CAGudoHEF+dZmkoOJ2O_iaNEo5pR=BAbmYU8zuzKnfXcdKysj3A@mail.gmail.com>


--ckjmqmzjeeu6jrji
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/rstat: avoid disabling irqs for O(num_cpu)
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 05:46:41PM +0200, Mateusz Guzik <mjguzik@gmail.com>=
 wrote:
> Is this really going to suffer for toggling every 8 CPUs? that's a 50x
> factor reduction

As per the original patch, there's ~10x saving in max holding irqs-off,
na=EFevely thinking aggregating it flushing by 8 CPUs could reduce it to
(10/8) ~1.25x saving only.
(OTOH, it's not 400x effect, so it's not explained completely, not all
CPUs are same.) I can imagine the balanced value with this information
would be around 20 CPUs (sqrt(400)).
But the issue is it could as well be 4 or 32 or 8. Starting with 1 is
the simplest approach without introducing magic constants or heuristics.


> the temp changes like the to stay for a long time.

That'd mean that no one notices the performance impact there :-)
It can be easily changed later too.

> that said, there is bigger fish to fry elsewhere and I have no stake
> in this code, so I'm not going to mail any further about this.

Thank you for spending your effort on this, it's useful reference for
the future!

Michal

--ckjmqmzjeeu6jrji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+wbcAAKCRAt3Wney77B
SUIHAP9R7MNVsOC2kC8SuClU2Ujt3vNJJBQmJymjTBteIYJxDwEAx6VVMgJxZFnZ
PTvgEioCGVZr8IxxN6gnrY74Paj+OAA=
=gAnH
-----END PGP SIGNATURE-----

--ckjmqmzjeeu6jrji--
