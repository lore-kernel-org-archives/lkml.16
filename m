Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D541C8619
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660482; cv=none; b=QRlXZJBsGiVhszlLuSEnlsYrW2P4eamvwVdhqAeuaSWbTR99wAJOY6acLnmwO7w7mZ8qbJuHiQp5pUBr/8O43WBDuec8KWiv9/mY9s7DrXeJvV2D9TLGBauaQeq9+ZZW0KBJG/+R+D7XX9S54klW+7gnJSpTrvy1+FRU0jOYD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660482; c=relaxed/simple;
	bh=tLaqryg7BrIyzjZvfZ9lwCA34FCUSexXTFQjjF+73aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEpxe2m+Fq39SJCD6bPmz1tSR6VG+csvmuS1nxPzgW14zzWxnHX4sdQZgcUTj7+Qxb26gyZMPjlsfEVJ24blOYGAfgpXxlNf7pemzp6pHTedGgexh2Ecl72ghD9aH2a5gLrbzp8Mh/jh2VbX8YmAOx+Sk24Vl689MtJT+qD8OXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfkQ8bav; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfkQ8bav"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25520a289so813676866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744660479; x=1745265279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVY7tG5OgZCcDKnR2ALox9NzMQSEMkD+lU3JrnIX4CA=;
        b=VfkQ8bavYwD0q7K4D2ugPK8qLURALqQHad/9DHGycF7Fooo/gWKYAlNMNgDFiKrhPG
         h2qxg0Ntek7hrtzjU8Lb2zUxjBc8kRGaOmuxU7JWCRf7kvOfaNvF8JTdIvj72zCCzfcL
         bzXc9yvV9Is3c5agdmMWaKxL+Agx/kRzqEBDRPPlNKDrvTAB7udRby8yLAQ/LTvCV/5R
         uMg0gJKfTA6Dq/oWClVaqt9yHXPFXlgH6IxSH9imAliSZLZJ9Z4QQWa5vCOSBhGzwIqF
         9DH6BsIHNdiX5ff/4vPADBD7Uytt7I+tY3+EdAwivW7pTqgLPlvz77l/32AqXMaV4hZT
         mn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744660479; x=1745265279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVY7tG5OgZCcDKnR2ALox9NzMQSEMkD+lU3JrnIX4CA=;
        b=iU28mfGK7ozI9FMKrmJzC8Ajg1nsXERRoYfBIA8+U41aKZSDOv8bDMZy0DPTlMlZdL
         P6/scozHa3u3NDcADRc2zt/mmIesHQf7EhJorNRzGqd4DCynqco0RKlqbbNmMF/npU/K
         y+u79HD96wIVUDFD3dIZetM8M7KjPootzXCClOdeFdd5wpQs3NJsnYRrHBEttFr+li5h
         cZul8RnpHm3lk1h4uCtC7YwwbEWMJ9lVt1a5+prz31aDj05O72tKbuyYzTIdMjIFaniB
         Dlyj3kj77rf3kosxOMU6fuZI7p+hn0IvcIacibLk/Pzsl3VRPP3PKV1gPUNUjJ/0XLYO
         pCOg==
X-Forwarded-Encrypted: i=1; AJvYcCW//ExgbSvrAvJP61maeUhNfRL5dVEzvo3Ks3PHutlAjgOzO7AkgdaLoX+PEVpzxB5y3rCwQ7rvjfuBzOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRsGiCfYYuQWOJbFD+QZCfFtmfsK4BQqlwcgbCDRPdw7bo1tYj
	JoD1VNMn8qPBdAQ3p13SahjpDfO6r7GhTYW0E5t2epWxoX85dBYAs6QJZkWTjfOE+Oeu8pEmN4B
	0WrRZ0HhBQODi8seMm7dis+i3/0R/MA==
X-Gm-Gg: ASbGncuYG2/H8OTvcL27sBUkfPQ4+hrgIenb/lsOqcSUadhkNeDJ6LIjnNGPf7VJIH9
	cmAkc5yRNUu64M+pmyEwO0b9ZE5OxdOuHJWb18fCDT9oH5K2KerZOAiZagi1Gpe8qFlj8T0Ab5O
	0GGZaVqANBXzMIEmfhUVtm
X-Google-Smtp-Source: AGHT+IF6PIp12ygbmGorAiWJ/tPc6EIFp1HSTpw5oKRfB2r4VUHQAXPNFv7AtTYsh6LTe1sQiz0hCVkE3fAMNQ4AHoQ=
X-Received: by 2002:a17:907:d9f:b0:aca:a687:a409 with SMTP id
 a640c23a62f3a-acad3493c39mr1316053166b.17.1744660479244; Mon, 14 Apr 2025
 12:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411121857.GA10550@redhat.com> <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
 <20250414-tintenfleck-planbar-656144f25a3b@brauner>
In-Reply-To: <20250414-tintenfleck-planbar-656144f25a3b@brauner>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 14 Apr 2025 21:54:26 +0200
X-Gm-Features: ATxdqUH4D_i8b-kNM4S1w927enkGT-v4_uTOs4x5cf98x0KvnXxiadl2GgVGXko
Message-ID: <CAGudoHGyN5qno0TVfY-vCJBHjkDd-CL82-W_o7u6b+qXraAJVA@mail.gmail.com>
Subject: Re: [PATCH] release_task: kill the no longer needed get/put_pid(thread_pid)
To: Christian Brauner <brauner@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 9:45=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Mon, Apr 14, 2025 at 09:39:47PM +0200, Christian Brauner wrote:
> > On Fri, Apr 11, 2025 at 02:18:57PM +0200, Oleg Nesterov wrote:
> > > After the commit 7903f907a2260 ("pid: perform free_pid() calls outsid=
e
> > > of tasklist_lock") __unhash_process() -> detach_pid() no longer calls
> > > free_pid(), proc_flush_pid() can just use p->thread_pid without the
> > > now pointless get_pid() + put_pid().
> > >
> > > Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> > > ---
> > >  kernel/exit.c | 7 ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/kernel/exit.c b/kernel/exit.c
> > > index 1b51dc099f1e..96d639383f86 100644
> > > --- a/kernel/exit.c
> > > +++ b/kernel/exit.c
> > > @@ -239,7 +239,6 @@ void release_task(struct task_struct *p)
> > >  {
> > >     struct release_task_post post;
> > >     struct task_struct *leader;
> > > -   struct pid *thread_pid;
> > >     int zap_leader;
> > >  repeat:
> > >     memset(&post, 0, sizeof(post));
> > > @@ -253,8 +252,6 @@ void release_task(struct task_struct *p)
> > >     pidfs_exit(p);
> > >     cgroup_release(p);
> > >
> > > -   thread_pid =3D get_pid(p->thread_pid);
> > > -
> > >     write_lock_irq(&tasklist_lock);
> > >     ptrace_release_task(p);
> > >     __exit_signal(&post, p);
> > > @@ -282,8 +279,8 @@ void release_task(struct task_struct *p)
> > >     }
> > >
> > >     write_unlock_irq(&tasklist_lock);
> > > -   proc_flush_pid(thread_pid);
> > > -   put_pid(thread_pid);
> > > +   /* p->thread_pid can't go away until free_pids() below */
> > > +   proc_flush_pid(p->thread_pid);
> >
> > This cannot work though, right?
> > Because after __unhash_process() p->thread_pid may be NULL:
> >
> > __unhash_process()
> > -> detach_pid()
> >    -> __change_pid()
> >       {
> >       struct pid **pid_ptr, *pid;
> >
> >       pid_ptr =3D task_pid_ptr(task, type);
> >
> >       *pid_ptr =3D NULL;
> >
> >       for (tmp =3D PIDTYPE_MAX; --tmp >=3D 0; )
> >               if (pid_has_task(pid, tmp)) /* will be false if @group_de=
ad is true
> >                       return;
> >
> >       WARN_ON(pids[type]);
> >       pids[type] =3D pid;
> >       }
> >
> > so this needs:
> >
> > diff --git a/kernel/exit.c b/kernel/exit.c
> > index e6132ebdaed4..9232c4c684e9 100644
> > --- a/kernel/exit.c
> > +++ b/kernel/exit.c
> > @@ -244,6 +244,7 @@ void release_task(struct task_struct *p)
> >  {
> >         struct release_task_post post;
> >         struct task_struct *leader;
> > +       struct pid *thread_pid =3D task_pid(p);
> >         int zap_leader;
> >  repeat:
> >         memset(&post, 0, sizeof(post));
> > @@ -285,7 +286,7 @@ void release_task(struct task_struct *p)
> >
> >         write_unlock_irq(&tasklist_lock);
> >         /* p->thread_pid can't go away until free_pids() below */
> > -       proc_flush_pid(p->thread_pid);
> > +       proc_flush_pid(thread_pid);
> >         add_device_randomness(&p->se.sum_exec_runtime,
> >                               sizeof(p->se.sum_exec_runtime));
> >         free_pids(post.pids);
> >
> > I've folded this diff into your patch, Oleg. Let me know if you see any
> > additional issues with this.
>
> The task_pid() needs to be moved after the repeat label. I'm appending
> the full patch I applied.

oh heh, ack on that

but while here perhaps a small stylistic cleanup: move
add_device_randomness before or after proc_flush_pid + free_pids,
instead of if being in-between

--=20
Mateusz Guzik <mjguzik gmail.com>
