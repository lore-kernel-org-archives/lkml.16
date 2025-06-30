Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1001E242D6C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275986; cv=none; b=MvauvEGsAkSLjX051/sgC8SjYe8MogEC3+jktoXkNWRn8sSQ0D/RpuB6XWxgolue9701U4heRlL8XF8e4TKk6XvvJkcdvTWS8Xt8RKChx7QUjUW7DRqKR1fi45AvBZxGeKh0T49t6BQ2L8gSDMZat+755DdzyvDAa1Pi1N/VNHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275986; c=relaxed/simple;
	bh=u+ZGIprYPz4AfFrUHryY9pVM19USjmI9lToFxhGnjJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzVd6NdTYixpHClPxdpnEk35BE+A4RVOXEfYpS+xl/5KadzotQCf/eP9lZBVWDDU0F748crLekSooPgpe2v+c6zzv32MsIPrpa/UPVrpJSA1sOmBKHwDtdflTgVCd9z68P6g6QiuU+u1bQxSLow5VrjsEoRGMULPCjsl1Ccb820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTJMjBhv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTJMjBhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275984; x=1782811984;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u+ZGIprYPz4AfFrUHryY9pVM19USjmI9lToFxhGnjJo=;
  b=aTJMjBhvNPiqzvHVoJXZUplmKYtYZDY8w+V9b/H61ZJm5HgPlAf3XrBY
   aHI5ESdDOzLYp0cwCbzi4B8Fy0wbHTAEYqb3jqOdx6vyfTh0eJeO2IwAO
   PkRf8lv/PXXiii/df90YKzETV+vdPZmYBBUY1yWpw6GSYFeXowffZ44GQ
   zFeapH/prFCnFXfFGF3/1wiJu8Nhzj/eygbxbzUWyHrOBo0EmG/QSx2T4
   KKv9XXNOf4gSIjscCudO79h+/0xAw9tTlbqYRxbnu1WOX73ArPChKDAkW
   3Lm3TJNLWg9xL98gRDbWuEWgkO61TZjaOXL0isLahbIEcfdyosaTyOAC5
   Q==;
X-CSE-ConnectionGUID: td1066ELQ6q0LyyYUYeTMw==
X-CSE-MsgGUID: 20mP8wIETIiK0KscRuC3OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53218588"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53218588"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:04 -0700
X-CSE-ConnectionGUID: 6l22WxozTP+eSBHN3qSPyQ==
X-CSE-MsgGUID: zG+IhRcERiSfyaJUqo5ipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153039555"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:02 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next v2 0/5] mei: fix mei_device lifetime
Date: Mon, 30 Jun 2025 12:19:37 +0300
Message-ID: <20250630091942.2116676-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mei_device data structure is allocated using devm_* functions
and hooked to the parent device.
It works for client systems where parent device is pci one.
When parent device is auxiliary bus device produced by
graphics driver, the parent can be destroyed before child
and on the way it cleans all allocated memory.
This leads to use-after-free if mei character device is
opened when parent device is destroyed.
Introduce device to hook the mei_device lifetime on it and
decouple cdev from main structure to allow all memory
to be released when it is unused and not before.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201

V2: Make cdev patches first to avoid double refcounting
    in the middle of the series.
    Replace manual refcount with special device.

Alexander Usyskin (5):
  mei: set parent for char device
  mei: make char device control its own lifetime
  mei: bus: use cldev in prints
  mei: more prints with client prefix
  mei: create dedicated device object

 drivers/misc/mei/bus-fixup.c    |  16 ++--
 drivers/misc/mei/bus.c          |  42 +++++-----
 drivers/misc/mei/client.c       |  82 +++++++++----------
 drivers/misc/mei/client.h       |   6 +-
 drivers/misc/mei/dma-ring.c     |   8 +-
 drivers/misc/mei/gsc-me.c       |  13 +--
 drivers/misc/mei/hbm.c          | 135 +++++++++++++++-----------------
 drivers/misc/mei/hw-me.c        | 101 ++++++++++++------------
 drivers/misc/mei/hw-txe.c       |  62 +++++++--------
 drivers/misc/mei/init.c         |  85 ++++++++++++++------
 drivers/misc/mei/interrupt.c    |  47 ++++++-----
 drivers/misc/mei/main.c         |  99 ++++++++++++-----------
 drivers/misc/mei/mei_dev.h      |  15 ++--
 drivers/misc/mei/pci-me.c       |  12 ++-
 drivers/misc/mei/pci-txe.c      |  10 ++-
 drivers/misc/mei/platform-vsc.c |  18 +++--
 16 files changed, 404 insertions(+), 347 deletions(-)

-- 
2.43.0

