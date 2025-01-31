Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923911925BF;
	Fri, 31 Jan 2025 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359982; cv=none; b=R40d3P82U+Z9/xCiSGSa+gf5Pm7CmfR1PeZ2J66Qs+Tv67zyKnA6N+MYwUJwn+WorIr9Tm+AXzMVz4eUGmydTWMzEgf4W5WGJsY7Is198VsxuFqPhjjWiRVMETdPEL/gexDnRbWFF6QXKjaZlGxcLdJKfa4lse591YOyvZI93Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359982; c=relaxed/simple;
	bh=ezO0evM7IMsLJWLw/Xm8KPKVrTqOz8irljSn/fbHrCk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rmt7YIGRv8WFsSN9dTmBW7beuuBzOjdvcNMDe1fkhjeOfRf4BlnlcHDsyorc4qyg4iV0lHMbqEVDFzvhjbB0qKoanO5X6474JKUIGTyXQWApicJGxqQRAj7ispfzug3JMRUm4d5HkOLJfZ1nEZDSLT5iVP7jRbMmRgI9Sr0rvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KPorOKIu; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KPorOKIu"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50VLkCfI2601806
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 15:46:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738359972;
	bh=56/5vHlRQhs2KHy6c7TwLs7I1huG9qnDGRRTJ4lHJyo=;
	h=From:To:CC:Subject:Date;
	b=KPorOKIu0ycr0dvP19Qqdeypc87+c8bGFRc/yaNc+s/CIHIoO56Dp0j4Zhoo9G9Bv
	 1G+qUNJss4PJWeV0qEO1cPgqvisHMu0HL3L4MN5zy0NpybLn50fjdnTmgQXc3uOaLL
	 9WYa7tuA+tc3sDidsr6MyqVW9bdhXJBvmfPhJZ9c=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50VLkC6a024695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jan 2025 15:46:12 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 Jan 2025 15:46:11 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 Jan 2025 15:46:11 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50VLkBCv082734;
	Fri, 31 Jan 2025 15:46:11 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v2 0/9] Add R5F and C7xv device nodes
Date: Fri, 31 Jan 2025 15:46:02 -0600
Message-ID: <20250131214611.3288742-1-jm@ti.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

For am62x and am62ax devices, this patch series adds device nodes
for the R5F subsystem and C7xv DSP subsystem found in their
respective voltage domain, based on the device TRMs [0][1].

This patch series also includes patches for enabling IPC for am62x,
am62ax, and am62px by reserving memory and binding the mailbox
assignments for each remote core.

Also reserve main_rti4 and main_timer2 for the C7x DSP as per
firmware requirements.

Changes since v1:
- add patches 5-9 to enable ipc and complete device nodes
- disable each device node in the voltage domain files and
  enable at the board level file
- fix firmware names

[0] https://www.ti.com/lit/pdf/spruj16
[1] https://www.ti.com/lit/pdf/spruiv7

Devarsh Thakkar (3):
  arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
  arm64: dts: ti: k3-am62a7-sk: Enable ipc with remote processors
  arm64: dts: ti: k3-am62p5-sk: Enable ipc with remote processors

Hari Nagalla (5):
  arm64: dts: ti: k3-am62-wakeup: Add wakeup r5f node
  arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
  arm64: dts: ti: k3-am62x-sk-common: Enable ipc with remote processors
  arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
  arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP

Jai Luthra (1):
  arm64: dts: ti: k3-am62a-main: Add C7xv device node

 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    | 25 ++++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     | 12 +++
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      | 38 ++++++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   | 25 ++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 88 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 50 +++++++++--
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 32 +++++--
 7 files changed, 259 insertions(+), 11 deletions(-)

-- 
2.48.0

