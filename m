Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC6296147
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774418; cv=none; b=YC4fbVxYDfT3bOtuQ+3pcjSxLYmVgfr44breWBAi7+TJ9wv03N3kgbS2v3OfaPO5QQxSZNEA9z41EaXUEDN2u57AiB4TrubAstrCNJEr6lbyeGNtlGME3n/XuyCL6JY5OJHuvVobij1DUOsZN6UHvmzOpypdVrx6Q2xCIsETHO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774418; c=relaxed/simple;
	bh=oempXtxZmm2flXJ2XHkp+B58SBPwwEHaQWJvyPV0ghQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uCfqZrptpf7uN7bctsd3GFkMrxexKZc2OkX9+esHPmNKpZIZuJYj3G4fgzNvmFJek8ax4sJxOsbPtInoxIaLzKvBRPfdDGMI/MjYoHpwXfGveW4u6lZKeAEFfFBSrQzuu1k5KC4mHO5v5OK+bTrl/5ym4yLR2kt22yROFFMremc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfOnF6Aj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfOnF6Aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750774416; x=1782310416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oempXtxZmm2flXJ2XHkp+B58SBPwwEHaQWJvyPV0ghQ=;
  b=LfOnF6Ajf0HNnIQg0rol4oBe4PTb10qgzGZ1I3Y5sac+stcTnjte/73Y
   FRkeldJPJrEbV/gIeXh3QiHq9TIJFechmIm8/d0lNfv88J1nKD6jPt+MA
   Rui3EBKt8q7zh3TjGY+irg8fj1dZoOQHdJgnaWRgXGpMDdcFDayFJuwv/
   WApodvmJUIQrdxcNCNJnhZtJNqfdjqREn9P9JUfA9VeqfEEyOCHcgJVwe
   MJxKpSol6SCQ5y+sF76A38Fw/sUyHbMIage2q2UAZnZhE1nkROj91o6gJ
   CO4tko/ZmIX9G3fOl46g+6lGQaq9AwOEmBtj0xU+4AZPF0ZAnxtnOUZE2
   w==;
X-CSE-ConnectionGUID: kAYvs+ZQT72XdgP/N5117g==
X-CSE-MsgGUID: QFm7CXblSRuEz0U/0thB9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52952345"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52952345"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 07:13:36 -0700
X-CSE-ConnectionGUID: K+qj7QfXSJ+xe5rRf37a6g==
X-CSE-MsgGUID: jRhzMfYHSNCujAKQ7NNS7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152048612"
Received: from jpp-desktop.igk.intel.com ([10.91.221.24])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2025 07:13:35 -0700
From: Sachin Mokashi <sachin.mokashi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	Sachin Mokashi <sachin.mokashi@intel.com>
Subject: [PATCH] mailmap: Update Sachin Mokashi's email address
Date: Tue, 24 Jun 2025 10:12:20 -0400
Message-Id: <20250624141220.1264691-1-sachin.mokashi@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As previous contributions were made with the older email address,
which is no longer in use. Update my new address to map the old
one.

Signed-off-by: Sachin Mokashi <sachin.mokashi@intel.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index d57531dab08b..571379d80f50 100644
--- a/.mailmap
+++ b/.mailmap
@@ -668,6 +668,7 @@ Muchun Song <muchun.song@linux.dev> <smuchun@gmail.com>
 Ross Zwisler <zwisler@kernel.org> <ross.zwisler@linux.intel.com>
 Rudolf Marek <R.Marek@sh.cvut.cz>
 Rui Saraiva <rmps@joel.ist.utl.pt>
+Sachin Mokashi <sachin.mokashi@intel.com> <sachinx.mokashi@intel.com>
 Sachin P Sant <ssant@in.ibm.com>
 Sai Prakash Ranjan <quic_saipraka@quicinc.com> <saiprakash.ranjan@codeaurora.org>
 Sakari Ailus <sakari.ailus@linux.intel.com> <sakari.ailus@iki.fi>
-- 
2.34.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de
Managing Directors: Sean Fennelly, Jeffrey Schneiderman, Tiffany Doon Silva
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

