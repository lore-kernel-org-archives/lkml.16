Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD98D202984;
	Fri, 18 Apr 2025 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988740; cv=none; b=kChLIxxJboytMCu+eA9pNDnPkacEdg/PPFlp6nmaDNIpSWzALMzXhU9PEZHd6xpaZi93B3qrE5S24u06BQ6OaJ95WX5GCIQ8AaOYJcTL2C2K+D6eNMFHAj8kA5rOw7xP1Y6x0gKtZnPoKMs9DXZdNtR1XL8oXyPwY/qfGBZWLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988740; c=relaxed/simple;
	bh=Ze2QBQ9MkdDO6ExFOzde1E2OwKdFLm6duNYJWzU3h/U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgpfxgR6LA+Bx1egGxveNmBSCkqPNbLvazlap41DY21mki/pTQQM6T0RmCpOV219K/zvNXalHJZXqyreILuVlKCnEOH7AfpKn+1KOOhcUjupNH117m7F56+2+Iw5fG4ccyUzP2Cok9yt86pjki+RkOT2GHsjYtAGQYq+a7SGhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BbWy1GfD; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BbWy1GfD"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IF5TH6326863
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 10:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744988729;
	bh=YvFJvGG4okhAh4ZzeiEtpd9T2TUuyeMrkIjC3ug+0NE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BbWy1GfDHWFrXxEugsYwPHi9Ko8HzFq40FtbD41WlPpl+yzMV8nKfiJz/33eQVFny
	 mPlREOxVlTkMqPZ1yhiI9a3O9clrTl4sBUvbkaIP7K9r+PTNCTWLi9Ecb8m965dA+F
	 LPZxkNth+BqtP6WLoM2+yWpvzZsXx8UTFZl+fTbI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IF5TXY095548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 10:05:29 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 10:05:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 10:05:28 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IF5SmU009009;
	Fri, 18 Apr 2025 10:05:28 -0500
Date: Fri, 18 Apr 2025 10:05:28 -0500
From: Nishanth Menon <nm@ti.com>
To: Chintan Vankar <c-vankar@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <s-vadapalli@ti.com>, <srk@ti.com>
Subject: Re: [PATCH v4 0/2] Add support for CPSW3G port 2 on AM62A7-SK
Message-ID: <20250418150528.ukbbqf7vtoof5fhg@splashed>
References: <20250211182134.1500867-1-c-vankar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250211182134.1500867-1-c-vankar@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 23:51-20250211, Chintan Vankar wrote:
> This series adds support for CPSW3G MAC port 2 with the SK-Ethernet-DC01
> Add-On daughtercard. Also, the missing alias for CPSW3G MAC Port 1 is
> added to the am62a7-sk board file in order to allow kernel to fetch MAC
> address populated by U-Boot for CPSW3G MAC Port 1.
> 
> This series is based on linux-next tagged next-20250210.
> 
> Link to v3:
> https://lore.kernel.org/r/20240429101739.2770090-1-c-vankar@ti.com/
> 
> Changes from v3 to v4:
> - No changes, rebased the series on top of latest linux-next branch.
> 
> Siddharth Vadapalli (2):
>   arm64: dts: ti: k3-am62a7-sk: Add alias for CPSW3G MAC port 1
>   arm64: dts: ti: k3-am62a7: Add overlay for second CPSW3G Port
> 
>  arch/arm64/boot/dts/ti/Makefile               |  3 +
>  .../dts/ti/k3-am62a7-sk-ethernet-dc01.dtso    | 62 +++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-ethernet-dc01.dtso
> 

please re-send this series, series no longer applies.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
