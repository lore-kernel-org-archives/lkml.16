Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CB21684AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692953; cv=none; b=u2iW8pdgshlLBDNExpbUuonR+z6oxHip+BCmhXJ0ry0jDrCQ5buVEqs6XOMO3KxtzEG9tHAtQUsLDXo8ows0w4d9KwNUCuNvI+E2cV0LYvsqUeUG9BK3E/8JaTxePnGS9mKANZASGehl77W/J9S0hfDOcKcoZsXvJmcoKn52pjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692953; c=relaxed/simple;
	bh=5kLQjd6AzdXVJDSfbwMG/b2U5PBjG3cD+vDIQsbcSVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQ4rqq4VXlUGrdbTP/z/qoebE3I7AsndYDD5y62yZNPuN8+fDDkm7KgYcO4U8qQoU9jAVC4JUcrA6CkI8mxr6PuafMtZlFRnnwp/qa/z3poFgMMtkMEI9FB8n/zqYh8KnkxKi2vaEwNTy/Zo822FdS94S5aXo2LLcXMhpviUpbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BhMijZCI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BhMijZCI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade48b24c97so61803266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749692949; x=1750297749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeRmmiJk7dyHe2xsIaa6eDpe9k71PqYl6SPvF++88pc=;
        b=BhMijZCIFsjYlP2XfI9qeRSoH2IRv9YsOO5d/GWi+T5JivdH1k63GlbB7MVlJwRMwE
         /lvjLqYnL7FuGKhq5D4XtvANXd19ZunmqLq25AjcT4gysaF20MDkzQyEJmgqySCLYzAj
         iMiwSQR+YclDCAix6rW2d0W43Gze2KG0Cjg3/nbI+Fxq8tbS/VQRiDNYwfDWpGZMAJC1
         FUCQtnwnJ7DdPKhw4CMIT6NOpVyzE83/QZLuyE93zrwATvu7NGWXNC1yKqHY+9uzMt6I
         NtMWE5j5lu+UkPtudTvm6JBwPTEdaBimg3Khun3dLhdzFquHZOIcQGvyZGI5ICg6o9kC
         nphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692950; x=1750297750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeRmmiJk7dyHe2xsIaa6eDpe9k71PqYl6SPvF++88pc=;
        b=kg9BT/sxLEyTuXwUMLwd1c4zqm6WlmuCy1el5zy17VWV1We/V+JN+zgz7Rh2k8GqsS
         j9pP7Ul75qwcedlhA25WVAsJZ3UuxlmgjGuQsKsH0M2Pt2qNGTuCWX66G6Bp+pVd24LC
         0ODcLpzUx2+k8M2We2Pp/XrUEpyKeuk1ixhiHLwW5IqwCMHui2lpAuLPJ87/X9vpMKJ6
         F6FHMaxKL7vZCuLA8uPOfBv9TE3XSBr04y5IWC1q7GjHzyIWaDk6eqlYaRnOpRlHpkuO
         UTyeMhwSNPRili6/gYFdGMX9Kp6MhzWKNjiEHIiP7t6QwKNu4zH/gwkG76kROAcnkQ1u
         Ve3w==
X-Forwarded-Encrypted: i=1; AJvYcCVyDxt9krTp4PRmv9RLDgIoRiYYa++MAmB8+PzfQdbMaMQUhrAFwD8HAgFWhRpOp/4eXtaM5lJ3NdhfTy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYBA1F8GtS+pXdAXu/oMHqFpimxF6BvYOhyfbvY3vScIL9ehT
	6VjHOZcwAJm9Kujt0PT3JxjXoypi3YH/8E9hWQ9biSqCsjoxi0OxDe3BkjFp3HqnbeNJFEC7Yxy
	sb6A3XP5nSj01dUxsbgI/PDkKbuE/690bFoIMaAZSJQ==
X-Gm-Gg: ASbGncvOVpUFOAR2kk2QN15XSe5AjuCqvKnbuLxZIlyxUEV95TS+RxjpoPctxjWxCDW
	ttmUuEzicet5SQdksAFYjqXRHgcgRke6KR6sBmY9YFIJryx8Ig3OgwvVa6FuI7aOQb5lAcBvAw/
	QPjFuPBNVAXRydowRiVcBQ6hjbYdXwS7hOqwDa+lje26PXB8L3Xgt3qrY=
X-Google-Smtp-Source: AGHT+IFqEcHJsmVoMqXHHPFn7yHeR1oDGdJeaYWXWqBT/PegqYwsZ5z0ffozW4eWFgBnqvaTPT/vq7D0XhuX7E2hMC8=
X-Received: by 2002:a17:907:1c19:b0:ade:2c48:1ba7 with SMTP id
 a640c23a62f3a-adea9a57710mr122939966b.55.1749692949426; Wed, 11 Jun 2025
 18:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-2-guodong@riscstar.com>
 <20250611-kabob-unmindful-3b1e9728e77d@spud> <20250612000354-GYA127864@gentoo>
In-Reply-To: <20250612000354-GYA127864@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 09:48:55 +0800
X-Gm-Features: AX0GCFvb3rY5RbOdj--6bI5I0CRQw5-xjkK6pB9t5n94l_np5ZJaDhu5M4gwDF4
Message-ID: <CAH1PCMbZRhrrKy0TV7D9_nOKkPNuX7gXyyxtzhf_q7vcfhBB_Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 8:03=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> On 17:27 Wed 11 Jun     , Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 08:57:16PM +0800, Guodong Xu wrote:
> > > Add "spacemit,pdma-1.0" compatible string to support SpacemiT PDMA
> > > controller in the Marvell MMP DMA device tree bindings. This enables:
> > >
> > > - Support for SpacemiT PDMA controller configuration
> > > - New optional properties for platform-specific integration:
> > >   * clocks: Clock controller for the DMA
> > >   * resets: Reset controller for the DMA
> > >
> > > Also, add explicit #dma-cells property definition to avoid
> > > "make dtbs_check W=3D3" warnings about unevaluated properties.
> > >
> > > The #dma-cells property is defined as 2 cells to maintain compatibili=
ty
> > > with existing ARM device trees. The first cell specifies the DMA requ=
est
> > > line number, while the second cell is currently unused by the driver =
but
> > > required for backward compatibility with PXA device tree files.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  .../bindings/dma/marvell,mmp-dma.yaml           | 17 +++++++++++++++=
++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.ya=
ml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > > index d447d5207be0..e117a81414bd 100644
> > > --- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > > +++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >        - marvell,pdma-1.0
> > >        - marvell,adma-1.0
> > >        - marvell,pxa910-squ
> > > +      - spacemit,pdma-1.0
> >
> > You need a soc-specific compatible here.
> >
> is the version number (1.0 here) actually documented anywhere?
>
> otherwise I'd suggest using "spacemit,k1-pdma" which follow the conventio=
n
> which already done for spacemit in other components..
>

Thanks Conor and Yixun. I will take this compatible string
"spacemit,k1-pdma".

-Guodong

> --
> Yixun Lan (dlan)
