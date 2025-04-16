Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3B21DDC1B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785174; cv=none; b=hPuj6kRnvKtQD9DVCEiGNq70+uUNSRbYyUea1Mht/MXyBnLkMAFHEjJismJdQ+4tgGBK/2wEWpm0UK6Kyaxyfs3SXGOV57AdkK9NNFz/YhtP9Df/zH9yFBKOkpn+OwkViRXatgglWv9WjOAxLL15UhAi4+FfOLlcMyGwbWvzdTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785174; c=relaxed/simple;
	bh=QLgMD4pLTpSBD+/SqJ3TruhsE1SZUBMDqzKwD09LWMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WtxeCV6GrgNiX74/KalpKCEKC+3b3DEtiB6B+W/XAr1wWLX8Pc94rAbey4lmoOEivFrZ3+FmemNtrZWC5fdnFCTI5cmUlNd8zDtsMOgikpN0GYIfGgh6n+ly1yY/d4NBeXuiA0u4dLaCeklXCUD8C1EiGVImWM7voZ09iadhl3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6Gzhxtk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6Gzhxtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744785173; x=1776321173;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QLgMD4pLTpSBD+/SqJ3TruhsE1SZUBMDqzKwD09LWMA=;
  b=E6Gzhxtki1SHCrdoIHhNxp+gL2PeeyYl5IsUmMBwxNHaKu5q9I/F1mys
   L531u2tXUJsMB1SaqV8QzqzwIfP/QjOVSck/DymMuBb8RYv/K7hSb9Qij
   DRyWnCfAiZ3ByLPvveCIpkov94r70OH4yFjUyNl1IatsKdFlLvsc8Jio0
   uscOnCGe5LVoOva3ykQ1NBg36USAfTYfHv2VlDjRMz6+tubzFfwWIzcPy
   /J3uxMpVy4ikUI354Rg9lZQ4CSrencfpGatUf5TUML3C0aq/fRIZg11Cf
   VGuLEu/9R8klA7r8jL7Et6lt5Ccy0UgqXLHkXshbfaSuM2BmRLleWXzom
   g==;
X-CSE-ConnectionGUID: hsLv1+NBS6KZ62Ny6Fth3w==
X-CSE-MsgGUID: MloqTe/NT5+O3t+8ZdbvRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46033320"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46033320"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:32:52 -0700
X-CSE-ConnectionGUID: ondbBn7TT0mfspCuYi355g==
X-CSE-MsgGUID: rxs7Fod9SkWWNb1AWKszVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130296387"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 15 Apr 2025 23:32:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 32F0C221; Wed, 16 Apr 2025 09:32:48 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 0/2] bitmap-str: A couple of cleanups
Date: Wed, 16 Apr 2025 09:32:09 +0300
Message-ID: <20250416063248.1864059-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of simple cleanups to the bitmap-str.h.

In v2:
- filled the commit messages (Yury)

Andy Shevchenko (2):
  bitmap-str: Get rid of 'extern' for function prototypes
  bitmap-str: Add missing header(s)

 include/linux/bitmap-str.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.47.2

