Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B320DD6D;
	Mon,  3 Feb 2025 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592741; cv=none; b=MlBVns8mrMhBhkNY7iF26ITrQISYesjAu2KPwTFsGbV0Uiitl1VRo0vLyfBlGM/FRaopN9s5P+vSPU+UGgn/WVOI1tQd0bKLkGlY4Nrj9a3xmmjSFWmvk5zPOzXjVvnjpPLYJC0rFsXmqYsgE1yp9vNrUGIO1OIoGktlccamKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592741; c=relaxed/simple;
	bh=Tr1imY13QGvRJXDQjC5FyEnXQPsLbVm7/qp4FNod+RM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S81eyVd6xCyrMrVq9gQ1bZQpaVLNFTaNRtgbQKMuc9TP+VwK7jssoJ8075yf1dQ9xIRoI5Z24Cimcjy7Xmvpfjx/ZJnT2CSEH5cYNkNVCa/X2fBsJ9YC7QfRLc5Vpguiq4jN1L76gqWSKG44JqOsPzSXeYkAULxlHi1lzpkWkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J4U7WTFb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J4U7WTFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01CEC4CED2;
	Mon,  3 Feb 2025 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738592740;
	bh=Tr1imY13QGvRJXDQjC5FyEnXQPsLbVm7/qp4FNod+RM=;
	h=From:To:Cc:Subject:Date:From;
	b=J4U7WTFbZBUtD5YFxHLAywPIphL9ZlauOou6GT1gs55+OMB1wBGRyd3cLK4iwar8E
	 MyFu5SDJBJF2ZZ8D9U0tr4irNXlm/xItmQg3Xu/BNNJszNXWlj/uNGEQkIr5WeqLHk
	 Temp7do0seWz3hLF90BFTSi0UxgeDXVJJrmbsr1g=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] Driver core: faux bus
Date: Mon,  3 Feb 2025 15:25:16 +0100
Message-ID: <2025020324-thermal-quilt-1bae@gregkh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Tr1imY13QGvRJXDQjC5FyEnXQPsLbVm7/qp4FNod+RM=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLLl7ZP336xA+nQ/9YWk7e1M54Ya/qeU3+gEubJ//+F 6TzfN9i1Y5YFgZBJgZZMUWWL9t4ju6vOKToZWh7GmYOKxPIEAYuTgGYiLETw4IZW6dH8i+9cejR xsIkOc0NKQ+mXj7DsGCRWP7bCZ5zDkurzDmWUu7u8MV48R8A
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

For years/decades now, I've been complaining when I see people use
platform devices for things that are obviously NOT platform devices.
To finally fix this up, here is a "faux bus" that should be used instead
of a platform device for these tiny and "fake" devices that people
create all over the place.

The api is even simpler than the normal platform device api, just two
functions, one to create a device and one to remove it.  When a device
is created, a driver is also created and automatically bound to it,
which allows for the probe/release callbacks to work like expected.
When finished with the device, just destroy it and all should be good.

This simple api should also hopefully provide for a simple rust binding
to it given the simple rules and lifecycle of the pointer passed back
from the creation function (i.e. it is alive and valid for as long as
you have not called destroy on it.)

I've also converted two different examples of platform device abuse, the
dummy regulator driver, and the USB phy code, to use this api.  In both
cases, the logic either was identical, or became simpler, than before, a
good sign (side note, a bug was fixed in the usb phy code that no one
ever noticed before).


Greg Kroah-Hartman (3):
  driver core: add a faux bus for use when a simple device/bus is needed
  regulator: dummy: convert to use the faux bus
  USB: phy: convert usb_phy_generic logic to use a faux device

 drivers/base/Makefile               |   2 +-
 drivers/base/base.h                 |   1 +
 drivers/base/faux.c                 | 189 ++++++++++++++++++++++++++++
 drivers/base/init.c                 |   1 +
 drivers/regulator/dummy.c           |  37 ++----
 drivers/usb/chipidea/ci_hdrc_pci.c  |   2 +-
 drivers/usb/dwc2/pci.c              |   4 +-
 drivers/usb/musb/mediatek.c         |   4 +-
 drivers/usb/musb/mpfs.c             |   4 +-
 drivers/usb/musb/tusb6010.c         |   2 +-
 drivers/usb/phy/phy-generic.c       |   9 +-
 include/linux/device/faux.h         |  33 +++++
 include/linux/usb/usb_phy_generic.h |   9 +-
 13 files changed, 251 insertions(+), 46 deletions(-)
 create mode 100644 drivers/base/faux.c
 create mode 100644 include/linux/device/faux.h

-- 
2.48.1

