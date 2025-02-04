Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5018820C464;
	Tue,  4 Feb 2025 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667381; cv=none; b=V2GHGhF9iitWuldQBO9F1macuvu/uF30wBXQ5rxF9xf04kfmMys9pDgMvdBIYMnJDvGKYjCOMFqHT2ABDth9GBGAZw+zaE/txHE7mRVp4m208T/REOtwyhcty6eT66PjAUWsatyp36k+1SpFCoMI9iMCzhHPXC6Urum8zbQYCEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667381; c=relaxed/simple;
	bh=bRb+2eug7oevSNN6g3guYnjdbVmCxro27070/JAYKzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Trf8V7igpV8BP/pZxowJVIF5Af+/RB/KaLpRe5uMIqyEe5CGDh/zcquFI1YJe8zXuo2X2bdPoD7wPE4D3birvwy80m9kDf/fKTzP1uyIuXE2wnZ4YOGmEZqSTwA54nyKjmI3eBx3uiMPO8LjsA+uCQPoL91OpDEi5KVAITSt6GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jwW2Kgya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jwW2Kgya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3EAC4CEDF;
	Tue,  4 Feb 2025 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738667379;
	bh=bRb+2eug7oevSNN6g3guYnjdbVmCxro27070/JAYKzY=;
	h=From:To:Cc:Subject:Date:From;
	b=jwW2KgyaUOGaHAmTFddQ8oFv+vgNpF4hhdlI2M6P5E6P1+zQsGJ1708KTQJmNqQXn
	 3/NXuFxrNvFpvB1b9j5MZGluPFtrysO7mY6S3FWB7aya2YMVWrFwvFlsnrfxKyDYOn
	 LpQ89qnlVB+cGDxb0/yKh5E7L90EKqfw2bRXyCP4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/5] Driver core: Add faux bus devices
Date: Tue,  4 Feb 2025 12:09:12 +0100
Message-ID: <2025020421-poster-moisture-534b@gregkh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3184; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=kpAC8peIo+RjVDieHvnlhVPcC2SBiZSEpCbrCkyUYHE=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLvyYu969Xz7bblJ67+mrdgh/PLxx6E7qEaWnih0WvK 0S8VzbodMSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEFvcxzJVV9i/9v+fxzQWb g6e3z+nMyPvrpcUwT22D316WWTqJi1muGN7dOXev6lWTNgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit


For years/decades now, I've been complaining when I see people use
platform devices for things that are obviously NOT platform devices.
To finally fix this up, here is a "faux bus" that should be used instead
of a platform device for these tiny and "fake" devices that people
create all over the place.

The api is even simpler than the normal platform device api, just two
functions, one to create a device and one to remove it.  When a device
is created, if a probe/release callback is offered, they will be called
at the proper time in the device's lifecycle.  When finished with the
device, just destroy it and all should be good.

This simple api should also hopefully provide for a simple rust binding
to it given the simple rules and lifecycle of the pointer passed back
from the creation function (i.e. it is alive and valid for as long as
you have not called destroy on it.)

I've also converted four different examples of platform device abuse, the
dummy regulator driver, the USB phy code, the x86 microcode dvice, and
the "regulator" device that wifi uses to load the firmware tables, to
use this api.  In all cases, the logic either was identical, or became
simpler, than before, a good sign (side note, a bug was fixed in the usb
phy code that no one ever noticed before).

Note, unless there are major objections, I'm leaning toward getting
patch 1 of this series merged during this -rc cycle so that all of the
individual driver subsystem cleanups can go through those subsystems as
needed, as well as allowing the rust developers to create a binding and
get that merged easier.  Having patch 1 merged on its own isn't going to
cause any changes if no one uses it, so that should be fine.

Changes from v2:
  - lots of cleanups to faux.c based on reviews, see patch 1 for details
  - actually tested the destroy device path, it worked first try!
  - added 3 more example drivers


Greg Kroah-Hartman (5):
  driver core: add a faux bus for use when a simple device/bus is needed
  regulator: dummy: convert to use the faux bus
  USB: phy: convert usb_phy_generic logic to use a faux device
  x86/microcode: move away from using a fake platform device
  wifi: cfg80211: move away from using a fake platform device

 arch/x86/kernel/cpu/microcode/core.c |  14 +-
 drivers/base/Makefile                |   2 +-
 drivers/base/base.h                  |   1 +
 drivers/base/faux.c                  | 196 +++++++++++++++++++++++++++
 drivers/base/init.c                  |   1 +
 drivers/regulator/dummy.c            |  37 ++---
 drivers/usb/chipidea/ci_hdrc_pci.c   |   2 +-
 drivers/usb/dwc2/pci.c               |   4 +-
 drivers/usb/musb/mediatek.c          |   4 +-
 drivers/usb/musb/mpfs.c              |   4 +-
 drivers/usb/musb/tusb6010.c          |   2 +-
 drivers/usb/phy/phy-generic.c        |   9 +-
 include/linux/device/faux.h          |  31 +++++
 include/linux/usb/usb_phy_generic.h  |   9 +-
 net/wireless/reg.c                   |  28 ++--
 15 files changed, 277 insertions(+), 67 deletions(-)
 create mode 100644 drivers/base/faux.c
 create mode 100644 include/linux/device/faux.h

-- 
2.48.1

