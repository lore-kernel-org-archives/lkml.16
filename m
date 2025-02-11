Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E05262D0D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299856; cv=none; b=KD1VCMawO1C0F2vq9bWVQhFup8Ufgrlf89FvqIqEoUc++1yH1Asfgzr/RUQXiKdGNetoQLnkj4S9amULZfTIiOSoAZjkg9MxuKaWtEmxLYxZ5LQJmObc1A9rYeu6sYtPAXAUywCLloxCv28NPiorP3diiSPRbW8P2vYmx5Oiaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299856; c=relaxed/simple;
	bh=tKaSwlUToGhEpBuLbJaqZ4JaBFick+0Rx4nfge+h+Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5PfVZw0JuJlvvz4R/A2RlfaWspN122OIxexYXxbTdqy/zEp6aOVEncov8UhxJ9Rsw0KkqaQ8HspveoqBXwr6TO8Rtg3qZtJY+fxqYEmZw1HjSIFAUbqgSSB6Pr4A0cFcZmk66chji6fZxaucoCpHjAjE94BszlXmu0e3oYvfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKsV6u9G; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKsV6u9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299855; x=1770835855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tKaSwlUToGhEpBuLbJaqZ4JaBFick+0Rx4nfge+h+Fc=;
  b=nKsV6u9GMG6Nqi2BM79pr1iGKdUYMiU7enVWrhEnXKbpFVj/mF2GO1rZ
   Ww1/jNUJRmL813hQ8Lc4knHOXAkxXtZRot2ugf3kSzd7In8or6WE8E78q
   Gm63jduHIoPnjX4MfyUm1gqqtUA+ehZmrsrC2jFMIzJzOy4Vh9U6cI0jo
   vH06kNZqkdl+NtS0FAp0HsRb9gO1nFw7PpjxhsG5SX0OPVYRlA+yi6wJW
   +HOmmPqpdQKpj/sMD3LzvchuTLfjeRDd6uipyPm4dWEeN6CYOSkNTF6Se
   VRX7sG4fZ9j3ycF3tLGqvVFc3IJ7RhFHWWHZz8dIS+nEhdUN2x4arcKWR
   w==;
X-CSE-ConnectionGUID: FDG5UZLcQ+W67f8B/xKF8g==
X-CSE-MsgGUID: smKFItj4QcOvR5B0o1Qcdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57345437"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57345437"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:50:55 -0800
X-CSE-ConnectionGUID: IB0RnN5SS9ey0jxV3N5Csw==
X-CSE-MsgGUID: XBhpMDkLTM2QOrIxCqh1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149780213"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 10:50:54 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [PATCH 1/5] intel_th: msu: Fix kernel-doc warnings
Date: Tue, 11 Feb 2025 20:50:13 +0200
Message-ID: <20250211185017.1759193-2-alexander.shishkin@linux.intel.com>
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Correct function comments to prevent kernel-doc warnings
found when using "W=1".

msu.c:162: warning: Function parameter or struct member 'mbuf_priv' not described in 'msc'
msu.c:164: warning: Function parameter or struct member 'orig_addr' not described in 'msc'
msu.c:164: warning: Function parameter or struct member 'orig_sz' not described in 'msc'

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 drivers/hwtracing/intel_th/msu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 66123d684ac9..492d8eba37eb 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -108,7 +108,7 @@ struct msc_iter {
  * @reg_base:		register window base address
  * @thdev:		intel_th_device pointer
  * @mbuf:		MSU buffer, if assigned
- * @mbuf_priv		MSU buffer's private data, if @mbuf
+ * @mbuf_priv:		MSU buffer's private data, if @mbuf
  * @win_list:		list of windows in multiblock mode
  * @single_sgt:		single mode buffer
  * @cur_win:		current window
@@ -117,6 +117,8 @@ struct msc_iter {
  * @single_wrap:	single mode wrap occurred
  * @base:		buffer's base pointer
  * @base_addr:		buffer's base address
+ * @orig_addr:		MSC0 buffer's base address
+ * @orig_sz:		MSC0 buffer's size
  * @user_count:		number of users of the buffer
  * @mmap_count:		number of mappings
  * @buf_mutex:		mutex to serialize access to buffer-related bits
-- 
2.47.2

