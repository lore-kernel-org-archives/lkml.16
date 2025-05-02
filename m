Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6B2566E1;
	Fri,  2 May 2025 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197066; cv=none; b=E20/cz763qI7eyuOYzYSgSQmc5WaX8R8CZpY8wAkETIv8Bsw8P65CKOgjno4a2G9XOpXE7J5QjBW30cSD3vv48PUajblBf5YjJBmJPhiJtLjc5+1kzT/VnZN5SIB4KowVSXVg54NM7qkcOtxt+3jo8SPrYZS00FT3dkKFPZ3o/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197066; c=relaxed/simple;
	bh=yvAbT+8bC9VSwOvpKi4IZnmaG7R36yD4eqhef706yAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQ3l4ncSg6Ya6WVk2lA/fsu8NO/GeC/5xDd0m6+InANzezhLMMYvael+NWuDkgglExbkyFGOshOBrn9KUVVZoMplNXe7Tjzc8rFeNmGbNx1vVybaaMhK/oM0cqa2fZm0dxJi7EpVyhu021nRdRAE4hjIovf8Gl3dYHZx0aMXRzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vXPR0PCL; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vXPR0PCL"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiEr63882172
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:44:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197054;
	bh=1wmfIKm7N506C2a5N3qHxuYy4t3bfiFN97CIf5mSVFo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vXPR0PCLpRkX85Oc6tod53Uxy0Hg3B63NCJBWuQaY1a+4mTsqYeXlXqgQNEoXNxWF
	 QegY0X+W9oXKQ1j2tFIOWiQr7smo599NlQ7h+n9/HG/p9CLBzzGBUuOgxPdPCiEBpN
	 XB6/DH8G+CtHaRQyh8UxhGW8aZdbMDr6u18oHJWM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiEat011001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:44:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:44:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:44:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EiDit040995;
	Fri, 2 May 2025 09:44:13 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 0/7] AM64 and J7X DT: Enable PCIe 64-bit Address Space
Date: Fri, 2 May 2025 09:44:11 -0500
Message-ID: <174619700947.3122830.6151754441565392409.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Siddharth Vadapalli,

On Tue, 22 Apr 2025 17:30:35 +0530, Siddharth Vadapalli wrote:
> The Cadence PCIe Controllers in TI's K3 SoCs namely:
> AM64, J7200, J721E, J721S2 (AM68), J722S, J742S2 and J784S4 (AM69)
> support two address regions:
> 1. 128 MB address region in the 32-bit address space
> 2. 4 GB address region in the 64-bit address space
> 
> Currently, the 128 MB region in the 32-bit address space is enabled in
> the device-tree. This might be suitable for most of the use-cases, but
> for those use-cases requiring larger address regions than 128 MB it is
> necessary to switch to the 64-bit address space with the 4 GB address
> region. This series implements the corresponding device-tree changes to
> support the 4 GB address region as the default configuration. Existing
> use-cases should continue to work without any regression.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

NOTE: I have ignored the checkpatch warning on long lines since the
documentation added in the context of the line makes more sense than splitting
it up.

Thank you!

[1/7] arm64: dts: ti: k3-am64-main: switch to 64-bit address space for PCIe0
      commit: 1159f911435b9371575d9956bb5aef579265d29a
[2/7] arm64: dts: ti: k3-j7200-main: switch to 64-bit address space for PCIe1
      commit: 46e3d7d7048872ffb90aa25e360b975dc1c3e28b
[3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0 DAT1 and PCIe1 DAT1
      commit: 1025003a1e068a25b35e1dbb39cad18e23278c0f
[4/7] arm64: dts: ti: k3-j721e-main: switch to 64-bit address space for PCIe0 and PCIe1
      commit: f0f78192d3b3b3c3c935de0d681e7bf2117bbb13
[5/7] arm64: dts: ti: k3-j721s2-main: switch to 64-bit address space for PCIe1
      commit: 5a765365c689b90ea81f651a43bc30cd9c9c4ed8
[6/7] arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for PCIe0
      commit: 0fde00328cf8245bf498349a696ba22d6a4a1916
[7/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address space for PCIe0 and PCIe1
      commit: b1f9ec6545c6423e106f0aeddc3b8651b5ad116c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

