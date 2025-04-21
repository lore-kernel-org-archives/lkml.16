Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13432265632;
	Mon, 21 Apr 2025 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240314; cv=none; b=BeIX4cpYPJUDys595RZPKlUquSLYDL3H3STOvFDU9zB4rLvY1UyWkjtU8TqqG1Qb8OZUxcwZT/UP7Nk9zgumnqoogHRUDB/mR2CswFkQwG/hwBkbkPgzbbX6BZ5vtUSGLM/8I3kGPViUcw3y94H3VIccLFX56doZy8975pGXO9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240314; c=relaxed/simple;
	bh=U8osS/ZwILtRdxwv8pIN0bvkq8X3m1lW4VHYc/4+T18=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYFzJXVLhtF5ikd0zOMF+c7zEOIDfXGEwMuXo9Qn1NGLMirOy55RuNz7d3PIH1qfiLs/U/dGHFNhqrKOmzPhVT2PqGEFFcxeMYE6vdHxXPYNnC74A4QB4mKQ6D5m/QHLebI4uejZVeIdTR/VQhnMsjqR+xvssJN0/rL/zzVVUh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LtaP1hoB; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LtaP1hoB"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCwR8A1558209
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745240307;
	bh=pRIvYDrbBIMegIb2a73iF08b9k9S3I/O0j1QXWOEqPI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LtaP1hoB9HnBZUb0lyBSuVOGggjgu8N/9WbQ9WGfCl8Cnt3P6haTfguAjkIDTph7L
	 74uBDPH/w/kKZUcD3CtVhzHEhgK3rv55Sp1+qqMiqdXuGePKfGfPauxZ6ge06VfP/W
	 nFYvIxcYSMK5oQXod1mc/XUpPEQL8CuUoWgTk8mg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCwRxO022708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:58:27 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:58:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:58:27 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LCwRrv076149;
	Mon, 21 Apr 2025 07:58:27 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0 Type-A
Date: Mon, 21 Apr 2025 07:58:25 -0500
Message-ID: <174524029452.1976053.2871896353066358083.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250409100853.4179934-1-s-vadapalli@ti.com>
References: <20250409100853.4179934-1-s-vadapalli@ti.com>
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

On Wed, 09 Apr 2025 15:38:53 +0530, Siddharth Vadapalli wrote:
> The USB0 instance of the USB controller on both the J742S2 EVM and the
> J784S4 EVM supports a single USB interface at a time among the following:
> 1. USB3.1 Gen1 Type C interface
> 2. Two USB2.0 Type A interfaces via an on-board USB Hub.
> 
> By default, the USB3.1 Gen1 Type C interface is supported on both of the
> EVMs. Enable the USB2.0 Type A interface by configuring the USB2.0_MUX_SEL
> mux. Additionally, set the Dual-Role Mode to Host since a Type-A interface
> is only associated with the Host Mode of operation.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0 Type-A
      commit: bcbc3d40dc62dd616e409b8b18c13d5b55fca6af

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

