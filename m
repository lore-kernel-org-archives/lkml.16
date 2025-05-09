Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA92101BD;
	Fri,  9 May 2025 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793238; cv=none; b=cKBFKs10NPwqkDI7VLzZIVfnM7msenskOxvi/56oqY4m5QotjZwdCJWKi65yevBHdJ6JhwzxMZBeVvWBUp1UYbEi3Z/ZnAiD/OApk7/irXdLZIGQCptLD3ZBnYLeg+MdXg9i+DGWItQI/sqCs8cFrri4WBhj+uTKcQzf8XULd/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793238; c=relaxed/simple;
	bh=V5ZkZLQRuhW6tfA4j7ERqOdUxZSQCwk50GAfm/MYMXc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpxhZ1o5AUzR0M1M8dlgQqEPrjLn6sfo2DM4PksKZHxtJ/Q25tBVWIwZf8Rky16soc0kmFGb6JZqoVZcAgaC7UEiU5RO6d8l1rrFIbbWBoMZCltn4w3SY7SJdyjbKezVLwAl7LDpuBsEp2ohy33tkNDRL7T9xg4R6Q1COqSA50s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ruil6K+b; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ruil6K+b"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 549CKOow2172425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 07:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793224;
	bh=+mQhNQN15AWPoSxZ/UW96naO8N0jhNAwPL8W34KjnmI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ruil6K+bU9qcMNno0uaEo96wcmGTT/kQZTJQB3CauvilAMSPMBWBfd3CunIaQfcbk
	 3N7VVWfaPnJR0VI+qr0SR7PG5xlljJQXMbgC0SLRC8wExIaduHVPFDjEvXB+AEZmWE
	 X3zAmt2k0rJXPznyuO4VMmRf//mI4mzo058Aiums=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 549CKOZ9099455
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 07:20:24 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:20:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:20:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CKNDF014862;
	Fri, 9 May 2025 07:20:23 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Daniel Schultz <d.schultz@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal alert
Date: Fri, 9 May 2025 07:20:05 -0500
Message-ID: <174679319970.1568651.6289988251494879815.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250506114134.3514899-1-d.schultz@phytec.de>
References: <20250506114134.3514899-1-d.schultz@phytec.de>
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

On Tue, 06 May 2025 04:41:33 -0700, Daniel Schultz wrote:
> Enable throttling down the CPU frequency when an alert temperature
> threshold (lower than the critical threshold) is reached.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal alert
      commit: 8785b579d431b2a76a64f105328434d3c543debf
[2/2] arm64: dts: ti: k3-am62x-phyboard-lyra-gpio-fan: Update cooling maps
      commit: 625e540cee2cfa0e514e0c8fb929fe2893e6d3bf

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

