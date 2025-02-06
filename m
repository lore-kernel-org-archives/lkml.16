Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3769F22688E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838170; cv=none; b=C+3Z6W2wOzLN+PTAbmxA4eQ9s7T1PMTRU6Gh+tukbdBDHhxu4BqqhCpjI1niX2jW+VI0a0VwPolDRjVhgDYMBFOity1ybXH2y0N0vwkHc2NHqNc1CwX+s2RZFkAFOR3eeFv5I7SORIfLzfly0mOQmt14Gh+6bzJ2FVNOnUhJagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838170; c=relaxed/simple;
	bh=8Djw3Or85foo9fcv1QCAZt5FOkg7+JtChbY7uB4eG78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f9V3tFSYdmn6LnqtpH77cGKoS2fNjnknRuZbcaCGmGXN0i73V5QRPaUrDlceLLj1t3+hcviHYa2NNaVd+8xQt5o39Zs3SgjQ4lQIXRLnMOzmYz0+GRleBrNMztaVFom9jbviW2kd4nTXehJhWZXzfz69nxlLnCJfQKE2zdZqQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiwL4Ete; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiwL4Ete"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738838169; x=1770374169;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Djw3Or85foo9fcv1QCAZt5FOkg7+JtChbY7uB4eG78=;
  b=MiwL4EtesSORlf9KubpR2kM7LNamksStUC2IhN5G4n2Ej1rR5Oy7n6+o
   A36hA6pfQmQIoMGVKWOabL4rox0fCIYLG+7dXIMf+SeSwThpEqMhem0Nw
   68C8eob+3xMEeUSsLDMuyRZH3kKEpL+3GWBaet3O0uWRODIAadG9CF76L
   gQwJbRwF+xiM/BG7K+3jSx94xE651dmejOx2vhhpU+1Iuh1zx4AsvzLwf
   WwHZeQrbVx6/3vEQtwbcEXdPo8UfKDtfIpiJCcLQHmFb6RpWj+555ySxm
   63roR0/GFu5hLRFWIb7jcnUGBv5R6Td2OsZUZNzspAermIkb3ULV20uVI
   w==;
X-CSE-ConnectionGUID: nxgPWSawTr+7BkxIaIzYXA==
X-CSE-MsgGUID: vYK/UOWBRVimOsOsbH/aiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49679659"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="49679659"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:36:08 -0800
X-CSE-ConnectionGUID: XHYph6fDR2yROP+UPCQVQg==
X-CSE-MsgGUID: 1naLGQiWQmug8iw68QJZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142052536"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..) ([10.245.246.47])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:36:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add TTM reviewers
Date: Thu,  6 Feb 2025 11:35:44 +0100
Message-ID: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Matthew Auld and Matthew Brost as TTM reviewers

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dbf6a03e416..7a032ea9f109 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7931,6 +7931,8 @@ F:	include/drm/drm_privacy_screen*
 DRM TTM SUBSYSTEM
 M:	Christian Koenig <christian.koenig@amd.com>
 M:	Huang Rui <ray.huang@amd.com>
+R:	Matthew Auld <matthew.auld@intel.com>
+R:	Matthew Brost <matthew.brost@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.48.1

