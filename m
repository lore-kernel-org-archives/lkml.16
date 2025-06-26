Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33F25F960;
	Thu, 26 Jun 2025 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926308; cv=none; b=NdbFI4/mX3NJHmhiWDWnIhwPS4+zT7lyOyEFGZ1AByqCYsqZqst/zDWzKaF1n1wvqBFSz00k7SVnWz6lZu93d+x/iKWDl+Nx0qodwJsftXtGDpngjNC8ZsjjBCBzLrmco14ew/6qShNPqvG03kuBxqqxWZZARODce/PHTL4SpY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926308; c=relaxed/simple;
	bh=k3f252cEAxamxhPkDPBAW94+28LGJ6g9/3f2pCDKQQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FKLrnIXmVD023UKKTKKlW1yX7xog9sBTE9YtK9QURBwYY+49cR14dEsSzFiPEl93rWGdHvNtHzAkBfjS3/fNWVG3ir9yXWSX50bXEzQAKL064ud3YgdEplhQrTNsLhioZ8upQc2wp+G/H1cC6DMQ680aqZsPXw1t+XTDvxlkSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZOP3EYIk; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZOP3EYIk"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55Q8OtI41687514;
	Thu, 26 Jun 2025 03:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750926295;
	bh=zXM74UcI3u4k+JqE0dnEaDmrDYErzhRMmIPodB5MjSc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZOP3EYIkT1Y9S1WA4H37Otn9+Dm5Kb1brjFZW/Ku+jce1kb3TEkoH20dkt3D/iino
	 V/a6XOZv8Q0d5arEs4YqP4isD4wW5JqMZvLFaKmsaal6Jz9AGZd1ExgolExqXgG4kX
	 sILMvtLSv2aU68vxK72sMZ4dcjbpypRa3BiJv0zc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55Q8Otdx3455408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 03:24:55 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 03:24:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 03:24:55 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55Q8Onfa684895;
	Thu, 26 Jun 2025 03:24:50 -0500
Message-ID: <4fc54cf9-6417-42f1-8da4-4c8182f74adf@ti.com>
Date: Thu, 26 Jun 2025 13:54:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCHv4 4/6] arm64: dts: ti: Add support for
 AM62D2-EVM
To: Andrew Lunn <andrew@lunn.ch>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <devarsht@ti.com>,
        "Vadapalli, Siddharth"
	<s-vadapalli@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-5-p-bhagat@ti.com>
 <bf784ce6-aee7-4366-87ab-f0f79f8ef28c@lunn.ch>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <bf784ce6-aee7-4366-87ab-f0f79f8ef28c@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Andrew,

On 24/06/25 13:51, Andrew Lunn wrote:
> > +&cpsw_port1 { > + status = "okay"; > + phy-mode = "rgmii-rxid"; > + 
> phy-handle = <&cpsw3g_phy0>; Does the PCB have extra long RX clock 
> lines? More likely, this should be 'rgmii-id', and you should delete 
> the ti,rx-internal-delay
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uXdgV9dududxisXOFnkjP9PiILYQjt7Q3CKXWbpFj_azwskWiOd4wL5JX89-p35UM2TbsxxlxwNFQJTlPm4wjyyHNTY$> 
>
> ZjQcmQRYFpfptBannerEnd
> > +&cpsw_port1 {
> > +	status = "okay";
> > +	phy-mode = "rgmii-rxid";
> > +	phy-handle = <&cpsw3g_phy0>;
>
> Does the PCB have extra long RX clock lines?
>
> More likely, this should be 'rgmii-id', and you should delete the
> ti,rx-internal-delay in the PHY node, allowing it to insert the 2ns
> delay in the normal way.
>
> 	Andrew

I assume you are referring to the changes in a patch here
https://lore.kernel.org/r/cover.1750756583.git.matthias.schiffer@ew.tq-group.com/

Will fix this in next version. Thanks for the review.

