Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8616238D49
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809861; cv=none; b=eQ+baMeSlU28p/Y+CC6GHUfmOjNptU3M/Tj5sxLNjimKZqJoJv+y5dRmTjoSkl6bSKxgl8kZ1qOQKZQ2tsNhtGTwRBVxkiJyd3Nl2R0fg80uOW0LqIS8nGJg9pJ0zZv0X9vvoDRYBlivIhWXg9dF0+c0RzGwFxi1fzVhCo9Ohxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809861; c=relaxed/simple;
	bh=NO0nXmAnQ7j5tXqaFGEn07F6EM8NTqg7hgWX7A3fDLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rp6WuJ+Sf/mt+BjsgalTpxtZeIfaPSbMfyC8AImKNdH2c1+oWx+l1lZFwwF5FeiwcKmsxNGJ3OcFj4hK/idN90kUMRK/4tzCTiVx1x6os5gOwGJcS8zrMFCkGHsjZgOyX3m107sKRgJGBuy70mgaVFAQK3pCQs6jNANFMPb5EaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jEzR0BAW; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jEzR0BAW"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-48b7747f881so8111cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746809858; x=1747414658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F24KyM+dHHK/8s58wGurnqx6fLbmKft8hdksqto3gWs=;
        b=jEzR0BAWM3rnXF9PuCcuG4PBD28+vBKhXsmxgEvquhWclKHkkJJ9/pPeItdeeky2GE
         MLZ5itZcUq/3pZU1HrGEkqtvq2GxGEC00BAenExSe+uYgeEcILCRBFh7WjWKi5MygNgi
         CAuGQxw0DFmxTaddc4SYbyzNHKjfj9KsoyD+bSEpfUdyP8Qa+Uy9HQA1GIg9mPL9w8kx
         Hl6uLdc3RQf8wJg0ARvfB16X6ShG7/t8mtSAEwTX4WKZflNONTkBUZo9Z50HTVzWNsx7
         cfShVzoK3HL+DbvHXeyHQcQ98UaisBujRGsiGf0kyL4F5NCxFOIdZY5C9yMe4ExDThHl
         q3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746809858; x=1747414658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F24KyM+dHHK/8s58wGurnqx6fLbmKft8hdksqto3gWs=;
        b=BbW1TTWNxNUAFdt1jFt39BzzBUfOkMgJzbAoCDV7nFoBmIDdpBY4UOGkeKRvfHEmAL
         GouRTa1PCswPWLqLyBoB0rJ2IGJeVSBUpGQYWcXtyo5Q1PjbC7x0AWZDvYvWJK1+k5c3
         Tb6+PaojRCylv0/L7zMNCdI2KVpKFUgZBvJPQINOn+6iAxOXAaM2UCZqf0pl8//dF2Cz
         /q6Uw1T8omeBtWY/5BwT+3NkSmF7Zsw9wgUj+7RLg5ApfzZ6zL2ie29kRra+rtBB4q4m
         Y6DYHM6NuspMS4VKDcHSdiPTSZo52eLl5IZSnFaHuagsLeLUg16ctn7yWjmmW6MuTDvT
         G1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVDyFdN5gBgI7tn/LEjmr7b6ldhQwMOcglsD4Dp/26fZVZf1pXMeTzJRyjGDfyMqhVGa8n0jV0nwjLA54w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5lJVn0lm4Onm4JXg1HEJv6QxjeAxBtitg2FRg6cxH7FWIOMM
	vxzkuRTM/MTjU4qveGjeOKjMVJNdQFfmVZIs5axQIp9vdRHYWYdJtL1f9afqIxi8MNcphnzT/ij
	GiopctVVBZ5H7Ozq0gyIfdiLESfBvS2h0+cXf
X-Gm-Gg: ASbGnct6jW8Vaobmf2umahJtwgYg1tkIzLwmB9DQTmxuNRvmQQ3qV/qSEM/Wq9s3NO+
	Z0jQo2HUhpP6D71Nxr+ZDXea6YWIw2kUzKmhPR5rMGno2MWH8dv6t9TnElHQAzQ4atnKKIZIO3A
	KlIbLTiwO2+mDrvSBsTQNA1G3F9hu50s4=
X-Google-Smtp-Source: AGHT+IHHBbsmJ0bmeCCrkQJfIZZAurxuGxUrt4S1p/lpkCoKnn9OdxpzRAmNFP54h0k6EN8iq2GxI499tAqeBJVrPCg=
X-Received: by 2002:ac8:5748:0:b0:477:8686:901d with SMTP id
 d75a77b69052e-49453c274f1mr4781501cf.1.1746809858305; Fri, 09 May 2025
 09:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509061013.922944-1-00107082@163.com> <CAJuCfpH4eiSgZqdMTCUOU2VfYezZuLoJefc0wuOWor9eeNzNTA@mail.gmail.com>
 <152dd526.b05a.196b5e7b738.Coremail.00107082@163.com>
In-Reply-To: <152dd526.b05a.196b5e7b738.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 09:57:27 -0700
X-Gm-Features: AX0GCFvN6Os18FiJrCf9mnRsrDppqo2EjOlCjvvWSFSYDIoKEap76hfWqF2eGMw
Message-ID: <CAJuCfpHi1nAQ5FbPECE12j2-m7ndYQ739rY=RuNCB6AxeJM=3w@mail.gmail.com>
Subject: Re: [BUG?]Data key in /proc/allocinfo is a multiset
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:36=E2=80=AFAM David Wang <00107082@163.com> wrote:
>
>
> At 2025-05-09 23:56:32, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Thu, May 8, 2025 at 11:10=E2=80=AFPM David Wang <00107082@163.com> wr=
ote:
> >>
> >> Just start a new thread for this[1].
> >> There are duplications in /proc/allocinfo where same [file:line]
> >> shows up several times:
> >>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_allo=
c
> >>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_allo=
c
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_option=
s
> >>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_option=
s
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu=
_alloc_pages_node
> >>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu=
_alloc_pages_node
> >>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu=
_alloc_pages_node
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iom=
mu_alloc_pages_node
> >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iom=
mu_alloc_pages_node
> >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iom=
mu_alloc_pages_node
> >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iom=
mu_alloc_pages_node
> >>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iom=
mu_alloc_pages_node
> >
> >Yep, that happens when an inlined function allocates memory. It ends
> >up inlined in different locations. Usually that's done by allocation
> >helper functions.
> >To fix this we need to wrap these allocator helpers with alloc_hooks:
> >
> >-static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int orde=
r)
> >+static inline void *iommu_alloc_pages_node_noprof(int nid, gfp_t gfp,
> >int order)
> >{
> >-        struct page *page =3D alloc_pages_node(nid, gfp | __GFP_ZERO,
> >order);  struct skcipher_request *req;
> >+        struct page *page =3D alloc_pages_node_noprof(nid, gfp |
> >__GFP_ZERO, order);  struct skcipher_request *req;
> >...
> >}
> >+#define iommu_alloc_pages_node(...)
> >alloc_hooks(iommu_alloc_pages_node_noprof(__VA_ARGS__))
> >
> >See 2c321f3f70bc "mm: change inlined allocation helpers to account at
> >the call site" for examples of how this was done before.
> >Thanks,
> >Suren.
>
> Thanks for clarifying this, seems like a never-ending work...... >_<|||

Like anything else in the kernel :)

>
> >
> >> ...
> >>
> >> The duplication make parsing tools a little bit more complicated:
> >> the numbers need to be added up, group by key
> >>        81920       20 drivers/iommu/amd/../iommu-pages.h:94 func:iommu=
_alloc_pages_node 20
> >>      1441792      352 drivers/iommu/amd/../iommu-pages.h:94 func:iommu=
_alloc_pages_node 352
> >>
> >> The script for checking:
> >> ```
> >> #!/bin/env python
> >> def fetch():
> >>     r =3D {}
> >>     with open("/proc/allocinfo") as f:
> >>         for l in f:
> >>             f =3D l.strip().split()[2]
> >>             if f not in r: r[f]=3D[]
> >>             r[f].append(l)
> >>     keys =3D []
> >>     for f, ls in r.items():
> >>         if len(ls) > 1: keys.append(f)
> >>     keys.sort()
> >>     for f in keys:
> >>         print "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D"
> >>         for l in r[f]: print l,
> >>
> >> fetch()
> >> ```
> >>
> >> Thanks
> >> David
> >>
> >> [1]. https://lore.kernel.org/lkml/531adbba.b537.196b0868a8c.Coremail.0=
0107082@163.com/
> >>
