Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56CD292B5D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079810; cv=none; b=kdE6ZY1BvSNfha7VJYpsH9LwXEydoXP3wc8L9UeXPj5rAoM77baV6Cj3YfAEteaeeeP/AdhRc2SXFRqjOil328ug+a/9Mc1rmjuaZEAmuZ+3MQWqTtnph3l2eWEHuRdyt+Vj1YDc6TlV4GvJSIfw8VzgleaszaOrAXuxEFsjK0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079810; c=relaxed/simple;
	bh=I+j8rJQXrdtb9Dzvip8M7C1JE38LgbfaSiZPvrfcy1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIbaU+8V4TOsBpHxIPRPVbKTytVuRYUevZDV3oMe0dA2est8tF8Lzw8hUjgAI5JHhOpOjV3HJKs5ZNdlo7rtgP6zTWk9gFNonenYT2X0qQLnpgN6t8vYXgN7L6cOtI3/n/7b/J71rJ+lcJ3yUSEmOaBjbyAnlC6kEiUOhlxlUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=dDb+fTTi; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="dDb+fTTi"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60634f82c77so1181886eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1750079808; x=1750684608; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8Mi39ikecLEPcXDBuglsUfBzlft6AswuDbqdWUZkjA=;
        b=dDb+fTTiLqk6HyJYusRVJJMI04g0CFqby0H16wqPxfFW8LBpDcL7VVFpnZaonMp15t
         eWBZ3wk7vO4gegAoHvsMRpMbQy7FlOiX1aBaRy597PaKjAZBQ63fTqTbi9CWHX3Lm6Ub
         S64Q1c2wakjUaD19ekQBDZVXjyY+rdHEal5ygfmsIlVoALWGf61HSDgurRPcysJ8yFh+
         UfTlFqyqQhW4cb+bCrmMDqrP122Oxafar0CJqnGyLJ6JoTqWNqDCTt3C0aSxa6di/kOf
         FBND5ilZrvxOeZCEXkKXiM7Lid0a/QU2n1OyT0U39cP3jX48ZZy2f+BnxAr8yb9x4Wuj
         dy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079808; x=1750684608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8Mi39ikecLEPcXDBuglsUfBzlft6AswuDbqdWUZkjA=;
        b=fn59tHNxzedpsxsadqcPzLORveY68Zu0rzngNGEcGj620XdKr/DK1F52W22GsB8/uI
         0kmOpJxcazvTBp8hZbdlGPv15VrEkE8qJAljHOIhh1x27aZRfOKQ702sv40lWkThgEdv
         6VwWEYEuf66gP9mCqReCEJXgbnZod710pew5M73HRPdJtphhqGw0PU00j+6pUbRhp+mn
         7AovSISl+zKyTXHxam1Nq4pV7YMF/ZyZGHYH1AwKroHdbBxGwrHAzQxblFoOID7mj/DT
         3BWHn4Mu8i8go3i5M5TPlUTBwH5dbho6L10kIFmDoZazSh4lt1MXmeCxOMX1LYYc8smA
         T9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVWwF/Q26p3KrsB3fTj31Hj95jeRKynVEj0IanE+5OaiRcnKBlYF0aXE8ITQKx2cjgqHOPgyyDIk/jUpvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwASVKbaNvg5dEnb+YOV3TXKo2+6qeKrE0HczzAD8yQg7o4xQGr
	GKmm0IrRe9FmeyAsraANsp2hUDVc57w16GDUp0x2xCGchyTyo0XW5yghtG/Qz21PXXY=
X-Gm-Gg: ASbGncuhVLvrm5Ex5UX7fLeaZnTSH0ekfpi9yD0apgpFPdwJGPSVQltBtAoxlKtTctv
	Cm1OQIhZGxf8/nUzOo2Qqy135/TmOBkcVbJCKXaRwl1fgO9dVl1QkAaUlAXmpXoRZIERYLGrPy/
	eoZ3AeDd1R5qlv1vC77kGLQDxbshCDz9CcV5oh0SfLHVUypVzkxpkGWMxUaFWLo/pWHh8yylHgg
	15U98JHAx8Ulk26E8A1MFmFZLzokhvuImio/Z9Cum3MEZkqmvNBEqy3I0BvdvEFmFqTfYUq6nDB
	4XCqdYnlFJEbrUhqjIdTAT5l96L55lEaIwy+gC1LtFxCEH6qH4bDna/nKhy8es2qFg==
X-Google-Smtp-Source: AGHT+IGKy/mNiaFXndLyTZBnnPbROQUfmLOiXih77FnFhG9cVa1fUGcD/kvZyyBMCSrkSMPTiennPQ==
X-Received: by 2002:a05:6820:509:b0:610:f22b:2d5 with SMTP id 006d021491bc7-61110ed529bmr4664332eaf.1.1750079807714;
        Mon, 16 Jun 2025 06:16:47 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b1f6:e47c:c581:5063])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f0d5f6sm838230eaf.34.2025.06.16.06.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:16:46 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:16:40 -0500
From: Corey Minyard <corey@minyard.net>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com
Subject: Re: [PATCH v4 0/3] LoongArch: Add Loongson-2K BMC support
Message-ID: <aFAZOH7ymTVmTduw@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1749731531.git.zhoubinbin@loongson.cn>
 <aEzFPdYEvbkaH_B5@mail.minyard.net>
 <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>
 <aEzqbLHSB6phFNox@mail.minyard.net>
 <CAMpQs4L82x=OhLQJb96ZC4YfT_ZhHcU+zks2r0HMU0Y2fjwsbg@mail.gmail.com>
 <aE2AR8rj9OEM8TcB@mail.minyard.net>
 <CAMpQs4+5hapiYv_M4px0XkcXiCd7cCpyb55APKt+uh1iBaor3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4+5hapiYv_M4px0XkcXiCd7cCpyb55APKt+uh1iBaor3Q@mail.gmail.com>

On Mon, Jun 16, 2025 at 03:35:56PM +0800, Binbin Zhou wrote:
> Hi Corey:
> 
> Thanks  for your detailed review.
> 
> On Sat, Jun 14, 2025 at 9:59 PM Corey Minyard <corey@minyard.net> wrote:
> >
> > On Sat, Jun 14, 2025 at 01:25:17PM +0800, Binbin Zhou wrote:
> > > Hi Corey:
> > >
> > > Thanks for your detailed suggestions.
> > >
> > > On Sat, Jun 14, 2025 at 11:20 AM Corey Minyard <corey@minyard.net> wrote:
> > > >
> > > > On Sat, Jun 14, 2025 at 10:50:37AM +0800, Binbin Zhou wrote:
> > > > > Hi Corey:
> > > > >
> > > > > On Sat, Jun 14, 2025 at 8:41 AM Corey Minyard <corey@minyard.net> wrote:
> > > > > >
> > > > > > On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > > > > > > Hi all:
> > > > > > >
> > > > > > > This patch set introduces the Loongson-2K BMC.
> > > > > > >
> > > > > > > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > > > > > > And it is a multifunctional device (MFD), such as display as a sub-function
> > > > > > > of it.
> > > > > >
> > > > > > I've asked this before, but I haven't gotten a answer, I don't think.
> > > > > >
> > > > > > Is this really a multi-function device?  Is there (or will there be)
> > > > > > another driver that uses the MFD code?
> > > > >
> > > > > I am very sorry, I may have overlooked your previous question.
> > > > >
> > > > > And I also may not have a thorough understanding of multifunction devices.
> > > > >
> > > > > The Loongson-2K BMC device provides two functions: display and IPMI.
> > > > > For display, we pass the simplefb_platform_data parameter and register
> > > > > the simpledrm device, as shown in patch-1.
> > > > >
> > > > > Therefore, I think this should be considered a multifunction device.
> > > >
> > > > Ok, that's clear, thank you.
> > > >
> > > > However, that's not really very clear from the patches you have
> > > > provided.  Particularly, the "bmc" in the name from patch 1 makes one
> > > > think that it's only a bmc.
> > > >
> > > > The "bmc" name is also a little confusing; the devices with a "bmc" in
> > > > the name are all the BMC side, but you are doing a host side device.
> > > >
> > > > If you look at most of the other MFDs, they have a "core" section then
> > > > various other parts that use the core.  And possibly parts in other
> > > > directories for individual functions.  I think you need to do the same
> > > > design.  Have a "core" section that both the display and bmc use, then a
> > > > separate display and bmc driver.
> > >
> > > If it can be reconstructed in this way, it should be clearer.
> > >
> > > However, there is a key point in my mind: if the display and IPMI are
> > > separated into two parts, they should at least be able to be probed
> > > separately, but in fact they belong to the same PCI-E device, just
> > > allocated different resource intervals.
> > >
> > > static struct pci_device_id ls2k_bmc_devices[] = {
> > >        { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
> > >        { }
> > > };
> > > MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> > >
> > > I'm not sure if my understanding is correct?
> >
> > You are already doing this, it appears.  I spent a little time to learn
> > how this works.  You are using the standard frame buffer driver, so no
> > special driver is required there (per earlier discussions).  And you are
> > registering it all as an MFD device, so the display buffer and IPMI
> > interface will pick it up there.
> >
> > So from a design point of view this all looks good.
> >
> > The IPMI interface needs to be separately selectable from the main mfd
> > device in the Kconfigs.  Add an IPMI_LS2K config in the IPMI section
> > that enables the IPMI interface and selects MFD_LS2K_BMC.  And both
> > configs need to be tristate, not bool, so they can be modules.
> 
> I tried rewriting Kconfig as follows:
> 
> IPMI Kconfig:
> 
> config IPMI_LS2K
>        bool 'Loongson-2K IPMI interface'
>        depends on LOONGARCH
>        select MFD_LS2K_BMC_CORE
>        help
>          Provides a driver for Loongson-2K IPMI interfaces.
> 
> MFD Kconfig:
> 
> config MFD_LS2K_BMC_CORE
>         bool "Loongson-2K Board Management Controller Support"
>         select MFD_CORE
> 
> 
> However, `tristate` does not seem to work.
> On the IPMI side, in order to better reuse code, our driver is not
> actually a completely independent driver; it is part of `ipmi_si`.

Ah, yes, that is true.  The trouble with the above is it will select
MFD_LS2K_BMC_CORE as "y" even if ipmi_si is a module.  And that will
force MFD_CORE to be "y" as well.  At least I think it works that way.
Anyway, that's not terrible, but it would be nice to have the core code
as a module if possible.

Another issue is you don't have help text on MFD_LS2K_BMC_CORE code.
You probably want to mention there that it enables the display on
the BMC.

-corey

> 
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 7fe891783a37..c13d5132fffc 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2120,6 +2120,8 @@ static int __init init_ipmi_si(void)
> 
>         ipmi_si_pci_init();
> 
> +       ipmi_si_ls2k_init();
> +
>         ipmi_si_parisc_init();
> 
>         mutex_lock(&smi_infos_lock);
> @@ -2334,6 +2335,8 @@ static void cleanup_ipmi_si(void)
> 
>         ipmi_si_pci_shutdown();
> 
> +       ipmi_si_ls2k_shutdown();
> +
>         ipmi_si_parisc_shutdown();
> 
>         ipmi_si_platform_shutdown();
> 
> 
> Therefore, it seems that we can only use `bool` here, otherwise an
> error will occur during compilation, as seen in the V3 patchset[1]:
> 
> [1]: https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> 
> >
> > I don't know if you want to make the display part so it can be enabled
> > separately, I'm not sure how you would do that.  But that's not my
> > concern, really.
> >
> > Thanks,
> >
> > -corey
> >
> > >
> > > >
> > > > That way, you can use the display without the IPMI interface, or the
> > > > IPMI interface without the display.
> > > >
> > > > I would like to see:
> > > >
> > > > * A core mfd device named ls2k-core.c that has the core functions.
> > > >   It would have its own config item (MFD_LS2K) that would be
> > > >   selected if either the display or IPMI device is enabled.
> > > >
> > > > * A separate display device in its own file with its own config item.
> > > >   This isn't my area, so I'm not sure where this should go.
> > > >
> > > > * The IPMI device in the ipmi directory named ipmi_ls2k.c, again
> > > >   with it's own config item (IPMI_LS2K).
> > > >
> > > > Does that make sense?  I don't want to make things too hard, but that's
> > > > the way pretty much everything else is done on MFDs.
> > > >
> > > > Thanks,
> > > >
> > > > -corey
> > > >
> > > > >
> > > > > >
> > > > > > If nothing else is going to use this, then it's really not a
> > > > > > multi-function device and all the code can go into the IPMI directory.
> > > > > > That simplifies maintenance.
> > > > > >
> > > > > > If it is a multi-function device, then I want two separate Kconfig
> > > > > > items, one for the MFD and one for the IPMI portion.  That way it's
> > > > > > ready and you don't have to bother about the IPMI portion when
> > > > > > adding the other device.
> > > > > >
> > > > > > All else looks good, I think.
> > > > > >
> > > > > > -corey
> > > > > >
> > > > > > >
> > > > > > > For IPMI, according to the existing design, we use software simulation to
> > > > > > > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> > > > > > >
> > > > > > > Also since both host side and BMC side read and write kcs status, we use
> > > > > > > fifo pointer to ensure data consistency.
> > > > > > >
> > > > > > > For the display, based on simpledrm, the resolution is read from a fixed
> > > > > > > position in the BMC since the hardware does not support auto-detection
> > > > > > > of the resolution. Of course, we will try to support multiple
> > > > > > > resolutions later, through a vbios-like approach.
> > > > > > >
> > > > > > > Especially, for the BMC reset function, since the display will be
> > > > > > > disconnected when BMC reset, we made a special treatment of re-push.
> > > > > > >
> > > > > > > Based on this, I will present it in four patches:
> > > > > > > patch-1: BMC device PCI resource allocation.
> > > > > > > patch-2: BMC reset function support
> > > > > > > patch-3: IPMI implementation
> > > > > > >
> > > > > > > Thanks.
> > > > > > >
> > > > > > > -------
> > > > > > > V4:
> > > > > > > - Add Reviewed-by tag;
> > > > > > > - Change the order of the patches.
> > > > > > > Patch (1/3):
> > > > > > >   - Fix build warning by lkp: Kconfig tristate -> bool
> > > > > > >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> > > > > > >  - Update commit message;
> > > > > > >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
> > > > > > >    Makefile.
> > > > > > > Patch (2/3):
> > > > > > >   - Remove unnecessary newlines;
> > > > > > >   - Rename ls2k_bmc_check_pcie_connected() to
> > > > > > >     ls2k_bmc_pcie_is_connected();
> > > > > > >   - Update comment message.
> > > > > > > Patch (3/3):
> > > > > > >   - Remove unnecessary newlines.
> > > > > > >
> > > > > > > Link to V3:
> > > > > > > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn/
> > > > > > >
> > > > > > > V3:
> > > > > > > Patch (1/3):
> > > > > > >  - Drop "MFD" in title and comment;
> > > > > > >  - Fromatting code;
> > > > > > >  - Add clearer comments.
> > > > > > > Patch (2/3):
> > > > > > >  - Rebase linux-ipmi/next tree;
> > > > > > >  - Use readx()/writex() to read and write IPMI data instead of structure
> > > > > > >    pointer references;
> > > > > > >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> > > > > > >  - Drop unused output.
> > > > > > > Patch (3/3):
> > > > > > >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_initial();
> > > > > > >  - Add clearer comments.
> > > > > > >  - Use proper multi-line commentary as per the Coding Style documentation;
> > > > > > >  - Define all magic numbers.
> > > > > > >
> > > > > > > Link to V2:
> > > > > > > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn/
> > > > > > >
> > > > > > > V2:
> > > > > > > - Drop ls2kdrm, use simpledrm instead.
> > > > > > > Patch (1/3):
> > > > > > >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> > > > > > >  - Add resolution fetching due to replacing the original display
> > > > > > >    solution with simpledrm;
> > > > > > >  - Add aperture_remove_conflicting_devices() to avoid efifb
> > > > > > >    conflict with simpledrm.
> > > > > > > Patch (3/3):
> > > > > > >  - This part of the function, moved from the original ls2kdrm to mfd;
> > > > > > >  - Use set_console to implement the Re-push display function.
> > > > > > >
> > > > > > > Link to V1:
> > > > > > > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn/
> > > > > > >
> > > > > > > Binbin Zhou (3):
> > > > > > >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > > > > >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > > > > >   ipmi: Add Loongson-2K BMC support
> > > > > > >
> > > > > > >  drivers/char/ipmi/Makefile       |   1 +
> > > > > > >  drivers/char/ipmi/ipmi_si.h      |   7 +
> > > > > > >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> > > > > > >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> > > > > > >  drivers/mfd/Kconfig              |  12 +
> > > > > > >  drivers/mfd/Makefile             |   2 +
> > > > > > >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++++++
> > > > > > >  7 files changed, 699 insertions(+)
> > > > > > >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> > > > > > >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> > > > > > >
> > > > > > >
> > > > > > > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > > > > > > --
> > > > > > > 2.47.1
> > > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Thanks.
> > > > > Binbin
> > >
> > > --
> > > Thanks.
> > > Binbin
> 
> -- 
> Thanks.
> Binbin
