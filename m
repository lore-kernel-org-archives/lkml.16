Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185928A71B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428990; cv=none; b=G5uCrldmsiARAn8UEYEI1lW/sDShgrYoK+QIUWYiBTNGx12S2wYUnsuEAQeGhWGMwb5zCmsMom5VAAKOF+XT3ZJFSO8rgT/W7c31K+5r2S0llmocx1asz8ti7Qog0eyfoJSWDuiGe1IBJo3R3YsSIIlyfek2RL3Zap8Qt6QwLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428990; c=relaxed/simple;
	bh=0eYSql2La0KiT4uj53uL7zKSU2FoJXGT3qcpBAi5Qfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTmKz7smoTUtIRz2rtm60dDmy0iw1EkYNGAlXyfXkuvxb+nF015u9h2phI80fN60C0NQzT/Rr+Xnb0rvFEmcQl+Xv89mdYZxds9sTeIq2hBgN/wVPf6shgXvnQuvoAVI+KkXVmjDmCdwLdIpk7w4sGdIyr7XPOgGF6HAtW+Ey+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=aBE44qgM; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="aBE44qgM"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2ebb5364e5dso248112fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1750428987; x=1751033787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aH+2cNmUyOyiYQl2KGLmPGobUxyHcHxzMcE4912J3o=;
        b=aBE44qgMOZlwt3TpUAYqUvGEdHO7gPbMafMVsYkXRD0XrZzy0AGS9w/0IIQUhJxCur
         4CPJ8BGZahdC+QaOIOn8+2sTA/exAL3gd4f75hotrpOK0i4e0Qc6Kdxp4PkXU6yDUONi
         o69IWHSeffa3MoPl2X+a7m3WQHYBbKLI3go3Aw30wbHabxlQ+qXYGVuD8PHAXH1wKWpB
         AdO48P5rrwfbMhOYTivjegcCRYrvSUhta+UsWWUVwM5eKZnU3cCkkBYeb1O63vqzvY/x
         o4adarny060pVl0zijV7cjMfRJMmCKT1bzGxWdCCQ4Vhr4yvmKBw1dqeQlVsXl6pqMv+
         BvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428987; x=1751033787;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aH+2cNmUyOyiYQl2KGLmPGobUxyHcHxzMcE4912J3o=;
        b=pW1IY76PEhtnU3CHf7nfxdOFXu6OzAWPor2B7BL247tTUO4NqKfK+bkgY3KoEN9l6w
         qshUR104h8WbCTNEEx+BmkREZO1d/pnCHwBD4/HSTXsYLp8OVFHfTmW74aBhxcpeQbdZ
         tD6U3hsPT2ojw9YkDHVmL4E874H/UjVwiT2i1wYXAZR8tLYEj3rhCpyEpa5GelaMN228
         onQsx4IzLwWTHQSzMXdA0utzd4VmgSjr7WecCxBA+02243cFQmA6stlKGH+9xE5hFbEm
         Jev/MJNT5BdkDd3Z86wS8bZvfv5/HTTYqafNK0Wv4yXFghL39rTGMXzo6MIj4RIAjdzx
         7ssw==
X-Forwarded-Encrypted: i=1; AJvYcCUtYzMSz7VZMtuHwpLlvD7hOiboEE36KK96WMGgvoew0TIGir5hTeXsdgSiCM9TFZeAeNhl2l+AozTTdIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Hxf/3P08R18fmyrIcVzbUOHYAl75nBB+Hs+CFA0FS32Yg51V
	8HVS+VF72UuOxcfDHVmvXjBRboOT+33mheTeoYuTJx+yjnsO3e9fO9dWW0EPkVtdzaU=
X-Gm-Gg: ASbGncupaRZQJu4rnOle3p5QN70vXEHxKGrzpSRIxGI3lwHOIAMxX1V277UVP1dMBWm
	b777LzSyjTKe1Cks+6UIBDvqFjwB7SG0VUcBMm2/LTQCpTGPJVYKD5vaRXEYZoHc3wc/31eptlr
	oBDr/YDJKiL+B/Hkoow6QPQU7E3qxaL/jqlaJl+PVBzOC54rJSl7ojO5e5EAzPcg4bLXuh6xrjQ
	LIOCmTD/oIY/mt55ludItgZuJeQJ+fPur4l+92yKT701JWwjmq5I1qis4MWuULBtJsDz2kWC4Ne
	/D6BPaEKM55iOQ/fqvUOdDAbfREY39N5mu/I6sCUGJZfe+fKhXOVQy3YsYZcm+3f
X-Google-Smtp-Source: AGHT+IEyVEKaYFNzOB5m3adjaYcIXuQfoB2jpkcttyrE7eoYNv7vcwBFuSg4LwGbxAoOYgodpWz8Vg==
X-Received: by 2002:a05:6870:4584:b0:2bc:7d6f:fa85 with SMTP id 586e51a60fabf-2eedfc5d96emr2347233fac.16.1750428987163;
        Fri, 20 Jun 2025 07:16:27 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:680:2e07:b628:1be4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee66559d90sm403237fac.12.2025.06.20.07.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:16:26 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:16:20 -0500
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
Subject: Re: [PATCH v5 0/3] LoongArch: Add Loongson-2K BMC support
Message-ID: <aFVtNAY4u2gDiLDS@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1750301674.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750301674.git.zhoubinbin@loongson.cn>

On Fri, Jun 20, 2025 at 10:06:26AM +0800, Binbin Zhou wrote:
> Hi all:
> 
> This patch set introduces the Loongson-2K BMC.
> 
> It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> And it is a multifunctional device (MFD), such as display as a sub-function
> of it.
> 
> For IPMI, according to the existing design, we use software simulation to
> implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.

The IPMI portions look good to me.  You will need acks from the MFD
maintainer and I can get it in through my tree, or I can give you:

For IPMI portions:
Acked-by: Corey Minyard <corey@minyard.net>

and it could go in through the MFD tree.

Thanks,

-corey

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
> V5:
> - Rebase on linux-ipmi/for-next branch.
> - Rebase on linux-mfd/for-mfd-next branch.
> Patch (1/3):
>  - Rename ls2kbmc-mfd.c to ls2k-bmc-core.c;
>  - Rename MFD_LS2K_BMC to MFD_LS2K_BMC_CORE and update its help text.
> Patch (3/3):
>  - Add an IPMI_LS2K config in the IPMI section that enables the IPMI
>    interface and selects MFD_LS2K_BMC_CORE.
> 
> Link to V4:
> https://lore.kernel.org/all/cover.1749731531.git.zhoubinbin@loongson.cn/
> 
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
>  drivers/char/ipmi/Kconfig        |   7 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmi_si.h      |   7 +
>  drivers/char/ipmi/ipmi_si_intf.c |   4 +
>  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
>  drivers/mfd/Kconfig              |  11 +
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/ls2k-bmc-core.c      | 485 +++++++++++++++++++++++++++++++
>  8 files changed, 706 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
>  create mode 100644 drivers/mfd/ls2k-bmc-core.c
> 
> 
> base-commit: 8ffcb7560b4a15faf821df95e3ab532b2b020f8c
> -- 
> 2.47.1
> 
