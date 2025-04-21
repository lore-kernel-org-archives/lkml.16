Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94D1C5489;
	Mon, 21 Apr 2025 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745240297; cv=none; b=bWrRFEqFSmSgzaIJosYyZcQRxUm4pCL6JzJtIyq9tazMuVjw28Z++0rgPkfFX35y2crCFp72MiNECk8R4jWlxIq/Nm+UwP1P7HQ54p4qDZ1f9iSuudrmCgR1IQc55o/Ed2uliPTWEiRFm73yqr2cWJFcykWSl775QFfT8+ZAXf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745240297; c=relaxed/simple;
	bh=0Q6C7OIuloJnN8yMRGcP4R9BixqDIyAOo76AKxjy0bg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilfIUR3JR0YtyNs/ZQ8tT73WIevenau6ILRQv21MY8dpn+EuA2id8C5RFCgp77DH4bJgdEmeVGUcbeMYh8V+vSW8HXxgOxCV4NsLN0Fd/5DmZr4+NwnVBZ5ux/O25XJKX5/7jMNeAMUfa+oTvXrQsYR5J8tzM4uE68sefs6y74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F0+d1xv5; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F0+d1xv5"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCw9RD919322
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745240289;
	bh=MGl6wj1twMafrqAJ2Ap7n/PE7X+QSY313AzQP/HONtY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F0+d1xv58ycA9lNCvOmeLd8kmTng4Jk9EMYvwDXZGiq1Y6+dRa/CaR7IGCmiS7GFB
	 qS60ZHPAo6VLRX9nByzeT9H9vfJ5BEqF7vqPhro2PHQzhXfsua59XisHBupH45i6PA
	 AgPMdoifeiDSn3VgpSRLdc/AYFJ7C5rJ81sDUWWM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCw9XL083520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:58:09 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:58:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:58:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LCw9bV083581;
	Mon, 21 Apr 2025 07:58:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Jared McArthur <j-mcarthur@ti.com>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1
Date: Mon, 21 Apr 2025 07:58:07 -0500
Message-ID: <174524025290.1975926.6373479464630602638.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411203950.2859356-1-nm@ti.com>
References: <20250411203950.2859356-1-nm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth Menon,

On Fri, 11 Apr 2025 15:39:50 -0500, Nishanth Menon wrote:
> main_gpio1 controls the voltage for the SDcard from 3.3v to 1.8v.
> This is required for proper operation of SDcard through various boot
> stages.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
I have dropped the Fixes tag as it is not impacting the linux kernel.

Thank you!

[1/1] arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1
      commit: 6a7023118fd7901d8b7967388923604d5d646cca

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

