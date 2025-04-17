Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F68A254843
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906745; cv=none; b=mWVUnGSNsidr7lB3rDNh2QGUzCk8558DbOiCYKqkFUAvGP0VFPFoDtht5gs9wbOdbWiE9cbEF4ZJ3uWnp4uCJXaESTsok+uRnP6WGVZCeLTcwaYrWq+Zbrrf9Gz0dGk4D1mg/o+d4Sl3/8frmjOZ/G04OabvO7FMrdwb+cEaUYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906745; c=relaxed/simple;
	bh=Wh2a2rqlKP4QwZVx4samQLvnqm7K1UwdarpkI7KqCWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RATdzuxT4RoebCDPuDugVQhoGqLcP2dNxjO/30F362Nr+LyHAoZ09kh8GMyddd2uolz86s96HnrarL8WjUdff2nD6tTYPwdy0aIbd7n+PqVEY+vUWxIs+oiNEydjXolb+M98wHUJ2oUPHxpOEICFZt1bqifQLv97tI0MPBTYGdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ce6bWUHX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ce6bWUHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744906743; x=1776442743;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wh2a2rqlKP4QwZVx4samQLvnqm7K1UwdarpkI7KqCWo=;
  b=ce6bWUHXyBt5c2Qfsupk3pTHq1eVWeHk1TFNHiV5o+Q8/mAzzZWKBi1/
   ZWg2nJVYju3g3k0uD9Nu/FzvQZMYhc0BctAzYjr9TOEVkhpSu0qx3v6Fn
   PKOvWN5P4p0hzvSohsF7BInRqhCcMLvrRAbOBUKFtsdoCI39x1xi0Jjs2
   N0LmVx4cTsMxYY+SB3SRApCZf8WsToqkZTRv973N6TnYcC+Fv7mS+CDMD
   U0yo6qI7wv9aVbjHsHX3/1reTKNNMJggaPv6lNE3rThQLL9GOCK4KvEdc
   L+0x11a2QCggvGbw+hHQFbHwgVotT932TDvjG0DFifXYUgdPv9jvJFi5c
   g==;
X-CSE-ConnectionGUID: PMLM0YQxRNOitnoJ+WZaJQ==
X-CSE-MsgGUID: H9l6lQAoT9WVMWCM1o9qLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46390256"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46390256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:19:02 -0700
X-CSE-ConnectionGUID: 8XK+OKTgSraXLMesx2k44w==
X-CSE-MsgGUID: wzJnKge5QVy9mxXcwAKpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131743878"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Apr 2025 09:19:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0F36A5D9; Thu, 17 Apr 2025 19:18:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v3 0/2] bitmap-str: A couple of cleanups
Date: Thu, 17 Apr 2025 19:17:14 +0300
Message-ID: <20250417161858.611211-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of simple cleanups to the bitmap-str.h.

In v3:
- elaborated even more what is missing and why it's good to have (Yury)

In v2:
- filled the commit messages (Yury)

Andy Shevchenko (2):
  bitmap-str: Get rid of 'extern' for function prototypes
  bitmap-str: Add missing header(s)

 include/linux/bitmap-str.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.47.2

