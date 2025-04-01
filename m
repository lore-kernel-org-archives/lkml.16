Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571F204098
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743538935; cv=none; b=VCe9H2NgG8K8wkddXVa/EOhjy6sVpZSoEBRlD7pgMqXbhFOrWMu0c6aVVUJn/uORCh9Zd4oQQmsnArdqho50TeGwHMlHQKPtLk8nx3+Axu5gYkXPXSgoPF5QN7L2ScvkRXuGeHiRx82tu/MrAWw90t61cmZVYSsdzsA4EVD1LYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743538935; c=relaxed/simple;
	bh=Q6chQfXmbJzCD+hzSlkfIbjNyFBbUmGlmC0j1qzMmnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sx0WtYyxuOQDtWOkJlSAMoHa+iXrO5Rd3MjiScz2Ec1r3SKck6ZZ9yuOrNTR5lm/GRTdgw0jpMrGCrsObK5FpeSCrT2NftD6chhp/vqoIomdF45qw9zUpy2F+YGKu8m9/EZrms9M9t9rmNfB1bZAyVaorAuU7MISgR/vjLb5UJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=V2B7c1cP; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="V2B7c1cP"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6fee63b9139so1978637b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1743538932; x=1744143732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/MKqNfCcydD2RBO/7Yc/0iWQR+4ZTBaz1BmZvprmkE=;
        b=V2B7c1cPN3THdVtKLuoQ+UopWphJJgeFT0rd7DtYzCA0nKzKA/twsFWy7mrO6lHHhD
         2NO0NUsolq1TPzULwohVYc5lKBBqlJupcQJtlX5X8Np6M/6Vz6hYS0EniEPmeJpkxgo2
         3HIna/SZaMoiWfGl/f/WaHk8X+GokwCjg05U4xrIT83eflWj7Q6IoAx0GmnirOADaH10
         Pfc9/jWLk23LB5Azw4BpVC9B64ZiQoRy6o/YWbSIpfjj70rZBewho7ho0x3Xo/csgOGu
         lS0AKO/iq+ksJ5z7mkgeC11iL4dgkm3uDnObAfDt5OBOt+a/MZce4d0uenljySvl+9dT
         9u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743538932; x=1744143732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/MKqNfCcydD2RBO/7Yc/0iWQR+4ZTBaz1BmZvprmkE=;
        b=FvGfS4bkHhcRQPxB6vphSLmpFk1rrwbjQaeLcn86zrOajHuIom/+lHQINEhmTprwln
         UYkITweiKan3Smrqni7FZY8WAHVQjAZqB4NwZZbTDiikpW6khrWOSrP9xYyoXQgdiBnO
         0bwfiapCgQubryVkJ7ha3Bml+KYmsUVBkWq5JvboUFHESeRstJH/jAdwvygnKLTBVs6C
         n+Exu4P7P7m7N1XXkqzwNcXe3j2TMpI/u69AyIQW5aOtpP3o9wFY0T79mrWz5Xzhg2bO
         wfzE/lV7JWQkziuQYGGSOgsr6JYYrjLEgLmghPuG4ZSHGqzacdj0R5H5o4jc9Gth5J1p
         YvFg==
X-Forwarded-Encrypted: i=1; AJvYcCUr3hwm468vYqc42l2RSZdJSNoN10SGVFpt+uxdYDHrxy0zu+Ph0VtlWRMQKUDP1eYKudDfDxF9kW+6Gdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNMuhADLdROLGGwIjyZOMay2fAbmmNqhM7fbhntmEUYcDKoZR0
	5/2szCVWkIDDo8gDsRO2Q0HT2IDULtNlDH2Pi6RpLzFyrjkTLwtsakKdI6cn8jDuJ15ZmRbyWVo
	BBc0e3ocTqNdGXfb+rk/RAodVkyF3PLmB6yPJdNzMjglRoiQ40A==
X-Gm-Gg: ASbGnctwBZNyfcxbt4IrRen9z3uDPsX5ZOTp8x0kGEwMG3badMjIqPYnTGB5P0ATAMn
	ccK52gbkvm3uAk3Hx77cuHJUed9a6ikEQiPqvz2oayBntHNYn55/hAJp6ViGt17kU/v/cJ0rE9F
	Y5jLMWhyP2RLrvouYLIRCVdT3AIohqzR8sb4OI
X-Google-Smtp-Source: AGHT+IF/YxkKQXtKrUdR2eox+es06ZZ7FTn1YlfecKrS6aeAPOR545e2Mkr/vHWzRxo1KpmZD7IRB7vBUghxdKnrd90=
X-Received: by 2002:a05:690c:9687:b0:6fd:33a1:f4b with SMTP id
 00721157ae682-703b65b992emr24172137b3.4.1743538932185; Tue, 01 Apr 2025
 13:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a4f2c24-62a8-4627-88c0-776c0e005163@redhat.com> <20250401124018.4763-1-mowenroot@163.com>
In-Reply-To: <20250401124018.4763-1-mowenroot@163.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Apr 2025 16:22:01 -0400
X-Gm-Features: AQ5f1Jqk7CPD2bT7768u-9QyPyzOPAKImqefS2cN846WhBTE19EK3pds0nqtaZQ
Message-ID: <CAHC9VhRomcexjKHEfSVhK2p-nfk26GWpbO5-+WLODKvnaWm6_A@mail.gmail.com>
Subject: Re: [PATCH v3] netlabel: Fix NULL pointer exception caused by CALIPSO
 on IPv4 sockets
To: Debin Zhu <mowenroot@163.com>
Cc: pabeni@redhat.com, 1985755126@qq.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 8:40=E2=80=AFAM Debin Zhu <mowenroot@163.com> wrote:
>
> When calling netlbl_conn_setattr(), addr->sa_family is used
> to determine the function behavior. If sk is an IPv4 socket,
> but the connect function is called with an IPv6 address,
> the function calipso_sock_setattr() is triggered.
> Inside this function, the following code is executed:
>
> sk_fullsock(__sk) ? inet_sk(__sk)->pinet6 : NULL;
>
> Since sk is an IPv4 socket, pinet6 is NULL, leading to a
> null pointer dereference.
>
> This patch fixes the issue by checking if inet6_sk(sk)
> returns a NULL pointer before accessing pinet6.
>
> Fixes: ceba1832b1b2("calipso: Set the calipso socket label to match the s=
ecattr.")
> Signed-off-by: Debin Zhu <mowenroot@163.com>
> Signed-off-by: Bitao Ouyang <1985755126@qq.com>
> Acked-by: Paul Moore <paul@paul-moore.com>

As a FYI in case people aren't seeing the previous messages in this
thread, I did ACK an earlier version of this patch, and while there
have been some changes to the code, they are largely superficial and
my ACK still applies.

The commit description looks okay to me.  Paolo, do you plan to take
this via the netdev tree or would you like me to take this?
Regardless, the patch should also be marked for stable.

> ---
>  net/ipv6/calipso.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
> index dbcea9fee..a8a8736df 100644
> --- a/net/ipv6/calipso.c
> +++ b/net/ipv6/calipso.c
> @@ -1072,8 +1072,13 @@ static int calipso_sock_getattr(struct sock *sk,
>         struct ipv6_opt_hdr *hop;
>         int opt_len, len, ret_val =3D -ENOMSG, offset;
>         unsigned char *opt;
> -       struct ipv6_txoptions *txopts =3D txopt_get(inet6_sk(sk));
> +       struct ipv6_pinfo *pinfo =3D inet6_sk(sk);
> +       struct ipv6_txoptions *txopts;
>
> +       if (!pinfo)
> +               return -EAFNOSUPPORT;
> +
> +       txopts =3D txopt_get(pinfo);
>         if (!txopts || !txopts->hopopt)
>                 goto done;
>
> @@ -1125,8 +1130,13 @@ static int calipso_sock_setattr(struct sock *sk,
>  {
>         int ret_val;
>         struct ipv6_opt_hdr *old, *new;
> -       struct ipv6_txoptions *txopts =3D txopt_get(inet6_sk(sk));
> -
> +       struct ipv6_pinfo *pinfo =3D inet6_sk(sk);
> +       struct ipv6_txoptions *txopts;
> +
> +       if (!pinfo)
> +               return -EAFNOSUPPORT;
> +
> +       txopts =3D txopt_get(pinfo);
>         old =3D NULL;
>         if (txopts)
>                 old =3D txopts->hopopt;
> @@ -1153,8 +1163,13 @@ static int calipso_sock_setattr(struct sock *sk,
>  static void calipso_sock_delattr(struct sock *sk)
>  {
>         struct ipv6_opt_hdr *new_hop;
> -       struct ipv6_txoptions *txopts =3D txopt_get(inet6_sk(sk));
> +       struct ipv6_pinfo *pinfo =3D inet6_sk(sk);
> +       struct ipv6_txoptions *txopts;
>
> +       if (!pinfo)
> +               return;
> +
> +       txopts =3D txopt_get(pinfo);
>         if (!txopts || !txopts->hopopt)
>                 goto done;
>
> --
> 2.34.1

--=20
paul-moore.com
