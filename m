Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48825C811;
	Fri,  2 May 2025 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201715; cv=none; b=XihkV8VPU/TuPPk2sWG90FLP9c2vpnENefVpsi9VQ1eurFVHA+XQC/Oyl/vY0kq8ho4W8gcF4XWYe4Mr+7hw12Qgg6SUoaHXJSEX7lY+mAqQiHIseYxzz/UMBwiWxRBhCCTVdZbP2UTNbWYdrJ5X84nQs7TT9G1J6UIAgLAiG2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201715; c=relaxed/simple;
	bh=BLLDcntWlfKFCB539QrhIX1zn2SPnmC0v59nvwOTu/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIXMmuQ8/WyAWWYiKQNM6IJGIydKs0alt/F050/EiJH8qGI9F2V6wti8YHLgdIYPbRblGPqCrZsytS1NhmV6eRBaz8lG6pBMi3DTuRZplSS9XYnBXPeYXSD5gRh5MApX/LN25RWJCqGTyZtHrmfT5rx3XmEIt6MM8tgRJOQ4Ghc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=N2xCKHNO; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="N2xCKHNO"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542G1ilP3899617
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746201704;
	bh=SM/2nkvFBsdAVdTDZP4AfmeiPEIN/8uymH+sgluv2DA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N2xCKHNO95Y00XdTjBME+cxRUZ5NETxV+97ukXPf9w7MOYWOqeBeWy6c1Hekpvz5A
	 GhBXvu5jZv6r/Cx9NpW/j64gafqp2iVDTGQPv4etQ9eEvXSPhnMVcxl99nqk+GjbwC
	 Fp8i73APkOSpzBc8c3iMwjlnDRsYNti9LAAv59NE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542G1iSw105937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:01:44 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:01:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:01:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542G1hA7084565;
	Fri, 2 May 2025 11:01:43 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        Udit Kumar <u-kumar1@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v2 0/3] Set eMMC clock parent to default
Date: Fri, 2 May 2025 11:01:42 -0500
Message-ID: <174620168930.3146730.1790558612742355964.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429163337.15634-1-jm@ti.com>
References: <20250429163337.15634-1-jm@ti.com>
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

On Tue, 29 Apr 2025 11:33:34 -0500, Judith Mendez wrote:
> This series was split-off from "Misc MMC updates" patch series [0] and the
> original patch further divided into three to help with backporting as per
> review comments [1].
> 
> This series sets clock parent for eMMC to the default clock parent
> MAIN_PLL0_HSDIV5_CLKOUT for am62, am62a, & am62p/j722s SoCs. Software (DM)
> does not switch MMC clock parent correctly as per the Arasan IP requirement
> to hold the IP in reset while clock source is switched. Since muxes to
> switch clock parent are not glitch-free and the default parent is tested
> and working fine, switch to the default as a preventative action.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62-main: Set eMMC clock parent to default
      commit: 3a71cdfec94436079513d9adf4b1d4f7a7edd917
[2/3] arm64: dts: ti: k3-am62a-main: Set eMMC clock parent to default
      commit: 6af731c5de59cc4e7cce193d446f1fe872ac711b
[3/3] arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parent to default
      commit: 9c6b73fc72e19c449147233587833ce20f84b660

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

