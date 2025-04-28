Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7F27934D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852234; cv=none; b=srs3RrIWQnnqJ+5dk8wkSpZqxa6GKdPWGT2SlyDEc3vHhlGSMuinfeh12FwjPOsFVBDne2JQHxwEYokyt9o664/0fX2CKYx3HMTm8+K+QDNikFqxA9PtNl6peAR9vre/1cD6UXxoSAGAEZNf6BS1m0bGHGI746IqtljpnhRQPx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852234; c=relaxed/simple;
	bh=tQKS6ESMU4XqVh1loYK5WinArQ9UR2bn/2B7Gb7Oafo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjoOFu/aglP1JQSVv6zW/3wDAxfmybOZtop4C5W6nrcUwLHEPqmfif34+uD1IFG9OEJrm0ajLRlXzQSdIdtn18L0ultcriyLHHA9cpiXghVvMoiwxZQxfhI/F7PWqRHiNKHVFAhoD4Q6qNMIbcaHCWOJL8k0kzogJK9yMtHgx9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HtHhelRj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtHhelRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745852231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y35svQEUNVinLjrbig+h/RI+A+7BGDLM2oykyzI/Jak=;
	b=HtHhelRj7gSgc/EShf5Jp8kUnl/OW5PeEIfvjWEI0olxfKMFcDwI/jckBWqSJPmrhbMI1C
	z8yuCky6Xofzha5UMZIVsvfNaXUvNt889/BICWAjcctINx0wZIU6AtfwpI9wvKE68jXjNU
	3Y5lLTUj/GSmNMAz+E8U3lTzd3upYCA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-7ZqEuQwkPceAFYML0JSk6g-1; Mon, 28 Apr 2025 10:55:16 -0400
X-MC-Unique: 7ZqEuQwkPceAFYML0JSk6g-1
X-Mimecast-MFC-AGG-ID: 7ZqEuQwkPceAFYML0JSk6g_1745852115
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7040773fd79so64733197b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852115; x=1746456915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y35svQEUNVinLjrbig+h/RI+A+7BGDLM2oykyzI/Jak=;
        b=xIdoMQMioeoI65w8aUCSs0YVr/Wf+0oFOwh52YZTWmiHCeNvmz5bVi6I8UVfSLAxum
         AHTgnmD1zWoz/cJlUOHmiPhyXxKKJOYrqRqQ7VAH5UBnnlet20taXmIogu/5A0c7cTkx
         fpVuteDG+DcSeOT3O6samX5UfSBZB0VBgP6DBgNxnZQRBvqIM1B5zmhniIJROSJNqZ4k
         lIQpqIBE+J50NBxYV2caA+tJZTrtmWNETer92Gv8SUL6oAIp70UVTJt0fqGDLb44Lj82
         q+TV5rj1qgFRJUURy5LUcnG2x0fIBRNrehWZ1ovjfTbJHXUWKc7d08MKsQ1RQb8waaw7
         pv4w==
X-Forwarded-Encrypted: i=1; AJvYcCWvI44tztwUiORiDqxJ7Bhs4cLo59RCqKIt80f9p9po8VYr6RiYo4poyy38QRJ4OHkOvNCT/Rw9xSuPYqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTSkfuF2VxxiweQwSYhdNlslA05P0RFQQWM6yGx55apgGDapU
	/B73vreiw5nVjmhQtkDqkVYRQMfhqLqut06WCaLDXuoIICV1TJlF5hAZvN+8n0U3Cgfz9fb5hsS
	wEiCE+pTy4ad1YF2J8g5Vew81ftyeKxaou1P28koyWLUwmwwzd4wBm975SNZI4AUEe/klKl+xu0
	TfBgdfTMGg6mEEfCMPRKJyLNldREMr6P0EhToWV9sHObldgj0=
X-Gm-Gg: ASbGncsmZ2cN1QB7vnixps0Lw42utlf+TJLAjOiuKyM4sSnniilaRs+dxv3SbCVFusN
	AgFu7tVi6bs03a3aaWWt79wlQ72jrYjGf+fTqvhifgfUfXiDIYffXUcLzpQL6Fg8TxUFSYSdCQn
	hVTYnn3+E=
X-Received: by 2002:a05:690c:39b:b0:708:1d15:e013 with SMTP id 00721157ae682-7089963f2cemr326127b3.7.1745852115080;
        Mon, 28 Apr 2025 07:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmPzgoIcf2zjGWAfQJdt3FvqX6eeOCmgl+PxaPPQiwuCUtJ53kFcyZuTL8sqPiYecQmPEK1B0eYwqIXjEZnPg=
X-Received: by 2002:a05:690c:39b:b0:708:1d15:e013 with SMTP id
 00721157ae682-7089963f2cemr325477b3.7.1745852114651; Mon, 28 Apr 2025
 07:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417000238.74567-1-npache@redhat.com> <20250417000238.74567-13-npache@redhat.com>
 <b22e222f-1d6a-4685-871c-1aaee319b744@gmail.com>
In-Reply-To: <b22e222f-1d6a-4685-871c-1aaee319b744@gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 28 Apr 2025 08:54:47 -0600
X-Gm-Features: ATxdqUEM4Y4YSJdY2ZlnauGjTRYOP-E22W7On3YrDJ0KhY5tdri4FdTql7M6Xhs
Message-ID: <CAA1CXcBQ6G70Pg93XphsXAwwHtJPbFuJb=OmfwK2s3q3aevGuA@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] Documentation: mm: update the admin guide for
 mTHP collapse
To: Usama Arif <usamaarif642@gmail.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, ziy@nvidia.com, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:04=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 17/04/2025 01:02, Nico Pache wrote:
> > Now that we can collapse to mTHPs lets update the admin guide to
> > reflect these changes and provide proper guidence on how to utilize it.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  Documentation/admin-guide/mm/transhuge.rst | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation=
/admin-guide/mm/transhuge.rst
> > index dff8d5985f0f..06814e05e1d5 100644
> > --- a/Documentation/admin-guide/mm/transhuge.rst
> > +++ b/Documentation/admin-guide/mm/transhuge.rst
> > @@ -63,7 +63,7 @@ often.
> >  THP can be enabled system wide or restricted to certain tasks or even
> >  memory ranges inside task's address space. Unless THP is completely
> >  disabled, there is ``khugepaged`` daemon that scans memory and
> > -collapses sequences of basic pages into PMD-sized huge pages.
> > +collapses sequences of basic pages into huge pages.
> >
> >  The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
> >  interface and using madvise(2) and prctl(2) system calls.
> > @@ -144,6 +144,14 @@ hugepage sizes have enabled=3D"never". If enabling=
 multiple hugepage
> >  sizes, the kernel will select the most appropriate enabled size for a
> >  given allocation.
> >
> > +khugepaged uses max_ptes_none scaled to the order of the enabled mTHP =
size to
> > +determine collapses. When using mTHPs it's recommended to set max_ptes=
_none
> > +low-- ideally less than HPAGE_PMD_NR / 2 (255 on 4k page size). This w=
ill
> > +prevent undesired "creep" behavior that leads to continuously collapsi=
ng to a
> > +larger mTHP size. max_ptes_shared and max_ptes_swap have no effect whe=
n
> > +collapsing to a mTHP, and mTHP collapse will fail on shared or swapped=
 out
> > +pages.
> > +
>
> Hi Nico,
>
> Could you add a bit more explanation of the creep behaviour here in docum=
entation.
> I remember you explained in one of the earlier versions that if more than=
 half of the
> collapsed mTHP is zero-filled, it for some reason becomes eligible for co=
llapsing to
> larger order, but if less than half is zero-filled its not eligible? I ca=
nt exactly
> remember what the reason was :) Would be good to have it documented more =
if possible.
Hi Usama,

You can think of the creep as a byproduct of introducing N new
non-zero pages to a N sized mTHP, essentially doubling the size. On a
second pass of this mTHP the same condition would be eligible, leading
to constant promotion to the next size. If we allow khugepaged to
double the size of mTHP, by introducing non-zero pages, it will keep
doubling.

I'll see how I can incorporate this description into the admin guide.

-- Nico
>
> Thanks
>
> >  It's also possible to limit defrag efforts in the VM to generate
> >  anonymous hugepages in case they're not immediately free to madvise
> >  regions or to never try to defrag memory and simply fallback to regula=
r
>

