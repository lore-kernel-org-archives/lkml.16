Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E820E022
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240247; cv=none; b=oveTL0wquD0o1DnLMudMOUu3qmW1ERNczjIdlRVwj4OhnTpGl8xt7O1iOA91VQncfLmWoi4ny2xYJY2yGBt34mEK4neDdmBVmGsffqZx7aUEM4lO96nVlodI7QMFSSMnbvWVO1WXABmSl7ZbfMA8BQGp1Lg0MCZpZ+cXoZ+mR+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240247; c=relaxed/simple;
	bh=mDp6BLyAeJCExTVh9NsSLAT5fZNGQzQhbWr0czeSLRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ev9PpZCg87sS4JF9EJ26CeqyN1xzndyCczdZikEcoF7KztJZZTrDOUzvOZlKl549tKg1JjX5cI1q83yBZBqX7AGXf6aEICl/e3ZLerzHYQGfuazy6pEmvFtSP+z54lNBnpTzEdsZld71XuxUNM343fluzDZDGC7d+6SKgY+akLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=y412E5xs; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y412E5xs"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCvIto907192
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745240238;
	bh=W5WjLcJsxArMu5HCfyLW+XnlGaOpGtRqSi+EyQMT4dc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=y412E5xs7FjTMfsN3NMdDN26l9jNCxmOFuXv58BS7d2sieDBmEMem3m0JRy35Y2Vi
	 LoiBij4MXT0hRNWfQoniTT/IdaDGGlMJ5PurtCIqGf2gB9grjha/1KRTreszWzB3P5
	 0tmqTyGA2T+hlWPmxcZoyOQiOASDW0XZVsLA4gsU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCvIE3083231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:57:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:57:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:57:18 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LCvIC2075145;
	Mon, 21 Apr 2025 07:57:18 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <bb@ti.com>
Subject: Re: [PATCH] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
Date: Mon, 21 Apr 2025 07:57:16 -0500
Message-ID: <174524022451.1975791.7076192860299528764.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250417084904.2869369-1-vigneshr@ti.com>
References: <20250417084904.2869369-1-vigneshr@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Vignesh Raghavendra,

On Thu, 17 Apr 2025 14:19:03 +0530, Vignesh Raghavendra wrote:
> Add JTAG ID information for AM62Lx SoC so as to enable SoC detection in
> kernel.
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: k3-socinfo: Add JTAG ID for AM62LX
      commit: c62bc66d53de9a61154224f99c1b4ca68ed57208

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

