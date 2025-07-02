Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CE2248893
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495691; cv=none; b=Ve1wxpnGiZ3OpCCQAVhi2v5uFqlboooEuKYjzkAO6jfoZH8Qu338YXJ3XmQ6UEV/3yYjrcyg/h7emRPe8XKklnwck6ympZaVOl9jS96/TVWcxCr3ULOPfAQmC+uJHxsRG6J3ZEkrAXNYYmYK8+NFqawXJ6iTeV+pIR14ajD1O34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495691; c=relaxed/simple;
	bh=ovEAWUMTH6GJtvyCHf9T73pwDXs1VPFPiPMKmFALP54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a0mpplqTAyHVI8zf6a6+xDq79akAZFA3VUZgQIuXMZPx0JE1Z+8/YoKT6qFphJ3AXjVsuSUD8j5xRgW/fzXemjjbbqsBSfLx6v0TXyYtDI+eCjXz6yVltuD1ehV9oskt9Gbc8oj1olyXVtJMABn4mdiB4kWGqfTahQ6foVs5NrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JM78/bBs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JM78/bBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751495690; x=1783031690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ovEAWUMTH6GJtvyCHf9T73pwDXs1VPFPiPMKmFALP54=;
  b=JM78/bBsCVt5KX2OG0gbP4zZK+PhFdVPrz+JHQhu/lvHP8ewyBXIsEra
   9EORO7fknZ/2pyV9Yeyd7qy/CWX/EXcpC4QWrMHWuJ/oLjKT8weq/SXV3
   Er5BtNfvv4YvCYKgqprkl9v37Rj7F7c1kNlIsHLRL25UqTsyOToaReoSV
   rbCj7l/qu6OyBe4bINWQvOpnsPNCWqgf5CBPhJIBvUzmL2l0uUSAl66dU
   uRXWFA+os3LA4dPCWJdTl8SHEzv4AyyWu9+ibof/EA99U75PyeNpoVkxM
   nDwTYrGOfR+TBWwOKFG4oIT/f+ug4I8T1rAHnR4LPjOVVlJKhHJBn0rmr
   w==;
X-CSE-ConnectionGUID: Y7sc/FyGR+GzWyN5zIxfbw==
X-CSE-MsgGUID: IXI5BQVERbqWKtl4jgkI8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41438514"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="41438514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 15:34:50 -0700
X-CSE-ConnectionGUID: QfDRNKMoQbSx41vyVQtCAQ==
X-CSE-MsgGUID: L2JnfSEbSCi4Ol6Iiy4Vxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="159889420"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO stinkbox) ([10.245.244.30])
  by orviesa005.jf.intel.com with SMTP; 02 Jul 2025 15:34:46 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Jul 2025 01:34:45 +0300
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
Subject: [PATCH 2/4] iopoll: Avoid evaluating 'cond' twice in poll_timeout_us()
Date: Thu,  3 Jul 2025 01:34:37 +0300
Message-ID: <20250702223439.19752-2-ville.syrjala@linux.intel.com>
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

Currently poll_timeout_us() evaluates 'cond' twice at the end
of the success case. This not desirable in case 'cond' itself
is expensive.

Avoid the double evaluation by tracking the return value in
a variable. Need to use a triple undescore '___ret' name to
avoid a conflict with an existing double undescore '__ret'
variable in the regmap code.

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
 include/linux/iopoll.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
index 0d8186d3df03..69296e6adbf3 100644
--- a/include/linux/iopoll.h
+++ b/include/linux/iopoll.h
@@ -36,23 +36,30 @@
 	u64 __timeout_us = (timeout_us); \
 	unsigned long __sleep_us = (sleep_us); \
 	ktime_t __timeout = ktime_add_us(ktime_get(), __timeout_us); \
+	int ___ret; \
 	might_sleep_if((__sleep_us) != 0); \
 	if ((sleep_before_op) && __sleep_us) \
 		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
 	for (;;) { \
 		op; \
-		if (cond) \
+		if (cond) { \
+			___ret = 0; \
 			break; \
+		} \
 		if (__timeout_us && \
 		    ktime_compare(ktime_get(), __timeout) > 0) { \
 			op; \
+			if (cond) \
+				___ret = 0; \
+			else \
+				___ret = -ETIMEDOUT; \
 			break; \
 		} \
 		if (__sleep_us) \
 			usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
 		cpu_relax(); \
 	} \
-	(cond) ? 0 : -ETIMEDOUT; \
+	___ret; \
 })
 
 /**
@@ -83,6 +90,7 @@
 	s64 __left_ns = __timeout_us * NSEC_PER_USEC; \
 	unsigned long __delay_us = (delay_us); \
 	u64 __delay_ns = __delay_us * NSEC_PER_USEC; \
+	int ___ret; \
 	if ((delay_before_op) && __delay_us) { \
 		udelay(__delay_us); \
 		if (__timeout_us) \
@@ -90,10 +98,16 @@
 	} \
 	for (;;) { \
 		op; \
-		if (cond) \
+		if (cond) { \
+			___ret = 0; \
 			break; \
+		} \
 		if (__timeout_us && __left_ns < 0) { \
 			op; \
+			if (cond) \
+				___ret = 0; \
+			else \
+				___ret = -ETIMEDOUT; \
 			break; \
 		} \
 		if (__delay_us) { \
@@ -105,7 +119,7 @@
 		if (__timeout_us) \
 			__left_ns--; \
 	} \
-	(cond) ? 0 : -ETIMEDOUT; \
+	___ret; \
 })
 
 /**
-- 
2.49.0

