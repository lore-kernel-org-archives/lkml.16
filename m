Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1E191F72;
	Mon, 10 Feb 2025 05:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163881; cv=none; b=RpGT4D52egoA9kMlpC4+Xyuu94VeU1Cf+SZR3qEceGGQhQXQlbS6gVNcCwGJj43B9isnUX6/7QWZcdTqJ0dVQ7/ItA+Ht7IqPi9BYZI05Q2clwv7VapFzQRFlqFX2iULOzSXryU2mRIL1W3XDEaEx/6+9QpqlPfbFq9wVrBPZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163881; c=relaxed/simple;
	bh=syILJRFICNuwfc1hr1rVckmFJF5JIVDUFUmPw1y28sU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ju1E8miPhSoJ84Uvlt00iNd/utLZccgq14hXa87r30tC6rQhY+6mQrx214axapKF7kFmuitubh7ZhH2HQdEWlWtFRrv60T3upSV/G6VkAc3Jw2bFz2pnqy154pnO+CIPVGDVK/p7dyotvIPJnDan8fQS7amD5kwjxVG+S/qMRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Df2jVj79; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Df2jVj79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739163879; x=1770699879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=syILJRFICNuwfc1hr1rVckmFJF5JIVDUFUmPw1y28sU=;
  b=Df2jVj79LvpE818QTbcDOePzQJbut3M9GyjqrCsZnz5K4/j6uQ8LcZbO
   CKQWbzAkqOpFawuUpjQnGOHyU7wgykKKPaiPZlQpGUp9IXcALEH5NSLRZ
   8hDPE6cFUw9ocjZCwQquyL6u6IBwK+KTdD/j0GtVqXn6Ci29yk9SN02eO
   6nSQGHp7tzxcoOb5EfZu+Sxjjgaw1XGCEz/rTItO8ZGdYQg9QcohKQH7S
   tPlBxkiddp0gcMzLartkCkBWeVGfmHYqnOhpknhJ5GvXVhSWm4nRxyV6r
   JsybKhA+XFQNp5ANFcpcxP7Di9C6JLjKfUfsUe0YnYlLCypRSQSsxX/xr
   w==;
X-CSE-ConnectionGUID: 1YJK++3WSqmthPIufX091A==
X-CSE-MsgGUID: Az4k2tnsS7WBTNymQG/fUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50369452"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="50369452"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:04:39 -0800
X-CSE-ConnectionGUID: hbCUrXV5ScyfIgevab2+Dg==
X-CSE-MsgGUID: +6YWty/kR6mfHNuV4M7nNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112312214"
Received: from inlubt0246.iind.intel.com ([10.191.24.87])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:04:35 -0800
From: subramanian.mohan@intel.com
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	giometti@enneenne.com,
	tglx@linutronix.de,
	corbet@lwn.net
Cc: eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com,
	david.zage@intel.com,
	srinivasan.chinnadurai@intel.com,
	subramanian.mohan@intel.com
Subject: [PATCH v13 3/4] Documentation: driver-api: pps: Add Intel Timed I/O PPS generator
Date: Mon, 10 Feb 2025 10:34:20 +0530
Message-Id: <20250210050421.29256-4-subramanian.mohan@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250210050421.29256-1-subramanian.mohan@intel.com>
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Subramanian Mohan <subramanian.mohan@intel.com>

Add Intel Timed I/O PPS usage instructions.

Co-developed-by: Pandith N <pandith.n@intel.com>
Signed-off-by: Pandith N <pandith.n@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Signed-off-by: Subramanian Mohan <subramanian.mohan@intel.com>
---
 Documentation/driver-api/pps.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/driver-api/pps.rst b/Documentation/driver-api/pps.rst
index 04f1b88778fc..598729f9cd27 100644
--- a/Documentation/driver-api/pps.rst
+++ b/Documentation/driver-api/pps.rst
@@ -285,3 +285,27 @@ delay between assert and clear edge as small as possible to reduce system
 latencies. But if it is too small slave won't be able to capture clear edge
 transition. The default of 30us should be good enough in most situations.
 The delay can be selected using 'delay' pps_gen_parport module parameter.
+
+
+Intel Timed I/O PPS signal generator
+------------------------------------
+
+Intel Timed I/O is a high precision device, present on 2019 and newer Intel
+CPUs, that can generate PPS signals.
+
+Timed I/O and system time are both driven by same hardware clock. The signal
+is generated with a precision of ~20 nanoseconds. The generated PPS signal
+is used to synchronize an external device with system clock. For example,
+it can be used to share your clock with a device that receives PPS signal,
+generated by Timed I/O device. There are dedicated Timed I/O pins to deliver
+the PPS signal to an external device.
+
+Usage of Intel Timed I/O as PPS generator:
+
+Start generating PPS signal::
+
+        $echo 1 > /sys/class/pps-gen/pps-genx/enable
+
+Stop generating PPS signal::
+
+        $echo 0 > /sys/class/pps-gen/pps-genx/enable
-- 
2.35.3

