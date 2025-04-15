Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69231F5434
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733179; cv=none; b=rLsc5JNl0UctNAhaLob3QrknNmEsYnJ0d33VXKy5oqwo1QGR95OaUctp7Q+8ohJA9+Y3A7fJ9aDkHAbX7wGzbPA7LbNICCtPx45kCS9kW8QAcScYwr9AAIdYfUdHvPVqy0ZWFCcfADvdugOXZ/wS/Sgj0QQdalpUGiH1uw/Mblg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733179; c=relaxed/simple;
	bh=hgZy3Bs5bZtFb1xBAHv8Wk2VAlSG2m8POnP/PmcT6P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdDwqPHHUG0RRgp/50ZRl7qnaGVCp0iAuneK0pQmPhiDmfmLMm5EBgeZALldlKItAFiLxurehH/eHGSEghUdwtYWebhymwRoaBwjLXhbmrN1Tkhblejjg/STyMn/2nXIUZcpI1XkufaQd5qIY31sxdXtMqCBX249wzGcVyV5rdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gK7VuYa+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gK7VuYa+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0782d787so41652085e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744733174; x=1745337974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hgZy3Bs5bZtFb1xBAHv8Wk2VAlSG2m8POnP/PmcT6P4=;
        b=gK7VuYa+0pKQ4E+ZfumwQapOyIwoEcOhko7opvwZbU/Er5aCxvmq7iBYGbIEPX4SPC
         1BvVEmV1+UhbXR1Ug6ywIATZbmywzZevnBBorWljaBiM+9D/zdg0OkJ7ExY1/Egvc8p1
         CILBY+toPDLBEPrnUyjg2VJmjxe/g560NxNj1m3QwyPksABbpn09VbuxYrUq8lFJqjvQ
         ikAxo+nWZavShlEk2JCeND19P44mQPKLLiIA0biH/Vx+Z6KLOGXJAUSWf/r3XThgSB8Z
         26hPU9r7JHJUCPdbnjVeSk36G77uwdQDeA7+tTvs3BpRC/yjwi80bfkq0xRReExqT5YT
         ajfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744733174; x=1745337974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgZy3Bs5bZtFb1xBAHv8Wk2VAlSG2m8POnP/PmcT6P4=;
        b=mTiCj/6iV6AeqnAs9uPiKM6ZGBmiZ0EkoA3o35hA7NOUw97zc69eVT+XdoATPjbspR
         VTEb3FORFJAwA/5uRqv4GyI1ZFskkTfNLXM+Ko4x0FdYxFSxUekb6fFn7PoPjU3kJGoE
         O2EBPCocbAjYgR44A2Z77J1k9QIn0mY1PJcYHgqg+QFfgDh14aG7u/0E1FRJUy6RPAB6
         ES8gZ1QILrqihsCrL8mPG0cToxTnf3Wwz2AolyfhjBK8elGnBxyPZtdR3cvH4tqTh4IN
         GiE0CJFZ18KWuuWMAUwRPuXdZGJt6f0yz41/ZuAnp/z/jcCEIHfn0OWoBT+n5Z76w/k8
         JLRA==
X-Forwarded-Encrypted: i=1; AJvYcCVIRM/p+jFKcBESCkw1WNFkFtx4WhaCvMU6UheSUiA/Ral/cLM2nCsB6yf+966Hhk4vrUlUB9JrXt5a408=@vger.kernel.org
X-Gm-Message-State: AOJu0YypwFCYnmp7GXMlZYx6KtDZC1JAV1X9Vw26v8FakqIqYPj3/+Oi
	0DmdJT3GtaCM9z9Bpxd1eor7gmrpSU+e9SiPRVR9ZYCr5NSuOF2NvUtegmwF4Lk=
X-Gm-Gg: ASbGnctdh5V4i6FwO0vh06IWeR5XkQRyTXIGjywWkIkNTzJZIcBgY+inkChjmXj/R60
	4ENA8psd2PMIiQypHb9JQTvB2ewORzo6UrVnlV7jded+jBRDYS6Wo9h/HBt0kx8KouCPHxO8gGk
	MrHvFTGFaZKRa2QsiUYF9A4SMo10KPfzxqWfbdmKENhKCQFm2kJNaN1jL9whh+Fayw1IWrluyA3
	NQm7d5g4ad3MBA7TEoZMNPDchddowh8kTXd6qp9i4v+D1pWKHIvWWP6hlodvPyVUplXPavzlyG0
	4Ee2TL8sCVB4QbS7/fWk7tSDZWcLTjcAe9//MTBSlnU=
X-Google-Smtp-Source: AGHT+IGTKkmP0oe0fauFieWns1mCFUH/1vQsWUwM+pO9VnG6/65IgNgDirpko2Yd+tXf8f74r72J5Q==
X-Received: by 2002:a05:600c:1e02:b0:43d:22d9:4b8e with SMTP id 5b1f17b1804b1-43f86e1f246mr49614045e9.10.1744733173992;
        Tue, 15 Apr 2025 09:06:13 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338db0dsm219073455e9.7.2025.04.15.09.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 09:06:13 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:06:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Tejun Heo <tj@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [PATCH v3 0/3] netfilter: Make xt_cgroup independent from net_cls
Message-ID: <zu5vvfmz2kfktu5tuedmcm5cpajt6dotkf72okrzxnyosbx7k7@kss7qnr4lenr>
References: <20250401115736.1046942-1-mkoutny@suse.com>
 <o4q7vxrdblnuoiqbiw6qvb52bg5kb33helpfynphbbgt4bjttq@7344qly6lv5f>
 <Z_52r_v9-3JUzDT7@calendula>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqcmzdxhrghzvc3f"
Content-Disposition: inline
In-Reply-To: <Z_52r_v9-3JUzDT7@calendula>


--pqcmzdxhrghzvc3f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 0/3] netfilter: Make xt_cgroup independent from net_cls
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 05:09:35PM +0200, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> I am going to apply 1/3 and 2/3 to nf-next.git

Thanks.

> I suggest, then, you follow up to cgroups tree to submit 3/3.

OK.

> 3/3 does not show up in my patchwork for some reason.

The reason is -- my invocation of get_maintainer.pl on the 3rd patch
excluded anything netdev. Sorry.

Michal

--pqcmzdxhrghzvc3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/6D8QAKCRAt3Wney77B
SdAMAQDdLxRxMCm8JCPMZyX9ZYadyzJ6nkt7nq78k1iLIvQDawD+ICbdnSZr7N2t
wIYe9I+drbFtQ44kwYWEDcKUdGL5wAs=
=zr9E
-----END PGP SIGNATURE-----

--pqcmzdxhrghzvc3f--
