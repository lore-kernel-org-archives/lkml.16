Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917C2DAFA2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870488; cv=none; b=gt8+BcVLaBfEQpH5AXCrGY+HA8WJdwPSHxKzQ0PPiyEIFsKhglIaSN2oGALBot0x6r+df/j+qRi1YHuwybnq/yrNWt6PsCHSUydkeoqeOx1zOsEvCAzp6U2xjgcSONbM4mLldXNVloJID+98pix0f1HC4A0lnIb15cM3zbC4AQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870488; c=relaxed/simple;
	bh=lBDbDMqM6EzL06NdbJFJ7I/PhA09JDo2Zq/svCi5Xr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sh9RS6de+eNZEvs3QsfdWlWKkFjBEN1+gS6J+FEbg+sjtY7aK//IS6neCSx3YykX6Rt5HnYlPgtVXd2fZzevbkZ7+vZEbGZBynK/J/7vRYXQXNMphcXWPZCKQNaQ7nR9MWuENO5OsPrlgQN0x8sSPwGwSrCvIapDFCAaTDtxOek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhsQJ2l0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhsQJ2l0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-236377f00easo1649825ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750870486; x=1751475286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lbj/LroNXpAiNEpwMzoE137rEOQVWGByOHdjSXhauBc=;
        b=YhsQJ2l0jRZo3jh0qVxdxCB1W4AUkoRKrMaWKarhpXuLuMtVWH9PmrUWc2LBxXjY9L
         c7qDxvjcKTMfw3zYZM35GBp0+E0p06hQtGsmnWwwDEl03y0Nzs5L6dLCUemzsZQOe36/
         AogGgjY7X5Aj7Xs+RkRL/J+vlcINhGTU+JsuPtseNvW+ojHNLnbfSoLjy8AlTaXYzOXs
         FKA6g40yXzNZl05wnouJFPcjuiIpRcAGTRefGe8i5RQDa7iZhh1PsKjD1p2wikGKSLSx
         MqLg76pyvnKg26uiOWpfK1yFIZBt3EFc3vZF2/aLIDZceWzu99QbSvnS7PzouUZU7vry
         WnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750870486; x=1751475286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lbj/LroNXpAiNEpwMzoE137rEOQVWGByOHdjSXhauBc=;
        b=quvfVaZcZUgMLlVyzppCXnq0y5svfbrQXphGjt7C2LzdsVCReC51cchX0GSLiMD7bS
         4eRhZzWJt0zs+3BffTTE9CXQcgSL2kxdyeG62XAqaSIo3iIwhg6UFBTvbkHxhWiUdg+U
         anBPa7xzKbE1/Qr3vY0blUhOExOGXyV1TT9ZKF32xv4MFnRKhbI3KjJjVvc45SYQJVtR
         HBfKo/ZYXJDp00dzXyE9tqmkPcZOT8ZpC9KZORklzoBKa8V+AiGivacgY377qpbEhTnw
         tryzOLc7eQ5xyJOueKY4o8ZgdmxRPcpucpQa/s1y0fabLSmSCvTPph9jzGm0ZFJpsZlE
         zcsg==
X-Forwarded-Encrypted: i=1; AJvYcCWK5ydEsQmYwb+WdAWm6XvgtoK2gTJ74JoMpjIjkQfh5JGkTgwvUwjHUlO6UVodNN6Ez/xMCTTnRkkauo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2FUAn3Kkyki5NkIr4MitgkwXHucMAVAEHmipd2nMja6t1xNg
	vdkr4V3KKEzJInYZ22qH0g7JcN1n4JEKtdkoQFPnpGKblIjr9Ne4iPpEQ60RIjaapGp/OS4b51h
	1GL63TSiMI6jIwLK0GbozaS9M2xMEooePs718griy
X-Gm-Gg: ASbGncu0UzT5MBEl8GFf4B82iGNee657VePplzoIG788qORQVHwXhtEjbA9xfGUVcic
	xVDcCuer+9KG2QIQI1GNlKIRniF8EZgJuFEfcvAZ+OSlgN6HxVwAlcOtJ4cypzbraUulfxsU0Bg
	npZjm30aJ0dHj7U6rSpSN7ATL2dPqUgOq/iA1qeNRqI4WVTOJ99c27zny2WJHwij5WQp+0ix2iC
	g==
X-Google-Smtp-Source: AGHT+IFeKVnJc6QCJRGr4OXWCNA2tz6fiMAs4n7uMIeZzjA/074WnKl5a3SxBaJVxigg2QbFJcxfRws/j/7Be7l3uOQ=
X-Received: by 2002:a17:902:ced2:b0:234:d7b2:2ac3 with SMTP id
 d9443c01a7336-23823fdd767mr67312345ad.20.1750870485515; Wed, 25 Jun 2025
 09:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625022059.3958215-1-yuehaibing@huawei.com>
In-Reply-To: <20250625022059.3958215-1-yuehaibing@huawei.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 25 Jun 2025 09:54:34 -0700
X-Gm-Features: AX0GCFv9Cs91WMz-ure16jB1p8mN-vn8sTtVBHtyugFOPzB0BkM1M4E2a9WhqYM
Message-ID: <CAAVpQUBRj7dcq2yPQ+0L7b4piPXAxzmgD9zKvm_n_+mZ97egOw@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] ipv4: fib: Remove unnecessary encap_type check
To: Yue Haibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 7:04=E2=80=AFPM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> lwtunnel_build_state() has check validity of encap_type,
> so no need to do this before call it.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Next time please wait 24h before reposting.
https://docs.kernel.org/process/maintainer-netdev.html

Thanks!


> ---
> v2: Restore encap_type check in fib_encap_match()
> ---
>  net/ipv4/fib_semantics.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
> index f7c9c6a9f53e..a2f04992f579 100644
> --- a/net/ipv4/fib_semantics.c
> +++ b/net/ipv4/fib_semantics.c
> @@ -625,11 +625,6 @@ int fib_nh_common_init(struct net *net, struct fib_n=
h_common *nhc,
>         if (encap) {
>                 struct lwtunnel_state *lwtstate;
>
> -               if (encap_type =3D=3D LWTUNNEL_ENCAP_NONE) {
> -                       NL_SET_ERR_MSG(extack, "LWT encap type not specif=
ied");
> -                       err =3D -EINVAL;
> -                       goto lwt_failure;
> -               }
>                 err =3D lwtunnel_build_state(net, encap_type, encap,
>                                            nhc->nhc_family, cfg, &lwtstat=
e,
>                                            extack);
> --
> 2.34.1
>
