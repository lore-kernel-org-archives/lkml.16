Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C01DE881
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016308; cv=none; b=lmoZE5kGPYJWUOb9Hpf/kFpOE1KmZt0GaxSLnhDKHNHkzkWc/5q+QjlFf4ofjwep0l6nksZq+356dWKpjll+z9Jb6CkM4+v/EAcjNfNWN/9v5tlC/FPwH9W3WAHo3B1MqZDW2NcCvRX4LLT9h+6oUaQfOaf+r4mxht2xDI1BO6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016308; c=relaxed/simple;
	bh=rtn7yLDEvfiwEk7EUKd3nIbv4/Qh8Y2eX4nRV1S1K60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWvWd3NKEwtxUcncunkJ1unaEFR+fIN+LQUE/7gqb2MM5O9NECU4o3+IuQUXkYb5ZbnwdgFsOLG1jRh3/QFX73Ut3WV9U1KqLtOI+Ps3vvdsIjn5a//YysunlJZMayE0IwtzIooZ/TT2nGDJzr24gy0X/XIq1DswBQ40sjGBn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BFhPg+sF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BFhPg+sF"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb12so11331907a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746016305; x=1746621105; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQdFT3CXC+wTZfljV6k5GYo/bu5BlFIO1d2AXG/ww5k=;
        b=BFhPg+sF6JEtKmV5CYy0bUDJqZGMP/DMle5hsfOiPPzoI07Wc8BT8SHbXgLGvN78NB
         rRH+94WT55BdoXGZijRrE/PtE6VM0gnAdp4xGpjUWYgaiSfP3NgMbYVIWUj2vEgwmD41
         /gg7OiuRRXg6mVKHgqhs66NpXE7VMmX/RCF1SrsI/OzH7zNJ/nSCPvVjJi3TmfIvqcyI
         JHlXLyDoEjXVSi6hqtxh/9MOJeaV7GaRxjeUe7IPDfpz4qj8f8pI0yv+QlowVFCl2zeq
         6SARencQMtUO3m5ly6db+ZwRvzHOy3BReYja+0R4knby4XzDOPatw8YE2kVvUvshmuyn
         aFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016305; x=1746621105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQdFT3CXC+wTZfljV6k5GYo/bu5BlFIO1d2AXG/ww5k=;
        b=oEZUHc5SL5/RjXa213P6SgU9/1GoNVm3sAGjP7XUmApzfcgJkZ180EVge54WXpBZzl
         eBx0kglndCxlAy1WiNCGxqttDmpr6cEe8lph1U+ogmcocKlC7kUoLJE7KlFarmiWgy4i
         9Fgb4Vrqo7a+19mdlcETR969TwWO6Ub+Pip56AjS8o85gPSVwEtTAhaOV+8/qGu6c1dE
         IaqO6hj5vlybjNqSO6fEuHqw4hS1daQeIL2bs1BXx9AU2D2gwT7tDrsuLdsHkzKNycy6
         hGz0W2KEYDBQ67LbOMGhnRsJztFr+TBe74KgjiXVSHFqtppZ2l2lzOcPnRvx4ZnZ9XJ5
         VpRw==
X-Forwarded-Encrypted: i=1; AJvYcCUmNhRw6DQ17FRlEpex7PD9eLIaQmeRYE+DTZ47hAtMRS43Lcgn1xh5zz6PufqkKOI9wraDtvyHiKmteio=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPxbPGNyuZjdDw0vSX3Y2cEZp7MBryKVpvS1EkQbobSMuy+of
	w9JfsvY2xDNOROq9YfexljX208QAz82Hk4KRXOH5rnUpsrZzdnYwkjhhB++be72fZND5MCxXz+l
	B/pv/sex68po0Y4sJp2MprzfpN15DBAj2tmAyow==
X-Gm-Gg: ASbGncvGlsrgoNI+kR1fMPvzc5JXFvMVSSRGKTRsRVLHxm443Oh0G2mTQ8NASY4Wg37
	e2VbQNh2CAP+n7+aGY1R2ur/lS55OJuIaS1IQU+6FA/4sOWpIcelpVIHoXGoS2Gt1ifnIWRXHZh
	YN5fs12cqW6WB/EVjG3y4M
X-Google-Smtp-Source: AGHT+IGfvBwJh4zz3xEM3UjmypYEXhK/G1AKoUritCmLIeHI7FHNqa/gt+tifNrWGAKJHEQ9PLJaI4U7g+B5adalWJ4=
X-Received: by 2002:a17:907:1b22:b0:ac2:7f28:684e with SMTP id
 a640c23a62f3a-acee2156d04mr220073966b.6.1746016304702; Wed, 30 Apr 2025
 05:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429151800.649010-1-neelx@suse.com> <20250430080317.GF9140@twin.jikos.cz>
 <CAPjX3FfBoU9-wYP-JC63K6y8Pzocu0z8cKvXEbjD_NjdxWO+Og@mail.gmail.com>
In-Reply-To: <CAPjX3FfBoU9-wYP-JC63K6y8Pzocu0z8cKvXEbjD_NjdxWO+Og@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 30 Apr 2025 14:31:33 +0200
X-Gm-Features: ATxdqUFvNwkrZ_ZJns0Di-9O-zxMlXjm4v3Z-u9nF9TmaduaVWP58rZ50t9cRxY
Message-ID: <CAPjX3FdpjOfu61KTnQFKdGgh4u5eVz_AwenoPVNgP_eiuka3hw@mail.gmail.com>
Subject: Re: [PATCH] btrfs: remove extent buffer's redundant `len` member field
To: dsterba@suse.cz
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 10:21, Daniel Vacek <neelx@suse.com> wrote:
>
> On Wed, 30 Apr 2025 at 10:03, David Sterba <dsterba@suse.cz> wrote:
> >
> > On Tue, Apr 29, 2025 at 05:17:57PM +0200, Daniel Vacek wrote:
> > > Even super block nowadays uses nodesize for eb->len. This is since commits
> > >
> > > 551561c34663 ("btrfs: don't pass nodesize to __alloc_extent_buffer()")
> > > da17066c4047 ("btrfs: pull node/sector/stripe sizes out of root and into fs_info")
> > > ce3e69847e3e ("btrfs: sink parameter len to alloc_extent_buffer")
> > > a83fffb75d09 ("btrfs: sink blocksize parameter to btrfs_find_create_tree_block")
> > >
> > > With these the eb->len is not really useful anymore. Let's use the nodesize
> > > directly where applicable.
> >
> > I've had this patch in my local branch for some years from the times we
> > were optimizing extent buffer size. The size on release config is 240
> > bytes. The goal was to get it under 256 and keep it aligned.
> >
> > Removing eb->len does not change the structure size and leaves a hole
> >
> >  struct extent_buffer {
> >         u64                        start;                /*     0     8 */
> > -       u32                        len;                  /*     8     4 */
> > -       u32                        folio_size;           /*    12     4 */
> > +       u32                        folio_size;           /*     8     4 */
> > +
> > +       /* XXX 4 bytes hole, try to pack */
> > +
> >         long unsigned int          bflags;               /*    16     8 */
> >         struct btrfs_fs_info *     fs_info;              /*    24     8 */
> >         void *                     addr;                 /*    32     8 */
> > @@ -5554,8 +5556,8 @@ struct extent_buffer {
> >         struct rw_semaphore        lock;                 /*    72    40 */
> >         struct folio *             folios[16];           /*   112   128 */
> >
> > -       /* size: 240, cachelines: 4, members: 14 */
> > -       /* sum members: 238, holes: 1, sum holes: 2 */
> > +       /* size: 240, cachelines: 4, members: 13 */
> > +       /* sum members: 234, holes: 2, sum holes: 6 */
> >         /* forced alignments: 1, forced holes: 1, sum forced holes: 2 */
> >         /* last cacheline: 48 bytes */
> >  } __attribute__((__aligned__(8)));
> >
> > The benefit of duplicating the length in each eb is that it's in the
> > same cacheline as the other members that are used for offset
> > calculations or bit manipulations.
> >
> > Going to the fs_info->nodesize may or may not hit a cache, also because
> > it needs to do 2 pointer dereferences, so from that perspective I think
> > it's making it worse.
>
> I was considering that. Since fs_info is shared for all ebs and other
> stuff like transactions, etc. I think the cache is hot most of the
> time and there will be hardly any performance difference observable.
> Though without benchmarks this is just a speculation (on both sides).
>
> > I don't think we need to do the optimization right now, but maybe in the
> > future if there's a need to add something to eb. Still we can use the
> > remaining 16 bytes up to 256 without making things worse.
>
> This really depends on configuration. On my laptop (Debian -rt kernel)
> the eb struct is actually 272 bytes as the rt_mutex is significantly
> heavier than raw spin lock. And -rt is a first class citizen nowadays,
> often used in Kubernetes deployments like 5G RAN telco, dpdk and such.
> I think it would be nice to slim the struct below 256 bytes even there
> if that's your aim.

Eventually we can get there by using ushort for bflags and moving
log_index and folio_shift to fill the hole.
Let me know what you think.
