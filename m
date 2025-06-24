Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA5419DF4A;
	Tue, 24 Jun 2025 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790772; cv=none; b=sa9Qu9MsrydImfblGttFSSB1kkiDUbbDc6afA2S3UZYa0bIJ9XfA/9Gp3lK+Ptxuf3CfmCYg6d6dJaBYRq/5bjq6P97fwfGd4+wmLpbPRVzw+WU2RU1H0T1GdVVmu+Xo0LpIEaZF74vu1DNj8lN4tRNDZA4AiI4yAAuJqpBwTaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790772; c=relaxed/simple;
	bh=xON+1e8LUeEk49u3kbhtpooCftgHAT0Lk8KR3WI4ieo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8UzUpSaxRzIfnDwOzAoVYB7Q7zTvX5XnzQI5TTSXXT+PO16dlQUQxtgA7VZLMRwHiIpIwZvDoWvbSenzp0StLB7ise/UA7jdPsGSn1Gp4V+ZiD4LaYriJcXaQIt+ClemO5lCgQFwvRzAzKZtq+JXioRGTQJv3V4AyCbUvgwQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=czkr/+gN; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="czkr/+gN"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIjxq61631233;
	Tue, 24 Jun 2025 13:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790759;
	bh=ryKve62wZWyoV8Jf68Qb1NJxYQaLU+F3unuU2gjuvFw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=czkr/+gN/RPfBFITbT9oUkZqztPreUMZHL54ISw0UlHXGCN9reB5vogrMrRhFcpsc
	 Wiw9dCFUbCxHW4R6uo+fCgawL39YaWdIv7ijPit6RZgUTqpPczpjOCqjHyQxrTejPC
	 2hTmXLPSVFn9wZK1AoJVZvRzRVBSC+2yjX/R7ItM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIjxt21801622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:45:59 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:45:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:45:59 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIjtK31993515;
	Tue, 24 Jun 2025 13:45:55 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Emanuele Ghidoli <ghidoliemanuele@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on I2C_3_HDMI
Date: Wed, 25 Jun 2025 00:15:50 +0530
Message-ID: <175079060331.1874839.8272490827438865820.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
References: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Emanuele Ghidoli,

On Thu, 29 May 2025 12:25:54 +0200, Emanuele Ghidoli wrote:
> Enable internal bias pull-ups on the SoC-side I2C_3_HDMI that do not have
> external pull resistors populated on the SoM. This ensures proper
> default line levels.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on I2C_3_HDMI
      commit: cb2d9c00770e2e6c51864704b5d98c9a0ddccaf9

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

