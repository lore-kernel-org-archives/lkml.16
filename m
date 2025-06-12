Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3842134CF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728265; cv=none; b=tfbQcPxVd/G8jrDD1j6NkBp7dzozZwQ8dYxEstMVCrcPb25paEa6iouGpHghhvPG+muNtCibtGWJhpiXl6qFZP6BekT8BEpp+NdzMBxaAkEiYiUhcrEhuKIvZpfOGEkPVmKGnUnV7h6wCFBt+6cYz5igPbbLCtTlEo6fwKKPU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728265; c=relaxed/simple;
	bh=ajEyLNa2aXTQ1Sza2yCrahNAvJ+6C4eOyWt6Yu2DxWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unpZO1FdXRV7YwL9bulNAgeQZ9mCNbwOvatf6A+n6c5EEttSu5lcHviW2RsHfq7JftY0p0GdcVqwXXhbpAMb0eu/X9SdSr65FYfBUkXocMymlUsI0jsE23u/60WPUbRgUhac4M4A54DvwlyQxVJB1l4Y7cr4Jg6ZuZedodxQ2XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dfkYSN2y; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dfkYSN2y"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45024721cbdso6995625e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749728262; x=1750333062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k9QrilPSQvbXfJ08sUe8Lfon4aIXPuasH11CoOCyPp0=;
        b=dfkYSN2yvqVW3l02TcwLbErc1oXjLmfPN07nwhxVXnLI7ens4ibARMbWalBjOyMQBs
         VIvPMJMbnrNhEwvy3H7SEIKk4QHp2VNV1QAQMMCgaY9/bBfroT1lt5P3KJTLg9AZhhiB
         EsOabCFXbta/L3ZugE0K4LQqPd8azBfDuAj2ck/4XBKOs0o5Oe7v9G00MqZvVsTdcF3L
         itS0zBgqn+RJkrpUhqUfPlevFmSYEtDoJQA8OSCjye7rUkl5zox76O1PjOjgioZzld/F
         QcKlE3Tnd9H1M1nL0nffZTVMFheQSnbvJQYge4OCDPjqavsg07sj6iEYftY+0m0kw71S
         Qnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728262; x=1750333062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9QrilPSQvbXfJ08sUe8Lfon4aIXPuasH11CoOCyPp0=;
        b=TVE96ZALmStI4sMxYiBB+XXgbRI9kRBQ/TaKE/QeNdwXNpf+przofXljlNUtSwHiuC
         6gPI7jMTt4SLeX534X1ykLPDZ7RciHYOobcHLGnst2o/faaUaE4A48rSCbjAuCT9hWdg
         FD4ip56F2upjMMzYkKa/xltfuWejxJmD0e1kKKBft+DmcGyTVPCwm86kUR+rpFOhH6A0
         TlgvICrVpIuUp1gQKTA02Yj+ibMNkUMLJxhtA9QmMMdPvLv1RHKW2TgGGCHaTPiGKIGJ
         H3LZOXpuwZQIpbg/82HaXTscaYlp/oPU11WEJm8R/SU9qpEhB1GQMLOPJkYHiV9xE6d9
         wOzg==
X-Forwarded-Encrypted: i=1; AJvYcCXKV0gpOMwZARNH7IGd0j3YI3KdG8qPYYSKr1RG5geGJI83jkiRQVlOFoQ74ZfU/LPMPXnV34cPAg1YnRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Az5+MffZwMczoSrI/i7c3eqks39dp8fS8KwGQmu0jYAAvrJt
	UmqBhZpyFOQUo5P7ZHvhdw/yrlEiWdrWxyOe/NSQXQQ1FJZr4jg7+L1UWBjsVOa7eZA=
X-Gm-Gg: ASbGnctkr++JogVK6u6R6Qq1r/O76OGPKlx50RW30p8KYIbK4mbtG2gRd8r6zl6EE1q
	G/RFlLH+QPlc0rK6Cw24xzDP/Xk++NZZUoSTUMHBkpttKRqFFUUnnpaBSRPDRKdp9X5HNJlUdaF
	dF4P7Vs2hTNkJYjySHyCfNGRK1btQnkk7hCaz7fyZKlxeb3VPlM4TgUGaojLvJjGQJyHwTl2juX
	MIcaNWigcYXTpkgY6CdhIQUKmDug/rMzXSTSWH8+om3uFRR10hWvi6nCJb9BeVnDHNhPcMOhbEC
	JWjENRBNvc0AGtxKMnx65GCLUZWup/eWaHOhu6LMhUJkiycFsWlMx1lZqUq8VJA5
X-Google-Smtp-Source: AGHT+IHXCg3+DiBF83TGwbCmv/kLjdbvxNJQQ6VbyG09B4swehwBIKZVwb3UC55yvD6cNudHR6xmLQ==
X-Received: by 2002:a05:600c:3f15:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-453248c0d13mr64564255e9.18.1749728262073;
        Thu, 12 Jun 2025 04:37:42 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232e4asm17864375e9.11.2025.06.12.04.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 04:37:41 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:37:39 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: Martin Doucha <mdoucha@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] memcontrol: Wait for draining of remote stocks to
 avoid OOM when charging
Message-ID: <hpheex5rheykebhbh4qjqy4jirnrpqvnfahr75cn6p6ob6lo2x@mpdv2yrht2o4>
References: <20250530151858.672391-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oejxf5ik6o3wgoks"
Content-Disposition: inline
In-Reply-To: <20250530151858.672391-1-mkoutny@suse.com>


--oejxf5ik6o3wgoks
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH] memcontrol: Wait for draining of remote stocks to
 avoid OOM when charging
MIME-Version: 1.0

On Fri, May 30, 2025 at 05:18:57PM +0200, Michal Koutn=FD <mkoutny@suse.com=
> wrote:
> 2) It requires specific scheduling over CPUs, so it may not be so common
>    and severe in practice.

This means in practice, there'd be likely a _different_ running memcg on
other CPUs and that would implicitly flush those stocks. I'm concluding
there's no big issue to fix.

Michal

--oejxf5ik6o3wgoks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaEq8AQAKCRB+PQLnlNv4
CKOpAPwPyeKYZIri83c7FJXo++/Yoy8EYitLgQ3Pizu96VuM8wD/VtGjuUchQZcF
sREfNnUzPxFE2xbScKBn/ePHJEOUGgc=
=Uv72
-----END PGP SIGNATURE-----

--oejxf5ik6o3wgoks--
