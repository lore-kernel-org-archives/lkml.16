Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B121D5178
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744322413; cv=none; b=DkIxcf3DvCQHxnnfbXymSmnzlKj7ddUxFpAQtBjjVYqI3R4c6ZWWe4eMI9Pniu7AJg8aeyMi9/SqAX7g+r9tFo5zcHPj2JhcZFAWLVLeRzx9Y7q8fDaO4+gvWP2Q8koQYHKK5fzB2UWNSetLit4FrmuJy7rzZs4WEkeC7glpSB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744322413; c=relaxed/simple;
	bh=cqGtxI1BGnfmMlhZLW6kkWvhxcjVhEDts7Pr3YT2wPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=padkMiumlJloNZbIsBEKzrJNKwDiGtMsrlbXi/OU4YaJLleBPseiidJWOkiraw0yAYmRPniYXJkt4IjphPZBWmwWCIWE/ydFu8KBKr1OLzcRZAMfzkZx9Jq+r2bfAUj61suLHZLEbzGJ3JXtt5ROYbSJUgwVRhLAolFV9iWiZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KshUvv/1; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KshUvv/1"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d5a786c7cso580845241.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744322410; x=1744927210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzFUOXA2PlVpOukaGWjpW+Vwcf9Cq5O5NSrTad1d5OU=;
        b=KshUvv/1csZXSqYfuO8JR5rqtOXUMi+Gj2Fc4upz57jrn+svWyjMpWQ8Pdcl51KAaM
         z1ozTnUM9k+klaiI95JY4xIOF18pk/S1LKtdfX7aI8J51jCb30Uu6jPVSd6wqGk62Mil
         cekNkTZWVzVUz0g9W+Vzn3/XUS+lAXEapP05DdpZMlbLi8dgSOxG7O+kBomrTZ14CS1c
         gs7ZtY8GUUn3W2BHNPPcwB8bEQ1KXQiPpjoaZlfvM7po/wC1kdw2/y3nlwcemmwsxFx4
         OVt8s3g3oM9f1SdxSVi0Ku9Wn0EgYLXazMu+fs1WpMX+ThhHs7FFoRKxQA9s07Lw3mWS
         f+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744322410; x=1744927210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzFUOXA2PlVpOukaGWjpW+Vwcf9Cq5O5NSrTad1d5OU=;
        b=Unx/LSfJwmvrMbaYrUyIyXwevRjMiQ7k8oEzckmwf1RNVVJE1eWTXDhQCh2IRB/SDZ
         1yPQJ/ZXPu1RpUm8FzNYd7LHiOM7TiRCSaHIr83szzOjcZiyABp6OhYafiZ/b2vH3clW
         7Z+61lru3DSiPGVPhIK622VpuvsFZU6fikhg1twK/EmWQbUCX1XwtwzcU5VcbDFWs4yA
         NneIMPJYoGPCcsQdHVFZXMqjquQoi5PKJdi8G9dNgETsRFGc+Bk6Pz3HR1MiHptsOxG+
         wOpX4efd2FBG4wodGP/pT9YCb17cb2AYpNaiUbHhLaI6JPQLoZ8g2oRwSmnmNE1Ma9xV
         AoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2wM5xqpiuv6nELVjD7oIiloPMZMInTama8CqMznlrxs2AEtwu9WyNXa9Egu4ash+RyKgst32WtujuJWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU3nkvgA4b5yfvAo6ky+AyJCktnsGQF40zdroYcKT0xVFqQtmX
	7lWQpBxVX/ERY8+fzGYIbxSGlQ0ZdkzNSJGoK8vhDNOP25wj6hxSyCSzkZasHNvz3/yfiXdyqFR
	QuIr7hDja3G36qOm5mgUi9h5nWLUw1jMc3Ys=
X-Gm-Gg: ASbGncsvLrGdjLzU/TNfszKXkwSThODPj6/gONUHFBjvoogH6Ioq30S/qNU9eC87Mtj
	WMYVCOIh5w3Z0ZxRXqpuNohDU0YldWfPozb7IIDNMlTi7NWxVVolSdQpBEiljJ2hjkxnkBcU1bP
	EkeWVY65fndbyNemVczQlwL6UDqeGvxiad
X-Google-Smtp-Source: AGHT+IG1mDFRL8aYmm3d+t6l4YqCBQXEG7Iw89dS6jPTFRXPvNQYKWR8XwxBSPXKGx5bvg91dWVEnJzOAmoomFLTT80=
X-Received: by 2002:a05:6102:dce:b0:4c3:7f7:92f4 with SMTP id
 ada2fe7eead31-4c9e4ee6b5amr162309137.6.1744322410276; Thu, 10 Apr 2025
 15:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2d42decac5194c2c8d897b0424f0dcf3@honor.com> <Z_fYsyEA9hSEOoxp@kernel.org>
In-Reply-To: <Z_fYsyEA9hSEOoxp@kernel.org>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 11 Apr 2025 09:59:57 +1200
X-Gm-Features: ATxdqUHyAA6zq9M3v3P8tWmqRklK_8tZvzqB3nsGrqvZdL5RqHyESZYjn0IWJ2A
Message-ID: <CAGsJ_4wACEvWe-Fcx9fShkF8okEVb3srGDVCn0v0QjALq7nneg@mail.gmail.com>
Subject: Re: [PATCH] mm: simplify zone_idx()
To: Mike Rapoport <rppt@kernel.org>
Cc: gaoxu <gaoxu2@honor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"surenb@google.com" <surenb@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 2:42=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi,
>
> On Thu, Apr 10, 2025 at 12:03:00PM +0000, gaoxu wrote:
> > store zone_idx directly in struct zone to simplify and optimize zone_id=
x()
>
> Do you see an actual speed up somewhere?

+1. Curious if there's data indicating zone_idx is a hot path.

>
> > Signed-off-by: gao xu <gaoxu2@honor.com>
> > ---
> >  include/linux/mmzone.h | 3 ++-
> >  mm/mm_init.c           | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 4c95fcc9e..7b14f577d 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -941,6 +941,7 @@ struct zone {
> >  #endif
> >
> >       const char              *name;
> > +     enum zone_type  zone_idx;
> >
> >  #ifdef CONFIG_MEMORY_ISOLATION
> >       /*
> > @@ -1536,7 +1537,7 @@ static inline int local_memory_node(int node_id) =
{ return node_id; };
> >  /*
> >   * zone_idx() returns 0 for the ZONE_DMA zone, 1 for the ZONE_NORMAL z=
one, etc.
> >   */
> > -#define zone_idx(zone)               ((zone) - (zone)->zone_pgdat->nod=
e_zones)
> > +#define zone_idx(zone)               ((zone)->zone_idx)
> >
> >  #ifdef CONFIG_ZONE_DEVICE
> >  static inline bool zone_is_zone_device(struct zone *zone)
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 9659689b8..a7f7264f1 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -1425,6 +1425,7 @@ static void __meminit zone_init_internals(struct =
zone *zone, enum zone_type idx,
> >       atomic_long_set(&zone->managed_pages, remaining_pages);
> >       zone_set_nid(zone, nid);
> >       zone->name =3D zone_names[idx];
> > +     zone->zone_idx =3D idx;
> >       zone->zone_pgdat =3D NODE_DATA(nid);
> >       spin_lock_init(&zone->lock);
> >       zone_seqlock_init(zone);
> > --
> > 2.17.1
>
> --
> Sincerely yours,
> Mike.

Thanks
Barry
