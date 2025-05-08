Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37484227E82
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708836; cv=none; b=U0YGvFjXR+0EUEbMUMng6B1RfdWdwMl9RTfd3mOY/yPctiI4xqch1nybos6vXJ96uvKgj6DxxG5wzJxgKAdJ4VVIsdfiMtoa2hYrEgJcFyAf+eH8pRPhKKKrs2HGucrSMOTvcYtu923hXj1HQaIbeobn91O3nQN8D9TUzpfhkZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708836; c=relaxed/simple;
	bh=7k4JFjTWoqmEmGwxqM8eUh1bCZ3BxAGleaj6TQXurjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1euVHVDghZuwPtsdxLzMqKHz/JgxtgZGZpftCZU/ia2+IEvAXDWpSlyQOnxpXru5vDHFNU4IAAzXZ2iN1bWgijsoeKrAzCSGm2zAJNFZ4nzljwzLYxLwSrWfdk2sX4gi9z/ZrC2mRxIDqoTI8fldLFnx9T3rSFXNuy72VeqMw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4WXuPOH; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4WXuPOH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so330551cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746708834; x=1747313634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KznC4NyDVNeygPHmYzyMAnp1KdQB+d3H7ZdlNEZpLJI=;
        b=E4WXuPOHaK0nizEPqbUXo9k8sDVhxBNb/jwQl1UPs1Xc8RGWQ3YfxbKknf94p+B3qf
         A+y3qa/UfXrLjCpDQKGggl6L199+6yFHFZINVPGj4uU2jPyxCpddyG5gFYwEAkNUb6Sf
         sHM8hiS+pKvQ+E9p1e5y5vC5IkRgBjmPUEByQrQGkem/ltnHmcLYCmSJmMIvTbywd2OC
         VDyhH2R5TkLeKwGZmzLqWoMBVTbO8Vs1Izxc+vVn/NGmZKgQ2D4o1YbzRLOP16Guzn7Z
         d7qWYSmxvzxSZOWb2qFRYqlrhzbSuvc/5cefgAJLc122pXP7qsr/T3mLG8StsuaIjPLy
         kQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708834; x=1747313634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KznC4NyDVNeygPHmYzyMAnp1KdQB+d3H7ZdlNEZpLJI=;
        b=TILnW3LcIY+FYzE+9hllr+MH/p+l/6gQYUq0dyoYADFsrkQrXJTe44Q2OFW22T4LVN
         NqeiX5e6HtRxETq+0UWqlgzz0j34vTRF6uKG/liIH9PPkaZz158pF6BgzU1MAXMG+5AV
         SyhFuZcU3fgKrW3sDZOBUrI68kwE2C3us4XbQCc+muGlMjlcRkui1KI932EeNAjyv0Ho
         xrsBDfJ36qOWMyWU9SB/ZpFyi2sUTwMNyK9AqK05ANAsQBbZjQ4zj5D8JPWT6b4M9LWS
         bPOJfnRmat/OUlyQP5K5RXpzW8gqsNRopa9za3g7f1uhcbkwQ0HEiieomQz366XIoGow
         9VuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9GVZY6UeUFI28RnWkHjPCVjVaJ4f954mtvXApQ8p2ddqdpRoz30B9uMwcqujEKIwQa07AygCAf7yMugo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0jF/wLGkqQawn9Zjoq5bEABqdnjmZCJ5zVn7Ehxhof6QL8IA
	jo5bNQkGBjEsL1QdKz8XviP55AED0VAaNAyqchDyZ3vRKhzVYrGC04+J/KEuzBA/ba53GCwT+lj
	PRHw1QlHTdfdpqkqUCukzM+de/nHvMtia27zw
X-Gm-Gg: ASbGnctXJsH3+4g4/nR4ikRgsJEw/eDDO0qs6BB+YtbYKxW74p1VrzLmW7U7LwZ5ec9
	yRAmNovIl8ob1M6K54NYfw2BmJf/mSyC1VYcghcSRow+OwLSWy2dnm7VeSPz7Ei8/K9XGrhWHiX
	27ykv2/rURR5eKmZjoZJEEFR6KxxZgDutAkbkjvtqbXoNwd7q9rq7/R/eApxV3A+X2Xg==
X-Google-Smtp-Source: AGHT+IEUi9zM6NbL+TX47b3DpChxpjMF5gu34vU9JqPlf+hKu3TOQ3H5KOck1TeRNOENBBnP85jb0QbDWibw9ikJyIE=
X-Received: by 2002:a05:622a:2c7:b0:466:8c23:823a with SMTP id
 d75a77b69052e-4944a9eb0edmr3771571cf.17.1746708833813; Thu, 08 May 2025
 05:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADvZ6EoGrp9SCvkVKEV0i=NW-7XZmxbmZkmxd8TPFboPTAUF_g@mail.gmail.com>
 <01100196af6a2181-4f17e5a7-799c-46cd-99f3-9393545834b1-000000@eu-north-1.amazonses.com>
In-Reply-To: <01100196af6a2181-4f17e5a7-799c-46cd-99f3-9393545834b1-000000@eu-north-1.amazonses.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 May 2025 08:53:37 -0400
X-Gm-Features: ATxdqUFcv-woCivIBlluwJP1Scv8iVAvH_POV_RCoY5PYocAzSSLGFISNZcasOM
Message-ID: <CADVnQykrenhejQCcsNE6JBsk3bE5_rNTeQe3izrZd9qp8zmkYg@mail.gmail.com>
Subject: Re: [PATCH] net: ipv4: Fix destination address determination in flowi4_init_output
To: Ozgur Kara <ozgur@goosey.org>
Cc: Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 6:21=E2=80=AFAM Ozgur Kara <ozgur@goosey.org> wrote:
>
> From: Ozgur Karatas <ozgur@goosey.org>
>
> flowi4_init_output() function returns an argument and if opt->srr is
> true and opt->faddr is assigned to be checked before opt->faddr is
> used but if opt->srr seems to be true and opt->faddr is not set
> properly yet.
>
> opt itself will be an incompletely initialized struct and this access
> may cause a crash.
> * added daddr
> * like readability by passing a single daddr argument to
> flowi4_init_output() call.
>
> Signed-off-by: Ozgur Karatas <ozgur@goosey.org>

For bug fixes, please include a Fixes: footer; there are more details here:
   https://www.kernel.org/doc/html/v6.12/process/submitting-patches.html

> ---
>  net/ipv4/syncookies.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> index 5459a78b9809..2ff92d512825 100644
> --- a/net/ipv4/syncookies.c
> +++ b/net/ipv4/syncookies.c
> @@ -408,6 +408,7 @@ struct sock *cookie_v4_check(struct sock *sk,
> struct sk_buff *skb)
>         struct flowi4 fl4;
>         struct rtable *rt;
>         __u8 rcv_wscale;
> +       __be32 daddr;
>         int full_space;
>         SKB_DR(reason);
>
> @@ -442,6 +443,17 @@ struct sock *cookie_v4_check(struct sock *sk,
> struct sk_buff *skb)
>                 goto out_free;
>         }
>
> +        /* Safely determine destination address considered SRR option.
> +         * The flowi4 destination address is derived from opt->faddr
> if opt->srr is set.
> +         * However IP options are not always present in the skb and
> accessing opt->faddr
> +         * without validating opt->optlen and opt->srr can lead to
> undefined behavior.
> +         */
> +        if (opt && opt->optlen && opt->srr) {
> +                daddr =3D opt->faddr;
> +        } else {
> +                daddr =3D ireq->ir_rmt_addr;
> +        }

Can you please explain how opt could be NULL, given how it is
initialized, like this:
        struct ip_options *opt =3D &TCP_SKB_CB(skb)->header.h4.opt;
?

And can you please explain how opt->srr could be set if opt->optlen is
0? I'm not seeing how it's possible, given how the
__ip_options_compile() code is structured. But perhaps I am missing
something.

thanks,
neal
