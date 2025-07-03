Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98FE225D6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521887; cv=none; b=LGFn54RkGgNM3i8Od9YOOcfvHrfNSOOhJEgh35bSsfpo7wXFddCww770vECORUlOBSzzO8S45B+gbjNLkB75xGgL0G5MbCDja5fpwFELRhLLpJo2y3UVA5+vZLse6z9qYzUFnlaXCDFJT4/UdGd9IBiC89CPKC3gvBcPjhBkv+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521887; c=relaxed/simple;
	bh=1m0z6fdjZbCbVibUE1igW1GCEx8THMZqBilXOkv53uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpBU2sfaddBsNU6G1LfgTYLEAgtd1nHNNZoZ2cbQ1H82uXxmsqRSU+FOfnWWJ45Bd+4LOoJHezrzQmpSVNXDPm84wqDdksQ1pxNOR58NAIoapBYoyx9a8QrXZEiFqb5Lu/krgZlXZjsZsGTisYoYqjRnqz6RMTCNG9TFObjIeKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiyhC5Mr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiyhC5Mr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC59EC4CEEB;
	Thu,  3 Jul 2025 05:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751521887;
	bh=1m0z6fdjZbCbVibUE1igW1GCEx8THMZqBilXOkv53uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HiyhC5Mr3lZznq9J0P9qgJngPHFu9pvXSoCe0dBj7OjEzo7qGD5FfBL5unw2bhUqy
	 IYgYoAMhIGd1szT/VCtbT/oPTy1PHWFK/wBzqad3Le9Mhy8boia7XuhJW3pT0AQnF/
	 3Vyu98WyYmDcGU05JihVqBLyAozAMaZaVMYXCDVR5jxwCktLzP/PFCwjyhugySQCWc
	 HjO819D56u50Lfw/UFrd8BxNBAMAwgHSsnJefO8xcZstDOIIcaKqxXev3M2qorBTgS
	 q14YQs9/27mWXOc3ek2x8XPvPMPx7mE+YB0XBW3Aka7q9Hbv0IjjIdMDv3V6SUrX2e
	 tG5Re3hd+ZHIQ==
Date: Wed, 2 Jul 2025 22:51:25 -0700
From: Dennis Zhou <dennis@kernel.org>
To: Jeongjun Park <aha310510@gmail.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, tj@kernel.org,
	akpm@linux-foundation.org, vbabka@suse.cz, rientjes@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for
 pcpu_nr_populated read with spin lock
Message-ID: <aGYaXcB1CaA3BKEa@snowbird>
References: <20250702082749.141616-1-aha310510@gmail.com>
 <7b7d353f-f38b-3205-8fd4-1072dbf69cb6@gentwo.org>
 <CAO9qdTEidRnO4O_D7Z1jKZTyJadFyEyWBnfitTz8t1CdBaM1nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9qdTEidRnO4O_D7Z1jKZTyJadFyEyWBnfitTz8t1CdBaM1nw@mail.gmail.com>

Hello,

On Thu, Jul 03, 2025 at 01:45:36PM +0900, Jeongjun Park wrote:
> Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> >
> > On Wed, 2 Jul 2025, Jeongjun Park wrote:
> >
> > > diff --git a/mm/percpu.c b/mm/percpu.c
> > > index b35494c8ede2..0f98b857fb36 100644
> > > --- a/mm/percpu.c
> > > +++ b/mm/percpu.c
> > > @@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
> > >   */
> > >  unsigned long pcpu_nr_pages(void)
> > >  {
> > > -     return pcpu_nr_populated * pcpu_nr_units;
> > > +     unsigned long flags, ret;
> > > +
> > > +     spin_lock_irqsave(&pcpu_lock, flags);
> > > +     ret = pcpu_nr_populated * pcpu_nr_units;
> > > +     spin_unlock_irqrestore(&pcpu_lock, flags);
> >
> >
> > Ummm.. What? You are protecting a single read with a spinlock? There needs
> > to be some updating of data somewhere for this to make sense.
> >
> >
> > Unless a different critical section protected by the lock sets the value
> > intermittendly to something you are not allowed to see before a final
> > store of a valid value. But that would be unusual.
> >
> > This is an academic exercise or did you really see a problem?
> >
> > What is racing?
> >
> >
> 
> This patch is by no means an academic exercise.
> 
> As written in the reported tag, This race has actually been reported
> in syzbot [1].
> 
> [1]: https://syzkaller.appspot.com/bug?extid=e5bd32b79413e86f389e
> 

A report by syzbot doesn't mean it is a real problem. A production
problem or broken test case is much more urgent.

> pcpu_nr_populated is currently being write in pcpu_chunk_populated()
> and pcpu_chunk_depopulated(), and since this two functions perform
> pcpu_nr_populated write under the protection of pcpu_lock, there is no
> race for write/write.
> 
> However, since pcpu_nr_pages(), which performs a read operation on
> pcpu_nr_populated, is not protected by pcpu_lock, races between read/write
> can easily occur.
> 
> Therefore, I think it is appropriate to protect it through pcpu_lock
> according to the comment written in the definition of pcpu_nr_populated.
> 

You're right that this is a race condition, but this was an intention
choice done because the value read here is only being used to pass
information to userspace for /proc/meminfo. As Christoph mentioned, the
caller of pcpu_nr_pages() will never see an invalid value nor does it
really matter either.

The pcpu_lock is core to the percpu allocator and isn't something we
would want to blindly expose either.

The appropriate solution here is what Shakeel proposed to just mark the
access as a data_race().

Thanks,
Dennis
