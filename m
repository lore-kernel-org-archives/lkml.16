Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575871F0E20
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321455; cv=none; b=AUxYqT5tA73XaeLwC/RomYVM1jl7jmlPUAmRYULk6X/xDsy7BnPPeCR46tSWyVYLVK4Ir1j+ba32MoZIFem3ywZVsuI/iysMP5bbH0S24FJ9EfR6OO4n0eZkPelPGQnPSqgbMxqvO0f7Xg93RPbaZbzpCgTpowRipW9+CIFI7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321455; c=relaxed/simple;
	bh=hehqUbJr7rLAsfjf8NUGx4WWTp8rlzuMgfHd+H9FD54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcgKpQJBk1kkp6b1BflGEkU1oSyT2Oug/fHNd33ePf6cE8mHiLGHsMPEPVwV5jNv+glArOIkF0+hfP10cA+DOt5De90CUy4poCX1XGRpGj91+V9I/G8DPlsADdbN4BIdJzwHLT4yWaHXTiwM8FFvTiV/e7yrcAfJPWH9L5jyijQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S/d7PWgF; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S/d7PWgF"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-48b7747f881so319031cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747321453; x=1747926253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TESZwvrO5vJ96YaJ7vnx+FVieN+/kHd9koL3nGIsUYA=;
        b=S/d7PWgFFnnZxdjn3GgcvIu7sS75kTWvNpwtyr9yC1wViDDMipRGI9H27h3PcyY9Jc
         KOGuFkXW/WzVbPCRq3D/cPbal8sRpHHRyI4oQ96E80X1eC8uY99hMWEmERatSz7x/oqC
         rTgnTXok6vfWy1nfGpmHaPXHLRbX5vtj9faH28dY8VD116hy7dkDqEZd/onykO5uoA4M
         mOqcPXAe1ETgcm0q0mFHl6Qv0eODYK/UPdx62fb1J0ZuBA2R2bL/UGkkkxx4thKS2r13
         EVeEFYQ2LhB0iO0KC33d7usd8gKHKKiaOXo1cpAHKXr5Whz+KsoDnQJA3KXVdKOLytrf
         1VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321453; x=1747926253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TESZwvrO5vJ96YaJ7vnx+FVieN+/kHd9koL3nGIsUYA=;
        b=gD8bwX0AH6CpXIKMYD0vz7fkbxFfQIZ8z0pOGvrUSmNSQRLZXuDqvr4NyXH46WgzuV
         zP9551B5iOByuplcGX0H70xRk+Ti1Q54I7dcgzvioaIy39zFPLJMgxuQW6/UmwHL9xZJ
         lt1P+a9Ff/0KmIuqmc22LQJ6IuepwR91Pu4pib52DC359gxFi5UOM/Vk2uOhh28Lueoh
         n1x+7TxW8lD9wZXSrrRr9qyysD8KgSpo9sytJau1gvPlnQ3ijNXZ80do8J49kXLrMMbo
         V4KVAkZYLPJP3ngZTstLHbGzDsAiw/UgnmZfU8gf1+P76fHmetl+Lah35ESOMCWN9sI6
         UUEg==
X-Forwarded-Encrypted: i=1; AJvYcCWG5pAKOu+4W4jcuzGcpyRlv/yddzum3zh1J2bfZmVbfmPrpMqfVzgrqQs5w8uFkN0+lWbde3c23gX1TlA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60khH81j43uLdJIDk3l2J69Gn1i8FfmMDvN4QIiEzZHaFidWf
	SLmhuUJ3PQQA/nWcU5zXroPIhrAQuvjDLW9fu6yvrkMd3M56riowk/xx2nIljxELNRTIXxIaXMo
	wNRkPD2DHb1PMUk6dMqPc3euamE36KufLJ6dB5eh+Kl65T80DzKbkvrpK
X-Gm-Gg: ASbGncudk4//pQLBJ3RCS2E3OfP22loC2donYV9j+LSUJJVopvHdInurUiSxG8IHcj+
	FJcQeZ4UjufzhO72c+5TQFLuqwE31A+y0qpK2lu1rBlZoK8AG8ckY79n7mdqnuuGHfmfxMpVlpg
	KO/7w8ttDcw2WxkKQRYc72plsupajP6GN9ktejdy9gwxpEGvlunoBppwdzuUM8zA==
X-Google-Smtp-Source: AGHT+IFfkR3W5VNelP+GA4ohCT0Dcsb8uCPnGXBpE2Rk1IDYPjmDvQ6kKMdPCaRrMQMfaOuaSbnoPb4rTNAIPHov2Iw=
X-Received: by 2002:ac8:5d50:0:b0:491:8f3c:ce0c with SMTP id
 d75a77b69052e-494a1dd13a0mr4202841cf.18.1747321452737; Thu, 15 May 2025
 08:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-slub-percpu-caches-v4-0-8a636982b4a4@suse.cz>
 <20250425-slub-percpu-caches-v4-2-8a636982b4a4@suse.cz> <CAJuCfpGVx2jG+S2ch2hqK=sAdmTcs9dW0kOdopxgLtH4V_wNXQ@mail.gmail.com>
 <f181285e-4167-4581-a712-8e444a0ab2bb@suse.cz> <07f321d5-4416-4be4-9696-00f0d83895f5@suse.cz>
In-Reply-To: <07f321d5-4416-4be4-9696-00f0d83895f5@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 15 May 2025 08:03:59 -0700
X-Gm-Features: AX0GCFvqG0RSuXzDDSF9fFI7cyINP9lGj2diMh8ie4U2ZfZ3NqqakHD4TgfWFYE
Message-ID: <CAJuCfpG6cCo1WUo3N116DOavmRE6=aeS_s2Hzceqdytgc955xw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] slab: add sheaf support for batching kfree_rcu() operations
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Christoph Lameter <cl@linux.com>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	maple-tree@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 1:45=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 5/14/25 16:01, Vlastimil Babka wrote:
> > On 5/6/25 23:34, Suren Baghdasaryan wrote:
> >> On Fri, Apr 25, 2025 at 1:27=E2=80=AFAM Vlastimil Babka <vbabka@suse.c=
z> wrote:
> >>> @@ -2631,6 +2637,24 @@ static void sheaf_flush_unused(struct kmem_cac=
he *s, struct slab_sheaf *sheaf)
> >>>         sheaf->size =3D 0;
> >>>  }
> >>>
> >>> +static void __rcu_free_sheaf_prepare(struct kmem_cache *s,
> >>> +                                    struct slab_sheaf *sheaf);
> >>
> >> I think you could safely move __rcu_free_sheaf_prepare() here and
> >> avoid the above forward declaration.
> >
> > Right, done.
> >
> >>> @@ -5304,6 +5340,140 @@ bool free_to_pcs(struct kmem_cache *s, void *=
object)
> >>>         return true;
> >>>  }
> >>>
> >>> +static void __rcu_free_sheaf_prepare(struct kmem_cache *s,
> >>> +                                    struct slab_sheaf *sheaf)
> >>
> >> This function seems to be an almost exact copy of free_to_pcs_bulk()
> >> from your previous patch. Maybe they can be consolidated?
> >
> > True, I've extracted it to __kmem_cache_free_bulk_prepare().
>
> ... and that was a mistake as free_to_pcs_bulk() diverges in patch 9/9 in=
 a
> way that this makes it too infeasible

Ah, I see. Makes sense. Sorry for the misleading suggestion.
