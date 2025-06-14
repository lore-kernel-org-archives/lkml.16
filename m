Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05993190692
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749909585; cv=none; b=EprzU4q4URz3A6lkYXYNXZTG4yYfYcPEuXwYZiY++Eb+Fr37OBYTzN/+nxY5NWeKAFEtGJcGoLhy80Y2WF8nt04pMo+FX+8dLlkn9es2d3ZmVZhg+ah8C5PDnFgAze0l7SCYk6Vr1+7u9bYdnI+A4BAFpivyDJ3PpChLD45b3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749909585; c=relaxed/simple;
	bh=IpTklT/t6cRb761DDSQQa3pifnAhgtdO5g6UaiYauW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBoD0RDF4Gyj4dnVGO2zezfUNCfCGy7nhWlprrHmxJe2vn0DK92iBrRYgpXL/EY1jjvw9pYtdYMVE4yIRvv3HrRZW64mKV8Ysr+ec8k++j07KqXgFfk6IpnejEJwNPXgEmbP2xzNOsk94bpIlocivTu3J40+7abWhbUupMeyj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=jdycx+bc; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="jdycx+bc"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73a44512c8aso439a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1749909583; x=1750514383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0m+Fi2zvj6n2Dtqq2057AKu8Qy58XQ7T17PhQzdBtE=;
        b=jdycx+bcHBkaF1cFA8xp24bHeWVp7lQIOPSpe0U0jxcH0YEBoi4hMLZRDjqUrcbo+X
         opAzaaXMCbZI/qMUqWwQb9RVSSUdjecDz9BLey1PKno7Fz66ItvOOzkh6eF66jhqqC0k
         q6aP3N64YUZuvu5HuVKSfcf+sQHA+6vTo686xqFZe9NQFMDsZIBlTW6MBDbi+7Uty0/1
         S66v2oMkC3rpu3O8PCMXrTUCH3i8Z+Hn27yMA8yS6HqBdokv5jHhGDv/L5Gffb1CjkEb
         +VIzPzyKGsY3XOFrbx4N5nXG6/B+XM/cCOd3DkY1AwNNUictfDp4P3J26NnhAWwGZ0Fc
         1+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749909583; x=1750514383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0m+Fi2zvj6n2Dtqq2057AKu8Qy58XQ7T17PhQzdBtE=;
        b=NfslnRXIAgD1yUI/7AkxmWlhEFGUTa+AvEaxDDbCc2wjgsFqEwRHyBLWIOJGTDenhb
         vFTAUT8UTIE2LYaHzQ7Flx4h10aKY1bqIb+pqg7+8B9qjmRszSF0bZHJAWfa66HVT/nP
         icXJs7DVvLNLDaWYJita2n1gRocCC2TLg3r92T6v4ywxJzVteyjuufOamPxjzRfQtfeT
         hF1JLJYPK0ekprOp4JfsMbT96hb5rAjHq5EtBt33rFal0EhMDHG9q4W/6Mw+/wRojKNi
         XmVwEaPq/PLCjFfhpkZ1y4H9wXAyIcTlaUKYWjmCYygLMg6yuddb6OVVj70qGZNSTOMV
         rwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5kYdqFWVfRNY9M13Y/v5Hul6LKsX9vTVYs+nO15VasV6kU6SQEFHXMX5cWBou3MD+MvueQ0JfTNRRf/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcnQNhiQNOOIuPTE9rgT4TB0nqTPWW7bOixxROrrLECz24g6wW
	mTl8IWkIdlEjf7eBNKUH08XQGgRHKjVYfDY+D+WU+i+3AvB5QXOZg7DYZ3dT0phbbxI=
X-Gm-Gg: ASbGncsC8EPq8zQbf29MVf2FaqMiYn+y/a4ha5FGFp+iEVIeq25pYdzrozg4evPaMFZ
	J5cPs/seB1ANaXioKs0feEHQrjZHGBJ2nsuXrnNfMkt5U0MjsTvaT6JhDpQj8Ex4PzPAbZ8OuI3
	M2o42e+ZMPZ4hyuyaSPVDBsNI+ocD+dZnSJhhfM6PyU7n7THxJI95RdrDw6fF+Xw5GRLCHGfFs7
	XIcTZaWmQe9LOaA8zeb6F6JCYaiEhONvHxpYCKEYWY4/53XFaM+IYE+EwZZaNOYEvP/lBenabZu
	GfBdydDS/rAGbOIfLZCNEVK+f6pFaZw1jbDlaK1MCxRhDnSlNW2oVG8VoGFFgk74+A==
X-Google-Smtp-Source: AGHT+IE7Ls/rlOjmSl7wXr5ILZZRY5ShsQdb8vNMhsyPqamNHKhk5KyXG9P4Ek7BnactAUWNaoezZA==
X-Received: by 2002:a05:6870:8286:b0:2d6:b7b:a83 with SMTP id 586e51a60fabf-2eaf08dc205mr1836510fac.13.1749909582853;
        Sat, 14 Jun 2025 06:59:42 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f41f:8468:bca8:a5f7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab897a367sm1147951fac.21.2025.06.14.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 06:59:41 -0700 (PDT)
Date: Sat, 14 Jun 2025 08:59:35 -0500
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
Message-ID: <aE2AR8rj9OEM8TcB@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1749731531.git.zhoubinbin@loongson.cn>
 <aEzFPdYEvbkaH_B5@mail.minyard.net>
 <CAMpQs4L66sXLdj6+ebMXcwq4i+XVi+AmwBbQSx0-EuULNJ5XeQ@mail.gmail.com>
 <aEzqbLHSB6phFNox@mail.minyard.net>
 <CAMpQs4L82x=OhLQJb96ZC4YfT_ZhHcU+zks2r0HMU0Y2fjwsbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4L82x=OhLQJb96ZC4YfT_ZhHcU+zks2r0HMU0Y2fjwsbg@mail.gmail.com>

On Sat, Jun 14, 2025 at 01:25:17PM +0800, Binbin Zhou wrote:
> Hi Corey:
> 
> Thanks for your detailed suggestions.
> 
> On Sat, Jun 14, 2025 at 11:20 AM Corey Minyard <corey@minyard.net> wrote:
> >
> > On Sat, Jun 14, 2025 at 10:50:37AM +0800, Binbin Zhou wrote:
> > > Hi Corey:
> > >
> > > On Sat, Jun 14, 2025 at 8:41 AM Corey Minyard <corey@minyard.net> wrote:
> > > >
> > > > On Fri, Jun 13, 2025 at 02:43:38PM +0800, Binbin Zhou wrote:
> > > > > Hi all:
> > > > >
> > > > > This patch set introduces the Loongson-2K BMC.
> > > > >
> > > > > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > > > > And it is a multifunctional device (MFD), such as display as a sub-function
> > > > > of it.
> > > >
> > > > I've asked this before, but I haven't gotten a answer, I don't think.
> > > >
> > > > Is this really a multi-function device?  Is there (or will there be)
> > > > another driver that uses the MFD code?
> > >
> > > I am very sorry, I may have overlooked your previous question.
> > >
> > > And I also may not have a thorough understanding of multifunction devices.
> > >
> > > The Loongson-2K BMC device provides two functions: display and IPMI.
> > > For display, we pass the simplefb_platform_data parameter and register
> > > the simpledrm device, as shown in patch-1.
> > >
> > > Therefore, I think this should be considered a multifunction device.
> >
> > Ok, that's clear, thank you.
> >
> > However, that's not really very clear from the patches you have
> > provided.  Particularly, the "bmc" in the name from patch 1 makes one
> > think that it's only a bmc.
> >
> > The "bmc" name is also a little confusing; the devices with a "bmc" in
> > the name are all the BMC side, but you are doing a host side device.
> >
> > If you look at most of the other MFDs, they have a "core" section then
> > various other parts that use the core.  And possibly parts in other
> > directories for individual functions.  I think you need to do the same
> > design.  Have a "core" section that both the display and bmc use, then a
> > separate display and bmc driver.
> 
> If it can be reconstructed in this way, it should be clearer.
> 
> However, there is a key point in my mind: if the display and IPMI are
> separated into two parts, they should at least be able to be probed
> separately, but in fact they belong to the same PCI-E device, just
> allocated different resource intervals.
> 
> static struct pci_device_id ls2k_bmc_devices[] = {
>        { PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x1a05) },
>        { }
> };
> MODULE_DEVICE_TABLE(pci, ls2k_bmc_devices);
> 
> I'm not sure if my understanding is correct?

You are already doing this, it appears.  I spent a little time to learn
how this works.  You are using the standard frame buffer driver, so no
special driver is required there (per earlier discussions).  And you are
registering it all as an MFD device, so the display buffer and IPMI
interface will pick it up there.

So from a design point of view this all looks good.

The IPMI interface needs to be separately selectable from the main mfd
device in the Kconfigs.  Add an IPMI_LS2K config in the IPMI section
that enables the IPMI interface and selects MFD_LS2K_BMC.  And both
configs need to be tristate, not bool, so they can be modules.

I don't know if you want to make the display part so it can be enabled
separately, I'm not sure how you would do that.  But that's not my
concern, really.

Thanks,

-corey

> 
> >
> > That way, you can use the display without the IPMI interface, or the
> > IPMI interface without the display.
> >
> > I would like to see:
> >
> > * A core mfd device named ls2k-core.c that has the core functions.
> >   It would have its own config item (MFD_LS2K) that would be
> >   selected if either the display or IPMI device is enabled.
> >
> > * A separate display device in its own file with its own config item.
> >   This isn't my area, so I'm not sure where this should go.
> >
> > * The IPMI device in the ipmi directory named ipmi_ls2k.c, again
> >   with it's own config item (IPMI_LS2K).
> >
> > Does that make sense?  I don't want to make things too hard, but that's
> > the way pretty much everything else is done on MFDs.
> >
> > Thanks,
> >
> > -corey
> >
> > >
> > > >
> > > > If nothing else is going to use this, then it's really not a
> > > > multi-function device and all the code can go into the IPMI directory.
> > > > That simplifies maintenance.
> > > >
> > > > If it is a multi-function device, then I want two separate Kconfig
> > > > items, one for the MFD and one for the IPMI portion.  That way it's
> > > > ready and you don't have to bother about the IPMI portion when
> > > > adding the other device.
> > > >
> > > > All else looks good, I think.
> > > >
> > > > -corey
> > > >
> > > > >
> > > > > For IPMI, according to the existing design, we use software simulation to
> > > > > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> > > > >
> > > > > Also since both host side and BMC side read and write kcs status, we use
> > > > > fifo pointer to ensure data consistency.
> > > > >
> > > > > For the display, based on simpledrm, the resolution is read from a fixed
> > > > > position in the BMC since the hardware does not support auto-detection
> > > > > of the resolution. Of course, we will try to support multiple
> > > > > resolutions later, through a vbios-like approach.
> > > > >
> > > > > Especially, for the BMC reset function, since the display will be
> > > > > disconnected when BMC reset, we made a special treatment of re-push.
> > > > >
> > > > > Based on this, I will present it in four patches:
> > > > > patch-1: BMC device PCI resource allocation.
> > > > > patch-2: BMC reset function support
> > > > > patch-3: IPMI implementation
> > > > >
> > > > > Thanks.
> > > > >
> > > > > -------
> > > > > V4:
> > > > > - Add Reviewed-by tag;
> > > > > - Change the order of the patches.
> > > > > Patch (1/3):
> > > > >   - Fix build warning by lkp: Kconfig tristate -> bool
> > > > >     - https://lore.kernel.org/all/202505312022.QmFmGE1F-lkp@intel.com/
> > > > >  - Update commit message;
> > > > >  - Move MFD_LS2K_BMC after MFD_INTEL_M10_BMC_PMCI in Kconfig and
> > > > >    Makefile.
> > > > > Patch (2/3):
> > > > >   - Remove unnecessary newlines;
> > > > >   - Rename ls2k_bmc_check_pcie_connected() to
> > > > >     ls2k_bmc_pcie_is_connected();
> > > > >   - Update comment message.
> > > > > Patch (3/3):
> > > > >   - Remove unnecessary newlines.
> > > > >
> > > > > Link to V3:
> > > > > https://lore.kernel.org/all/cover.1748505446.git.zhoubinbin@loongson.cn/
> > > > >
> > > > > V3:
> > > > > Patch (1/3):
> > > > >  - Drop "MFD" in title and comment;
> > > > >  - Fromatting code;
> > > > >  - Add clearer comments.
> > > > > Patch (2/3):
> > > > >  - Rebase linux-ipmi/next tree;
> > > > >  - Use readx()/writex() to read and write IPMI data instead of structure
> > > > >    pointer references;
> > > > >  - CONFIG_LOONGARCH -> MFD_LS2K_BMC;
> > > > >  - Drop unused output.
> > > > > Patch (3/3):
> > > > >  - Inline the ls2k_bmc_gpio_reset_handler() function to ls2k_bmc_pdata_initial();
> > > > >  - Add clearer comments.
> > > > >  - Use proper multi-line commentary as per the Coding Style documentation;
> > > > >  - Define all magic numbers.
> > > > >
> > > > > Link to V2:
> > > > > https://lore.kernel.org/all/cover.1747276047.git.zhoubinbin@loongson.cn/
> > > > >
> > > > > V2:
> > > > > - Drop ls2kdrm, use simpledrm instead.
> > > > > Patch (1/3):
> > > > >  - Use DEFINE_RES_MEM_NAMED/MFD_CELL_RES simplified code;
> > > > >  - Add resolution fetching due to replacing the original display
> > > > >    solution with simpledrm;
> > > > >  - Add aperture_remove_conflicting_devices() to avoid efifb
> > > > >    conflict with simpledrm.
> > > > > Patch (3/3):
> > > > >  - This part of the function, moved from the original ls2kdrm to mfd;
> > > > >  - Use set_console to implement the Re-push display function.
> > > > >
> > > > > Link to V1:
> > > > > https://lore.kernel.org/all/cover.1735550269.git.zhoubinbin@loongson.cn/
> > > > >
> > > > > Binbin Zhou (3):
> > > > >   mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > > >   mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > > >   ipmi: Add Loongson-2K BMC support
> > > > >
> > > > >  drivers/char/ipmi/Makefile       |   1 +
> > > > >  drivers/char/ipmi/ipmi_si.h      |   7 +
> > > > >  drivers/char/ipmi/ipmi_si_intf.c |   3 +
> > > > >  drivers/char/ipmi/ipmi_si_ls2k.c | 189 ++++++++++++
> > > > >  drivers/mfd/Kconfig              |  12 +
> > > > >  drivers/mfd/Makefile             |   2 +
> > > > >  drivers/mfd/ls2kbmc-mfd.c        | 485 +++++++++++++++++++++++++++++++
> > > > >  7 files changed, 699 insertions(+)
> > > > >  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> > > > >  create mode 100644 drivers/mfd/ls2kbmc-mfd.c
> > > > >
> > > > >
> > > > > base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> > > > > --
> > > > > 2.47.1
> > > > >
> > >
> > >
> > > --
> > > Thanks.
> > > Binbin
> 
> -- 
> Thanks.
> Binbin
