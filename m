Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E825DB08
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020900; cv=none; b=dHLaJ3SsUsDXVgIO7K+jKYL1grIcH1waXoPFIuadOJtOhET+ntgI4YAJ7ssNKEIsIAIzJDLc/v2UesnZUbahhe9IhKHTS65ru8ChiE++835sJSSGm/sa7vWlmIDPyPRfhfadn3glVBNlcgbRCFzOIPNwe2f3K5AZRMJn8Ki7C+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020900; c=relaxed/simple;
	bh=6lS+RfIIKCrBcRjbxZAPQ+ncH94JPR+qjqAlZ/S0peA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9zI5bVcbB218yW9Exn+NUohvYtRwlCwywQW4HcKUtf7EkLYjg/LWL0Nj3lzqUu4U9XZicgSn6xf0MBOVXLDEETsWbXOQ4kcSRk6Flmth9TqM+wbBK0dyidmWyVr6GMhKuSLi66W65XVlIIC5nOnesX66UyVjgCKLIAjBs8Cu/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipDYuJds; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipDYuJds"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25520a289so1164381866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746020895; x=1746625695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z75LjcWryjhXEgrOiG6WwRVzqb4M8o9TQ5+ml4Wiq/g=;
        b=ipDYuJdsOvP052q1WD4DynGhbpE+6tXf4mVlC+nAzFi6X6/Gf0caLaiU2ts9wpHP0t
         jfPPjQZut8KQXIz8qX6/4K4eQFjxCeybc4TJr9roYKedOgdNGT1G8vTtK3PYlMS743dt
         9JvgFXDvQnLhect2UEbE2yUIumvDu4ZY5Y6lUg2xoB3RtfmWp1xxqZA9dPmqC3S9YUAG
         NAblMHYakiQAnXhp3oAXJozpD1getetWviMBaih/nxmWEgNaoP/jvjtTrRmYqOiJ6TcC
         u6ULnVpe0xV50vfSJcD6+EkBRijOG85cNw+xN6nEJuSWoig71+4aWFeKhV6x5Dkr5pN4
         QFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746020895; x=1746625695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z75LjcWryjhXEgrOiG6WwRVzqb4M8o9TQ5+ml4Wiq/g=;
        b=A/IrIjj6sTCQ9LUnoDyNsV4ugk0iMVQxDH2pEPGXqenmamQbX6o6hUXmO3QEv8/ozR
         S7yncBKdsqXT3awPyeiJo7tLIHIg51di4N3TpqlTJu+CAOEoYbXHsUO1mYI9SqPxmIje
         sv4vh0WQqBC7/so/x4Bb5RXJvULFTTRpKv59N+fLecT/5aHfC5LWUnsp7yPrGs2ONVPx
         ASfOtX9QYJ37VRDRKCdXnd2+oO0hSSuGOgK5rG+f/t+3tbVtWiNHLiIembt1a6cpzei6
         a+CSv9PIRr4ylaIwXps9546WKm4ASqGO+/3qogNPhF3V1e9lml5oxi4+XbqXwNhTwRtk
         eJOw==
X-Forwarded-Encrypted: i=1; AJvYcCWU7si33sv/EvZEfsOYWjY9rS43A+Wbw5x0iTxx1i+PzDxxsq/PvKRDInhsYXcTbDpRbudks1MrD8OgZKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxfFvzIIf1OJoohfNZOB/dO2QPmbZKFcF+mJx6Y+I3SPiXXB4U
	IB7dOAYGU/EM1u+us0uINFDyQjzRNUmtCLDSVWi2UbLOvFjoxCRK1WmwMrGJPY1YN8z+dMrdtnY
	lsaJzaCl+otSj9m28TG+Vlw5k58Q=
X-Gm-Gg: ASbGncuFgkpKi/UKfNRfiF+w3WCBbLM0+zuoSe0omr4g+TK60s/+Aji+AU32qQNd+24
	UJWy+p5mRjYkH/Jn3DNX6V/CRJj0APWalnVBrBzsIqW4dBzoYHwhBhSAfYgLW8bqo1UAUTORIG4
	rQuOcw+HdIvLCF1PwUybxH4JM=
X-Google-Smtp-Source: AGHT+IHumecNI7r+PuC8pc8zkvdAU+nckxYX+X6l8RtRmEUVb9At4V5mcbJI9h5TmnpgroAqPCKeLj5hlsWPkRULfO8=
X-Received: by 2002:a17:907:1c15:b0:ace:3643:1959 with SMTP id
 a640c23a62f3a-acedc574f17mr368750066b.7.1746020894723; Wed, 30 Apr 2025
 06:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325133954.3699535-1-liwei.song.lsong@gmail.com>
 <20250331161542.3040005-1-liwei.song.lsong@gmail.com> <87jz73v1th.fsf@bootlin.com>
In-Reply-To: <87jz73v1th.fsf@bootlin.com>
From: liwei song <liwei.song.lsong@gmail.com>
Date: Wed, 30 Apr 2025 21:48:03 +0800
X-Gm-Features: ATxdqUE3n3npR7e7kDOqRM0e0PnPOcNwfRtNMUkbYYUYZrV9SwshVSp66u66bCY
Message-ID: <CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc2ZFDqA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: core: add sync between read/write and unbind device
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: RichardWeinberger <richard@nod.at>, VigneshRaghavendra <vigneshr@ti.com>, 
	TudorAmbarus <tudor.ambarus@linaro.org>, PratyushYadav <pratyush@kernel.org>, 
	MichaelWalle <mwalle@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

On Tue, Apr 29, 2025 at 3:55=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hello Liwei,
>
> On 01/04/2025 at 00:15:20 +08, Liwei Song <liwei.song.lsong@gmail.com> wr=
ote:
>
> > When unbind mtd device or qspi controller with a high frequency
> > reading to /dev/mtd0 device, there will be Calltrace as below:
> >
> > $ while true; do cat /dev/mtd0 >/dev/null; done &
> > $ echo ff8d2000.spi  > /sys/bus/platform/drivers/cadence-qspi/unbind
> >
> > Internal error: synchronous external abort: 0000000096000210 [#1] PREEM=
PT SMP
> > Modules linked in:
> > CPU: 3 UID: 0 PID: 466 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+=
 #1
> > Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
> > pc : cqspi_indirect_read_execute.isra.0+0x188/0x330
> > lr : cqspi_indirect_read_execute.isra.0+0x21c/0x330
> > Call trace:
> >  cqspi_indirect_read_execute.isra.0+0x188/0x330 (P)
> >  cqspi_exec_mem_op+0x8bc/0xe40
> >  spi_mem_exec_op+0x3e0/0x478
> >  spi_mem_no_dirmap_read+0xa8/0xc8
> >  spi_mem_dirmap_read+0xdc/0x150
> >  spi_nor_read_data+0x120/0x198
> >  spi_nor_read+0xf0/0x280
> >  mtd_read_oob_std+0x80/0x98
> >  mtd_read_oob+0x9c/0x168
> >  mtd_read+0x6c/0xd8
> >  mtdchar_read+0xdc/0x288
> >  vfs_read+0xc8/0x2f8
> >  ksys_read+0x70/0x110
> >  __arm64_sys_read+0x24/0x38
> >  invoke_syscall+0x5c/0x130
> >  el0_svc_common.constprop.0+0x48/0xf8
> >  do_el0_svc+0x28/0x40
> >  el0_svc+0x30/0xd0
> >  el0t_64_sync_handler+0x144/0x168
> >  el0t_64_sync+0x198/0x1a0
> > Code: 927e7442 aa1a03e0 8b020342 d503201f (b9400321)
> > ---[ end trace 0000000000000000 ]---
> >
> > Or:
> > $ while true; do cat /dev/mtd0 >/dev/null; done &
> > $ echo spi0.0 > /sys/class/mtd/mtd0/device/driver/unbind
> >
> > Unable to handle kernel paging request at virtual address 0000000000001=
2e8
> > Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > Modules linked in:
> > CPU: 2 UID: 0 PID: 459 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+=
 #1
> > Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
> > pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : spi_mem_exec_op+0x3e8/0x478
> > lr : spi_mem_exec_op+0x3e0/0x478
> > Call trace:
> >  spi_mem_exec_op+0x3e8/0x478 (P)
> >  spi_mem_no_dirmap_read+0xa8/0xc8
> >  spi_mem_dirmap_read+0xdc/0x150
> >  spi_nor_read_data+0x120/0x198
> >  spi_nor_read+0xf0/0x280
> >  mtd_read_oob_std+0x80/0x98
> >  mtd_read_oob+0x9c/0x168
> >  mtd_read+0x6c/0xd8
> >  mtdchar_read+0xdc/0x288
> >  vfs_read+0xc8/0x2f8
> >  ksys_read+0x70/0x110
> >  __arm64_sys_read+0x24/0x38
> >  invoke_syscall+0x5c/0x130
> >  el0_svc_common.constprop.0+0x48/0xf8
> >  do_el0_svc+0x28/0x40
> >  el0_svc+0x30/0xd0
> >  el0t_64_sync_handler+0x144/0x168
> >  el0t_64_sync+0x198/0x1a0
> > Code: f9400842 d63f0040 2a0003f4 f94002a1 (f9417437)
> > ---[ end trace 0000000000000000 ]---
> >
> > when unbind is running, the memory allocated to qspi controller and
> > mtd device is freed during unbinding, but open/close and reading device
> > are still running, if the reading process get read lock and start
> > excuting, there will be above illegal memory access. This issue also
> > can be repruduced on many other platforms like ls1046 and nxpimx8 which
> > have qspi flash.
> >
> > In this patch, register a spi bus notifier which will be called before
> > unbind process freeing device memory, add a new member mtd_event_remove
> > to block mtd open/read, then waiting for the running task to be finishe=
d,
> > after that, memory is safe to be free.
> >
> > Signed-off-by: Liwei Song <liwei.song.lsong@gmail.com>
> > ---
> >
> > Hi Maintainer,
> >
> > This is an improved patch compared with the original one:
> > (https://patchwork.ozlabs.org/project/linux-mtd/patch/20250325133954.36=
99535-1-liwei.song.lsong@gmail.com/),
> > This v2 patch move notifier to spi-nor to avoid crash other types of fl=
ash.
> > now this patch only aim at fixing nor-flash "bind/unbind while reading"=
 calltrace,
> > but for other types of flash like nand also have this issue.
>
> While I agree with the observation and also the conclusion of adding
> some kind of notifier, I'd like to understand the rationale behind
> choosing to fix only spi-nor in v2? If any spi memory registered in the

My original plan is to fix nand in another patch if the idea of this
patch is acceptable,
but after some investigation, it also can be done in this patch together,
because for nand device, the existing driver will call
mtd_device_unregister() directly to remove
device when unbinding, new adding "mtd_event_remove" can be set there, and =
check
"mtd_event_remove" in mtd_read(), on my board exist below call trace:

for nand unbind:
mtd_device_unregister+0x50/0x90
denali_remove+0x58/0x108
denali_dt_remove+0x24/0x88
platform_remove+0x34/0x80
device_remove+0x54/0x90
device_release_driver_internal+0x1d4/0x238
device_driver_detach+0x20/0x38
unbind_store+0xbc/0xc8

for nand read:
denali_dma_xfer+0x140/0x218
denali_read_page+0x5c/0x3c0
nand_read_oob+0x2b4/0x8a0
mtd_read_oob_std+0x60/0x98
mtd_read_oob+0x9c/0x168
mtd_read+0x6c/0xb0
mtdchar_read+0xdc/0x288

for spi_nor read:
cqspi_exec_mem_op+0x8d4/0xfbc
spi_mem_exec_op+0x3dc/0x45c
spi_mem_no_dirmap_read+0xa0/0xc0
spi_mem_dirmap_read+0xdc/0x144
spi_nor_read_data+0x114/0x180
spi_nor_read+0xbc/0x164
mtd_read_oob_std+0x80/0x90
mtd_read_oob+0x8c/0x150
mtd_read+0x6c/0xb0
mtdchar_read+0xdc/0x2a0


> mtd subsystem is subject to this failure, we should find a generic
> approach (or if it's too difficult, at least have the fix in both
> spi nor and spi nand). Looking at your implementation, maybe it could
> fit in spi-mem (I'm not sure).

Thanks for your suggestion, I will have a try to move the code there.


>
> ...
>
> > +static int spi_nor_remove_notifier_call(struct notifier_block *nb,
> > +                                     unsigned long event, void
> > *data);
>
> I believe spi nor maitainers would prefer to avoid forward declarations.

Got it, thanks, will drop this kind of declaration.

>
> > +
> >  /**
> >   * spi_nor_get_cmd_ext() - Get the command opcode extension based on t=
he
> >   *                      extension type.
> > @@ -1191,6 +1195,9 @@ static int spi_nor_prep(struct spi_nor *nor)
> >       if (nor->controller_ops && nor->controller_ops->prepare)
> >               ret =3D nor->controller_ops->prepare(nor);
> >
> > +     if (nor->mtd.mtd_event_remove)
> > +             return -ENODEV;
> > +
> >       return ret;
> >  }
>
> ...
>
> > +static int spi_nor_remove_notifier_call(struct notifier_block *nb,
> > +                                 unsigned long event, void *data)
> > +{
> > +     struct device *dev =3D data;
> > +     struct spi_device *spi;
> > +     struct spi_mem *mem;
> > +     struct spi_nor *nor;
> > +
> > +     if (!of_match_device(spi_nor_of_table, dev))
> > +             return 0;
> > +
> > +     switch (event) {
> > +     case BUS_NOTIFY_DEL_DEVICE:
> > +     case BUS_NOTIFY_UNBIND_DRIVER:
> > +             spi =3D to_spi_device(dev);
> > +             mem =3D spi_get_drvdata(spi);
> > +             if (!mem)
> > +                     return NOTIFY_DONE;
> > +             nor =3D spi_mem_get_drvdata(mem);
> > +
> > +             mutex_lock(&nor->lock);
> > +             nor->mtd.mtd_event_remove =3D true;
> > +             mutex_unlock(&nor->lock);
> > +             msleep(300);
>
> What is this sleep for?

The sleep is to wait the process which already got the lock and
running in reading
routine can be finished before memory is released, show in below scenario:

without sleep:
--------------------------------------------------------------------
mtd.mtd_event_remove =3D false;
                                                            reading start;
mtd.mtd_event_remove =3D true;
release memory
                                                            reading end;
--------------------------------------------------------------------

with sleep:
-------------------------------------------------------------------
mtd.mtd_event_remove =3D false;
                                                           reading start;
mtd.mtd_event_remove =3D true;
sleep() start
                                                           reading end;
sleep() end
release memory
-------------------------------------------------------------------


>
> > +
> > +             break;
> > +     }
> > +
> > +     return NOTIFY_DONE;
> > +}
> > +
> >  /*
> >   * REVISIT: many of these chips have deep power-down modes, which
> >   * should clearly be entered on suspend() to minimize power use.
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 8d10d9d2e830..134bfa6fcf76 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -290,6 +290,7 @@ struct mtd_info {
> >       /* Kernel-only stuff starts here. */
> >       const char *name;
> >       int index;
> > +     bool mtd_event_remove;
>
> No need to repeat 'mtd' here, you are already in the mtd_info structure,
> so mtd->mtd_event_remove would be redundant.

Got it, will remove the "mtd" prefix.

Thanks,
Liwei.


>
> >       /* OOB layout description */
> >       const struct mtd_ooblayout_ops *ooblayout;
>
> Thanks,
> Miqu=C3=A8l
