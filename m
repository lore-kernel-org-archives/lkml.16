Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C42A1CA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312771; cv=none; b=kVC41NrpRxfkKQ2c78UgugV/jOqCqZ8ddxU6KlmAfMSsvf5WKCbzzfdchEwLIns7gok0XoS9OkbR2Om14fLDet0ATugMleUFuuQZfNG2Gsp8soYtrHKNkBQrqax2H7hlyudxYNfK19/hykWwRFw+RT82SnMYliy4KB1UGX98Nlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312771; c=relaxed/simple;
	bh=Ut1C+FENnkT+4cfgRtU9RoHaXisarLEGCYE6Lskdgb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zl1cyu90/9Q82Y2pVxSLeaRmZjozAz+u+Qyp58NiaaIIaAE/RWi8CbADOVQdqqPFJQfsyC1IXSSFUf505AHrobmgttT7clPi5Y8Ocf9bwr2f3HrBdHBt9MD9EphJ/QlLU3YEzebJAIImp1MLoeCjcVmPeD841BTvZs4VleCn9Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G1HAjbB0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G1HAjbB0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-313b6625cf1so3553729a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751312769; x=1751917569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KktxL0p+NacmVGtV0Wk3Tz5jFnTwh3r3Af+/Ktpmyn4=;
        b=G1HAjbB0MjwWem69Bbh8RdV4pMt2HgadgwM9uR9K2kNCur9NmsCVOtinv/TgvPaO09
         eJFbmf6aUvylvrtp/56Mjpi+hYTRB89UnklB/57tOHSD04juv+oOxN3C8LkkeotZ8QGT
         +lUn4C67BoF5yLSPbTb74v8RB/tbbaJ4lhS94p3b6SKPQGNTsn8spMsg8y3dGMuR+WWO
         rl01F3FGJo+VqusPbKM+OBoyPXCi/y3AsDrtld9X5z9xh5RuzO6OgBZBcD51Y3X+X8UI
         JYoFFVauCfkAqsUQoXAfUQTnAP4ZSq7j0DIMo9QjQ3Ii3sxnL8WWo9sGO/T80wdSC7Ag
         iNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312769; x=1751917569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KktxL0p+NacmVGtV0Wk3Tz5jFnTwh3r3Af+/Ktpmyn4=;
        b=rm7nFS2cnynor1YH6vAz5noIUMRgazj2Jc3BipWvMcpLpIg2pL5LxKIhU5pAy5zTPI
         sRIsp2RIlnXPK249iCZS4bWloSfSUiWviQaiVee9fb6FCpBrUuewG8UlhIyl6HLcEXzz
         RRA57eaxLD9AkoGSjdNDPHU9/r0lz0ccfCYL9eEUwalniCicLztFmqQ1XiCkQB/Uiqpp
         WmVEAwjtB4VxiNoQfxAJWkZ9mBgbWiGgue8IzUmqzgk/1efacpIcrdhrrPs/I1GwmKFP
         OE43CH1gzr/d1Dc1fvFUQlWWrHYltvgnNh0QCloio0P1ank+F1WodzcxRZepZBlfDo2o
         PflA==
X-Gm-Message-State: AOJu0YxZqbTngyIoppOZH1bxnt+z97XT6eZ6jT5DKJxqAul3ZpvHbtgw
	2Cwdf8Ppzuvp5/f9tZic6eVWxfCjW39ZSO98zO/9EQo3X0u17usDV2daNefqIvxP2B2G/yR2lQ1
	0lHpdeGz8xWwZTMn7Ja3BoHNiIQHQu1YqKcbqSVolrxst+n6D/zR0XjqeuPhTgw==
X-Gm-Gg: ASbGnctHCYnNlGpviT1Qt8F7UTCitjZrAs1eGogyF3/YVAoYT0244KwMMj760H6SI94
	WzL2rrbNUCVqs5nBZwn8eKSlmZFApe8Q+Q5T8jRuhMjhSc1t9bXk9tuzXVXT6p6EYgzRu0prgqV
	YAgpwP+eNpzsx3WvVzS8jPZC00qIaqgGsvWgYcuX5HuJ3WnWzEQ2J0W/GZRVr2UHdexgeroojxx
	Q==
X-Google-Smtp-Source: AGHT+IHnHZP+R4S25ckxNkU9XskVXK7VnWiPRQ6+iR7gEoZI9hDMO51yH4DlPmWK+oWpOitcW/MHzgpT1tQkLTAIu54=
X-Received: by 2002:a17:90b:3b4b:b0:311:be43:f09a with SMTP id
 98e67ed59e1d1-31939b12132mr979498a91.9.1751312769138; Mon, 30 Jun 2025
 12:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com> <20250629214449.14462-4-aleksandr.mikhalitsyn@canonical.com>
In-Reply-To: <20250629214449.14462-4-aleksandr.mikhalitsyn@canonical.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 30 Jun 2025 12:45:57 -0700
X-Gm-Features: Ac12FXyD-RKudTR-v8h4D1atJ0tJpkTrf2lsb1SWQCdla-qfjRD1BQXVylhPgow
Message-ID: <CAAVpQUAG+=PP67sCFSYJ6zubsEODUt+1Tf-2KtiPUcJTYAF_EQ@mail.gmail.com>
Subject: Re: [RESEND PATCH net-next 3/6] af_unix: introduce and use
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

[dropped my previous email address]

On Sun, Jun 29, 2025 at 2:45=E2=80=AFPM Alexander Mikhalitsyn
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
>  include/net/scm.h | 10 ++++++++++
>  net/core/scm.c    | 11 ++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/include/net/scm.h b/include/net/scm.h
> index 84c4707e78a5..856eb3a380f6 100644
> --- a/include/net/scm.h
> +++ b/include/net/scm.h
> @@ -88,6 +88,16 @@ static __inline__ void scm_destroy(struct scm_cookie *=
scm)
>                 __scm_destroy(scm);
>  }
>
> +static __inline__ int __scm_replace_pid(struct scm_cookie *scm, struct p=
id *pid)

It seems this function is only called from __scm_send() so this should
be moved to .c (and inlined ?).

> +{
> +       /* drop all previous references */
> +       scm_destroy_cred(scm);
> +
> +       scm->pid =3D get_pid(pid);

This looks redundant.  Maybe move the put_pid() under if (error)
in __scm_send().

> +       scm->creds.pid =3D pid_vnr(pid);
> +       return 0;
> +}
> +
>  static __inline__ int scm_send(struct socket *sock, struct msghdr *msg,
>                                struct scm_cookie *scm, bool forcecreds)
>  {
> diff --git a/net/core/scm.c b/net/core/scm.c
> index 0225bd94170f..0e71d5a249a1 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -189,15 +189,20 @@ int __scm_send(struct socket *sock, struct msghdr *=
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
> +                               err =3D __scm_replace_pid(p, pid);
> +                               /* Release what we get from find_get_pid(=
) as
> +                                * __scm_replace_pid() takes all necessar=
y refcounts.
> +                                */
> +                               put_pid(pid);
> +                               if (err)
> +                                       goto error;
>                         }
>
>                         err =3D -EINVAL;
> --
> 2.43.0
>
