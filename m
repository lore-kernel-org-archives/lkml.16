Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493EA28137F;
	Tue,  6 May 2025 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746556535; cv=none; b=uvonJRHa6Mv5yMeAxDZ1QUeDuS8kfZFHkdAVOB6oqcpBh+T4r+fEv0fnfmcTEvryqf/haZE+Xls/F1QKIevk62VXDQ66+GKoxKOFEeqJZHzy+GqNF4sDrEVCHgZRT5jurLgoy5yEg4/Ddqj5qXydtJYPYmE/ONmZBFq73gP2vqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746556535; c=relaxed/simple;
	bh=9u17YCCIPreNdXngHlPkWrj/GkEif4J9eT9/Hf5omX0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQFlIrJsGEqlDeFsRL50Y3lM4fPEYGN7ccZVysJLslAIJWlHT/xaJpCSWSt5TyfDkTFwTPEL7QIcE41fsJ7oi1r0CaxBvqUAS7l6HZIwU2koOm+7+T2puS7DjdmBKkuNBcmgoYIlOEOTjMm4oYEzZZNMa6WSL9W9DUmPQ9++py8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gSusIwAt; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gSusIwAt"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546IZHqQ586234
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 13:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746556517;
	bh=BwXoDzRvS+YsbHtUNjtpCGK6RTqznHYzIL2Zam2ecbI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gSusIwAt5xnnc7Ahc7IxKAhUieiWzQM7E4oyZfp5AyY5uOyOd66JPeIhJyhpCyxLO
	 RuUXsWp4ZicAQ+PBU0x8DXbZVH0caxvLiK/JakyCGW4D8igK0tr9UpdJj1H8HR4Uf2
	 fdI1Y6oLEOJFo8Jn+NlwkNPPhT77PdvfqJA6tb5M=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546IZGZ7075472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 13:35:17 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 13:35:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 13:35:16 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546IZGH4077563;
	Tue, 6 May 2025 13:35:16 -0500
Date: Tue, 6 May 2025 13:35:16 -0500
From: Bryan Brattlof <bb@ti.com>
To: Daniel Schultz <d.schultz@phytec.de>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: ti: k3-am62a: Enable CPU freq
 throttling on thermal alert
Message-ID: <20250506183516.roxspxdjkcoiudfr@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250506114134.3514899-1-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250506114134.3514899-1-d.schultz@phytec.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On May  6, 2025 thus sayeth Daniel Schultz:
> Enable throttling down the CPU frequency when an alert temperature
> threshold (lower than the critical threshold) is reached.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
> Changes in v2:
>   * Increased passive trip point to 115C (10C below crit)
>   * Dropped patch which decreased critical trip point.
> 
>  arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 57 ++++++++++++++++++--
>  arch/arm64/boot/dts/ti/k3-am62a7.dtsi        |  4 ++
>  2 files changed, 58 insertions(+), 3 deletions(-)
> 

Looks good to me :)

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
