Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D9220A5C0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598339; cv=none; b=ge3eOk2PPj97u5DJBXMIevZlA8fW3y/C34P5rtfvbUeWoDgxWp8aU0mAy2pvLaEdcuh3O2WDuLTw4vIeLvJEKesfstICO3KGeLNfQabaswQ7FrpgFE+NH1FPteKSKsMO2CaB3v50gepzsDypZFqAFWn/pfC65iyuhYF4oVnEJAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598339; c=relaxed/simple;
	bh=aUrbssakHKRmbHsTKxoIl+W1rISGH8qU5OuzHz3Ol6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1NAIBRkxwUv/GUpkDkSkRpU4DSlj8wyirgZ9e14ENZmmSgcgQAgcFm3VJqVlvvdFvuLCgpm3uPP6Goc7mR3bbQiq27MpQcL+JhtI9vRdXx4f0iw0xllMPrMWcYGsaPPa8sqcJejEU02cOyXqbCSYzd8cEg8rq2ctjUsbSicqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4MoJL3F; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4MoJL3F"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so5788018a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738598336; x=1739203136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpktXx5iJjZi+5c0dXUGpqrqAIBxwOyO2Pl2fHijR8g=;
        b=F4MoJL3Fnl1afOem/3Q4Kv+AlTiGqBolZL2TZNicv8mZrqlYg0txrgErn94OknZxLi
         9QuzDYvbB9kwhPAHbZPgK0qp4BDlEJKrQSijlrdmKzCWx3JXsNosG40V/UxNZqOs2fzI
         r3+ZDoV+RUUkq6QrlLOBU60W9aI8qOh/+5uFOWRePrNQLDCOuityWTcB5AwcT5WLxuac
         wQNQeot2ABULDGxoALm0FqqNWHFjdTiT6FmeNoYJkFrDjNbrpEVFOkPm3Uj1WW9BpMyJ
         ahKCHs41Mvt4rXDn3Rscia+EYRRqIkmGCrYfjoQWnd1WnDkJm4uOmsxRAZZNC1t4+7ME
         tWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598336; x=1739203136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpktXx5iJjZi+5c0dXUGpqrqAIBxwOyO2Pl2fHijR8g=;
        b=sJcqthakXHnEvfvnQ6pT/5Z9o8Mii5ydwKgeg++n6Hqxm1rMljPGu5drHdNAcrZihA
         Taun9GDUHl6twdm/4AjxOFlDCDMLecpOPASx+4PSA6Hj91AzSvc+HRj13UIvT9oDg0zd
         EdvOOhcktcFTLV7qVfNrl3EmRktKG+R40btnGb3OSKBrXPyGMXOAMMxkilAq4eMzS3A3
         vKaAaS9JtWhCD9U3OrGS4ejhgtG9UjvwOLh6ZrycCZ2F9+jtNU7k6C3LS9XS/06hxPla
         3OgtNcShEyfFmAynytXbrOis/iXlqsZ9LMJFhYnN0vV/PlAgbwP9cGN+KQGCARE8I1nc
         Wk4A==
X-Gm-Message-State: AOJu0YzPo6jt/dGhgy8EiMMKbvZyphjsO150Yq7YU5ogOcZc9qISJYaH
	+FEzAea+C7dDiofwgiOZPWf5WLb3Gq24QtpRl4sPmKHsuJrX0V0p
X-Gm-Gg: ASbGncuUJMZyihalRs+69YBsVkbbjwJzDrnpTBrDG83rRqERgKahoIiRFkhBv8Tw/Tj
	5zIAjFFFR7yfflszvvQ6OYshr5ZD9ZmjGSbrUHn//RUJAGjPVRAXifBIKPt0syVOS6MXCuOzNFu
	IC/VxxudZMLQb4h+y+jBXvsSaqehIXaWobiEt2QBo44F/q96dPLMtK+qPQ00iFpFZx/AcHPDbD6
	foE77Kh9kY7jN2ODqEaAK3UxE8daHNKqm0M9UR6X4qtuptyx/+lSzvxZqRAdTifEvtpg3EZqx8R
	kVARvMDe+eBwvwIKge1FvTqLfeRo
X-Google-Smtp-Source: AGHT+IFQm0tOwqWRaucnv0UpFfDG/Qz3pkhDVmQgsjERxkyQpWFs28Y96pTizCcD6WtHzlY4VppT1A==
X-Received: by 2002:a17:90a:c88b:b0:2ee:8619:210b with SMTP id 98e67ed59e1d1-2f83acaf8a0mr32599958a91.29.1738598336329;
        Mon, 03 Feb 2025 07:58:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea47dsm77523305ad.155.2025.02.03.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:58:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 3 Feb 2025 07:58:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Kees Cook <kees@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux 6.14-rc1
Message-ID: <28ff9a23-f7cc-49da-8975-788ba0646763@roeck-us.net>
References: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>

On Sun, Feb 02, 2025 at 04:26:53PM -0800, Linus Torvalds wrote:
> Two weeks have passed, and the merge window is over.
> 
...
> 
> Let's hope that a small release also ends up meaning smooth sailing
> during the stabilization phase. That's obviously guaranteed, but
> fingers crossed...
> 

Build results:
	total: 161 pass: 156 fail: 5
Failed builds:
	i386:allyesconfig
	i386:allmodconfig
	parisc:allmodconfig
	sparc64:allmodconfig
	sparc64:defconfig
Qemu test results:
	total: 544 pass: 517 fail: 27
Failed tests:
	arm:npcm750-evb:multi_v7_defconfig:npcm:net=nic,npcm-gmac:nuvoton-npcm750-evb:initrd
	arm:npcm750-evb:multi_v7_defconfig:npcm:mtd32,6,5:net=nic,npcm-gmac:nuvoton-npcm750-evb:sqf
	arm:npcm750-evb:multi_v7_defconfig:npcm:usb0.1:net=nic,npcm-gmac:nuvoton-npcm750-evb:ext2
	arm:quanta-gsj:multi_v7_defconfig:npcm:net=nic,npcm-gmac:nuvoton-npcm730-gsj:initrd
	arm:quanta-gsj:multi_v7_defconfig:npcm:mtd32:net=nic,npcm-gmac:nuvoton-npcm730-gsj:ext2
	arm:quanta-gsj:multi_v7_defconfig:npcm:usb0.1:net=nic,npcm-gmac:nuvoton-npcm730-gsj:ext2
	arm:kudo-bmc:multi_v7_defconfig:npcm:net=nic,npcm-gmac:nuvoton-npcm730-kudo:initrd
	arm:kudo-bmc:multi_v7_defconfig:npcm:mtd64,8,3:net=nic,npcm-gmac:nuvoton-npcm730-kudo:cramfs
	arm:kudo-bmc:multi_v7_defconfig:npcm:usb0.1:net=nic,npcm-gmac:nuvoton-npcm730-kudo:ext2
	sheb:rts7751r2dplus_defconfig:ext2
	sparc64:sun4u:smp:net=default:initrd
	sparc64:sun4u:smp:ata:net=rtl8139:hd
	sparc64:sun4u:smp:ata:net=e1000:cd
	sparc64:sun4u:smp:ata:net=e1000-82544gc:hd
	sparc64:sun4u:smp:sdhci-mmc:net=rtl8139:hd
	sparc64:sun4u:smp:nvme:net=tulip:hd
	sparc64:sun4u:smp:scsi[DC395]:net=i82559c:cd
	sparc64:sun4u:smp:scsi[MEGASAS]:net=i82559a:hd
	sparc64:sun4u:smp:scsi[AM53C974]:net=usb-net:hd
	sparc64:sun4u:smp:usb-xhci:net=virtio-net-pci:hd
	sparc64:sun4u:smp:usb-uas-xhci:net=i82801:hd
	sparc64:sun4u:smp:virtio-pci:net=i82559er:hd
	sparc64:sun4v:smp:ata:net=i82562:hd
	sparc64:sun4v:smp:ata:net=e1000-82545em:cd
	sparc64:sun4v:smp:nvme:net=default:hd
	sparc64:sun4u:nosmp:ata:net=e1000:hd
	sparc64:sun4v:nosmp:ata:net=pcnet:hd
Unit test results:
	pass: 472629 fail: 39

Most failures are known with fixes submitted. Patches with more details
are available in the 'fixes' branch at
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git.

950432b79a5d net: stmmac: Allow zero for [tr]x_fifo_size
	Fixes arm boot failures
9d7a89e83e06 dmaengine: tegra210-adma: Fix build error due to 64-by-32 division
	Fixes i386 build failures
eadf076115eb drm/i915/backlight: Return immediately when scale() finds invalid parameters
	Fixes parisc build failure

The sparc64 build failures are due to commit 1e1a9cecfab3 ("block: force
noio scope in blk_mq_freeze_queue"), which changed some APIs but not all
drivers using it.

The sheb boot failure is a problem in the sh4eb emulation, seen when
booting from flash. I just mention it here for reference and will likely
stop testing that going forward.

There is also a parisc64 boot failure seen if KFENCE and SLUB_DEBUG are
enabled. That is also an emulation bug, mentioned here for reference.

The failed unit tests are

	m68k:q800:stackinit

The patches introducing the failures are:

e71a29db79da stackinit: Add union initialization to selftests
ad9f265c7328 stackinit: Add old-style zero-init syntax to struct tests

Similar to 1e1a9cecfab3, those are all last minute patches, so I did
not have time to analyze the problems.

Guenter
