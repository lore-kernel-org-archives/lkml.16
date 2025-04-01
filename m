Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933091FBE8C;
	Tue,  1 Apr 2025 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507685; cv=none; b=pVoVjHhCc0QS2SMGF1J+JJP/CE/KPvSd9C0gUgBGsAaWA/DRigH9sLCpE7jKA45vPtjpHAdy/qSf6UsV3L3yCjbZh4bEW2JoG8PM90761K2TceTP+a4L2wrqMyeZbBj9WtoNGn1UZzVWIgDE+bLUVH3GKzjj9aJbdsTlf46g1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507685; c=relaxed/simple;
	bh=/IC1LsffOY4RL71900LX2YVS0C9UkwUhF8RqesER1tM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cvMRKR59u0A8vjUW1ofTS1Tth4K9B6Xd7dylte0H9BWFKN3ERTiUjmL661hCROz713asxVUJFGtxLCZ5GmigZ4dGLYLJTnORtvwv2Fn6W1uXGi0X8VCSa+N3Hbu+ryND+nqaBtYSnHX5YmM2/IR+dE6jPe7tkMwRAHxta2Jx64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YZkRXg9H; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YZkRXg9H"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531Bf2Jd3651996
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 06:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743507662;
	bh=P69NXiJFBn0YyMxukcSeHdHcWpvgS8s4dKJpRN1Hd40=;
	h=From:To:CC:Subject:Date;
	b=YZkRXg9H+2TBuV5NppnDcqm/Rs7LbgNxi4FdwzWdkETCwThaDI7Ht+IOJ3Pr1rf1b
	 vGIqgldD3VSKoSxW5slX3TzUFodx9HkTw3OJjamsMYjdvF9DTDocylNgpjbaYjeyOo
	 Wj0PpwgCDwXm0E/yc5PrKtcrh+toaEAAlUHDxfvE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531Bf2ZM065228
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 06:41:02 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 06:41:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 06:41:02 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531Bevm0099961;
	Tue, 1 Apr 2025 06:40:58 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 0/5] Fix dtbs_check warnings in CSI overlays
Date: Tue, 1 Apr 2025 17:10:48 +0530
Message-ID: <20250401114053.229534-1-y-abhilashchandra@ti.com>
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

There are a bunch of new warnings generated using CONFIG_OF_ALL_DTBS.
This configuration applies DTB and overlay together to generate test DTBs,
which are then validated using dtbs_check.

This patch series fixes all warnings related to sensor overlays on
jacinto platforms and a few minor warnings on sitara as well.

To fix some of the warnings, missing power regulator nodes are added on
the J721E-SK and the regulator hierarchy on the AM68-SK is corrected.

IMX219 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/b13caae87c0c148b5643df5baba0d90c
OV5640 Logs: https://gist.github.com/Yemike-Abhilash-Chandra/7801f74d28ed5895a15049ce9f0fbe60

Yemike Abhilash Chandra (5):
  arm64: dts: ti: j721e-sk: Add DT nodes for power regulators
  arm64: dts: ti: am68-sk: Fix power regulator hierarchy
  arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings in IMX219 overlay
  arm64: dts: ti: k3-am62x: Fix a few minor dtbs_check warnings in
    IMX219 overlay
  arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640
    overlay

 .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  |  3 +-
 .../boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso  |  2 +-
 .../dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  |  2 +-
 .../boot/dts/ti/k3-am68-sk-base-board.dts     | 13 ++++++-
 .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts        | 31 ++++++++++++++++
 6 files changed, 79 insertions(+), 7 deletions(-)

-- 
2.34.1

