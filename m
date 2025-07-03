Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85608263F22
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522973; cv=none; b=QsKALqoML6cDA3gALa2xw0LBg6oRLrYChngpSr7hicgWGhlsT1jA3FtLNIkIGx54mmtiVvTOUDNBOHDxxFor1Q/mJfIdJQgZNh0iwlkTscNiSQMDMk3LxPCsC3p3Wh4+8gVOCB2Q1et72fpT8SrfyqohXGnXVWFUht6JJRhdKOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522973; c=relaxed/simple;
	bh=ZpaUmFPSRJFhK6DgF8GWZernQpN7SC+FSGETckXYpsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWHghHutPdHS1xG1Pp6wtgt7yZO8JFAAPfBr3sxC/4X+3nAKNfD5HK2BltHyPQ9xJxOADWeD7/Ns1Pb+D6i86a8le0QoSxxNGH1Xe/X16qkeLHDJMOrKiTwKTC5H6ylt4pyGcCM8gNqt2mdg/IpvZNooGBkxdo+RGp692fVlgG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7XaQkHr; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7XaQkHr"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b271f3ae786so6733262a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751522971; x=1752127771; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zuuZADxXuyOUxUlWSv3SmGbccP/kTl0lSgA2T0+Pw48=;
        b=L7XaQkHrGIFvSJX/jh+FMXesuXypOlH4QRGuCcGHJI2ocAvuLFx0A3mRRgUb4g5p01
         OXq9OQacyTWMVYkpVTWC0TRHxSqsyXA0kHEtZb4FWPpySUPY/lRnLj/+iR8LUQktCSsE
         gweswhSGvEU+wEAzei6PZNsBZIGwTPjp95jMQEywECt4QU3ENKM+d/K0BTPmU88ybP5b
         Bl3njxJPPjUPFsqwS81H809Gzi4U0Yqvjnp3RyNOkasLPXLkMpjT2E1x2DIfeDCgS7VD
         el/MgDrKvWagQays7ykAPtg2TsmEcqw66wzlatTrukjIU8DECSU1zRhh610qj09ATynO
         71zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751522971; x=1752127771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuuZADxXuyOUxUlWSv3SmGbccP/kTl0lSgA2T0+Pw48=;
        b=dYzIjQRTxGxOlyc2ZDscQmzFWzoZ42Vj5slmYvyA4n1xgJn1yBr1P3a640aLiMmOxw
         SyuymaTFNnPcIUkvsfFnkPrJ1+hBF21ttzTLzg8k1P3PqLHKtkVsZdyX+O62EcdfrOLq
         aOkJCe1MTTYQ0xOvdEaB8iholkecH3z1XfVOr7K4Awx0wROB5UF7qXC9vyjIxq2Pstrc
         tqVyMC8zTF+IqudBoS9Rh9mgVZcDds6vy8ieTrFmTLZMhJCrGFhW2cDxx2a+1InE0uCO
         L3ekEUETtQ/6EPnJ3yEGYQwYrsozEhGDqFsnOzp0Efo7Q4p3X9HMJsrEShoCkImZBfcb
         GRSw==
X-Forwarded-Encrypted: i=1; AJvYcCX53t9HpXSyF/M/dVm6wwQ5YQ2kkCdSpGsQeoNHmcFwiTexgxJ37aU8yQc5g6syZRAT4p72m5tfMh9Qxeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVhpnKBf+HRcsF2OPDypZvEti7nzXj3Ct9f9OoV8Zdyg1ENv4
	WiOUZ45uMIzjKnnPTvviEWLbPva4qU9UVMn/OEAYlwU9oe7519dGhUmj4uaPf8TO5m1xXA+gMca
	lWFntSyaYRueBP4zosYAR0nBmBY/llrY=
X-Gm-Gg: ASbGncssaBmeL8zy4n/vY3LNMK9K71Sd4+cE3CuEkHCZ8sXWeU0vE9ANp4ETajRX63L
	AjEBEpoW01GF9IN9QbNia8MoD+c9gyv2ui+KQyf1KIlZtgg1wmjvWdXfvRKPP/lqVv9oB8wz0Q2
	+N6SujNcutuPuGVaFQ3rqYqunB5WdDC7uVaBYFmucOPu0=
X-Google-Smtp-Source: AGHT+IFdl3iRPzC7io67vAWkuxbZGAjAeotegr/GTnPvHCevmw+ZMUKzoFm2ry4bWDIj4n9zdG9D0vPBAWoO6bqqNps=
X-Received: by 2002:a17:90a:e7d1:b0:313:bdbf:36c0 with SMTP id
 98e67ed59e1d1-31a9dc97f5bmr2941518a91.0.1751522971452; Wed, 02 Jul 2025
 23:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702082749.141616-1-aha310510@gmail.com> <7b7d353f-f38b-3205-8fd4-1072dbf69cb6@gentwo.org>
 <CAO9qdTEidRnO4O_D7Z1jKZTyJadFyEyWBnfitTz8t1CdBaM1nw@mail.gmail.com> <aGYaXcB1CaA3BKEa@snowbird>
In-Reply-To: <aGYaXcB1CaA3BKEa@snowbird>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 3 Jul 2025 15:09:20 +0900
X-Gm-Features: Ac12FXx880e4AsSL41ULv1Xim55w3pwBvzjTZak8X2qGavfUgyTsdCqFhCh29HE
Message-ID: <CAO9qdTEwPVqKMOJxoGqgWjHsqEZU+xy7afwZdg=wDi4h+jF63w@mail.gmail.com>
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for
 pcpu_nr_populated read with spin lock
To: Dennis Zhou <dennis@kernel.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, tj@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz, 
	rientjes@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

Dennis Zhou <dennis@kernel.org> wrote:
>
> Hello,
>
> On Thu, Jul 03, 2025 at 01:45:36PM +0900, Jeongjun Park wrote:
> > Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> > >
> > > On Wed, 2 Jul 2025, Jeongjun Park wrote:
> > >
> > > > diff --git a/mm/percpu.c b/mm/percpu.c
> > > > index b35494c8ede2..0f98b857fb36 100644
> > > > --- a/mm/percpu.c
> > > > +++ b/mm/percpu.c
> > > > @@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
> > > >   */
> > > >  unsigned long pcpu_nr_pages(void)
> > > >  {
> > > > -     return pcpu_nr_populated * pcpu_nr_units;
> > > > +     unsigned long flags, ret;
> > > > +
> > > > +     spin_lock_irqsave(&pcpu_lock, flags);
> > > > +     ret = pcpu_nr_populated * pcpu_nr_units;
> > > > +     spin_unlock_irqrestore(&pcpu_lock, flags);
> > >
> > >
> > > Ummm.. What? You are protecting a single read with a spinlock? There needs
> > > to be some updating of data somewhere for this to make sense.
> > >
> > >
> > > Unless a different critical section protected by the lock sets the value
> > > intermittendly to something you are not allowed to see before a final
> > > store of a valid value. But that would be unusual.
> > >
> > > This is an academic exercise or did you really see a problem?
> > >
> > > What is racing?
> > >
> > >
> >
> > This patch is by no means an academic exercise.
> >
> > As written in the reported tag, This race has actually been reported
> > in syzbot [1].
> >
> > [1]: https://syzkaller.appspot.com/bug?extid=e5bd32b79413e86f389e
> >
>
> A report by syzbot doesn't mean it is a real problem. A production
> problem or broken test case is much more urgent.
>
> > pcpu_nr_populated is currently being write in pcpu_chunk_populated()
> > and pcpu_chunk_depopulated(), and since this two functions perform
> > pcpu_nr_populated write under the protection of pcpu_lock, there is no
> > race for write/write.
> >
> > However, since pcpu_nr_pages(), which performs a read operation on
> > pcpu_nr_populated, is not protected by pcpu_lock, races between read/write
> > can easily occur.
> >
> > Therefore, I think it is appropriate to protect it through pcpu_lock
> > according to the comment written in the definition of pcpu_nr_populated.
> >
>
> You're right that this is a race condition, but this was an intention
> choice done because the value read here is only being used to pass
> information to userspace for /proc/meminfo. As Christoph mentioned, the
> caller of pcpu_nr_pages() will never see an invalid value nor does it
> really matter either.
>
> The pcpu_lock is core to the percpu allocator and isn't something we
> would want to blindly expose either.
>
> The appropriate solution here is what Shakeel proposed to just mark the
> access as a data_race().
>
> Thanks,
> Dennis

If this data race was intentional, it makes sense why it was written
this way. I'll send v2 patch with the fix Shakeel proposed.
--
Regards,

Jeongjun Park
