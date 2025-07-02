Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22D244668
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495696; cv=none; b=qy0pWWR5GFtwV9KLs5AygKVCs+x1fUJeAp9mkus26Jp5MuEeFOMV76SzjiKxTRiINjhRtZ0W4LKMexa0h7fNODUV63M9XqRvhThS2t+hw8lV8iv+5yfbKORML3S3/ZgH5zmgV1JJQWOG9K7OEI/tqsRC6p0ZTXyK8UYh6WkSMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495696; c=relaxed/simple;
	bh=W2vh/gUN1SuOFMPHGik+M/ABS+8trpL/7/ggreUwjFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpfIFkSMCMe7yRLU3FCanh89eXvoRRuIOP5oA+rogn24Qdywic9gEOo/OkcTomaYwAWcp+zOpbUYEHH+7nLHIgCl0yC5C43Le4mEUuCAi4pDffGiJflk9dFEKFlG/MszX9BBQVrwH9/BB4Sfq9CbErEvKzSCtdf40vBcra5mTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb2sO4QD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb2sO4QD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751495695; x=1783031695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W2vh/gUN1SuOFMPHGik+M/ABS+8trpL/7/ggreUwjFI=;
  b=eb2sO4QDcXrpvYYT9PH34i7yjFP/5JAdvY5DC3ktyStgHKon3QoF8cxP
   C5Jc2Facv2at7UOA49iSETJziv3t1fHWY21a+bVOyJ3bjMOLD+ntVx5up
   2CWq1/UBsLTvEJPpanwhDOUcq5wCZIWBIlJfeyTpTKSH15rxeBRJhphey
   98MwwCqO++y7KL1eqpzAETYgues+OcdXwTWdax4Mwv5oO6I1k8ZOX4GrI
   H8JhnM07po+bty10siQ5fxvLOD4YDJezp1Gg8v2guVkFer/CvMODXdnkA
   0oGvHiKVBmeenuYBIE7K4Lrb9B2LfH3gCLzTz9WLsvXbw+/pI4m/ftBQa
   A==;
X-CSE-ConnectionGUID: 7eUEKIFqSzSBuw//dyifkg==
X-CSE-MsgGUID: nCmvudrtS3SBrHQ89LV/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41438520"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="41438520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 15:34:55 -0700
X-CSE-ConnectionGUID: hWZg3lQCScSfd3TcH42V6Q==
X-CSE-MsgGUID: 2iP6Qa2mQied4/wO1WflKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="159889423"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO stinkbox) ([10.245.244.30])
  by orviesa005.jf.intel.com with SMTP; 02 Jul 2025 15:34:51 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Jul 2025 01:34:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Matt Wagantall <mattw@codeaurora.org>,
	Dejin Zheng <zhengdejin5@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 3/4] iopoll: Reorder the timeout handling in poll_timeout_us()
Date: Thu,  3 Jul 2025 01:34:38 +0300
Message-ID: <20250702223439.19752-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
References: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently poll_timeout_us() evaluates 'op' and 'cond' twice
within the loop, once at the start, and a second time after
the timeout check. While it's probably not a big deal to do
it twice almost back to back, it does make the macro a bit messy.

Simplify the implementation to evaluate the timeout at the
very start, then follow up with 'op'/'cond', and finally
check if the timeout did in fact happen or not.

For good measure throw in a compiler barrier between the timeout
and 'op'/'cond' evaluations to make sure the compiler can't reoder
the operations (which could cause false positive timeouts).
The similar i915 __wait_for() macro already has the barrier, though
there it is between the 'op' and 'cond' evaluations, which seems
like it could still allow 'op' and the timeout evaluations to get
reordered incorrectly. I suppose the ktime_get() might itself act
as a sufficient barrier here, but better safe than sorry I guess.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: David Laight <david.laight.linux@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Matt Wagantall <mattw@codeaurora.org>
Cc: Dejin Zheng <zhengdejin5@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/linux/iopoll.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
index 69296e6adbf3..0e0940a60fdb 100644
--- a/include/linux/iopoll.h
+++ b/include/linux/iopoll.h
@@ -41,18 +41,17 @@
 	if ((sleep_before_op) && __sleep_us) \
 		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
 	for (;;) { \
+		bool __expired = __timeout_us && \
+			ktime_compare(ktime_get(), __timeout) > 0; \
+		/* guarantee 'op' and 'cond' are evaluated after timeout expired */ \
+		barrier(); \
 		op; \
 		if (cond) { \
 			___ret = 0; \
 			break; \
 		} \
-		if (__timeout_us && \
-		    ktime_compare(ktime_get(), __timeout) > 0) { \
-			op; \
-			if (cond) \
-				___ret = 0; \
-			else \
-				___ret = -ETIMEDOUT; \
+		if (__expired) { \
+			___ret = -ETIMEDOUT; \
 			break; \
 		} \
 		if (__sleep_us) \
@@ -97,17 +96,16 @@
 			__left_ns -= __delay_ns; \
 	} \
 	for (;;) { \
+		bool __expired = __timeout_us && __left_ns < 0; \
+		/* guarantee 'op' and 'cond' are evaluated after timeout expired */ \
+		barrier(); \
 		op; \
 		if (cond) { \
 			___ret = 0; \
 			break; \
 		} \
-		if (__timeout_us && __left_ns < 0) { \
-			op; \
-			if (cond) \
-				___ret = 0; \
-			else \
-				___ret = -ETIMEDOUT; \
+		if (__expired) { \
+			___ret = -ETIMEDOUT; \
 			break; \
 		} \
 		if (__delay_us) { \
-- 
2.49.0

