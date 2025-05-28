Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7359728DF31
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451417; cv=none; b=CYvlgei2wMn7jjSEXyJmdpOrwR3snWefK3/N1M7NzUPRgBpaYoMfkbzUjGjQqndn4ZIIpXfIgq8T7BskBt9cD9O7OEp6Gf7eXJGVZXPxZQXRdQCBpMkQvlBiwE5EH4q8EthhLx+7b1o0rjsxlVL99bnNneMao3WPuXBVrDh48BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451417; c=relaxed/simple;
	bh=eOFTOo5zmCZsJoZUgSE79lX2yL7uavEKR146eGIK2pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkJtCpGe7+yphA0a9fPbvtk7ckOwB0W306D4hgsxUqsQdeAbDSYgihFZFsPyEhvwFl68qufowZPF+sHLHz16kMyetMCYl+GSgwwLdfQ2vx1rqtii817qE4/hJIBR1NpAb20HXDZqC8Us6/BqJ1HPoHvfq9u4w68SpGtbKQrQBBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RTBY3yOx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RTBY3yOx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso1905e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748451414; x=1749056214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1kt9Dt95V/eRXDxBRTKBLtP8PVxYRKcv0rN2aIoYv8=;
        b=RTBY3yOxU79kDkextwq9z1CEf3BVuzUk03/qVThneEs+bUumb7Dd205ybNY0uJmLCi
         WGcWilqmknXscGoiIFSRvknxEtSPrgqT41nsdvwNxgzEmImYi/PZGpD1mbDwM/rNMZ8m
         oQudH4rpXDmJ7exriQdKpK7H8N6GzcvlEV9JRjowuz686iDYr7x4q8AT9ZHh0yNY+Qn2
         ZhUjrYPnGzc2FtbpQP6cR5P8suj9yUl50imhERMu0EzKyLsgPEMietD25CuixFO5p3M8
         R62wYJunIpIXGg4o54NsOz2bnwZHgsNZymx7PI5g+rYvOyV0bCglPd9jKGBGPdrt7plN
         sF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451414; x=1749056214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1kt9Dt95V/eRXDxBRTKBLtP8PVxYRKcv0rN2aIoYv8=;
        b=Yvy39q1rTEwIe6hhsOZ2FsaeA8QjEi7mbp2447F6Vv2/aZ/mvk/p0EzXAd1NXwEZTd
         E6nrcEIzFyuyFuWVxesS3a63lETGi36UJTU6JBxkGNTtHcjY1vaVHY4zCYXhO3PFRUCL
         1J0SgQfdQJJ6bnm4AO8fdcTtAQctgfmS49NiltDI9uAtVgV9MO5O+SBFB7t5l8mcoI9G
         s4GRRhQEZzkHpMJ3Y2SvVzSbPprYVXN3EQdM5icMS333MrOaNrrFrpWzh3MnCQWeWQ+C
         TrRoPDsfx1jbechww+cF43VcxDGTd2od8Rb0qHhufZKy3cyUHuFFlo6/1AzVU/U2O+tt
         gSag==
X-Forwarded-Encrypted: i=1; AJvYcCVP2RXqXV3GoZVAhpgRHKmZVlWcUAz2pl4ILBRRd4jSTio/Fy5DmtQu2H4acS5J8Za7M2avNGRBU0Xfm0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUiA0RajJ9a+ghBupQ9ccb9njxG2qJ8qo81sZOymiz63GGK8I
	N4eN9cIwAeNYD9oHS/raGB5Sw6F4R0uE7sks9OAbKEJj9Ay7qE5Nh/wfx1uaUTKDXOlhorwfS7G
	dtZpZOcQ81OZ9+q/0PgNz5LYrYFegFydMI3/LUN7Z
X-Gm-Gg: ASbGnct/mharTObdXaKFfD1hojxQCvd5PCQxZw0WzUQEKFkun0S3sEoR6psOczKEge1
	8ApNfngS+btmCNw5RcaEzKIrPO79LvAIqS+ZgPCXZArbnMliEkkprUrlMWnhl0p7UzVCRpXSGoJ
	06Bnv7CAnJCJQDklLDgYgITZo0eSJf0TC2RKAfmLKTmQnU6dYKH+olFu96gcnZLdIqTcI3sANF+
	3Xd
X-Google-Smtp-Source: AGHT+IGqNNyAdIrmeJn9gWkLURDbutnwBexLXJ91leR3aXf5DBQNLXD2WLOnBrgCYtd3axsOqlIAmmjmmOoxJ/BlCME=
X-Received: by 2002:a05:600c:1ca1:b0:43b:b106:bb1c with SMTP id
 5b1f17b1804b1-44fd30df1abmr1997695e9.0.1748451413458; Wed, 28 May 2025
 09:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522235737.1925605-1-hramamurthy@google.com>
 <20250522235737.1925605-6-hramamurthy@google.com> <20250527191240.455b6752@kernel.org>
In-Reply-To: <20250527191240.455b6752@kernel.org>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Wed, 28 May 2025 09:56:41 -0700
X-Gm-Features: AX0GCFvnWbkPHZjYonuLle_IHf7Sq8_rnYuP3Felz5Cme3QxGDkryyuJFAL6r70
Message-ID: <CAG-FcCMK73jqjQMhktk8_pVmSPmN6R0BgGLVTLOujspWBe6ENg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/8] gve: Add support to query the nic clock
To: Jakub Kicinski <kuba@kernel.org>
Cc: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, jeroendb@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com, 
	yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org, 
	thostet@google.com, jfraker@google.com, richardcochran@gmail.com, 
	jdamato@fastly.com, vadim.fedorenko@linux.dev, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:12=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 22 May 2025 23:57:34 +0000 Harshitha Ramamurthy wrote:
> > +     err =3D gve_ptp_init(priv);
> > +     if (err)
> > +             return err;
> > +
> > +     priv->nic_ts_report =3D
> > +             dma_alloc_coherent(&priv->pdev->dev,
> > +                                sizeof(struct gve_nic_ts_report),
> > +                                &priv->nic_ts_report_bus,
> > +                                GFP_KERNEL);
> > +     if (!priv->nic_ts_report) {
> > +             dev_err(&priv->pdev->dev, "%s dma alloc error\n", __func_=
_);
>
> missing a call to gve_ptp_release() on this error path?
>

Thank you for pointing this out. Will fix it in the v4 series.

> > +             return -ENOMEM;
> > +     }
> --
> pw-bot: cr
