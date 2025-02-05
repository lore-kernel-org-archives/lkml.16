Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720EC25A649;
	Wed,  5 Feb 2025 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741364; cv=none; b=J9HdRnD432ryxGfQMMv14KeBMe//U6ZS1IjnHtXKttHj8sRO4V6MpDyZfnYE12h8DVDlnAKNayxvHWgZt8Uq/d0eUvtRLkAIm94U/Kf0bgP5YHEITQi7oogX854hR8lVDZHC6zMmuwvUTzZu6Kq5dGQzks60nOA6GS06RK3M0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741364; c=relaxed/simple;
	bh=bAxP2C9chhh7ebYjvDyVoxXXysQl3YWuW1++Hm/fFLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OZ/qByTdRSqKdNFr83i4yeFKWEz2qBxRw6IlVmk7D5mCfce6iAGTQ1S2ZWEhAiGPlQPQOfzNK6qlvut73nYgrx619qhp9anQnOo6yOrq4b7emSp5uot2dAfVwQz/vXfjWJvFF9zcho56rEJdrpSeE9jxpXNAeLI+zasocNHCX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1/bWWS1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1/bWWS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738741362; x=1770277362;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bAxP2C9chhh7ebYjvDyVoxXXysQl3YWuW1++Hm/fFLE=;
  b=N1/bWWS1crY1HWC2qpAlNW9+lEokZbBHDapQohMCtXaI7Im5xW7Grtc9
   gerA90ubkonoFk8s8JZJtvzNHLZdt5xxx+lnP9vNmbrw9P3JWh99AgMVJ
   IQPPxYg1gCAo4kPgb/626xrAlqZiuIaFi/D9HEkEwdK3nni+0a/rvZVfS
   xMPUvV+f3yLlUBJkiSwRlmXTjUL97JS3hXos+MW+Knpb7iaMHpYrdwISW
   Dh0G4U+GHrNCvQGZRVAyYla3/910C8JaMyEmEFNFtsIw14MHSPcvRihkg
   zQY042S87Efn72KPN3x0PY0bmQNf3gl49tu/IaSidbgSK0Sh8UP+JoBmY
   w==;
X-CSE-ConnectionGUID: n6aXziWOSFeWKifAcmWO7w==
X-CSE-MsgGUID: NYH4/7JtRQyvwkt+pYt7wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38499675"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="38499675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:42:40 -0800
X-CSE-ConnectionGUID: oOPOYbUjQZmRpXuShkAtEw==
X-CSE-MsgGUID: YdNYhTBPQyqAzApQ0HqBBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="111004869"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 23:42:39 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 0/2] soundwire: Intel: support more then 1 sdw bus clock frequency
Date: Wed,  5 Feb 2025 15:42:30 +0800
Message-ID: <20250205074232.87537-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series set frame shape and divider based on actual clk freq to
support dynamic clock change. The revert the commit that limits Intel
platform to use fixed clock frequency.

Bard Liao (2):
  soundwire: cadence_master: set frame shape and divider based on actual
    clk freq
  Revert "soundwire: intel_auxdevice: start the bus at default
    frequency"

 drivers/soundwire/cadence_master.c  | 22 +++++++++++++++++++---
 drivers/soundwire/intel_auxdevice.c | 21 ---------------------
 2 files changed, 19 insertions(+), 24 deletions(-)

-- 
2.43.0

