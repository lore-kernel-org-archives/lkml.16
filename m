Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABECD25760
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738350449; cv=none; b=TtSugZ/K4BKO5jw4yz24Bo9E4Myd/YIaADjVEKq4tihW0Qssw0yVlzgVqcT16qiywMlFBvgjZEPi9bn1jKMwPqbFMSpHhqdJg87cMxGMR6/mbjE00QRChRR8ZDm6+FfpTTVElMFZajyMoA4X4FxNLxVUNQVcKKk4tw9XyhJrCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738350449; c=relaxed/simple;
	bh=g6S7RBTdlP6vRE9eiEhuaez7g85Nl+mA55DBa4BcQLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P0EFFF2h4pU6JQy/QRxNDCBo+491pA9307D8zWn6+cLNdwaXym/WbbRu7dLieEFHqXH3ImkXsJwCdeHQgyU3uDynNkV5qwUBVkLsPqpzm1A2G9j64HZTe2S1elhCsz2W/4sdV7LvLn+rZPYyBrleE+p2XMWPuN8xcLcFHzmhqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUWhUFSw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUWhUFSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738350448; x=1769886448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g6S7RBTdlP6vRE9eiEhuaez7g85Nl+mA55DBa4BcQLc=;
  b=fUWhUFSwgVognlANUin526TSGb0rCUmJrfjtJ1Iq6xNcUTlXGWGLkX+x
   5sBnnm8EdQ51aadUEJBbTkljjl7Vy8jvu4QBor2P2hdykZnlqrBvuED3E
   9jvUHCXadt9Z9ue7wpaAwQToRP8L4n0zghghQXuDXB+GDpRuNdiBZU5no
   1DvUc+bk9cJsrU5dvDhJKTpR7zr64Vsf+W5nwi6jMTF3sspKt7zHsg7I/
   tPGvT3r0mOPNWhg9wHwynVzAUtiA+/jT3QecHnJtda3KfQ1d+jAsF0Uzc
   ePeejuTZhd4v/bojZHliv2hJfo7fzqwUXw72H9wJWuYCbHPoy0qqqQOy3
   w==;
X-CSE-ConnectionGUID: ENndtG05SUyCTnXR+1sDvw==
X-CSE-MsgGUID: bAbmvfhARSSkDGczaH09yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49187540"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="49187540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:07:28 -0800
X-CSE-ConnectionGUID: Y9iaeRq/TwqAutrbqPKmfw==
X-CSE-MsgGUID: VQ0K/4ENR8KBrh6dy8EUCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114698815"
Received: from fyu1.sc.intel.com ([172.25.103.126])
  by orviesa003.jf.intel.com with ESMTP; 31 Jan 2025 11:07:27 -0800
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Reinette Chatre" <reinette.chatre@intel.com>,
	"Tony Luck" <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>,
	"H Peter Anvin" <hpa@zytor.com>,
	"x86" <x86@kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Subject: [PATCH] MAINTAINERS: Change maintainer for RDT 
Date: Fri, 31 Jan 2025 11:07:31 -0800
Message-Id: <20250131190731.3981085-1-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to job transition, I am stepping down as RDT maintainer.
Add Tony as a co-maintainer.

Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08ce00b6c1f3..427779715756 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19822,7 +19822,7 @@ F:	net/rds/
 F:	tools/testing/selftests/net/rds/
 
 RDT - RESOURCE ALLOCATION
-M:	Fenghua Yu <fenghua.yu@intel.com>
+M:	Tony Luck <tony.luck@intel.com>
 M:	Reinette Chatre <reinette.chatre@intel.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-- 
2.37.1

