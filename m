Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B622F74F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668656; cv=none; b=Wc3WEObdrcHZ9eyjJIslB+Z04y/PpP2mM1hZajE/OD7i933ZKXS3jXcbVlvwolNqYBDcn1svGGXdkuiOa0hg82aMv3Vs7vxFPZAa5HH2QR7RxYXkTATDp3UIIGWxvUo+LBjLl4lbcTb+wOivsq40znJPS74C5eiqzNSoqdJJ2XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668656; c=relaxed/simple;
	bh=GA/RwxgMSq94FLO1s3RnH6naqbDyw8zedczCjQJ7iYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qso+xmc496KHdI+GpjshkDMMUyYtgeJU3OtxLX6EPsElMd8mR5sb+vRlZxYZssDgoHsnsPnngJfD3zgdYxpABR1vAQF7ZeONeLlcss1m4bC7BiTYB+O6rZIIKBZU8ocsJv07mfjGeCKtWsOlSMQxrXVJC4UmBkhRkzJG1LXX6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9ejy2B8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9ejy2B8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5953BC4CEEA;
	Mon, 23 Jun 2025 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668656;
	bh=GA/RwxgMSq94FLO1s3RnH6naqbDyw8zedczCjQJ7iYw=;
	h=From:To:Cc:Subject:Date:From;
	b=f9ejy2B8IZnZ/O4WS7BjYTUcV6X6j9+uIilhicpZ8loyCHVvY5pd0D3W9HUpgSI3b
	 sjOQD4UBDvCsfV+m6FaBlB0ib9yN6acsJ5bGeFr2cqGYunAKKBbimTbg7W/bVeZUzL
	 WJS41zobfkr4988BZ2rnArJPk83lY5utEmKD3pw/kRIVpICwKEPDCd4i60XIKGQfJG
	 qxUIgDEgwubryer5qw27F5xVMmNuRglHbMuMPPlWoaubGQyMa4ns4bGlLHBr4jqw56
	 jXaZ77zh/BWHDcquPnb6LufLEfIX4oUpMY9u/FADKJr+NzHhv22+lKSXhCu8oQfZEt
	 YbTlTWqVOSQqg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] mei: vsc: Various bug-fixes
Date: Mon, 23 Jun 2025 10:50:42 +0200
Message-ID: <20250623085052.12347-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

When running a kernel with CONFIG_PROVE_RAW_LOCK_NESTING on any laptop
with an Intel Visual Sensing Controller chip, the vsc-tp code will
trigger a lockdep warning.

While investigating this I noticed a bunch of other issues / bugs in
the VSC code, resulting in the first 9 patches of this series, fixing:

- An unnecessary 11 second delay on shutdown / reboot
- Destroying the mutex while the threaded ISR which uses it might still
  be running
- Racy use of the event_notify callback
- Dead event_notify callback still being registered after remove()
- Thread ISR waiting for hard ISR to run a second/third time
- The lockdep issue starting all this
- And some cleanups while at it...

Patch 10 is a generic mei debug patch to help catch similar
use-after-free issues as the on I fixed recently [1].

Regards,

Hans

[1] https://lore.kernel.org/linux-media/20250621140052.67912-1-hansg@kernel.org/


Hans de Goede (10):
  mei: vsc: Drop unused vsc_tp_request_irq() and vsc_tp_free_irq()
  mei: vsc: Don't re-init VSC from mei_vsc_hw_reset() on stop
  mei: vsc: Don't call vsc_tp_reset() a second time on shutdown
  mei: vsc: Use vsc_tp_remove() as shutdown handler
  mei: vsc: Destroy mutex after freeing the IRQ
  mei: vsc: Event notifier fixes
  mei: vsc: Unset the event callback on remove and probe errors
  mei: vsc: Run event callback from a workqueue
  mei: vsc: Fix "BUG: Invalid wait context" lockdep error
  mei: bus: Check for still connected devices in
    mei_cl_bus_dev_release()

 drivers/misc/mei/bus.c          |  6 +++
 drivers/misc/mei/platform-vsc.c |  8 ++++
 drivers/misc/mei/vsc-tp.c       | 80 ++++++++++-----------------------
 drivers/misc/mei/vsc-tp.h       |  3 --
 4 files changed, 38 insertions(+), 59 deletions(-)

-- 
2.49.0

