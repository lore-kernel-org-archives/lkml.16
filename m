Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5F1F4190
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300169; cv=none; b=ruRmTCfhG9FVDDrnxUL0Cb0FTqZ5odD6IT/SjRzY2v5rB+b3jD+OUga0EnTtD+PJ17vcnLlSRL81xZB1VrG68YOYYV0ZqUc6iMPaD5HCpagIdS2VozHcRdC2iUGppx7Mz6eA1RZgJbiqI0y9qv7W+elDO3yLNW9DKcAzOJBX6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300169; c=relaxed/simple;
	bh=L2w4QtkDjTcxS3Jiw42nicI67aVG96GPyXoun25RMB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF7VN1vTM5KtEvnQFUATfjjkAsJgb9x4GNxzt/Z0fkCRwUpptq4Oi8uoxQ/n7SbqRViDTTBRg9KhE+rQIsJdkMM33fhq1USB44LBJ8o3T2dCC60zhwVRNxovtCDoqjzLRWppgqNdCp6TnC+DT+E5UATRJIDlCsBYjP+3TBopDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HyPCgF1R; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HyPCgF1R"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71173646662so3491427b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750300166; x=1750904966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDeHL9d8vuK42id4GVmvojG1LbxVd4OxULlS/3TaFoo=;
        b=HyPCgF1RyBNpndkOPPsNC8GhgjEKKSrkzQREGgxvK2MOjk/8YVnE+Lu8kZHhnuQAMF
         /7g0JoZjbl5FLQNiraieYZxQlBfABokjIHlH4C4QNAxTIY4xgP4xOwFpul1o+CtiOL9H
         mAnbJj/kSIPvuadDEiAfpd3P16N810BiZHqX14taSWi58YCR7JaiisLCxodghYl9OpNH
         LRnSGWBo+CmhcSVA7Fw7O1ooZpgPEP/DDJezDZtaZleODYOVEAS5j1jQqa0NOCXxGrK0
         1K75F1v/ngHtUJ2IdGXlA4mbV9LjkTSvPEpr/1x+dnGEIGh4ANf9mrIlxP5UTmmD+xnN
         HeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300166; x=1750904966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDeHL9d8vuK42id4GVmvojG1LbxVd4OxULlS/3TaFoo=;
        b=T2I3ZyPyagFUyHEJ0Zs/Sb6F2y0l05PJ1Gh+8sHcgiEWLMGoz90RYumbee96m/UeW3
         uAIKu338f3rR0JU0EYdDBP7vrQ46zvVT/u7iVeVIlst1lF7L+g8kF0SU8BoahaFtTmau
         xFHkk3RC3QDDKeDUNm8kK3PJegRCmRpe8YVYNf+QFk2yMQmpdmTv2vw++gUJZ1mITQ2b
         88a/gIsxk9k3rRXC96xXM3mqE6M8/ARkV5m0ZZ6qIQWOIGqYjZ/oj1WlLqE8pxPyPiE5
         KXMUT6rukCKVL4kk1xWibaXnraCFEMl+sD5/qp2iXC44EiEVj9o98NanOJ9/w7164daN
         kpow==
X-Forwarded-Encrypted: i=1; AJvYcCV4qbEVfvmb2nV9x9ixjtie3e4lR7lt5yzDi1z+XBGpflvg2jL4R84x6u/uAvWMM4I0O+7AlGNgem9/SsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuogAu1Wt5359ps6kyk9BkXNyEuksktAhXPJ8fCQbZlHpBjpTm
	PLAd7dAXKZe1p3HeFLK0fagS/20KrMA4U0LS5nl1Fzmn4z27rsJPejzOQkw6G/uRmX3RBN45PzJ
	M/7CNve7MEhrAuDoLHLQ7kqcxkOSlgYuVUOFcMjVQHw==
X-Gm-Gg: ASbGncspv+UQT28VRzOxkDrntj2V5pysoaxQtY4+uWggHE+JSYvHbemdqaJ8Hhtp4uj
	ZrnMXztdS6nx1OoUYogElQXDPOv6pXnKBFgaUPmG//aY5UBflmP6I4F18mR+TlqCsdAej/Mh/V0
	hXBu8NbNIG+2+lLps+uUP+gT/bx6PVCkIRieHtwGan2Q==
X-Google-Smtp-Source: AGHT+IGTWcMJ9e18SuuZAjhMb+1RhUC5KbFMVpAzHRzN1h0rYVrbKTgujtHTi15citzRIXK4WE/50371Bg3VPce6S3o=
X-Received: by 2002:a05:690c:4442:b0:70e:29af:844a with SMTP id
 00721157ae682-711755076b4mr289656047b3.18.1750300166249; Wed, 18 Jun 2025
 19:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-3-guodong@riscstar.com>
 <aFEEhik8x2k5_myN@vaman>
In-Reply-To: <aFEEhik8x2k5_myN@vaman>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 10:29:14 +0800
X-Gm-Features: AX0GCFsoo3SDAFCWa_VQKJiemtWkvUSERAjA5vBX4NjZ4H9AqhsVRRlcUwFSJ3A
Message-ID: <CAH1PCMaD1muAQWRUfDJNKZL+-y31MBbw=aeD8VgEGxJE3eATbA@mail.gmail.com>
Subject: Re: [PATCH 2/8] dma: mmp_pdma: Add optional clock support
To: Vinod Koul <vkoul@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:00=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 11-06-25, 20:57, Guodong Xu wrote:
> > Add support for retrieving and enabling an optional clock using
> > devm_clk_get_optional_enabled() during mmp_pdma_probe().
>
> Its dmaengine, please tag them as such

Got it. I will do.

Thank you, Vinod.


>
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  drivers/dma/mmp_pdma.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> > index a95d31103d30..4a6dbf558237 100644
> > --- a/drivers/dma/mmp_pdma.c
> > +++ b/drivers/dma/mmp_pdma.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/device.h>
> >  #include <linux/platform_data/mmp_dma.h>
> >  #include <linux/dmapool.h>
> > +#include <linux/clk.h>
> >  #include <linux/of_dma.h>
> >  #include <linux/of.h>
> >
> > @@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device =
*op)
> >  {
> >       struct mmp_pdma_device *pdev;
> >       struct mmp_dma_platdata *pdata =3D dev_get_platdata(&op->dev);
> > +     struct clk *clk;
> >       int i, ret, irq =3D 0;
> >       int dma_channels =3D 0, irq_num =3D 0;
> >       const enum dma_slave_buswidth widths =3D
> > @@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device=
 *op)
> >       if (IS_ERR(pdev->base))
> >               return PTR_ERR(pdev->base);
> >
> > +     clk =3D devm_clk_get_optional_enabled(pdev->dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return PTR_ERR(clk);
> > +
> >       if (pdev->dev->of_node) {
> >               /* Parse new and deprecated dma-channels properties */
> >               if (of_property_read_u32(pdev->dev->of_node, "dma-channel=
s",
> > --
> > 2.43.0
>
> --
> ~Vinod
