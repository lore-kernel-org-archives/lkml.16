Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5072C2D1936
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 19:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757686; cv=none; b=txy/2vubXU7sdryY7o8CkLbY6CsTkDgQuQClzwcfPsoJcGUtebWKSf5w/NX0k2TivRfJHUs9uwXlZO9s9wJgJbVVOlJ8tTI/gXtSQDlxIVxYSJudCHyaTnGTAf3BhdXd4tqxNRRSyIg7nfv1jhDDWprK4nskLUH8nw/QwC3WDps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757686; c=relaxed/simple;
	bh=ioKitG+yRYhRJrtQctH8UeW8KGYpeayaBl4Ml1mBldA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWi5oYZAKI7odkQIOIiqtihitv9zg0gFjc1IvhRqJ2v8ZA2v8PhTOLvjZuU5AzJ/X/WqThRRbcBUQSPNfr9Ou7L5Qbg1WTowf+BDBO0rZm7+IGu4tWOhQBdV7/p/bzaQnbm/F/hdV0fTScgyiSHnktyiRa6FIvCB3Y5/xuOsvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=L1+a6pB5; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="L1+a6pB5"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-404a5f4cdedso390302b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1749757683; x=1750362483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=;
        b=L1+a6pB5HWKsnQSfy/aDfl2Ow2HHCndtYYNnEpXRf1L4YsCgXaabYJB2094YKQLZbA
         0fbNHwMRFSGJgwseBRxrobOyN2oJZ90EjBi//94CRg3YIer7o7fhh8t0zSz6gF42WhH9
         kiXYPy4e+90MsBpEwURC3E/G34tH1yB46UIXAGCHsSDGtssXOCpdpIyfUJZFaSAEIqbS
         umIeeFAzdemJ/fSYoEcZ7hHr3kfLtS3TOdq7JIpz0dcQEG1d1Dq/xMsKrtMefUL0Q66u
         sLsfXqpEaJEMLQW24JoqA5uo1bYB2Nb2HYpUmcIohaI8kdNMsmd0ygv591C+AV6ADOAT
         PcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749757683; x=1750362483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8e9esVoe2c1asLojkhwYh+MoQPaPYmSvfLLOY1O43Qk=;
        b=u4K9fAbcURUmWIc77RuVRrCyBQ6Go7soh1DLHIXlEq5h6aavrNgje+aUN+vqJEADoT
         tyf/WE8pdz0WlIjDYddMU0yDXFb7E37DrwAEYe/HzMM1RDUwyvn+V6bN4UTEg8C7G93R
         3KltOrgun88dAP3Tl4JvcfIgudojPCdJPc0iS4PfDHJjn+x3x8z4ODa+crqCwkHm1VNZ
         CIMON8nonyk/7ztHudLalnP2oxx6K/9omKGsuswnE13MbmqtgvlfISKsNlWwgEUFOF7c
         AHyoLzH24Po0i6un5ZxBE39FgLIFHc969G+OXxr3NnzkXZ3VVSweackYahR9VCTw4ZWl
         DWOA==
X-Forwarded-Encrypted: i=1; AJvYcCX1CITzMhmAkq7X0z7FzxvzqgzIOoTgQoB/565lv50WDuH3ob2AZ6rbETAQYzAWJFgeq4A3IoVqjDnMcC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyA+cLXjBfxsQNNIUQypd2ZKha+xqP/bSEcBmGFHNktzkxWxxv
	eJgiV6IHMP1z9Vo+EISDFqbh6hDNInzWZQKxDlpzamS6R/rjgleCKahTmoP2ausWWyDuuAIpTqj
	SaQ9b+yiUi7jo7JN3frvydIKfT3bJnNo9M4HLjMs9Kg==
X-Gm-Gg: ASbGncuuLVcL4HOthYLAaIPecyQNL430XBPJhvjz/2l7FmUPk1UB57Uso4flFjvOChL
	2c+HEpdKaRNsBjRZs7axUuVOQEKzSS1mka6yjbg+IqHw/J//M8FmskzOyBU6Lm9yojqz4bdNHGC
	3W99bY/vTCw2kk0Y8w5TIulqeorMFIwp0dGyhIbqNJmUk=
X-Google-Smtp-Source: AGHT+IFcwAXQ3PbWAljxpAOaH7id08n7aXe7ujr3lhVGcrvJaHIYrxkMSHXAY37YjImxRVd5r3NbxP9AAw1idnxghok=
X-Received: by 2002:a05:6808:3c43:b0:401:16e:918e with SMTP id
 5614622812f47-40a71d7641fmr583982b6e.8.1749757683321; Thu, 12 Jun 2025
 12:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612022747.1206053-1-hongxing.zhu@nxp.com>
 <20250612022747.1206053-2-hongxing.zhu@nxp.com> <aEr8PxcHp55Bo5Os@lizhi-Precision-Tower-5810>
In-Reply-To: <aEr8PxcHp55Bo5Os@lizhi-Precision-Tower-5810>
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 12 Jun 2025 12:47:52 -0700
X-Gm-Features: AX0GCFtVrSEePbUg8i-7Hr0xxmYOgLkuZdutnpQomlDJR8IFZN655IzCDiGytFM
Message-ID: <CAJ+vNU3vyznybZ_QZBrB+nc1=2+BcC8csOtR5=6-gmgn6sb5tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 9:11=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Jun 12, 2025 at 10:27:46AM +0800, Richard Zhu wrote:
> > apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms=
.
> > Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
> > wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();
> >
> > Remove apps_reset toggle in imx_pcie_assert_core_reset() and
> > imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
> > and imx_pcie_ltssm_disable() to configure apps_reset directly.
> >
> > Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, whic=
h
> > reported By Tim.
> >
>
> You may rename apps_reset to ltssm_reset to avoid confuse for legancy
> platform later.

Hi Frank and Richard,

I was thinking of making the same suggestion however the apps reset is
in several places:
- imx8m*.dtsi pci node as 'reset-names' and reset index number #define
- imx8m*-reset.h bindings as reset index number/define
- pci-imx.c driver

Granted it is used by imx7d.dtsi, fsl,imx8mq-pcie, fsl,imx8mm-pcie,
fsl,imx8mp-pcie and in every one of those reference manuals it's bit6
of SRC_PCIEPH_RCR named PCIE_CTRL_APPS_EN but described as
'Pcie_ctrl_app_ltssm_enable'. Can you ask your references to get more
definition for this bit? I'm still unclear why 'de-asserting' it twice
was an issue.

Regardless, any cleanup changing the name can be a seperate patch in my opi=
nion.

Best Regards,

Tim


>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> > Reported-by: Tim Harvey <tharvey@gateworks.com>
> > Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZ=
cMHDy+poj9=3DjSy+w@mail.gmail.com/
> > Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deasse=
rt_core_reset()")
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/contro=
ller/dwc/pci-imx6.c
> > index 5f267dd261b5..f4e0342f4d56 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -776,7 +776,6 @@ static int imx7d_pcie_core_reset(struct imx_pcie *i=
mx_pcie, bool assert)
> >  static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
> >  {
> >       reset_control_assert(imx_pcie->pciephy_reset);
> > -     reset_control_assert(imx_pcie->apps_reset);
> >
> >       if (imx_pcie->drvdata->core_reset)
> >               imx_pcie->drvdata->core_reset(imx_pcie, true);
> > @@ -788,7 +787,6 @@ static void imx_pcie_assert_core_reset(struct imx_p=
cie *imx_pcie)
> >  static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
> >  {
> >       reset_control_deassert(imx_pcie->pciephy_reset);
> > -     reset_control_deassert(imx_pcie->apps_reset);
> >
> >       if (imx_pcie->drvdata->core_reset)
> >               imx_pcie->drvdata->core_reset(imx_pcie, false);
> > @@ -1176,6 +1174,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *=
pp)
> >               }
> >       }
> >
> > +     /* Make sure that PCIe LTSSM is cleared */
> > +     imx_pcie_ltssm_disable(dev);
> > +
> >       ret =3D imx_pcie_deassert_core_reset(imx_pcie);
> >       if (ret < 0) {
> >               dev_err(dev, "pcie deassert core reset failed: %d\n", ret=
);
> > --
> > 2.37.1
> >
