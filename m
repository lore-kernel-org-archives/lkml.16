Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E146D223DC6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552798; cv=none; b=lWi852esVOb721kBMrsdfYSZylPy68yHmAF03pg/wD8N3Z33O5X05w7O9rV09ZUz/eAKlseRdS4N5iuYqRwdVu3Trgk4bGNYZnEI7hqoa35WRpg+wna3f9D5TxdFELXf8phojckSMwYi3h5T7kFIxXMgTZNddYjEwLY4l1oPIGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552798; c=relaxed/simple;
	bh=kb9FsIXnJ7Zs65QK4qmWfNoy4AKHnchxO1dJYLhVcQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0HW/6Xw9/hHOXs2LylC1ssK3W1sBHjuVHG8S1ZkVj/6vQNm3tReWZXjwgv1K1sqNPgObeLBjvIJg8/XG+yUlVAJ9QuwFYx3/Q7xrgkRLUZp1xwvt2V7dfB0nWGXyvs/aGoHZeq5Xuoq7pJGrpvMuEPZWtzS913g2cnLXLtx4cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WLkKEXua; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WLkKEXua"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2189909f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749552794; x=1750157594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kb9FsIXnJ7Zs65QK4qmWfNoy4AKHnchxO1dJYLhVcQI=;
        b=WLkKEXuabRnRgaTAg0hp/hvj+4YP56gFPllPTFAXoP38jiW2lPtjAIb4vMAQNFEBxT
         iODKUZWkb8V1b39EQoEZRTLRJjOO8AC3SaAOPMe2j4t2wOa5rxNVuAdugv0xtSADxDE3
         cBVZ+Pn5Bqb7RScsyDb0tET9mRI2YllCmaSAe9iseIsZsG8ullsYqRXwYdbXfWYE9aOX
         CsiuX/5yigp3VIKL2jk5InVty1ZYXlRuh+vg8FG3iA++ogGSG0rYiNPIYgEJ+VeQWT4T
         9ad1838FeiSQBf9hQjVoG5Kr6JMJbFRbxMsvPqA7P5AejQ97oBX4vCqnM/q4fQ+d7aFq
         5bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552794; x=1750157594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb9FsIXnJ7Zs65QK4qmWfNoy4AKHnchxO1dJYLhVcQI=;
        b=ZMi3oUf9V6htS3n7eQaq0lPgsno3Z15U3VGoZb6r0JnfuHY+PB9pu5LYDbcNkwfyhl
         nz807hxTVHBX1h2l75SCzFyCDHeVt0Q5h+0+EE/1LZ+0AtwnC1aZAf7jLMDqeMQCxf9U
         FOxrhwc+W89yQgP+GfAxaWD5UOD8t3TBCm3zx9ATqvFZAzaJbjv+L/Tn5LOh5gEhFiJ7
         hYR9q6genl7jeyQ3FaGuu+dGze166C/c5Qj4KE+mG/7/s5LzsinKJsg8Dj9H2li2ltNY
         2gWifIIKFdgAZIAMzBL5hBy9Am0EZZCe8UHnES49JFVfbPg+n2JfyaugU/qBFn5ikXJe
         EYsw==
X-Forwarded-Encrypted: i=1; AJvYcCXJfBGoK15rpFVZK+W+S7l0Y2jEq2ga6dO9bxp5vURIlrko+HIpZSLybL+0RmjBH/ZLGC9cEDuZqeA3UZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6yVKRjfDz1ZLpd7siAzmwo4MI8iPOfrg0b9DXJSDXfuZU4Z0
	++kidVmAGX0Iqs2cIGjdpz6aR+2ds0VthyjqDlb4yDgKjpVipiAmFqNGWydlFhrxVYk=
X-Gm-Gg: ASbGncutVDpXLeBqwmnGTElH/69e39G0k4NyGt4FP+VVmqeFpEsv+NBNXEmgwnKQ4CM
	5uDTOztNXYrxz4+Wa3UyJe3t6ztWEapuxIoiW2ERyozpan3t1uduSsSIqvfPxzR1FYXOzfqKYIJ
	atCWL9uN9AVen5W2YtSZwsyVBCz+reIFUX5kP3znWrBntCy/+mYzjjoBfmQJsMZ9viM94+mNfvy
	E8l5pEPJeSD7410UWboFG5/LU38Fe27O/OJS1pvFt1aPBRG+sM51rJFCEYSsG8jVlB32JGd3/lo
	0EMPa+y8brbRwTq4qIBy1NTfkCIlUHqf+CI9Wh63JwZrgTiY8BQoEokU8BQ+CV8M
X-Google-Smtp-Source: AGHT+IG7aHxSVUxADrCF91C0+/IRFPYkWaPeRGLciBBd/1yGe6tbmHfOBJniaA2BzrZmLitj8vaxyg==
X-Received: by 2002:a05:6000:2403:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3a55229bdf4mr1373065f8f.38.1749552794192;
        Tue, 10 Jun 2025 03:53:14 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532461211sm11767637f8f.86.2025.06.10.03.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:53:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:53:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Harry Yoo <harry.yoo@oracle.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH 0/3] cgroup: nmi safe css_rstat_updated
Message-ID: <rtgbcuvajr6oql5xfe5qp7cman2ucatnohux47upknwfoduc5q@63ywqn4tg3jr>
References: <20250609225611.3967338-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzf4dlmbab6bfzcb"
Content-Disposition: inline
In-Reply-To: <20250609225611.3967338-1-shakeel.butt@linux.dev>


--wzf4dlmbab6bfzcb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] cgroup: nmi safe css_rstat_updated
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 03:56:08PM -0700, Shakeel Butt <shakeel.butt@linux.=
dev> wrote:
> BPF programs can run in nmi context and may trigger memcg charged memory
> allocation in such context. Recently linux added support to nmi safe
> page allocation along with memcg charging of such allocations. However
> the kmalloc/slab support and corresponding memcg charging is still
> lacking,
>=20
> To provide nmi safe support for memcg charging for kmalloc/slab
> allocations, we need nmi safe memcg stats and for that we need nmi safe
> css_rstat_updated() which adds the given cgroup state whose stats are
> updated into the per-cpu per-ss update tree. This series took the aim to
> make css_rstat_updated() nmi safe.

memcg charging relies on page counters and per-cpu stocks.
css_rstat_updated() is "only" for statistics (which has admiteddly some
in-kernel consumers but those are already affected by batching and
flushing errors).

Have I missed some updates that make css_rstat_updated() calls critical
for memcg charging? I'd find it useful to explain this aspect more in
the cover letter.

Thanks,
Michal

--wzf4dlmbab6bfzcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaEgOigAKCRB+PQLnlNv4
CCyuAQDQlmXIUda/Zc5IPRULm+/1VBWxj2JIW9BfHZ2Iz/EeBwEAyJpChyqsQ9vH
QuSlPcSnjJUVEQ52+dsLL5MHYOTnXQQ=
=qmK3
-----END PGP SIGNATURE-----

--wzf4dlmbab6bfzcb--
