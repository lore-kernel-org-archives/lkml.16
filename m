Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16D28B7DE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445399; cv=none; b=fW8hICH5BSUg9ViFlV0thZ1hS7rsCiy2vwMn5CvSYrDJHM1llJ8N0zziWvdvV9Q+huZNZXeBJqYNbPYUHLAyBhMzSShbp4wN85R0I1E62OXFfD+iOH988jU5bRC6bFLXLSPnzRIjkXdsHwm1khn+9E6klCTSrlBdCp7QX9XHdYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445399; c=relaxed/simple;
	bh=HKtMs1Z1xsEaiROa1YazGcStiDxVpMzzYhroj5kvTy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+rcuCiVj8Fu2SPVL8SvfaHRzm3wNuwdiifG1CzxLVgGW9ZQ24b9K2q53Tvzh8DF1PRnu7lmsJNlLJDiASK4ArI9Z9OIP9a1rk17Nq7PL6Rb6TrRfHP7K/BveKJw2kJ6Qk5pTAljEmiTFzilwDWULpSew3hleR+tOVPlR1We/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=U5qcrL7i; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="U5qcrL7i"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3087a70557bso739669a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748445396; x=1749050196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RzDNT2OTFzwrTpW2QhZAxDyX5hWvQosjJ6d0+XM2Bo=;
        b=U5qcrL7ilLdxcqy7X0mEhyQavrsLee2GkQB7ndvERj4ynKgbc/vtpi3N9DkL0+FGax
         r9Ikp/ya2iN4l2y4xDxU+iAkBwA3iVt61qV1oN0IfdDprMDFyiHP/Jew4aNVrSQDXsn7
         3nvnN8r7I9RvJ2NoD1fbw0B8BUXmgkl/Ym7efdkO14J8ifc8Mv+xSs0xN0AZmnie26+k
         HkoD5VkQSL/HQN1xhWpSRyTaRJQTROXw9sFhUhyxWgB4MWsLmfRnQf3+G6DRFtyiV+3a
         UhLChLF9+vLplq35i4tdmPUTb/FS7SIXwwl/OCm+WBq7TBpDnIFLU5h8k4hC4+/obsra
         n54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445396; x=1749050196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RzDNT2OTFzwrTpW2QhZAxDyX5hWvQosjJ6d0+XM2Bo=;
        b=ga84kU3J85WAQbZwCjF8oWahfcCB86FIxmTGQGQAkyn6GKva1Bx7D5qt7nCiC2M+UX
         TkT95h/kYGZ+KATGTa/xl58fhW52CQkuisItytxNB/cDEHdNEO8r2d//biO6TWJCQSJy
         2foeioYHTj5bq+Y4Aol3JyK0rXrMc88RRCjJri2kvFlolDJ/S9spvw1+ZOQk0Eqom0US
         qP4KeOkujUecWp1DJTjeWxLR6CZcnl6eo7obfCPgcVBYZOxhcF2iMIlf7trsdgarQywO
         vsGJ81BpvFZGkrx8u/N5KWcKT4Bw5s4Wft0JipZXXroAgU/r2r6Wqhe7A3C3ZByVvYuJ
         EvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5yy6xQM3/xUlesXVJnbAg/V7gYcmBEg4rAXI7AElZsI4hgAhqCQhCbfZyU/+7g5SIVKpHkEAPhh3km7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQv1/hDZeQWAyK4vPI36D9uc0G6jEJrEOYLUze3rvkR2E3DGKl
	+SDWI4po5yN3nIs/gtI0uZiMyF5JI9e+ZHUHq0/q4/Ve04E14H1Q8v7a916aDxrjnAv8anWe8VT
	hNZemuBkZG0yEFe3/Q2cv3RndYcGe4YdjbRSHuF8LNA==
X-Gm-Gg: ASbGncuRM4tWrLDLRbvfw5QIosl0vOuv45OzOdbgVwQT/d4x9jB+fWlv9xUrGwyNb4d
	yZB1jw3okqrNtDCPNkyf21mBI/a4gu4sP3fv1JnbgZLh0u25rz4WQGGr0TdFzwX2nbvqSp5GUGI
	b4QlHjcT3hFLHPyUJ0AcFjBm8CrjU25iEr
X-Google-Smtp-Source: AGHT+IHk/hFwszn+lGW4RY3KI45JUHzvCbI/GU7IlZ6KImluQy2hWku6LQLjd67CNr1rcUJjul/qPMYZDMndG3LG9Mc=
X-Received: by 2002:a17:90a:e7cd:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-311c5d93147mr3267754a91.5.1748445395685; Wed, 28 May 2025
 08:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411161746.1043239-1-csander@purestorage.com> <3ucksa6coiwco3wpmcjtfwezqjigzm2zwvdvkt2ryvefzojtqy@4lda47c236uz>
In-Reply-To: <3ucksa6coiwco3wpmcjtfwezqjigzm2zwvdvkt2ryvefzojtqy@4lda47c236uz>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 28 May 2025 08:16:24 -0700
X-Gm-Features: AX0GCFuDb9gBXu2ZIGF6ICRVSiBRQ0nrfOWmiTmw7s1LAbIKsh9w7lElDPYOc0M
Message-ID: <CADUfDZpPGQEY9u3p3MCU2S3qmDyKmE1JnSQ6G2jO4_J40rQeeQ@mail.gmail.com>
Subject: Re: [PATCH] mm: remove unused mmap tracepoints
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Eric Mueller <emueller@purestorage.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi MM folks,
Would you mind picking up this patch to remove some old tracepoints?
Liam has already given it a review.

Thanks,
Caleb

On Fri, Apr 11, 2025 at 10:23=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Caleb Sander Mateos <csander@purestorage.com> [250411 12:18]:
> > The vma_mas_szero and vma_store tracepoints are unused since commit
> > fbcc3104b843 ("mmap: convert __vma_adjust() to use vma iterator").
> > Remove them so they are no longer listed as available tracepoints.
> >
>
> Thanks for doing this.
>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>
> > Reported-by: Eric Mueller <emueller@purestorage.com>
> > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > ---
> >  include/trace/events/mmap.h | 52 -------------------------------------
> >  1 file changed, 52 deletions(-)
> >
> > diff --git a/include/trace/events/mmap.h b/include/trace/events/mmap.h
> > index f8d61485de16..ee2843a5daef 100644
> > --- a/include/trace/events/mmap.h
> > +++ b/include/trace/events/mmap.h
> > @@ -41,62 +41,10 @@ TRACE_EVENT(vm_unmapped_area,
> >               __entry->total_vm, __entry->flags, __entry->length,
> >               __entry->low_limit, __entry->high_limit, __entry->align_m=
ask,
> >               __entry->align_offset)
> >  );
> >
> > -TRACE_EVENT(vma_mas_szero,
> > -     TP_PROTO(struct maple_tree *mt, unsigned long start,
> > -              unsigned long end),
> > -
> > -     TP_ARGS(mt, start, end),
> > -
> > -     TP_STRUCT__entry(
> > -                     __field(struct maple_tree *, mt)
> > -                     __field(unsigned long, start)
> > -                     __field(unsigned long, end)
> > -     ),
> > -
> > -     TP_fast_assign(
> > -                     __entry->mt             =3D mt;
> > -                     __entry->start          =3D start;
> > -                     __entry->end            =3D end;
> > -     ),
> > -
> > -     TP_printk("mt_mod %p, (NULL), SNULL, %lu, %lu,",
> > -               __entry->mt,
> > -               (unsigned long) __entry->start,
> > -               (unsigned long) __entry->end
> > -     )
> > -);
> > -
> > -TRACE_EVENT(vma_store,
> > -     TP_PROTO(struct maple_tree *mt, struct vm_area_struct *vma),
> > -
> > -     TP_ARGS(mt, vma),
> > -
> > -     TP_STRUCT__entry(
> > -                     __field(struct maple_tree *, mt)
> > -                     __field(struct vm_area_struct *, vma)
> > -                     __field(unsigned long, vm_start)
> > -                     __field(unsigned long, vm_end)
> > -     ),
> > -
> > -     TP_fast_assign(
> > -                     __entry->mt             =3D mt;
> > -                     __entry->vma            =3D vma;
> > -                     __entry->vm_start       =3D vma->vm_start;
> > -                     __entry->vm_end         =3D vma->vm_end - 1;
> > -     ),
> > -
> > -     TP_printk("mt_mod %p, (%p), STORE, %lu, %lu,",
> > -               __entry->mt, __entry->vma,
> > -               (unsigned long) __entry->vm_start,
> > -               (unsigned long) __entry->vm_end
> > -     )
> > -);
> > -
> > -
> >  TRACE_EVENT(exit_mmap,
> >       TP_PROTO(struct mm_struct *mm),
> >
> >       TP_ARGS(mm),
> >
> > --
> > 2.45.2
> >
