Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FB2EF64D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950086; cv=none; b=n2JigmjKX74JrhK7++bplHxw7IQdyImMEmgJLCo5Qv7r/ChD5FLzi/6cMjujOiRyc7sf8Gzs6TEz/dXGvTzWSbcbtb6T4tEvCoup8c43sMzeSVL5E9R0egcCj2gyX/gFiZB9GEVLz/yUvHSKOKgscK79SDI1Q0tjDKtzVZsYOI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950086; c=relaxed/simple;
	bh=IKFVK62nc1DPi+ZXmbCDfuOx5jFjnSp0BYdBVUWUuCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4FzgRoeJ65oYx+OtSA7YpFW+63iFglc4cT9lBz+G9WzEZ1yDx93i5WLsD72uSvp4ip8kk5MFNEywaq9ue10etVv/blM/mcm8WIM9XhmT0TZabX53qZyIgxuUD6hBX8b5oZVuJvqMDYF2QDuRb4lMA7puBUZTmh/0feKAYmPDFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9FZKwHX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9FZKwHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750950085; x=1782486085;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IKFVK62nc1DPi+ZXmbCDfuOx5jFjnSp0BYdBVUWUuCA=;
  b=k9FZKwHXsw+6XMYm19yFTghYuoLZRwkdzqv61QV12yrEyx/l40bAZuQ4
   m9JJRIDPnh9XaMKacGHPK6JmyFSaBqbuSGF8CGPHHTJuV7BqzRVE2QCoC
   QlzmQp6fhSqkIIOw864t2RGDvmc5r/niuE+OyJOXHf4yh7nIpEVWbe313
   YCWBIH/QbMKSIqVHPV3F7cn64WoTsWOnbLtHbR2BHhXQp2E4MIFGfgrzt
   rYXYBPFENKyEA6Aa08+xy4IdcSbrG98RAsTJAQdP9TiTximj9NaFXoXf8
   o3xaXB/d5eBY+ntWV0ZEdaYDwAGXbNYxNeXYGuAVYvBI3UE6DKtm+7RiK
   w==;
X-CSE-ConnectionGUID: XMNQ04NsR3m3iEX5YzRY9g==
X-CSE-MsgGUID: yUqP8sB2TrqWuJ0AKRmJoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53382419"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53382419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:01:24 -0700
X-CSE-ConnectionGUID: 6tubOVvgTYCbmHZNdqkRkQ==
X-CSE-MsgGUID: F5KubKH4Sv+n3uAVp8w0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="157103339"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 26 Jun 2025 08:01:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8144E2E2; Thu, 26 Jun 2025 18:01:20 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] x86/defconfigs: Explicitly unset CONFIG_64BIT in i386_defconfig
Date: Thu, 26 Jun 2025 18:00:34 +0300
Message-ID: <20250626150118.318836-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent refresh of the defconfigs got rid of the following
(unset) configuration option:

  # CONFIG_64BIT is not set

Innocuous as it seems, when the configuration file is saved again
the behavior is changed so that CONFIG_64BIT=y.

Currently,

  $ make i386_defconfig
  $ grep CONFIG_64BIT .config
  CONFIG_64BIT=y

whereas previously (and with this patch):

  $ make i386_defconfig
  $ grep CONFIG_64BIT .config
  # CONFIG_64BIT is not set

This was found by cross-compilation of the 32-bit kernel on 64-bit machine
with the result of non-bootable kernel on Intel Galileo Gen 2 board.

Restore the missing explicitly unset CONFIG_64BIT in 32-bit defconfig.

Fixes: 0e11f689ec03 ("x86/kconfig/32: Refresh defconfig")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed the authorship and amended the commit message (Boris)

 arch/x86/configs/i386_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index bd182325ebb4..9fc5c2eb58af 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -28,6 +28,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_KEXEC=y
+# CONFIG_64BIT is not set
 CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
-- 
2.47.2

