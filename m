Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237F3E47B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749060708; cv=none; b=PnLDky1T4KvJtzJUoS2R6LcESj2SqXeX+ZWjHK4450d6yjtPcqKjueAlezn6irWN1Xvh4CN1GvdiCI6XEqa0jHUJPsW1msUm9AQQiuvHQeIf48RenCjSyj7Ua8gtjqYh5wJEhLrtCWQasOCA1tZzPElTdZmC1ISsYNULx1tyDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749060708; c=relaxed/simple;
	bh=Gzr/dFWuC6PQCHCvGNyauGQWoOqy6y/rYpphNzXKxV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nheyCM+K2HhJqrZ6yKbIDGASRh/hKL4nZD+pFMPWJ4zO4IX693l025ychEs8iQ0iaWzrdTm93bOit8BTOKMkFajEFCPVrp2+JNRyfWGJ9cQca5Frw2AICnxzJUB0Qym+V5haOQBFvw9P+mBjyNc+q76gCpvZ6V4MdUJ5jnKXBHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wger6Yeh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wger6Yeh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso12910a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749060705; x=1749665505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LzZ8aKYfGSQLbJCEE0x4JtCaBazcXVo8YRVwpbcIJk=;
        b=wger6YehcUD0SdowXgB2H33zmamSUl5dLJ317iNUcigLe6iiZf91m7gMbG5twD1u7m
         dCLcnwtUG6+tDFnCc6bYQ2qKEYQCTBM0TeBva8PFK4FCFqdjpIDH77OUHReNGgHhhmUk
         38II3GZ52cyus1J/mTTMRopYMJKOjaH6EW3Ly8MDjO/K7Is3H61zOd2R9VzTKlaUQwQa
         VXNlcnOeI2/QMTyLKvvFB2DUDPjM8dx3SrkqTIo9J0Erh2ljMk4MChFT0ix9qUoo79yz
         WgI+DDnZl3PT4aaeENtjXiRZ32DFvPzGfaUG8BaNU02F2eEBtQZ1Ah0Ani6MjBEVFCw4
         uRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749060705; x=1749665505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LzZ8aKYfGSQLbJCEE0x4JtCaBazcXVo8YRVwpbcIJk=;
        b=Fg5hf058MieadBtOWud6HF6liAdYaGHPDIxANSgqdNhWLOPOBH7yXCaKlT5qsZXSj0
         hK8YZSWah3NqXQkF5GCVUve0HYTcvjB0iQdm+6eSNLynCyFfXHCKlkzvzo4CEy+2gw/S
         5O2dP9oT0bY80gNUmemqIMGbRCPpAqsDcIms6WL4RHT+c8UTQNXWaB8NQ3261MZYjsFX
         w/tyVuYVr7f0qdFIZREEfEpeajuszqQZQtlW09HdpWu+Lb23LkkpsUMcALRnUUmkuJW9
         KMIL7ZCSnfemS1LiYpSOIRKsyblY2E4jzF9le6LWX/QC+SuD8yx5vvXepK5qHurC2wFF
         8rwg==
X-Forwarded-Encrypted: i=1; AJvYcCUXOvVHfSA7KUUjFCgPMxvB5z5j7l/NcuMi0SlHbE9l3arTx3FMGzXIl9+hEjC2cWVTITKauk0x3QbyuVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTRkbRDtQ0iDJH8Khv6V/WARYzSaFtIQrqLzh9pJ43MqC83ecP
	LPceSzWjArkoTU2I0403fucvar5tW9Y+JuGF49uIivrwbRSe8zsCrIu5VsHRoEXhWaaVfq0JABn
	IlOoSIZwqDBVtIPF+R+QT52u+svsZFRS7q70wvjxn
X-Gm-Gg: ASbGncuLF1Qh3kK1vXdr8gwEjPu88MGtHH5l55H3GaDtsA9l+I4jc2YTJeNOOXIhDIt
	Ll7POSZ2M/nH/mgcDYDegmmD0CIXhPImHxnjRm6Z8zCIhhqosKNH8GKmG9a95sPrBmcjPBAnE46
	xCfhfBp+iDDnB4AP4QnSCt/P2TvdBOYCtE45MFkvhH4C7S2WRLHE2kpmofInWKPq4Kvv+Dj9s=
X-Google-Smtp-Source: AGHT+IFCkXPOcTNUguWUujQQlju1ewFk7aI+SFMX6HBNuzAwdciaqqiQvPAtBtL6o1JGAST0fmv5qVVhZ4uW7/5DEPo=
X-Received: by 2002:a05:6402:356:b0:606:9166:767 with SMTP id
 4fb4d7f45d1cf-607246bd1bamr6357a12.2.1749060704646; Wed, 04 Jun 2025 11:11:44
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-2-a7f64b7cfc96@google.com> <aEB8fFEXKPR54LdA@x1.local>
In-Reply-To: <aEB8fFEXKPR54LdA@x1.local>
From: Jann Horn <jannh@google.com>
Date: Wed, 4 Jun 2025 20:11:08 +0200
X-Gm-Features: AX0GCFs3ggfcdfsjjImwIM0Pox1N9kXOHyOTJg-ThZY1YZYUkE0TclP4P3fi2cU
Message-ID: <CAG48ez3cgG-PikyO7a84CFdPFvPY9BSNJOZ7wZVQ7Q9Qju_6Ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/memory: Document how we make a coherent memory snapshot
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:04=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
> On Tue, Jun 03, 2025 at 08:21:03PM +0200, Jann Horn wrote:
> > It is not currently documented that the child of fork() should receive =
a
> > coherent snapshot of the parent's memory, or how we get such a snapshot=
.
> > Add a comment block to explain this.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> >  kernel/fork.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 85afccfdf3b1..f78f5df596a9 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -604,6 +604,40 @@ static void dup_mm_exe_file(struct mm_struct *mm, =
struct mm_struct *oldmm)
> >  }
> >
> >  #ifdef CONFIG_MMU
> > +/*
> > + * Anonymous memory inherited by the child MM must, on success, contai=
n a
> > + * coherent snapshot of corresponding anonymous memory in the parent M=
M.
>
> Should we better define what is a coherent snapshot?  Or maybe avoid usin=
g
> this term which seems to apply to the whole mm?
>
> I think it's at least not a snapshot of whole mm at a specific time,
> because as long as there can be more than one concurrent writers (hence, =
it
> needs to be at least 3 threads in the parent process, 1 in charge of fork=
),
> this can happen:
>
>   parent writer 1      parent writer 2    parent fork thr
>   ---------------      ---------------    ---------------
>                                           wr-protect P1
>   write P1                                                  <---- T1
>   (trapped, didn't happen)
>                        write PN                             <---- T2
>                        (went through)
>                                           ...
>                                           wr-protect PN
>
> The result of above would be that child process will see a mixture of old
> P1 (at timestamp T1) but updated P2 (timestamp T2).  I don't think it's
> impossible that the userapp could try to serialize "write P1" and "write
> PN" operations in a way that it would also get a surprise seeing in the
> child PN updated but P1 didn't.

If the write at T1 hits a page fault, then it doesn't actually happen
at T1. The write instruction starts doing something at T1, but it does
not fully retire, and the architectural register state does not
change, and in particular the instruction pointer does not advance
past this instruction; just like when speculative execution is aborted
after a branch misprediction, except that the CPU raises an exception
and we enter the page fault handler. The write actually happens when
the instruction is executed a second time after page fault handling
has completed after the mmap lock is dropped. (Unless something during
page fault handling raises a signal, in which case the instruction
might never architecturally execute.)

(There is a caveat to what I just said, which makes this more complex
but does not fundamentally change the outcome: An instruction that
performs multiple memory writes without specific atomicity guarantees
can successfully do some writes and then fail on a later write. In
this case, after the page fault handler resolves the fault, the entire
instruction will run from the start again, including re-doing the
writes that were already done on the first execution, and this works
because such instructions are designed to be idempotent in this regard
and they don't make atomicity guarantees.)

> I do agree it at least recovered the per-page coherence, though, no matte=
r
> what is the POSIX definition of that.  IIUC an userapp can always fix suc=
h
> problem, but maybe it's too complicated in some cases, and if Linux used =
to
> at least maintain per-page coherency, then it may make sense to recover t=
he
> behavior especially when it only affects pinned.
>
> Said that, maybe we still want to be specific on the goal of the change.
