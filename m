Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C821CC43
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793383; cv=none; b=tmTemuWgL0p/5tEWvJCT4AA/S1GBeOe6RNw2z5FB8tTshQ3vA30xBmubQVfY5d3R96faOsrqLiKmnN3iwyDmLO6ov3i4P+z02Iy4GEy9cpndI0gV4WOFYo4wpRAubNXH7ZcCd9lvethM+2htCQG0Z7Qxwi+mLYrJOtncVXndaog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793383; c=relaxed/simple;
	bh=gmqdwlpcu3+1pdodlcESGw+aKiMU3oEAvYgDWl4zEps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVfoX1mGPyccpBMitmcrlFnBil22wLpcdlfoE10OemnZ+XNldlJc1rhYtMRl0LV2fYjZpLxfFr5Ea8oUQAWBpTO1NHFqJmPkp5O2T+IBF5QhhWiLxYgRVZzd5TNbUnUs/59TQGMRNsx17SAfXfKnk8GAhMwmNWk7IdIOQkAIles=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AtYAqoYx; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AtYAqoYx"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 549CMr9p1380698
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 07:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746793373;
	bh=1fRV7NcpWnEYzm+dW3OZEkMxdzkVM7tRwKACZnLsh00=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AtYAqoYx/YZYdDG4T8pTKeWZcA0MXdCvSkrCAe3Iu/bmTb5jnixcDU1Dz9kCberw5
	 gDAepZDcKDnxUTZXyNL3hk/YGcguArb1nShwufjhcGICU+oI966+j/tYnuEdmN7KRi
	 w8CHgttJjEs5HQvAjqI3kEPrq8KOqWg8cdUAVlFs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 549CMrJd100094
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 07:22:53 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 07:22:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 07:22:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 549CMq3t056158;
	Fri, 9 May 2025 07:22:52 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Alexander Stein
	<alexander.stein@ew.tq-group.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
Date: Fri, 9 May 2025 07:22:51 -0500
Message-ID: <174679327367.1569214.10905203096481550379.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
References: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Alexander Stein,

On Fri, 09 May 2025 11:36:52 +0200, Alexander Stein wrote:
> During probe the mailbox channel might not yet be available. Use
> dev_err_probe to silence this deferred probe error message:
> wkup_m3_ipc 44e11324.wkup_m3_ipc: IPC Request for A8->M3 Channel failed! -517
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Given the kernel window and the trivial nature of the patch and a review, I
did a local test as well and applied this patch as this is indeed a nice
cleanup of irritating logs we see.

Thank you!

[1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
      commit: 877afe1ee34df54ea62ca9746aafbb1cac946bf5

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

