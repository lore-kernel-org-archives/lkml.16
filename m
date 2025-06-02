Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067C71FBCAA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895285; cv=none; b=Tm1UZe3Z62qyOVeI6HFePZW4W2pQLpOYOBEbzRPk/nSNTNIZ1ETHrCmT0QlrGohGniKuRAgVjXKitvTQ/skS67o40LewarBJMyyISptS/lgD9DZ89QKhZPTYC+YvDrOJlpJ7wQKVRvTiPDAled69oQWcon4BOgeTiC74diz3nI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895285; c=relaxed/simple;
	bh=kS/bsy+uhv6gOxE5X4hexWYd4Mke4QRVwAg+eYLpX9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5otYBgk+wFHm+S66FvaYiXmu8FsTvNBdhIaY43QSxwiiZebb+y0FfWf6L580asEa2LOVPQGradNbS9rRHM5ar0oGKfq2MSVtEPyWKK9NPAQgNupCg6Fw2hCwV3Fy8+vPzs2z03KRHF7CCh02k4f0EjcOo87uDMBqK+Vm8ceDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cwaSPDmR; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cwaSPDmR"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47e9fea29easo23361cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748895283; x=1749500083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwQnFbUo1N2mHM92qaWb3kQKZuFrMPSfsPxvdB2R+/M=;
        b=cwaSPDmRAUzrePob0k+k0b6N04ndeIQm2sTOPdurG3eFien1VjbOawFXs30eUqufiw
         1be0sUTUj5uxB6nAtvbHEniM1mYnTJQojJpy431KG3iTmKI7jDM+4NuWBeLqk1BfuD8U
         pOa65jgSso9Z1NKENH2rHLTC69+myGcCRel/bD2/RWqQE1aJUKyEBP7kuanRBqfVuLmQ
         /9uxl3UVBVKvdmiQwcrSzqk5DQoY4GQcvdJCVR3sPtc4sgf/Oa17EMcHy21mDXGalOoo
         59YjRmYqg77+uts81m6WY80XO7MdZxkVUww0y8+I0Z3CfDCMU4CLF98QsAfH+rv7++f3
         K4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748895283; x=1749500083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwQnFbUo1N2mHM92qaWb3kQKZuFrMPSfsPxvdB2R+/M=;
        b=fX6krrRNsY0tEI877wB2zTbFT6fGwNHnpOCoIvvdUdV3pRDlCSqWmsdDnbB5qLA9P2
         8gN1mH3xzEqzyvpVsLKCCganjNoe87jkZjdl5wJxJXtcILbsLB673fM4rlDtT+tr7eat
         df7TJz7tGOdwra9A5C3/SHaecVXb5fhNcVbhJOwReq27WpXvpzL/10HVg7YelaRTaucG
         lmeVXgpyfox7PRX53o9fg6DYRKbe0kUy0NFrUnjAqw6Qd+N+Md42ApGnLNGEAROCQB37
         Kxhsx6yhuV1tFTiZaeDT/195L6D8mH3XtYt0uq/tb+BiEpLygytgIaKuSbKzEMDJnMXq
         TZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOZXfaP/YBKQ14qsTWs2UIi+QRYTIIDEmx7AojDwucNXrSgRZE9NfL1sV8gI/irHqi8UQ+rSoKcvPVBF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz7AW7Rh/0iHL3L8li+wpi71Kecytzqd2/BG+ZgttQ7y1tj5sD
	ELx5rGEZ8fI/ht5k16im8NguN/H1yLOUX5it47q9a9K4MKI7cv6EcVKujFHzbjCnZ7E63DTENd2
	QnxmmC48C+WEk3DeojDJZQaBWxDd8SjpsPpLjnZb4
X-Gm-Gg: ASbGncvUClRtGkZV4chyxuVN62qjslO8tQrfvexidfm9MDJ1e4QFnndLjD2x+ei0XsH
	M0ssd20XQEHUADT2TpA0ZBPzWM4AxaUHcMfNDR0J6gfl8YjOMQNrwLvMLLjt25GFAov1lpCDwOy
	/Gusrk9EWXvkC/4t6Ms7TpK4ODP2UTmKKXArPlH7lNWA==
X-Google-Smtp-Source: AGHT+IHS1Xuh/mkhShSbemTOHzwc83Ro0NQEj5tcsy8NUaxxy70g0c+O2S/bgtb7kh2vhk9V7euCmgoqvOscgREDl08=
X-Received: by 2002:a05:622a:5a8c:b0:494:b06f:7495 with SMTP id
 d75a77b69052e-4a599c0b392mr801471cf.24.1748895282492; Mon, 02 Jun 2025
 13:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523165240.1477006-1-usamaarif642@gmail.com> <aDQ85_EeqibtbUR-@hyeyoo>
In-Reply-To: <aDQ85_EeqibtbUR-@hyeyoo>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Jun 2025 13:14:30 -0700
X-Gm-Features: AX0GCFsx49DltDxH36HyfGFlzyg2a8nzrdGMMurlo83ISlyHoByff7f22IoWlCI
Message-ID: <CAJuCfpGsrt=UrmvaWKX32w9_mYiDVgG6N-K_0F8aKs5dntOLog@mail.gmail.com>
Subject: Re: [PATCH v3] mm: slub: only warn once when allocating slab obj
 extensions fails
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com, 
	linux-mm@kvack.org, kent.overstreet@linux.dev, cl@gentwo.org, 
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 3:05=E2=80=AFAM Harry Yoo <harry.yoo@oracle.com> wr=
ote:
>
> On Fri, May 23, 2025 at 05:52:40PM +0100, Usama Arif wrote:
> > In memory bound systems, a large number of warnings for failing this
> > allocation repeatedly may mask any real issues in the system
> > during memory pressure being reported in dmesg. Change this to
> > warning only once.
> >
> > Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > Closes: https://urldefense.com/v3/__https://lore.kernel.org/all/17fab2d=
6-5a74-4573-bcc3-b75951508f0a@gmail.com/__;!!ACWV5N9M2RV99hQ!Nv5xX_X4cBQR_H=
UDO6qfamxI0GEW1eFRCpPj29lANRashIUJDrEWAjU7vlys76FH0voShW07CjpDkzSST46Irg$
> > ---
>
> Acked-by: Harry Yoo <harry.yoo@oracle.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

>
> > v2 -> v3:
> > - Put warning back, but only warn once with pr_warn_once.
> > v1 -> v2:
> > - remove the warning completely. We will have a way in the
> >   future to indicate that the mem alloc profile is inaccurate.
> > ---
> >  mm/slub.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/slub.c b/mm/slub.c
> > index dc9e729e1d26..36d7c43a6f2a 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -2102,10 +2102,12 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s=
, gfp_t flags, void *p)
> >
> >       slab =3D virt_to_slab(p);
> >       if (!slab_obj_exts(slab) &&
> > -         WARN(alloc_slab_obj_exts(slab, s, flags, false),
> > -              "%s, %s: Failed to create slab extension vector!\n",
> > -              __func__, s->name))
> > +         alloc_slab_obj_exts(slab, s, flags, false)) {
> > +             pr_warn_once("%s, %s: Failed to create slab extension vec=
tor!\n",
> > +                     __func__, s->name);
> >               return NULL;
> > +     }
> > +
> >
> >       return slab_obj_exts(slab) + obj_to_index(s, slab, p);
> >  }
> > --
> > 2.47.1
> >
>
> --
> Cheers,
> Harry / Hyeonggon
