Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B1227C844
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383662; cv=none; b=YrbozNStlQkht+r/8Lnam/dUKOvm4C1AG/r4bV4jEBomA+WORADj0GotHxLUL+NZlp3E2RhKf/YVuRpdMPyJ00p7QDfXJLqjrjvbCahaQIcwOcMa0gyTYtPqi9uyh18TtbBrP4zvw5Kedfq+/ULNYx6+rT45/dCqSTolgRHwLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383662; c=relaxed/simple;
	bh=9liZjkpuVRzepUk67tgGkXDJwUW2A930piJLEnM5Yb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6wqV9A5aLyZYffW0kteIUtqQQumEHORNrcRNa5fH4xqknNDQZWpswugw5oLRNkk2VK3q0HCX+8ZKxB/FlS/yOXv6gZIEymmKJ8WDh05tCFu5GuEvaCOrzqoTDziLfUOxYUEAHYSpjNa8jrqQCLirnfuvu7epuHenUh9kgk0F2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PI8GWmn5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PI8GWmn5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so5850635b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383660; x=1751988460; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=PI8GWmn5eqsF0sqYaS1H5j5Eh6sazutwh+zHiCvV5IxX2JaEdV/S56d3oKPpvXYwpG
         8zId9xgnxWDzxlxZnXQoEU7Ttx2VxYoFVcz4gyU3AJsiVM/O1VSCTUpL2GyQHLsuSqpv
         fKyWgkJUzv9+w9hm07d/Rd6psM/A84WXKvAxlvScNWnveGgblUlcJJMsESOGOrlAVZ1V
         FsdS6pppj36odKEKXKXzXNJGdYAJEwv98OcD4eajxmTNpwyWzdXRFv98U36bNGWpe3fb
         v9esS2ns9+nO3soGWc48s87qjAdkh2J8nYd70/VztNAURCmXhM/IPTKjAlf975bnD63z
         IITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383660; x=1751988460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=gWPYoBEtGkLgQ9Bwreumq5aas1bcSn+OTHNtpKmP8sLBxjv+7vxIiKRo4685KNZzE8
         UZEpOnpRxBoqTWh05vVNE86PAXwgYfLq+ffSU8DOhrmOvV6uQpfdQgG6C9zXi+w/bcGC
         nSPVaeSc7/pUVrWN7iz2WY8elAGrZn4QfLjD5WbOqzrPfB36YPyeEZbCheDGJjOpPsLh
         oIDRf4iBGfMkeBlBWPe2UeFYXAdFxof95UbN41isSrQ6Gcf27j+6/EZ6R17mwefzyMjC
         1EBCTSS0mZoDFdMi5777ThkBZ8BDG5O8WvoSoN8/3OSW1w3p3yvz1hWY0JPVa0aCDs/w
         7Kig==
X-Forwarded-Encrypted: i=1; AJvYcCUx+BZq+/lsr+eMRzYi5xLabXKscPJdD3HFgfBFyqdIqAc8cXRkXus3OruwWalTa14YfeUV8wYS5h9BtIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YymKdt1b0/mo3Bb+IKKujXpdaQTcccx5o2vZ1JUOTc033cJSPz1
	ADxKWIte8XJa4bifHwZQGAbOCMoqRg1B3dEt7+mBdGwMGE2KTwZ+CSfHGtrczKDoPA4=
X-Gm-Gg: ASbGncuMA7BhPkIp8qkycaS2otMJne05We/dCtJadngZ7aCMZ43pKOo81eJ08ZaRlvb
	uQKXeBEpf+yTXJdIMtPUQButIiC6yWGnkswOOBaCN63W0jh6wrEW2gc6Txpgxac0xLrNrjRkcMZ
	f5tPlTpG44kSLL4Mhix9wOysgFzTYSMn54Ix9Zj1N7oI9zoqCaLjZRs8B5zcygRMut6LWd0WNmL
	7zDvhPq6fZYR4JmM2OuDFnTalKm2hNvKZA8kyvWxp3RKtp8kvp+7iJbzhipMh9sAGDP/r/eDKpn
	RjwzY/Sc4Byt2UbpKHiZ+QquqIENojX5kVwqUkwBEU2NAvspgYgCUnORvoNKBA1S6w==
X-Google-Smtp-Source: AGHT+IHwXE6TtTbogZXGrSWNeH17X1Eg9b1iMZBmFtEaqZg3w/0LyLCHYU1l4YImcwX/ylYXOnxCQw==
X-Received: by 2002:a05:6a20:914d:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222c99ba442mr6683521637.12.1751383656024;
        Tue, 01 Jul 2025 08:27:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:94b9:2bc2:7ead:7a72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4dbsm12287004b3a.160.2025.07.01.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:27:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:27:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com,
	daniel.baluta@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aGP-ZVuhBdd1GPLe@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com>
 <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>

On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> On Tue, Jul 1, 2025 at 1:05 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > > coredump, otherwise coredump will report an error "ELF class is not set".
> > >
> > > Remove the DSP IRAM and DRAM segment in coredump list, because after
> > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >               mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> > >                                          att->size, da, NULL, NULL, "dsp_mem");
> > >
> > > -             if (mem)
> > > -                     rproc_coredump_add_segment(rproc, da, att->size);
> > > -             else
> > > +             if (!mem)
> >
> > Flag rproc->recovery_disabled is never set to true, meaning that since this
> > driver was introduced, some kind of recovery was available.
> 
> Actually since this driver was introduced, the recovery can't work.
> We didn't test the recovery function before. sorry for the mistake.

Let me see if I get this right:

(1) Almost 5 years ago you sent me a driver with code you did not test.
(2) It took all this time to realize and fix the problem.
(3) I should trust that, this time, you have tested your code.

Did I understand all that correctly? 

> 
> >
> > I worry that your work will introduce regression for other users.  Daniel and
> > Iuliana, once again have to ask you to look at this patchset.
> >
> > Thanks,
> > Mathieu
> >
> > >                       return -ENOMEM;
> > >
> > >               rproc_add_carveout(rproc, mem);
> > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
> > >               goto err_detach_domains;
> > >       }
> > >
> > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > +
> > >       pm_runtime_enable(dev);
> > >
> > >       return 0;
> > > --
> > > 2.34.1
> > >
> >
