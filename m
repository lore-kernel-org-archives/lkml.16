Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5000D207DF8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803687; cv=none; b=G7XSrCp8w6bko3bxIAPItRuia4HLa4YdjHkfIE4YsYGKAVmfoL5TSOnFO9Gx4zsjZ9HKnkVpMN7yI074DL8NssFbIMdWfvIN/DdLBMA4Ku/L15bF68t40bOpRVTMvYfChNbRVfpbbvmKNHtw9nOL6UpoH1OtAixDPYqdQY2WkW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803687; c=relaxed/simple;
	bh=I+FXepQOfhP2EK/vgyRxvWgbwpad4jd33fiwWnBt/LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cfBXBnimu527aJEREZKDDQOlPLBNFaTJRlgFe3mZMUk2uTjBEuabrafmxQ6xlTZTAzTt6Li0XPkNywnh5rm2Nfb90xkq8dkaJ4AOZ+Qx7Vtcvvieqv2W3k2IUTg+XoWX5VW1fb0NL+loPBxIDMaoNVUIyE/JrZ835WBn0lpmQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENvc/SYF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENvc/SYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744803686; x=1776339686;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I+FXepQOfhP2EK/vgyRxvWgbwpad4jd33fiwWnBt/LQ=;
  b=ENvc/SYF2j9ovCiIHoFhFeBuRYX8gYKiM3VIZ/j4GFSUAncy1VsDKyW+
   c+8yLzrv7uWXVcMR5whwSYRJtH/PEzygMqvxVFNXxHCJY9JyjLvW0c4HP
   YlPuS6Au6M6Ert4cqqhhwY+zwhwrb86iY+OIFOj+v4WUlscg/0Tq7585s
   D+6W0qyvbo6a/GTIEfoXKs3tvv8dkKtlBqMoQObXC7iWg2PlU/jdS0Nvv
   s5GiabNkUkYpogwFfbTP5SvZqG0W2iFutTUkhuIvMmrSVrZmn8wpkRMan
   rHx6MgCnfv0J/sNUPIF3S0R3h70DhbMrD3/eML3Qxzl5R0iYl4iy/xRVa
   Q==;
X-CSE-ConnectionGUID: fhmOYfdwQgyuqBRUjdc3gw==
X-CSE-MsgGUID: hEMT3VjNQtyVNE/WErvB7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50167860"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50167860"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:41:26 -0700
X-CSE-ConnectionGUID: jZqLVsCETpSw7ysnNNfpYw==
X-CSE-MsgGUID: 5naq9gDnQtCXyfilwau0Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="153650315"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Apr 2025 04:41:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 60272F4; Wed, 16 Apr 2025 14:41:23 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] genirq/irqdesc: Make sparse happy
Date: Wed, 16 Apr 2025 14:40:32 +0300
Message-ID: <20250416114122.2191820-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a conditional locking that sparse is not happy about.
Fix it by the respective code refactoring and using available
annotations.

Andy Shevchenko (2):
  genirq/irqdesc: Decrease indentation level in __irq_get_desc_lock()
  genirq/irqdesc: Balance locking to make sparse happy

 kernel/irq/irqdesc.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

-- 
2.47.2

