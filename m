Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F00725486E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194140; cv=none; b=Ply1zJ0/Um9n1nNshq2XKA2q/T7PqWjFiyNwN+Hk6W21q01JSOdGlGAavX1kB6ltnSwqpn5BMVUU3RwcjvDO7GGRZvBbXBh2lASIZsehWAp3hhWcq3VhwfXqy7nhzmVKPUJwyLgZSFCIasD9Qq5UZxhhEcqWerpIzBb6e9zc5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194140; c=relaxed/simple;
	bh=bbJvFUQkw3L5PkboYUMBfNQJNB7Cj+N0QgAqzbHFUjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEPIEtuvAp6WSOiJhY7CtCY1XnjyS0ScDEpKTFdIzm2gTX7flkUhCtWC4EgjD5I0DSfj+s0r67vKnhcmizvBUhcTiPFRidQKeetOwD5DqRsYWotN6FCtATV8OdUtiH8yK2N4Coixrkcmq3cahQo795PlU7Di3vmcLVgmh6QM2xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDn1j1Y0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDn1j1Y0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ca5eba8cso55545ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194138; x=1750798938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJpTkL6dnMUxXhqmmFV6413864xvIfSCiGQ5PuutKRk=;
        b=aDn1j1Y0l7AYNZt7Qy2X/e0gj9YhLQyvqm5fO3SG1G8YnpRudZJlswM9i1g/sLnTmF
         sbK03Wq2AEDVQTVRZ/cSFGIZLx+IjFb8gYhKVxvWBe09v4Bnrc9Ge1dBAInBw5m8BmQh
         i7sTsW8G+fteiiRuitK8u7d+5+lS8p8TRMcOJbBGTi8b+B5WelEd3mFtSbIW+2sRp26y
         kGWI+VC7sTUvztAHKIQhkqIjEkA8P6TN+r9F+R6EP0O20xnOBi/ht4pTgW5rrnBUSKBW
         FbLA2i6ben0GVHPNh8AZ3cRGFxNf/yzICjzPnzlzYPKgQXWuO1dpG91TpYDFPVzuOUkw
         TduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194138; x=1750798938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJpTkL6dnMUxXhqmmFV6413864xvIfSCiGQ5PuutKRk=;
        b=pcxy2Eis5uoi8XxC3doDL0ALqGU+tkhVvbiG+rb/TzECSbCYyJ+b59Km6b7D/AWJSZ
         giSPj3hNRiNsqY0bQG3/pOrDHWt0J2lenTtdkgAbrvHF0Ar7OFHUpIsLlmC8RqvkqeJ+
         9HIO6TVBsZRUG59Tt+ICiGhsvFnAUtGi+2401cMmPTGYNZIa+7SelVz3uV5bcWA3qPy4
         zcl84ULlHlqoGwD8oexctg8LX6uPxAby2M5ijQ3l6UYnrji6f+z6wBmT3duk3no0FUAY
         aDvDg2fwxZ/YU/8aZJFSC82a1rTuGWTnM4zC7l4DYfAH6IbvTqR1r5deqbttgahpst9k
         Z07w==
X-Forwarded-Encrypted: i=1; AJvYcCUdn0tiCWk7jmkrRSb6igQeOHLoCr5nOfKGIG4BEGUrrl6/O5ArvQCNcXRFgRoxIoegEjlCTr2NKWHOnP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAAmiNxfW/fvxr5wJfT8O+3O+PYiUV/nj/RKjZH37am5JglUt
	Tw7/yEDSIK4oJ8hfgZVBXXXzqG+/vzUISwF7b14H7tJ3aAbneJ04b1n2QLPmNAYRVTWAXJ4ioQu
	lsqdjEuvwAbAUl9eeLNxFWH4Wyne7/0B24ilLzQNV8SchknQWQ1rLnYJo
X-Gm-Gg: ASbGncvDnp/PyxTc9kCvhIv1Jc1gBjupIqgEEYQ09Dzo43B0j6Pxp//Y4OzevpNQgGF
	SkG1Fqulgxcf0oPkmjdUpBHu2n5rblcvCazQZD5KvOEJgraglF31VJW+orBFuWppnMGIUYchc5j
	1vuSBhJBf0GxQsB52ci4HlfGbhxLTodAdVmFx0CEzHpFBDidh7gdaEWTIlINtZPZLER/7EECqNq
	Q==
X-Google-Smtp-Source: AGHT+IHgMRu1fKsSV7XOy4vWnT6+ZEd1bH1oAglzGxguVpljDMbdpGfPlD9igC63Hsmb+pjcSFZ3ktzSSxCDH6UqpcY=
X-Received: by 2002:a17:902:694c:b0:231:ddc9:7b82 with SMTP id
 d9443c01a7336-2366eef033amr6826765ad.13.1750194138053; Tue, 17 Jun 2025
 14:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616080530.GA279797@maili.marvell.com> <d152d5fa-e846-48ba-96f4-77493996d099@huawei.com>
In-Reply-To: <d152d5fa-e846-48ba-96f4-77493996d099@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 17 Jun 2025 14:02:05 -0700
X-Gm-Features: AX0GCFvUw1z75ffCbqGSTrvshjJ_0t0dfFX0hDbMSAmZ2EGaeyX7sOFJGQGhBUs
Message-ID: <CAHS8izNBNoMfheMbW5_FS1zMHW61BZVzDLHgv0+E0Zn6U=jD-g@mail.gmail.com>
Subject: Re: [RFC]Page pool buffers stuck in App's socket queue
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Ratheesh Kannoth <rkannoth@marvell.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 11:34=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.c=
om> wrote:
>
> On 2025/6/16 16:05, Ratheesh Kannoth wrote:
> > Hi,
> >
> > Recently customer faced a page pool leak issue And keeps on gettting fo=
llowing message in
> > console.
> > "page_pool_release_retry() stalled pool shutdown 1 inflight 60 sec"
> >
> > Customer runs "ping" process in background and then does a interface do=
wn/up thru "ip" command.
> >
> > Marvell octeotx2 driver does destroy all resources (including page pool=
 allocated for each queue of
> > net device) during interface down event. This page pool destruction wil=
l wait for all page pool buffers
> > allocated by that instance to return to the pool, hence the above messa=
ge (if some buffers
> > are stuck).
> >
> > In the customer scenario, ping App opens both RAW and RAW6 sockets. Eve=
n though Customer ping
> > only ipv4 address, this RAW6 socket receives some IPV6 Router Advertise=
ment messages which gets generated
> > in their network.
> >
> > [   41.643448]  raw6_local_deliver+0xc0/0x1d8
> > [   41.647539]  ip6_protocol_deliver_rcu+0x60/0x490
> > [   41.652149]  ip6_input_finish+0x48/0x70
> > [   41.655976]  ip6_input+0x44/0xcc
> > [   41.659196]  ip6_sublist_rcv_finish+0x48/0x68
> > [   41.663546]  ip6_sublist_rcv+0x16c/0x22c
> > [   41.667460]  ipv6_list_rcv+0xf4/0x12c
> >
> > Those packets will never gets processed. And if customer does a interfa=
ce down/up, page pool
> > warnings will be shown in the console.
> >
> > Customer was asking us for a mechanism to drain these sockets, as they =
dont want to kill their Apps.
> > The proposal is to have debugfs which shows "pid  last_processed_skb_ti=
me  number_of_packets  socket_fd/inode_number"
> > for each raw6/raw4 sockets created in the system. and
> > any write to the debugfs (any specific command) will drain the socket.
> >
> > 1. Could you please comment on the proposal ?
>
> I would say the above is kind of working around the problem.
> It would be good to fix the Apps or fix the page_pool.
>
> > 2. Could you suggest a better way ?
>
> For fixing the page_pool part, I would be suggesting to keep track
> of all the inflight pages and detach those pages from page_pool when
> page_pool_destroy() is called, the tracking part was [1], unfortunately
> the maintainers seemed to choose an easy way instead of a long term
> direction, see [2].

This is not that accurate IMO. Your patch series and the merged patch
series from Toke does the same thing: both keep track of dma-mapped
pages, so that they can be unmapped at page_pool_destroy time. Toke
just did the tracking in a simpler way that people were willing to
review.

So, if you had a plan to detach pages on page_pool_destroy on top of
your tracking, the exact same plan should work on top of Toke's
tracking. It may be useful to code that and send an RFC if you have
time. It would indeed fix this periodic warning issue.

--=20
Thanks,
Mina
