Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C328F520
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733702; cv=none; b=QBT3KXoQx+ypmNw+qSnioXh5lKj+98cP/gV0qqwq/S3M8hI+Iw5tP+NlajmIBkhQ1hpod0eAlH4swtZBqZEf6HfNFhtoqVKvDimZrZXkMMGxXjYvZMgtBedr4WfpVvcirkcQLE0aFC0g8f4Uz/gVGAtHlj22XnaB7YCIb+8yRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733702; c=relaxed/simple;
	bh=JWf0OWf1kgoj0X1CWWhYwdbCacqj9zqwh7DaJRyLqCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKrXPfIQMYMqm96rJFcOeRbNypiNk0D0JgG3Cx9PBRZyiZqqvZW4EySOYpw0Cs6jEoGrajt0QxuJZINvgQuGgb906/2G7jLgAsAKJalYh5wqy3ves2SIrMuy1Rynb5RUSkpTvxaS1DZ1KbY/DqMdrwM5cn2rNd+Z32pRGLEaYYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YJX1efyi; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YJX1efyi"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4769e30af66so401591cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744733699; x=1745338499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csMZwIekDeMOlvlPV6qqAoZIV9Bpm+l1vvN5nrjAYV8=;
        b=YJX1efyiMq3BvKo6yijQb1HNFDKhPT5THBIg1Yj99K/yuI5Cy62cl8IPEtr5cuatz2
         4zG4IB9Rtp8DLYCgRJDKYhUeTKkZcjBwxvXI5yQQZHNbjNXp8YkW4FBpbvP1qFW8H8B7
         YszIzi2rxiOIoEWbmsnJksq5I01V+quUzmL07KVWYhhBqWWk7qoHEbKO1UZgYtbRfjXU
         mWRlTwl0bza42MRWuXLzzE+RSWNos+PuG4c5CrQtF3ncOyEj27YScx4Z6oenyxXbVlRf
         Uof8/yTPRSMk+eo/K8bY02meSl/dJ658b1nlD6UC4VVLHA/u9A/4GVUYbYBOMLDi2YUo
         iuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744733699; x=1745338499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csMZwIekDeMOlvlPV6qqAoZIV9Bpm+l1vvN5nrjAYV8=;
        b=t6Vh4cAzTme9uRCFdsXbsPmQKArBATbaeKD4hFlgZW++GRZaEMbnuC1h5iAVqP3fIE
         OgX9Kb+1bIleHgCM55bSJyWSOP3lXAMBs8wyH6m6pLlNDOLp9Sa69rljTj3J8OPLgzFj
         dKErwrBk35YiHnOe3wqA7Q+mA7IzMdWy0JEtdrPS3OYUOpapm1t/aN3zilR+lgCqwDZw
         30FjI1AT/lRsdyDHFk9T673NWd/o6cgIY0oBa0/ptnVYJgDruD+HQn2pfuLwMHLHXng4
         adjzClAbVSUUk7Mi9Z+c6MvmWKdP8CnwWuXuqn4zlqauY6I47L0vwMsj0jE66l5XP3gE
         8AQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKAf8hXswR627pJ4m/H5/EbdEhDfHGqRt7cmyjnqa9lKY7+twWxae6nUEhM7RAT2fAmRpXJ98NGp3Nqsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMn5Weqav+OtQMDZBaHYZ99bGx24nwaf/cixRlzf3v7bJVN2M
	P+mw0NxoE7Ftreqnhhw53NSNfrlASnR1a+x5lzQASfhxdgnLN1+1fw+Gy5/LsJbJERzGHReR8PG
	lmIwK//jn1YYEaBidqkS0qjjqSkcZBDFuOYnX
X-Gm-Gg: ASbGncu6TrIXQr0+LtmEFgexe57NhXKzRbxCPeW8CBgVIOg95PvExweVULjR6pc2gWU
	BP4SYNJI3nKWn6qHdpWJOkafebroHZulE5fBIz/lMA+Ihi3tVWp5bAdQ4E9rATSi4rMGDab7Vke
	5Ix5UexlaoVIt0OA72OW7VsYd6YRPTuW0ysF/HVjErEDHVChrxoTg64P+ryllnwIc=
X-Google-Smtp-Source: AGHT+IEJT4pa8qiAKf9nDLAc8QLQO3diLkASwchu6JQEwlG20BFOwTnhbHjQ6zqw5f5vL2dxcfxSIn/aOQ7QqKsa0yY=
X-Received: by 2002:a05:622a:1890:b0:477:852d:ead6 with SMTP id
 d75a77b69052e-47a53030602mr4775251cf.0.1744733698609; Tue, 15 Apr 2025
 09:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
 <bxgksbw7qplw3pp7gpve2ir63oyds7mxsnvprz45fj6oadotm5@syvchqjd2n6z> <0e796032-4f6d-4b7c-9ce6-6519f8f245af@lucifer.local>
In-Reply-To: <0e796032-4f6d-4b7c-9ce6-6519f8f245af@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 15 Apr 2025 09:14:47 -0700
X-Gm-Features: ATxdqUGyJhc8pIliv4mVwyKYOFhh4IW_k8OSWcd9OMpOe-l2NcmDUrBamTm_pn8
Message-ID: <CAJuCfpHjf6+JSecEJr-8ZCSL-rS4MnEy0QcHcrya72dXFsfPiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 8:43=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Tue, Apr 15, 2025 at 11:37:04AM -0400, Liam R. Howlett wrote:
> > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250415 09:11]:
> > > We place this under memory mapping as related to memory mapping
> > > abstractions in the form of mm_struct and vm_area_struct (VMA). Now w=
e have
> > > separated out mmap/vma locking logic into the mmap_lock.c and mmap_lo=
ck.h
> > > files, so this should encapsulate the majority of the mm locking logi=
c in
> > > the kernel.
> > >
> > > Suren is best placed to maintain this logic as the core architect of =
VMA
> > > locking as a whole.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> > > ---
> > >  MAINTAINERS | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8d834514a047..ce55676a16a4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15595,6 +15595,21 @@ F: mm/vma_internal.h
> > >  F: tools/testing/selftests/mm/merge.c
> > >  F: tools/testing/vma/
> > >
> > > +MEMORY MAPPING - LOCKING
> > > +M: Andrew Morton <akpm@linux-foundation.org>
> > > +M: Suren Baghdasaryan <surenb@google.com>
> > > +R: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > +R: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > +R: Vlastimil Babka <vbabka@suse.cz>
> > > +L: linux-mm@kvack.org
> > > +S: Maintained
> > > +W: http://www.linux-mm.org
> > > +T: git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > +F: Documentation/mm/process_addrs.rst
> > > +F: include/linux/mmap_lock.h
> > > +F: include/trace/events/mmap_lock.h
> > > +F: mm/mmap_lock.c
> >
> > It would be good to have more M's here in the case Suren is away or
> > whatever.
> >
> > I have worked on the mmap locking due to the maple tree addition, and I
> > have helped with vma locking in some areas.
> >
> > Lorenzo wrote the locking document, which Suren pointed out last mmap
> > lock meeting and does make locking changes.
> >
> > Are there others that could be M here?
>
> I mean I'm fine to take an M here, based on having done _some_ work in th=
is
> area and being involved in the meetings and documenting, though I'd large=
ly
> defer to Suren who was the true expertise, and I also feel Liam has bette=
r
> knowledge than I do.
>
> So I suggest probably, unless there are other viable and active takers, w=
e
> should M myself and you Liam?

Thanks for trusting me with the maintenance. I'll do my best not to betray =
it.
I agree that you and Liam have reviewed this code enough times to make
informed decisions. Other good candidates include Jann and Vlastimil.
David already reviews the entire mm codebase, so adding him is
probably unnecessary.

>
> >
> > Shakeel and/or Jann might be good additions to this list somewhere
> > (looking at the edits to the file).
>
> Don't mind R in these cases if Shakeel or Jann want of course :), though =
I
> _don't think_ either Shakeel or Jann really actively work with mmap/VMA
> locks (forgive me if I am mistaken) so wouldn't really be suitable for M =
as
> I feel that requires some active development.
>
> >
> > > +
> > >  MEMORY MAPPING - MADVISE (MEMORY ADVICE)
> > >  M: Andrew Morton <akpm@linux-foundation.org>
> > >  M: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > --
> > > 2.49.0
> > >
