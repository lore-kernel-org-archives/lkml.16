Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC078F4A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320936; cv=none; b=rHTTp4W37uTtZIoOYmDuSqAKVn1RwKS6modavdEJ5yntReomYymA9ol3RW4l1OhpAZnS537qj/kYW+FndqZ26VDZP0DnUd8ZIsZCIedxmghZSzKIeprLAA1/uKj91Zn8m3HkJFhIwSy3VQ3Ah6+GRLk9spzqK76lYobBxY8N0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320936; c=relaxed/simple;
	bh=vwQhB8z8gxqzFVHxbNgfVVA0EwneV2MVlmUEKghKeKs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ER3hkHtJapQ/aeU1gsgonB8YufZpmTfGTSI6rhW6Coq9tmCgUbBOATxoiz7E2tKJjw7mt8W4XZ1uhyPS/o6FW8d0GUxlozkZ8AY/hFE4LaW2o3O9wQyQOISNdYw+Qn9HADg2GfOie9L72yQDdHtXvl+mKfxHtLADtxrSQcmJPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=awBmXhCA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="awBmXhCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751320934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F1sYDNShdB+06sCJ84BRO2bPUNIHjiAunARjjFgiGns=;
	b=awBmXhCAxqIYrLpbhSgLKdMyackYBg8y6eSVvfxfJXE9mDKDee5nZaiZFUMY6LOIP+VIG5
	nWcQ6vczlkGuW3t1tCmzu/hUSOKYB5sLTO3JjiQ6Co9clOkvxt2WVqiw0VMk4j12gn519z
	7t4hsg1dHitzK0J9OdXML53dRznndhg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-ugjNDNgjNtmrLXrkjzO-bA-1; Mon, 30 Jun 2025 18:02:07 -0400
X-MC-Unique: ugjNDNgjNtmrLXrkjzO-bA-1
X-Mimecast-MFC-AGG-ID: ugjNDNgjNtmrLXrkjzO-bA_1751320926
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a82d415dbfso9732431cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751320926; x=1751925726;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F1sYDNShdB+06sCJ84BRO2bPUNIHjiAunARjjFgiGns=;
        b=bkWd1bn8d2iirQGbE4LsMaEzIYvMHHkgBrEeDpc5ms0h7wzmNK+hhfaLZ8H81QlMmS
         lf8cALDpRk/uszwJmJBGguGJYZ3j9/UC7+txyaMgzX1XPw46Vh4dwLhlTy/4xFfL2mFc
         xu0LU/3Oc7SpylshKsXIhfAj8UexP6mjSyHW+cQVZIW1DH/pCJu5Cn/zD77JGJGUcjUi
         uCdLK4Ly7QmJc480x01lBdw6tqWOCW82yu7aXXD0hZ5oe6JYnYykFyn5FssgSoYaPgh6
         /IwEOd2BcFe9rhj0HUqZxigRBuPfRKZ7FPvryUXSmTfxK5iN6wCB4LqArMHK7vzG+0YG
         QdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUvoBNoTEOLz9LC/tQCNPRNW4zHXFmAaU8eLqz5PTL+GPfB0bbH0NQAqv2znPLTctznWCTGpYZJcyKf9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf19LvreK++itcnnuSDa9aTlPixG0jmeyJdYyW62sWKE330P5w
	SOBMHWjK1MGVagwUDdfGtgftrPgMEJsJxx8UlgD4o3mzw9VPHoeOpkb4KGxvGPFQIpHeXmiVhWA
	j+fHWJaOgqxxZ1Af7XlVqDwQf0ByKdC20GeECsvgqgzMNN5EVWSHWaliB5+FhJ1qa7A==
X-Gm-Gg: ASbGncsj1jx895WJs0SEgCwKXsSn/TYJgNDzBw1XT6yhtE/IhhSCjh5w0qByA2KTihD
	MSVdWPujWACm6YBLekPPHBHKP+WGRXpE7LgnyDATBB6vNG2QfT+qqv3562kw7mcrk85foEWDVi4
	iQ+p/y6OeL0PDCad+uQx1lTFXqoNaAgocVmIfFw9LOToHUazaQRFExJanZngbun9NCCINBhmOkU
	9WOX3NmPX8QtEii85Im5wR4ASRA5RzsKxjyWPhmpODSEmqYyINrKYHEzoUAjRXecb5iPKlNQGDS
	C/w6sKklmP4OmGX8vOjwEoDyNR72gBevAByIWJT70tqpz0XPGJnP8y/OZX1cB5hRZH43KugzqM2
	fEXZfqvSf6QkaSfdC
X-Received: by 2002:a05:622a:1aa3:b0:494:9455:5731 with SMTP id d75a77b69052e-4a7fcd0a50dmr219040311cf.7.1751320925280;
        Mon, 30 Jun 2025 15:02:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl8Lp0HJdj/5CubO6LymZShiX5YgxAMs0JiwsT/sFHj3mnBG/ZbF1kylGa3wRxDA6ZElp2cQ==
X-Received: by 2002:a05:622a:1aa3:b0:494:9455:5731 with SMTP id d75a77b69052e-4a7fcd0a50dmr219039711cf.7.1751320924728;
        Mon, 30 Jun 2025 15:02:04 -0700 (PDT)
Received: from syn-2600-6c64-4e7f-603b-9b92-b2ac-3267-27e9.biz6.spectrum.com ([2600:6c64:4e7f:603b:9b92:b2ac:3267:27e9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443150adesm672823985a.26.2025.06.30.15.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:02:03 -0700 (PDT)
Message-ID: <91c3f5cb07df7b6de072e8af90709a803cf52042.camel@redhat.com>
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
From: Laurence Oberman <loberman@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>, Stuart Hayes
 <stuart.w.hayes@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  "Rafael J . Wysocki" <rafael@kernel.org>,
 Martin Belanger <Martin.Belanger@dell.com>, Oliver O'Halloran
 <oohall@gmail.com>, Daniel Wagner <dwagner@suse.de>, Keith Busch
 <kbusch@kernel.org>, Lukas Wunner <lukas@wunner.de>, David Jeffery
 <djeffery@redhat.com>, Jeremy Allison <jallison@ciq.com>,  Jens Axboe
 <axboe@fb.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>,  "linux-nvme@lists.infradead.org"
 <linux-nvme@lists.infradead.org>, Nathan Chancellor <nathan@kernel.org>,
 Jan Kiszka <jan.kiszka@seimens.com>, Bert Karwatzki <spasswolf@web.de>
Date: Mon, 30 Jun 2025 18:02:02 -0400
In-Reply-To: <SN6PR02MB41572B532608AD12685ED678D446A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
	 <SN6PR02MB41572B532608AD12685ED678D446A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-11.el9) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2025-06-30 at 20:33 +0000, Michael Kelley wrote:
> From: Stuart Hayes <stuart.w.hayes@gmail.com> Sent: Wednesday, June
> 25, 2025 1:19 PM
> > 
> > This adds the ability for the kernel to shutdown devices
> > asynchronously.
> > 
> > Only devices with drivers that enable it are shut down
> > asynchronously.
> > 
> > This can dramatically reduce system shutdown/reboot time on systems
> > that
> > have multiple devices that take many seconds to shut down (like
> > certain
> > NVMe drives). On one system tested, the shutdown time went from 11
> > minutes
> > without this patch to 55 seconds with the patch.
> 
> I've tested this version and all looks good. I did the same tests
> that I did
> with v9 [1], running in a VM in the Azure cloud. The 2 NVMe devices
> are
> shutdown in parallel, gaining about 110 milliseconds, and there were
> no
> slowdowns as seen in v9. The net gain was ~100 ms.
> 
> I also tested a local Hyper-V VM that does not have any NVMe devices.
> The shutdown timings with and without this patch set are pretty much
> the same, which was not the case with v9.
> 
> I did not repeat the more detailed debugging from v9 as reported
> here [2], since there is no unexpected slowness with v10.
> 
> For the series,
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> 
> [1]
> https://lore.kernel.org/lkml/BN7PR02MB41480DE777B9C224F3C2DF43D4792@BN7PR02MB4148.namprd02.prod.outlook.com/
> [2]
> https://lore.kernel.org/lkml/SN6PR02MB41571E2DD410D09CE7494B38D4402@SN6PR02MB4157.namprd02.prod.outlook.com/
> 
> > 
> > Changes from V9:
> > 
> > Address resource and timing issues when spawning a unique async
> > thread
> > for every device during shutdown:
> >   * Make the asynchronous threads able to shut down multiple
> > devices,
> >     instead of spawning a unique thread for every device.
> >   * Modify core kernel async code with a custom wake function so it
> >     doesn't wake up threads waiting to synchronize every time the
> > cookie
> >     changes
> > 
> > Changes from V8:
> > 
> > Deal with shutdown hangs resulting when a parent/supplier device is
> >   later in the devices_kset list than its children/consumers:
> >   * Ignore sync_state_only devlinks for shutdown dependencies
> >   * Ignore shutdown_after for devices that don't want async
> > shutdown
> >   * Add a sanity check to revert to sync shutdown for any device
> > that
> >     would otherwise wait for a child/consumer shutdown that hasn't
> >     already been scheduled
> > 
> > Changes from V7:
> > 
> > Do not expose driver async_shutdown_enable in sysfs.
> > Wrapped a long line.
> > 
> > Changes from V6:
> > 
> > Removed a sysfs attribute that allowed the async device shutdown to
> > be
> > "on" (with driver opt-out), "safe" (driver opt-in), or "off"...
> > what was
> > previously "safe" is now the only behavior, so drivers now only
> > need to
> > have the option to enable or disable async shutdown.
> > 
> > Changes from V5:
> > 
> > Separated into multiple patches to make review easier.
> > Reworked some code to make it more readable
> > Made devices wait for consumers to shut down, not just children
> >   (suggested by David Jeffery)
> > 
> > Changes from V4:
> > 
> > Change code to use cookies for synchronization rather than async
> > domains
> > Allow async shutdown to be disabled via sysfs, and allow driver
> > opt-in or
> >   opt-out of async shutdown (when not disabled), with ability to
> > control
> >   driver opt-in/opt-out via sysfs
> > 
> > Changes from V3:
> > 
> > Bug fix (used "parent" not "dev->parent" in device_shutdown)
> > 
> > Changes from V2:
> > 
> > Removed recursive functions to schedule children to be shutdown
> > before
> >   parents, since existing device_shutdown loop will already do this
> > 
> > Changes from V1:
> > 
> > Rewritten using kernel async code (suggested by Lukas Wunner)
> > 
> > David Jeffery (1):
> >   kernel/async: streamline cookie synchronization
> > 
> > Stuart Hayes (4):
> >   driver core: don't always lock parent in shutdown
> >   driver core: separate function to shutdown one device
> >   driver core: shut down devices asynchronously
> >   nvme-pci: Make driver prefer asynchronous shutdown
> > 
> >  drivers/base/base.h           |   8 ++
> >  drivers/base/core.c           | 210 +++++++++++++++++++++++++++++-
> > ----
> >  drivers/nvme/host/pci.c       |   1 +
> >  include/linux/device/driver.h |   2 +
> >  kernel/async.c                |  42 ++++++-
> >  5 files changed, 236 insertions(+), 27 deletions(-)
> > 
> > --
> > 2.39.3
> > 
> 
> 

For the series:

Against 
Kernel 6.16.0-rc4-dirty on an x86_64

Difference of about 15 seconds to shutdown compared to almost 60
Same set of test I always run and stable and repeatable

Looks good again, although V9 also looked good until Mike Kelley found
his issues.
 
Tested-by: Laurence Oberman <loberman@redhat.com>


