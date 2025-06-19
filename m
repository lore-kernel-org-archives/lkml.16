Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1320B80A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335041; cv=none; b=lI4RcslJ0B0iN3rKq9AMvMxXEoo3sy+LbFF0jYA10ouKAz3vWqofa86Y6i+RNOOO4CbjKohUp/C62w1Bg5CvPvICVigB9nJXBJ0qwiNVVHTAeZ/yEXTW9CDdG/Xdw8zwil4HNqlb/f7dfANCCzOAPqF5HClFAoAJPSqsApsgBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335041; c=relaxed/simple;
	bh=Z1k28oh2bsjAp3J9sxhgKELPLL0pOh9fG5HeC1Y+BL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvaYu4MVZjEiP4E3GxJBkk6keA4GcYiqjD7KeTWkzywkHe9GntJlrAM7++ZSjNTKyKyt45MaV7ka7QuX0B4bAkLnNn/90lVUbXwLGtGxSmgw0eB6mOPCpORohryJmVGxPhYO13PHwgW/4QfdKiZu01mMeYd45F9dkMw1TizcWHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XyceUW0V; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XyceUW0V"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so4334875e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750335037; x=1750939837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GdGldtwlWNchi8rv7SkT/y3UPzEmCjdby+cLRpS1Y/4=;
        b=XyceUW0VpaBj4ARN4LGjcsntClzLyhTeF6XYjRnBXg/ncvFVA+rX4G1hPZZQZVlbKn
         rBazKOWVMRC7YeBPdTnE214kL+1uzucYANZTGNjXccA9aFkeo3P4zCnaeASr6rNW0hQQ
         gNITWkQAe4W7c58IIPOyxYbFo4DNMfOyWy9freQG+twEVGJaq+e3zCV4OGUMeCQwsg/b
         3MrMq18D+xbOitATEXDFlu9JMZLK9lpyGRobniIhw8+Ulat8U5kSOaKfyNENTdMffW8r
         Z/KigykcqXPtSPbQw85FhNFL0kKbvN/Tu/036/7+9qLIrokl3ztjUH58QGZeOt9WBMv3
         Z9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335037; x=1750939837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdGldtwlWNchi8rv7SkT/y3UPzEmCjdby+cLRpS1Y/4=;
        b=Zavmp0Gjt8ecr0XvZFSqzvILoPQQnVl3ThqOoB+7ZERkDwHDTiRmdZ3u9pzex8kO4B
         8uUXUTmFDr3DR2floJ6L7bWjciU4WRxdHv44Fo3zyTFa6gWBUivscfZ/VW42E4C7a0XC
         TihUyo/PSUYRSA2P39zK8ht7RdOc7rPgIYQxao8g8ShCCfdaOtQxG9BQYxwoeBw/uNkF
         tS3/On1ISp6uRqiB3YBKk9pTfh4XdPPeHCfeurYKbsuAMGy3/8S3ieoBddezgYL12CN6
         xG8V5p1rqTmCfXKTnOQgIRMV0NlxTRxxspQhL/zlsv2PI+Du0FmBne9jD7rbWzt/ZVxY
         Qaiw==
X-Forwarded-Encrypted: i=1; AJvYcCUpRoY31AsC7FqflO7im9XPeZiej7n6L94G5ZWe708u/NGc+L0l2QSvVBIR8IAsFYxr4mbsBZToHVr1hFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR144h2GG78gByXvByywidc3XJP45cXneYa/p8r5QL4/s0Q/se
	UIGHROrnsQ9wefIexQiAr82XgbBaqiLoN4Gf0Hpwro9/1qynduuKub15ayQeZqzdYoQ=
X-Gm-Gg: ASbGncuXTZjiqMTVMXHKPGqRR1nnpS204VZdrA/oC72zXI25dY8oladDQI9+IM3/FKc
	z8jhhHBCcXTqOG5kXMH/LlBvCOXirySDcmn4LssnaYwfBtbJHDKcvZ2mZ+7UnzEtRaWbpiWwyIL
	dG8qwIXlVDxygWSI3g0pfE9+TM6FjvDHss1+HHvHfSgGGcdRtUhD83tRDKMoQTCoFi9XaYHQNE1
	bD4UGkuKji0B4E1n3OamY9f8p9/ugE4FnWqStiY3cHuevbI8dKA+a0XDikZGaRQN2sTkEHTeVnS
	GaBiNeTP5L9iiHzXmzRQb2us870sfd5kzY2JP6up0uIH0MSLAaAlXOgYY4R90UnhYa2/tzrr4tQ
	=
X-Google-Smtp-Source: AGHT+IHGGooM/miBYffjvJ8pX+BjB/MPFrva4W86C087uwV8r28dL9eXqgzrXWtmG3yVk4veuPOJVg==
X-Received: by 2002:a05:600c:1f94:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-4533caa6567mr222030495e9.18.1750335036830;
        Thu, 19 Jun 2025 05:10:36 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebcecdcsm26406435e9.36.2025.06.19.05.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:10:36 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:10:34 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking
 cpuset.mems setting option
Message-ID: <jtjtb7sn7kxl7rw7tfdo2sn73rlre4w3iuvbk5hrolyimq7ixx@mo4k6r663tx2>
References: <aC4J9HDo2LKXYG6l@slm.duckdns.org>
 <CACSyD1MvwPT7i5_PnEp32seeb7X_svdCeFtN6neJ0=QPY1hDsw@mail.gmail.com>
 <aC90-jGtD_tJiP5K@slm.duckdns.org>
 <CACSyD1P+wuSP2jhMsLHBAXDxGoBkWzK54S5BRzh63yby4g0OHw@mail.gmail.com>
 <aDCnnd46qjAvoxZq@slm.duckdns.org>
 <CACSyD1OWe-PkUjmcTtbYCbLi3TrxNQd==-zjo4S9X5Ry3Gwbzg@mail.gmail.com>
 <x7wdhodqgp2qcwnwutuuedhe6iuzj2dqzhazallamsyzdxsf7k@n2tcicd4ai3u>
 <CACSyD1My_UJxhDHNjvRmTyNKHcxjhQr0_SH=wXrOFd+dYa0h4A@mail.gmail.com>
 <pkzbpeu7w6jc6tzijldiqutv4maft2nyfjsbmobpjfr5kkn27j@e6bflvg7mewi>
 <CACSyD1MhCaAzycSUSQfirLaLp22mcabVr3jfaRbJqFRkX2VoFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nops24fazq2mqnts"
Content-Disposition: inline
In-Reply-To: <CACSyD1MhCaAzycSUSQfirLaLp22mcabVr3jfaRbJqFRkX2VoFw@mail.gmail.com>


--nops24fazq2mqnts
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking
 cpuset.mems setting option
MIME-Version: 1.0

On Thu, Jun 19, 2025 at 11:49:58AM +0800, Zhongkun He <hezhongkun.hzk@byted=
ance.com> wrote:
> In our scenario, when we shrink the allowed cpuset.mems =E2=80=94for exam=
ple,
> from nodes 1, 2, 3 to just nodes 2,3=E2=80=94there may still be a large n=
umber of pages
> residing on node 1. Currently, modifying cpuset.mems triggers synchronous=
 memory
> migration, which results in prolonged and unacceptable service downtime u=
nder
> cgroup v2. This behavior has become a major blocker for us in adopting
> cgroup v2.
>=20
> Tejun suggested adding an interface to control the migration rate, and
> I plan to try that later.

It sounds unnecessarily not work-conserving and in principle adding
cond_resched()s (or eventually having a preemptible kernel) should
achieve the same. Or how would that project onto service metrics?
(But I'm not familiar with this migration path, thus I was asking about
the contention points.)

> However, we believe that the cpuset.migrate interface in cgroup v1 is
> also sufficient for our use case and is easier to work with.  :)

Too easy I think, it'd make cpuset.mems only "advisory" constraint. (I
know it could be justified too but perhaps not as a solution to costly
migrations.)

Michal

--nops24fazq2mqnts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFP+OAAKCRB+PQLnlNv4
CA8yAQDkZ52REH93AgKN4IVKz0LKroFqjd21SWk9JuwSDHgn+AD8CRYl7w7CtgNq
nrZtwMOpxzenNE9b0wkmSdmWWYlidwI=
=+giD
-----END PGP SIGNATURE-----

--nops24fazq2mqnts--
