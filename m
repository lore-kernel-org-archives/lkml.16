Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7609D2F22;
	Mon, 10 Feb 2025 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173782; cv=none; b=kz2ZFpW2TSkQCU+4QxQYo1hIH88s2L5/LGE723PZkQt8UFKLYpmjBadWTsH2LPmqmvY+Fy1ombhHnm7roqM5DcoGGKhMzr9NdhCc1oYQ51F+mEaiQy5Xgtl1nOk+E2OJ9twz6+2i4AaJeNtB0MCpMzYfJUAArqVvWwIUl9jSMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173782; c=relaxed/simple;
	bh=bR+cIBlnjc3BMNGr3u5TM2hkR+zDRZ2kOmzgjuPSgIk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=NPlLqMBtMtwvLU09gxt9Q+gsdZKONmX0/pTmvbQGxllQ+54+hMD6efmibDuR5ALi8HRzyGR+zGSbYIbuL8x8EUnCMsUqF4K5DW3AkNIJYLxoOCpIUB8nL5ZSpPz/Ea+Jw7FbVQ3s4GDpd6vg/FCnmpgLN+SUfOhKfnD0VSWsS3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvubvXAC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvubvXAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739173780; x=1770709780;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bR+cIBlnjc3BMNGr3u5TM2hkR+zDRZ2kOmzgjuPSgIk=;
  b=XvubvXACs+j5E7f8cqaFSVd9xt/0gKiC/pS0l1A4lpEdzV/i/xE1v9A9
   XOJBKTHb0eoML5Ka7lrdb83gs0TDhvr41qE4YRTUewy3BZNiqqV4PxAC3
   XTRRKxiIo/3XNyiLGqu1eiEZP9+UagVnm1S9UnX/jBx2rhDBhs6STVETG
   ysfhfmk7mrDBSAU/zehM79m5jgA6AXUg8CrEKOf+6B0UORxpGpeXbPyol
   7KWCaiQMpgm4c+oRffSxSVD9tL1QnVmKTa9EPn7uDlKQudfS8eWJHcMCT
   eExz4K8xi+iCNKR28FinJRmStQBFxNwCd0YMQVvB9Xr03a/vZtIr3MR9V
   Q==;
X-CSE-ConnectionGUID: zZ/XnVvCRm24Z4QVueMdGw==
X-CSE-MsgGUID: qX7zvdgtSn6cgJsSh+TRUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39426932"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39426932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 23:49:40 -0800
X-CSE-ConnectionGUID: tD6SGgjTTC6to9n9Xb+Elw==
X-CSE-MsgGUID: 5htcCLiBRAaW0PX01gCTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142994859"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by fmviesa001.fm.intel.com with ESMTP; 09 Feb 2025 23:49:38 -0800
From: niravkumar.l.rabara@intel.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	niravkumar.l.rabara@intel.com,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: socfpga: agilex5: add NAND daughter board
Date: Mon, 10 Feb 2025 15:46:02 +0800
Message-Id: <20250210074604.2410783-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Agilex5 SoCFPGA devkit supports a separate NAND daughter board.
Document NAND daughter board compatible string and add board file.

Changes in v3:
  * Document Agilex5 NAND daughter board and use that compatible
    in the device tree.

link to v2:
 - https://lore.kernel.org/all/20250205101318.1778757-1-niravkumar.l.rabara@intel.com/

Changes in v2:
 * Use nand flash node name according to dt bindings to fix dt build warnings.
 * Arrange node in sequence.

link to v1:
 - https://lore.kernel.org/all/20250107084831.2750035-1-niravkumar.l.rabara@intel.com/

Niravkumar L Rabara (2):
  dt-bindings: intel: document Agilex5 NAND daughter board
  arm64: dts: socfpga: agilex5: add NAND daughter board

 .../bindings/arm/intel,socfpga.yaml           |  1 +
 arch/arm64/boot/dts/intel/Makefile            |  1 +
 .../dts/intel/socfpga_agilex5_socdk_nand.dts  | 89 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts

-- 
2.25.1

