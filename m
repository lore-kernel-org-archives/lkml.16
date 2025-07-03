Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691441D9694
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508766; cv=none; b=rxncNg4KGDqTC0q9fUBfzjY9aOxg1Gb0gq3aoGy6DRjYi17Ox5jmu/8gTJ0mipaahppEypSQMBdFPaqGvgTz+tiYyH0L4EBve6+rmzKPiOr3I5cbzlrOBXLG8Dq4ZcdymATaQOT0TbX56oH6xfv1VHtS767TXDyUwpkJ/rhPBFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508766; c=relaxed/simple;
	bh=lBg+2rfNaGnjS0hbzaYfp1CeUFtw5//muHuGCu2lNkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EluTkRvJXEAZRPoSfYfaDKmncmNgZgXMtsGnBhn+a3tkLXwFWfycxY6/PWd/wT7y8LhJc+QtXnMrDy3CUmyQJmiaYaz57ki+WGKfI5v2tAsZlgfONYTBxDUGnAjRdeplJK6GBgOf4nMmgOTI0K8P50XUfQRq12vvPztEkcqIqTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPv/EHZ6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPv/EHZ6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so6161951a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751508764; x=1752113564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NO73RfR6Y3gr9CLEXQ/SnY7i03Uc20liAAl3u3Q+Dk=;
        b=DPv/EHZ656vNnmW1Bkn/Ws5mrldtenzkVYMOUvdDCDORnuZ/+tip6rJGDvLfgQ0A72
         8YRh51X+q9dPjOzWf1QDH2CmPEEnEtNOTntdYfhAacoCjYuN9s3/62iXKq32Jp6gPRiB
         hN781T7XX+7YOKsVj8pSPBQaUv4Qalsmh+mRbixMiYq9hubT0zKExpTlTb8pGOadVhDJ
         GFJfvu6uM+/CJUNYHkTt1k10IElrLsQFQi8TwKG2+mwupemHr4sD+rTW2Uz3eqxxbdJ+
         JItysBqbZ1Z1W6fEYwnErQmsnLYF1z/KWSZdnmBh4+rystKqd7fOykGL2ouV1XEDQ1WJ
         PsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508764; x=1752113564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NO73RfR6Y3gr9CLEXQ/SnY7i03Uc20liAAl3u3Q+Dk=;
        b=CfeB6vssxnvnj+EsRVgOAzxcvijde0D/n6ukqZESGHlKVmd5cfzrRva7Un/oanSjDf
         HzcCDGikI/OkU2jYzPMc5+eJSVqW77Wv07Y/GsuolMLQWZhdLF7imNkDFWTQpMUJ1NsE
         zc60vniapEXrcGFopHBT9TWbZBooG4gBLPY8aoX1dAeh3ocNsTYM9eryIBc2i1U+HFUC
         0EDtkEp+2+/dqlE8zEQMApipS0ikh1CAnyk1VzNlqaW+scVTCqKsY61Uimw/14KiVm2z
         L9DkJXKidSPsqAgMrWt/NguusynbhcL8yFXU2e2iHWdupNPRGZp8dJ8UkQdgAR2ZKSMG
         hp8w==
X-Gm-Message-State: AOJu0YywZd792oME3iICLwbEkwr7M9yc0LoxZHLPv0egxOmJIHZ7xMYp
	vCq5ClumcDDCEvbaTfme9+5LsasT2AYXm6Tc1S7PPr1QE8tifzNzHwunfyizZR0W2aAay0/InrE
	6PvaP/F2uRJ3qijIJXL2LxhzlHSTJsY5Zbvav3NCI
X-Gm-Gg: ASbGncs640m1bzAOvsE0n2t2tBI/PNYPDhu3n0frQCi0ZJL6s6lm9m/lImP45LLX4yL
	WLQv+OiY5MsfELdbnY8MQwOyLftWXCZDI+zMVs9+IG6anMmeKSXfcVlb5xTwoYEI4sy+0xHtREz
	sm/7u5fTNtiJ7Xo9Il9meXBFmMY497eDfYnGbPnjb45dhj2DF64GQvNSigtzWoFZqagtR3lzUOp
	MPN8RnCmElCZUg=
X-Google-Smtp-Source: AGHT+IEfk5Evrrn1hWvkFobuV0tS0uqK20Nkb4L5h50gd31HYQ14M5AinIcG/AgD9Ggo+cNn9dNRqqkwceDxacax1UY=
X-Received: by 2002:a17:90b:53ce:b0:311:c5d9:2c7c with SMTP id
 98e67ed59e1d1-31a9df94759mr1241067a91.23.1751508763578; Wed, 02 Jul 2025
 19:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com> <20250701083922.97928-7-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250701083922.97928-7-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 2 Jul 2025 19:12:31 -0700
X-Gm-Features: Ac12FXxZ3hrF9DXpmcOwKNJ_VHMmv3IGoCk3Oxc0vEHSANkYmmlrMbUy8AXWM1A
Message-ID: <CAAVpQUAXwWE6ssHYwaA4Wi4U0j_VOQ0vPD6oTAEhEV3q92fPnQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/6] af_unix: introduce and use
 __scm_replace_pid() helper
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Lennart Poettering <mzxreary@0pointer.de>, 
	Luca Boccassi <bluca@debian.org>, David Rheinsberg <david@readahead.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:41=E2=80=AFAM Alexander Mikhalitsyn
<aleksandr.mikhalitsyn@canonical.com> wrote:
>
> Existing logic in __scm_send() related to filling an struct scm_cookie
> with a proper struct pid reference is already pretty tricky. Let's
> simplify it a bit by introducing a new helper. This helper will be
> extended in one of the next patches.
>
> Cc: linux-kernel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Willem de Bruijn <willemb@google.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Lennart Poettering <mzxreary@0pointer.de>
> Cc: Luca Boccassi <bluca@debian.org>
> Cc: David Rheinsberg <david@readahead.eu>
> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com=
>
> ---
> v2:
>         - don't do get_pid() in __scm_replace_pid() [ as Kuniyuki suggest=
ed ]
>         - move __scm_replace_pid() from scm.h to scm.c [ as Kuniyuki sugg=
ested ]
> ---
>  net/core/scm.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/scm.c b/net/core/scm.c
> index 0225bd94170f..68441c024dd8 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -145,6 +145,16 @@ void __scm_destroy(struct scm_cookie *scm)
>  }
>  EXPORT_SYMBOL(__scm_destroy);
>
> +static inline int __scm_replace_pid(struct scm_cookie *scm, struct pid *=
pid)

As you will need v3, I'd remove "__" because there's no-prefix-version.


> +{
> +       /* drop all previous references */
> +       scm_destroy_cred(scm);
> +
> +       scm->pid =3D pid;
> +       scm->creds.pid =3D pid_vnr(pid);
> +       return 0;
> +}
> +
>  int __scm_send(struct socket *sock, struct msghdr *msg, struct scm_cooki=
e *p)
>  {
>         const struct proto_ops *ops =3D READ_ONCE(sock->ops);
> @@ -189,15 +199,21 @@ int __scm_send(struct socket *sock, struct msghdr *=
msg, struct scm_cookie *p)
>                         if (err)
>                                 goto error;
>
> -                       p->creds.pid =3D creds.pid;
>                         if (!p->pid || pid_vnr(p->pid) !=3D creds.pid) {
>                                 struct pid *pid;
>                                 err =3D -ESRCH;
>                                 pid =3D find_get_pid(creds.pid);
>                                 if (!pid)
>                                         goto error;
> -                               put_pid(p->pid);
> -                               p->pid =3D pid;
> +
> +                               /* pass a struct pid reference from
> +                                * find_get_pid() to __scm_replace_pid().
> +                                */
> +                               err =3D __scm_replace_pid(p, pid);
> +                               if (err) {
> +                                       put_pid(pid);
> +                                       goto error;
> +                               }
>                         }
>
>                         err =3D -EINVAL;
> --
> 2.43.0
>
