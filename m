Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C819F1A2872
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869411; cv=none; b=QyaQL4fDLt7qR9Gf7hvLh70lAqGN0d0FXruwex73bJAFmFUOVy/gSmZihtkpIGh08UL5Rqr9RQYsUq0zCig99nYCEIAIT+EJGsA0LGzNMuIgcSiuJ3bm6fZFb0/UBgC56PD+GAnWYrpuj19Cm1y2r17EgamdXTmQX0Ipwyw1cIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869411; c=relaxed/simple;
	bh=w+f1RErILNMp1vIEzlV4xTxlGqblMtEY7MlRk8uRiJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhzzwuH38Lt27BNdY+ySkyZYHNUwTPqE4+kMtbS0AWvZaacrN1EC4aqa9R3D5LIyVZapkGfr8mtWKEWjYlXUsUkY9TKzyfVQz/ZrS69Ph0BA4PxTquRE8+9FVpwwopu+mhHQ6iiNE0shfYno8/pKc1apT51QiS+k8ZYp6UxaZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2sEw5qZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2sEw5qZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738869410; x=1770405410;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w+f1RErILNMp1vIEzlV4xTxlGqblMtEY7MlRk8uRiJs=;
  b=G2sEw5qZ5pTS/F8tqLC7SVW7xinniF95gFyuJtOR4fFwd6h3u+W8kz+L
   kN8+R3Vy+h0ukFwHroaXH67otqoYCdMM/KjMlJPJS5XOK92vg5Jkei/33
   5KixKxESatabRQDOcyhqw1+zrIjUs9Keyzluibgmtgc2V0rfGUGIBVpzb
   +7mw8ztODiJ53rhH7NmKXxK+BuC5jZxxbKp70k2bXxEyghe4h4e8fQ4mM
   OccePTkZ5ccVcc8tXH/KoXRYLkUu/Dwq84SmjBVgfnK6GDgtpvfYqC1lB
   sQgHJnKcvBgNqN/86yAxqquO3vkRAS38IT+XVOIMI5nuWZvoOAmOW0J7X
   A==;
X-CSE-ConnectionGUID: vczaexE3QxuD5yp8M4VdpA==
X-CSE-MsgGUID: uoSRGH1LSQGLtSaOfzsXsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64848245"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="64848245"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:16:49 -0800
X-CSE-ConnectionGUID: UMpSt+rVTd6aHsBpkxvTag==
X-CSE-MsgGUID: 9LU7QzTdThSgCgsrQnZi4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="116334050"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2025 11:16:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DA31BEE; Thu, 06 Feb 2025 21:16:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] regmap: irq: Use one way of setting all bits in the register
Date: Thu,  6 Feb 2025 21:16:30 +0200
Message-ID: <20250206191644.1132869-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there are two ways of how we represent all bits set, i.e.
UINT_MAX and GENMASK(31, 0). Use the former as the single way of
doing that, which is crystal clear on how we fill the unsigned int
value.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: used UINT_MAX (Mark)
 drivers/base/regmap/regmap-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 0bcd81389a29..e5631188d692 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -823,7 +823,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		/* Ack masked but set interrupts */
 		if (d->chip->no_status) {
 			/* no status register so default to all active */
-			d->status_buf[i] = GENMASK(31, 0);
+			d->status_buf[i] = UINT_MAX;
 		} else {
 			reg = d->get_irq_reg(d, d->chip->status_base, i);
 			ret = regmap_read(map, reg, &d->status_buf[i]);
-- 
2.43.0.rc1.1336.g36b5255a03ac

