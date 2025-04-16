Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E3A1990A7;
	Wed, 16 Apr 2025 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744799005; cv=none; b=NV0ns+tdbOgBc31i8O9GOOQicASSIMv5uo6tqP+8u7zw/wRJs2qT7zH4jhd4ct/qqNzAC3JxE1WE5rqqjRxub43YvAiTHgfAfiT+frPmSKqyGN+g/ZtLMfwkpU8eEQ/Ia4QdSJgVYzCORFR/jC8Oi43oIXvKGVnw+M07GoOkcq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744799005; c=relaxed/simple;
	bh=4APCstta6NRtcMMvDAtx6LE+2Lkns4hBIWpJsmxYQSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Auao7xcSKWB3TkDqMNMrfdrHEY6lxusmNAOAbmdaN2iVysUQ8SStpAdjqPxfLSoW0b5+9qxxvJ1M1mj5CZcAC3vWgmseQ8NjW5rMt7WtItnjeA/VUXMMhTR6kGAP/C68DN5Ap8OrTNAn/l+iGDjx9muk+7XS7evzV2ukRaxiy7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Es1uKfvH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Es1uKfvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744799004; x=1776335004;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4APCstta6NRtcMMvDAtx6LE+2Lkns4hBIWpJsmxYQSM=;
  b=Es1uKfvHMyucyeu90+1bspI50Y0nE5OnRDBXkTPJb4FmMNZjF3tHh+2K
   4qBfkHzRipprdSlGlAx2OCIqj4r/XEC9bSUlWIRwJmXyxPxsnpVehD6ho
   8VQUHSiH4HQzWqmf4nGiVmRQaSWzkVl5nKJtEJbMsb5xBr+ScvkoSxMHm
   MAxPwaKNWIN/wbmWW4y51pkiKrYoJD3saeBuWZiV2DFDxmlZOUZW9R5hU
   Jsrg0nkHLmzdCRBbZUCs6W6SF8FdwYGYEEza09BP+0Ua5ilLcSqDiI9L4
   lQPymmMqc+1sXS06+sJCDfICWrlgTaBzcKKO9JkrClkn+W9XQRsshhdro
   Q==;
X-CSE-ConnectionGUID: pmG9odfxT92+aJ91aYqt/g==
X-CSE-MsgGUID: LvQW9xT3QBOABBU/L4jyzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46354831"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46354831"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 03:23:23 -0700
X-CSE-ConnectionGUID: vTFjc6JBTBCMdEew9m68NA==
X-CSE-MsgGUID: LP0ubWXwSXmigGSk3yFZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="161378579"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.243])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 03:23:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/1] alpha: Use resource_set_range() helper
Date: Wed, 16 Apr 2025 13:22:59 +0300
Message-Id: <20250416102259.7802-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert open coded resource size calculations to use
resource_set_range() helper.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/kernel/core_marvel.c   | 10 ++++++----
 arch/alpha/kernel/core_titan.c    |  4 ++--
 arch/alpha/kernel/core_tsunami.c  |  5 +++--
 arch/alpha/kernel/core_wildfire.c |  5 +++--
 4 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index b1bfbd11980d..c75cd4c68258 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -238,13 +238,15 @@ io7_init_hose(struct io7 *io7, int port)
 	 */
 	hose->config_space_base = (unsigned long)IO7_CONF_KERN(io7->pe, port);
 
-	hose->io_space->start = (unsigned long)IO7_IO_KERN(io7->pe, port);
-	hose->io_space->end = hose->io_space->start + IO7_IO_SPACE - 1;
+	resource_set_range(hose->io_space,
+			   (unsigned long)IO7_IO_KERN(io7->pe, port),
+			   IO7_IO_SPACE);
 	hose->io_space->name = mk_resource_name(io7->pe, port, "IO");
 	hose->io_space->flags = IORESOURCE_IO;
 
-	hose->mem_space->start = (unsigned long)IO7_MEM_KERN(io7->pe, port);
-	hose->mem_space->end = hose->mem_space->start + IO7_MEM_SPACE - 1;
+	resource_set_range(hose->mem_space,
+			   (unsigned long)IO7_MEM_KERN(io7->pe, port),
+			   IO7_MEM_SPACE);
 	hose->mem_space->name = mk_resource_name(io7->pe, port, "MEM");
 	hose->mem_space->flags = IORESOURCE_MEM;
 
diff --git a/arch/alpha/kernel/core_titan.c b/arch/alpha/kernel/core_titan.c
index 77f5d68ed04b..c115bbee2e94 100644
--- a/arch/alpha/kernel/core_titan.c
+++ b/arch/alpha/kernel/core_titan.c
@@ -271,8 +271,8 @@ titan_init_one_pachip_port(titan_pachip_port *port, int index)
 	hose->config_space_base = TITAN_CONF(index);
 	hose->index = index;
 
-	hose->io_space->start = TITAN_IO(index) - TITAN_IO_BIAS;
-	hose->io_space->end = hose->io_space->start + TITAN_IO_SPACE - 1;
+	resource_set_range(hose->io_space, TITAN_IO(index) - TITAN_IO_BIAS,
+			   TITAN_IO_SPACE);
 	hose->io_space->name = pci_io_names[index];
 	hose->io_space->flags = IORESOURCE_IO;
 
diff --git a/arch/alpha/kernel/core_tsunami.c b/arch/alpha/kernel/core_tsunami.c
index fc1ab73f23de..3e4d3a845e55 100644
--- a/arch/alpha/kernel/core_tsunami.c
+++ b/arch/alpha/kernel/core_tsunami.c
@@ -271,8 +271,9 @@ tsunami_init_one_pchip(tsunami_pchip *pchip, int index)
 	hose->config_space_base = TSUNAMI_CONF(index);
 	hose->index = index;
 
-	hose->io_space->start = TSUNAMI_IO(index) - TSUNAMI_IO_BIAS;
-	hose->io_space->end = hose->io_space->start + TSUNAMI_IO_SPACE - 1;
+	resource_set_range(hose->io_space,
+			   TSUNAMI_IO(index) - TSUNAMI_IO_BIAS,
+			   TSUNAMI_IO_SPACE);
 	hose->io_space->name = pci_io_names[index];
 	hose->io_space->flags = IORESOURCE_IO;
 
diff --git a/arch/alpha/kernel/core_wildfire.c b/arch/alpha/kernel/core_wildfire.c
index 8dd08c5e4270..00d63fc29caa 100644
--- a/arch/alpha/kernel/core_wildfire.c
+++ b/arch/alpha/kernel/core_wildfire.c
@@ -78,8 +78,9 @@ wildfire_init_hose(int qbbno, int hoseno)
 	hose->config_space_base = WILDFIRE_CONF(qbbno, hoseno);
 	hose->index = (qbbno << 3) + hoseno;
 
-	hose->io_space->start = WILDFIRE_IO(qbbno, hoseno) - WILDFIRE_IO_BIAS;
-	hose->io_space->end = hose->io_space->start + WILDFIRE_IO_SPACE - 1;
+	resource_set_range(hose->io_space,
+			   WILDFIRE_IO(qbbno, hoseno) - WILDFIRE_IO_BIAS,
+			   WILDFIRE_IO_SPACE);
 	hose->io_space->name = pci_io_names[hoseno];
 	hose->io_space->flags = IORESOURCE_IO;
 
-- 
2.39.5

