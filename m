Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98881255231
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193483; cv=none; b=SPyWzCxajaWE0NIlpEnzhdlQvathS7aWVMW8TVrlpI6NSH8PV2ccUbmwyCrQr6jy7R+5X9rp4w4vRBKAsjxEiRffFRNQ2YdesQoYd30RSJRvNZjtrMOcQx2M0k8SfjtB/W/ZS4cGJcRAqioZZM+DP5bw93N+3d4gipafNquZNGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193483; c=relaxed/simple;
	bh=ILN2iET/9uCytdvIyIEDl0TgrwE0lpNVHjhf6eXZDH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPdRNieYrqT4q3kibtBuo3kYDaYAQFJeRF/RIPW2jaf1aIq60s90NOT9JL9ooeB6zB8OnhX/OP3uIMT3bXJOwyaTb56uk9neV0tHpBcWxISnTi3d3LUhAn0cwZObPkyHcWUpxlLRmuV6sGNCZ4NpkjrJny3b6J6HWjpoQ9vXeG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqL08wN6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqL08wN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746193481; x=1777729481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ILN2iET/9uCytdvIyIEDl0TgrwE0lpNVHjhf6eXZDH8=;
  b=GqL08wN6duv1gyCl14S25jNjbIjngd4ERU9TcbEpm/vGQxSYJXFmV32e
   t0LL66iyrjO3pM/Hqc47bOYt/13DGkBnPLnV+wijyOfQaO1UqkO75dp1v
   ysk+YmdfihlCgFzqM0MaTDZUVtW87jRVOXN3phNTkY070ZcjfW8qVeMhh
   j1IRd/cukabVo1tbytwGjOLaZNZGqfDqioV1tjqsiJdreno7CGQSW5J2r
   e0g9qDanMxsoVcYdkqKzYWXs82tMEZ4tE3oaEG7mS48pw276rmu2QeNF4
   JasRZ0NCKIxLUlwj11MflS7/QduCHzt9IJYCJXp9AYio6HA1ERWUuLGlH
   Q==;
X-CSE-ConnectionGUID: Sj0yC/6aTiC0yDzFAcv6fg==
X-CSE-MsgGUID: 8LrMkTKeSfeYE5HxOz+ckg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47595179"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47595179"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 06:44:40 -0700
X-CSE-ConnectionGUID: LK3VOkSJSy+1kiVJLpgmKA==
X-CSE-MsgGUID: MCZWEtLTQ9Wt0yZFrcqSSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135603804"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2025 06:44:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0462C1A1; Fri, 02 May 2025 16:44:37 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] iopoll: Use fsleep() instead of usleep_range()
Date: Fri,  2 May 2025 16:43:45 +0300
Message-ID: <20250502134346.4146857-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use fsleep() instead of usleep_range() to improve small time delays
by avoiding the timer use. With this, use slightly bigger initial
delays then was passed to usleep_range().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/iopoll.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
index 91324c331a4b..fca50f117fae 100644
--- a/include/linux/iopoll.h
+++ b/include/linux/iopoll.h
@@ -41,7 +41,7 @@
 	ktime_t __timeout = ktime_add_us(ktime_get(), __timeout_us); \
 	might_sleep_if((__sleep_us) != 0); \
 	if (sleep_before_read && __sleep_us) \
-		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
+		fsleep((__sleep_us >> 1) + 1); \
 	for (;;) { \
 		(val) = op(args); \
 		if (cond) \
@@ -52,7 +52,7 @@
 			break; \
 		} \
 		if (__sleep_us) \
-			usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
+			fsleep((__sleep_us >> 1) + 1); \
 		cpu_relax(); \
 	} \
 	(cond) ? 0 : -ETIMEDOUT; \
-- 
2.47.2

