Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1514220F23
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500021; cv=none; b=nIVy9UlkLtEvV9Y4SMMPJddJ1HK2W+glt7NJ37szlX3/Ne3DDU92h8uXwk1P3+uWOs3ReU6rWkHY8SXMDHp6wKA/qyQrMrn6ikUe47EindBqjRj0lMKszOLtMBhhXUcsBvroz22a8h+jeyFBK2k90BRu1tMDda4XTC396npClJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500021; c=relaxed/simple;
	bh=6NIEMC0xnA+C5jNliqunaIOn/xrFyw0xsARx0C0pKpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tRwEP43ot8UXhkBbkwTmfblu59uNg11ZM58rQX23LKJYArU7oaHnIodZn0ylR5aq1zBEVIZ29QteQNG+7PTQFgeHWRhwgyNYZeY5NY71OqnkavGomHPQRiVN4p3CrX97mJ/5LVpN4f5yJJ+6ngHahuPG0coWYgQ7mu0PPxVmjyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lsWmM95w; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lsWmM95w"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso3771607a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749500016; x=1750104816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yFNgGlGCkVHg1knXwtU8l8k12+pdKexGY49aaidt7U=;
        b=lsWmM95wuh3avqSZS452d5EgDMSss8VmzsVSDAmXHhhLohYGSAAlMdP8G23nM23ich
         F55STEEc0hN3iOzPFS2FkTkNjyA2Omm3gV0kgtkststABzUpbdWNbRos43amymwQScDN
         iYSSfx+T4MMbLpp0tN8m0wSdksn6e+sQ2AUxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749500016; x=1750104816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yFNgGlGCkVHg1knXwtU8l8k12+pdKexGY49aaidt7U=;
        b=oFbDNnAevGJ80vUDI7GgwFVgWMIyLqA/j9QODGAVC7coXEgtoDgEtC/jj4KMk2R6Jm
         xBlJwnHD5y9aSHnjDCSLwu3fC0mPmD6maG9yGQpcMNHyCZAAzNzGruFvjkmSDdHpx8WW
         MweFCNAWrdc4RTazRLKC/hxJQdhcRclqqth0/ZgUOiZ+wIBXBUPVOIKuhR752zsoBk3r
         LLM6K7p9hGFDpFLwU9Q4NetaFfJSpxwC5hZB9SvJ/RY27A+3hD7ZcB/T175WUB9n5yHP
         KVkMjDpNTRIvNFnwo2b9G0t78zNf+TTr6iXzMBH5r+jUFdVYDAgy/2XAVQBedXuFgCWL
         Q7lA==
X-Forwarded-Encrypted: i=1; AJvYcCV6HDkPvglILRNVAmb70ZiXq06yXzIqXrwLYZIx3l1Zkw2dTpjqtCPBI4XTByquZrqRKF2w04Q34rl1Ges=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvcvfiKVC2YFgY7LgBla+110I9ms1XpXIXJe0PfBwJPMt6hGt0
	vaqn+8mPXngS73Eh+etzyBku4x+sBKRksk0pk2BKz+JEPmIMp3mCUkxVXzrS9OUPUAJmbdc296X
	c1pc=
X-Gm-Gg: ASbGnctqQ4YFrq6kHT5u2F91uzihIuGLdLu2TLq/msieAhWzrVs0Ka1ZHC5Awuc5vcy
	JjDxT5KacIu6Q6WkXqLrlp5N6fQNr2zQfIwmnfi4dh5MZIhTNCFvykB4ufAbNyD6jjwxNl2qhd0
	UaQnvwW5MGdbKzKQMtBKLZRuuQB33oLHOyoHv4Bl0J4gIHpgU84eE1IsfKhfgaVRf2t1Ow8uP8M
	FdFCGHDgATsLc/2vwfQ+jb4GFRUFjn91nHxKd3i3t7JOZwXmxEU4gKjIM7dm2Jo06ZdZ+goK63g
	nqtujsiNtlXkajkPnspfn94ApzaSR3EfmMedNbS/skgs9ZeZYAsiwsZH8B/3AaTnlIowjkjcNAD
	SzQ9qjH5U7kiFbanSuDeDFSbZoznunb5aRXyxk+oM
X-Google-Smtp-Source: AGHT+IFY+gr/SVWjzr2Rqd4eipAVojpSAPr3CeWkVbBS7syKlc7XyqFMLQj4FgvQQoU2/6psC0JS4Q==
X-Received: by 2002:a17:90b:4a45:b0:311:c1ec:7cfd with SMTP id 98e67ed59e1d1-31347678455mr17512302a91.26.1749500016488;
        Mon, 09 Jun 2025 13:13:36 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313286ff748sm2639025a91.0.2025.06.09.13.13.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 13:13:34 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so2563374a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:13:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbkkmP5LEreNh1h7NS5GCeRkllXStG/allweksWj+yYfZaEZPufhqcL282DpYtvRlci8iDIt6suJINBwQ=@vger.kernel.org
X-Received: by 2002:a17:90b:2d4e:b0:311:afd1:745b with SMTP id
 98e67ed59e1d1-313472e8c6dmr21398818a91.11.1749500013266; Mon, 09 Jun 2025
 13:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com> <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
In-Reply-To: <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 13:13:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
X-Gm-Features: AX0GCFtFMIswKIAvt6rQB2Iu1HAY0gUkQ581gK2nBv_6C3TWCO4_jkt3VeYMeO4
Message-ID: <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: serial: kgdboc: Check CON_SUSPENDED instead
 of CON_ENABLED
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 6, 2025 at 7:54=E2=80=AFPM Marcos Paulo de Souza <mpdesouza@sus=
e.com> wrote:
>
> All consoles found on for_each_console are registered, meaning that all o=
f
> them are CON_ENABLED. The code tries to find an active console, so check =
if the
> console is not suspended instead.
>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  drivers/tty/serial/kgdboc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 85f6c5a76e0fff556f86f0d45ebc5aadf5b191e8..af6d2208b8ddb82d62f33292b=
006b2923583a0d2 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -577,7 +577,8 @@ static int __init kgdboc_earlycon_init(char *opt)
>         console_list_lock();
>         for_each_console(con) {
>                 if (con->write && con->read &&
> -                   (con->flags & (CON_BOOT | CON_ENABLED)) &&
> +                   (con->flags & CON_BOOT) &&
> +                   ((con->flags & CON_SUSPENDED) =3D=3D 0) &&

I haven't tried running the code, so I could easily be mistaken, but...

...the above doesn't seem like the correct conversion. The old expression w=
as:

(con->flags & (CON_BOOT | CON_ENABLED))

That would evaluate to non-zero (true) if the console was _either_
"boot" or "enabled".

The new expression is is:

(con->flags & CON_BOOT) && ((con->flags & CON_SUSPENDED) =3D=3D 0)

That's only true if the console is _both_ "boot" and "not suspended".

-Doug
