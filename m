Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C982256C66;
	Fri,  2 May 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197110; cv=none; b=XmZqiQUNsGjWdjIl27eY9eL7Cx7P6OQ5FL7OhaTzc9z2EjWVP91gdfH3E/ZerIQHWc2WL43Y+CnQfLye8AymPjYp9mH52rROIBA9OoQCJJybszzauFo5mvYD3p4y0VQ8oRx/FZ5p4/hiPiO/jnT8I11z5iDGD3s6F7z4lfg+DzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197110; c=relaxed/simple;
	bh=eYirp61IwA6Rjxuke4pGlaR15pXcpswx8TAjOX0pBm4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sC77Mc29BP1zLY2lLdRyLGAlTj3SmU9rUsZVc/SHxtvSJmEihGnKyy9nqzdSFA88mUTzOwrEnAhhuNWo+wduTaEpVp7OOadGMYjj37ls6suC2olD7LubjeS8bU4anq/8NGWwgBICK1mVgKHT/u61l8WssvCHhxJWs4rx0i89Nn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NZ55NKZA; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NZ55NKZA"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiqR63883493
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197092;
	bh=m6yQn4QfB0hC25F9cY87ostqbnKwXQMlrXFsKG/EbB0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NZ55NKZAsxorzG6zcWae1wFzvHFNADcoAoUl7a89jWvLzUuNoNVypyRo7I5TAvjt4
	 MDoGK8kV0AiFjP8+1VRyMJrycZ059Fzo/8xGVz9n9NGN/+j24iZGaW2qdESZCa9bHg
	 6FQJCPiKAB5wjJJc4H8SR783V06ol7V0TU+I1ZJE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542EiqoB037936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:44:52 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:44:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:44:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542EiqRu041427;
	Fri, 2 May 2025 09:44:52 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/6] arm64: dts: ti: Add Toradex Verdin AM62P
Date: Fri, 2 May 2025 09:44:51 -0500
Message-ID: <174619707844.3123252.13529152591624600690.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250430102815.149162-1-francesco@dolcini.it>
References: <20250430102815.149162-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Francesco Dolcini,

On Wed, 30 Apr 2025 12:28:09 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex Verdin AM62 SoM which can be used on
> different carrier boards (Verdin Development Board, Dahlia, Yavia, Mallow and
> Ivy).
> 
> The module consists of an TI AM62P family SoC, a TPS65219 PMIC, a Gigabit
> Ethernet PHY, up to 8GB of LPDDR4 RAM, an eMMC, a TLA2024 ADC, an I2C EEPROM,
> an RX8130 RTC, plus an optional Bluetooth/Wi-Fi module.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/6] dt-bindings: arm: ti: Add Toradex Verdin AM62P
      commit: cd156f8741e362f3e0b0282c4abc3d0d0fecda57
[2/6] arm64: dts: ti: add Toradex Verdin AM62P
      commit: 87f95ea316ac68598544d512a3750cd4a73b5683
[3/6] arm64: dts: ti: am62p-verdin: add dahlia
      commit: c98ac03937e24913f90efe16832bac6c22ada76f
[4/6] arm64: dts: ti: am62p-verdin: add mallow
      commit: cfdd38cfeb87d2a69303f3cf1bbc57d404826b28
[5/6] arm64: dts: ti: am62p-verdin: add yavia
      commit: b0a01514cd906bb90eb2c7589a69429bced7ba1d
[6/6] arm64: dts: ti: am62p-verdin: add ivy
      commit: 441870bb81b22d4a3937caeb4b890a94b40c689d

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

