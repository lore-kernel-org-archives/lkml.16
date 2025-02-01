Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693233F9C5
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738403497; cv=none; b=nO9qGmJQJKmW1qXmGgezzP4vbbJ1DTnOdZIRE+F0fruH24pG4qT8mmCmY8bAqNIOjdUhXZ4dfr58iISPInCNv2pvzaxkXPxoV3HxO3nG+oZ0amAUO8UnqC3bJlh7sKdxln2uC43Gg3kSmLu1WPbQWQsfs5DyLz2R7ZE3dldvULM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738403497; c=relaxed/simple;
	bh=/Lc2YIVYZMDWtzJOASQ91vr/NwUHANkE56YZql48Cvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iApKPOsUIK2q2/SRC+gkC63Jp2+Ev0FK1UT4letxQejul9w01Ro3u6HxUQwYDAE0HJDlKxYIrnf4E2gRh12ASNzeJENP80wlw11fRCI3e0CV9XUoFlizmWNUpuL41j91/nChr0fP1LxWynQnDsXZezVFM4ZIR8IpbL3M+CXQkNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aSuHUaOF; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aSuHUaOF"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f2e31139d9so1318778eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 01:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738403494; x=1739008294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+AAdkcmZc4lSXsMOcapYBhFqOepj7d/gBINmIU6crc=;
        b=aSuHUaOFXwEysvdBDhkbIgOaX3w9jq2YJXpGwp5NDFUGaJdHGwmegwYf2Le7mriryp
         yJ1mFWUsbATOmqc2hhqOqBXr/UuA/+5AL6eoUdS3bNAAmMJ6Ivr4iZVvvNkpLlEKCoob
         sEu6WXMU4SX14crbAaRlabpcIuZHHL6+W5L8CftEwH0iCfx745vigOr47KzUaLlTUMSX
         bdZUcRVEt3Xg3j7o0QgiLgyrCsj4YhosbCCzAvULQKSgatXOfNyFbG3G3DftTsDTJMAd
         Yg5Osq1CavgDheMIz52+7Egyqo/4jZ4MBxnulDi6bcEX5iVJkfYNq2cz7YtvfS6Ww3ib
         dSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738403494; x=1739008294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+AAdkcmZc4lSXsMOcapYBhFqOepj7d/gBINmIU6crc=;
        b=oNO3C5TH4wEm9Q0cW0CzGlYUP+Wxry6zLaq6Z1czPDyoIDR0V7slloNzg9MxIBLuSh
         wU0R4KcF3iAJg6jqpJBbcLmX1N1WdWrpeiRnlrhfOyrfVDSKtyz98gOSyTLkXnMyjqN7
         a1uP2zdzUe4OIJwQW9lZ6ddGRNooOoKTA7SwgGhdL4t9C75remdQlIrY1ap96vG8Zeoo
         GE3/F2uNm++nqW0RcBJB9PHMzrYkHBETW6XNWPLghGBJgPMPVEkOy2JezZ2b3N2a7SJV
         UeyyZnCaA7+0rVH3CwUFeoUuKIlEXwDgKXWDZgyhSc4t8Wn8DkiQiLldD9A8gP6MzJ3J
         v47w==
X-Forwarded-Encrypted: i=1; AJvYcCWts2fa6DGNsCG0/9KWgVuNa1eIoAGw70m1c1loyLClWRexw+khlihdwdSSO2w0SdtTYWY/Ar8tPSTDJtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeokxhhXhGAGiIUSaK+i0fZ52slc232fF/2W5LED6rIZKJAKj
	ORDxdkapfwfcNVs49J/s69HjoK/s1D5lKSaY24ibUoNZuADfB77GzCu7UEesxVrqHvxlu6E1/hW
	wXFRSSO4ErHlCAqs+KHvhSKyfkf+AYHQCZcfq8g==
X-Gm-Gg: ASbGncvpLq8KFixp6PFG3EYT2LI/de2My1DyOOVIiym68jPHWlf2IzKreXgY52V84Ce
	uiMkju8uS82GJ6yty3ylyxY9WBbxwxS9c54b/EbHOpvn4HGaRkI7mhf4OdhZkswbI4Pmg/GNufw
	4=
X-Google-Smtp-Source: AGHT+IEIIfBdNVn8LDpeA6rFY2D9do+Hyc1wDJ+qpODyAMtmiFvSiXtuvbFiuEmS1fHjZJ/7xlgvm9YLi2f51OwMYUg=
X-Received: by 2002:a05:6871:8802:b0:29e:563c:2dbf with SMTP id
 586e51a60fabf-2b32f286144mr9462267fac.26.1738403494288; Sat, 01 Feb 2025
 01:51:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com> <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
 <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com> <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
 <20250124122952.GB23438@willie-the-truck> <CAEEQ3wnTMfWSZRhTax3N60W=m3a=zxnJF6dOfiGnqJzBQs8WEg@mail.gmail.com>
 <20250127165156.GE25757@willie-the-truck>
In-Reply-To: <20250127165156.GE25757@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 1 Feb 2025 17:51:21 +0800
X-Gm-Features: AWEUYZmAdXUmi37d66_VLF0H-K_x7oGaiWsf00mIojMN1X-oiLjeCpkGsMu0T7E
Message-ID: <CAEEQ3wkj=6WPNFpet=A9JppiO52agw6HZArwhfWsWS9JOY6Dng@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
To: Will Deacon <will@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, renyu.zj@linux.alibaba.com, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

On Tue, Jan 28, 2025 at 12:52=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Sun, Jan 26, 2025 at 09:54:35AM +0800, yunhui cui wrote:
> > Hi Will,
> >
> > On Fri, Jan 24, 2025 at 8:30=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Fri, Jan 24, 2025 at 05:11:05PM +0800, yunhui cui wrote:
> > > > > >>>        vsec =3D dwc_pcie_des_cap(pdev);
> > > > > >>>        if (!vsec)
> > > > > >>>                return -ENODEV;
> > > > > >>>
> > > > > >>>        sbdf =3D plat_dev->id;
> > > > > >>> -     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dw=
c_rootport_%x", sbdf);
> > > > > >>> +     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dw=
c_rootport_%d_pmu", sbdf);
> > > > > >>
> > > > > >> A new name will break previous user tools.
> > > > > > This name isn't suitable. It can't clearly show which is the PM=
U
> > > > > > device. Userspace tools don't have binding relationships, like =
perf.
> > > > > > Tools must traverse PMU devices before use.
> > > > >
> > > > > The device is under /sys/bus/event_source/ which indates it is PM=
U device.
> > > > > As far as I know, most of PMU devices do not endup with a '_pmu' =
prefix.
> > > >
> > > > The point is the name "dwc_rootport_" is misleading, suggesting an
> > > > extra PCIE RP in the system. Best to change the name to intuitive
> > > > "xx_pmu".
> > >
> > > As pointed out above, changing the name will break userspace. So it's
> > > simply not an option, sorry.
> >
> > Could you specify what in the userspace is broken and give an example?
>
> Can't I just take the documented example from dwc_pcie_pmu.rst:
>
> $# perf stat -a -e dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/
>
> If I have a script that uses that command on a machine today, then
> applying your kernel patch will break the script, no?

Well, this is just a usage guide for the PCIe PMU and has no binding
with perf. In user space, the existing PCIe PMUs in the system should
be traversed first, and then perf stat/record ... can be executed.

It's okay not to change the name, but it's better to change
dwc_rootport_%x to dwc_rootport_%d to correspond with
platform_device_register_data(NULL, "dwc_pcie_pmu", ...). It'll be
more intuitive. What do you think?

>
> Will

Thanks,
Yunhui
