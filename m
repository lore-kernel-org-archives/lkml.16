Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE72522F
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738983447; cv=none; b=SpgAaWu02w5qCfGQTXErtBHtJB0DD9qDyoYJisfY4qotJaDtilRLVBabGN9M8eTNR5VIh7I/dh1GSFeQbiYdB1BdYViSxgKaF/qbzBOs+14RLSIdVacurmujzachGv+wXTq4SI5xn6vIY3S9k/mM1d/+hFCjzV2iZ9kaZI9UC8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738983447; c=relaxed/simple;
	bh=8DccWs6wCWskvLVN7E1jd8TFfEajJ4du6tb7En40r3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2V8Cj93rPDyN+RU5m+EWpqMRlU8YoCEI20WGzVVIBNcGqHbSrkJ9WXFR8+rstfhOoRhwmRY5X1rjralqbDAbzJeVB7dJFAJniy7olGYi50Bo3oKqmnN2iGsm2WcDSFD/UJA/dCqjwXTs91+2ZEUcwkG+u7XNTQl/+5lN5KIRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IgFZZIR+; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IgFZZIR+"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71e2764aa46so1954690a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 18:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738983444; x=1739588244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxLH/0mNKOA9oAdJlhcouBluEGl2xAARBS6OeCkhtnM=;
        b=IgFZZIR+6/4mAxAgsxAcuoUOZlthhplQqPimAk0goPhPCVIpAYvM5t0jH3p3BAls19
         IGqnuT+9BMN4HbUi0zPP66uCZr69e4jFJVvbEAMbx/B53xFh2j4V933nJz8BpoyW5R7k
         7ZgV5j2CVZmanHUAIrv8lVlS3MDarm1VwU+JoEIyTJIrl6D3CwPt5ese4BOOm7MX3csC
         uF8Zdbyl0gKmax3iIK4OHdPFYB/MdjYlLeY9rdUcoogSgj29QRsvZxw7L4aygOml0vcB
         8o7oRoH/aZXf+7i8xARXkdvQZjIt6xyDno1S78nc3hVHg4PNtoC5ec1yV6K4n9CSZEyP
         C9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738983444; x=1739588244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxLH/0mNKOA9oAdJlhcouBluEGl2xAARBS6OeCkhtnM=;
        b=QmwEPgD8Cdsh/UldS8H1huEB87g+BrxTb90LEtbkGkAk4Gq8laYcaVr4ePOnqkR3G4
         jznNtBgvQaCifMAvLvLIBkJFE0oYXQYQ7D61ef0AliyLlaX2zKK9Js7R855MZ/gOkBZ7
         WKMObVqBFsBfV9y0kl6wxfOsiymxFR2sHOsRoqgIg3zqoKAqrY0Pcw/0ZfzerNShNwg+
         D0zH8ulCpRsoJNpLrjqCOj3PbUpPU67nl793OMUCi/fAXQqozm/GljXnOYlZHrIUrWFv
         ydVPPAa/+qBUe8O+KTc8qxEaa9EVha4Iex0h8LhrRYUTl91r0c6iBy8vj6ozg2Rl9Ux/
         Sobw==
X-Forwarded-Encrypted: i=1; AJvYcCUnBEwuuvdAR9UPQrfBTDba/toeonZMHbppepowcXBzhqjENnQmFSgTcts9L2+8RUs3QLHzF6nJTv1wrVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhVDRxDIz6587OAhGhEM0110pmRDDEJAV3Hjsf9P3Rq7/Tzmb
	ZbLcaLhudwMidH87XVy6tNvutTZIVQwqVA7b+mK4p2vpSmoOD8+TCOMqfFCPiDKRgdDGMn5JlyU
	byX2caaBBZUHUmgKLz+bwZVPUEcOR5L+4MTPlug==
X-Gm-Gg: ASbGncsrSsKMMobelELmLEYtQqbOIkaRLJmRAzZKaxNGSmnBZ6Cb2y/GMtsAIHVMA7U
	n7T/8wyi/Nn09wM3EzAMMajRZ4J+OH07Wc/XlzJ7SST78hrHmC/AYVfjc+0pjNKITpk7ELKe7u5
	0=
X-Google-Smtp-Source: AGHT+IFzDA994qoj0pOD1pwjZKhnb3ZJW/yjhXcqLQK+e3oqjqOgw2RnWRlREyQPjPL3pbFYTWLXVADhEyqMHUGwews=
X-Received: by 2002:a05:6830:7001:b0:71d:de27:8d32 with SMTP id
 46e09a7af769-726b87b457bmr3893379a34.2.1738983444393; Fri, 07 Feb 2025
 18:57:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205031425.67265-1-cuiyunhui@bytedance.com>
 <20250205031425.67265-2-cuiyunhui@bytedance.com> <76dad20a-0180-46a0-9840-6d8444d1749a@linux.alibaba.com>
In-Reply-To: <76dad20a-0180-46a0-9840-6d8444d1749a@linux.alibaba.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 8 Feb 2025 10:57:13 +0800
X-Gm-Features: AWEUYZmxaYnEp0Kg964XX7tTfsxe4wOkRLUxQOmGY9VcBaQMtyFA6anqEU-dkW0
Message-ID: <CAEEQ3wm6vw9AvEtWOaPqLvR3x4vs=KMACN9OQGJ2eAOzuv2GhQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] perf/dwc_pcie: fix the incorrect
 reference count
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuai,


On Fri, Feb 7, 2025 at 10:20=E2=80=AFAM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> =E5=9C=A8 2025/2/5 11:14, Yunhui Cui =E5=86=99=E9=81=93:
> > for_each_pci_dev increments pdev refcount. Call pci_dev_put after acces=
s
> > to decrement it.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   drivers/perf/dwc_pcie_pmu.c | 42 ++++++++++++++++++++++++++----------=
-
> >   1 file changed, 30 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > index cccecae9823f..4ac53167d7ab 100644
> > --- a/drivers/perf/dwc_pcie_pmu.c
> > +++ b/drivers/perf/dwc_pcie_pmu.c
> > @@ -553,6 +553,7 @@ static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
> >
> >   static void dwc_pcie_unregister_dev(struct dwc_pcie_dev_info *dev_inf=
o)
> >   {
> > +     pci_dev_put(dev_info->pdev);
> >       platform_device_unregister(dev_info->plat_dev);
> >       list_del(&dev_info->dev_node);
> >       kfree(dev_info);
> > @@ -572,8 +573,10 @@ static int dwc_pcie_register_dev(struct pci_dev *p=
dev)
> >               return PTR_ERR(plat_dev);
> >
> >       dev_info =3D kzalloc(sizeof(*dev_info), GFP_KERNEL);
> > -     if (!dev_info)
> > +     if (!dev_info) {
> > +             platform_device_unregister(plat_dev);
> >               return -ENOMEM;
> > +     }
> >
> >       /* Cache platform device to handle pci device hotplug */
> >       dev_info->plat_dev =3D plat_dev;
> > @@ -594,8 +597,11 @@ static int dwc_pcie_pmu_notifier(struct notifier_b=
lock *nb,
> >       case BUS_NOTIFY_ADD_DEVICE:
> >               if (!dwc_pcie_des_cap(pdev))
> >                       return NOTIFY_DONE;
> > -             if (dwc_pcie_register_dev(pdev))
> > +             pci_dev_get(pdev);
> > +             if (dwc_pcie_register_dev(pdev)) {
> > +                     pci_dev_put(pdev);
> >                       return NOTIFY_BAD;
> > +             }
> >               break;
> >       case BUS_NOTIFY_DEL_DEVICE:
> >               dev_info =3D dwc_pcie_find_dev_info(pdev);
> > @@ -730,20 +736,29 @@ static struct platform_driver dwc_pcie_pmu_driver=
 =3D {
> >       .driver =3D {.name =3D "dwc_pcie_pmu",},
> >   };
> >
> > +static void dwc_pcie_cleanup_devices(void)
> > +{
> > +     struct dwc_pcie_dev_info *dev_info, *tmp;
> > +
> > +     list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, =
dev_node) {
> > +             dwc_pcie_unregister_dev(dev_info);
> > +     }
> > +}
> > +
> >   static int __init dwc_pcie_pmu_init(void)
> >   {
> >       struct pci_dev *pdev =3D NULL;
> >       int ret;
> >
> >       for_each_pci_dev(pdev) {
> > -             if (!dwc_pcie_des_cap(pdev))
> > +             if (!dwc_pcie_des_cap(pdev)) {
> > +                     pci_dev_put(pdev);
>
> If the pdev has no RAS cap, we do not need to put the device.
>
> > The reference count for @from is
> > always decremented if it is not %NULL.
>
> Please see comments from pci_get_device() for more details.
Oh, yes. If that's the case, I'll update to v3.


> Shuai
>

Thanks=EF=BC=8C
Yunhui
