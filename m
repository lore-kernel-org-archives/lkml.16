Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB3278E61
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374805; cv=none; b=tKjxxwomQ7WgF8DCKmJo7fV2NQU+DtI8eKpu9p7ZmJf9iGJ9+zvxCFuJ19Phx7lKnbkhI3NotA+Pf59RY4rnwccpWbNXGRdr/HEXb1XQaJoZU3uzduJrdnfzNm2TlO9KBj7ZwNBChggBnnvQZbKu1WH1sMH9S5uvSM4NAxEt+ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374805; c=relaxed/simple;
	bh=8Cv8gu6yB6ELhGwus3lC9d41aft1/TB5kZaoFSEd0kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tu08HCjbHrsrH4u35VwX1ZY8xKsLij8RIhS3NLbf3SfFZmjPUGPlbKf+9KVIgwx6Ukco/4ktZwLmdFwo/0nYO0YKynlTeGdqfIl0gW5kPFchM4wUDzCULCIY0pYs3eAPObbhoInN+IenJ/UrI+R3BbbdJjMgbUgJl6axSpPg7U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nW8Fh7E2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW8Fh7E2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3b12e8518so322995666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744374802; x=1744979602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgf8d6R2RU8TyUfHi+3i2a8tmHNaPOEOv17gb69/8Xc=;
        b=nW8Fh7E2LqL5pHtAb2Q0BPg5J/4nn5awcHF2LdMeKp8zZIhQRGu+Gx4oExyFuUz5aJ
         Yqb4js3DBZbToNI84+hPVfpiFsPQpFZN1nWOllV9BsmeKa1u44wAAhY8lbtHYNgBDjao
         f2I7kQazK5qBDIZx9b5sho4ddhritl04a/SkqjHoNxu+4AtaxNdOEhFE22tbt3e7d89/
         5KfwhW6flYaxi/muT8NPNCKlslcAv4OgjZNIEfMu9/rdQAjRcDMJPOGoR1/HWiFXCQnr
         fHUZTkhnzPO74w+3wxvDylJqE1pvdRwuSwH5dGGubANumSSJqyeiHlfFFVLD3b9ayN3r
         lN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374802; x=1744979602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kgf8d6R2RU8TyUfHi+3i2a8tmHNaPOEOv17gb69/8Xc=;
        b=jUe/Q5NFd0GzHdFbIUn6xZuJ1a07EwLi4wjYXf5ToXSvj/hkpqdzgCe1QkQ1lR1KzJ
         rMgOhutRoQj9UBxAIJptHCwD841hskFpNrz3NDsCvv2evTE6A16LZvsmaEa/8sNgNCoe
         U8iX9LWH75vfrRmBHfF0d48YOPOzxEdZUNFgDaN6ILiv9jQxGzkjCte61U/gQKnvfd5l
         S5e+NAWgSRkvF2u1wcXdkdm5RmLFxa1ch9N1iRdpSwTkFTj7KRSRlInk2BhnYX84ksmo
         OBng+gWdPq/T0lqcv/CG2h+NsLZPV7J5x6JfNZD6R5ex4ARLDOv1iTAImCxApj1myJcM
         OBYw==
X-Forwarded-Encrypted: i=1; AJvYcCWge0wsE+L0C4Bif/BIX3fQxMCgrNp91rHfkouj0Ot4lM+9FXnMiYXFA01idDWChpw7bO6d7WV8RVWJgGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE4LH5rnB4nm09mJvx+vkcIPV5rD/T/wwm4APXNCcvjRqtPt/H
	Rwxu1x4c5KD9Pc9cfRIHgyyhA+kHIuTqHaRYico7n9/SAKYFfaswhknWt27hS6kmTJt6PXMljBI
	l8Q+F/4M/a+S1//NjRh46jtqFZIc=
X-Gm-Gg: ASbGncuKZEx+Ir3k4cQb/X//+FvdVbqz861H608YjnkxqXfFpbHqL0bl6K0EBOFez7F
	0pBdXAGyIwYsqNBLxmcf42BBnCZZyGxaffOlcLhbcNtvmgTns17e71Yh0HkEYTtDfBEWxNRcEXE
	JpKafPMMbZp2g6mCAJV7K1
X-Google-Smtp-Source: AGHT+IG11gy3C3wL5AIH8XYw1/P5+vwNMVZUlZ+lvAAnasezevMKolaIBuPOM9a+y/simgkPvBSPtd3oQfXgcrMgmQE=
X-Received: by 2002:a17:907:1b03:b0:aca:c6fe:30e2 with SMTP id
 a640c23a62f3a-acad36a46c7mr226589966b.41.1744374801783; Fri, 11 Apr 2025
 05:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411121857.GA10550@redhat.com>
In-Reply-To: <20250411121857.GA10550@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 11 Apr 2025 14:33:10 +0200
X-Gm-Features: ATxdqUEWdUfTZAXyfoWF9CQApxFeHbolKjAi7GtId7uI9BYnPZcc7xbQfs9TwZM
Message-ID: <CAGudoHFc0u2tpodDV9GXw6raUvnr3mDR8tN+Ec3ZXCR1v3q19g@mail.gmail.com>
Subject: Re: [PATCH] release_task: kill the no longer needed get/put_pid(thread_pid)
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 2:19=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> After the commit 7903f907a2260 ("pid: perform free_pid() calls outside
> of tasklist_lock") __unhash_process() -> detach_pid() no longer calls
> free_pid(), proc_flush_pid() can just use p->thread_pid without the
> now pointless get_pid() + put_pid().
>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  kernel/exit.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 1b51dc099f1e..96d639383f86 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -239,7 +239,6 @@ void release_task(struct task_struct *p)
>  {
>         struct release_task_post post;
>         struct task_struct *leader;
> -       struct pid *thread_pid;
>         int zap_leader;
>  repeat:
>         memset(&post, 0, sizeof(post));
> @@ -253,8 +252,6 @@ void release_task(struct task_struct *p)
>         pidfs_exit(p);
>         cgroup_release(p);
>
> -       thread_pid =3D get_pid(p->thread_pid);
> -
>         write_lock_irq(&tasklist_lock);
>         ptrace_release_task(p);
>         __exit_signal(&post, p);
> @@ -282,8 +279,8 @@ void release_task(struct task_struct *p)
>         }
>
>         write_unlock_irq(&tasklist_lock);
> -       proc_flush_pid(thread_pid);
> -       put_pid(thread_pid);
> +       /* p->thread_pid can't go away until free_pids() below */
> +       proc_flush_pid(p->thread_pid);
>         add_device_randomness(&p->se.sum_exec_runtime,
>                               sizeof(p->se.sum_exec_runtime));
>         free_pids(post.pids);

I'm trying to remember why I did not just remove it.

Interestingly I see my v2 *did* do the same thing:
https://lore.kernel.org/all/20250128160743.3142544-1-mjguzik@gmail.com/

+ proc_flush_pid(p->thread_pid);

I guess it fell through the cracks during reworks, shit happens.

that said:
Reviewed-by: Mateusz Guzik <mjguzik@gmail.com>

thanks

--=20
Mateusz Guzik <mjguzik gmail.com>
