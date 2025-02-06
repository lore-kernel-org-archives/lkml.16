Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EDF1C6FE8;
	Thu,  6 Feb 2025 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851585; cv=none; b=H6FInwrTRxEgsibYda+jQsDHS/+iEGRTKVsB4ujUxG8H65cR2wWI8NXQ/CCD6jZ3XxVWhCGUP6MOBWONjuTcWP7mt4kB9IF0L3Z5GukBaKcgWuJ2xbC2j0+hJedgIHKd13g41BwSjpGyOnEhJtqAT1BcfYOKF4F76kWV+2MOTVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851585; c=relaxed/simple;
	bh=8sq4W8IrQ0+27SFxB12hbYaYo61qqEG/1TjI3i2QdiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=laisu2NWu6nx10IVxWHnNfEKk5Q2bWXji1w/aSl0zWm6C0D4zluIu7rfo2BkwDMM4kaXg5/qhDpJ9vqAlNAUIMIyytt6rh3sxzNSRPnr2ZXgxvDXAdHjWsXzqTRKkBGTdOjxXAzz5oopa4jtpMe5KdrdjPYbkyPqdxlSYOwnKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVVOGS0a; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVVOGS0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738851583; x=1770387583;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8sq4W8IrQ0+27SFxB12hbYaYo61qqEG/1TjI3i2QdiY=;
  b=eVVOGS0aLeK0PaJlgBm0rEJiN1ByOfbzXJirpzIL6xnr2XAHhyAXEdhd
   hmAkTpTBmFxCto+89mWgLpy+tSKf7voivE9j1rsKp7TheFPAdotRGrm7d
   tgRgz6sFH7JnV67gzLLQcGdM9cgdB/eFWhZ7TJNS2Rlo1Mz3FBVj4O6Cy
   yNZMKQp2G7PWyn+DDMXHC/gaa6xuTP1GuKsU7Sb7ipBr0x806mfto/a64
   vZJzHskhOuaKWd3JpVIZwGcXucW4+2DH1WC2zbc+Mt/3V3odFPa3qxL72
   OiExlcbC7KWMvSTKgkfxI1T6ig7/ndvznje9w93FGZ4YWUAtuD0n2h6Cu
   g==;
X-CSE-ConnectionGUID: b2P/d/M5Qd+j4TZQHtNs0g==
X-CSE-MsgGUID: kOK99nKET7O1fLUchRlFWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27056879"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27056879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 06:19:42 -0800
X-CSE-ConnectionGUID: dg5PfXDkSg6x1nn4ywGtZQ==
X-CSE-MsgGUID: rnMto257TdOSTRbsfI9d5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142118085"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 06 Feb 2025 06:19:38 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Jameson Thies <jthies@google.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>,
	"Pathak, Asutosh" <asutosh.pathak@intel.com>,
	"Jayaraman, Venkat" <venkat.jayaraman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: typec: ucsi: sysfs mailbox for commands
Date: Thu,  6 Feb 2025 16:19:30 +0200
Message-ID: <20250206141936.1117222-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

UCSI has commands that can be used to configure the platform policy
manager (PPM, which is the EC in most cases) on top of individual
connectors. That kind of commands are very UCSI specific, and because
of that, don't fit very well into any of our existing device classes
that are all designed to represent the connectors in generic fashion.

Nevertheless, the user space needs some way to configure also the
entire PPM with these commands. Exposing the UCSI data structure as a
mailbox file to the user space felt to me as the simplest way to do
that, so that's why this proposal.

This mailbox is of course not limited to those commands only - any
UCSI command can be send to the PPM with it. Łukasz, would this cover
also your debugging and testing needs that you were planning the
netlink for (although, for the ChromeOS UCSI driver only)?

Br,

Heikki Krogerus (2):
  usb: typec: ucsi: Command mailbox interface for the userspace
  tools: usb: UCSI command testing tool

 Documentation/ABI/testing/sysfs-driver-ucsi |  20 ++
 drivers/usb/typec/ucsi/Makefile             |   2 +-
 drivers/usb/typec/ucsi/sysfs.c              | 127 ++++++++++
 drivers/usb/typec/ucsi/ucsi.c               |  31 ++-
 drivers/usb/typec/ucsi/ucsi.h               |   7 +
 tools/usb/.gitignore                        |   1 +
 tools/usb/Build                             |   1 +
 tools/usb/Makefile                          |   8 +-
 tools/usb/ucsi.c                            | 250 ++++++++++++++++++++
 9 files changed, 432 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-ucsi
 create mode 100644 drivers/usb/typec/ucsi/sysfs.c
 create mode 100644 tools/usb/ucsi.c

-- 
2.47.2

