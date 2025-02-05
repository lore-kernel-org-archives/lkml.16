Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190B1FE47E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787673; cv=none; b=hjkG9xlsIbPDPkhm0Ocgl5mx+OYYi1qimYtUG+YpFClafKqe6q7ZnLfawd+MbM9YE9+8Cpjl1ftsm/231DQfV5oZ23/Gt4NpCsiNe3Yg/qfMlo1P05Kn38Ms0vWvLqcZDN14MCcx0MuXCO/kApgllrtHU6uyKYAXeLOp++UqhDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787673; c=relaxed/simple;
	bh=GgtyRAX9vdMCndp5ia0g8tlw540Vkh9c2/URB1MpVTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BjIacXJzMNgNQMCgGd6UPqL569Vu+akKdA+qhoyUHwaBuqsfySclpXOWx9VXdNk/OKAww4fAKAG3KrJKr/ZBo12hibONk5GRLHXJ1q58BUyfqU/ZgJtzKk62a3B2j12tjFxqaSp66CAKXJZ1i5AgrBVgFosJ/Tu/VIj7smo1vfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaJ4vOCU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaJ4vOCU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dca4521b95so491555a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787670; x=1739392470; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OMz7JDebVsaDEFB8And8TQUKXqKBE8TARUzFCBMADY=;
        b=kaJ4vOCUA7iLwuIfd7J3wYDvlDHyH77PHbQNQux39FkDu8NXdO9P4oCAn4Ns0cP94b
         rSXflFfS3KzURJWFg/N8aW7N8GP0ykERfvcv+8s2R2L700bBnb6K+fAMQLJm4VxXKi74
         sgWr/xc/jK/YhNg1u8eSw7KlVEah/NoDYh/unOMw74lUstKoE7UDn5PLoF/Y9d5BUork
         nc1ibg9dBznkF/Ssc2/d2Ht1nhXFG3QctmswUGrE/qRT0iaGngsMzJXb7tZ8jA988zEU
         8IkxTEF5zMnWhfd4kQ3wfFb5thNajYWS6NEdL0bfRy/xhV1iUooddUZegm+goH33sMIg
         3pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787670; x=1739392470;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OMz7JDebVsaDEFB8And8TQUKXqKBE8TARUzFCBMADY=;
        b=TpIRks1VFIdZZMYqHulW6SbqA7u0eR0DT5WZYa4BIKVziyH9PtRXbpOovmt4toAVOB
         QQsB0Bjm6cIVuF0rOPo4h2iK6BJMQMvqnUkRAsfaqsiWWpG4GR6K95go+QNbLGfyMuk+
         maG1MErhPSeW/zNvhllx+XSES4PpaaRZFXIRs5E2vzohXdxI564bFZTcpoZp4rMyH6MB
         mOXlzM3AqiaBJl/b37OZILn9shyBztSSr2BFHTwbY0trCR+KVMkzxb9OQRqGczMBZGJ8
         U5P5xLYDRrywfKaq0PaB2h189UXXmdrAfL4HxnLGl2DOp1WWj5KcOkrPcrp9fY5j1ACO
         ptbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfnrKJGNi1lwsLTdc2xdzFvh4w6HTZi1XDcChR6QOFVSRDBY5MNf/E2Oq5rEuzv/h/+YlreIuOF533bn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVGPHjtwuMqZRD0AMOyrKSK5mXcLEAlPD0CYU4HAOTp2g9Q2+
	iZAWFK+90g6Elru8+zAkH3G3Y/u2uw6v3HYuhQMk9KbB1pozCx7tfifUcBaNzyQt8S0ewTm++k1
	8KI0NU0tJrUbfExVyb/v4S/qwZUc=
X-Gm-Gg: ASbGnct/zImLZdpr69s/nznTCvAPmaIkBv04OX3hpAZy579rkJK9aKCssUpvcl9zif4
	7XdqKJpBkQLvFsCsqJ7wHEJa/37el9NNwpQZ7CNxOcad2IavsX3lwXkRZ/ZxI79ocZdcc8+4=
X-Google-Smtp-Source: AGHT+IFwmUdMIWWKf38XVdsaxQLtbeeO1zD+lKAcNS7molklTDJuLyO8/LrFcBnfgs38/0v3rBafeSC7o4eyEZzzbPQ=
X-Received: by 2002:a05:6402:845:b0:5d3:e766:6143 with SMTP id
 4fb4d7f45d1cf-5dcdb77fba0mr5108263a12.30.1738787669759; Wed, 05 Feb 2025
 12:34:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205193221.402150-1-mjguzik@gmail.com> <20250205193221.402150-4-mjguzik@gmail.com>
 <wzbq4zk7uln5pzjkho4olu3hku2xv2taxymv3ien437tjxivlm@sz5kxj5oohsq>
In-Reply-To: <wzbq4zk7uln5pzjkho4olu3hku2xv2taxymv3ien437tjxivlm@sz5kxj5oohsq>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 5 Feb 2025 21:34:18 +0100
X-Gm-Features: AWEUYZl6IU4tuGZOtiYDvVaB9yI0LX9EP_anNTFZMZfOekz1ZBbVGZRdcXKdTGk
Message-ID: <CAGudoHGPAQYwVUEYgxMYZ808=wAO3RteLsqNgG21pvE8Gfs_eQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] pid: sprinkle tasklist_lock asserts
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, 
	oleg@redhat.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 9:27=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Mateusz Guzik <mjguzik@gmail.com> [250205 14:33]:
>
> If a patch is worth doing, it's worth explaining.  I'm surprised you
> didn't add a comment after the last revision missed a comment on patch
> 2/6.  This is literally in the submitting patches document [1].
>
> I don't mean to delay this series, but I do want to know why things are
> done when I'm hunting through git logs.  Having a change log isn't
> optional, and now you know that Andrews script won't fix this problem
> [2].
>
> I see you are upset by this considering the terse and lack of
> punctuation in patch 2, but please try to understand these comments
> serve a purpose in maintaining the code years later.
>

I'm not upset.

For this specific case I don't know what can be written in the body
given the really self-explanatory nature of the change, other than to
spell it out(?).

Does this work for you:
The routines need to be called with the tasklist_lock, the asserts
validate at runtime that this holds.

I also git log a lot and like to know what's up, to that end I
appreciate *short* commit messages so that I know there is nothing
more to the patch than meets the eye. In particular if there is
nothing of value to add in the body, I appreciate if there is none.

But that's me, I'm not going to insist one way or the other.

> [1]. https://www.kernel.org/doc/html/v6.12/process/submitting-patches.htm=
l#describe-your-changes
> [2]. https://lore.kernel.org/all/20250203175128.80319b42c9739f0d420080a4@=
linux-foundation.org/
>
> > Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > ---
> >  kernel/pid.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/kernel/pid.c b/kernel/pid.c
> > index 924084713be8..2ae872f689a7 100644
> > --- a/kernel/pid.c
> > +++ b/kernel/pid.c
> > @@ -339,17 +339,23 @@ static struct pid **task_pid_ptr(struct task_stru=
ct *task, enum pid_type type)
> >   */
> >  void attach_pid(struct task_struct *task, enum pid_type type)
> >  {
> > -     struct pid *pid =3D *task_pid_ptr(task, type);
> > +     struct pid *pid;
> > +
> > +     lockdep_assert_held_write(&tasklist_lock);
> > +
> > +     pid =3D *task_pid_ptr(task, type);
> >       hlist_add_head_rcu(&task->pid_links[type], &pid->tasks[type]);
> >  }
> >
> >  static void __change_pid(struct task_struct *task, enum pid_type type,
> >                       struct pid *new)
> >  {
> > -     struct pid **pid_ptr =3D task_pid_ptr(task, type);
> > -     struct pid *pid;
> > +     struct pid **pid_ptr, *pid;
> >       int tmp;
> >
> > +     lockdep_assert_held_write(&tasklist_lock);
> > +
> > +     pid_ptr =3D task_pid_ptr(task, type);
> >       pid =3D *pid_ptr;
> >
> >       hlist_del_rcu(&task->pid_links[type]);
> > @@ -386,6 +392,8 @@ void exchange_tids(struct task_struct *left, struct=
 task_struct *right)
> >       struct hlist_head *head1 =3D &pid1->tasks[PIDTYPE_PID];
> >       struct hlist_head *head2 =3D &pid2->tasks[PIDTYPE_PID];
> >
> > +     lockdep_assert_held_write(&tasklist_lock);
> > +
> >       /* Swap the single entry tid lists */
> >       hlists_swap_heads_rcu(head1, head2);
> >
> > @@ -403,6 +411,7 @@ void transfer_pid(struct task_struct *old, struct t=
ask_struct *new,
> >                          enum pid_type type)
> >  {
> >       WARN_ON_ONCE(type =3D=3D PIDTYPE_PID);
> > +     lockdep_assert_held_write(&tasklist_lock);
> >       hlist_replace_rcu(&old->pid_links[type], &new->pid_links[type]);
> >  }
> >
> > --
> > 2.43.0
> >
> >



--=20
Mateusz Guzik <mjguzik gmail.com>
