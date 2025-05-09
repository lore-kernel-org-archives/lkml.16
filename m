Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8202128FAA0;
	Fri,  9 May 2025 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793257; cv=none; b=odKv3STluT3F8kJ4wHqu6Li8UYS/my1RMHet28lQxYLoLCVur8APAGraDbZ0sbnohTLneelD3sHAb5ntfpYeJOomMAOULgss6R1JX4F6WC+PRPEawHJ/zP1vMIe6qBRzZN+HDRwAFoXsHwmz0VbBiKdbr5L1uyZYECH7X6Y9T+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793257; c=relaxed/simple;
	bh=iYd6MW7WYEDo9B+eIz2giO9LJyrK6yWjE0rulzxR65s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MSZ5WytHDez16A2yLwByQK1QEnKqTe83ltACr9q0npaXd+TCoktkSQpbsOmHiQUARzCHbf797ZG0fxFuNHjfPBLMJhhC8dFJaDWL6ybaSFgJj74pDTlF3TSVcmXh5TAhtva8Vn3lIk9GOKWHmMQL+a4aXFdOnXnz08f092Pjnbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wOXd4G+A; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wOXd4G+A"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 549CKhb51380483;
	Fri, 9 May 2025 07:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793243;
	bh=R3zdd1YvHMWYNGxIXy3qf/H2kg9XVwxtKB16uwxSH3A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wOXd4G+AxvenZl5u7+X2FVZagBDvNc6DTaoQFgZjft6oa4+jG+7U2eH+SW3GaZJjK
	 vVU0ChaedOt2aBICgMax8NHd8h42Fv4sNW4b94f9NTgaqRYlLdk/F1In4pGEvICxtF
	 4+SnExNA9eGVSTQTw15RWuTgSsOBCLwwfuPSnisg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 549CKhWS2856384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 9 May 2025 07:20:43 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:20:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:20:42 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CKgYE053941;
	Fri, 9 May 2025 07:20:42 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Daniel Schultz <d.schultz@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <upstream@lists.phytec.de>,
        <w.egorov@phytec.de>
Subject: Re: [PATCH v3 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv device nodes
Date: Fri, 9 May 2025 07:20:40 -0500
Message-ID: <174679323299.1568816.9463922925187709085.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Daniel Schultz,

On Wed, 07 May 2025 00:00:04 -0700, Daniel Schultz wrote:
> This patch series is based on [1] and adds these R5F and C7xv device nodes
> to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
> as well as main_rti4 for the C7 DSP firmware.
> 
> 1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t
> 
> Changes in v2:
>   * Rebased to latest master branch.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
      commit: c0fa0aaa69ac3a8d242fc12cdad8cfc4b8fcdba6
[2/4] arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
      commit: 8dd0ac27fcd1ea64612d1f2392c69bc2648aef2e
[3/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
      commit: 5d0727b0537f3e5c3c457ead700a5cdb1ee7eaf7
[4/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP
      commit: f71fb19f36044290669dccfc31d1de6ef3d0eed6

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

