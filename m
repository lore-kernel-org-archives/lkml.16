Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2A746E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315375; cv=none; b=o1bvpfR/Ap54RsTGO1ieu+yDtJk4kpXson25MZ2vrDoQHhVSD429pJfuA2WX0IXhCgnigmzApNTgvDc3GQhkRrRA8aY+L0bIQxAin6o9vqf49pmLlsGoKDuZv1cmu9ZwKm3X3xoRVmL+EzVraF3BEOqZaVLYeADOs5MVgZNNgzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315375; c=relaxed/simple;
	bh=EgyG0ArL+HtCA+Jm/wHgbZXmmR3n8RySP1ZgRGQZxWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0HBXfgjdN1sEbt5pOd5vb2SGqXQJY9DXK3xhakkZuBfEfbHGZouARavCGwFO8Ehgd+HHCzQ6NQy80iDOsWwKUieQZYtKJJNXw76PITdqyMeSMr8Tuf6yNFNrHJUCzknqztay6xkJhCO0u2t51EwgWKGf7UDIOi0nfntRg3Qk24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=UbHWgPgJ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="UbHWgPgJ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499614d3d2so969694e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1747315372; x=1747920172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xpwhDrJcmdUxr+aMMW8YmzS8jkn0TpvM55yuHoJ1Wh0=;
        b=UbHWgPgJlT4zTzCgy6zO4SjqWDOSZqkfB9SCmeVPKfQ0rlrNfu0HZLugjQIUYDrDNO
         oc1Py+EGVpmlqffPhblY7k7P7Mc7HoxI4VNO6GDySG2D0t6rV/oeLAG8g6wUoN6zU8dz
         hKTpqqzaEV+VxyFVFbtDYgLCu/eLQpSvwtiSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315372; x=1747920172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpwhDrJcmdUxr+aMMW8YmzS8jkn0TpvM55yuHoJ1Wh0=;
        b=Vp+nGLr+gx1oEc3y51fkzJHrp1SjnTRaHnsbjSaXsHi7WWFctj2vhZGCBjd9n1wlsf
         O2akyjVTyVGt6oxsd8g6R9nN4Pzv30DPc5rJjNjW/eK7fH44sJ+qkpldY8WedvUgHSut
         tLDxdIsYE8I9gvfsfpkEO6FU8CBg3YeGBsvE/KKxb1divg9tPtqJmAkQy3QDBOeealtF
         Gh9hvm1yR1NuzOAnKVnE3jLU7C+t1PBAzhS/yYfKTJKW1Y22BaDIMkH2/loRQ3Z+TWtm
         fina+2LWUXry2tAirLG2GkIhd/el3WcfyROYUepn//f32qGtcsDJBW8bUNUbnUpXhPqo
         9nOA==
X-Forwarded-Encrypted: i=1; AJvYcCVv4AchlyGbdlL1UAOol7ckDAMH2+aKxs/rLd8LLQsgP49gXT+4jmMUDWk3uGBKi5Dqzqnqiwd4rBwUCKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRkuyi169kv8rUfvBL47GqZRxi5fi3lsUScfBaQve0BG2AFP4
	0F3uH+mhPDYz/i+qZKbBjgWfsr3wAmtzi4cEcvBCdShEt0Dzl2chkVgea6TbJZBhgd+8GNObZI3
	EkoDCscdANvMli84kEEZG9qQFjv8RHgIyrGKkqA==
X-Gm-Gg: ASbGncu51sD6OTRG252H7MGcQwCKjSwm7rLfYoMaUXPlO7gTeygJDrWMbhoYWq+mpUd
	UUHN2lrFIb8f6cBvZ1VO77ExRWIpdCw2DqRX3vsBdEOUVvfpy2AP7yUbP+SIATA9tmaw4STc1Fj
	dh4XQSPg1gR+UM3prkLsVADV8v0N+bUVdRfg==
X-Google-Smtp-Source: AGHT+IEhwlbgn+32pxYI1ofa/s6/2TQuFwALvt46bLIhQPT10vzlVoBp8hOxpg+dlGoYiEgJcm1faLY456zUlXZ1SjY=
X-Received: by 2002:a05:6512:b03:b0:54f:ca5e:13ac with SMTP id
 2adb3069b0e04-550d5fb8f3amr3444086e87.31.1747315371956; Thu, 15 May 2025
 06:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-work-coredump-socket-v7-0-0a1329496c31@kernel.org> <20250515-work-coredump-socket-v7-3-0a1329496c31@kernel.org>
In-Reply-To: <20250515-work-coredump-socket-v7-3-0a1329496c31@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Thu, 15 May 2025 15:22:40 +0200
X-Gm-Features: AX0GCFuJsLCvWcVGqgJhD9YjQcGy9FnFS3GMK4AhS0yialHNeCeiDfFFREAeYEU
Message-ID: <CAJqdLroB-JGEQTdDzQXZSHCETmY=gvgSr9sKGEza0LaYiuOvqw@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] coredump: reflow dump helpers a little
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Eric Dumazet <edumazet@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Do., 15. Mai 2025 um 00:04 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> They look rather messy right now.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>

> ---
>  fs/coredump.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/fs/coredump.c b/fs/coredump.c
> index 0e97c21b35e3..a70929c3585b 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -867,10 +867,9 @@ static int __dump_emit(struct coredump_params *cprm, const void *addr, int nr)
>         struct file *file = cprm->file;
>         loff_t pos = file->f_pos;
>         ssize_t n;
> +
>         if (cprm->written + nr > cprm->limit)
>                 return 0;
> -
> -
>         if (dump_interrupted())
>                 return 0;
>         n = __kernel_write(file, addr, nr, &pos);
> @@ -887,20 +886,21 @@ static int __dump_skip(struct coredump_params *cprm, size_t nr)
>  {
>         static char zeroes[PAGE_SIZE];
>         struct file *file = cprm->file;
> +
>         if (file->f_mode & FMODE_LSEEK) {
> -               if (dump_interrupted() ||
> -                   vfs_llseek(file, nr, SEEK_CUR) < 0)
> +               if (dump_interrupted() || vfs_llseek(file, nr, SEEK_CUR) < 0)
>                         return 0;
>                 cprm->pos += nr;
>                 return 1;
> -       } else {
> -               while (nr > PAGE_SIZE) {
> -                       if (!__dump_emit(cprm, zeroes, PAGE_SIZE))
> -                               return 0;
> -                       nr -= PAGE_SIZE;
> -               }
> -               return __dump_emit(cprm, zeroes, nr);
>         }
> +
> +       while (nr > PAGE_SIZE) {
> +               if (!__dump_emit(cprm, zeroes, PAGE_SIZE))
> +                       return 0;
> +               nr -= PAGE_SIZE;
> +       }
> +
> +       return __dump_emit(cprm, zeroes, nr);
>  }
>
>  int dump_emit(struct coredump_params *cprm, const void *addr, int nr)
>
> --
> 2.47.2
>
