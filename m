Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA3246BCB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275986; cv=none; b=U7Uf767zG7k+UJkddhIeIdfCbDqDxzc+wrZf0aSBfFEvjy2oj+d5iE7QOJiVpOTrAw8ewAJfEyTWSh5+yq0b/QsfElf4yBu0azdsS54R3EMzWgP6b71Dauxwo42Pqzeh2whhXZRBO22PB9FrzEaMHMw0I6EydKlzzv7A+O+zCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275986; c=relaxed/simple;
	bh=c3EE6wrQNXh5lkN5NgK6InlkspugXxkkAh0cxdXykUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGeadIYWqI8xughrYy4LnVrK3MpgRZiNWqD24xeyGIctDaeGay8dKQgzxPk7roCA9P6p+tO1BcH/wQfG65/tRIO7toofyZ/XYXOnZhzEz0dUBPQQjcCTnysPH2qKKOOlKUXsGvRJ8sbkGScBh7BiRDRQfm34AfHATr0OknLG1YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/2wMMO4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/2wMMO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275986; x=1782811986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c3EE6wrQNXh5lkN5NgK6InlkspugXxkkAh0cxdXykUE=;
  b=c/2wMMO4i/y5HuxO1JTCe/2jVSzOTdDg+DW6E+zhsQJ5wUN76WZMjhwn
   ps+ThKb8RUupY+g36GII1jJ61eSvpTQ0HEb7rPgcRUHRmjfzcOFDKNdal
   pQxy3HgJsUqzAlXb0cvb14ceSKhrAdcYd3RLXOT17RoKfraRV/1EUQuZs
   22fEmrvHGP84M9L64yyJUyH+o+r45BnG1LyhEEi1afGoCcgLWGoOEbNdj
   6pVq7T7iRv6DkW+0mdbpUOzITvUIcRxr3R+ukuR+rfYE8k+vty5X56bw4
   cEIKba5FI3aQAkcpOS7aSymZUxCx7FiJT8tNbDI1dv4zO1FpzQ7Rxow5V
   A==;
X-CSE-ConnectionGUID: 30SumiyZTgmsnqtSZKdHSQ==
X-CSE-MsgGUID: eF3IM5NgTGW8tGKU7qz6fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53218591"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53218591"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:05 -0700
X-CSE-ConnectionGUID: Aw41gVAGTZW6CfaaWBvk6w==
X-CSE-MsgGUID: hkZK3k/1RHGkBJFxbVYL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153039558"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:04 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next v2 1/5] mei: set parent for char device
Date: Mon, 30 Jun 2025 12:19:38 +0300
Message-ID: <20250630091942.2116676-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630091942.2116676-1-alexander.usyskin@intel.com>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Connect char device to parent device to avoid
parent device unload while char device is
still held open by user-space.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 1f5aaf16e300..95d4c1d8e4e6 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -1225,6 +1225,7 @@ int mei_register(struct mei_device *dev, struct device *parent)
 	devno = MKDEV(MAJOR(mei_devt), dev->minor);
 	cdev_init(&dev->cdev, &mei_fops);
 	dev->cdev.owner = parent->driver->owner;
+	cdev_set_parent(&dev->cdev, &parent->kobj);
 
 	/* Add the device */
 	ret = cdev_add(&dev->cdev, devno, 1);
-- 
2.43.0

