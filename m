Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071C223DE1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720895; cv=none; b=YcVJt07Oe6Xk1WkuYGEV+LQNJbV0VIfcodPEgNI5foRjLdd1y+kpL+cWcd8ByHYTgXH7W2CEKNcA5nTvD+FUYae9tbqIkOBTsg8LadrfAKzvv/8VFMoq/gtC9Rl/ixFXpBebHLBW8gj0liIGdevAtSwEDKqU0Tk9ulXi7ZtupsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720895; c=relaxed/simple;
	bh=WH4MWsMMlzGlz4gM9gjAzqFE+1ORw8N7aa2D7XBLdRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/uYxGsXuTXUXA2t0j9f41tM6bLEUbKZzJHCSFxc6KE1jme3mkd7Dvkc/fJEOvcxFxeivMJfhQsVQk4wWcx0M8hOnW/limA99PTNW0W6jzQXDz2KM2XRylihK36nW6xWF0NjUIaBUb02nfuFczqAcWJGnbViAMCRAR5PVo4i8Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EG2vZl2e; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EG2vZl2e"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1b94382b8so899519966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750720892; x=1751325692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZVkY48T502JcAD7NzXzzdEZjZODovk6qGSGgvVTsNo=;
        b=EG2vZl2eSn+DDeq9/j9YX3jC0pcSplgy97mbeT4UYePplVpTxqWApBs8nlYWTF3/SK
         C1WOm3RLwoK843jpfjEDOJ8ozIPMqrOQIJGH7IVCXUqbmLbr9BAs8XyMyCHWJ8Vp01xb
         7MoGWMvvegZx2Y9vzWAcp2CtQ+AlIGHh0w9nE9b1qnPfOEiG5wUCnNcSaSWMiAzcNP0f
         yjsrylQkC1p50waUn/eY5/EFy+03VRan+pubgLAmmqaPoAUTChWtJ8m8CaJ8RWgEN9wg
         ZMkO0H2iy8U+717z4Vt06GHydGiWLAYTySm2Nokd19l51RmyWkTbX3a1lUbU8KM4O3NS
         ODaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720892; x=1751325692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZVkY48T502JcAD7NzXzzdEZjZODovk6qGSGgvVTsNo=;
        b=apJupRWuiv6BI2+l+VuX7x/2lNGZtcGH6PCsApcGQSrmQTDkoFsf4/shRmZuNvLl81
         t6dbWR8cgRkWPSfEXY9yJznmkcSbXoiNfwSW44srS3HxAC1AoR8wIMQ4HrBJlCGcFvcl
         blgIczPp+fXyibeYW6Pqw87uDVY5ZG/PG1/Jdh6qoC869RbAsNb8bJhfTngXWBfedZsR
         +S+lCRDdkz1Fa4AIFDesyyMVvRXbFp5R4oV0IWK4R1HQzihemmwumOGPPDZSndYeLs17
         srh1k2f+Q1fQ0Ukk9GArini8FP16qCovLkrinyeVIn2FA+QHdv+tEhX3mMuC0XZjG8j7
         yoww==
X-Forwarded-Encrypted: i=1; AJvYcCUtPltxiOJ2E5jQz06L1twwVIIbw8eNUnimbGRPUQ4pw9nSp4kWQ3x4EVqDRRzsK6ZDOF1fN2WBTGMRlVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWmV36IthOY0bOkznSywuXrKj7caYxMojZUcJdseKkrv+eXRD
	5IC2LJZPb+EnAXwaXeki7vM5tfYefQFgbh0hPH2n71Swvx+ndcEYKnkWw466ZZ/fi9ZXD8QsbV+
	wuPJVd3gio3+qWer+g1mDnkR3KV8DA9c=
X-Gm-Gg: ASbGnct5OUdEju3RXP9rSj4zOfi41aMkjoO3koYU8r0Zefyy+nPIFcmmArmsHzgGjxO
	tPDEyVZQEu/sCQkH4YqgRuBiApx9sFAK0SuB5Ahhyi0YDEa3eKoFMILZGDegZiBdjTzQvAREhu/
	Zeh3DseFu3bJnq9IEgczoaNJXKUF6fa21s3f+lk26dDd3iXZHFXHaTwCjzQamFjF8U9bFFnqMvx
	Z0WnQ==
X-Google-Smtp-Source: AGHT+IF53yd5TzJjggB8GCsgXjHW3XfBe88y6aXb2DUIoaNxkcU59GbTifghsdJkMCaNQP84ylFD8Fm+lkPnJG8ON1s=
X-Received: by 2002:a17:907:1ca6:b0:ae0:9fce:c578 with SMTP id
 a640c23a62f3a-ae09fcedefcmr284922166b.18.1750720891641; Mon, 23 Jun 2025
 16:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620180458.5041-1-bijan311@gmail.com> <20250620202155.98021-1-sj@kernel.org>
 <aFmq5Y1zKov9__zh@gourry-fedora-PF4VCD3F>
In-Reply-To: <aFmq5Y1zKov9__zh@gourry-fedora-PF4VCD3F>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Mon, 23 Jun 2025 18:21:20 -0500
X-Gm-Features: AX0GCFvhM9bDmIKNz3hzb_T7Ftkp2AGOE2ZRMfDXHquDjGFrrsP8UEg9t-r2yYQ
Message-ID: <CAMvvPS5ievG9Q2w1GEA5BH2mAX-XUR_=oo3AWMnDeUvyRF8jyg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] mm/damon/paddr: Allow interleaving in
 migrate_{hot,cold} actions
To: Gregory Price <gourry@gourry.net>
Cc: SeongJae Park <sj@kernel.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@redhat.com, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com, 
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gregory,

On Mon, Jun 23, 2025 at 2:28=E2=80=AFPM Gregory Price <gourry@gourry.net> w=
rote:
>
> On Fri, Jun 20, 2025 at 01:21:55PM -0700, SeongJae Park wrote:
> > Hi Bijan,
> >
> > On Fri, 20 Jun 2025 13:04:56 -0500 Bijan Tabatabai <bijan311@gmail.com>=
 wrote:
> >
> > [...]
> > > This patch set adds the mechanism for dynamically changing how applic=
ation
> > > data is interleaved across nodes while leaving the policy of what the
> > > interleave weights should be to userspace. It does this by modifying =
the
> > > migrate_{hot,cold} DAMOS actions to allow passing in a list of migrat=
ion
> > > targets to their target_nid parameter. When this is done, the
> > > migrate_{hot,cold} actions will migrate pages between the specified n=
odes
> > > using the global interleave weights found at
> > > /sys/kernel/mm/mempolicy/weighted_interleave/node<N>. This functional=
ity
> > > can be used to dynamically adjust how pages are interleaved by changi=
ng the
> > > global weights. When only a single migration target is passed to
> > > target_nid, the migrate_{hot,cold} actions will act the same as befor=
e.
> >
> > This means users are required to manipulate two interfaces.  DAMON sysf=
s for
> > target nodes, and weighted_interleave sysfs for weights.  I don't think=
 this
> > coupling is very ideal.
> >
>
> Just tossing this out there - weighted interleave sysfs entries *should*
> be automatic, and the preferred weights shouldn't really ever change
> over time.  Even if they did, if it's the result of devices coming and
> going - the updates should also be automatic.

I'm not convinced this is true. If you have a workload that can
saturate the local bandwidth but not the remote bandwidth, wouldn't
you want the interleave weights to be more biased towards local memory
than you would for a workload that can saturate both the local and
remote bandwidth?

> So, in practice, a usually probably only has to twiddle DAMON.

That being said, I don't mind the idea of the mempolicy weights being
left untouched as a reasonable starting point for bandwidth intensive
applications and leaving the fine tuning to DAMON.

Thanks,
Bijan
