Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7584431
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738259142; cv=none; b=WiRTmxJKG/t0F6bE33veJMrqzL6ztag6jT+eO82NKN1fwWOdWiQVKTxFHbbJXdSV1Kr1WwpxOxFoD/OTy1BOCyKcijzZuM+4lAAXBdRSTenYjLc2kjDzYrxyGdn6NZLYibI/7cdgzymCuuHZk8AwmQoH5zm9hYlyh6yVSjRrbZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738259142; c=relaxed/simple;
	bh=EVrtNTsPO/P2O4DvtiGaiSzdL4nRi6J2mKnT4zGXZjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRkaF3SrwOb3BaHm6fhwzh2SqIoBlQ16bMUQ5LQPHcuX6CJui2Axd1qVWnS9n0BxmL4wV8RO+MUESovc0IcgpNSqunV6XJ21GwpwBU5+YOi41TJv2vvuZKHtf8kAhIdIpgi1KlzudkjdtI4pIP52hZ2IWPzhUBnzBf+6QRtmmH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WRb3rEUF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WRb3rEUF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4363ae65100so12925935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738259138; x=1738863938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6EgpIwGsn1WWtOnlk05/NPJfqorVon4W4KT22F+TzpE=;
        b=WRb3rEUFmjbymaL5LslFDaW0OoamlbEjQTlsMzTmopK7t1xptwIDQYFCIkzNcjWQJa
         kiu00H+cqUA3fIPd0qVQrYGsd3ulm1pUbtQiPEfvX3mbd3A6G7vNdj0ZIXaAlDBZNITg
         mt9EM2iSDZReNGaZJ3B57BWQlP7wgg5yTJCPWHZ6brgzTs6Xuv1+r4DlzbfKJZAJvrKJ
         0ynu6QUNWv/Ph5LPpYDqhAGjdYXemBB/0KdC5xX0eCiWS3+fCH9jHB/pxi7BFLm35uuB
         fYCfGup9H6msHHUYjmbzyNYQ2WsLeCxrcVNXeY3RRWRnZNVSSI5USOqtaXkvoRF95Jw2
         Bajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738259138; x=1738863938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EgpIwGsn1WWtOnlk05/NPJfqorVon4W4KT22F+TzpE=;
        b=Yop8SjWql4wo7tVwD27hxHKITUFhszwJ1rxR0KY9g72Ag2CZmD6/JpVmrlPfooFAP7
         C3kuiHP7LxOkIIRK78KuxCuWrnseva0t1WcrUaQyq4nUqtJ2ufukQcoqOD6ElRGk6NoL
         k8sPlsRsYG1zdifrvBGwSu1ml7kskwtjiezyzDdKCvgKJ/p2FmXtqWAFNPHv4hhQfrT8
         P1ppaAMCGGKPYmb9T+o/OQrr4+TBNUMWjoQ2lf9OL/Hg1HeSEoMf2fB54cdcgkt5LgXO
         sLdPdKboHfNW6UFYaNgzBdfaR2fiBMozvJqVHiX7HpVEirX/EnCY62Qnw1790HS68KiC
         O4MA==
X-Forwarded-Encrypted: i=1; AJvYcCUm5vRYJ0WjctR7HEqWnPKGESes4WQvY8JVVk1K8W6VQftL7LvbowKyJZElxMewsN1TsT8+JL6CfYGc/SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY79ZUpdpDVjUElnK99JiHFF/5INngUL4ospGmetQLb7I7UiGa
	TGQhEi532Tp6CcsUqFHWMNqzSDpvfmctCoQ63ptf4iyM8dreQQqzWTkij80el+A=
X-Gm-Gg: ASbGncv4gwcup0EWGqcZIAzKYQk7p52y52o+CTpMw/8PBGWa9Ur8l5eCYnyvqky4wwM
	qOPrEU5h1/MBq5fiiURPuxNX6LHfDC6ajT/gHN0VpSlOpeEQxnX+ODKTfH/iswJBfVYeIWiGPqZ
	31Xnp4iJdBjmxSzXTKOH942ELGvNI/UCn1kxj41tun6n0iurZLKRqNwNu8e8+8jJnrIXTzhlanI
	eGuwDZbmP685HZNtTCbjlstrbwwtfVJU+Aj8/GJP9aFu+PbBPskOwFn5cBVkok9SvcqvcSt5dA6
	+cr7axll7GOBIQqlfA==
X-Google-Smtp-Source: AGHT+IFj8MDsjH+8vES34DECS+Nvk4kyesL/8Ep1onP3XcXT1XH4h0vd2HbX4C8Jynku1M9x3qyrng==
X-Received: by 2002:a05:600c:3b8d:b0:434:f0df:9fd with SMTP id 5b1f17b1804b1-438dc3ab58bmr88690115e9.2.1738259138481;
        Thu, 30 Jan 2025 09:45:38 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm31400035e9.28.2025.01.30.09.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:45:37 -0800 (PST)
Date: Thu, 30 Jan 2025 18:45:36 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: brauner@kernel.org, stgraber@stgraber.org, tycho@tycho.pizza, 
	cyphar@cyphar.com, yun.zhou@windriver.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pid_namespace: namespacify sysctl kernel.pid_max
Message-ID: <bnxhqrq7tip6jl2hu6jsvxxogdfii7ugmafbhgsogovrchxfyp@kagotkztqurt>
References: <20241122132459.135120-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jmeexeaauvphfbm3"
Content-Disposition: inline
In-Reply-To: <20241122132459.135120-1-aleksandr.mikhalitsyn@canonical.com>


--jmeexeaauvphfbm3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 0/2] pid_namespace: namespacify sysctl kernel.pid_max
MIME-Version: 1.0

Hello.

On Fri, Nov 22, 2024 at 02:24:57PM +0100, Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com> wrote:
>
(Sorry for responding only now as I missed this until I read v6.14 news.)

> The pid_max sysctl is a global value. For a long time the default value
> has been 65535 and during the pidfd dicussions Linus proposed to bump
> pid_max by default (cf. [1]). Based on this discussion systemd started
> bumping pid_max to 2^22. So all new systems now run with a very high
> pid_max limit with some distros having also backported that change.

Yes, multiple [1] people [2] proposed even lifting the legacy limit in
kernel directly.

> Of course, giving containers the ability to restrict the number of
> processes in their respective pid namespace indepent of the global limit
> through pid_max is something desirable in itself and comes in handy in
> general.

Yes, this is what pids.max of a cgroup (already) does.

(It is already difficult for users to troubleshoot which of multiple pid
limits restricts their workload. I'm afraid making pid_max
per-(hierarchical-)NS will contribute to confusion.)
Also, the implementation copies the limit upon creation from
parent, this pattern showed cumbersome with some attributes in legacy
cgroup controllers e.g.  it's subject to race condition between parent's
limit modification and children creation.

> Independent of motivating use-cases the existence of pid namespaces
> makes this also a good semantical extension and there have been prior
> proposals pushing in a similar direction.
> The trick here is to minimize the risk of regressions which I think is
> doable. The fact that pid namespaces are hierarchical will help us here.

I understand it is tempting to make pid_max part of a pid namespace but
was the overlap with pids controller considered?

I'd consider the alternative of relying of virtualized PID numbers in
pid namespaces with appropriate pids.max limit and numbers allocation
strategy that would keep PID values below the limit (i.e. taking the
first free pid number in given NS, actually I thought it is already the
case but it doesn't work like that (when I try now [3])).
WDYT?

TL;DR instead of getting rid of the legacy limit, it was further
extended to pid namespaces because of legacy workloads and it (almost)
duplicates existing mechanism. Can this be rethought please?

Thanks,
Michal

[1] https://lore.kernel.org/all/20240408145819.8787-1-mkoutny@suse.com/
[2] https://lore.kernel.org/linux-api/CAHk-=wiZ40LVjnXSi9iHLE_-ZBsWFGCgdmNiYZUXn1-V5YBg2g@mail.gmail.com/

--jmeexeaauvphfbm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5u6sgAKCRAt3Wney77B
SQWbAPsGFStp0GAzhKCfkvSpQQ8sj6799UdLZlbFppMcphp8ygD/evJePd9Dzg4F
E+bGNE3QDDlYpUWCwfhYrnpmASxCGAc=
=5Pav
-----END PGP SIGNATURE-----

--jmeexeaauvphfbm3--
