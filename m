Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D53021C171
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984954; cv=none; b=Vdv0C83jf5Jt4YLrFCiqMDeiKzHFf79dS0c+12k1MrZ1l83RRi2qA7nof39xdi61j6eSM+BiSG3K2cSD+ZqD/FlP5SaoGL1T0ArVtZpY7S/loEkY3iWEEuCDkJEGxZC+AxCu0seXIytEh+gAH2WG0gpehHMYCkIz2MdM52bukQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984954; c=relaxed/simple;
	bh=tuioU+OPVB/j+l5HhU9lH6WKAt09AxviKSoCNdWubi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6FDNOYIEQKNewQlW8wGXfUIoZgeLjgl7wYb9aJYw8942zAgkPMNkJn5xA0yovcNpu60zZbXE0EEbEWf+x2IKtYHguZCRcT3ZeYvhjVbmF6tjlbYMiaIZUzHAAtLVEWG9vQVVCJoV/InvkHDXs57A/VBxrpPxxelTuzMyzIED+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeltacrE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeltacrE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F783C4CEF3
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747984953;
	bh=tuioU+OPVB/j+l5HhU9lH6WKAt09AxviKSoCNdWubi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BeltacrExPsoF+lh1Mmy9NjESoueGiFkD4wMBihkl68/+uu4ysdSIMuj3jyzFQj0E
	 WDGrOp/H7km/ZFFT4X8lstCAI0YSANYWy2mpniZ9JrTkj+p7KnPmEfYGiuaYwdrNnY
	 HPDZfKI62Ygb2xjPM2NvZoxTOZMCiaDqZ6mNWefYSKh7LuF8QtHFayiQ+AwPQr1oiP
	 v/sEV06+RHmqL47AiGItuPPZ2EeLFa65SzaZ8BeOAX2a7cgVSUq+gf21cmYR66zxhy
	 4QiDZoZVzLdJ53GxEU+ZRJnTXKswghb9nUsy9of9T91Ib/h/j9ltZhNz4pa1tWUeSH
	 bK0GwN1WsZ4nA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so1604782366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:22:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWizW6U3Tb1XnZApawS5+uiCUA0urCk/YZ3cq5vZ6RNgtDmRiiYevRTFHZ6qgu5M4ypIC+FDjYYjAvaGJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfIRn2ASwS9/CU12itQ6Oj33HEl11jp0Ti22avCc/DPUviFoIa
	Lw/HCJBtCqBAzUCXUstH+Zh6h+zA0yyiAK80Bp6m9oLpkPBTGQU4INE7r5v8la4dj4LFPEkPLxM
	DgDfEyMuwBAwyUZeY0wxv5Y7pn1mxu+w=
X-Google-Smtp-Source: AGHT+IHQTgjtXnc5cnWqsIAsDU5VMGNpE+2kQItoslTSc2AwaPLsqSiPdWKMx+kg0u+W2t4nt9DBgyN4BYwQ8oMDFT8=
X-Received: by 2002:a17:906:6a14:b0:ad2:46b2:78b2 with SMTP id
 a640c23a62f3a-ad52d4c49b2mr2573495566b.18.1747984952212; Fri, 23 May 2025
 00:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1747276047.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 23 May 2025 15:22:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4R+A6BMcyXfZDGy3qRj-fht_0bhnTxsTjV1Dn+_j7Pwg@mail.gmail.com>
X-Gm-Features: AX0GCFt6kbI6guhdzdH99UqXfBs9OSW8Xwu6Z9QBglM8mDcsOlWvTRv1GT_WMMQ
Message-ID: <CAAhV-H4R+A6BMcyXfZDGy3qRj-fht_0bhnTxsTjV1Dn+_j7Pwg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: Add Loongson-2K0500 BMC support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

The title of this series can be unified from Loongson-2K500/Loongson-2K to =
LS2K.

Huacai

On Thu, May 15, 2025 at 10:32=E2=80=AFAM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
>
> Hi all:
>
> This patch set introduces the Loongson-2K0500 BMC.
>
> It is a PCIe device present on servers similar to the Loongson-3C6000.
> And it is a multifunctional device (MFD), such as display as a sub-functi=
on
> of it.
>
> For IPMI, according to the existing design, we use software simulation to
> implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
>
> Also since both host side and BMC side read and write kcs status, we use
> fifo pointer to ensure data consistency.
>
> For the display, based on simpledrm, the resolution is read from a fixed
> position in the BMC since the hardware does not support auto-detection
> of the resolution. Of course, we will try to support multiple
> resolutions later, through a vbios-like approach.
>
> Especially, for the BMC reset function, since the display will be
> disconnected when BMC reset, we made a special treatment of re-push.
>
> Based on this, I will present it in four patches:
> patch-1: BMC device PCI resource allocation.
> patch-2: IPMI implementation
> patch-3: display, based on simpledrm
> patch-4: BMC reboot support
>
> Thanks.
>
> -------
> V2:
> - Drop ls2kdrm, use simpledrm instead.
> Patch (1/3):
>  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
>  - Add resolution fetching due to replacing the original display
>    solution with simpledrm;
>  - Add aperture_remove_conflicting_devices() to avoid efifb
>    conflict with simpledrm.
> Patch (3/3):
>  - This part of the function, moved from the original ls2kdrm to mfd;
>  - Use set_console to implement the Re-push display function.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (3):
>   mfd: ls2kbmc: Introduce Loongson-2K BMC MFD Core driver
>   ipmi: Add Loongson-2K BMC support
>   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
>
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmi_si.h      |   7 +
>  drivers/char/ipmi/ipmi_si_intf.c |   3 +
>  drivers/char/ipmi/ipmi_si_ls2k.c | 250 +++++++++++++++++++
>  drivers/mfd/Kconfig              |  13 +
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/ls2kbmc-mfd.c        | 398 +++++++++++++++++++++++++++++++
>  7 files changed, 674 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
>  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
>
>
> base-commit: 9f2b0c15b752bb940e2eb6737bee30fff96d96b6
> --
> 2.47.1
>
>
