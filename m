Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794282E62B3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789616; cv=none; b=uujAhtxTRo3p6qgQ0mxNxcGYrIbFuKZEQ9t6Lxh6y/8ziojmYCOmSzYyqvGUFVRTFU7XsODggcYglhan9fw+wzcptK549ifUHFwSdPROLgYcsms6bdCXEOLZUMY8xukVITGPFOKziUrlE5Ks69sg2Ag874vkWk5o+TWPilODuHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789616; c=relaxed/simple;
	bh=HFbSzYd+mqxN5pXKtHnvjoXNDEkTAPKwFubZBZilaE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9KPg5zHPbUX1gCFMYohOxKpQE/C0ASVWZaQFnc56lbKI+gsqI8s1HEWvYHIkQ7z6km88c04kIPu0xdvU8jT1cUcJ4vzrXtFYB/D2N+cio9jsHtiFDj0f292TOH48XqEkDmxl3tcLKuP672CwgEmtvuFbNJZcv4CCDMWBreKQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M3Ty8lsj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M3Ty8lsj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so4887991a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750789614; x=1751394414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfORqwPEBwe7uV2f/5Rz+iOYAL0FCQqJXYRyyOAw9qc=;
        b=M3Ty8lsj7qcRfOitV+mLl9/Jv9KVIh/O8lpGF16GshumOlYUGrj38ijyLShWNF7Jiv
         1roazMUcwnxu9u6Ba+U+n2lK5TwUSGyUUSwJ5zKzfQwvkZ+LxSh4G1Rp7fjiigM2Hx2p
         F4jbPYkXHLIrDDKkVjBRGfFcgMn8+m74aX/DIHC714RgRdVfs2C4UQjn5CUwozmb1f3I
         JeYjr/L92ozjhyDJXG+1ELfpMiqYoxSoxAiq0Xf9mfADGsATsuCX2qj9fWdNu2ta3Qzp
         jPddNqokd1rB6j8+ijIG7DCn6jO6AAE5SxO3rhTYIy90qaDFhxVBzu/NZMuJk7Qntr3a
         Xetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789614; x=1751394414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfORqwPEBwe7uV2f/5Rz+iOYAL0FCQqJXYRyyOAw9qc=;
        b=Uz2mggKDVQYbpwuDONkS+LL7WG1Sp2vPrbXwKJ8pX8xBzRhbXNEgWvFWP6BQ0N3FRR
         5uW/gmea/C21Dji2lRQXri35B/+yqSwacSp1ejO5YXcf4BpBGFj03zZrbOkF01TmPYOb
         MGchg6rwvxzKY7HQpqaVteE2vIKcpY+vUBxex0+vYlOeNO3fTaHynj6fV/rNDWewRmuh
         +dtKE8u8Mmdw5N30tiLEB0PVlJTfYzGKLvKS3b9m7OLDgIvWnrlSWNACjE3Nx9nS0djA
         k+VFkka5a1RQ0Mc5b2koW32dVWTK0iDwxwTwju/1uVax2EB2WumaAN/C80Ay5jaHIy6L
         ZhsA==
X-Forwarded-Encrypted: i=1; AJvYcCVi3SN+uZQSPQNweV9ebby1/38O2P0am9dlyTXvwWYSUMqbOdFuyRBH3v1BJDmNUfecIpnwUk9i0Urrh1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCUEFMQyhNx2biNC+wXJgcLyTcIthrfF6eKDUn+Y2dYG7BK+y+
	KcA6BRlIDPx5EZR+WSannohIem8xXlO4dOii+wmVNABNu7cRuMa4MwBN3X4Nd8jAnOaa3p6Kx0O
	Mi9ZsydSzQncQpVF3EXfH8JmfO1zI7VFdZtXyLkiY
X-Gm-Gg: ASbGncv6JU3btDRX/Kd0/Xi05Sp04JffobX1N9zIOymk38pVCrWYf5B4NyOMSo0a5Ey
	VcRxOBIzqnPgZlYfHngBFb1YroVC+wjIIv2COtI3TQT3th3gHiRYGMNKf/Ar2Ufrdk/J9wRSOUU
	F+qO9EPsSln8v9FvhAH7zzz23j9YZvsdDbSNh+BIBZ6ilJr3yy0Mgk8/cApy45FGdRHNXOxq4fW
	w==
X-Google-Smtp-Source: AGHT+IH1/zQNp6I1p6hBqo8VrrpP+G9Mqp2P2w6NaBmxw9sa5OuKVbJpJ2osu1ZB77jYC/gfIYOUgmtBjuFR+0bvZaQ=
X-Received: by 2002:a17:90b:4c42:b0:311:e8cc:4264 with SMTP id
 98e67ed59e1d1-3159d64a714mr32148948a91.12.1750789613525; Tue, 24 Jun 2025
 11:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624140315.3929702-1-yuehaibing@huawei.com>
In-Reply-To: <20250624140315.3929702-1-yuehaibing@huawei.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 24 Jun 2025 11:26:40 -0700
X-Gm-Features: AX0GCFs98LXgUtbrFARLUjGAJi0S9xWz1KZnlb7kgU4F1zKPOXytkgaSgwGMYiA
Message-ID: <CAAVpQUAEA6jkcM4VhzgYnx-dS1FEodN7y3DSK7LAh7Evt6bgjw@mail.gmail.com>
Subject: Re: [PATCH net-next] ipv4: fib: Remove unnecessary encap_type check
To: Yue Haibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 6:46=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> lwtunnel_build_state() has check validity of encap_type,
> so no need to do this before call it.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  net/ipv4/fib_semantics.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
> index f7c9c6a9f53e..475ffcbf4927 100644
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
> @@ -890,9 +885,6 @@ static int fib_encap_match(struct net *net, u16 encap=
_type,
>         struct lwtunnel_state *lwtstate;
>         int ret, result =3D 0;
>
> -       if (encap_type =3D=3D LWTUNNEL_ENCAP_NONE)
> -               return 0;

Now this condition returns -EINVAL, which confuses fib_encap_match(), no ?


> -
>         ret =3D lwtunnel_build_state(net, encap_type, encap, AF_INET,
>                                    cfg, &lwtstate, extack);
>         if (!ret) {
> --
> 2.34.1
>
