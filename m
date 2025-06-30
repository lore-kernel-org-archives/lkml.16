Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E8E23FC49
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278672; cv=none; b=r82CrVZT5zhXIPCAKU5w7Lik7/FUYYnDiJaWNAJA7SU2ZffC6exsIkZBGoGxIuMVIFksKJUjk3lF18KkKmRvfdAsA6JpBSmMtYd7O2aGrvvJZ4xo0v4HM11YPycK9ma2QWlhCmv/TTFGBR1LrQ86MeiN3Tl/Duik5LzqRkcew4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278672; c=relaxed/simple;
	bh=kud7Oy4k5Zo12Dvn4P4+d50kDoLhhX1ARxGeMCI8rRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UX50O0eoYzQh+jHDTYZE+YpECKnOC8oxuZUF+6JsEPI64Qg8wkeRdBfyYc/fDrJM0dZhcyAMyeMzqFLIohwlTHhzD0U03GHxzivrFLG0FicarkadZuc1w3hOjyzpX38KlPKEGCi12mQDZmiwzv6rABgpMT6HzyvkNpJoWKhy3uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbLdLqXs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbLdLqXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751278671; x=1782814671;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kud7Oy4k5Zo12Dvn4P4+d50kDoLhhX1ARxGeMCI8rRk=;
  b=YbLdLqXsQw8Vazowsl80OTmeEfNdSZjoN6mhf0zNrUgGOl6EwBlGVJLn
   pJx9x8AYhfaWt0uUKWQ6xo4GZzLkCpu7nSg2fXHJyXDT23Jv45YQzeILB
   hXELU+cj9OCKvPir20+53MkLnYB0kXYS7fyyh7zFshUoVP4ptgP8wxAvA
   GgznTrn56FXWNtXao7Y8MpvJqs15tVpIJIi3YZUE0OAZlm3jNHC8GkR4y
   ChBFIvMVIs9oL4lOO9wGgJ2/KkduZQVXXZWYBiYHkAgyHHMuaoUdM7NPZ
   vP8QDsm5f2ggwZjbIyRILk7SpM+A8086+FwyW2GwzE9pPRkX7VYRZ2BQM
   A==;
X-CSE-ConnectionGUID: DzXEDvylTEm7QmTfp/TITA==
X-CSE-MsgGUID: AgjYsR6QR0ueqbsT0f/rww==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64095578"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64095578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:17:51 -0700
X-CSE-ConnectionGUID: RGurCq6oRQy7VfnOSJfNHw==
X-CSE-MsgGUID: tcJ1SOavQK6MS+9Rmx4W0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177081726"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jun 2025 03:17:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D7EEB3AB; Mon, 30 Jun 2025 13:17:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] platform/chrome: chromeos_laptop - replace open coded variant of DEFINE_RES_IRQ()
Date: Mon, 30 Jun 2025 13:17:45 +0300
Message-ID: <20250630101745.1855918-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEFINE_RES_*() are compound literals, and hence no need to do that explicitly.
Besides that, we have no IRQ name provided, no need to use _NAMED() variant.
Replace open coded variant of DEFINE_RES_IRQ().
No functional changes intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/chrome/chromeos_laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
index 3579c42b515e..0b92047265de 100644
--- a/drivers/platform/chrome/chromeos_laptop.c
+++ b/drivers/platform/chrome/chromeos_laptop.c
@@ -726,9 +726,9 @@ static int __init chromeos_laptop_setup_irq(struct i2c_peripheral *i2c_dev)
 		if (irq < 0)
 			return irq;
 
-		i2c_dev->irq_resource  = (struct resource)
-			DEFINE_RES_NAMED(irq, 1, NULL,
-					 IORESOURCE_IRQ | i2c_dev->irqflags);
+		i2c_dev->irq_resource = DEFINE_RES_IRQ(irq);
+		i2c_dev->irq_resource.flags |= i2c_dev->irqflags;
+
 		i2c_dev->board_info.resources = &i2c_dev->irq_resource;
 		i2c_dev->board_info.num_resources = 1;
 	}
-- 
2.47.2

