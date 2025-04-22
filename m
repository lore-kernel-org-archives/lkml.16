Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E428150D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331745; cv=none; b=nzNc0muRwRzjOtI0skRMPa/WVqbPrv6dwGG3aINOWoRoXXGcEqzXhjsb8+ykcfid/2K/f2YRIID2bfhprAqxGwbkbnTrcNAPMt1aNzkFp3QI50rRj6+7jkiibjZpaUbfqzQ2sVGVCDCOl9rEP5QjTuxe67n96/jJ0fCSHhRrAfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331745; c=relaxed/simple;
	bh=HOby9/qAoJGrtmcoZnJA6v0c1AT75VpXSotTEXQ6HKc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epANWVFcyKiqT4QhZSot+9FEaRrhFvXg4OWV+4K5q38iZwA8COBcXsfEl9CHGDXU8AzCKEVPndLYaLXiCU2BzKJ3u5/eNlHauD0zeSlJ19PVNkR4SHaL05SNLLNHILV4DzRRE0jg705uQ188NYy1bXCQ/zIHqcTIOH67ig7Ks1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UGPCEvO+; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UGPCEvO+"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEM7Tr1240879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331727;
	bh=hNY+lSA4LGDF577T5xVfC+u7ea4LZESXu5gOyjCWZx8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UGPCEvO+TgGjuZR3JPdLgeRfzycdeM26ZB0pPryMntMIdCbSK6Tw0QRt3hyA1VAMt
	 +DIei7Qmh32lnQmTjX0DQNSKuFCFgFHBVdqlq9NaBvTOVW6vEstq4amSmSKFfYuioa
	 qjYrJui330U+98eg7bYdR6/MYIwNQQqRElU55Z14=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEM7kB092213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:22:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:22:07 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:22:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEM7W5130099;
	Tue, 22 Apr 2025 09:22:07 -0500
Date: Tue, 22 Apr 2025 09:22:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <lumag@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Message-ID: <20250422142207.2tu7gmhnjercmoa2@basil>
References: <20250421201055.3889680-1-jm@ti.com>
 <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
 <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <54b6880a-bf65-4a79-8f3e-9fa66b6c3550@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 09:15-20250422, Judith Mendez wrote:
> Hi Arnd,
> 
> On 4/22/25 1:37 AM, Arnd Bergmann wrote:
> > On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
> > > Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
> > > across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
> > > default on am64x SK board.
> > > 
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> > 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > The patch seems fine to me, but you should address it at the
> > TI K3 maintainers, so they know they should apply it and forward
> > it to the SoC tree. You have Nishanth and Vignesh in Cc already,
> > so I assume they will pick it up from here, just put them in
> > 'To' instead next time and move Catalin and Will to 'Cc' or
> > leave them off entirely.
> > 
> 
> Will re-spin and fix the to and cc lists, thanks for reviewing!

There is no need to respin, it is already in my queue. Will pick it up
as part of usual process. The above information that Arnd provided is
for future reference.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
