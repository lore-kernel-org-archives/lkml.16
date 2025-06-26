Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851862EBDC6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949488; cv=none; b=qQbX7tcRGPOfGlJqvUxCR6QG+2Chv11D17dZfoWQs+S/N6C3+WM+g47n+c47Upv5mmC2q3kPmRmPIb0em/WTfzQpDJyjaIDT3z+wqpN+jIQ3LXb0gSYDtjqqcFcrwFPpQYqfFUiTvNhVfA3vcrFg+HaHPBodTLD84LMyy7+KCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949488; c=relaxed/simple;
	bh=QrJoR0uW4sS7DnU7b7yZdwpXgrJOxm2VSQF9swieASs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QTU2OYqZqCtwEvNcZitH18O85Qr9QiPaqKk4BlTg7GiskpOklASevo/wVZlIgsJ2luVH5ODCjCBfbU30PAVEIKRM3d/XflGwdlLUEvYKK84E13tryz90sdYfmjSX0v9z90tTWzfrgG4sMm7XaglzrFjEkVPf+7bP5wOxxCt9+cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhbBn+Y2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhbBn+Y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750949486; x=1782485486;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QrJoR0uW4sS7DnU7b7yZdwpXgrJOxm2VSQF9swieASs=;
  b=DhbBn+Y2ApsDrQfx/n/SvTRnt52Ac9qUmejgoTLxB823dRUyUq4MumGX
   bDiK/RbDVNIEvIxEegU8OX/dAhIHEKyJypFFe2YcWb81ZCpfQX/rekHrf
   a94slwRWpfmdcnburH5IKhBfWl4xz/j3spVeWi4f2NUODgf5YOHIcJt5j
   nE48TqkQpI72fPSnOnFqGLck1pWESqUHq+Wbs53Qsj1LAri0v6GfCX4nh
   jOJFL9vxQ7vwt3QLcmBEo1UTD4wnYCsAUfvpgc8GBIiIOsS6XmzgGziQC
   VBNcJIVX3EbIcBVb6Lwrb+ogtkFB4SqDud5jxjZQr2hsyhDfs+1rFB4yZ
   A==;
X-CSE-ConnectionGUID: eXjg4EpmSsuFiMlcDwrIeQ==
X-CSE-MsgGUID: l8+qsfy2Qr+ObdBECkR+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53380990"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53380990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:51:26 -0700
X-CSE-ConnectionGUID: uwkdCgpjR86JiaU1Khh+fg==
X-CSE-MsgGUID: 0RyARgMRSmOuM7wyGz/2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="157100380"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.120])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 07:51:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] iopoll: use fsleep() instead of usleep_range()
Date: Thu, 26 Jun 2025 17:51:19 +0300
Message-Id: <20250626145119.2048423-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Sometimes it's necessary to poll with long sleeps, and the accuracy of
usleep_range() is overkill. Use the flexible sleep helper fsleep() for
sleeping in the read_poll_timeout() family of macros to automatically
choose the appropriate method of waiting.

Functionally there are a few consequences for existing users:

- 10 us and shorter sleeps will use usleep() instead of
  usleep_range(). Presumably this will not be an issue.

- When it leads to a slack of less than 25%, msleep() will be used
  instead of usleep_range(). Presumably this will not be an issue, given
  the sleeps will be longer in this case.

- Otherwise, the usleep_range() slack gets switched from the begin of
  the range to the end of the range, i.e. [sleep/2+1..sleep] ->
  [sleep..sleep+sleep/2]. In theory, this could be an issue in some
  cases, but difficult to determine before this hits the real world.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Not really sure who to Cc, given MAINTAINERS doesn't match this. Adding
some past committers.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
---
 include/linux/iopoll.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
index 91324c331a4b..359ff5ab95de 100644
--- a/include/linux/iopoll.h
+++ b/include/linux/iopoll.h
@@ -20,7 +20,7 @@
  * @val: Variable to read the value into
  * @cond: Break condition (usually involving @val)
  * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops). Please
- *            read usleep_range() function description for details and
+ *            read fsleep() function description for details and
  *            limitations.
  * @timeout_us: Timeout in us, 0 means never timeout
  * @sleep_before_read: if it is true, sleep @sleep_us before read.
@@ -41,7 +41,7 @@
 	ktime_t __timeout = ktime_add_us(ktime_get(), __timeout_us); \
 	might_sleep_if((__sleep_us) != 0); \
 	if (sleep_before_read && __sleep_us) \
-		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
+		fsleep(__sleep_us); \
 	for (;;) { \
 		(val) = op(args); \
 		if (cond) \
@@ -52,7 +52,7 @@
 			break; \
 		} \
 		if (__sleep_us) \
-			usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
+			fsleep(__sleep_us); \
 		cpu_relax(); \
 	} \
 	(cond) ? 0 : -ETIMEDOUT; \
@@ -120,7 +120,7 @@
  * @val: Variable to read the value into
  * @cond: Break condition (usually involving @val)
  * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops). Please
- *            read usleep_range() function description for details and
+ *            read fsleep() function description for details and
  *            limitations.
  * @timeout_us: Timeout in us, 0 means never timeout
  *
-- 
2.39.5

