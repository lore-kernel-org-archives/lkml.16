Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5398F20B22
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116762; cv=none; b=U90E5nLY++qSuaKagJZzoW6Re2aaKuQIfSsI8NA2LK28aFPoOfGOlAlQTFwzBpuE+hyeigDS5oxCXXOz6SaQS75LowkvWEfV6vgx03/ilSubwszHRdnTEiJ5gWowpnl50gNqylS5+NTQcu/kmQ4LsIVdA4M6HwHiX+cwMx0l+zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116762; c=relaxed/simple;
	bh=604HNf7UlClQFzx0yTPzgoW3P7AHHBZFozvDgSJXS0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxV15Mkr1DaHQy59YSsJhXdCAi7gxWJFIyF+8YhkdrEwIC4Bs8RuAhl2Fg6+IXpxMZE5QhdcTLeS6kZvsNd+HfE+WvwiXYwfVFcobLUm7XsB5EXxjAKzXGSeHNeEiQZ2aT9F7s33VSK7nqC89jJvfH3VtrKkJCQFHlrzawrx7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fsIgkseA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fsIgkseA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so594376f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 02:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749116758; x=1749721558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=604HNf7UlClQFzx0yTPzgoW3P7AHHBZFozvDgSJXS0k=;
        b=fsIgkseA9jD1xx/ouTUFIBBItOUHV3mExDufCzzBDaDpsaZ3sBLbn5Nl4dalR2w8iE
         7dMbVkAAH10GqsCm1Y07YU7iWVHjAIFngNJPN7a7BgAmwfSy7PEyKQb85/wGQLB3PBhX
         LXaAaQK2TjDMqZrBzboqwpyEchVL0Ysu112iAxxeRGLBOVqWHpZ8S0r4T4tSfRANgxKa
         9vxcURJuhnYoV9K/nkqBZfygFCsS+TKfFMEreJCF1wjAKV3oxLRrgLEIpYxv5bk21ZTG
         zi++LFqgCF9pSV9GHXnScjYVxLCpq0VR8B7gXCv6+RsjsP+YqZCEwun7TUCG9kZ1PH45
         V8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116758; x=1749721558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=604HNf7UlClQFzx0yTPzgoW3P7AHHBZFozvDgSJXS0k=;
        b=iEu0crOw68RmDBSrfn2dwANRhLhyhXNMYzdXOKMC9bFLLIQEyZyTRXl4K7lWOfMg6p
         UeetKx0T1C8o+UEe1TOyn2qFAaPIsBc3/c8kqmpfiP8rN4kY7ts7cXdahR8zCjHh9CgQ
         Evbtrj1kwcbEtAI9BfYOy5hxmU3nKFJ4ymsh6KI3vjSvdV8o+eGhxF0JqeBHRDk+6mrj
         uu6NnivXeq+/B/F+8xM22bM5vVo1G+OnPi8/DRiCtSdDJzac55L0IJZ9WTKnSixnqDJg
         TegcULa9vjXLrODGNQvX62sB6sCwCvvU3pff6S1u9y8cXOiq/QD32Y7HnYQw+/cdje5U
         pvBg==
X-Forwarded-Encrypted: i=1; AJvYcCXl4z5mJD7hOmRfxP/vpXXHT4qV8edHKkLTFPriZt6FECwmnDzrwcTlycgP1+kQpS5vG61Y3cbhnAQuIGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHo6I5boMVByizvF5YP6jhpx2SQvsRUUBLQwWsGBbJfIF/FXNz
	XpHpjNrcsQ//FSky80Dq7Ylcu2gh5XPpo5Y8f5CtUKy/6B9BvGqtgaDTYWlxDlSiOFQ=
X-Gm-Gg: ASbGnctPSpJ30R+yAM6m2TAj0znlI2YJ6UXSX8azH+onVu/2S5vfYAaBVTiAF5dvDVs
	R0Fc14XMCVKI0V458mdPYqNA1/hL1+5Hf6q/6kphsVis3ZPdlosA9cbpRdzycmtcS8nvmupVW3b
	YTabL2b0bGO71Pn7A+2AOI9HI01gvnD5n8nVxs3R1X7vZGozQNTlZTWPpsqOtMUUVxtWpRbW+eq
	p5X06cTr3C5RpMa4L4InL6d8mOtzQJSTwIQFe/CZKlBXu5yfs7PLN7zkFZNWL3qD7zov+IjN6K+
	qWtKc3m+EQyPVYnAL4JLMNtGps4hAOQZmcceZ0oFvv5c/wL8lI/xQRmLVIeo42EM
X-Google-Smtp-Source: AGHT+IEag34AytathBayu/Y8CxhAv38XZqHMCx2v9NsF24iHtnlbNHPubu7RDxi6AKmu9nvDIgxx3A==
X-Received: by 2002:a5d:58cb:0:b0:3a5:27ba:4795 with SMTP id ffacd0b85a97d-3a527ba4a2emr1593144f8f.41.1749116758550;
        Thu, 05 Jun 2025 02:45:58 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990d3acsm19034065e9.24.2025.06.05.02.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 02:45:57 -0700 (PDT)
Date: Thu, 5 Jun 2025 11:45:56 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bagasdotme@gmail.com, llong@redhat.com
Subject: Re: [PATCH] Documentation: cgroup: add section explaining controller
 availability
Message-ID: <mzki6zhrnxdvuqgu56rztrkw473u2r4uqt5mu3t3nv2afyhaub@4qneqmlxgwog>
References: <20250604054352.76641-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zij33dnokk3rcpgl"
Content-Disposition: inline
In-Reply-To: <20250604054352.76641-2-vishalc@linux.ibm.com>


--zij33dnokk3rcpgl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] Documentation: cgroup: add section explaining controller
 availability
MIME-Version: 1.0

On Wed, Jun 04, 2025 at 11:13:53AM +0530, Vishal Chourasia <vishalc@linux.ibm.com> wrote:
> +Availablity
> +~~~~~~~~~~~
> +
> +A controller is available in a cgroup when it is supported by the kernel and
+A controller is available in a cgroup when it is supported by the
+kernel (compiled, not disabled and not attached to a v1 hierarchy) and

Maybe this point about v1 exclusion. But altogether this section as
drafted looks sensible to me.

Thanks,
Michal

--zij33dnokk3rcpgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaEFnUgAKCRAt3Wney77B
SYD2AQD1/XItHwQUhYR860OS8RuDmuzgC+aYYTBMu01ywJEKcwD/TZxY1pEcxg5D
wXa3RXxszLiTtREuJrTuHaTRsQ2C7QI=
=69vi
-----END PGP SIGNATURE-----

--zij33dnokk3rcpgl--
