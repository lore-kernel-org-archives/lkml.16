Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA12580EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052249; cv=none; b=OydetDyINpSWLS0WlbiZlLwhz31y+IFMsRIReaBctqGZWjBRYLafrAPsAhL9yeCAaCoIptS4EdvzgmoR5guvdTd5Wbnq9JQ3zRqf1zPdGlBaxEmrmAH8guZ8tWSnp6hzA7o4o1z5GOtrjQr9Qt8DzAqv3KHhonLaoQ24eUqg7kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052249; c=relaxed/simple;
	bh=PFUWvrOzFpLxC/8GZ9AeSp585sErF+SLsZ3+RbUz240=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lOnvmwlHdzjI6Mtk2b3Vu8dTBg8CdxWfDIAuBeEVTpSx0uZIH5oVBd3rFH34qcBXukfwyqNs/r/vHlOQB1p9dUYeYKf7o1LXPx4YlqGqx5YzB5BNN+RAAcgItag8tbRkIqeULQRzDm4oDT1vY8dEXEFdEvjj/w0WREjsaPrqe/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OX+PNp41; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OX+PNp41"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iuq0i454871
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744052212;
	bh=ayTupi2WPvTI3Popd5a6clT7WjyIKWAcMrNm4hWyGyk=;
	h=From:To:CC:Subject:Date;
	b=OX+PNp412lCc0vxhnOijlFpYYMx/tJ5YQmkV0cuMqpvpzNsm301qpxGYAg7ILwzps
	 C7Icr+4R8Ys0tWuKfbkxkqtxhSHVRKIYKSFkb3lQypD4CkIvmJkpTvE9FIDR2aukmL
	 r/TAGQJJ4Zj4Qr51qB+A5bOBnCMhBNSeZx1oMeZ0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iuq3q011999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:56:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:56:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:56:51 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Iup47094348;
	Mon, 7 Apr 2025 13:56:51 -0500
From: Andrew Davis <afd@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>,
        Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik
	<robert.jarzmik@free.fr>,
        Alexey Charkov <alchark@gmail.com>,
        Krzysztof
 Kozlowski <krzk@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v5 0/5] Switch more ARM plats to sys-off handler API
Date: Mon, 7 Apr 2025 13:56:45 -0500
Message-ID: <20250407185650.411887-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello all,

Continuing the quest to remove the legacy pm_power_off() global
function handler. Remove uses from arch/arm/ using the helper
register_platform_power_off().

These have been sent for several cycles without feedback, not
sure if there are anymore active platform maintainers who
can take these individually, maybe these remaining could
go in directly though the arm-soc tree?

Thanks,
Andrew

Changes for v5:
 - Rebase on v6.15-rc1

Changes for v4:
 - Drop already taken patches
 - Rebase on latest master

Changes for v3:
 - Rebase on v6.12-rc1

Changes for v2:
 - Collect Reviewed/Acked-bys
 - Rebase on v6.11-rc1

Andrew Davis (5):
  ARM: highbank: Switch to new sys-off handler API
  ARM: pxa: Switch to new sys-off handler API
  ARM: sa1100: Switch to new sys-off handler API
  ARM: vt8500: Switch to new sys-off handler API
  arm/xen: Switch to new sys-off handler API

 arch/arm/mach-highbank/highbank.c | 2 +-
 arch/arm/mach-pxa/spitz.c         | 2 +-
 arch/arm/mach-sa1100/generic.c    | 2 +-
 arch/arm/mach-vt8500/vt8500.c     | 2 +-
 arch/arm/xen/enlighten.c          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.39.2

