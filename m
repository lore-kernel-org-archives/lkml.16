Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCA8215062;
	Thu, 24 Apr 2025 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484265; cv=none; b=E7JJCRG67eGHwhXkAY98M/leZCbzltDinyu2ntFzT81k3oyyMkfEx087sgit5GrtoLL2x/KF19pNqHhIyd+PmfEcXAWek0JgEWRfHyjYh3T0icAWzSlkROE7TpJMKh/ayraM8DkB6CGChFOvMrXIf1wGLLLYDZDNvOCSdHnuwnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484265; c=relaxed/simple;
	bh=DOL+FJl7ld1elRn3NODOFw+tFdFi5JN605YedGz+ea0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BvmZOQq+uzgv+cmyF+Q/1y7bFc8B/9siOL6E885aycWWo8Xrsayn+4+KelJ3aWkqakYrRsU2ad8laAgdbaSsK4P3c3WEpz+MRdfPSBlrL7x6ZaZxXalaWc9iN0SIYAS4PzYoiP/c6W1smkIKMDozntYnCGUPHZ3icM8ZeKo8uBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cFWJteYk; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cFWJteYk"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iHxt1804359
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484257;
	bh=Fyz2hLp0kO8PERuGySQiIDCnQJ1k8h3nTLge22HZa/M=;
	h=From:To:CC:Subject:Date;
	b=cFWJteYkuWICbpORuoaPplMtS9sQaDXZE6qvCNnKlIapT3O9DJJtUwN6E7B/ta8co
	 GOlm1ROx5FIDfwzHTQsxZzLCEVC/pkiukbpLSAOHt7JXGKjlcmmTOvw16eHTaAVOym
	 9C8/ObxKbAUgxLzt7uUL9aU6yfjVbBrJAw3ZQ+g0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iHXr019801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:17 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:16 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iFBu058367;
	Thu, 24 Apr 2025 03:44:16 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 0/4] Add global CMA areas for few TI SoCs
Date: Thu, 24 Apr 2025 14:14:11 +0530
Message-ID: <20250424084415.66457-1-j-choudhary@ti.com>
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

Hello All,

Following AM62* platforms[0], this patches add global CMA reserve area for:
- J721S2-EVM (1056 MiB)
- J784S4-EVM (1920 MiB)
- AM68-SK (1008 MiB)
- AM69-SK (1904 MiB)

These SoCs does not have MMU and hence they require contiguous memory
pool to support various multimedia usecase.

The calculation was done considering H264 codec requirements, dual-display
supported in each platforms and multicamera use-cases.
Additional buffer was kept for other peripheral s and to account for
fragmentation.
The breakdown is mentioned in each commit message.

[0]: https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/

Jayesh Choudhary (4):
  arm64: dts: ti: k3-j721s2-som-p0: Reserve 1056MiB of global CMA
  arm64: dts: ti: k3-j784s4-j742s2-evm-common: Reserve 1920MiB of global
    CMA
  arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
  arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA

 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
 4 files changed, 32 insertions(+)

-- 
2.34.1

