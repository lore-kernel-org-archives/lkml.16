Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CAC1EFF9B;
	Wed,  4 Jun 2025 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034031; cv=none; b=iGajPT7o2Y94E34wjYlCub0//GorxlQaeXnat4I6/l9u2wiCgJXR3pqJBjN0Y0BiuAnAfiAQ3W8ouoQEgsCJkxj60JADXndGiDidg/igX9bIPA2lXpwBNtkHdl8KpnELqSDOF/h7F+kCMcGPNxupotXNHKdCKtPEglp91GGjk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034031; c=relaxed/simple;
	bh=JFqx00dq9k+yHX8+9lWGiUOhUmBnpFrTc0GEzlUwFYg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I33Hp+K9O1GngSfvHekjJBAVocirYK3UOcsbKaHl143/xCqeI5KmX+2vhMzQiuuOLHk0gEzyMYfKZnvOvK79mhEKFBec2lM8+bjZrJcq1zSScu4RLbC4mk3+e9e9ePOIreBLzNCr3VHfQmIvyJU3+iQ1vuDExZjFU07AGkEeQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UkzhLjlw; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UkzhLjlw"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554AkwBt745182;
	Wed, 4 Jun 2025 05:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749034018;
	bh=jeb13SokNNFpJkdvHxDAZCgiIX6KKVTISmQSdYUXtd4=;
	h=From:To:CC:Subject:Date;
	b=UkzhLjlwcvCa5DuEtyqeYjyKZ4LNecR4UoGJRaEzT4pIPBTems+QWHw2TIcvwsPm+
	 CgNqTdeOo+F5+OvsBrqNBxB2k7JL5QglPqezF4m9ksGGnRzmDpK85LUyCtOgGwpDy8
	 6hn+0rrbVABh31anURtckR8r3bL9zp56CLgsIw5E=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554AkwOg1977619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 05:46:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 05:46:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 05:46:57 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554Akvjv1917870;
	Wed, 4 Jun 2025 05:46:57 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-donadkar@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH 0/3] Enable audio support for J721S2-EVM
Date: Wed, 4 Jun 2025 16:16:53 +0530
Message-ID: <20250604104656.38752-1-j-choudhary@ti.com>
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

These 3 patches add the support to enable audio on J721S2-EVM.

This required the i2c-mux support[0] which is now in linux tree.

Now, this series ***depends upon only one dts change[1]*** to ensure there
are no dtbs_check warnings (no functional issues):
"ti,j721e-system-controller.yaml" refers to "ti,am654-ehrpwm-tbclk.yaml"
for clock-controller nodes, but for audio we need "ti,am62-audio-refclk".
When scm_conf is "simple-bus", there are no such warnings.

Test log: https://gist.github.com/Jayesh2000/840c19ef8f9b7f0f75dedd015ccbf98a

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fc829dbde9bf1f349631c677a85e08782037ecf
[1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/


Jayesh Choudhary (3):
  arm64: dts: ti: k3-j721s2-main: Add McASP nodes
  arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
  arm64: dts: ti: k3-j721s2-common-proc-board: Enable analog audio
    support

 .../dts/ti/k3-j721s2-common-proc-board.dts    | 131 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  99 +++++++++++++
 2 files changed, 230 insertions(+)

-- 
2.34.1

