Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372A44C63
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650637; cv=none; b=XysV893kY9b6BZ5EBqZk7tW7OCscWQfMGKeEkU86aWu822ymtgI6WOdZONlzy4WHUjJK5ON4rCHAZn1IxNmgiDvoLKQc/kVnOTdh+NNRuzVBbW7krRVlANVS6PO4z3yWCV6PWMrY+h8/Z40Mn4GHVEHFzNiygWgKLA4gffWUyQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650637; c=relaxed/simple;
	bh=OzPB4GNYM+Tc520rN09+ufJ7Fcfmj7iSdvdWSRXE/Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIGZPykZ5iqJAEmAYRC8XhbGpbTLeGvUMBW+42TZ9/5MwSmwElgECHcpR9XudjE6g4aqBMs7pDEref96YsIs5xEhmn1UwyQueSw8B/W21S2kTwTEZHnREqnS8MtztXVAYRJxIBh+Vz2iySZOjRlRjvA8e5L/bwzMNztieUbkFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecaT0xx1; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecaT0xx1"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32a7a5ab797so52023711fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749650634; x=1750255434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9xKEB3kc2TRwlYRrzySNb+uFlw3/FX6SdaA3l9rJuo=;
        b=ecaT0xx1xJN6YTyu+fzrYrMoMlmvSdBFJ18OA0qKDYM361ppJ+Mo+DQgEC2JAoETqh
         k7qvEbOmNKfib0cptzwYZwUaZnkW5XnW2lnkmxadWHzv7//a04LPZCj5UKFb18bQ1z6R
         QUt7B5LmzbKp/OzAoV4tWgCmtPe7ajD3F/RU1JONF8mWqzgMBevgZe/9zFzqzpnPA0sO
         gprWWZy9OV43UlFSpEyKeXXpJpjwAamzywCNDs3ewA9rF6Hm+5hO/bLLIhd7vW2K2teK
         QWgdRKqvh95JwOie0KPes201Gjo7dP7JcBC/+vMTVyWPWxg0/g91Q/5vlSESaRiNNP5w
         +rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650634; x=1750255434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9xKEB3kc2TRwlYRrzySNb+uFlw3/FX6SdaA3l9rJuo=;
        b=Y96Q/j67PUmrHRIdIIBcehSnuCN8CvbynW9PKx42p8uMEQwY1YMXZ7MksriCUZTs5S
         ZQ08BbknDPeGirgMJrU1hx4EMoVAt1frhxMQdz3714NviqqQZ7nNqyVKb12g6sxMLWsi
         0g8+CD0p6zQkS7yL3i8/7S3VUIxGnTLl2Lxvhm17SgW5ZXBSu62XX8HZdqfk1LOptSBR
         WFkwSdPxENfGs3f37HHapmEXL7wyI8Oun9AzcruuAJ1yXETQ+ULH37FzallgeMHt4nbx
         cHrS0Zyt9FUlRzlWbf61MgRg94ZODJj0zIdV7qQLdp5GaZVc/ceRgJmHLWwLwZq1EoTG
         mhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOjoPfqaWlArtnMw7s4rg7MseP6iho38F8wVw2VyUXs05cZzCDmqFFQiJyBPuDRUcFTfJ+O2VfHwfvexQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwgqs0QSP4jZXVMkVhzlf5MKo9UAPacMD2hPGwNhAiLmljCxA
	X7lCpgWr4x/f8hBk9I8yM511IYAJ34+ygq/EubM/43b8lZgc302wzlrdcJNG/5ZM4nKB5fcalJO
	FlJy/LOfSKWHv20UpuSlBu41yxxGRtW8=
X-Gm-Gg: ASbGncuR4bqA+7k4PsTAVp8MZFX+4nFbwdc5USYwAmG/zkc9x+r+cL3k9JnAdmeM1ur
	dq0k/2EOkiVQZX+jjKKyxe3w0yb7l6BeE/Q+7hG26pkkh5dUShsYGWteXjEALSCE3lBsIcDr1oe
	KXaQAAk4WpgHMcy58Ayq0pGE8qX2qM0FYL33IVYJvMDUcr8KzthlqNAcFtqcPwwv3LF53ls68/Q
	aqftg==
X-Google-Smtp-Source: AGHT+IH+gJe+BL6yCA7mEGder2oiUWhfY4G8pX6Nt7XDyy4GsjjjIXGrWNqCqgE9eotrFsyBSb7jcR3yYkMAQ0N7mWM=
X-Received: by 2002:a2e:a781:0:b0:32a:83b5:34ba with SMTP id
 38308e7fff4ca-32b223b6f4bmr9396991fa.20.1749650632133; Wed, 11 Jun 2025
 07:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607064444.4310-1-pranav.tyagi03@gmail.com> <87cybdp7to.ffs@tglx>
In-Reply-To: <87cybdp7to.ffs@tglx>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 11 Jun 2025 19:33:39 +0530
X-Gm-Features: AX0GCFsALrCD5nGDJIuDloqSPWlSSAfHKuZ-ZeZ9_L94K6dWGNOykGhECj18iEk
Message-ID: <CAH4c4jLjSBxbd3bqkdgcCSWqXURratANgnbq9negrSU283xHpg@mail.gmail.com>
Subject: Re: [PATCH] futex: don't leak robust_list pointer on exec race
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-kernel@vger.kernel.org, jann@thejh.net, keescook@chromium.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:15=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Sat, Jun 07 2025 at 12:14, Pranav Tyagi wrote:
> > Previously, the get_robust_list() and compat_get_robust_list() syscalls
> > used rcu_read_lock() to access the target task's robust list pointer.
>
> This is not previously. It's how the code is right now and you want to
> describe the status as is.
>
> > However, rcu_read_lock() is not sufficient when the operation may sleep
> > (e.g., locking or user-spaces access), nor does it prevent the task fro=
m
> > exiting while the syscall is in progress.
>
> 1) There is no sleeping operation in this code path.
>
> 2) Of course it does not prevent the task from exiting, it only prevents
>    the task struct from being freed. But what's the actual problem with
>    that?
>
>    task->robust_list contains the tasks robust list pointer even after
>    the task exited.
>
> > This patch replaces rcu_read_lock() with
>
> git grep 'This patch' Documentation/process/
>
> > get_task_struct()/put_task_struct() to ensure the task is pinned during
> > syscall execution prevent use-after-free.
>
> Which use after free? You fail to explain the actual problem in the
> first place and then you describe a solution for the non explained
> problem.
>
> > Additionally, the robust_list pointer can be modified during exec()
> > causing a race condition if accessed concurrently.
>
> Sure, but what is the effect of that race condition?
>
> begin_new_exec() -> exec_mmap() -> exec_mm_release() ->
> futex_exec_release()
>
> The latter sets task::robust_list to NULL. So this either sees the real
> pointer or NULL. The actual problem is?
>
> A similar concurrency race exists between sys_get_robust_list() and
> sys_set_robust_list(), no?
>
> > ... To fix this we
>
> We do nothing. See
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#change=
log
>
> > introduce down_read_killable(&exec_update_lock), a read lock on a
> > rw_semaphore protecting signal_struct members that change during exec.
>
> > This read-write semaphore allows multiple concurrent readers of
> > robust_list, while exec() takes the write lock to modify it, ensuring
> > synchronization.
>
> Synchronization of what?
>
> > This prevents an attacker from determining the robust_list or
> > compat_robust_list userspace pointer of a process created by executing
> > a setuid binary. Such an attack could be performed by racing
> > get_robust_list() with setuid execution. The impact of this issue is th=
at
> > the attacker could theoretically bypass ASLR when attacking setuid
> > binaries.
>
> It can theoretically bypass ASLR. That's impressive given the fact that
> there are a gazillion ways to do so.
>
> Now let me ask the obvious question. How is the new code so much more
> protective?
>
> T1                                      T2
>
>                                         exit();
> sys_get_robust_list(T2)
>    lock();
>                                         lock();
>    head =3D T2->robust_list;
>    unlock();
>    copy_to_user(head);                  // T2 mops up
>    ....
>    return_to_user();
>
> T1 has the pointer, which is not longer valid. So what is this magic
> serialization actually preventing?
>
> Surely not the fact that the robust list pointer of T2 can be invalid
> immediately after T1 retrieved it.
>
> > Overall, this patch fixes a use-after-free and race condition by
> > properly pinning the task and synchronizing access to robust_list,
> > improving syscall safety and security.
>
> By handwaving....
>
> The real issue what Jann's original series is trying to address is that
> the ptrace_may_access() check is racy against a concurrent exec(). But
> that's nowhere mentionened in the above word salad.
>
> That said, I'm not opposed against the change per se, but it needs to
> come with a proper explanation of the actual problem and a description
> of the real world relevance of the issue in the existing code.
>

Hi,

Thank you for the detailed feedback. I appreciate the time and
insight you=E2=80=99ve shared, and I=E2=80=99ve learned a lot from it. I ho=
pe you=E2=80=99ll kindly
excuse the shortcomings in my initial changelog. I=E2=80=99m still new to k=
ernel
work and upstreaming. I understand that my changelog
didn=E2=80=99t clearly convey the actual problem.

Does the revised version below address the concerns more effectively
or does it still need a bit more seasoning?

"Currently, sys_get_robust_list() and compat_get_robust_list() perform a
ptrace_may_access() check to verify if the calling task is allowed to
query another task=E2=80=99s robust_list pointer. However, this check is ra=
cy
against a concurrent exec() in the target process.

During exec(), a task's credentials and memory mappings can change, and
the task may transition from a non-privileged binary to a privileged one
(e.g., a setuid binary). If get_robust_list() performs ptrace_may_access()
before this transition, it may wrongly allow access to sensitive
information after the target becomes privileged.

To address this, a read lock is taken on signal->exec_update_lock prior
to invoking ptrace_may_access() and accessing the robust_list. This
ensures that the target task's exec state remains stable during the
check, allowing for consistent and synchronized validation of
credentials."

> Let me look at the code.
>
> > diff --git a/kernel/futex/syscalls.c b/kernel/futex/syscalls.c
> > index 4b6da9116aa6..27e44a304271 100644
> > --- a/kernel/futex/syscalls.c
> > +++ b/kernel/futex/syscalls.c
> > @@ -53,31 +53,43 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
> >       unsigned long ret;
> >       struct task_struct *p;
> >
> > -     rcu_read_lock();
> > -
> > -     ret =3D -ESRCH;
> > -     if (!pid)
> > +     if (!pid) {
> >               p =3D current;
> > -     else {
> > +             get_task_struct(p);
> > +     } else {
> > +             rcu_read_lock();
> >               p =3D find_task_by_vpid(pid);
> > +             /* pin the task to permit dropping the RCU read lock befo=
re
>
> This is not networking code. So please use proper comment style:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#commen=
t-style
>
> > +              * acquiring the semaphore
> > +              */
> > +             if (p)
> > +                     get_task_struct(p);
> > +             rcu_read_unlock();
> >               if (!p)
> > -                     goto err_unlock;
> > +                     return -ESRCH;
> >       }
> >
> > +     ret =3D down_read_killable(&p->signal->exec_update_lock);
>
> Lacks a comment explaining what this is actually protecting.
>
> >       if (put_user(sizeof(*head), len_ptr))
> >               return -EFAULT;
> >       return put_user(ptr_to_compat(head), head_ptr);
> >
> >  err_unlock:
> > -     rcu_read_unlock();
> > -
> > +     up_read(&p->signal->exec_update_lock);
> > +err_put:
> > +     put_task_struct(p);
> >       return ret;
>
> You really did not have a better idea than copying all of that logic
> into the compat code?

As I=E2=80=99m still learning, I wasn=E2=80=99t quite sure how to avoid
duplication there. Would factoring out the common logic into a helper funct=
ion
be the right direction? I=E2=80=99d be grateful for your suggestion.

>
> Thanks,
>
>         tglx
