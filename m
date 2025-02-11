Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71491EE002
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262171; cv=none; b=fYaljvdpf4+caBy28xRuWQkovnkcOfZuZOgzGhfRt626drIgQTOkBsZmgVOzNoe/X1FEfKmAP4zK07n6S9T2ZRlGoOWbZ9fCKQcUr9/sIofZ17rGI7hqzGDpCllyHvDLY/bIIaACaDMVhdNZQcHdAZUw0DMa4lQWB753QCfebtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262171; c=relaxed/simple;
	bh=gy53+7YWq60+YCqnliLLcvcpL1WFePHHckn4ON83i/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMaA9c4PbmYCyVnS1SyXdX2FJcRawf4SFfAt0pV/Ct06c1skFqGUMmQk9rcrJqIIk2Zo0PfJcUjbw+ELULxOmayk7rVppidTxFnKar373ud27NMfgH359EXbh04KvWSd+1MhNj2Nqm2wFVFcj8Ryb9eHYuKf3RMkAqtfuCfVbKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c4Vu4kQf; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c4Vu4kQf"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c05533c26aso126622985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739262169; x=1739866969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy53+7YWq60+YCqnliLLcvcpL1WFePHHckn4ON83i/8=;
        b=c4Vu4kQf5IsC3abSAkDcgoWbvbKBA0VfK9DDd5o7TBdGAg+OHtHu2vRNmcW5hlNhqr
         D2AGsB9exwaoFA8KzvSPXh6Uk2UnFkN0LfqunPvaRDwhZoASWpgQii9LDeJJtrK2uJvu
         mEwN8oaCmgfTWv0NYyrrWk/MIy3ErQQ7EL/fh+jXGI8bC5uACODwImk5MN/l0fkdYJ20
         redZg8qXlDavYb7y5EPdhAvAjSUE3KMA5Mhx3kfTyopCbd6A89fdAyfSjP3rewCGDQgR
         hq3fZGyZEgonCwMyuexqVTIXJyWtzNahIpMhgTsdCpO0elddZ06OIPkiXmFBSzdMvBJx
         jyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739262169; x=1739866969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gy53+7YWq60+YCqnliLLcvcpL1WFePHHckn4ON83i/8=;
        b=A6MBPENjb4EkGrCuhlj0Dl0Or0V9ZsX34Fc3pZSNf5pfBKRS3Dtvy2itu2TrG4xj1B
         69YwZXqhnxlpTqo8I40zl+ZUQmQA3aoiDBDVLZmOlVvm15gQzxCk5e3QJSb0Osc+Scd4
         ZpfbzV7mb8PqaCfg0ROdKQ/qzOgz0EV/w9dR97bt5b49oUo15PqX+2plmdXlAlegZ4TG
         fgASNPA7aF78J9Toyha6EDVe5Ff8AaBYxIcuj1fX5/0T65Cf0MQLJyAjy8irk7Ff8Br8
         UwRzSMDKGhkktroANYwJUeP4mceFmTX9nmRPO4q1tAK4foCscziGS1ph9XFHL/iyCdQ4
         inrg==
X-Forwarded-Encrypted: i=1; AJvYcCV8l70Pf1lYeFrGwZ9mFRCc1iskaC0aJriT6Wmk/a7YFVH7TSyF2yARpOAW5VXvgh+fI62AH/55WY91Tg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVP0hyL/HeLE8ulWg7lEmn2uJ5vcMDBq1PUZ5zuuIdpTVpXI1U
	YPb5HQd2m9s+lfXRI64rfKx0U/PZxJcae7LcpZOqpx5fm+pzDc+NB5r4iUz5Li49/Xqs0eXoaYW
	FqwX/v611QObhGJyC5H019qkv2na/AtiWNWDy
X-Gm-Gg: ASbGncsVFL2zq6DGmBm0kj61ZMSXUqXPKplnWfx9tct0fmqfbQ1vGQK0SONCQ6GGwG3
	k4V+6+Po3+9+dGZZNT4cz+GuACe588n2zvuY18cDrYjSWKapXISLKhXge7rLVz3WVebNsR38EoS
	ObmuS5MAgLcmowWZqxhoA881RpVg==
X-Google-Smtp-Source: AGHT+IHwF0wryvqqm3Up6z7YvEwhZgV5NvrvHjMQJCPE3EtfGqz7RUN7DJJD/KdadV1iSLMwtxyS2ed3VaZ1pKJ7000=
X-Received: by 2002:a05:620a:2602:b0:7c0:34cd:8d45 with SMTP id
 af79cd13be357-7c047bc7246mr2731914285a.31.1739262168675; Tue, 11 Feb 2025
 00:22:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115083215.2781310-1-danielsftsai@google.com>
 <20250127100740.fqvg2bflu4fpqbr5@thinkpad> <CAK7fddC6eivmD0-CbK5bbwCUGUKv2m9a75=iL3db=CRZy+A5sg@mail.gmail.com>
 <20250211075654.zxjownqe5guwzdlf@thinkpad>
In-Reply-To: <20250211075654.zxjownqe5guwzdlf@thinkpad>
From: Tsai Sung-Fu <danielsftsai@google.com>
Date: Tue, 11 Feb 2025 16:22:37 +0800
X-Gm-Features: AWEUYZlaB7DolovRgG_sbTNH7rlKChKxnzB4vEI2fXR5Ci6XWsGjDCoDwuPAams
Message-ID: <CAK7fddAZd2fmxC06N-CCKjeH2N2TZ=0_6UyyZ=fCquXWcaGPsg@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: Separate MSI out to different controller
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@google.com>, 
	Andrew Chant <achant@google.com>, Sajid Dalvi <sdalvi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Because you cannot set affinity for chained MSIs as these MSIs are muxed t=
o
>another parent interrupt. Since the IRQ affinity is all about changing whi=
ch CPU
>gets the IRQ, affinity setting is only possible for the MSI parent.

So if we can find the MSI parent by making use of chained
relationships (32 MSI vectors muxed to 1 parent),
is it possible that we can add that implementation back ?
We have another patch that would like to add the
dw_pci_msi_set_affinity feature.
Would it be a possible try from your perspective ?



On Tue, Feb 11, 2025 at 3:57=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Tue, Feb 11, 2025 at 03:16:11PM +0800, Tsai Sung-Fu wrote:
> > Hi Mani and Bjorn,
> >
> > Sorry for the late reply, we just found out some problems in the patch
> > we are trying to upstream here, and figuring out it might not be a
> > good idea to keep this process going, so I would drop this patch
> > submission, and come back once we figure it out a better way.
> >
> > BTW, May I ask why upstream chose to flag this driver with
> > MSI_FLAG_NO_AFFINITY and remove the function dw_pci_msi_set_affinity
> > implementation ?
> >
>
> Because you cannot set affinity for chained MSIs as these MSIs are muxed =
to
> another parent interrupt. Since the IRQ affinity is all about changing wh=
ich CPU
> gets the IRQ, affinity setting is only possible for the MSI parent.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
