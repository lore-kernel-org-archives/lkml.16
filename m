Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A9D262D22
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299858; cv=none; b=RlHKj3WraNlEjy96hLBhzzIH74aO1bG84t3S2IYs0GYOeQsoFVa2CLouqcIP2WVNBkHuT0hMB+vv2s7tf1/bNPtNpUOvGlLAoWsSEVUNsAudoU9Ge+0bT0aEQSTUh6vI0HZf63SGykPK3yFrr3MVQ3u+F+yF6oeYP7DOZI1s1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299858; c=relaxed/simple;
	bh=W3b+yaZO4d9aGlkFJH39M0Pr0jH2rCUYfUJavCZ90Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKA4MN4AVgrlEPBxa/MxA1KJ5BVch+dT5tPrtdn6INdtKpXfKp7z//uI/B8eD39MC/xtF5HjBM8vunVBYnSA4i65xqZ1o6o8ytFgiuiWjgE3W81X1uy3zgaNdPDIv4pc6PZupgTvxA7y9QSbylgtgjC7MicikrXZAOeZgdbZVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hScAqAIG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hScAqAIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299857; x=1770835857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W3b+yaZO4d9aGlkFJH39M0Pr0jH2rCUYfUJavCZ90Xw=;
  b=hScAqAIGBCr7nh0SEYA8CTubb1C2mb49QTh7OpmFBcc5cOY5HkxXklWY
   nHOA7qC5F6qMYivaCXancxKvD9hipAt1CscWbeTONyYjXa7iJoCtwnfZW
   18TUnJe4EFRCVmfZoi+XTpUDb4uhdiWzbXPQFJHAu83ReKWSxRjZPgXwV
   WZhbQ4B+qqVm7i3RztLE2logv0WDYRzWO47dS8MWFGkso0JMle0kVtskR
   G9l5MtlWdbFjrNs8AnucW+cansii2mvr5LaeE1ZLRqvkVGiYgjaMmhhUV
   qlpACrkn27yugcs7mEImapXjXESlml6ZMxpY1djTkN1Ocg8bMWGTUjcfg
   g==;
X-CSE-ConnectionGUID: axirBe7HRf+imsLTG/aycQ==
X-CSE-MsgGUID: TwULfX0YSXSXZKfxQBAFsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57345439"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57345439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:50:57 -0800
X-CSE-ConnectionGUID: 5LgsW2AHQ9itYwzuNvZ5qw==
X-CSE-MsgGUID: +76ryVR0RNS6+GvJN62sCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149780228"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 10:50:55 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/5] intel_th: msu: Fix less trivial kernel-doc warnings
Date: Tue, 11 Feb 2025 20:50:14 +0200
Message-ID: <20250211185017.1759193-3-alexander.shishkin@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250211185017.1759193-1-alexander.shishkin@linux.intel.com>
References: <20250211185017.1759193-1-alexander.shishkin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct function comments to prevent kernel-doc warnings found when using
"W=1" that the drive-by fixers had trouble documenting and skipped over.

msu.c:168: warning: Function parameter or struct member 'msu_base' not described in 'msc'
msu.c:168: warning: Function parameter or struct member 'work' not described in 'msc'
msu.c:168: warning: Function parameter or struct member 'switch_on_unlock' not described in 'msc'
msu.c:168: warning: Function parameter or struct member 'iter_list' not described in 'msc'
msu.c:168: warning: Function parameter or struct member 'stop_on_full' not described in 'msc'
msu.c:168: warning: Function parameter or struct member 'do_irq' not described in 'msc'
msu.c:168: warning: Function parameter or struct member 'multi_is_broken' not described in 'msc'

Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwtracing/intel_th/msu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 492d8eba37eb..bf99d79a4192 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -105,13 +105,16 @@ struct msc_iter {
 
 /**
  * struct msc - MSC device representation
- * @reg_base:		register window base address
+ * @reg_base:		register window base address for the entire MSU
+ * @msu_base:		register window base address for this MSC
  * @thdev:		intel_th_device pointer
  * @mbuf:		MSU buffer, if assigned
  * @mbuf_priv:		MSU buffer's private data, if @mbuf
+ * @work:		a work to stop the trace when the buffer is full
  * @win_list:		list of windows in multiblock mode
  * @single_sgt:		single mode buffer
  * @cur_win:		current window
+ * @switch_on_unlock:	window to switch to when it becomes available
  * @nr_pages:		total number of pages allocated for this buffer
  * @single_sz:		amount of data in single mode
  * @single_wrap:	single mode wrap occurred
@@ -122,8 +125,12 @@ struct msc_iter {
  * @user_count:		number of users of the buffer
  * @mmap_count:		number of mappings
  * @buf_mutex:		mutex to serialize access to buffer-related bits
+ * @iter_list:		list of open file descriptor iterators
+ * @stop_on_full:	stop the trace if the current window is full
  * @enabled:		MSC is enabled
  * @wrap:		wrapping is enabled
+ * @do_irq:		IRQ resource is available, handle interrupts
+ * @multi_is_broken:	multiblock mode enabled (not disabled by PCI drvdata)
  * @mode:		MSC operating mode
  * @burst_len:		write burst length
  * @index:		number of this MSC in the MSU
-- 
2.47.2

