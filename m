Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F86224228;
	Fri, 18 Apr 2025 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002705; cv=none; b=hBXI6VIYsqAzK+IGjdtdDFF1qolf4Smb7uAWN2gugK2Y01/XE9IaxnDRgKn0CTeTjUyXE5+WyTFY1+wSqLzrQ4AVlCaY60gGyRP5vYCxBDhamKyjlCZ5RoLCNTJO909gg7tP5Upjo5Jzam5NR7KGGCfJrlG+q56FBJSahkZiLFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002705; c=relaxed/simple;
	bh=wnSaoM4xyffQd3FlmEQErr5vhf4T4aSrnwoKl3/YRJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kyb56oEKag7KxgjtCZZEq1zZmfZDYKhd++/E46cu/6Sc5cMFlQDvTfbgWIXp6EfwPN5Vd3aUdZicLbAbjtDnbT1YIKrNnGb8Hqmjt03SloMwDC1xFgFEi9Q/aI8pa5tpr49uIVeq6Y/R4pH7LgY4VVJA+bnUMM4OcXrGLZxvvi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=saFxAaaz; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="saFxAaaz"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwG6K1061259
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002696;
	bh=koIG3q1ehnIUu1mOFG9wlRR2uVGmetxb/4Hrt+f0vjE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=saFxAaazS5q5cZ3rM7LdACryY4fnZ9gCBLNyQkp7R2oXloo4zPGN2Hm8Dok79FhKa
	 qs/FHBg3vS5Xm2miiLM/E8Hxt6ZqwsJs0msYEvG3SXFOP6FuXa9E528nt+mHbSzaN9
	 CYsLkd/D/cROThTxBIP+olVg3Lvl0NtTmC9EBECw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIwGRk015374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:58:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:58:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:58:15 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIwF4f117732;
	Fri, 18 Apr 2025 13:58:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Udit Kumar <u-kumar1@ti.com>,
        Michael
 Walle <mwalle@kernel.org>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62p-j722s: add rng node
Date: Fri, 18 Apr 2025 13:58:13 -0500
Message-ID: <174500267952.95667.4169202047923911096.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250401083246.3228964-1-mwalle@kernel.org>
References: <20250401083246.3228964-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Michael Walle,

On Tue, 01 Apr 2025 10:32:46 +0200, Michael Walle wrote:
> Add the node for the random number generator inside the crypto module.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-j722s: add rng node
      commit: bdd158389dac25ff36e041ff28591aca769f403c

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

