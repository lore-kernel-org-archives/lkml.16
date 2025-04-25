Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0A21FF28
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615618; cv=none; b=GnkXR8m+49TcTfqTFibSx8MvxhLuWKWAURhU40koc9ngWVC7BkP8x+VFtt3G6CB3z+ovO+uPxNvt8Zcg+3rdLH8Bg18+9b3pudn6pxiLwoqzxViC7SDG5QSLvkFy8j1v3OFg9s3bRxblZUU7DIomfA7Dt8oU+dEN3Z83ZBRqfTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615618; c=relaxed/simple;
	bh=RJEH5N2rv2n7jQnL+Pwcu4SRvIlmWdd6kQFOGGNXaKU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d5mCVOjpDRFicnJ8pcCWPwxM5A0+MZaqhd4ijuJ+7iEY0DdZvxybhnIBZJSvjFI7/Eu3C9zjTLNNr4cVAa7esKWHpGcaxZt/5ePtkAAsowM01YrDqbvK3beobbfoFywrccxIw6kBH9/3x6puD1rJCXYDhuI4xiGYV+hXn4gG8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cL+Fd24e; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cL+Fd24e"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLDL8c2277634
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615601;
	bh=3d436YQ3Xwtns+Rova8G3My78ycHIDiASiikPFHlDig=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cL+Fd24e4c16T0NEX8BR+9csVnt3aBj/wDlq/Nu/CunR1sgCr6OlGSwtuxg4NE2za
	 hwsvVfqygvEu9056IJyx6yQcVB7fmaml12BmqzpPUzkEsnz/EXBCNgJkxK18LQuMKD
	 Y99IsOkcmT+CNOir2HMZ2b2OhGq2CdzoCDHO17mM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLDLaZ076287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:13:21 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:13:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:13:20 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLDKcF108011;
	Fri, 25 Apr 2025 16:13:20 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Date: Fri, 25 Apr 2025 16:13:15 -0500
Message-ID: <174561554453.210950.14844325272015840507.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250421201055.3889680-1-jm@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Judith Mendez,

On Mon, 21 Apr 2025 15:10:55 -0500, Judith Mendez wrote:
> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
> default on am64x SK board.
> 
> 

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: defconfig: Enable hwspinlock and eQEP for K3
      commit: 53802e60fbb57a6ddab01837a53e2040cd1f592a

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

