Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D41222581
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993624; cv=none; b=cSJ4oehWU6JqBUfYzm1KWjeBD47Hsf7/auK3AYNl1b8jtjkTLTqgdGcVUWd2yhaNyJ2cHEYhLh8tetRzK7Y3QSMirHbbYFfkhzsDbYWAJ5bJOo7+buLwbBy9z+u+wpBE/Y2K024kbVPcYoJlp78CY/nhFHQlV0R2LB60XBKsE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993624; c=relaxed/simple;
	bh=o9YHokNPMqtx+jepK5KMdLnYKClHIsOx/FzxBuROOGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7Wu1E1VOHyUYiMqsUK5c2DrSkcbcSct7TxIfDYSY+uiFTJMAQIY2uZI41pr1NRWu0uHNrIGn4BqhGMIKXCttufI/7RhTAb5Ze/O0gqSBudzbSCH6lPFZ2MMtsqce30HDlMq42sXn/HolTDEJdvR+qMUF/7x22D3b9lMJPkN/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwTU9yFb; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwTU9yFb"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e02acb2467so2688748137.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747993621; x=1748598421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mG/X9C8yLKGrCYYF7Sr7M9bc4WrV25ayjzMFPl4s38o=;
        b=fwTU9yFbT32andp/xZjoJ7BNayGXKxTwZvaz4H3F5hxR7AfMGHWPyQXaPb7faN9qj2
         1aHxzz4JCDwTFQqJ0UGPW6UOSE4Aq6cX3hLaAjMtm2F7LsBqQOBKFqQr/XxxSZ9reDpB
         z9MHAzunSSouFjaPWxCWmfaNL5EQhqeQS/pBx4ppjyKzuJzOMRpwGHy72RKKc3QzOBLg
         /2iszopyIl1h9GGfMjLlhsJ72luQqdmPIXHyvBHEE78CQhSuksHvXypazDAauTvAmn18
         KEGJeVTD1j2lFRr3o5moLbDRashyRStrn8PY8oApklekYBxv/oHfmL//QpYzDp/9X8Cp
         /Z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993621; x=1748598421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mG/X9C8yLKGrCYYF7Sr7M9bc4WrV25ayjzMFPl4s38o=;
        b=BD/AGGvOseuhpIoFEaeA1nPoouEWW0BlLjMCSZvbQOvjI+6baakO4/quoOxaD72Hp/
         XioeYLF2/gFC5f4SuvQnXvGwHUkhs5Bz3kZC0WdcnvrytamwZF/FfzKdHazO9ry79icE
         IcgDeP5iHKx4CWkZe+vpGNagja9NPe7L40sr7KCkdfeqgoZzO3RRwHZkS1jOqAQp6A3D
         RVblRybZ4wVnzs41+zKkdlKWWVAEPlwhLuKUeA5L0iCQBLf0IrSGYocKelJm/v90bdEC
         kgqaeFYYeQ8g5rbhrvMWWbSYz7HqyNeJAjYMe5nqmgX1GPs0tcNqa5oeLQrL1iv5IIVG
         cgxg==
X-Forwarded-Encrypted: i=1; AJvYcCWpPlgbbbzcGxb/2EdknsAhBJ62hrEgyS5g5InxQzlmH4cskKZIf8sJgHPTTo4np9kavP6OMaysmLYV6nk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6w88/s3zWhMqkzrYQxfawlRado/Kteyvn4rnTTi4kwlt4bawt
	3NivOh2HDPyPNrIsLtaIsQz6NeX+hKGRs5uSLiZKu0vIzHTEQlS0W5uPvJdQa3co41DQX/sRekr
	Q/WDaQu1MUrBpCMP78aCzFGCcpUQWo/k=
X-Gm-Gg: ASbGncuyERpKokhaYyzQl0s2LUXJPfRIAujsOL1KQTNDSs4r5Bozs2kjrg+oMzzz3ua
	eLEFdRjkm6iF8mh8gjHZUk+z96+ka40afD7YxDJNGr39OpYcEpN6NQmRFxLfgCN/cmmH+pF320h
	RXhKr3CeVYq2l3p8mhILpLM44R6yR6SxjO7A==
X-Google-Smtp-Source: AGHT+IHAYdMEYRC8z0rbKLDfqHoHryyGMy92RPuCzpxv8FFDn4mHzgqK5lJyEjBbQ67ikR/UAYHuhSL5IbJNpdX2yIo=
X-Received: by 2002:a05:6102:8005:b0:4dd:ad20:a334 with SMTP id
 ada2fe7eead31-4e049d57331mr26626257137.7.1747993621363; Fri, 23 May 2025
 02:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
 <cad644ea-a2c9-490d-ab41-160c73425169@ghiti.fr>
In-Reply-To: <cad644ea-a2c9-490d-ab41-160c73425169@ghiti.fr>
From: Han Gao <rabenda.cn@gmail.com>
Date: Fri, 23 May 2025 17:46:50 +0800
X-Gm-Features: AX0GCFtrmKXe53zw37RzsAhs7ISafqXR93CpDlieunRkAwGVKhVAexNUbzdpcBw
Message-ID: <CAAT7Ki8Z5O61j8bS3OkdYMbcnfJBY18zxJe=qZeJWCpYTibReg@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will release v2 later to add explanation and add fix tag

Thanks,

Han

On Fri, May 23, 2025 at 4:54=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Hi Han,
>
> On 5/22/25 19:27, Han Gao wrote:
> > Fix [1] save/restore vector register error
> >
> > Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791=
ef9@rivosinc.com/ [1]
>
>
> Would you mind rephrasing the log? It should explain what was wrong and
> how you fixed it.
>
> Thanks,
>
> Alex
>
>
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   arch/riscv/include/asm/vector.h | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/v=
ector.h
> > index e8a83f55be2b..7df6355023a3 100644
> > --- a/arch/riscv/include/asm/vector.h
> > +++ b/arch/riscv/include/asm/vector.h
> > @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct _=
_riscv_v_ext_state *save_to,
> >                       THEAD_VSETVLI_T4X0E8M8D1
> >                       THEAD_VSB_V_V0T0
> >                       "add            t0, t0, t4\n\t"
> > -                     THEAD_VSB_V_V0T0
> > +                     THEAD_VSB_V_V8T0
> >                       "add            t0, t0, t4\n\t"
> > -                     THEAD_VSB_V_V0T0
> > +                     THEAD_VSB_V_V16T0
> >                       "add            t0, t0, t4\n\t"
> > -                     THEAD_VSB_V_V0T0
> > +                     THEAD_VSB_V_V24T0
> >                       : : "r" (datap) : "memory", "t0", "t4");
> >       } else {
> >               asm volatile (
> > @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struc=
t __riscv_v_ext_state *restore_
> >                       THEAD_VSETVLI_T4X0E8M8D1
> >                       THEAD_VLB_V_V0T0
> >                       "add            t0, t0, t4\n\t"
> > -                     THEAD_VLB_V_V0T0
> > +                     THEAD_VLB_V_V8T0
> >                       "add            t0, t0, t4\n\t"
> > -                     THEAD_VLB_V_V0T0
> > +                     THEAD_VLB_V_V16T0
> >                       "add            t0, t0, t4\n\t"
> > -                     THEAD_VLB_V_V0T0
> > +                     THEAD_VLB_V_V24T0
> >                       : : "r" (datap) : "memory", "t0", "t4");
> >       } else {
> >               asm volatile (
