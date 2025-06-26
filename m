Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E898A19DF8D;
	Thu, 26 Jun 2025 04:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750910616; cv=none; b=FJoLH93VsaBtP68YlrGxPHEh7s1cfaFGHLzFJNgwaoOikBmCDwUv9dqtxal82IfWZNmL7qBzlb09aJTzx5ezsCSRc8FALZIO/AwOuliK2XuDj+9DINS4gWWF/ugKF0ucIoQO6Ca63gFpJwWJzv3H8sygrsvGsF1JkPeOaUhbep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750910616; c=relaxed/simple;
	bh=EGCYA6Ia8JjXx5Zi+WidqGYWyqjJgcHRMZOR5faZVog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O4PdHwfhhUFm9YgFBab34fayprhavDzAqnIXy7pZ7LAyqlHQKDNvNVDl4dQEcvY4PYZUAY9GD7nBWuhNx0oF5XAMepAwwpjJ5ByBbd792kTrAU68gNznROBPmh3JAfJPzGyvWfdA6xWKeDcrcPCKf2eMyhlrC9lPubUH/365eW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Mr0PnvVy; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Mr0PnvVy"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q43T771633102;
	Wed, 25 Jun 2025 23:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750910609;
	bh=+dnVtknQv5unSt09zTMluxW0WiuV+41j8zc6sLmjj/U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Mr0PnvVy+FToonHdyvFPYahran27QULnLODpbU36O25tJZjaJ7/rC9auta0SunTRO
	 XSxdWHCP1OQlAGaKCVX6KCKUr1jIilN3mhpqzYKZ7o0p8hqMmNBuI46jIt3I6QunjW
	 WZHPwPBDHQZCGbIoMgABtlplAL2DhnxznoU3TIJY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q43TX21886244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 23:03:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 23:03:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 23:03:28 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q43OPX598962;
	Wed, 25 Jun 2025 23:03:25 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, Hrushikesh Salunke <h-salunke@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase tag to "pcie0_ep"
Date: Thu, 26 Jun 2025 09:33:20 +0530
Message-ID: <175079060339.1874839.2990512844164359233.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610054920.2395509-1-h-salunke@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Hrushikesh Salunke,

On Tue, 10 Jun 2025 11:19:20 +0530, Hrushikesh Salunke wrote:
> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
> functional at all stages of PCIe boot process. Thus add the
> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase tag to "pcie0_ep"
      commit: 26bc2019542fe262b799546c5211cc4b88b3f5ea

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

