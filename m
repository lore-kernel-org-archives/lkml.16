Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7C285417
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241359; cv=none; b=quMg8BECNUGsyDMuhD9UfXTUCptS83wSXn97KT3lBVHJwtwelCmMocnYRLUzuYTedXKRrYyi4NlXUb9CIbUyWLxG+nNHO6NafR8BDPR8kmXsliS7SuS15hTCh7XrqQE8KnJyyC3Bv3EAmzdiNSfaaMZwa8qNcC114gdHVL8a/YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241359; c=relaxed/simple;
	bh=7jLGs5b1ksYQ02JT9eBjikLL5NvZEEMuMPph1yZHAMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WbaRSmGAxAJ3WGTltIynRMkpetc3ednz/cZcz5/IYFNcRR/lgUZ1VINT+z8bn44FpdE2aKApXTsSZRH7jFahwt72qBOLGGsfk806ieeKA1v42XFmRSLPdD8YHrQoKUFm9VBVnjNevV90uDjXAieuLCQj6NoV+/4uKqA17VMxuho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LR414Fgq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LR414Fgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750241358; x=1781777358;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7jLGs5b1ksYQ02JT9eBjikLL5NvZEEMuMPph1yZHAMA=;
  b=LR414Fgq2kiMKIY/Z9wzPHzqEOcAY3up3oPzx2K2MX3dx+soFBdo+zEb
   MYYThSYpA0Mt6cls29uJmnanabi+GV6glFwxtKVFuuSiFAU1BHyFrCI8S
   GUufhdGcYOJQChUDoIk7/qFEM+vlzqSvfPRny/wOMawgAjyU86t0yFkzR
   VIaOQpSXzHFyEEdv2jliCG2EBZxBgMIfFZT/4MKXtwRpHqOOV5AzHjWkz
   nqMAsWgJCfscq/fT3KZHDx6s0CcUaudRl9vzM196le/BswXwy7ejn7lvF
   0fDZmEmiUWPs+9IOI70Ht9VoGD2X3KMV0wcxJafW0uozmRrxGD9Fm+Sa/
   Q==;
X-CSE-ConnectionGUID: ZE7YXWGAS7idSRZvoUMrdw==
X-CSE-MsgGUID: N1Vm1WaUQuWNMRDlK8rRgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52590999"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52590999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:07 -0700
X-CSE-ConnectionGUID: R+XRjZEvQH+7OPRBvFcCYA==
X-CSE-MsgGUID: R5zxyyINTNKAPnA7XxdydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149461166"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:05 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next 0/3] mei: fix mei_device lifetime
Date: Wed, 18 Jun 2025 12:54:30 +0300
Message-ID: <20250618095433.3943546-1-alexander.usyskin@intel.com>
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
This leads to use-after-free if mei character is opened
when parent device is destroyed.
Introduce reference counting on mei_device and
decouple cdev from main structure to allow all memory
to be released when it is unused and not before.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201

Alexander Usyskin (3):
  mei: refcount mei_device
  mei: set parent for char device
  mei: make char device control its own lifetime

 drivers/misc/mei/bus.c          | 10 ++++++---
 drivers/misc/mei/gsc-me.c       |  6 ++++--
 drivers/misc/mei/hw-me.c        |  2 +-
 drivers/misc/mei/hw-txe.c       |  2 +-
 drivers/misc/mei/init.c         | 35 +++++++++++++++++++++++++++++++
 drivers/misc/mei/main.c         | 37 ++++++++++++++++++++++-----------
 drivers/misc/mei/mei_dev.h      | 10 +++++++--
 drivers/misc/mei/pci-me.c       |  5 ++++-
 drivers/misc/mei/pci-txe.c      |  5 ++++-
 drivers/misc/mei/platform-vsc.c |  7 ++++---
 10 files changed, 93 insertions(+), 26 deletions(-)

-- 
2.43.0

