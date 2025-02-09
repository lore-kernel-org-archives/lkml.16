Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF67014A619;
	Sun,  9 Feb 2025 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739089084; cv=none; b=t0Q9Oh3JaZLBYykwce85EqOBG5ecY3Y/StBa0Lbwa0OAW9s55q5cvYVR4Zv/WTfAdC9hvAcishHWMGO35tTH5VKlAzd+ljjF2pvaqYRDreLR4wr/bFkiijQARRTvIoZKM1u1Ab9z8qwOWakFMa5GLH7BJhB3tJfr9CeU8hAjGaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739089084; c=relaxed/simple;
	bh=N3TFFDFbADKZu/t1HqSTqCLWssF/H+GkA+8u5L/Dflc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZIP6uRwJk0g48x09ZzIL4DSHc7apTUiEfqz5Oq7cqbU7lDtSUrrK8zzmIatwLg7vkbaQwJg8BicOhgRUmpUjmfDWpuHcGTLUb3Yk4GHYLP3DMkTnHVzJKE+J13dCvJCwb4VUP/5aWdTvjbSKZ3QXoZNEkOEfYB5WnzkeZMhbn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c5abNXa+; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c5abNXa+"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5198HhnG4037189
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 9 Feb 2025 02:17:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739089063;
	bh=w3OEA1Sc6R/H8eB7vrTHC8OLJDDsJGPdc9uDzBbAVuM=;
	h=From:To:CC:Subject:Date;
	b=c5abNXa+9eJQVVHcIfxSCt3t0DCvR43Q+rff6FuIoYWzRrq2EUDKPENG0cjTfBCh0
	 yrxsqurlcI7j2TDFp91yxRd5GLCxwLxJeakOwoVIOkme0nRdaaYQNDYeleEYU6AOgX
	 XF0/iq9/9f0AHVzSSg38wYCikXdsEvzo3eZo5cyk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HhnK085891;
	Sun, 9 Feb 2025 02:17:43 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 9
 Feb 2025 02:17:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 9 Feb 2025 02:17:42 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5198HciS083866;
	Sun, 9 Feb 2025 02:17:39 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/2] Add bootph-all to SERDES3 for USB DFU Boot on J721E
Date: Sun, 9 Feb 2025 13:47:31 +0530
Message-ID: <20250209081738.1874749-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
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

This series is based on linux-next tagged next-20250207.

J721E SoC supports USB DFU Boot via USB0 instance of USB. On both
J721E-EVM - (J721E SoM + J7 Common Processor Board) and
J721E-SK, the USB Type-C interface which is connected to USB0 via
SERDES3 is used for USB DFU boot.

Series adds "bootph-all" tag to the "serdes3_usb_link" device-tree node
which is the USB3 PHY for USB0, thereby enabling USB DFU boot.

Regards,
Siddharth.

Siddharth Vadapalli (2):
  arm64: dts: ti: k3-j721e-common-proc-board: Add boot phase tag to
    SERDES3
  arm64: dts: ti: k3-j721e-sk: Add boot phase tag to SERDES3

 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

