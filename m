Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC912DC79C;
	Wed, 30 Apr 2025 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048078; cv=none; b=CpYAxID8D2gQJVf8OzVwvzTYygXJ6rEMSixk0qC/gRcAsEOzAMki0CNEh9rYa8em2AQ+ZaiA2jgjpaSw5fcBn9hfQTcaVdT3oN+CNWdLyHAP+DXcIfun7g97KL6Okom4D4QVT3/I1FnwNLC7AOYDdQot68+PtjxPLfR/DI91YMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048078; c=relaxed/simple;
	bh=Hjl/PzJ9OBwygFkBj0UZZ1ITO2bUymcG7qA5rdmdkPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Set3lKNkXa7KnBSxorpmBjNg50xFnb5+1Q8S/hcVJC5YZ3KdoucPzhptf+IYl0Rlg3qc7ZRpBcK72V/vS8PS3l2pySdrJAceoe0BLgnaIJczKF4BM/aW2/oHCfuehqD7eXH3w48EzpRjvdn+B+ZQzkTQueep7WOf8koXET+dLw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7NQ9o8t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7NQ9o8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048077; x=1777584077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hjl/PzJ9OBwygFkBj0UZZ1ITO2bUymcG7qA5rdmdkPk=;
  b=f7NQ9o8t2h2rfwkSfYvTMtHanlw1Q4UHcgK32FJ09GaPfZ5LT90Cf3ha
   AyXNCGExVdkdGRWq8uxS49QzEXTUAvM8zZqc/iTWcmlInWSOr18enU4ga
   L8dMfuTEq0+PgrouH+Qte7m1XDKm5D1t597AHFTxs3QDbmCKDKHsT6ac8
   9gLo0dZZmmXgW+Y6S7tD4fd2WakCPC0u9KpLC468sIHwoOTtQX7uwnB2l
   uwMdLDfNTOTihCBlh1eUSyHIesCHHGBAVHeRXlJhKrY0YEYAKZFBfCqWa
   FOt0/sF+GEmBnajkiIb3u+VAOdteB4fxqaW4CuWZ6EpENAOWL6ECnlMsU
   A==;
X-CSE-ConnectionGUID: MUlwXpyMTdKtZnj5TnUzbw==
X-CSE-MsgGUID: 8Mxp7/FvS1WP4y3gkDWPeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257531"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
X-CSE-ConnectionGUID: 3Sm4mRWpQ5qzLS5mef5mqw==
X-CSE-MsgGUID: +dnr9V/CQUC8y/UfObSuHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972268"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:15 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH 01/15] MAINTAINERS: Add link to documentation of Intel PMT ABI
Date: Wed, 30 Apr 2025 14:20:50 -0700
Message-ID: <20250430212106.369208-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a link to the documentation for the Intel Platform Monitoring
Technology ABI in Documentation/ABI/testing/sysfs-class-intel_pmt

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index be2f100d7f4b..bd9f99585894 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12180,6 +12180,7 @@ F:	include/linux/mfd/intel_soc_pmic*
 INTEL PMT DRIVERS
 M:	David E. Box <david.e.box@linux.intel.com>
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-class-intel_pmt
 F:	drivers/platform/x86/intel/pmt/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
--=20
2.43.0

