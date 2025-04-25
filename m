Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A162221DAA;
	Fri, 25 Apr 2025 21:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615473; cv=none; b=cTsrOCLDeAkeYxTh0wmpkiTcXkJIiXn9LVMEeDIETGA0VW8rbSOmH9qwq78AfK6K84H0Kbog0ps24HeRYwNDqNUsdBeWCSovI8pl4mWT6hjkgn/k67fOUvbd3oRDJ9xFFSh5ZkiuSdOZXflQxXNjlTFhPO7isy9tuEmEY9L3ovA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615473; c=relaxed/simple;
	bh=TOc8wjLZk0dw73ZOsm1lpxPW+cD4QKAtAd+D6rjTajo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMKolq35saWKAiFUbsgZCVTaefVGwwHC87omG5a1BezVLayQaRrKnkl3WVHQ7ln7P9i4B9T4KplHdqhMJt2Q74ZvFEzCJT7ZENE7iy4ub6Xc5Mi5Ttf51v1koOT31uvYoOykrgeTmmsPJL7Iym0YA9ntvDKTAgSKm7z+bQ9P0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ppIXjbId; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ppIXjbId"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLB4dk2258212
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745615464;
	bh=+wFWw+HTux9+C80z7DbPt+Y55zU1bWr9sqxdd1W7QKA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ppIXjbIdExPfF0+Pq4GRofkMRiVkvlTWX5mQJ880nWYEy/AkGh5GH0WfWwrB56Qod
	 bxDrfwhsq50MqUkiYxSN1e8gE96uEF3/U/5v6b1qmYrrq+cSpOFcjI1X+KZONS4Vht
	 qxjgtM2lSuKL2X8TVRWPY7e5JrVOxXHr4zvH2h8s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PLB4TE123718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 16:11:04 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 16:11:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 16:11:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PLB40A095369;
	Fri, 25 Apr 2025 16:11:04 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Enable PWMs
Date: Fri, 25 Apr 2025 16:11:02 -0500
Message-ID: <174561544737.210439.8040371358617840114.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
References: <20250422000851.4118545-1-jm@ti.com>
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

On Mon, 21 Apr 2025 19:08:48 -0500, Judith Mendez wrote:
> This patch series enables PWM signal outputs on am625 SK,
> am62 lp SK, am62a7 SK, and am62p5 SK boards.
> 
> For am625 SK and am62 lp SK, add pinmux, eCAP, and eHRPWM
> nodes in the k3-am62x-sk-common.dtsi so as to not duplicate
> nodes in the board files.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62p5-sk: Enable PWM
      commit: b2fd55f906ff70a39e67d5ad770774622164bef1
[2/3] arm64: dts: ti: k3-am62a7-sk: Enable PWM
      commit: 5aec1169b53969d07cc288814f7eebd2ef01f9a0
[3/3] arm64: dts: ti: k3-am625-sk: Enable PWM
      commit: d864bb528a6725e775d564fd4430762acbb9dd0d

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

