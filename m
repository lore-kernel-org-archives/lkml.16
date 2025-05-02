Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7AE7404E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197156; cv=none; b=GnM0EHQrTPm1vVmTM0BxwO74QX4wG9s41nBK6otJvIG3kQv5Gb0nfTcg+wE4TnzXOYWT8mJEleLXr70bgqHAgJXpzO3EpYNHqNgEJMVZLnkEkeOcevmZ/vMi5e5XMHHWQCn835eCzHWP0qP6xq9ztyZm0rIS1Rnhy3tobB+/SBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197156; c=relaxed/simple;
	bh=2tswnhzB8U2kXOcgGk04FsFk+QG67pF6UsUc74gMD2w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P81OP4SzmBqqSGPxuyC4uNDqMOi5C46UcokgVAse96CmuD/EmLGvdC+AS9S1jXpuytoBRLds0xuBVOn/zs3BmAOJMmnNHsnOBGT6OK0GFaoIc5kiv7q3IR2wD2JtkwLa6SERj5rhZxoP9ILRmhXLQGWuEFZ4w5S/j1YYHb6iwUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bHdEVZl0; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bHdEVZl0"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542Ej9Eq3882499
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197109;
	bh=mPvLBOo8PUEcZ+zsiAT7YTa/Enfgl6yISRpYWQq4Xlc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bHdEVZl0TvscsOYtOezU7MGGu/rOW+hkUvb9WjiPsl1BfbI4gxKyCEmE87tqPaajk
	 Hmh0Ifvc6ROm/hZ0M3nA0G4v5XYO5Toap+U/YD2l939CpLyjxq1NXmhmAsww6Yx8V2
	 Op1sKaIlHfyEcHbji5vg1wpYDJSet58n7KPOC+zA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542Ej9vl002877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:45:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:45:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:45:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542Ej9KP129766;
	Fri, 2 May 2025 09:45:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Ross Burton <ross.burton@arm.com>, Eric Biggers <ebiggers@google.com>,
        Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
	<nfraprado@collabora.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry
 Baryshkov <lumag@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>, Nishanth Menon <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: defconfig: Enable TPIC2810 GPIO expander
Date: Fri, 2 May 2025 09:45:08 -0500
Message-ID: <174619710366.3123420.14786223653329895426.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250421143926.2009535-1-nm@ti.com>
References: <20250421143926.2009535-1-nm@ti.com>
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

On Mon, 21 Apr 2025 09:39:26 -0500, Nishanth Menon wrote:
> AM642-SK uses TPIC2810 I2C GPIO expander for LEDs.
> 
> 

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: defconfig: Enable TPIC2810 GPIO expander
      commit: 42cfb00c919e5951ba5c4067a058c7e2cf2ccbc0

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

