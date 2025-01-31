Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55945154420;
	Fri, 31 Jan 2025 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738356806; cv=none; b=U1GRgFBi/jG9ip98PZ9vWfcZHGgRW6riadz26O+BFKiqkPZhqDIY6SxYq3oBhw15K+IwN+hGlQzOBzdCYxf76g0VJJML38eH+7uusM5r8ndB/XrkQNatC4ONaFGNm10FRQYFfSQhqvI6V8AjRP7rxSDRNMlzFAP8hSfAtQXNvWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738356806; c=relaxed/simple;
	bh=Ns9lG2XTLzvQyVHvzY6bvCcio7FqmkJo3OkAMj8JrDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ro+OW7WUzV8s3RTNMpD5T+aSTlnyS9SqtLbW53xJMNOdLffAyvcc2muWD/4myP7S2Hb/2WKhI7P+ZzJuQgnzg7uTUZw0ohKQnz8Ccgt/FMgjT6QHd8SNfethmiEFtYFbsuW1Qv/zf6jdta3qUU0zXG+GhQQZcZsv34lZnhYKCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PE4CbnBO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PE4CbnBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738356804; x=1769892804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ns9lG2XTLzvQyVHvzY6bvCcio7FqmkJo3OkAMj8JrDw=;
  b=PE4CbnBOnqLgY2esv/42UmLtUtLHPsV0mJpV89wNQHoCvEFCOfz9dX+R
   munCHM9w3unMWODr3COwdhyEPS2Ft4+tJEJZfMsq6+vph+fUbMuNSyavy
   eKbK9LJAtv26C0pK7ij5Wuqs/U1fN3ufHDsb0br8jeWyUHpWa2oudrFPF
   lgEA8rFnsiSt7JXpXWceUKoY8TMU+I1AkDIXVBxTPQW4j2nYr/2em9biW
   CFmgDGotDrCq7r+yM9VtmMkdJMnp92Ey9TXwYrnB5YrbAXnoXTRIhxryr
   PQgwdJDtfEX/9ipT+RiGq41izgFCdqiH1wOynRv3FkZ3HA6G08rnL9vcn
   w==;
X-CSE-ConnectionGUID: VatS3Z7CTpiT4wndgw008w==
X-CSE-MsgGUID: bpXeocwIQWuh48cSbL8ohw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="61405012"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="61405012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 12:53:24 -0800
X-CSE-ConnectionGUID: +bceC6AYSUyUvjfb1/benQ==
X-CSE-MsgGUID: pCjUY2VGSaix27Nsn+U76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109558363"
Received: from jithudellxeon.sc.intel.com ([172.25.103.66])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 12:53:23 -0800
From: Jithu Joseph <jithu.joseph@intel.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	jithu.joseph@intel.com,
	tony.luck@intel.com,
	ashok.raj.linux@gmail.com,
	anisse@astier.eu
Subject: [PATCH] platform/x86/intel/ifs: Update documentation with image download path
Date: Fri, 31 Jan 2025 12:53:15 -0800
Message-Id: <20250131205315.1585663-1-jithu.joseph@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation previously listed the path to download In Field Scan
(IFS) test images as "TBD".

Update the documentation to include the correct image download location.
Also move the download link to the appropriate section within the doc.

Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
---
 drivers/platform/x86/intel/ifs/ifs.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
index 5c3c0dfa1bf8..41fc21e7ef14 100644
--- a/drivers/platform/x86/intel/ifs/ifs.h
+++ b/drivers/platform/x86/intel/ifs/ifs.h
@@ -23,12 +23,14 @@
  * IFS Image
  * ---------
  *
- * Intel provides a firmware file containing the scan tests via
- * github [#f1]_.  Similar to microcode there is a separate file for each
+ * Intel provides firmware files containing the scan tests via the webpage [#f1]_.
+ * Look under "In-Field Scan Test Images Download" section towards the
+ * end of the page. Similar to microcode there are separate files for each
  * family-model-stepping. IFS Images are not applicable for some test types.
  * Wherever applicable the sysfs directory would provide a "current_batch" file
  * (see below) for loading the image.
  *
+ * .. [#f1] https://intel.com/InFieldScan
  *
  * IFS Image Loading
  * -----------------
@@ -125,9 +127,6 @@
  * 2) Hardware allows for some number of cores to be tested in parallel.
  * The driver does not make use of this, it only tests one core at a time.
  *
- * .. [#f1] https://github.com/intel/TBD
- *
- *
  * Structural Based Functional Test at Field (SBAF):
  * -------------------------------------------------
  *

base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.34.1

