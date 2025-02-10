Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEAE1C07CB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176156; cv=none; b=PgFNWCKOTmPZ+FBrvfJmkKGPgU9Kzx/YHs/9RaynAFceK8i9GquE4T/VruvDI/awBCtLT6CrMxa70BVsXy373iEO7AlZGYtTTrAf4Z1jmYN88VslbYwqWdyFoepeDI8zKu3tuibvjhK5dOtuU9KlFeXHOOTPTeQdEF/j3eKDcQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176156; c=relaxed/simple;
	bh=Q+C47iHABvz7FDBn1KsCFupIPvArzEJWHSb5t8fFFN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tv4wRiENrWSJHlC1V9pvEvjvawSqoRKLXnBWT1wdtUDcgxUOyt8nXLaRDjbeeddtAEZHqS3axlsLCKQ9oOHjIdCTq/RSOFrXajHQZ+6lNZCgZ4QIkDYOw7UblryuDNc0HYwfLRhdxS80lG0hIQsW3ikv960kmF6bByrN6dWqV7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHDdi1HK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHDdi1HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739176153; x=1770712153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q+C47iHABvz7FDBn1KsCFupIPvArzEJWHSb5t8fFFN8=;
  b=OHDdi1HKWe0n6V+ZosBTBnnpLlc7ur7pn3C4XBlZ3k7QDeAXDdge3aRF
   /D8osjiIpeaRIiVoroN1kY3V1RQIWhB+LfpCmCwvNjecTs+8YCmSkbpXR
   Z3ufEuWgVuFEBbl8FZhRksMPwePpYptGd+5L8a7T561AZzQMZURWvc70G
   DHtpT1FLk0VDVAan1lKOxfRuQi8y4WE/QAhDAaQSoGsRfbRtPgxkoE3iJ
   tMFOluog/yv4d5Jow132Bw48/DZeG1SfS3UMqDNsKYsc0CZodZ5/v2RHg
   WX1bvztNjvSawUfgu0+GsDjD8U6CgM8sZWU/D1XGeEbjiX1cBIeKlLYqx
   Q==;
X-CSE-ConnectionGUID: +DaF3Kz8RfOmAZzdhrmkpg==
X-CSE-MsgGUID: ww/dQa+4T4eOxMT9xcMmRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39874092"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39874092"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 00:29:13 -0800
X-CSE-ConnectionGUID: cHHSoSbeTWifkxjRJthI9g==
X-CSE-MsgGUID: c1WxhSUYQiSu+Kb5EFyzSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112071288"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2025 00:29:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C86F010F; Mon, 10 Feb 2025 10:29:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [rfc, PATCH v1 1/1] hrtimers: Refactor hrtimer_clock_to_base_table initialisation
Date: Mon, 10 Feb 2025 10:26:02 +0200
Message-ID: <20250210082907.4059064-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang complains about overlapped initialisers in the
hrtimer_clock_to_base_table definition. With `make W=1` and
CONFIG_WERROR=y (which is default nowadays) this breaks
the build:

  CC      kernel/time/hrtimer.o
kernel/time/hrtimer.c:124:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
  124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,

kernel/time/hrtimer.c:122:27: note: previous initialization is here
  122 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,

(and similar for CLOCK_MONOTONIC, CLOCK_BOOTTIME, and CLOCK_TAI).

Refactor hrtimer_clock_to_base_table initialisation to make
the compiler happy.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

TBH, I don't like much this solution as it diminishes the point of that
override to be there in the first place. I haven't found better alternatives
as they may be too intrusive. Another one might be to remove this table,
but in such case the replacement might add latency to some cases (although
I haven't checked the generated code for, for example, switch-case approach).
In any case this is an rfc, I would be glad if somebody fixes this in a better
way.

 kernel/time/hrtimer.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index deb1aa32814e..8ec6ff36b9ad 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -118,13 +118,21 @@ DEFINE_PER_CPU(struct hrtimer_cpu_base, hrtimer_bases) =
 };
 
 static const int hrtimer_clock_to_base_table[MAX_CLOCKS] = {
-	/* Make sure we catch unsupported clockids */
-	[0 ... MAX_CLOCKS - 1]	= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_REALTIME]			= HRTIMER_BASE_REALTIME,
+	[CLOCK_MONOTONIC]			= HRTIMER_BASE_MONOTONIC,
+	[CLOCK_PROCESS_CPUTIME_ID]		= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_THREAD_CPUTIME_ID]		= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_MONOTONIC_RAW]			= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_REALTIME_COARSE]			= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_MONOTONIC_COARSE]		= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_BOOTTIME]			= HRTIMER_BASE_BOOTTIME,
+	[CLOCK_REALTIME_ALARM]			= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_BOOTTIME_ALARM]			= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_SGI_CYCLE]			= HRTIMER_MAX_CLOCK_BASES,
+	[CLOCK_TAI]				= HRTIMER_BASE_TAI,
 
-	[CLOCK_REALTIME]	= HRTIMER_BASE_REALTIME,
-	[CLOCK_MONOTONIC]	= HRTIMER_BASE_MONOTONIC,
-	[CLOCK_BOOTTIME]	= HRTIMER_BASE_BOOTTIME,
-	[CLOCK_TAI]		= HRTIMER_BASE_TAI,
+	/* Make sure we catch unsupported clockids */
+	[CLOCK_TAI + 1 ... MAX_CLOCKS - 1]	= HRTIMER_MAX_CLOCK_BASES,
 };
 
 static inline bool hrtimer_base_is_online(struct hrtimer_cpu_base *base)
-- 
2.45.1.3035.g276e886db78b

