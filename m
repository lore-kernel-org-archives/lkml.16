Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3F6221F07
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744847939; cv=none; b=YM3mXJBN9WWBlcykR2+FJRtlvVcHa6/c7zRFZprxo5EzzXErlxen2mXsbRwidmnxSpIxxkhKLaxYNGGKFISQLm/5EI2wq6roLDT2N5yNv3iq/RAXdD1WaeaBk0nJJwze1QBBXEYxglHP94xq8J6l8ZmRbWQtvHGJ6hZrZwTyNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744847939; c=relaxed/simple;
	bh=EsahowD4Zw7aUaF+4Tx6dzA0FPkIdFHJGOzkkdrRXQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t42vO7sI+CC/QLh3OTbDzsmPEyRFA+krHE7QvYE/qMnzTYv9qKUDgxXv4C6KHYG9LDqg3HfCJzjBcbhmnyp6neQQViIv+857GJc0UwD8DeW2+Xf/ttrKuasDVeo5y6i9lNLrZ/Lxj8jUYEVEnXXkou3JUTp7QvqiFYUB/sKEaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=SNAYdCWO; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="SNAYdCWO"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c54b651310so23137785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744847935; x=1745452735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zh8uU7uakGhMlcLYvDd0MrxARRrHNSKhl0MuXczUf1U=;
        b=SNAYdCWORBlOspyQM715EP4s3sEdor/mq/xduuQGwaRSSyxIABMXCf2nAJ91/1kMuL
         FO7/3TalQaTfY0wCj+ac6z6fIPtW1E7oft/92QQFYTiXIePnm2ohTu/UtbFBoQNs93XV
         cvpKeew+bDl5cXfWZlSzD71ZK3uOBOyphGbBm2PCREJBpNagJyZ+7o3HvND4+lW0siPl
         osW0KDNFgWN9fEChimPlLBBPMnYVVYULUPnUSzOr9cI2MPfaMPcLM6gVd+eK4dlpQuBF
         /ACxTjOkkIOjA41hG2NbUeOnN9uaDD3fLF6AuNNpM/pnFZuSLoS0qriLGuTWKoNzBNSC
         WHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744847935; x=1745452735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh8uU7uakGhMlcLYvDd0MrxARRrHNSKhl0MuXczUf1U=;
        b=kBbp9zj7KL6d+KboNQMVRw9Izj2McWZKqvZB+vrZ4GLMmmg2vP4VrZ1LvhR5BsRArU
         0P3Kw258kjOSFdUEKkHZaRyFwUoUpGdO3F/RfboenD2ntuJ4KE2aCd1jhmEwOdhOx5vm
         nscnFoVwZCcy60EuIstOxlR2/UJkOA7Z7IBDtQn2Eec7/xiohWAtcVMTkCeaYf3wGToD
         qf6z0hQoTVQzjFIh5T4hU5/BgP+1hJRi3G1hSP9UkAb0PJOXafgwMj3IhMc8rnJN3Mka
         a2fzCK3Y5aJyf/XEz76pjCbG9nmy7XklR/G7ElaGLChL3XS086QH83XsjPB7xSB0xurA
         ZQlg==
X-Forwarded-Encrypted: i=1; AJvYcCWMyFVcHmaT729mV/9XbffYlu4yiFZPu1a8v7wckghN1KL0yL09Mfv/s6Y/15/OOfoZVCFocWe4K/IGtis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PPCY9nNYPw6J86JQtPoXu4Qk5DRr6HrXmRndHqMDVcsE3wvP
	Uwi+GsE1Wdz5JcVJk0LwR38+PEQ5u/De/wPmPXncVfmZFvU7Nmrfda6bUQoYgUWOfGk0sxcqqIR
	q
X-Gm-Gg: ASbGncuqso7QIF7Kqqj+5rIywgIJF3v9Itk2OGtbNnaLU6vEVcm3oqLX9G93FLsejWs
	0XMKJkDODT1urGEnO1KFXLGX0YTyojz4aALhyaO3gWlS2LSUE/7lJLYSCuX+BM4EPihOjEJQS9f
	LB4CX5TMzEN4yQfX4gSqsBqa3AXbPLa35ELgcziR4sgl/01dYYi+AIWTqfCVQSlvLYvuJV6jRWc
	ckeCt40NVPqs7IlpR9I8yeQjqA+uamsW5Mc0Db3kcCZIhmjzmd1rKzyfErj8+s1kdpQpS3m4bdE
	H3jCBYOdziFITuZCS5RmPz6Gsk6LPFYMvNby/Qg=
X-Google-Smtp-Source: AGHT+IGCPxa/oE9FU6zpR+xk2jsOSdtIvGnraH/d9sq/Igu9HvsOW22M91TtJ5dndDCcLboijmocsw==
X-Received: by 2002:a05:620a:c54:b0:7c7:af68:b6f3 with SMTP id af79cd13be357-7c919004ae0mr499778885a.33.1744847934700;
        Wed, 16 Apr 2025 16:58:54 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7b7cd5f4fsm791180885a.54.2025.04.16.16.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:58:53 -0700 (PDT)
Date: Wed, 16 Apr 2025 19:58:49 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Barry Song <21cnbao@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
Message-ID: <20250416235849.GA780688@cmpxchg.org>
References: <20250412085852.48524-1-21cnbao@gmail.com>
 <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
 <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
 <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
 <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com>
 <20250416141531.GD741145@cmpxchg.org>
 <239cfe47-9826-402b-8008-de707faa160e@redhat.com>
 <20250416181835.GA779666@cmpxchg.org>
 <CAGsJ_4zt2Yuornri1bO=3o7myey1Q2dmvtjn2baD0ahxOyoNjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zt2Yuornri1bO=3o7myey1Q2dmvtjn2baD0ahxOyoNjw@mail.gmail.com>

On Thu, Apr 17, 2025 at 05:54:57AM +0800, Barry Song wrote:
> On Thu, Apr 17, 2025 at 2:18 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > Right, I'm more broadly objecting to the patch and its premise, but
> > thought the exclusive filtering would at least mitigate its downsides
> > somewhat. You raise good points that it's not as clear cut.
> >
> > IMO this is too subtle and unpredictable for everybody else. The
> > kernel can't see the future, but access locality and recent use is a
> > proven predictor. We generally don't discard access information,
> > unless the user asks us to, and that's what the madvise calls are for.
> 
> David pointed out some exceptions - the recency of dying processes might
> still be useful to new processes, particularly in cases like:
> 
>   while true; do app; done
> 
> Here, 'app' is repeatedly restarted but always maintains a single running
> instance. I agree this seems correct.
> 
> However, we can also find many cases where a dying process means its folios
> instantly become cold. For example:

Of course, there are many of them. Just like any access could be the
last one to that page for the next hour. But you don't know which ones
they are. Just like you don't know if I'm shutting down firefox
because that's enough internet for one day, or if I'm just restarting
it to clear out the 107 tabs I've lost track off.

> I agree that "access locality and recent use" is generally a good heuristic,
> but it must have some correlation (strong or weak) with the process lifecycle.

I don't agree. It's a cache shared between past, present and future
processes. The lifecycle of an individual processes is not saying much.

Unless you know something about userspace, and the exact data at hand,
that the kernel doesn't, which is why the Android usecase of MADV_COLD
or PAGEOUT for background apps makes sense to me, but generally tying
it to a process death does not.
