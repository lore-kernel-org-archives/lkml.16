Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD44C45009
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002404; cv=none; b=UmkOtUeo4KzvQfDCI3iDkhVuDY1wRdw2GCcewd0LdiwvYWMl3H1SCESjN/xB51JijDbeVpqybkedZEUQi11puzFy2CwUMM2c/yVVpBcyKW9hW/iHLXau2CbALujmdHKg8RtuauzBC8LenweTcIzYzS+0mS0PPcpPbWpfbLKQtnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002404; c=relaxed/simple;
	bh=ALGjEukfgISeeaBYVl35SCoCQ31VNgUm3zq/pDyQy5A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCBxbcdHr9SlMCVBTUZavPCGAhve4y3Qz3qk1gPimfQhaw90il2WL6ClTZTD75zLtLAlmM/rh3rt4tH1geFunqA8zH8wBZGDaZ+iUYAwunneP1VT4glccpPZvio4KXIlzTX+5kH0bjTo9IU6dpHcBa1QuPnS1km3PXH/81niN3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ACbPNMA4; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ACbPNMA4"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIr1651060531
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002381;
	bh=0WyfnAEXOEvOsCtJtz6vRRQH9lrvBDaAXYFoE+cz7FA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ACbPNMA4RfYSExR5unctynl8PMgp+OvsVa1PcuQv+MuyiMvfUH8F4cL/qDohUHR2P
	 sy0DAkQD/bNfUxMOYRCZ6C6t/SReb0AJL3CR6VMNQ+fDNLZ7xu10oeTUWG46KP7WcB
	 2VgJcwp+UzSmZwFFJ1HecfDdHzoq9VUm4DC8Entk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIr1o6106504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:53:01 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:53:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:53:01 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIr1Ke113383;
	Fri, 18 Apr 2025 13:53:01 -0500
From: Nishanth Menon <nm@ti.com>
To: <ssantosh@kernel.org>, Chen Ni <nichen@iscas.ac.cn>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: knav_qmss_queue: Remove unnecessary NULL check before free_percpu()
Date: Fri, 18 Apr 2025 13:52:59 -0500
Message-ID: <174500231274.93973.9406743494287561760.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250417084836.937452-1-nichen@iscas.ac.cn>
References: <20250417084836.937452-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Chen Ni,

On Thu, 17 Apr 2025 16:48:36 +0800, Chen Ni wrote:
> free_percpu() checks for NULL pointers internally.
> Remove unneeded NULL check here.
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: knav_qmss_queue: Remove unnecessary NULL check before free_percpu()
      commit: 17bff220c6d69e4be38c9899a7515c3b02de60f0

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

