Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9896B237169
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859384; cv=none; b=U4IZ7VVWBPMjcvzlBLSzBU6V/8c9CT9P0D/BMAylEAbRZCQ28BxyGi/3GrKgrYrwZ5ho8uiSkibgz7j/wjiUo1WM/5Av0MzRFfp195JOnS54P5HQa40rZjpTomACHyQVFjslfurd6+CLZDYt3AEqpqBC34ZzYQo51gV+tRp1ceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859384; c=relaxed/simple;
	bh=Zt5ASR0+0iegHQq9CNg4sf7fphqBelvZ4q0xnjS1AUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4WswB1FWwXOeFTuZ9DAf2RARhfuHCtN7+GZWkeIju5Fgj8jFU7GkL/2gCZQqVDYKVYItHADQZ5Nx4ZlxKrt2SCQLpxSk3LJ/8Tly7FaM/0b9lj97dwTLeZi5YpY2rPQd8czNOalDcbsaEX6r40Ngorz9cSxMqSPxGy5iQodmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSTEkoCH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSTEkoCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738859383; x=1770395383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zt5ASR0+0iegHQq9CNg4sf7fphqBelvZ4q0xnjS1AUw=;
  b=FSTEkoCHuVbGMTChnbzKxH9xigPx/HKeq+jZmJ5JzaQ7/kwyB4R/O4Nl
   bx4t30563ytHMP3p85sfGwN+cn7mbYWOyFaZeaEO3etpHgt2PUfe1P4LU
   Y7Jw8CDjwzUb/DmCKglwDWDZY9jLQRYT8EnpZRBUWavCbwG7+jnnuA118
   9MuxvsKSkR15p7Ri2pV8PbmnjxNgL+7nIOdN7Qye16jCV0F4hJqUjubOu
   Q9paMHtmi0nrr7QJ8tzk3n88o6i0HhUBF3SPDzTx/Yk8RTFXBYSbsLHu6
   6YXOP32ZtVLiRTTtPtzL0rSCxH2tUClsLOhotGb++2H/c9qSaPy6MlhKa
   g==;
X-CSE-ConnectionGUID: vh7bbFEkR1620Z3ea/YdHQ==
X-CSE-MsgGUID: t2sc04x6Sju8aoR4sBkt9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56890914"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="56890914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 08:29:39 -0800
X-CSE-ConnectionGUID: wSF2amTnQWCEVzbQ1BSgvw==
X-CSE-MsgGUID: tdYPHLvwTBeDA38I7S8yNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148469683"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2025 08:29:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A2BD5EE; Thu, 06 Feb 2025 18:29:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] regmap: irq: Use one way of setting all bits in the register
Date: Thu,  6 Feb 2025 18:29:33 +0200
Message-ID: <20250206162933.1127937-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there are two ways of how we represent all bits set, i.e.
UINT_MAX and GENMASK(31, 0). Use the latter as the single way of
doing that, which is crystal clear on how many bits we are talking
about.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap-irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 0bcd81389a29..c5fda76cd27e 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -166,7 +166,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 				ret = regmap_write(map, reg, d->mask_buf[i]);
 			if (d->chip->clear_ack) {
 				if (d->chip->ack_invert && !ret)
-					ret = regmap_write(map, reg, UINT_MAX);
+					ret = regmap_write(map, reg, GENMASK(31, 0));
 				else if (!ret)
 					ret = regmap_write(map, reg, 0);
 			}
@@ -480,7 +480,7 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 						data->status_buf[i]);
 			if (chip->clear_ack) {
 				if (chip->ack_invert && !ret)
-					ret = regmap_write(map, reg, UINT_MAX);
+					ret = regmap_write(map, reg, GENMASK(31, 0));
 				else if (!ret)
 					ret = regmap_write(map, reg, 0);
 			}
@@ -847,7 +847,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 					d->status_buf[i] & d->mask_buf[i]);
 			if (chip->clear_ack) {
 				if (chip->ack_invert && !ret)
-					ret = regmap_write(map, reg, UINT_MAX);
+					ret = regmap_write(map, reg, GENMASK(31, 0));
 				else if (!ret)
 					ret = regmap_write(map, reg, 0);
 			}
-- 
2.43.0.rc1.1336.g36b5255a03ac

