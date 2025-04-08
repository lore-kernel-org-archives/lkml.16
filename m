Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3421ABD5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117850; cv=none; b=nP9ajJPcgK+UclazQW/PPdZUa09ua+F0/1E/wgHXwWDZrPjzHGbO6muQmCBbrKd0gF/GY9MmiuCjyOUsBm6rQVMz3CJgkSWj6BLQRpm8egxJ4oK2g6gczuCep4q3P4y0+azbeQ6pgYIL3+aIFA3fegQtG/XpuNWrd5837Tngk3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117850; c=relaxed/simple;
	bh=hW/c5nFWt/5RTlIOLRbaFMwOH9/gMmH3j+hZXuXkbts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PasMpNwZp5GcQonexoLDzA0AEuPe0xB1SX5opy+4nnB2r7kxmEUX2A9Nt8Pf3isoudVV3+9XqasfCR7QlhKcWBXRBoNkKxDLAX9S8mWH/WOAnWFUzmqm6ZokqDvApQmGFOGXe7zNXx/yspauYSDDPmrEirN6q/BJOpMMDkcDQXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwTpQ6eW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwTpQ6eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744117848; x=1775653848;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hW/c5nFWt/5RTlIOLRbaFMwOH9/gMmH3j+hZXuXkbts=;
  b=dwTpQ6eW57N50v/afCDsNQXA6ATQpE59gwL6V0xLJAenVMUYy5+/U2Sw
   DoOjPZroBNFTgv9ye6wIy5P8npUgmFLQkhusGAmWqaeugBNiIzfetMwIr
   V1p8FTfPGObfvwgdDQOq4N6OPRLhkngFlpqaSxu2RX/TWUH/aDcbroqG2
   7baVjMb9BXBugp7vjY1AvYz4bG9+5ktYeTBULrrFVi6faVBm8p7tSfB5v
   TOHzBzyqHAMTZ6Y8MXPMJ/3YsToCs1N//7gd6u4VLY3s1KfxERmL5uoG+
   yV9wj7+dREQREVgDqjLuYRUSPlzEuwyjbcAEECbNw8CLbMUUyFZBu3spS
   Q==;
X-CSE-ConnectionGUID: XYoSbHc/RmyWMvlPND43eg==
X-CSE-MsgGUID: nZQVbQhPToqcuFC03+/jrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45708798"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45708798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:10:48 -0700
X-CSE-ConnectionGUID: SxktrJKVSwqBy+RGcWYo2Q==
X-CSE-MsgGUID: VeK3yQp5TQmeFdWHSP17Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128244988"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:10:46 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>,
	Tomas Winkler <tomasw@gmail.com>
Subject: [char-misc] mei: me: add panther lake H DID
Date: Tue,  8 Apr 2025 16:00:05 +0300
Message-ID: <20250408130005.1358140-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Panther Lake H device id.

Cc: stable <stable@kernel.org>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hw-me-regs.h | 1 +
 drivers/misc/mei/pci-me.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/misc/mei/hw-me-regs.h b/drivers/misc/mei/hw-me-regs.h
index 39d89a997d07..461be6986d41 100644
--- a/drivers/misc/mei/hw-me-regs.h
+++ b/drivers/misc/mei/hw-me-regs.h
@@ -119,6 +119,7 @@
 
 #define MEI_DEV_ID_LNL_M      0xA870  /* Lunar Lake Point M */
 
+#define MEI_DEV_ID_PTL_H      0xE370  /* Panther Lake H */
 #define MEI_DEV_ID_PTL_P      0xE470  /* Panther Lake P */
 
 /*
diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index d6ff9d82ae94..3f9c60b579ae 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -124,6 +124,7 @@ static const struct pci_device_id mei_me_pci_tbl[] = {
 
 	{MEI_PCI_DEVICE(MEI_DEV_ID_LNL_M, MEI_ME_PCH15_CFG)},
 
+	{MEI_PCI_DEVICE(MEI_DEV_ID_PTL_H, MEI_ME_PCH15_CFG)},
 	{MEI_PCI_DEVICE(MEI_DEV_ID_PTL_P, MEI_ME_PCH15_CFG)},
 
 	/* required last entry */
-- 
2.43.0

