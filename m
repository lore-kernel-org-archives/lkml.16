Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24D22ACF3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182779; cv=none; b=pWbR4H6tbe3L1HE/97NL+WWMputF2L3+fqF8vnTwIp3T7kEOh7jqlgPmZWUXoiPfKJW2RY3ZV5SyIen5h1HQ7/myE2xpQHLAfseT/KJ0FWeq0m23o6oymo50IefMxEWaslionLSnImIQfIaQRdT0D6kGg0HsSDV5DG6YZ+zuVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182779; c=relaxed/simple;
	bh=t+06naoVmVF2AOSXqBSYrJu3yXVIfw+vx5pfjOIVMmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5qlDGLMz+DHPT+Qu6hpMgm/04KseMPSeDlHFWTlIJNcyMk8LMJc1N5KsgFQ0gwHIB10KInUqh03JdicTubQF80oNPic447OP1S1KrUYEjJMln2evqCm+E9DncEAzMKI2ephyAFX69l9UHyisrB1chtgNMovUXHnRA3jamAUdvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWY51kPc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWY51kPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750182775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VHVlghtOwl1iYTRYeyXrEKqXKy+rGsdhH54hG2oPsxQ=;
	b=VWY51kPcMLewrs0lCjf8YUK7r8bvORhnPRsKcyMqDt8BRhcvzFnEDUxeyx+DqLs+6h6ngM
	y1KmdD0GNUnwsFN+bVUVxsOt+6i6NtyxRL4QbKgzPhEi42znYMdogu8IP7KB/v3v5TX/4l
	7PlAPc8EW/Pl+TiRgclw++mzlXcNpjc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-7SPpdv4fOzWfUfehUx-4rw-1; Tue, 17 Jun 2025 13:52:54 -0400
X-MC-Unique: 7SPpdv4fOzWfUfehUx-4rw-1
X-Mimecast-MFC-AGG-ID: 7SPpdv4fOzWfUfehUx-4rw_1750182774
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e43123ec6so74188747b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750182774; x=1750787574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHVlghtOwl1iYTRYeyXrEKqXKy+rGsdhH54hG2oPsxQ=;
        b=UVFsJxGYnS56ApvNxzDjsLJIZfGAgcF81nQDQOxJQA/ExUCv7q9jS/l6HIP5QtxWbl
         MbW54urSjv6RA1sd1cdPpMgBxGbaTnHtDhcQmIyiXNZUiPhge1UuLBbdpUEQYgGD4ho5
         2MslUVdNeCEIYIXI3zQpijAYtIr/La0dhbLDplm8Q4DTPUogcFGa4N5dABscqK1zXkSD
         wASAGp/Vmc9PfV/tUfInqa2CUB7cRWI9caBzSbIp2jwBRHx7d0/9H+b3ubqFp/Q5Jz+u
         J3emsyFxBpydKAFxWzTdUEhVQjzpQVlhigqqLZl8roD6z61YpNOnZjVs9DwE9JLtQNPw
         q6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVOo6Ty4kQx+wa+WzEueFvHYfvEGN/59Rmwkm6VD6gjQiJ/hoMFjCshcjxny0K3eiD6mqExjbyTFr+AHi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXb4doiMoojubhFYnHgVAwSwv1aZWLtkDpp3PmtP4dUIvP/OD/
	qK+sUW2dBeWMxv5g1pz1nlcOZ/U9S548qj4ZKRf/uzAhdFyGu2p5xQYo7H3mCno+OI7BkcUrOQ2
	gbDgD0ECZNEhkLeP6V9dSYfaB3XxTXORDEk2EydeY+PWl+CGS15H+F6u66P7d0fx85L96Cjbo6Q
	mF5jivMjNoVvS5UA4ciwToRT1YYD8U05dPgUkS6DYz
X-Gm-Gg: ASbGncsfqOAvyc3gjSKhy66mgAY6whQ96mDuO5bwqk1nmoLqQHg1oU7+k7E4qH32VF4
	+H+ZTqi8hByimeCcEAZc9tRzOUv/lOVgly/NnbbZ38A3pDJjm42DtzSgFsGilzq2dlVETQ6AI9w
	vuUY/KJg==
X-Received: by 2002:a05:690c:9a07:b0:703:b3b8:1ca1 with SMTP id 00721157ae682-7117536e5f3mr174054077b3.5.1750182773969;
        Tue, 17 Jun 2025 10:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsuDUpqbT4Zm+fDNYLZyRvnIomvlXs1lgyYMEYTlPSDFNwpQpbOwB39H6AdaylUKoeEGHtBp3S/5ilov+jo+Q=
X-Received: by 2002:a05:690c:9a07:b0:703:b3b8:1ca1 with SMTP id
 00721157ae682-7117536e5f3mr174053697b3.5.1750182773635; Tue, 17 Jun 2025
 10:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515033857.132535-1-npache@redhat.com> <20250515033857.132535-2-npache@redhat.com>
 <fcd3phzewpgzghrzse3stxi7jz7b6l5uwnhqtswcfnqvuvktip@apqh2achkutn>
In-Reply-To: <fcd3phzewpgzghrzse3stxi7jz7b6l5uwnhqtswcfnqvuvktip@apqh2achkutn>
From: Nico Pache <npache@redhat.com>
Date: Tue, 17 Jun 2025 11:52:26 -0600
X-Gm-Features: AX0GCFswQblbC-fUl4LgnBDpA9J_EkZ2hl0iyVshZHwGMIbdVVRH-b1apF1auqA
Message-ID: <CAA1CXcDgu3bT-aUEXoFrVVYaTy_rAbdNmwMhzrkwb0+VxQM47w@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] mm: defer THP insertion to khugepaged
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rientjes@google.com, hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, 
	rdunlap@infradead.org, mhocko@suse.com, Liam.Howlett@oracle.com, 
	zokeefe@google.com, surenb@google.com, jglisse@google.com, cl@gentwo.org, 
	jack@suse.cz, dave.hansen@linux.intel.com, will@kernel.org, tiwai@suse.de, 
	catalin.marinas@arm.com, anshuman.khandual@arm.com, dev.jain@arm.com, 
	raquini@redhat.com, aarcange@redhat.com, kirill.shutemov@linux.intel.com, 
	yang@os.amperecomputing.com, thomas.hellstrom@linux.intel.com, 
	vishal.moola@gmail.com, sunnanyong@huawei.com, usamaarif642@gmail.com, 
	wangkefeng.wang@huawei.com, ziy@nvidia.com, shuah@kernel.org, 
	peterx@redhat.com, willy@infradead.org, ryan.roberts@arm.com, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, david@redhat.com, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, rostedt@goodmis.org, 
	corbet@lwn.net, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 5:25=E2=80=AFAM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-05-14 21:38:54 -0600, Nico Pache wrote:
> > setting /transparent_hugepages/enabled=3Dalways allows applications
> > to benefit from THPs without having to madvise. However, the page fault
> > handler takes very few considerations to decide weather or not to actua=
lly
> > use a THP. This can lead to a lot of wasted memory. khugepaged only
> > operates on memory that was either allocated with enabled=3Dalways or
> > MADV_HUGEPAGE.
> >
> > Introduce the ability to set enabled=3Ddefer, which will prevent THPs f=
rom
> > being allocated by the page fault handler unless madvise is set,
> > leaving it up to khugepaged to decide which allocations will collapse t=
o a
> > THP. This should allow applications to benefits from THPs, while curbin=
g
> > some of the memory waste.
> >
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Co-developed-by: Rafael Aquini <raquini@redhat.com>
> > Signed-off-by: Rafael Aquini <raquini@redhat.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> ...
>
> > @@ -315,13 +318,20 @@ static ssize_t enabled_store(struct kobject *kobj=
,
> >
> >       if (sysfs_streq(buf, "always")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparen=
t_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparen=
t_hugepage_flags);
> >               set_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_=
flags);
> > +     } else if (sysfs_streq(buf, "defer")) {
> > +             clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepag=
e_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparen=
t_hugepage_flags);
> > +             set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparent_=
hugepage_flags);
> >       } else if (sysfs_streq(buf, "madvise")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepag=
e_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparen=
t_hugepage_flags);
> >               set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_=
hugepage_flags);
> >       } else if (sysfs_streq(buf, "never")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepag=
e_flags);
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparen=
t_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG, &transparen=
t_hugepage_flags);
> >       } else
> >               ret =3D -EINVAL;
> >
> > @@ -954,18 +964,31 @@ static int __init setup_transparent_hugepage(char=
 *str)
> >                       &transparent_hugepage_flags);
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> >                         &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
> >               ret =3D 1;
> > +     } else if (!strcmp(str, "defer")) {
> > +             clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
> > +                       &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> > +                       &transparent_hugepage_flags);
> > +             set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
>
> There should probably be a corresponding
>                 ret =3D 1;
> here. Otherwise the cannot parse message will displayed even if defer
> was set.
Thanks Klara-- I will make sure to add it on the next version!
>
> >       } else if (!strcmp(str, "madvise")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
> >                         &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
> >               set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> > -                     &transparent_hugepage_flags);
> > +                       &transparent_hugepage_flags);
> >               ret =3D 1;
> >       } else if (!strcmp(str, "never")) {
> >               clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
> >                         &transparent_hugepage_flags);
> >               clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
> >                         &transparent_hugepage_flags);
> > +             clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_FLAG,
> > +                       &transparent_hugepage_flags);
> >               ret =3D 1;
> >       }
> >  out:
> > --
> > 2.49.0
> >
>
> Regards,
> Klara Modin
>

