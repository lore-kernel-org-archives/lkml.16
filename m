Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7B238159
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396794; cv=none; b=Qic/nUvgT2++BYMmSlYewwFBREJXZsB81E51nydskf9SAEB8apt5Vu/jnkwMwh9v44b0KaimRXddSsMulqueT60ofIs9AdQOcm/m8XmWNP+3UAdFFHT9Sp97qKEzQY10O8t8om1+rBSeaD5zV3U8Q028+mzCABXgcV+M0cTJqP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396794; c=relaxed/simple;
	bh=b90/SYVIw+dBZMEUT65DfGZIzxwPVR5WwyeqFl4BJvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ap3QsG+EPeBoBlZrgX3IaaKpSj1ve2aHUhbjs/ECyB6fncgXz7b8mazKhTnznPtsPGpAnSGMoB7TS/4NrlbuCTaa5e/hq0wlmvuJYxCtBxnNJCXL7Y1n1+9xdFuqJh4LtvKST424zpGbUEPJKrtOppug45GrOPcxmnRWzlL7hzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDRJncNL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDRJncNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747396792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jV3TfuTBMPGuPU48cWyK877zQ+ap+DzX8iP1e9/vVHE=;
	b=iDRJncNL8zxbAM2QsbK/laUhH9WaFPz5kLtlijCak8OOdjJnU9YiEdq4v6qcrbrRltgGjf
	zMcqaX8U9+1jbfN9iepYMg0REcDSF99iUfW6khh/oa5rwA3I5i3TTXQ/qH8WFmYAzfsBhO
	H6lQZUcL1m6do53WB5RyHzyEZ4atemo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-KciFXuFyNaSSBj2VcF1D6Q-1; Fri, 16 May 2025 07:59:51 -0400
X-MC-Unique: KciFXuFyNaSSBj2VcF1D6Q-1
X-Mimecast-MFC-AGG-ID: KciFXuFyNaSSBj2VcF1D6Q_1747396791
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7082ffc17c0so35029307b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 04:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747396790; x=1748001590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV3TfuTBMPGuPU48cWyK877zQ+ap+DzX8iP1e9/vVHE=;
        b=OamzAJt9GXVCCuD3k2JFNiCflj4DHCTMkvn6MuYEAJBZ25wiIQfoh8fQJSG8mXClk3
         D9SnVY1Pj1prRuk8yJGS5aVWXTMvwyxnezu5oV9zuO/xV2/DpKejkxQipwrYNRdGrd3Y
         +MwxsLE95Mhcn2Gi+3rxT93QaPhcJmjtAdC2xBX7Knn7Vc7bFrJ0vuy8zGLkCY/GFaoe
         PBhF1xjyvk+YUv4S92vKKeMY4/Q+CH/grROcoM+p2F45RYF+8QoiQ/p1RG+8p0LCIifE
         sAn8mH6crlcOz8iif9+uTLgWeOFRe82EXL/bPKlcc40tK6wFdOhUDvlNzFwz/jSI5IU7
         rMeg==
X-Forwarded-Encrypted: i=1; AJvYcCX3XITTHTWljHM8wr283Bb+SmA6qmvnubYMSpR5QQGPQY8SKCNO45GpLaovt+nxtA7PZ6VFepuiuOMIPf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbW8xHFF0VzxfAzItKQlrN1gN+sX1SDOdUuUiUnmy2So5gaMxE
	qlV+h5ZjjdGThEG9TEHHMZ5+HcJPexAONI2Z9IylDabBD7Bd3VBZs3/VQ3armfBIh1sPGNoR600
	Mqe3nXiCSjkURqLxRottED5osKSpAnlTz91W8K8F5OYM8dfe176X2ncRhopU54RhUTGeSvBM9Dl
	x1qNXowuqY0JPdHrDaTNFo61neaImGr0C0ogjkfM/j
X-Gm-Gg: ASbGncs96QQyA5Fd0/FMzbwgqdF6pm4I9PShk4JXVK7AaU9BZuTLeJwFGGZaEIhdr4Q
	sAcs2mAOUQ8NyLHBqfIV65tr+C2KfdTpbHMfd3e4/Q/v6Qb8W2rSOw2SVvZmTRvI+oJO+DK8=
X-Received: by 2002:a05:690c:2902:b0:708:39f0:e673 with SMTP id 00721157ae682-70cab099541mr32559247b3.26.1747396790722;
        Fri, 16 May 2025 04:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcYYv1aKngeTdy5ir8TbnMDL+aYvllbV4F5smezS9aZSJthiJS0se5fLpqvHuQKj9tO3mUUquimR8mFmse0lE=
X-Received: by 2002:a05:690c:2902:b0:708:39f0:e673 with SMTP id
 00721157ae682-70cab099541mr32558767b3.26.1747396790429; Fri, 16 May 2025
 04:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-3-npache@redhat.com>
 <4e00b5df-e9ce-40fa-8da0-9c66fe18bfd7@linux.alibaba.com>
In-Reply-To: <4e00b5df-e9ce-40fa-8da0-9c66fe18bfd7@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 16 May 2025 05:59:24 -0600
X-Gm-Features: AX0GCFt3NyCdj_YZyS35SoBcI6yDKLZwAnHKx4ZKJFM0r8cs98JHtyZCbongSjc
Message-ID: <CAA1CXcAO5OkB=P++89q1VhcoRG6j6JR5K15m9sOaPdKwZ-LEkw@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] introduce khugepaged_collapse_single_pmd to
 unify khugepaged and madvise_collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 11:50=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/5/15 11:22, Nico Pache wrote:
> > The khugepaged daemon and madvise_collapse have two different
> > implementations that do almost the same thing.
> >
> > Create khugepaged_collapse_single_pmd to increase code
> > reuse and create an entry point for future khugepaged changes.
> >
> > Refactor madvise_collapse and khugepaged_scan_mm_slot to use
> > the new khugepaged_collapse_single_pmd function.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 96 +++++++++++++++++++++++++-----------------------=
-
> >   1 file changed, 49 insertions(+), 47 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 806bcd8c5185..5457571d505a 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2353,6 +2353,48 @@ static int khugepaged_scan_file(struct mm_struct=
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
> I've removed the CONFIG_SHMEM dependency[1], please do not add it again.

Sorry I handled the conflict on the removal parts, forgot to handle
the addition part... my bad.
>
> [1]
> https://lore.kernel.org/all/ce5c2314e0368cf34bda26f9bacf01c982d4da17.1747=
119309.git.baolin.wang@linux.alibaba.com/
>

