Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DE714A62A;
	Sat, 12 Apr 2025 05:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744435657; cv=none; b=s4PremNC6XmXmNDHEZtXpouTMYFw5POMiQmfUPD7ULbKqf+w0eHNOmPaNFSTSaRbAQhgCt7ql6na2AudqiZZhwgmGokrxWd8h7/j54N54Bf9oE7IdLP/U8NH/s+teRuqn5vcdHnHxTyWWH9xDMthh5kIlRAVsGPpi5vsmfJvZdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744435657; c=relaxed/simple;
	bh=XNojj2UHPrOQTF46wtwHZ7jOBHZT3IrbMG4O1xcvodU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VcmKr6dpJCMXKv0qkjusZkIFW0dzc1N+VGgOudTzCsT1Blcl+dr5dJhZqhFhjVmBCk1xKrwUGnUFHB29UgHC5nivw0JNK2NV7jm5GUW6MepZ01WeQTig8BrXqYEeYBE9XSClhgLBG6DJL14N7hj0iqfGXxpvnWZS1i2vmHkbeYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LFAtl8bJ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LFAtl8bJ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RGQv1725198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 00:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744435637;
	bh=jJ0vpXL7ornkZ5EcL9sGil4pVsPC0g6AKDydn7iBonk=;
	h=From:To:CC:Subject:Date;
	b=LFAtl8bJnN75kyK/Csle/+KfqR56+5bsXKVaKH6mHzChivIVgVYWYkZZS9mW0g/Zy
	 JNIs4FWN6Vvhh4F3Tcq7g6tVuwngFMdbIsvCC1LU2+yRh3woZeoFjZDRzUoG7NupP2
	 LgLoE6edl+6oOANgzrkPjt0ZkusQlEWfM9uaGaBI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5RGr3107948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 00:27:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 00:27:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 00:27:16 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53C5RCVR121011;
	Sat, 12 Apr 2025 00:27:13 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Date: Sat, 12 Apr 2025 10:57:10 +0530
Message-ID: <20250412052712.927626-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello,

This series is based on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
Based on the discussion in the above series which disabled 'serdes_wiz0'
and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
'serdes1' in the SoC file anymore, since that is not a working
configuration - serdes_wizX enabled and serdesX disabled doesn't work.

Hence, this series aims to cleanup the serdesX nodes after the changes
made by the above series.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
  arm64: dts: ti: k3-j722s-evm: drop redundant status within
    serdes0/serdes1

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
 2 files changed, 6 deletions(-)

-- 
2.34.1

