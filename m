Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B484C251795
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278351; cv=none; b=JewBpzIQWNzUeEAu6EuVJoG7pD9fFk0/z0k6FPUB37hUGL9nmo2j1SOBVml93Oz8GBZ3kZxYq1wZ8+s0jZEq/v327UBsluGvrY/zMuT7ASnCZ+S0vtZB8lcIAikZuH3jnATHUyjUhpzNvRT9S14bCEuDhWsIoOk9n9/9Kb6VO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278351; c=relaxed/simple;
	bh=MIPpdlBA+KiSQT0j9EKjsyMLybXln93qbbOkBRiJmGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPYc5J7th0f00EjkFaR4qWGyM417lF5tyLidCr65z9i7yEUDR65873v88h4vlLAwPfgchv8ym9z9iIrXWo93QtcXet917Jf2zH2kskkFBOH+f0blp6IyKngwuyodpryfx6lviFfDXbCpe9Dz3kDFJBlLXRTcMTVVVQXjnLa9nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTKmyAQm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTKmyAQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751278349; x=1782814349;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MIPpdlBA+KiSQT0j9EKjsyMLybXln93qbbOkBRiJmGs=;
  b=VTKmyAQm1sKmVn8Y0JsdeyVeTcME4VwVaAWW/sW95p02IFn25LliWIde
   BGW3e8NFj7wW2SctvElpkNBAcuK4ngKIjCRIbgESL4Rb5MbxrNqs9Wnso
   U0KjYoYSHzevYZE+6soFFgascn0IPzUVxyFpbZCEs3Q4yMLYD896Bnq3V
   E0kGFhJh4SMh0qdjq3X+XPAVNzF+HI7g0ijyk0yMKKeivGdSxoiZxt3gX
   rckTJ5k6vwn3Osssz1qi+eC5JidhFf4YEE+OMeIPvpMJ63GTfB0Irye/t
   LSzRg7Jp1CCODISOitiPIFocTQoQCI9mDqB8jGhZ7lBlTn1ZBzIF/L4BM
   w==;
X-CSE-ConnectionGUID: S2KYnXVDQJ+WEW7Nc+omSA==
X-CSE-MsgGUID: ooL1KPrLT/e6SnA6QAgQqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64852279"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64852279"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:12:29 -0700
X-CSE-ConnectionGUID: rksgmMnHSV6KRUI1kp0AHA==
X-CSE-MsgGUID: 4w+3nGLHR4atCuOGlGCr2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153723902"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2025 03:12:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 23B3F3AB; Mon, 30 Jun 2025 13:12:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] platform/chrome: chromeos_laptop - Remove duplicate check
Date: Mon, 30 Jun 2025 13:12:25 +0300
Message-ID: <20250630101225.1855431-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fwnode_remove_software_node() is aware of invalid input,
no need to perform checks in the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/chrome/chromeos_laptop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
index 69d366df3e26..dbf256071549 100644
--- a/drivers/platform/chrome/chromeos_laptop.c
+++ b/drivers/platform/chrome/chromeos_laptop.c
@@ -780,8 +780,7 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
 	while (--i >= 0) {
 		i2c_dev = &i2c_peripherals[i];
 		info = &i2c_dev->board_info;
-		if (!IS_ERR_OR_NULL(info->fwnode))
-			fwnode_remove_software_node(info->fwnode);
+		fwnode_remove_software_node(info->fwnode);
 	}
 	kfree(i2c_peripherals);
 	return error;
-- 
2.47.2

