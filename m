Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F91F582C;
	Thu,  3 Jul 2025 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509723; cv=none; b=TrWCKLQAYiQPVJBTCgtlpRia+5xSQmSy6oviKnXWcRjEWhGndYpiYn4ORmmyqlbzT45pn+mqNfi6LmNJTb1IGzLP/g4uEqPkJc92PA0CaG2nr8gx3BcntLg3z8ubP2XVCzrTmOLULu4suPVb/FNM8r8nHFz4hXLLc9iIr7eSsUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509723; c=relaxed/simple;
	bh=D0wtHR0mnrKZnlBq26vCCH1Hh/WLD7zbSlgBN/T6sYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMFJ6YENr4I4nv8hRO0K+O3Wylo4nyyZogzLNXYU390sq+ekoHbXOaUnVzencjw8oSlaxpFlfJDL27dKaLUWrO5V8hLoNxhv6PgIt9fkgoDCKl6BFX2GmJfoJzcVltVJAd/nTzh4kcgO+zJlvgYV5b+UXyrp7sdMSCLwL/vJZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKQrzD4S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKQrzD4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509721; x=1783045721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D0wtHR0mnrKZnlBq26vCCH1Hh/WLD7zbSlgBN/T6sYs=;
  b=aKQrzD4SOLd0rcgdNwq9yNsgH3gg11co7qMU/A+UYjLMrXNxQdhLSSIz
   Fq1njJH3tYqdXIbNNNUWQ0WLcEPo9JEkrhZ32Y9is2Sp6Dn7Ap7ONL7gZ
   /xg0lgcI1DAOzcXwdDPgbe6NcT4SYN4/65ehlBHy5Bdx5aIpBhYBMLvVi
   WoeWWUo/Ybg3E1fjWXPhGq1Zx43WO81kvBQCL6OzpK/s5aQJYvIVOfYhd
   j31rB3graCJXQgkTZfPkBZ1s52pyfRmBDeNzD4ZTJKUWX+CmG/4IuI9co
   Yz/PbFPSs8B3nw1MM8R4hH2fQKKeLaEGJz5tYgspII8uDCLGZtcTGNAMS
   Q==;
X-CSE-ConnectionGUID: lql5+CSzTDqK50NYj2fGbg==
X-CSE-MsgGUID: Gio18odiQ0mwOf1wdKNzGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450227"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:40 -0700
X-CSE-ConnectionGUID: rMEIMLN5RPizTh8yVfz9Xw==
X-CSE-MsgGUID: soZvq96BSXi8jeuMklhs1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594013"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:39 -0700
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
Subject: [PATCH V3 01/15] MAINTAINERS: Add link to documentation of Intel PMT ABI
Date: Wed,  2 Jul 2025 19:28:16 -0700
Message-ID: <20250703022832.1302928-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703022832.1302928-1-david.e.box@linux.intel.com>
References: <20250703022832.1302928-1-david.e.box@linux.intel.com>
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

Changes in v3:
  - No changes

Changes in v2:
  - No changes

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64..b0a67f058393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12388,6 +12388,7 @@ F:	include/linux/mfd/intel_soc_pmic*
 INTEL PMT DRIVERS
 M:	David E. Box <david.e.box@linux.intel.com>
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-class-intel_pmt
 F:	drivers/platform/x86/intel/pmt/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
--=20
2.43.0

