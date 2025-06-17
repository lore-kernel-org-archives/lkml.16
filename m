Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB2233993;
	Tue, 17 Jun 2025 01:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124453; cv=none; b=URXqTCNxKj30OOws3125NBci9vHhREjkCW1/Etff9uONp7wLm9kMLmj1guwL2r4tboX/IpViRtp+YonA277PubxJXFoUa064evYLTV9feHoSHdHBEmv9ULgca/R8EkvRYpn3R2e2xH1/J6an39mQzgU18aA1yqHBzikWhmueq4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124453; c=relaxed/simple;
	bh=da8Jwzo2ic5R94yd+CIBR13juhRPWVZW26d2H4D0CW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvjUE7i59arNLHmSdYm9C7PVpIreFPqiEwsA77SU89bp9z1hyOnLLdMcI8hkX+ho3SvqfNoNcGHtyTX2fj6gG/LCbJjogSQut2alN98Zyq7TBB+BvwYy16QvUCXcPZII5sktST8Ln8LfLUZ0Y2uylUPE0zHys8AIksXmx6/Y5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBnQX9Nq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBnQX9Nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124452; x=1781660452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=da8Jwzo2ic5R94yd+CIBR13juhRPWVZW26d2H4D0CW0=;
  b=JBnQX9Nq/bxZdHP1dqYmDlkuEThXNb82juoVns1zEfRQUR4izDpzM30x
   r4EFyxE4nltsewxcGE7yQYOLHLgQ1bYAdyHKgrX4Sp1ZjyYeHgemhB6Pw
   d17HuFFdXPSE2i2M4YQOMoo1zYyA+6X5UcqNLYxEmKHUMyhF+XT8VEm7x
   bheMal73gWsopjj6jtbakWTPOAjFgPvWRU08gZdpOG8DFCbdPpfxmDix+
   DsA6TZOv/hPqH/f8YWXHjbsAFklIpENsJOn6TQUF6rpai50UO4JbwocFN
   7eQX4oisk3uMuUJ4dH5TkHugmHf6p82wwVSb2/n5tn2pDqzFxHM0GAB6a
   g==;
X-CSE-ConnectionGUID: LYCxFfG6TQiiNKQxq5hDmA==
X-CSE-MsgGUID: dwdbvbHdRjq4BQxsA0CCUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556530"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556530"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:50 -0700
X-CSE-ConnectionGUID: QdsZ0PMkQyeWCXHl4eEkUA==
X-CSE-MsgGUID: joqf27UNSmuLoEHfq5vxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989437"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:49 -0700
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
Subject: [PATCH V2 01/15] MAINTAINERS: Add link to documentation of Intel PMT ABI
Date: Mon, 16 Jun 2025 18:40:25 -0700
Message-ID: <20250617014041.2861032-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
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

Changes in v2:
  - No changes

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..b704107859a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12386,6 +12386,7 @@ F:	include/linux/mfd/intel_soc_pmic*
 INTEL PMT DRIVERS
 M:	David E. Box <david.e.box@linux.intel.com>
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-class-intel_pmt
 F:	drivers/platform/x86/intel/pmt/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
--=20
2.43.0

