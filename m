Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5902EEB1;
	Thu,  8 May 2025 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695563; cv=none; b=l5+7i8oKvcQwu+TaR3OJ4k1gE6U4ZLBTg11X+h+46AHWHLhq0NPggeSJqd6nKrhVZZ78GiD+ZORReLcTY7b7s2rjo+xCeVxh1b522mGiYat0OYUd+WF2h3QJE3lL5l+YBXPT8dAu+0MM3Fr8NTLgwqOfsc9TF5y/38/kIRQ8WIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695563; c=relaxed/simple;
	bh=Xg9q5V8ubRrG4rg0ouXl6rH78arCCmUPJ7IuaPvCGW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eqrBkMC7HuZ1+O0stTV+iF8EJeEmDmYs9iHVT7HraFFJbAU/XHTU/PG93XpuNE1EyNLVWk7ua/lUEBD+zfaL+ZukBWzfOJHmmfzFOlgpF2G4Ho5Drr6AhjXcFnbCvRbCFDPfOO8eZhEaCSbDBkVPBYIkoeL6f9G9p/MfvpoAvwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cxCgRMDE; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cxCgRMDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ZP
	p7MdWTHQr85u2Cfw61lwsJtiu1Ktb033HYmQ3txz8=; b=cxCgRMDEczIqya25eD
	HjYoi1+U9Awr5ZhIjGpWw0cUmxSDvEJwjHsgwmW/Bna5IU39u2HTO6NnFxvk3hrQ
	Db3Rua1cLntbZykDEEkmi1+phyVKTluWSsIxQZPIXxmyz62k5BTmbj9E64nd3Pob
	y0OXWSoH6FD6DMFzMCpjEeSM0=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnkrxXdRxoTLzdCA--.3706S2;
	Thu, 08 May 2025 17:11:52 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	markgross@kernel.org,
	arnd@arndb.de,
	eric.piel@tremplin-utc.net,
	valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH 0/2] some changes based on faux bus
Date: Thu,  8 May 2025 17:11:46 +0800
Message-Id: <cover.1746662386.git.zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnkrxXdRxoTLzdCA--.3706S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4UGw15ZFW8uFWkZry5Arb_yoW3CFc_CF
	WUuFy7Wr1xCa45Ga42yw1IvryYkF4Ygr1vq3WjqrWrGry2vr15Jw1UA3y0q3Wjqr4UAFyD
	X34kX348Aw1fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU85UUUUUUUU==
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbixwRHq2gccH6XcwAAsx

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

This patch series include 2 changes:
1. modify faux to support setting some specific data to 
device's platform_data for drivers who convert to use faux bus.
2. convert to use faux_device for vhci-hcd.

Zongmin Zhou (2):
  driver core:add device's platform_data set for faux device
  usbip: convert to use faux_device

 drivers/base/faux.c                  |  9 ++-
 drivers/char/tlclk.c                 |  2 +-
 drivers/misc/lis3lv02d/lis3lv02d.c   |  2 +-
 drivers/usb/usbip/vhci.h             |  4 +-
 drivers/usb/usbip/vhci_hcd.c         | 82 +++++++++++-----------------
 drivers/usb/usbip/vhci_sysfs.c       | 68 +++++++++++------------
 include/linux/device/faux.h          |  3 +-
 tools/usb/usbip/libsrc/vhci_driver.h |  2 +-
 8 files changed, 80 insertions(+), 92 deletions(-)

-- 
2.25.1

