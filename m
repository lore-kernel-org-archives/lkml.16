Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FE61E9B3F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995453; cv=none; b=LW1DIimjs3mgy4uCWKyQC7JuYhp0W/7Q/lulMUQYaFgIGEY0oejL8UEYAN045rca+wo/A9GdmGWrNTMo+BKyCxYSc2FQPGTAZx4QT8ikZPPjTTWqXbpboTs3D/I2VJH8gjiR+xKyoinvdDMhTjAtGriOrv017hppGkOghZsbRV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995453; c=relaxed/simple;
	bh=XmjJlriSU546WwNijXDXxcjtYzosQfciIJX7qxC5sXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZBC04IfhU4JE8SgMcrnGwaTvAyZwKKP9rs9MEDTy05o2Xaiw5R06BNZ0x9dK0TEVjchdCn+rlcvteSi4x9m5iSpBHxOXXeGbIB7MPjJ6ieId9/PZBcCIK1g2P9Gp3sLewuXcMx1cKZqhzIicv2nBw/yWdbPAwZpX6aUVE4iJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-527a2b89a11so3013905e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995448; x=1746600248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnU9zbusVANKslaJeJSl94vuczo81pzSQY1N+xf6f3A=;
        b=gPveF5cqQKvTS4GONIHM8Dl97OKtQ1fuuREpulY7eFz0xtdVs6rwGKwj7JXlhQGPnS
         BbpPHvsRH49a2z63ofcAVcwURreVHoH3u5xeo8AsNYjE+co0mloytE5tSfcAkXlvtWFw
         70lbhVwv07efH+hY6T8gSaJCPrHIIAKkqPRcCe0jHkrydCZw7AFNoYKlJRt2v4h9Hm2B
         0OiUmelUyvGifcVbGdm53G7/Fvjy9hDlod7pUr9ww+HQOLOz3RlbALu0wgY+F3LZr+Gg
         bzZepJhj5dfRRBOvReX/7ONBDsgiOD6hEp4QF3HG3yzecgKctjbuvIlsYvQv96lS/KLB
         2Ieg==
X-Forwarded-Encrypted: i=1; AJvYcCVvdjn7eFCGk8iXl02oIoISVTeGcdbGwbHroV6zKC5nFzAg7k7eTbK3vwM49YS4Q0ks14EZ7sLOVPDY6SE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0xkSLmV3UHRsRKwoi8mH/emdpbkJoFK/FmwnNTtYnW4H34DrE
	mXRSCb698oNbq1Jri0yd7lctju4dXOCUmfQQlFxVay/P0Ezr9ZFQWsjUlfci
X-Gm-Gg: ASbGnctOxYyPGYdfr2TnmdC2wk5SiO7DxhMAyl3RxsEU24eDwchitgHIy1j0x8cSLJI
	8ZZB9Or+9taHzm17Bb7LpKneE89lTjGX4Rd46aFfmSdW89+G4J2QN5yV3Xw1aTJZ7IJmFSQpNzv
	mP4cSz+OdmyC/p48W/uNNpPE4X6H5Bpu+/3gnczKNJ+/ZG6kfsbOtlZ5NQviADq5b6YN9QRlxz6
	2EmvZzkjhBjzUb7UL4QNKlcC4FAAZIKv2O5twqoT8SEf9jaRYQGfKbVrJysbQRhcRIa0xbFQNZ9
	0EPdcNLbmtCrw7wjS21RxI3t389ypZKsqyLRo6oCM3GcopRU/5jJjZcHCCY5XPOwBeF9Bdv+TVd
	0Ir3V7+cSykAwPw==
X-Google-Smtp-Source: AGHT+IFPItUoQ3U2evah4eMUKVj0u8KkveJF2XnfxwRM8TTU3m6IIpKcC7TeE4OTU6875B+jbkHVRA==
X-Received: by 2002:a05:6102:1626:b0:4bb:e2a1:183e with SMTP id ada2fe7eead31-4dad377771dmr1213222137.18.1745995447685;
        Tue, 29 Apr 2025 23:44:07 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dad4102409sm201758137.13.2025.04.29.23.44.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:44:07 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4c32d6ddd50so245623137.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:44:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRbg5nSCF3Evh6ZTzrw5Bo7iumaXrpw/urmr2aTfi7YG+XfXLR90dOQ9PcrzC7IFb35Eefcpulk63EDKY=@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:4c1:903e:7bed with SMTP id
 ada2fe7eead31-4dad339cc27mr1480246137.0.1745995446785; Tue, 29 Apr 2025
 23:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504262154.sBmNTrcB-lkp@intel.com> <84fd01d9-d320-4296-9c42-0fb5238a8505@kernel.org>
In-Reply-To: <84fd01d9-d320-4296-9c42-0fb5238a8505@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Apr 2025 08:43:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWM=ftk3AYTQJFVcSUnYmqsYRLvK9un5OvR9poevBTgA@mail.gmail.com>
X-Gm-Features: ATxdqUGCh4k0tCxGJc8o-rbA0OfuL2r0BIEhDobkEiZf3HL2t6VOpsmCQCRIaqk
Message-ID: <CAMuHMdWWM=ftk3AYTQJFVcSUnYmqsYRLvK9un5OvR9poevBTgA@mail.gmail.com>
Subject: Re: sound/soc/qcom/sdw.c:93: warning: cannot understand function
 prototype: 'ret = sdw_enable_stream(sruntime); '
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 10:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 26/04/2025 15:32, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   02ddfb981de88a2c15621115dd7be2431252c568
> > commit: db7e59e6a39a4d3d54ca8197c796557e6d480b0d ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc
> > date:   6 months ago
> > config: sh-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 12.4.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504262154.sBmNTrcB-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> sound/soc/qcom/sdw.c:93: warning: cannot understand function prototype: 'ret = sdw_enable_stream(sruntime); '
>
> This looks like compiler issue. I check the config and SOUNDWIRE is
> selected thus sdw_enable_stream() is reachable. I also cannot reproduce
> it sh4-linux-gnu-gcc v14.2.

I also couldn't reproduce it, using the specified commit ID and
the reproducer instructions, with gcc versions 12.3.0 (Ubuntu
12.3.0-17ubuntu1) and 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
