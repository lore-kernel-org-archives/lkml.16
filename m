Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747C82571D8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470003; cv=none; b=rBkTZiopvn0Us2Mm+YvjIsd+p/KkKx4KOh6MHybgx/kjKzQzUkg+WfO9AG6q+kzWp1Ko00JapahpGDirh+WGtzsiHQntSfHuTPSJuszdseEBkI0xfgyBDJXGYV8YCztcEhoyjVtBl/I4zpL8TfeVXxToqEnuoeC1C4Tut1heEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470003; c=relaxed/simple;
	bh=yTwTjAEsqE8rj045/ciU4b52UtCHhuYIPzLwtPO2e/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/S98RwJrg3kPSkoU3tqh5OdnidGu2duxjlXUH4dSUx6LyfMXhzT1ThfRyH2b18o5tz/btpv8OFPgThY6Ykzpbw0tZ79OqP1PhNxIvDllbq/4cck+IQXFOjXdsjmMo8QfoEIJux+SH9GuojWgSXjUi9igwFj35ajjv/Q35Fzr1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qO0k6M2w; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qO0k6M2w"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a77ea7ed49so608311cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751470000; x=1752074800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCPXcNK+DUyogAPJxVpc3HAuduDHqfqUzIGLlK3xdwQ=;
        b=qO0k6M2wEE0hfRDZm10j2qfUrNqLLa+SjG6m2Cz1GqSMLtbQXkt93fygg4dow70V6K
         ZzXcE4rdHZtrNC6jAd3QbkNjJSjSEEo9AhTKvA6DXDKaI2wdRtKVIXno1OYyV7lSitkF
         djWXeGXfPy6TydK2v3q5rHtm1njjalTzl1EW+9QoOzDwNtDjwf/T2Qtj2E2rIvtv1Sty
         g+vmh9Sp4lRwQEiVNvJGDxngVAt6SbxzkKisNL0WjNL5aXdildWszBBnhlEVimvMJ+gw
         SUgcSNTslYTo0mlmzi8oZfMiCqpSWSK3x1Ii2ajqXIKQmNBjQbxvmlWmmk43PCDWHfqK
         iQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470000; x=1752074800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCPXcNK+DUyogAPJxVpc3HAuduDHqfqUzIGLlK3xdwQ=;
        b=nXnlfI/5McDdGYP0MEs5sy83nmVrHy/CPIKrMtOILVvO2tfv92WmyAM+iuORmdA9js
         EMCXpMtWa5L0af3TZ5/dREl6f3NHqJqlzs/RDoo7COLBtbd4fB+OagdcwvbCEl08K7/k
         0oBqTq8nVW0k3nLzU6A9tpWxh78JF1F1/YEXr54LXm4VaQtWCmeXD3+eL5h03eqjrzpx
         upYDRSno6iEqo9gsLODhdcBNkixEAqez8jjqlP7e1AuEvTDkgEA8Ps5uNVp4kcW9J/YH
         8SJqC+hX4Ud4uI87sp4hj/AweohZNW3413P13uDmtq4KlZahvFvtUvco0Bu09+uxHUh+
         9cJg==
X-Forwarded-Encrypted: i=1; AJvYcCUwdsVvongSHDz69OsmNq+cvxlnvnfUgRouXSqnkWm5FDffjzllLF4Mdpf0RoQ0jwZlt/Zl6Zt7bk6KO/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzj1any2g5Q7nPy6dnxJ3SZDJiM+xZ+8X8uQJt+OWjXuXeuS7
	mAGkC3MPmMC4l1jHHnQJITPWXQaUwTmBV/y2fTzdiwMwmU9VH+gOxR8RXK/+jFZeIwOkIswBbwQ
	20YVaqubDafjFDlO/VSO7h6TI/+lLaGqvEIk3JZol
X-Gm-Gg: ASbGnculgI2cmN8XJT4Bbwspq7+A58ZjYVlceXOW6DWldmkrd2mnvNHwqrW0n5d1EVY
	gtdvsI6m9iGOoy9Dz8deNy+Y4xX2w9LVzVLC/AypH7ISCILa2Qcll+M94jiDtDw6ErHwQU6lUOn
	wo9NiefGX8dDZL00nabXzKRflWcx1PG2Kt4ptxxF+1FQ==
X-Google-Smtp-Source: AGHT+IH6CmHt8lPy9XENkmI+GA/Cv+r7CIhuq+Az9ScfxiFnyCFfXb99vMuNSbCmH6thvLn8wp9cASXm/JqpECT2UKc=
X-Received: by 2002:a05:622a:4a0b:b0:4a8:191f:1893 with SMTP id
 d75a77b69052e-4a9781a6c80mr46335991cf.26.1751469999922; Wed, 02 Jul 2025
 08:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702141515.9414-1-oscmaes92@gmail.com>
In-Reply-To: <20250702141515.9414-1-oscmaes92@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Jul 2025 08:26:28 -0700
X-Gm-Features: Ac12FXzRVX_eX2sqMm4YSTrDpzTWZI16IKpRrmn5eNbVSJYT11OpAEK61oHliW8
Message-ID: <CANn89iK0Hu6CZQ=76+z6p-TPY4bTmEQh9SAgLu-==zNB9RrWMQ@mail.gmail.com>
Subject: Re: [PATCH net] net: ipv4: fix incorrect MTU in broadcast routes
To: Oscar Maes <oscmaes92@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, dsahern@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:15=E2=80=AFAM Oscar Maes <oscmaes92@gmail.com> wro=
te:
>
> Currently, __mkroute_output overrules the MTU value configured for
> broadcast routes.
>
> This buggy behaviour can be reproduced with:
>
> ip link set dev eth1 mtu 9000
> ip route del broadcast 192.168.0.255 dev eth1 proto kernel scope link src=
 192.168.0.2
> ip route add broadcast 192.168.0.255 dev eth1 proto kernel scope link src=
 192.168.0.2 mtu 1500
>
> The maximum packet size should be 1500, but it is actually 8000:
>
> ping -b 192.168.0.255 -s 8000

Looks sane to me, but could you add a test in tools/testing/selftests/net ?



>
> Fix __mkroute_output to allow MTU values to be configured for
> for broadcast routes (to support a mixed-MTU local-area-network).
>
> Signed-off-by: Oscar Maes <oscmaes92@gmail.com>
> ---
>  net/ipv4/route.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index fccb05fb3..a2a3b6482 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2585,7 +2585,6 @@ static struct rtable *__mkroute_output(const struct=
 fib_result *res,
>         do_cache =3D true;
>         if (type =3D=3D RTN_BROADCAST) {
>                 flags |=3D RTCF_BROADCAST | RTCF_LOCAL;
> -               fi =3D NULL;
>         } else if (type =3D=3D RTN_MULTICAST) {
>                 flags |=3D RTCF_MULTICAST | RTCF_LOCAL;
>                 if (!ip_check_mc_rcu(in_dev, fl4->daddr, fl4->saddr,
> --
> 2.39.5
>
