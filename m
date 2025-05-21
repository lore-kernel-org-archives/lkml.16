Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498A1448E0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835744; cv=none; b=EsxMfOlVXGDRok++SEtR6NlpbyWJcPMzBf+Ohw0kDnSHPGX4zg6VWuwUyWPOWq2AU8/DBrP0XngBdI5vagpMxBkLgvx3kJ5/5KPjlviGcMc6QQWxaPf5V0iMAlSWmvhky8qSQiLY4NPPYFozHfW/8heBvXXL3WNuQsCrJK2J/CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835744; c=relaxed/simple;
	bh=9dYoftuzStlfo2CqJa4+6thPPjul0IifK9rUwPnVUyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bEsHpbstNz4dtM/Rgew2USStljI9CUsVQ2ncQstixRd3pcecR2BFPufsWzx9MOifn6RqM5hCXSSwwGLu/tvHD6uglfBD/K0cA3HWyOoBD/yXycVNd4dUCFb7SiCZYMgovQVqJPKhC7QPK2dfgTTLrxr27x5+cAygKmFLuptQf4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJ42mmLt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ42mmLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747835742; x=1779371742;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9dYoftuzStlfo2CqJa4+6thPPjul0IifK9rUwPnVUyI=;
  b=KJ42mmLtj41gt1j6xCCxWVUstYuznxMqwDEVXmujat8fGPIXuZ0N12MC
   tMRzhe5z2j6Ab5rUtPPqMp/J/RtTige5yD3LNj/xfqtWeqZZMlo5bXCCe
   jJ05cN21ehQdDpzUhnEaO4XqaLyFL5AQVm/rvzqZn8Vu4kLGlUH34ev+K
   K4juloSZNf8KDjsvT8232dsH9K/7KoHQVWbNhI4daToMVEfRyVQc61/eo
   TVSbL72XrJAdO5lxu3nQ9bcTxvg38OBkt3DNOzThOrvwBS/4viJApArMh
   p57wHdRI+m5fiWPFGzWCHcRGnrZ2W4NAV+nJcv8QN40bprBlVQpKhfJdy
   g==;
X-CSE-ConnectionGUID: caP9SVjURHqfKN+37gpNaA==
X-CSE-MsgGUID: co7pHq4QSYWraqoyUUE1xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72334829"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="72334829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:55:42 -0700
X-CSE-ConnectionGUID: pPWDAXD/RyCSMHbTYwGmDA==
X-CSE-MsgGUID: gM1xy2q1QWmpgo8U+aMn3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141147387"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2025 06:55:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BFBB9376; Wed, 21 May 2025 16:55:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] regmap-irq: Use dedicated interrupt wake setters
Date: Wed, 21 May 2025 16:55:37 +0300
Message-ID: <20250521135538.1086717-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use enable_irq_wake() and disable_irq_wake() instead of
calling low-level irq_set_irq_wake() with a parameter.

No functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap-irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 6c6869188c31..e2bea802d502 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -193,10 +193,10 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 	/* If we've changed our wakeup count propagate it to the parent */
 	if (d->wake_count < 0)
 		for (i = d->wake_count; i < 0; i++)
-			irq_set_irq_wake(d->irq, 0);
+			disable_irq_wake(d->irq);
 	else if (d->wake_count > 0)
 		for (i = 0; i < d->wake_count; i++)
-			irq_set_irq_wake(d->irq, 1);
+			enable_irq_wake(d->irq);
 
 	d->wake_count = 0;
 
-- 
2.47.2

