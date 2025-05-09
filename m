Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070642144AE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808588; cv=none; b=KdG6Ay7ubrnbO3Yr3t2HJ1qog/WKrkTibPNehRqmubslWG6mG6wbCU2yLyeZHjdtbh6c+9DjsDrNFil4dMexDAQJhDAFfHFwM9OqqWZzE+0Bv9VEy1UeiipTGjKm0mgXONkPqMlNHSmr7GyHUWOK7ppQmyh5J0d4YIYn2herR1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808588; c=relaxed/simple;
	bh=SElwm06j+DlRR4yCYm42BAqEpJ3JJLetNH0N75LAQZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEYTvB3RJdI29E6g/dKmQ6xg/vnzcJbjqpk8Lw25iO4h1zrwnjHUwusscS/4X0gkrZ3JN0DAeaiIDB9QyfjZU76eRTNqCqPr0td/mdR/ArqxizICN2jyltfTrPEsUkRKbFvXcfkL+6Qo9WkuxC16y7DSfvyY7XfNFVRta6nNr5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=RnX2XLF3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="RnX2XLF3"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54c090fc7adso3491983e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1746808584; x=1747413384; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzddh/3eTx6uQ05Z0QrC85lC2xnXc5MveRhZzr/KB1o=;
        b=RnX2XLF3idIdiYQEzvbzFqoxqPfoUkyCGUvSprCsOfMac+aFEygT0GMtuUavCNaxbH
         O9cSRPZVRrzJbBpVj9swKkcgOhcFRQl/wqoTiHHS2Hg7sQC3pRDfiNl3iRv//aAvF+ZM
         UFsdaCtIzqcJS0WoTGfZ/bC9Yswobjm1AwIx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808584; x=1747413384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zzddh/3eTx6uQ05Z0QrC85lC2xnXc5MveRhZzr/KB1o=;
        b=SUy8S4LUxR5bAO9PS0zafken5iQ7cTG61Az4CymBntGj9n4iETsJGQMMGV4DPOOxMi
         XlCvteZj6/GWDudUORKdXuT07UCUaR5g+s5wd6Aik+/LcIuj9/jUmQMgEBnIFgMXwdjd
         9ASvIvIyEI9DNJ6YVmfgqPAFBrElEvZ10ShdXQKb1rcbtSAeH7/6RzrrLFA9pag4BnjB
         XJB0CgiGmshhUoDQS3tWSY7XCK7OmKSVHoDZdgnhmCjgynO1JhGTmGmGS7zjeD/udfA/
         d0RfWDja0wMHcOoHq2SddeP2ESMHsXxlBDzZb1QM9MnbFqrQOpRuYEGV+BReNbjN6gHb
         UWXw==
X-Forwarded-Encrypted: i=1; AJvYcCWGfU8MK9C3sWKxj0M4QCY0HW7vAwgwov/Qy0HxbBTZyzCzUKaPkbxJiA9dzlC1Do5cJSV2BpXaqweXPSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+EeBmJfvcfb57uOvGrDl+xSAL8ecuyr68x64jm1HRZDIDfylp
	91+75OKAlttzZistt1+0eJMrru53XWH/Egar56t/Rn6IGx81m5SDtAd20ZHtxRn4Rr69XbbmaOr
	jkL9dAS2pgIkHX7KiIKI/y6K+ayvnhwSzKpFrMQ==
X-Gm-Gg: ASbGnctJwcLMlQBw1f4LQjqceDmGxsR8tds+hOJMpcORUua5tf6Mq6NdVMJVyPP6Ipx
	hKEtATKWJlK1KhVwuFdF8nBU38qPdaRlxtDcpurhDqDa+GAxu/UMpmEjYyDEe6TZ17/Iy/J+l2w
	A0oOsj39l/hAM3lupgCd6sN6Y=
X-Google-Smtp-Source: AGHT+IH+OGShjApAd9yBXoPzGyz7erva33bTf7tcbh9TZCZv8N/0Z47UJruRu0/G2XeKDRmeA7pJn36NDyQUl8d5EeY=
X-Received: by 2002:a05:651c:210a:b0:30d:b25d:72d0 with SMTP id
 38308e7fff4ca-326c457585amr16758911fa.17.1746808583777; Fri, 09 May 2025
 09:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-work-coredump-socket-v5-0-23c5b14df1bc@kernel.org> <20250509-work-coredump-socket-v5-3-23c5b14df1bc@kernel.org>
In-Reply-To: <20250509-work-coredump-socket-v5-3-23c5b14df1bc@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Fri, 9 May 2025 18:36:11 +0200
X-Gm-Features: AX0GCFvUuqDpuhS2JQ9T3QaKQJ6V58kyD4zcgQGwY68-T7tQ-lOHd3RNIb0VEdI
Message-ID: <CAJqdLrotSo_3gdq-eQhiBiA6Y76DV_Vi9x1sTZNjz97PZc=6PA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] coredump: reflow dump helpers a little
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

Am Fr., 9. Mai 2025 um 12:26 Uhr schrieb Christian Brauner <brauner@kernel.org>:
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
> index 41491dbfafdf..b2eda7b176e4 100644
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
