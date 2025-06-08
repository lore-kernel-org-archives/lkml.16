Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2AF15D1
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749368131; cv=none; b=V3wW0bZREAluqTVVT5KSeZGQ73KvpXQ+OlMIbN/vWm/6jfcfijftctUcNsO+Mhc6lH8AAvvRc83XAehGWvcgpeERQbo6nBRN8C+7GoG09xoXelikkobH+ufWiJxFS5VYcpdKHNIV18B58nQKpkzEDqGw2GgE2rFP+yt2ZmR/So8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749368131; c=relaxed/simple;
	bh=kFOysKXG8GqTo4p3fFuz9+4KW4EIctx32RHzxS6qN+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uqu/c1bDTYoB92laVcvT6aMX9u83hJ4uWQhPyfRLWrIQoO1l4oSCWeQl7a78umvx8GLHhtTh231gWQwkOyy5irKO2FKhXMeZprCKjlQPQtc3D6Hr+yZcNglMDYAMJD9phaGG5JHab48ZBlt8Xb1Un481VXxndwoNDbdwVTCPrlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYVdAu0J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYVdAu0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFF1C4AF0B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749368130;
	bh=kFOysKXG8GqTo4p3fFuz9+4KW4EIctx32RHzxS6qN+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pYVdAu0JAuSLlkJBhgrHfhWdCkEE2K8yKsOkDOUTTil+d96yCCvSa+IX7+EqOOY+C
	 zQRDypLyMfBgrToqv3etEFhsriXjkSbqSllccnRBkiBeasWVMdO5t7g9DHHafQdmSA
	 BxxiEfSQ3sYZgBYhuFDXMCVYe+bpP4i1S4YYxIQFP84AxnfovXFOs4dE+OPi4M58tt
	 cKaAnpqiCC6oPmArMgRKsRkiCFwL2gDkhoFuFjSQVpZhwIbOV+HZcfFJ76I5SQDLOd
	 tweXFFnoNDTxgVhIUY7CHeocA+Zg3DWGjVtTaO3foYePZLoHCBIR/M0cqUyyed1dvG
	 gPOFg9/CcJ29g==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-606c5c9438fso6509171a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 00:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXt3vGh1Iv6DDKaiSl7rIEQopQqJyB+J6iBaU0aiEgC+8dEOjg1hGWfZR9n45sUj0Umxyh4eanVXGcHC3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvCvdaACVxdoYJhqeDOOtwGGGT/F66cMMtEHyo2bnjlNSYqnrb
	TCGSTBwUOJgSEoICmQ8TKvQa4epcI8ubRds4URLWFWMpGR7njSfm6K44uCU0Z0wMWBznOoKKu5f
	xv+MhyZJrsAShff5MF36Q12hV2p/z6ic=
X-Google-Smtp-Source: AGHT+IGXHk1U6rfYExFO/mc0/QqUnhoSlT+XQ9nCDnVpXOz/KSZJJ+E759KnH9foQHa4JG334VcHcgsqPOhLN7knhkg=
X-Received: by 2002:a05:6402:174d:b0:607:783e:5970 with SMTP id
 4fb4d7f45d1cf-607783e61fdmr5725488a12.8.1749368129125; Sun, 08 Jun 2025
 00:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1747276047.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Jun 2025 15:35:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7kbuJfoUbD3XJVwpBZjcYtHZ6kWhFwu4HGjno6gkmSYA@mail.gmail.com>
X-Gm-Features: AX0GCFtdqkmwOqP8bVELz2Njdxh0gmwMM1ltahpWIc_beMymoC73koIQh5ivYvo
Message-ID: <CAAhV-H7kbuJfoUbD3XJVwpBZjcYtHZ6kWhFwu4HGjno6gkmSYA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: Add Loongson-2K0500 BMC support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

I have some small comments, you can add "Reviewed-by: Huacai Chen
<chenhuacai@loongson.cn>" after you make changes.

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
