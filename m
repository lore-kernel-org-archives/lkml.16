Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D4919DF4A;
	Tue, 24 Jun 2025 18:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790727; cv=none; b=VcQIBSz+sfe88Wv1YIoSzhW22kOYGbZgEGpQ6spZJPtmYV8DVtBLLJUs3qOJBafnGGPMjQ+6O7S31lfYrlUKBpHE0GXHWIjJmV7Jrp7xeDmY9kK9veP4YlydQc3Hpd8nxSFjfd2wft9OkQYwXhplrCDTW1wC5PXqJv/Ho7z/F0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790727; c=relaxed/simple;
	bh=vRXHOyqOVrh/WjrVP/FxcEH9B6f07cCVn3pPNylhkhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P4lKMzPpXZYWJ6XZ1x3gjSiwpGBs+9y85zOvcennv5NBqY9c+VBcWrc2trlryBUR/u7/xyupxl1L/U93ggj32xtjI1UeVhyDcZs39tDvoly6SiSzLQgoUIecrqtkJpXYv97kmyGLCUW5If68H3PVtHImS9F0lzQ/5URdEv2AtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gWneGnWp; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gWneGnWp"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIjElo1631197;
	Tue, 24 Jun 2025 13:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790714;
	bh=GAGKM7aXbOThzO3wjO02xo7P0wtUNQ0S1F+BZCBLq6s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gWneGnWpxwzthlB+TfYFTXuRBh1kVLIS1e+8hYFA6E9W4x4Um/wOqQ0Ra/fJXBIOH
	 NvtXD4V+9pUOwHhjmIKpQJL944tk+WyVlRp8ZP1C7KgDomkvAuSv8tAD2k58xIf2o9
	 40+xoa1dwDkc3jeshfytvtPBXGh6hK9Tx9eN23JU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIjDpU523860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:45:13 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:45:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:45:13 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIj9eA1992686;
	Tue, 24 Jun 2025 13:45:10 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Wadim Egorov <w.egorov@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-phyboard-electra: Fix PRU-ICSSG Ethernet ports
Date: Wed, 25 Jun 2025 00:15:08 +0530
Message-ID: <175079060327.1874839.13802437150014477290.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521053339.1751844-1-w.egorov@phytec.de>
References: <20250521053339.1751844-1-w.egorov@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Wadim Egorov,

On Wed, 21 May 2025 07:33:39 +0200, Wadim Egorov wrote:
> For the ICSSG PHYs to operate correctly, a 25 MHz reference clock must
> be supplied on CLKOUT0. Previously, our bootloader configured this
> clock, which is why the PRU Ethernet ports appeared to work, but the
> change never made it into the device tree.
> 
> Add clock properties to make EXT_REFCLK1.CLKOUT0 output a 25MHz clock.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am642-phyboard-electra: Fix PRU-ICSSG Ethernet ports
      commit: 945e48a39c957924bc84d1a6c137da039e13855b

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
Vignesh

