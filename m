Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E8D1547C0;
	Thu, 27 Mar 2025 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086507; cv=none; b=FJ+jy3iR/GL6Af7L2L+/MvVVULZm2GQn6PBqhpyWDJL5EJthk0oS9wcJHafghvApuj5kvOjKY2h47Zc3phdS8eOC3UvuQTUFNHFHJEodF5kcuFPQzEdVVJKIUYkWu2mI1hRh2Ck8gvSHMAS4sgIV45R8Rrly1TCrY+hLEzXaf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086507; c=relaxed/simple;
	bh=xuz6UcQBotKTfIalKti7Xvxf5hdpOlzGb0dJj9QIyU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIBDTJiMf3SnWtrlm08ViC+aDxDIuLFV+l2AxsbB85k2kybyGtVpmJyysUStui9Sa0v2EZloz47hVmsH+Gcw/NqfcGuzlwWGWOcmtWGifbZFjd9vhGV9YGt8ByyR2wp3r6G7aA7xLxx4hu0hHGzAnDF0pV6TqezVhtB3hqKjFjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=SP6ob2VE; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k8oLlYcm reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="SP6ob2VE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k8oLlYcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086504; x=1774622504;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aU//bpRukT0JZldE0QjTM6KvhUiCU+wstfqEC9PvBkQ=;
  b=SP6ob2VE3sd0yEnfve+6RFH201Zk1pXyf547sgvbh4KtG7vEbpd+/TeG
   aKA1qnP1rXAMoONQyjD9tzgTUjYQU+SECGx4BHTn7USveRrIUD2oOuwm2
   kC6cXCDU4S0DI/my0/cJmMRNUuEW+pVMIH0gnOT6barvHxc80MahyD1PP
   jNOgNu4lVyTI3SIh34ksV+MlSqTO9uoE/yYb6mjiL5YcNloo1fsn3dRYd
   696PDlptBqoy73Uwm80q5r5L/SZ9T03SsR1ll5lD1TfeFMpjZTaarzsbe
   vkA5pwWc9CBEGh1QSSGeadY2kRPMH8nmz2r1F5pU85M/up+GHIbsPhMIw
   g==;
X-CSE-ConnectionGUID: zX1auU/JQbyB/CY2MEy59g==
X-CSE-MsgGUID: Ejdha72TTYeKeVu6lVVyvw==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199500"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:35 +0100
X-CheckPoint: {67E5639F-D-903EAEAC-E04C76C8}
X-MAIL-CPID: 7CE2AAB81C9B4778987FC805EB598DF2_5
X-Control-Analysis: str=0001.0A00639E.67E56394.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EFC016C763;
	Thu, 27 Mar 2025 15:41:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aU//bpRukT0JZldE0QjTM6KvhUiCU+wstfqEC9PvBkQ=;
	b=k8oLlYcmWb/PaO2ge8FkoUlQWythL6L5D03wz2a59w2HSMOl9TJz0jHygjc+z3okWP2wPY
	ooFHd5o0IJRwIYtmdp+ij8E6GVzO7wF3UmNYjQccQjM2p0H++DZPBxn3SKuj6bZ1B4F8bW
	J81MTch2g0GL/C0xNPNElIPwh/8rGLWdIYtIWPO/T7EdlmVOLGS16f3tbYwMSU8rs/JETm
	n5fyGXXV55EVw+IlSF1lYsyWVw8fqzCgQdKDTOvVMJvsSmwXvBdY0O+Tn2XEhdtED5rAdl
	QA7V+GOl2lWWkTAmG1J5H8/bncuUCpNXEjNsiKY6QeaSlYgmObti2fhoOYWWAw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] TQMLS102xA: New display overlays and small fixes
Date: Thu, 27 Mar 2025 15:41:06 +0100
Message-ID: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this series adds several display overlays for HDMI, LVDS and RGB displays.
Additionally it fixes the license header and updates the sound card model
name similar to i.MX based platforms by TQ.

Best regards,
Alexander

Alexander Stein (7):
  ARM: dts: ls1021a-tqmals1021a: Fix license
  ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
  ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
  ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
  ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
  ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
  ARM: dts: ls1021a-tqmals1021a: change sound card model name

 arch/arm/boot/dts/nxp/ls/Makefile             |  9 +++
 .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++
 ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++
 ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  5 +-
 .../boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
 7 files changed, 204 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso

-- 
2.43.0

