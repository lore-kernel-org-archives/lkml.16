Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138125A647
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 03:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738726568; cv=none; b=IaJTuryJ8146pvcv7KC6s0kJ8xqTTCGpR7DRZrzv9G5pNGXOt1tcOm6AJfBjUlA6H3PCHL8107M6uRilNfhAcvg26ZvMFqKnk0zQx3qVAN57zk/si9X1ZhdD3psys45MdOc2qxcmnquqlGOy+2uSYAOb48pPANZxVvSPneVD4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738726568; c=relaxed/simple;
	bh=rztVMI6hdRUOsSoTAjJ5j3+21AKxW16OAwvQC/7LXRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0Wbq+FEw5i1hdHl5iQ5AOHXq3wRkQwuabq7pL3J2ATRgKOy623K6NnEVCSQGVJl/MhtMpEhFdu4dQ2RhEE2ZErrWyKJscZzq1uNIVELlhWrn322EZEYN4oYmfQiSp2BeTLdKjq/wbplOwKqj+Gru0kDlfGO4myqmNzF8PJw6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzhtnzIv; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzhtnzIv"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-860f0e91121so284583241.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 19:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738726564; x=1739331364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n10RVxffoWEGvCkuIbcBxYq25K+jPBc47Pi84M4vu5w=;
        b=fzhtnzIvrHbfvPgYp9prDytSI69Chk4Am/Z2dZMEP0ETlBL2x/JkOFbj/RteavrSrv
         3aXxwPW5Ly2ChFmgGFeXEGqAMAyV2j/gW5fJrNTI4Xmv7D5ODX6vCd0Fxfyjwu6jO8nr
         TnkliB/6ggTnOBbfrLJ8b2x1uVY9Zdqndvym4DIwcI/xN7iycu4QzQQWoD57A3D8V5cd
         JVg/PP5e8Ru4IWDcz/BLAEgRo+ke/oVVbwiP4sgE6R/uKmk/olM/bqbgDk7XWcbmk3Hc
         veRX8D6kT+LM9So8TfO6sIu+JA9wDlMLjolbs1+0Lsj/P626jVpACCVIwvJeYdTmppzE
         J53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738726564; x=1739331364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n10RVxffoWEGvCkuIbcBxYq25K+jPBc47Pi84M4vu5w=;
        b=pCKaWnxuKq+YoTWQFKfs46XAbdeQRrdsAVgM1KxXYKfzY2ofplxem/GqLRk8CFw+JH
         gvgULnIrl3eCUkbu1FxN/ZuUB3kM9MiMNiVH9h/qwrD76M1ariCXTEtfq7qmQpHfxLO4
         3ShkyTgxcsFaUXOq/yTg3YvvwjQKgu5VCt2L+bMGyIwjzEM8NrVy3P+a8lKIi5XQcAAc
         WEC5I+QGCWn+ikJjTTMbYUpQZWEcK5tGeSDtza2BNTmg9y/UqKUVD0qmK7PQhgwp8vHK
         jKqqjJAWamVDJvMCzicGKjKkb3bXrR5W3fHW2WtkMF0WgNQ4v3uhPgqNHnJiBhIGADCS
         FLYA==
X-Forwarded-Encrypted: i=1; AJvYcCXdyO3FJeSnG1XvMGA+0Ubq3dhMdCEAAEsf+RTVYHvvKgLdTQUM8iBCtNTWsR3PdwKKeWJgAh32VT3jec0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGUnRClJjjD7KP/rG/LkAJaVYq4xUPfEgN+JFws5zpBQyzQbR
	FRVm4d/AGW5WNupUX2OYhQ5VPuFrSiHW2Plb0VVvoAFFhmUl7u08dK2VRNPHdGxjCxYQ/SgFGOE
	CZoSWDdRBD+EPUUv1pWVxf223BBA=
X-Gm-Gg: ASbGncsvI7PNKlHpfN/MXOQMtYUSfljOwdhWrBoOz+sPqtihSu7QDiqM9iDO05Kv/yB
	NlGksf8lpiDv+dRWmwSHgEs0rIa+0H4Sy1AmqSjwRjpJPlfpmbCfEq9IRpjtSnIx8noFgEs/lpX
	/9AQBYwlI75pa6GV82SDV9m7xZIaTBIZU=
X-Google-Smtp-Source: AGHT+IGP4WsgiqUVX5HyqOYtIvh4Hq32IEZYHctOrR7MFUBGMBkylUMFNIOHuXx97Yh2py0mo+lW5Gea5XZG/gxtO2A=
X-Received: by 2002:a05:6122:2217:b0:516:1b30:8779 with SMTP id
 71dfb90a1353d-51f0c93d1fcmr880863e0c.6.1738726564404; Tue, 04 Feb 2025
 19:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115033808.40641-1-21cnbao@gmail.com> <20250115033808.40641-4-21cnbao@gmail.com>
 <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
In-Reply-To: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 5 Feb 2025 16:35:53 +1300
X-Gm-Features: AWEUYZnXwE_m5JMhkeEf-s_y5Z5EWucY3F69kva5tUuQ06iIfAx7YdL3KdTzTZE
Message-ID: <CAGsJ_4wFp5e3DkP2dk_Zar7Feu-LrAyqLG6X1181UeRHCh1pVw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com, 
	kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 12:38=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> Hi,
>
> >       unsigned long hsz =3D 0;
> >
> > @@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio=
, struct vm_area_struct *vma,
> >                               hugetlb_vma_unlock_write(vma);
> >                       }
> >                       pteval =3D huge_ptep_clear_flush(vma, address, pv=
mw.pte);
> > +             } else if (folio_test_large(folio) && !(flags & TTU_HWPOI=
SON) &&
> > +                             can_batch_unmap_folio_ptes(address, folio=
, pvmw.pte)) {
> > +                     nr_pages =3D folio_nr_pages(folio);
> > +                     flush_cache_range(vma, range.start, range.end);
> > +                     pteval =3D get_and_clear_full_ptes(mm, address, p=
vmw.pte, nr_pages, 0);
> > +                     if (should_defer_flush(mm, flags))
> > +                             set_tlb_ubc_flush_pending(mm, pteval, add=
ress,
> > +                                     address + folio_size(folio));
> > +                     else
> > +                             flush_tlb_range(vma, range.start, range.e=
nd);
> >               } else {
>
> I have some fixes [1] that will collide with this series. I'm currently
> preparing a v2, and am not 100% sure when the fixes will get queued+merge=
d.
>
> I'll base them against mm-stable for now, and send them out based on
> that, to avoid the conflicts here (should all be fairly easy to resolve
> from a quick glimpse).
>
> So we might have to refresh this series here if the fixes go in first.

I assume you're referring to "[PATCH v1 08/12] mm/rmap: handle
device-exclusive entries correctly in try_to_unmap_one()". It looks
straightforward to resolve the conflict. If your patch is applied first,
I'll send a rebase.

>
> [1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com
>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
