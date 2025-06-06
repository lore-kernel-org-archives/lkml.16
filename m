Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496BE171C9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749219154; cv=none; b=Ko9sLkrnJKYw/fxJsyMRwjrQL8YSe4tOKvCY3MzwdBbUAorcoQ5hExY/97BJ8VRjUCgCf83lDmPWnIrWg12zX5UOeyJnbavl6gjycjj1t9yDImfMn36YSdICC0DlvU/jagqSEPhJ45ktFCXlyXRoS9/UZFJ9/VzIB6sfN6m3MhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749219154; c=relaxed/simple;
	bh=psuEFWdwVCBlkD1sMc3ALuCERUGXYguCnz+aPxq8QJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwIvjDSjsdSLdLTmec8CT3FDfWN+tY3Tgae0e0YTsM0ipc1uZdcqzPZbp2hLyboDqdR4GdPfeqp/XwCnyTEPn9fER3gKaRj7CLnCNyV3kUUes82dGVMRly60YHVjeDSMuuzPlRki7TCCV3LtDyYPoTB7xlTpJHnXz5Hv1Oxy5mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GcPr3RoF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GcPr3RoF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso10933a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749219150; x=1749823950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95I2iPBNFDgcO0wVMG4TI/l0yeqGP5Gpnj7ClCifN1c=;
        b=GcPr3RoFjSIPRbSGNScLUHHKs9yJaTi34X7945jq1vsqD4xN5iJ6RMRFEc3NBLO6lR
         vRbWf/6f+JcVUcKDodF2hD7FTAUipq/i60l6EmvecskG534mEc49juPieKLp5WNJMtyP
         88Esaox22Trh5wSgGL1AtlZnqFkl5Y3Vl84GNp9HjpfctFcbM4DqFZ7QXNw5c7Ni7v0F
         qhYWOLJ3wtUkYEICzoNvMlxqb0+13ZzGbLHXUWyHJ5KSyXNKxD1D7vqiJeR78TVYJD4J
         0jBo2koy42V/PYnc/i07ks5vTZxEpEDTcTtES/pbglFsS4V6rNiCdIphZMy64JG7QDV5
         ot1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749219150; x=1749823950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95I2iPBNFDgcO0wVMG4TI/l0yeqGP5Gpnj7ClCifN1c=;
        b=MblBM/kj7uzKa2/h7OfUIUg1fc1KlomB9Y+W+40PfUa3pZFYcha0DVJrOmJoVf8LYQ
         FQE/j3JPrZ1thOOELk4uBFAOevfzK/aXGtR7T+Xax6ANW3ZuOFNGDE0+7Nj77ik3jAC1
         vIPjz9ZxRL9Q+bCNwRmHILMj3pjC8lxbQTtNpXBa5Oe3sh+ZMAUldp6amDXqjvbDPjzD
         p9qmWfar+jYpNGakFtEG7scY2vNQA2bCi4Hv+52xw7UvMvGi7D2KjXJ2FyFjpDC5t0/N
         okAu/BgVUtMw1GR7kb+BEiqy72YEknpKp+FPehEeEZc1a+vBGId5RdqqwKxukAg/6cZS
         eQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPBo4v54WPhtdrfsveabDwZ4E5yFTmf3wVdA/MrpEyQ+R8NOhtbXds4K4NI8rLiINCaBfBNAIHK7ZBUDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfK3V+WepbxGvIF61YQnNoXHqE6Vw15bvfiSb8kQQ9zQoO1uL
	3+aA5FDzdnUlWQlA3Qs8RsWqhvFue1JWSeWVWATxWPppazmTrIDoSFtIx1kTKVy5oBU2TtXcI03
	lv2IWSXsb0uri+OQSuFJyEdaVrc4s1jJA3Rqv95Qd
X-Gm-Gg: ASbGnctZpmUrCNiYKwexS5VQ6fDpIjroUp0t6oMKR5k1L/YFOTmKHBd4jR9bzcENy7C
	ipV+YFz0LgVuVJSgt5fN0cJ7V47EttPjqVF0Lt8M0Sp/E6pJ3ZUfdMJQtsAFYA04qOad1453XJl
	mxvzk5nFHYY7ZP13xrOgIoSjyIFOdSvm7H3qy8f/86AiUj9vhjtz8qs2lzwsemJx6TzioLj2xY7
	g8PQdjv
X-Google-Smtp-Source: AGHT+IHqIn3Jk3eP+7LQUPBbUcuYi6EVLf341pqFYrDCsWsDFahP9S44GqvjMWx6jpK+6TRzbqVNtgGTgqWj1KfH+Gs=
X-Received: by 2002:aa7:c712:0:b0:604:58e9:516c with SMTP id
 4fb4d7f45d1cf-607793dc3b2mr70098a12.5.1749219150123; Fri, 06 Jun 2025
 07:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-2-a7f64b7cfc96@google.com> <aEB8fFEXKPR54LdA@x1.local>
 <CAG48ez3cgG-PikyO7a84CFdPFvPY9BSNJOZ7wZVQ7Q9Qju_6Ng@mail.gmail.com> <aECoHDM3l2dKTfDw@x1.local>
In-Reply-To: <aECoHDM3l2dKTfDw@x1.local>
From: Jann Horn <jannh@google.com>
Date: Fri, 6 Jun 2025 16:11:52 +0200
X-Gm-Features: AX0GCFuBXCdcVqd_TM6eMNdkMpWfdvVC0xldynLZs4JJ3m7vYu5AacWJNNxBRAU
Message-ID: <CAG48ez1sYGEt9HaR4_sKiHNp6Ouo5egQe5-ZDCHRzMs+HhxBbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/memory: Document how we make a coherent memory snapshot
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:10=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
> On Wed, Jun 04, 2025 at 08:11:08PM +0200, Jann Horn wrote:
> > On Wed, Jun 4, 2025 at 7:04=E2=80=AFPM Peter Xu <peterx@redhat.com> wro=
te:
> > > On Tue, Jun 03, 2025 at 08:21:03PM +0200, Jann Horn wrote:
> > > > It is not currently documented that the child of fork() should rece=
ive a
> > > > coherent snapshot of the parent's memory, or how we get such a snap=
shot.
> > > > Add a comment block to explain this.
> > > >
> > > > Signed-off-by: Jann Horn <jannh@google.com>
> > > > ---
> > > >  kernel/fork.c | 34 ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 34 insertions(+)
> > > >
> > > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > > index 85afccfdf3b1..f78f5df596a9 100644
> > > > --- a/kernel/fork.c
> > > > +++ b/kernel/fork.c
> > > > @@ -604,6 +604,40 @@ static void dup_mm_exe_file(struct mm_struct *=
mm, struct mm_struct *oldmm)
> > > >  }
> > > >
> > > >  #ifdef CONFIG_MMU
> > > > +/*
> > > > + * Anonymous memory inherited by the child MM must, on success, co=
ntain a
> > > > + * coherent snapshot of corresponding anonymous memory in the pare=
nt MM.
> > >
> > > Should we better define what is a coherent snapshot?  Or maybe avoid =
using
> > > this term which seems to apply to the whole mm?
> > >
> > > I think it's at least not a snapshot of whole mm at a specific time,
> > > because as long as there can be more than one concurrent writers (hen=
ce, it
> > > needs to be at least 3 threads in the parent process, 1 in charge of =
fork),
> > > this can happen:
> > >
> > >   parent writer 1      parent writer 2    parent fork thr
> > >   ---------------      ---------------    ---------------
> > >                                           wr-protect P1
> > >   write P1                                                  <---- T1
> > >   (trapped, didn't happen)
> > >                        write PN                             <---- T2
> > >                        (went through)
> > >                                           ...
> > >                                           wr-protect PN
> > >
> > > The result of above would be that child process will see a mixture of=
 old
> > > P1 (at timestamp T1) but updated P2 (timestamp T2).  I don't think it=
's
> > > impossible that the userapp could try to serialize "write P1" and "wr=
ite
> > > PN" operations in a way that it would also get a surprise seeing in t=
he
> > > child PN updated but P1 didn't.
> >
> > If the write at T1 hits a page fault, then it doesn't actually happen
> > at T1. The write instruction starts doing something at T1, but it does
> > not fully retire, and the architectural register state does not
> > change, and in particular the instruction pointer does not advance
> > past this instruction; just like when speculative execution is aborted
> > after a branch misprediction, except that the CPU raises an exception
> > and we enter the page fault handler. The write actually happens when
> > the instruction is executed a second time after page fault handling
> > has completed after the mmap lock is dropped. (Unless something during
> > page fault handling raises a signal, in which case the instruction
> > might never architecturally execute.)
>
> Fair enough.  So maybe that's something like a best-effort whole mm
> snapshot anytime happened during the fork() but before releasing mmap wri=
te
> lock.
>
> Your comment did mention one exception on the kernel, is it still pretty
> easy to happen?  I'm thinking this use case of trying to load some data
> from a O_DIRECT fd and then set the var to show it's loaded:
>
>   bool data_read=3D0
>   read(...);
>   data_read=3D1;
>
> Then IIUC this can happen:
>
>     parent thread 1                        parent fork thr
>     ---------------                        ---------------
>     read(...)
>       using O_DIRECT on priv-anon buffers P1
>       pin_user_pages
>                                            fork() happens
>                                              Sees P1 pinned
>                                              P1 early COW (child sees no =
data loaded)
>       memcpy()
>     set data_read=3D1
>     (data_read can be a global private var on P2)
>                                              P2 wr-protected (child sees =
data_read=3D1)
>
> Hence in child even if it sees data_read=3D1 it is possible the buffer ma=
y be
> uninitialized, or the buffer is partly loaded, still racing with the kern=
el
> early COW.

Urgh. True, I had not considered that case.

> I'm not sure if I understand it correct this time as you discussed in the
> comment. If so, should we still not emphasize too much on the kernel
> providing coherent mm snapshot, at least emphasize the best-effort part
> (both in comment of patch 2, but also in patch subjects)?  After all, it
> seems it isn't straightforward for any userapp to see when that coherency
> will be violated.

Yeah, at least I should add a big caveat in this comment about how
O_DIRECT read buffers might be stale in such a case, and that we're
doing the best we can with a single-pass approach. Urgh.

> From that POV, maybe it's better we should still suggest the undefined
> behavior, even if it'll recover the old behavior some existing use case?
