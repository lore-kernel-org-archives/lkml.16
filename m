Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D81DF963;
	Tue, 15 Apr 2025 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734878; cv=none; b=opNb0M4ihV1TQfHvYf+U2xrymJnfF8xL7TdOmFrcd5+Ij+LGJ3n/hHVlNvAZp5+DB8hNT2sbf6CpgIshp6QPutE/ilQelssNQMKtX2+uCE9tyiGovVN1vOIKkZfUusqOe5Rv71Fb++pPFGcRElZKc1A/8fu8l3ZOymGlWZDQ2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734878; c=relaxed/simple;
	bh=97gm5W0r3azJQxTc+o1GBu6+7gHPltvUIellyROuN9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DpqJUxil1tqZGhNHTLHBJEnU/rX02/8THI02THuY6EnLfZVpzptMoXkzjd0l3fF75Nu8WJBQS3yQzu/E/434SkOBi91duVIgNCITsSFPydKgSGeNXCQl6BeoFZf1GTdYc0rpGbqD1c4rqf+Alg8IYTiPGH+sn/GZVSy85nYMZdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lDtzA1Fo; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lDtzA1Fo"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53FGYRMV071702
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 11:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744734868;
	bh=iFq+f28rvVPKPSrubIQp1tokt+o0pF9109v9jVjSGIo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lDtzA1FoWC9cSnfpYWCdhYJpszR/YkBTzbinL0HRYQxpLJ50Nt+NbGPXtSmxhT7aB
	 WL4SOmdHi3ysvYV6GgjcdlF84LpYDt3y6dD5VtWrUDfkDo4yYVWQQCK6x+ydv7Jv1F
	 YX/xLyjKxE+sOW0cTc041kx4Fh/2s0ozHt9qkiRI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53FGYRnV057982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 11:34:27 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 11:34:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 11:34:27 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53FGYQOS059307;
	Tue, 15 Apr 2025 11:34:26 -0500
Message-ID: <fe5583ca-d476-4e57-b412-3dd4fe4ff82c@ti.com>
Date: Tue, 15 Apr 2025 11:34:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/11] arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass
 ranges
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-2-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250415153147.1844076-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/15/25 10:31 AM, Judith Mendez wrote:
> Add cbass ranges for ATCM and BTCM on am62x device, without
> these, remoteproc driver fails to probe and attach to the DM
> r5 core and IPC communication is broken.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am62.dtsi | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
> index bfb55ca113239..59f6dff552ed4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
> @@ -86,7 +86,9 @@ cbass_main: bus@f0000 {
>   			 /* Wakeup Domain Range */
>   			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
>   			 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>,
> -			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
> +			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
> +			 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
> +			 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
>   
>   		cbass_mcu: bus@4000000 {
>   			bootph-all;
> @@ -103,7 +105,9 @@ cbass_wakeup: bus@b00000 {
>   			#size-cells = <2>;
>   			ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00002400>, /* VTM */
>   				 <0x00 0x2b000000 0x00 0x2b000000 0x00 0x00300400>, /* Peripheral Window */
> -				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>;
> +				 <0x00 0x43000000 0x00 0x43000000 0x00 0x00020000>,
> +				 <0x00 0x78000000 0x00 0x78000000 0x00 0x00008000>, /* DM R5 ATCM*/
> +				 <0x00 0x78100000 0x00 0x78100000 0x00 0x00008000>; /* DM R5 BTCM*/
>   		};
>   	};
>   
