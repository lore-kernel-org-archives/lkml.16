Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E3E72625
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 04:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751602838; cv=none; b=aNtH1JCrPyY37uF9Jerj/CLvVtEcglky4PZtoeF746HXSK5++x+MhV3M4mcmXd75SdS92aasrlbmEFXAvcVveIAlFWz54hehn30pjqS19Wt0PH47SXbLql5VgOWABoA2DUUV8j5BR+ZqLl3uGxmTtet4jD8EPUvTBwlC4/VugBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751602838; c=relaxed/simple;
	bh=NoT+4FNbSjwBg9rFgnrMI3Kmfnm6Tizyg7BbQeMGDT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJGeiut3s1L9Xy4JHZ/MRlSP4phMEHgRAWbMucc6jHlMI/lZB9w6FookXcC6RuaZfWt96Ot8i+CC23nITLit1t4LlzFZG8P6Tx4p/jzYj/yoO0uWc7TVir4Rum9if/kxdTdwTpK3vTPT86cQQmXEF7deC0453Vq5bEUMCxShRC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ev5lxQhz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ev5lxQhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751602835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYMNYv3akYsSWq5hIrlEh3zSlZe35V5o/c+Z5lpwL/g=;
	b=Ev5lxQhz0MoD6RkGzWqAtYxmvxemjT/EGlUvoPPHgsDIZ+FCvAiHUkcDlHXG3NRfNLgejy
	Hn+J3ThGDUWi7gflTS58DERNBkKyaqlLqKLRyyA3tYoOcDALmLYqBwiqlZ+cxf5xA0Hnq5
	VrEQN5prR+Nn4KmSBuXUXYK8odxSJP8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-Kebale65MZyjSbf_I430Bg-1; Fri, 04 Jul 2025 00:20:28 -0400
X-MC-Unique: Kebale65MZyjSbf_I430Bg-1
X-Mimecast-MFC-AGG-ID: Kebale65MZyjSbf_I430Bg_1751602828
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e2d495194so6070067b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 21:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751602828; x=1752207628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYMNYv3akYsSWq5hIrlEh3zSlZe35V5o/c+Z5lpwL/g=;
        b=JVSxZrpIDosLBi+08U2KAr4XDN0I/uWQ7HC6gkuuQYPFbmbSZx5fUhNB/YSrE+f/Gy
         WA+ZnJgecn0xnuNY5Lwo3UyxjcDTeeOUOV3eFrWkH9y4Sd7OtGY5fi6WglEFQci1/d9L
         0IwQ3rHNCgOreW7TdVonH10WuWlfRDTX9TWRaTIjPZYlLSJ26zVZf4Ppkb+If3PQn1yL
         mAciDOlpyyCFw9GrJV6i/ebhJXR9lenTSntq1BFnr7qYkXDaQ3Qdrw+MoW7gecjgjdzy
         bI72y8IFnhaqCP7s4kJ1ugS45kZqyOQJQXwV75ML16yKg1Xh++Nejs4q7eIhc7Cch9Ts
         pksw==
X-Forwarded-Encrypted: i=1; AJvYcCUaWMXpDmk3fi2c1iEjedO5NyuEGEMm3XlCOqk11LPHEkVdEH7JmLRSUUU83rWqf/hZL6uBQLvXcXz+V60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8W+AYAiUgberhbHFGR8FxmB0P/y8nnexCL3E+asmwuajI1BDY
	s+mvY2IZ5muW7tsxw7EDSYy6szCdqszfuBar4frjVt0vLAcKguNiFj2Ckb9/VdhCb07gULqpIlF
	ACi9UCpEVegxoOeJ1F47K8toIAfh7EiJMOFpT3eUW4QONxU1CYTmWCvWC1tVqZP44WSFzUbUBvs
	Zxxk/GK923ywmVl16/3/A0klLko2A7ga7xRc7gf5/q
X-Gm-Gg: ASbGncshSHHWkRRiZzmmNj37Wux7Tne5ociNQPY0NtWn67XOAaHCYjSaPt80vCz1W2j
	Gu3XBKHotwdZZSo+LDBhV2v44bh7B1aA7JRe381ECRaLRRH6zhr3tGjavwwEBDJCeQjcl/gcF5T
	KxlUwg/A==
X-Received: by 2002:a05:690c:315:b0:70e:7ff6:9ff3 with SMTP id 00721157ae682-71668d48d52mr14813497b3.35.1751602827880;
        Thu, 03 Jul 2025 21:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpWlttfaGVsemdXIFRiuyrfeV4wU2Oua20HKATYd8vQpxrAJPi7JNRE9ipCBD5L0WC9KAT+/YYm56OkcAzJRs=
X-Received: by 2002:a05:690c:315:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-71668d48d52mr14813187b3.35.1751602827474; Thu, 03 Jul 2025
 21:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702055742.102808-1-npache@redhat.com> <20250702055742.102808-3-npache@redhat.com>
 <ca0d8c87-2998-48f8-bef6-3e99a92f28e4@linux.alibaba.com>
In-Reply-To: <ca0d8c87-2998-48f8-bef6-3e99a92f28e4@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 3 Jul 2025 22:20:01 -0600
X-Gm-Features: Ac12FXx0uN0QDJdFTa4DutceQ0LVRzGL8hH9npRx5BwNbhAuyhn2wB7v9-pBvwk
Message-ID: <CAA1CXcDH5xTSGHJu13Gb3EfNnntKwQn6Oq6rhS5uFoyLwid0Jw@mail.gmail.com>
Subject: Re: [PATCH v8 02/15] introduce khugepaged_collapse_single_pmd to
 unify khugepaged and madvise_collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 9:51=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/7/2 13:57, Nico Pache wrote:
> > The khugepaged daemon and madvise_collapse have two different
> > implementations that do almost the same thing.
> >
> > Create khugepaged_collapse_single_pmd to increase code reuse and create=
 an
> > entry point these two users.
> >
> > Refactor madvise_collapse and khugepaged_scan_mm_slot to use the new
> > khugepaged_collapse_single_pmd function. This introduces a minor
> > behavioral change that is most likely an undiscovered bug. The current
> > implementation of khugepaged tests khugepaged_test_exit_or_disable
> > before calling khugepaged_pte_mapped_thp, but we weren't doing it in th=
e
> > madvise_collapse case. By unifying these two callers madvise_collapse
> > now also performs this check.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 95 +++++++++++++++++++++++++-----------------------=
-
> >   1 file changed, 49 insertions(+), 46 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index f27fe7ca9b86..bf69e81a3d82 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2354,6 +2354,50 @@ static int khugepaged_scan_file(struct mm_struct=
 *mm, unsigned long addr,
> >       return result;
> >   }
> >
> > +/*
> > + * Try to collapse a single PMD starting at a PMD aligned addr, and re=
turn
> > + * the results.
> > + */
> > +static int khugepaged_collapse_single_pmd(unsigned long addr,
> > +                                struct vm_area_struct *vma, bool *mmap=
_locked,
> > +                                struct collapse_control *cc)
> > +{
> > +     int result =3D SCAN_FAIL;
> > +     struct mm_struct *mm =3D vma->vm_mm;
> > +
> > +     if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
>
> Seems you still forgot to drop 'IS_ENABLED(CONFIG_SHMEM)' :)
Hi Baolin,

You had me questioning my sanity for a moment because I SWEAR I did do
this! but now I see the issue, I accidentally merged the fixup into
patch 6 (not entirely sure how or why I would have done that given my
notes say it belongs in this patch...)

I'm sorry about that :< I'll see if I can work with Andrew to get some
fixups into mm-new (this was merged a few hours ago) for this patch
and patch 6.
>

