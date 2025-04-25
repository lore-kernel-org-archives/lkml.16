Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED0192D6B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615550; cv=none; b=JQok1ir8GY3GgpbpMg7g4AAs1zE67fTyDx1OFkqol56BGi45N8EJG428s9pYl4jLsi0D4NVMRUAT3bP+8eqGzsG85cxzFadR4vAPFkWqFNcyfeCht+h+DDi3u2AiFY73UY9y6qF5UjbogmbQcsDwVFOLL7lDLl94QOEl05iGdds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615550; c=relaxed/simple;
	bh=41IW46e6gDg4C4jg1vzCwRlZIgO5uBAS84n1qrKE2I8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+6YiH+WbGczo3IKBr/0VhCtODUjexbcKU4GROIadTP+2OOOK8exSpZ/o8dh7YUGVoUXOnfGDYZlYBqkClXMh6XWZCjxuwdkcbesq8r782VKzh7MnPC/mrDNIkNP8JB8Wr3oYBHXrlXehm5+uYLESApjpXSbTYIgqIAUdH3LJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZvDBk8FI; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZvDBk8FI"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLC68G3027242
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615526;
	bh=53XdUqfFsxdrkTPF8ii63mrk/KIlvgnwsDsFFeftRxU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZvDBk8FINxfAVVdEMHDMIFpyEu68m8UfqsIg3+hLvhudhsuqvAQ+X6HC5ycYRa12b
	 Hksw7Q0NfmfvAALvmLXoC3l98l5QcrxMKOcDzK1V8/61RLj9ICIGSsy/VslGXeYQhz
	 DPvcPbOfU96V5EjGTDTCZX4ONZGGqzNPfuSMp7lU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLC62b017024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:12:06 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:12:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:12:05 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLC5gr096254;
	Fri, 25 Apr 2025 16:12:05 -0500
From: Nishanth Menon <nm@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-kernel@vger.kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>
CC: Nishanth Menon <nm@ti.com>, <bjorn.andersson@oss.qualcomm.com>,
        <krzysztof.kozlowski@linaro.org>, <geert+renesas@glider.be>,
        <lumag@kernel.org>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
Date: Fri, 25 Apr 2025 16:12:02 -0500
Message-ID: <174561548590.210587.7393005807062359269.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250416182930.32132-1-j-choudhary@ti.com>
References: <20250416182930.32132-1-j-choudhary@ti.com>
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

On Wed, 16 Apr 2025 23:59:30 +0530, Jayesh Choudhary wrote:
> Enable configs for cdns-dsi and cdns-dphy drivers required for DSI
> display on the following TI platforms:
> J721E-EVM, J721E-BeagleBone-AI64, J721S2-EVM, AM68-SK, J722S-EVM,
> BeagleY-AI, AM62P5-SK, J784S4-EVM and J742S2-EVM
> 
> The dsi wrapper driver used by all the above mentioned platforms,
> cdns-dsi-j721e is enabled by default if cdns-dsi config is enabled.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1] with minor
commit message update (Beagle is not a TI platform :) ).
Thank you!

[1/1] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
      commit: 882c214572e43b56f781883d4ae48689381a68f1

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

