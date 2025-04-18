Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945CC225766;
	Fri, 18 Apr 2025 18:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002739; cv=none; b=lmPVWSsC4r+hwPjQ6YfufksRmlj57DbdVEd8f7Yc5KSuwht/bTWajSq8LYuVR0fctd5A61ZrwUTgpUxF/Yitdmorc1zJPh9E3eshR6RwnCQjd7+AoXmSFbfMuClUlnv+aHrZS0gGBk5zuM0nLH0CgcHt3Jc77yxzqmymw5N530U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002739; c=relaxed/simple;
	bh=zdUCmJAboM+u7q17sau8HhGjGk39LD+FsR4E0XTOQkw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CVOQzA7lhj7fra7le6fGXYy7vhO9BSjNVZp6F01ayNzKffvEa15EAoof57PAUVVJ8iDiF6E+AUiWsQbQBliB5KBzxhGZuGBLBQRtfY+fQBD86EOULoRuXTxFiypyEz5CMKQQE/cobQ3eP+oFJInj6cJaO7xQ/egK7+eEI0PqTiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BdXu6Ip3; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BdXu6Ip3"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwqub1001453
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002732;
	bh=BoM7ULPRXxvEhaz8Qsa4lQ8+BS5GV8aAbL3gGtEsmHk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BdXu6Ip3IjSFxVGeg/FKqxxuOaRSiLQcVbRxZEB2V9aE8UHDLo7c+vQmYOey/fw3s
	 V0OySXk3pmCBsGuFumZl6Xta/LaBBQ9hu9ZZheZOx408z8BG0YZJe5jNWtGDnn/PZh
	 MGhqQ0qUaNkUDxDBYAb26dPI+RBW4Z9MLmHopLUw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwqkN113954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:58:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:58:51 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:58:51 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIwpfs118120;
	Fri, 18 Apr 2025 13:58:51 -0500
From: Nishanth Menon <nm@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>
CC: Nishanth Menon <nm@ti.com>, <kristo@kernel.org>, <rogerq@kernel.org>,
        <kishon@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] Use ti,j784s4-pcie-ctrl for PCIe CTRL spaces
Date: Fri, 18 Apr 2025 13:58:50 -0500
Message-ID: <174500270525.95799.12263001003103973109.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jayesh Choudhary,

On Wed, 02 Apr 2025 17:01:56 +0530, Jayesh Choudhary wrote:
> Now that we have ti,j784s4-pcie-ctrl[0] let's use it. This makes these
> K3 SoCs all match what is already done for J784s4.
> 
> No functional change, DT changes are fully backwards and forwards
> compatible.
> 
> [0]: commit cc1965b02d6c ("dt-bindings: mfd: syscon: Add ti,j784s4-pcie-ctrl compatible")
> <https://lore.kernel.org/all/20240204090336.3209063-1-s-vadapalli@ti.com/>
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl property
      commit: c574db0b68a600f9548f0ef7bcba723562713587
[2/5] arm64: dts: ti: k3-j721e: Add PCIe ctrl node to scm_conf region
      commit: df2210b2da139e3a733bd7bd1406cd74d39d59a7
[3/5] arm64: dts: ti: k3-j7200: Add PCIe ctrl node to scm_conf region
      commit: 1f326fb84a6074772f01dc63ed4d3eb791682479
[4/5] arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
      commit: 755e47a71f9dbfbdb33fc18d20a74b7804a20acf
[5/5] arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region
      commit: 4e7ad3b4464571d7bec6869944151b27cce44435

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

