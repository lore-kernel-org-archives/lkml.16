Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D866420311
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861701; cv=none; b=S/aWeGR+uTZ6NfFoznNBaVY6i9JHFhhtgm1mP4qXfc1vM+ls3ljfx5MvHdWHmhVT/ENGLzNeiXlPvJD5SpZBFX9Qp0fhDWuQPSTdDCSE3bFnvCf/QY7OmfSGIvIZdDMrFtfGXr0fickdTXrI/hEqDc7y9BIrWjbFVmawThflESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861701; c=relaxed/simple;
	bh=N1MFp6BCI3TIq2cvJeasttvs0xi1dLDQjQSO3Bd4Zrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY5OOLSf/brCBi0bt49n24wmfeO3laysxx+ILTzti0l6qzFq7h2bfMS7sjdknldsTz11seS/udSZOIQk5LtcszBomsA4IFUdUSaWuGE+rYJ3TjRmue930O0ZucrNuPrLlZB427HvRQ6Ck2vgyrPYAHntnd7gQCAFEIGwT/G/cq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=PvB2Pd3I; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="PvB2Pd3I"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-735a53ef4feso1618504a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1749861699; x=1750466499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5NgXkXYPRuWbOpiUNMO6HgoGZd6uy5e0WlDRwFP97E=;
        b=PvB2Pd3IqUUrhiDafqtPvM7cipZtrZT8yk3zcZaJZzQB9JtYLmScWhJvvCT6i3zDcD
         VHgN6eEs/s/qFNDO1j2KlQZLOsvY6T1E/7+gcruXNEmUsDLGGLymwMFWOdDG3OqWufYY
         MDkaNeE8K797HR5XGcFJ6+nv0l2ZQ6HvNf4nTCKmuFZedJp5AL/MmnQwCttsvFUYICLC
         O4WvtGcApFNpeMDX3V+ocObsn/k4oiEL6JmpA1NJfUd1unErrxTLk+eDvPVUpEJr1xUd
         p45uR/3DT71KVWo2fdd7F0p/vFkCBHrEsKBISSNdDOCUToV0WtIbb+bJ5yTSZWPMEztl
         Hr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749861699; x=1750466499;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5NgXkXYPRuWbOpiUNMO6HgoGZd6uy5e0WlDRwFP97E=;
        b=szvd4FIKm0xdeWmxNZjzePY/n+PKz2HwilNP/m3riNJLm2C91VnmLnB7lzG6XY9aDq
         Ag+MC2SHBJsMPnH4Prn2SZQCDRemogy9N67KD31hEfmu4EVf5MCOuwcByibeSkXxh5pC
         mX0Ag8NBX6lKIXYRP2rQFbtrhTcHPE5D9GQNvMj14PO4RD+wi7Dje7lX47VHv+kAfj3H
         CFd+4MzUfw3LYT+8AXL/JIFm0dgdmeejB0+jraF2N5wBJnBH7zgVNtirXEHJGS6SPfEP
         //FMF3W9ctcWrn0yZZhad5cAFSsWIwiKGMYTDyvHYGUsI8spc2hXAz8184zObfnUMSkb
         2UdA==
X-Forwarded-Encrypted: i=1; AJvYcCUjwSizcxmy+PBEslDXchcbQHTYZD19raXb5ijEnbPZkPGmiMVopP8PKQTo9+kAZNnGni4l/SOpLHsEdmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gcHSJ1hmIW1KFEd/YloYjL5+tn2htGpv7at8d3P6s5AT866r
	tYXJbhk/MTmSm2yVPzMQlEMzHA7urWCenL5dBMFyDivK+qINw6FI3pv6j82P5yLwBeU=
X-Gm-Gg: ASbGncsMhwUXKLI9U2tavbjZ4dU6U726ZwVQvWZUNmBG/7dVbxeyKGbT10g8kI4xfG2
	dWdhGFXETZY1nK2n1IMKpMe0lXJ59yOVlUFvLxOWpQFRikQ2Rqv5zk3Pk0Py2MaAj5etmJTEsy7
	4OARvJxZz1qtMdkIqTLNZwax3+cRzgFFVQRp+SWK1dwpiqHxhEobzj2rs0wWB/mQ9G4RWNhMqtX
	nSjwXoHwSIYmpw4Mir/+REgN14QGWU8yBtnb4752LbCHbYnReophGIYeE7oiCXaXvncFmUGbitf
	/Vn2WY4JhbnunG1MrvPvscQuz7Mrc7GX0MP4XpgnmK46BK7Jz7/yvmXfB8+veSwzAg==
X-Google-Smtp-Source: AGHT+IH4htV1XZAM2fhjqi+RYSUf/curz1PkLjtyD8jI7j76IZ4AV/PeMuWUKVsn6dUMPlbPKxtGjg==
X-Received: by 2002:a05:6830:2c06:b0:72c:320c:d898 with SMTP id 46e09a7af769-73a363f5a90mr1189572a34.22.1749861698810;
        Fri, 13 Jun 2025 17:41:38 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f41f:8468:bca8:a5f7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403c08sm402940a34.25.2025.06.13.17.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 17:41:38 -0700 (PDT)
Date: Fri, 13 Jun 2025 19:41:33 -0500
From: Corey Minyard <corey@minyard.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
Message-ID: <aEzFPdYEvbkaH_B5@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1749731531.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749731531.git.zhoubinbin@loongson.cn>

On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> Hi all:
> 
> This patch set introduces the Loongson-2K BMC.
> 
> It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> And it is a multifunctional device (MFD), such as display as a sub-function
> of it.

I've asked this before, but I haven't gotten a answer, I don't think.

Is this really a multi-function device?  Is there (or will there be)
another driver that uses the MFD code?

If nothing else is going to use this, then it's really not a
multi-function device and all the code can go into the IPMI directory.
That simplifies maintenance.

If it is a multi-function device, then I want two separate Kconfig
items, one for the MFD and one for the IPMI portion.  That way it's
ready and you don't have to bother about the IPMI portion when
adding the other device.

All else looks good, I think.

-corey

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
> patch-2: BMC reset function support
> patch-3: IPMI implementation
> 
> Thanks.
> 
> -------
> V4:
> - Add Reviewed-by tag;
> - Change the order of the patches.
> Patch (1/3):
>   - Fix build warning by lkp: Kconfig tristate -> bool
>     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
>  - Update commit message;
>  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
>    Makefile.
> Patch (2/3):
>   - Remove unnecessary newlines;
>   - Rename ls2k_bmc_check_pcie_connected() to
>     ls2k_bmc_pcie_is_connected();
>   - Update comment message.
> Patch (3/3):
>   - Remove unnecessary newlines.
> 
> Link to V3:
> https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn/
> 
> V3:
> Patch (1/3):
>  - Drop "MFD" in title and comment;
>  - Fromatting code;
>  - Add clearer comments.
> Patch (2/3):
>  - Rebase linux-ipmi/next tree;
>  - Use readx()/writex() to read and write IPMI data instead of structure
>    pointer references;
>  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
>  - Drop unused output.
> Patch (3/3):
>  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_initial();
>  - Add clearer comments.
>  - Use proper multi-line commentary as per the Coding Style documentation;
>  - Define all magic numbers.
> 
> Link to V2:
> https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn/
> 
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
>   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
>   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
>   ipmi: Add Loongson-2K BMC support
> 
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmi_si.h      |   7 +
>  drivers/char/ipmi/ipmi_si_intf.c |   3 +
>  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
>  drivers/mfd/Kconfig              |  12 +
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++++++
>  7 files changed, 699 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
>  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> 
> 
> base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> -- 
> 2.47.1
> 
