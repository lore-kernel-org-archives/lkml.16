Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C6235C14;
	Fri, 25 Apr 2025 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583800; cv=none; b=Q0omUd3obdyC6JG0LN/d3AQof7SlFCwHPsCY2ZKKy8puX+JdjBZt842/wksQ4sU1BAgGvUuripxsVcFXAuIkeHJAYDEL3Bp6V0RM05oIUsTCgrAHsLHQKcTY7Qu7FzaI1InTsq98p9+Au6fp+pD7P1XpLANBDEcj+5RIRPOmaFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583800; c=relaxed/simple;
	bh=Ab61uosn7VGc1mYzTTvPpiQv4En8lI+mouNLvFVx3hU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYV4jlBXbjEh6/z8GEo+S6QwcenUNhEe+izZOThUFtb9Wn2wn1yXVCFEOP6NkmCh7ho8Q4g9wPqskMW9mT5QVqBnXBt7ktIdWc+9bzksH/2KiSaCL5gr/Xjfq1z0rVkNpvv/4FDzWc2liFISCJi7ua4SGG7veFt6w63iiFONtQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LTX0wYqB; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LTX0wYqB"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PCN8SK2140246
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 07:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745583788;
	bh=qd3ans2EkaBFSKx6PD7a98Rs0x5sNPpf7cnb9HK+FLY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LTX0wYqBk2O2QL+9ub+Nx4C8e9rQ+tTj1vmNvrDt/Mjg4srwkoXVoaI/iCOxbB9dW
	 i18HMg57N8kc30AJ5bYk6Z0rnTY6FX2apUMBJMtn+ZWusO6nCwnaMSSW3XnQHmCrEm
	 KP51QYUBeQU30x83PNAf5vxmBZZZQMgYMwdHnwWU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PCN8fE012517
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 07:23:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 07:23:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 07:23:08 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PCN7QR014264;
	Fri, 25 Apr 2025 07:23:07 -0500
Date: Fri, 25 Apr 2025 07:23:07 -0500
From: Bryan Brattlof <bb@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Enable PWMs
Message-ID: <20250425122307.4o257gnwq52ctctv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250422000851.4118545-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April 21, 2025 thus sayeth Judith Mendez:
> This patch series enables PWM signal outputs on am625 SK,
> am62 lp SK, am62a7 SK, and am62p5 SK boards.
> 
> For am625 SK and am62 lp SK, add pinmux, eCAP, and eHRPWM
> nodes in the k3-am62x-sk-common.dtsi so as to not duplicate
> nodes in the board files.
> 
> Judith Mendez (3):
>   arm64: dts: ti: k3-am62p5-sk: Enable PWM
>   arm64: dts: ti: k3-am62a7-sk: Enable PWM
>   arm64: dts: ti: k3-am625-sk: Enable PWM
> 
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 40 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 54 +++++++++++++++++++
>  .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 40 ++++++++++++++
>  3 files changed, 134 insertions(+)
> 

Looks Good! Thanks Judith

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
