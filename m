Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3055233D9E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796316; cv=none; b=op76Ks++HM4RZ4UvP2otrRy940S9/vXKGcNd87wagccpzti+edN0ByoPyAwkUO/uUNLrIFG+DUa9O03ZEgTsaG4rOkn13MpIr0Z6NoyWDyGxsNbKvh7MdrzD/Y4G1lPedpKFAxvVUqvKwCfIA2Gs7SrLn4Ceh0/kSLMPNz1FXr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796316; c=relaxed/simple;
	bh=HGNLb7eunt65kyYDY5BhHdHIgNTRP+OEJWJQt1g2nDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGDzywjlbvbkQik//GWfkN0wUhFTFJcXZ2/pCGsk2NzkDUsrZscsrPlyzrZo2RM5XzjQOL5ZovFfPUJndCoDAJOaquv5cIe8leTtt94HvzrERlpAESSe/oEDbO+kQ2ZILzFSJX6qyvV3ypF+XCeSo25A17kKNmM/XAqaJH+1WXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU8PgsMb; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU8PgsMb"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso2647453241.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744796314; x=1745401114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGNLb7eunt65kyYDY5BhHdHIgNTRP+OEJWJQt1g2nDU=;
        b=MU8PgsMbWwv0YwiIbdQvH7ultc7M+A4SyEyMsJDMAqIVOMT/ElxC7jgXe5tOm/7LDe
         4+n2Aeq4Bf8b2M4CrjZyAm7FdLo+ciE3KFgnADy6v+J8WlNL0eHoRKz6vl2iSKeL3lnH
         vYxFSmlQwFz99dG543WlrdUOwHWnhOHdjp/BSBRV7TnGYmxSq4ZMKqf3zQba8glVc68c
         qc1+HVo753fh9dMk8OcFt0sYMEfnfoaojFT8JBGJBOoo/3CPhr7/NkBaGQ8gesQ2mwmP
         Qadq0KrnE5ESKfk9/ANI+7IkWbJEfBnMcSnfYgEbSx4BbEiD9V2ke5kv09tkUrvM1tmY
         k65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796314; x=1745401114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGNLb7eunt65kyYDY5BhHdHIgNTRP+OEJWJQt1g2nDU=;
        b=Au92QDx+rxH+7wNGU0odAlPjbo4IdkYMOVejo8Lk4glcPmmYU3dSPjzgReBosISoit
         fAloTsHA+ZfdGPFtK3H2DYbe1JVGcuy4x6NuwzBY2Dc9QKF4rknaQKQhnfsPStsbX2Rj
         ln8dE1FyV6C5vw5mOPkmX0jtaP4Bg8kz0ogVx2zZsmWoY4JaZ/l+CKVNFmtPHaNgycNj
         q+koXHydgu9JoddJFQbjdOFftxG69bSDnWDvQdOd+q9zJa+3P1xO3Ujh6nshCh68+wkF
         aNxgEvAKG+jxUKSTtl3gX6bD1IFbRyGKCTIa0ek9IMygHkpxnQbDKrbefC+I2n5j6HxC
         TANg==
X-Forwarded-Encrypted: i=1; AJvYcCUmwH+fnjOkUdpwB+P05j/uHByBoVeGNjdrxkGsoZkAllSQgUtXCBdDXdj1P9yOsRcqKWZ6BtLHw2MQwcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK85g5ojD8Z1YRBI4BWzcW6CUhT4O/s9U1+PcCUR+23ktlxn8P
	/W9707yauvBLyNJkrZ+3A5TAR894ChHZoShwrAqPZ+X7emT3V1n5/65Aj68xayes6J0YYj2Xlt8
	m5SCCYj9pFryp3OjR4i5/eQhittM=
X-Gm-Gg: ASbGncu8K8c2FPnrmWC+wTTzChJlh1uGaosBo+AWDchw0OwO2aQ+lHJX9OvWFpLo0Zx
	J96CBEFllzFfsOALyMOHaxNjq4WsZs1jvdxPELRCPRBHoEt6FjKBp7A3emjeSqRXrm6Kvs/4qcY
	CgpQECLQPtuf07PNTZCjAmrg==
X-Google-Smtp-Source: AGHT+IELdpibobvtt5Kb86Q7ML3F+ZGjbT+Kep31cg3nW5EqxnxDcUCZlOz8FTxSS8hKaMA5HVwE0kqF0TgLw0+FoZM=
X-Received: by 2002:a05:6102:53ce:b0:4c1:7ac9:9f67 with SMTP id
 ada2fe7eead31-4cb591bc3b9mr266822137.5.1744796313681; Wed, 16 Apr 2025
 02:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412085852.48524-1-21cnbao@gmail.com> <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
 <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com> <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
In-Reply-To: <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 16 Apr 2025 17:38:22 +0800
X-Gm-Features: ATxdqUHv-sV6W1FvCZuhvrWTo6msnwbYyAFoTYjFi1F0eQxZE1WMVvCxKTYGegk
Message-ID: <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying processes
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Matthew Wilcox <willy@infradead.org>, Oscar Salvador <osalvador@suse.de>, 
	Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:32=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 16.04.25 11:24, Barry Song wrote:
> > On Wed, Apr 16, 2025 at 4:32=E2=80=AFPM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 12.04.25 10:58, Barry Song wrote:
> >>> From: Barry Song <v-songbaohua@oppo.com>
> >>>
> >>> Promoting exclusive file folios of a dying process is unnecessary and
> >>> harmful. For example, while Firefox is killed and LibreOffice is
> >>> launched, activating Firefox's young file-backed folios makes it
> >>> harder to reclaim memory that LibreOffice doesn't use at all.
> >>
> >> Do we know when it is reasonable to promote any folios of a dying proc=
ess?
> >>
> >
> > I don't know. It seems not reasonable at all. if one service crashes du=
e to
> > SW bug, systemd will restart it immediately. this might be the case pro=
moting
> > folios might be good. but it is really a bug of the service, not a norm=
al case.
> >
> >> Assume you restart Firefox, would it really matter to promote them whe=
n
> >> unmapping? New Firefox would fault-in / touch the ones it really needs
> >> immediately afterwards?
> >
> > Usually users kill firefox to start other applications (users intend
> > to free memory
> > for new applications). For Android, an app might be killed because it h=
as been
> > staying in the background inactively for a while.
>
> > On the other hand, even if users restart firefox immediately, their fol=
ios are
> > probably still in LRU to hit.
>
> Right, that's what I'm thinking.
>
> So I wonder if we could just say "the whole process is going down; even
> if we had some recency information, that could only affect some other
> process, where we would have to guess if it really matters".
>
> If the data is important, one would assume that another process would
> soon access it either way, and as you say, likely it will still be on
> the LRU to hit.

I'll include this additional information in the v2 version of the patch sin=
ce
you think it would be helpful.

Regarding the exclusive flag - I'm wondering whether we actually need to
distinguish between exclusive and shared folios in this case. The current
patch uses the exclusive flag mainly to reduce controversy, but even for
shared folios: does the recency from a dying process matter? The
recency information only reflects the dying process's usage pattern, which
will soon be irrelevant.

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
