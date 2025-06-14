Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25351C5A
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749878734; cv=none; b=HdjwKqqau1rmlGYmcq/MOvpeeeq2Rpr7hoGcCtLtbDIFzGNR6sqI6Qwcc2GuYLut2Cg0gv3ylX9uOr6sikJ0VHEm8CUzorIfegBqF7lMo0crBjuPcJYLUGgiTslMA5UktGX32a4lg1rI71syLgwl7kky4Xd3ipe72KncV3filT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749878734; c=relaxed/simple;
	bh=5/WwZpSs926iuBmq78HpNtNXcOe3hg641ZXWSzUZt2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lbmqNbpdykdCvB4t1NvFm+D/yMj1D1PYIIVCCa1C2eUjNAolIMKDMlD6/AWHwqIbBWQvwat2NiH/re1CRREJla4b/q/zMlgg7W6d0VTU/fTMK2HKhLiGVqmF1SPTkpGIYyR4iqIVgANoCQesIesmtfobuEJU4FSQij5JyY/WP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grn2BOQR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grn2BOQR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade4679fba7so508529466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749878731; x=1750483531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRJTDRHieaRf/TffBu5Atm9p8Td7XJLJrU2a/+g6SuI=;
        b=grn2BOQREI2II3DgmDhDbik5WLD5hO/wg/CJsPVxZQyqgBOGm50odzsIZCbtGnOz2T
         AkaB5dgZVzE3aOyhRV8NrcCnfxlujAbUotZ8StScW6inw/d/sg4zcNWrMhXMjKginY3z
         UXda7NU2H4HxowHLqtEfZ9lm49ptcZpdYYPh6SmFfdPfJFS8RId5XV7OuRUN7DUpLyUs
         A38Tsq85gbcpIXz97xekOTXBHTtaKppqaPyMXVwn4V9MlZwbRHBpTKmxo9gX72hHDMsm
         Z30dl3Yc1CknaJ5OpbiQ1Gjw47VMyEOIylc6rJ+kWGG9chf01xhJUJHS284UjCnYLLl3
         EVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749878731; x=1750483531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRJTDRHieaRf/TffBu5Atm9p8Td7XJLJrU2a/+g6SuI=;
        b=RgNv890gGW12f5+FBsVTHq9Mbt/bJvkKRiaiZKmo18P5slYLfA0xjqYC7zKQbjloau
         JluOqEweH8XmeXBkvhQhUxEjfNjZ2OPIJQaFINV+vzJAUN/hu0HeHRXPjA6axmgJeruK
         M9sicyVJzP703MaLkoKnA999MQORqBriq0UAXBOgqdY7s1aBK21iUxhgeU8nBOtRPY/K
         1YiZUCzPPkIF5R0qsIm+VufFrkdmZ1LbAsWMTfHSYiQmk6EeI/P+8HbK31KoTDG+aUP5
         DEHtfr/ZeWAiCD1Ic3CrQpM97eO40zzye1nE1ArxhcmsJh8advpR5rREY5wQebE8qCVd
         U3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEO1roVAUiUcFsALsrHPuEANHblxj+oAiwR4k000zJs4+qlXZ/FUgulttqmTwmiq9tGXR8EX+rxhKodCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFXuQx3X1DrYg7o9R5w3Jadl8eiA/j0DSNOdpFSGcvacNUQb5B
	0bxEv2Zm5MasCz9Se1yaqJurTrLXMIQ1N/UmPmxTltmA+knP67+c92RJv8XtCBKetWgrarb4p5y
	GMLPxwgf8OE1pNFDwdfkdUh9TgSq5wy4=
X-Gm-Gg: ASbGnctfUBV1SKay0+h2rbdZeckAyjSKKQ4wJLBjjlQsvw0POCmE4Ho+fUtG6Y/RHaC
	rzBTumxGjz1jmmEoRg9VmSqE2ocV7I0Wdt9nzBUQFkrXcz9xz83hBYeiBJGJ6G+ivhgMgF7/WH8
	dkUowM2Q+TwiOd4/jO7iEfZ/pQ8XIBwXwWleo0KaSHaSg=
X-Google-Smtp-Source: AGHT+IHapdFK27H53F4XVXiqD5wMcJUfHlJ///sKdlD9/5Ue9114j8LrOjcX8TlQh1+/pEfuEFmB2y4U2d5+1Ip5zI8=
X-Received: by 2002:a17:907:3e0b:b0:ad8:a04e:dbd9 with SMTP id
 a640c23a62f3a-adfad54b342mr146959066b.31.1749878730622; Fri, 13 Jun 2025
 22:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749731531.git.zhoubinbin@loongson.cn> <aEzFPdYEvbkaH_B5@mail.minyard.net>
 <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com> <aEzqbLHSB6phFNox@mail.minyard.net>
In-Reply-To: <aEzqbLHSB6phFNox@mail.minyard.net>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sat, 14 Jun 2025 13:25:17 +0800
X-Gm-Features: AX0GCFtZaBoBTuWDI55b0cLkbbWqbq0R6o1trZvkcvX1DmmxrsUMfvsIDVbdE7c
Message-ID: <CAMpQs4L82x=OhLQJb96ZC4YfT_ZhHcU+zks2r0HMU0Y2fjwsbg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
To: corey@minyard.net
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io, 
	kexybiscuit@aosc.io, wangyao@lemote.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Corey:

Thanks for your detailed suggestions.

On Sat, Jun 14, 2025 at 11:20=E2=80=AFAM Corey Minyard <corey@minyard.net> =
wrote:
>
> On Sat, Jun 14, 2025 at 10:50:37AM +0800, Binbin Zhou wrote:
> > Hi Corey:
> >
> > On Sat, Jun 14, 2025 at 8:41=E2=80=AFAM Corey Minyard <corey@minyard.ne=
t> wrote:
> > >
> > > On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > > > Hi all:
> > > >
> > > > This patch set introduces the Loongson-2K BMC.
> > > >
> > > > It is a PCIe device present on servers similar to the Loongson-3 CP=
Us.
> > > > And it is a multifunctional device (MFD), such as display as a sub-=
function
> > > > of it.
> > >
> > > I've asked this before, but I haven't gotten a answer, I don't think.
> > >
> > > Is this really a multi-function device?  Is there (or will there be)
> > > another driver that uses the MFD code?
> >
> > I am very sorry, I may have overlooked your previous question.
> >
> > And I also may not have a thorough understanding of multifunction devic=
es.
> >
> > The Loongson-2K BMC device provides two functions: display and IPMI.
> > For display, we pass the simplefb_platform_data parameter and register
> > the simpledrm device, as shown in patch-1.
> >
> > Therefore, I think this should be considered a multifunction device.
>
> Ok, that's clear, thank you.
>
> However, that's not really very clear from the patches you have
> provided.  Particularly, the "bmc" in the name from patch 1 makes one
> think that it's only a bmc.
>
> The "bmc" name is also a little confusing; the devices with a "bmc" in
> the name are all the BMC side, but you are doing a host side device.
>
> If you look at most of the other MFDs, they have a "core" section then
> various other parts that use the core.  And possibly parts in other
> directories for individual functions.  I think you need to do the same
> design.  Have a "core" section that both the display and bmc use, then a
> separate display and bmc driver.

If it can be reconstructed in this way, it should be clearer.

However, there is a key point in my mind: if the display and IPMI are
separated into two parts, they should at least be able to be probed
separately, but in fact they belong to the same PCI-E device, just
allocated different resource intervals.

static struct pci_device_id ls2k_bmc_devices[] =3D {
       { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
       { }
};
MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);

I'm not sure if my understanding is correct?

>
> That way, you can use the display without the IPMI interface, or the
> IPMI interface without the display.
>
> I would like to see:
>
> * A core mfd device named ls2k-core.c that has the core functions.
>   It would have its own config item (MFD_LS2K) that would be
>   selected if either the display or IPMI device is enabled.
>
> * A separate display device in its own file with its own config item.
>   This isn't my area, so I'm not sure where this should go.
>
> * The IPMI device in the ipmi directory named ipmi_ls2k.c, again
>   with it's own config item (IPMI_LS2K).
>
> Does that make sense?  I don't want to make things too hard, but that's
> the way pretty much everything else is done on MFDs.
>
> Thanks,
>
> -corey
>
> >
> > >
> > > If nothing else is going to use this, then it's really not a
> > > multi-function device and all the code can go into the IPMI directory=
.
> > > That simplifies maintenance.
> > >
> > > If it is a multi-function device, then I want two separate Kconfig
> > > items, one for the MFD and one for the IPMI portion.  That way it's
> > > ready and you don't have to bother about the IPMI portion when
> > > adding the other device.
> > >
> > > All else looks good, I think.
> > >
> > > -corey
> > >
> > > >
> > > > For IPMI, according to the existing design, we use software simulat=
ion to
> > > > implement the KCS interface registers: Stauts/Command/Data_Out/Data=
_In.
> > > >
> > > > Also since both host side and BMC side read and write kcs status, w=
e use
> > > > fifo pointer to ensure data consistency.
> > > >
> > > > For the display, based on simpledrm, the resolution is read from a =
fixed
> > > > position in the BMC since the hardware does not support auto-detect=
ion
> > > > of the resolution. Of course, we will try to support multiple
> > > > resolutions later, through a vbios-like approach.
> > > >
> > > > Especially, for the BMC reset function, since the display will be
> > > > disconnected when BMC reset, we made a special treatment of re-push=
.
> > > >
> > > > Based on this, I will present it in four patches:
> > > > patch-1: BMC device PCI resource allocation.
> > > > patch-2: BMC reset function support
> > > > patch-3: IPMI implementation
> > > >
> > > > Thanks.
> > > >
> > > > -------
> > > > V4:
> > > > - Add Reviewed-by tag;
> > > > - Change the order of the patches.
> > > > Patch (1/3):
> > > >   - Fix build warning by lkp: Kconfig tristate -> bool
> > > >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.c=
om/
> > > >  - Update commit message;
> > > >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
> > > >    Makefile.
> > > > Patch (2/3):
> > > >   - Remove unnecessary newlines;
> > > >   - Rename ls2k_bmc_check_pcie_connected() to
> > > >     ls2k_bmc_pcie_is_connected();
> > > >   - Update comment message.
> > > > Patch (3/3):
> > > >   - Remove unnecessary newlines.
> > > >
> > > > Link to V3:
> > > > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongso=
n.cn/
> > > >
> > > > V3:
> > > > Patch (1/3):
> > > >  - Drop "MFD" in title and comment;
> > > >  - Fromatting code;
> > > >  - Add clearer comments.
> > > > Patch (2/3):
> > > >  - Rebase linux-ipmi/next tree;
> > > >  - Use readx()/writex() to read and write IPMI data instead of stru=
cture
> > > >    pointer references;
> > > >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> > > >  - Drop unused output.
> > > > Patch (3/3):
> > > >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pd=
ata_initial();
> > > >  - Add clearer comments.
> > > >  - Use proper multi-line commentary as per the Coding Style documen=
tation;
> > > >  - Define all magic numbers.
> > > >
> > > > Link to V2:
> > > > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongso=
n.cn/
> > > >
> > > > V2:
> > > > - Drop ls2kdrm, use simpledrm instead.
> > > > Patch (1/3):
> > > >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> > > >  - Add resolution fetching due to replacing the original display
> > > >    solution with simpledrm;
> > > >  - Add aperture_remove_conflicting_devices() to avoid efifb
> > > >    conflict with simpledrm.
> > > > Patch (3/3):
> > > >  - This part of the function, moved from the original ls2kdrm to mf=
d;
> > > >  - Use set_console to implement the Re-push display function.
> > > >
> > > > Link to V1:
> > > > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongso=
n.cn/
> > > >
> > > > Binbin Zhou (3):
> > > >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > >   ipmi: Add Loongson-2K BMC support
> > > >
> > > >  drivers/char/ipmi/Makefile       |   1 +
> > > >  drivers/char/ipmi/ipmi_si.h      |   7 +
> > > >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> > > >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> > > >  drivers/mfd/Kconfig              |  12 +
> > > >  drivers/mfd/Makefile             |   2 +
> > > >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++=
++++
> > > >  7 files changed, 699 insertions(+)
> > > >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> > > >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> > > >
> > > >
> > > > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > > > --
> > > > 2.47.1
> > > >
> >
> >
> > --
> > Thanks.
> > Binbin

--=20
Thanks.
Binbin
