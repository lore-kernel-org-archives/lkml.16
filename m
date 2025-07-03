Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D1678F3B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508462; cv=none; b=L67b3J5x/fc6KGKYqqcfFd+BqDaAChOZFVDab/vpKMrfAoaGLuo1zXCmEwEsxUaeiE/k/BxSMt9eI7G1Gw1vj8iHH8cR5DlxR/Q07HH59/lFpwTTDHQElXMSoNY+oqOUfl2aX8BW0i2dJ46C+xKI1nPxxy5CCkOi++dTcNOZdGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508462; c=relaxed/simple;
	bh=24G3epBX1KBvYzJEf8cy04InC7gA20oodLz2dmjVIc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFeaYznc9PK2q12mgn99l7OZKRu/JdxC6UXLU+Xq+N/DgVxqjhLCPtOIN8sGZUi4kkt+5bfmNqPSrEC7IN+6F7iAlFRkLFpP78tp/DwDJybnvFJNLiCWbDk8xePe7UrYXnNbTMpJnQKSUjyCMx7zKWxvm16bRvGTfeHyUnjlsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AL/j4SVL; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AL/j4SVL"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so1077938a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508459; x=1752113259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzkypJTa2aDOnGhEUSNksvIYvW5r2jEVvJtvSkexsCs=;
        b=AL/j4SVLNLL1efqkKeC/PXEVnBZ9N2dy0llDrZrvqpG/kiFtcEz6eangSpdY8jtRbR
         TkuqJPeM9DBnV3+AsxfFmwnPDsbyATveIfN6OC4tiRUmXnmoYx02MTLQ9jjRDkcaX8L0
         Xfkqqgp/t1nGMKDH4Iq8NcfyxSPjUNzOmMsKmSJSxNbfaAFBrVgjUgbFVQUwWehBdSb9
         IuMClnXu3lj19PwUzYBwUL1rsC0P7Rpthc5WXV+yy8rLiEQlDvFEJJZxjscsAKqIBzon
         MOEljj1gLgbRgwDfIkMKtltVfIPxMCDmd64MR7ztXO5p11pE9S+rKoR4EcbswCKBmK0t
         7UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508459; x=1752113259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzkypJTa2aDOnGhEUSNksvIYvW5r2jEVvJtvSkexsCs=;
        b=M71rMjD+qqkLmVw2L2+r99fGvmPRMSH0p0xVDwLoicG7VV2LQLGA6/8iDA66VLvzlR
         ppXVvDW3Xop6D3lHAuNy+1/JgS0uEPAxVroB4G0J6CxX8fzBScsB+YKGUmBWffUTcPXg
         I8tK/u/sjYZIeKghs1jxi5qvR0VTQ39eB5t0YUQyCpXZdCG5MZxFFYLAWLvw11gLZgkM
         pHHHiCDTCl2z4j0PhMnAJi8pwq90hhok4fxKEjJ6MzJPW3tPB0fXFPz+y1BpQ30Qr7GZ
         FWbVcPDIhhbZPQjmTgvDsXFNxW4qtnsHUMbyFYr5DuDMSL7gidiZQNrBWX9KjAqtjC7k
         cGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtC6knYgyiRU3y4mHlL3fftQQyQB6OV1WuWCGe//a1QF67IuK5bF5Nw6lb84CxLlTHcQBuJjdHU/4OTOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxopAaFodYdlm0TGSOgIxP10a6fMPW25y3hedRGayD3MHODIYVV
	cZ2eZzqfaLzyi7AXLidShHJtK8kc/QU3CvBpKN7WzkVc1xLdwRHgAnQKKVefiSSI4XNXR7fSouQ
	tHViitppha/IgOh4rnmL9GVxTuD7YaWY=
X-Gm-Gg: ASbGncvMWgdnCeK9zl+e5zYRMfxCRLzAuCiuITiRi6CG9KCsaQXw6leK9H9U8CQ74ne
	srJCFVkYbQFMoZTNrVSteuaHWF4NlJPh0w+lCnvDw7jC7xG4XKS4oCBx2TnhEiFfo8cOt+HMmfo
	Fa5yoxrkwSd8V7A4d/gfpYDL+e6eQ/b8CyRrlCEkwhfQ==
X-Google-Smtp-Source: AGHT+IF218GiZpeI/D+rXXzILlAv1cDE70/cS0aOmmY37xRfNjnVhepbNq4j1eM5FlQuPv33Nwb46LfderGxoJgZ+S8=
X-Received: by 2002:a17:907:1c97:b0:ae3:c777:6e5e with SMTP id
 a640c23a62f3a-ae3dd25aca9mr88160166b.19.1751508458811; Wed, 02 Jul 2025
 19:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <78b06d1c7ae0677868e0c7498b589af163313c8d.1750939357.git.zhoubinbin@loongson.cn>
 <202507021011.sDAHGinj-lkp@intel.com> <20250702162318.GZ10134@google.com>
In-Reply-To: <20250702162318.GZ10134@google.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 3 Jul 2025 10:07:26 +0800
X-Gm-Features: Ac12FXxvQYgSR_pb1CaQhAd5356-n99IGXBSgkWflU0a6alpsxti5PcQ-gLfDuE
Message-ID: <CAMpQs4+hrJ8B4wZRmCH2T7wLAwnmD8_WH2OpNLWH64AbanZ-pw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
To: Lee Jones <lee@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Corey Minyard <minyard@acm.org>, oe-kbuild-all@lists.linux.dev, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee:

On Thu, Jul 3, 2025 at 12:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 02 Jul 2025, kernel test robot wrote:
>
> > Hi Binbin,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 3d77b3cc7cc8115d89fa14eaf601e56372953484]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-=
ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250626-203353
> > base:   3d77b3cc7cc8115d89fa14eaf601e56372953484
> > patch link:    https://lore.kernel.org/r/78b06d1c7ae0677868e0c7498b589a=
f163313c8d.1750939357.git.zhoubinbin%40loongson.cn
> > patch subject: [PATCH v6 2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset f=
unction support
> > config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/2=
0250702/202507021011.sDAHGinj-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 15.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250702/202507021011.sDAHGinj-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507021011.sDAHGinj-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/mfd/ls2k-bmc-core.c: In function 'ls2k_bmc_pdata_initial':
> > >> drivers/mfd/ls2k-bmc-core.c:349:15: error: implicit declaration of f=
unction 'acpi_register_gsi' [-Wimplicit-function-declaration]
> >      349 |         irq =3D acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSI=
TIVE, ACPI_ACTIVE_LOW);
> >          |               ^~~~~~~~~~~~~~~~~
> > >> drivers/mfd/ls2k-bmc-core.c:376:9: error: implicit declaration of fu=
nction 'acpi_unregister_gsi'; did you mean 'arch_unregister_cpu'? [-Wimplic=
it-function-declaration]
> >      376 |         acpi_unregister_gsi(gsi);
> >          |         ^~~~~~~~~~~~~~~~~~~
> >          |         arch_unregister_cpu
>
> Is this error valid?

Emm...

This error does exist if ACPI_GENERIC_GSI is not selected.
I will add this dependency in the next version.

depends on PCI && ACPI_GENERIC_GSI

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--=20
Thanks.
Binbin
