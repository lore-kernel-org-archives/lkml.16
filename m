Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABDD2D5C81
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882751; cv=none; b=pw6M17pCVukalHdr+7MOANqOCV+4le8ulDuTirF8RY4DX0CAmw9QMgQ3mfLG/Riby+t9ZwXQtIPFQaEK12eZbctiOb7l2eRibwQTU+7tB5/FV8SyHZPqizUHngjIvr/VDOuXuTIcgTeo81URvxGdFUpSPOs8U9/DYz+GgWAPO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882751; c=relaxed/simple;
	bh=1Gf0qpjiCjf9iZ1jAzMXyyL/GunAzDM7aVsBdZ4/ySI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Eex6TdMEjxnvZfQ1MFBG2++feXqlWTtf/g6o4U3ZLHFW1Ww+VQPGmXtZs/hN85fsZwGeUfABrJTWP544zIv0NUM9uHEzDSF9FLXkMeQFOtk7zG5JlDs4Xyq79E/1FqJ23rchaEPgvhzbqcjPDL1i0SN5yI1aA9mMoe8XS1C8S98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDySyzjT; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDySyzjT"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-407aaace4daso171971b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882748; x=1751487548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onNVXuSbIFlcy7frbu83Prt+nhvqq3eE8ga25tI8NzM=;
        b=jDySyzjToem973OC7zShWVbE4S2DkxRP5LwahL+Jd+r2Z19HEDJs5V8Zm/ta1/7mBm
         Ov8OMCzZZ8tK3tXpQI0qqeuPa8Eaqfo6KRxBN+j9F/yrso0bun0S+P0+e+DkMsvHQpVh
         Xz4vuFzCFaXuAaa9SHlHPeMwtK6S1uHXRBnidkjNrPGfQ7W75FLmqvsVQiNIzkLcrYbm
         Z+oTfl3KpVTrhY4nkOij4qunDhAWlLG0Hp+Pm37/6BTrzmwViK/7dZ84v6I/cgNKFHO2
         imv2yoTTithgY4g7bMXqqxkgQ5uM22gyfzCx//LIAHeBnZkx9RtcG2ZsL9dbSgBYwFuO
         3ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882748; x=1751487548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onNVXuSbIFlcy7frbu83Prt+nhvqq3eE8ga25tI8NzM=;
        b=SiIaB+5nhZVdzc+/CaYHJeoKdkaEM2wCr9lvXaxVSbcSt3QjysJahKTJ2Ic69vpwp8
         aX0o2lNWCjDyUsWQUsHFxfxlcjRvlebTndKRaF9AkgjgiVyxiYu6OhLzRb/5hTKvFkvJ
         d5FkvBzyqbpei76Kmq1D2fj8aWY0EPGXxXV1eBotv1u/Xxf1lp1OEFwWkg0B5zD1sUFk
         9KNOA/WAQHI3NmgShwX/ttiJ/07d7VWZZlrnaVgL74oElCPb6naQenoX3AamwNY9UqlG
         GxTDKWiVGWEZwuvmOcns/uedOsItwzDY/pDOsMyVZus6a+h2f3g3mFSgUPDoUvvgnuwI
         ibsg==
X-Gm-Message-State: AOJu0Yzr2HAOF2F9Xfy1mr2hVOsKAqVbfV5c1IRQmOayciebebEjMsGn
	ubgmbwsSnKK0Sh7dzKfdFD/38mrsUlzcmCXo5LP5uVGVp9pppqEfQxRxisK1YJ5L
X-Gm-Gg: ASbGncthPtkWi56MXM5CDoV3T289/0OvaAl0Bzz1L9qiAOgeGBUFBjizey+rs/ZS9o/
	b++HsVcMPNOiHa17v/bPtJBsAycZmGCYC61fvY9AfPvpP2HXZy21SqHEwZ8S5dMPj4oQL8JHidG
	IGcpvbZz8Ov+dcqKxejYbGExgbHxZ1HMzH3apP8sGY+8wBoT4bTa702bDE6BSPHqdz61Awno31t
	Gayl2QzgkAHJ0M3dd9ZoVyrtI0uHjvjui6VF/69xGEGUr/L+4/LQt5RkPhHAoaI/9cyrw0BecOO
	YgK6HCCAL9vlXCJCnO8ZYewAhUvONLkabueOjQE4aBRnrGcvqTDTkb0XW3k65olP2Kad6dt/Dnh
	qu+eHOqs=
X-Google-Smtp-Source: AGHT+IHueD54JkX9PPRAjzVEJoW4n3jQNUrmLBzManXDVShulUALPX/DPQ0I9lujqWAtLJnL22cVmQ==
X-Received: by 2002:a05:6808:1894:b0:407:a501:19cd with SMTP id 5614622812f47-40b05c427b9mr3936207b6e.29.1750882748007;
        Wed, 25 Jun 2025 13:19:08 -0700 (PDT)
Received: from localhost.localdomain ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2319188b6e.42.2025.06.25.13.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:19:07 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v10 0/5] shut down devices asynchronously
Date: Wed, 25 Jun 2025 15:18:48 -0500
Message-Id: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the ability for the kernel to shutdown devices asynchronously.

Only devices with drivers that enable it are shut down asynchronously.

This can dramatically reduce system shutdown/reboot time on systems that
have multiple devices that take many seconds to shut down (like certain
NVMe drives). On one system tested, the shutdown time went from 11 minutes
without this patch to 55 seconds with the patch.

Changes from V9:

Address resource and timing issues when spawning a unique async thread
for every device during shutdown:
  * Make the asynchronous threads able to shut down multiple devices,
    instead of spawning a unique thread for every device.
  * Modify core kernel async code with a custom wake function so it
    doesn't wake up threads waiting to synchronize every time the cookie
    changes

Changes from V8:

Deal with shutdown hangs resulting when a parent/supplier device is
  later in the devices_kset list than its children/consumers:
  * Ignore sync_state_only devlinks for shutdown dependencies
  * Ignore shutdown_after for devices that don't want async shutdown
  * Add a sanity check to revert to sync shutdown for any device that
    would otherwise wait for a child/consumer shutdown that hasn't
    already been scheduled

Changes from V7:

Do not expose driver async_shutdown_enable in sysfs.
Wrapped a long line.
 
Changes from V6:

Removed a sysfs attribute that allowed the async device shutdown to be
"on" (with driver opt-out), "safe" (driver opt-in), or "off"... what was
previously "safe" is now the only behavior, so drivers now only need to
have the option to enable or disable async shutdown.

Changes from V5:

Separated into multiple patches to make review easier.
Reworked some code to make it more readable
Made devices wait for consumers to shut down, not just children
  (suggested by David Jeffery)

Changes from V4:

Change code to use cookies for synchronization rather than async domains
Allow async shutdown to be disabled via sysfs, and allow driver opt-in or
  opt-out of async shutdown (when not disabled), with ability to control
  driver opt-in/opt-out via sysfs

Changes from V3:

Bug fix (used "parent" not "dev->parent" in device_shutdown)

Changes from V2:

Removed recursive functions to schedule children to be shutdown before
  parents, since existing device_shutdown loop will already do this

Changes from V1:

Rewritten using kernel async code (suggested by Lukas Wunner)

David Jeffery (1):
  kernel/async: streamline cookie synchronization

Stuart Hayes (4):
  driver core: don't always lock parent in shutdown
  driver core: separate function to shutdown one device
  driver core: shut down devices asynchronously
  nvme-pci: Make driver prefer asynchronous shutdown

 drivers/base/base.h           |   8 ++
 drivers/base/core.c           | 210 +++++++++++++++++++++++++++++-----
 drivers/nvme/host/pci.c       |   1 +
 include/linux/device/driver.h |   2 +
 kernel/async.c                |  42 ++++++-
 5 files changed, 236 insertions(+), 27 deletions(-)

-- 
2.39.3

