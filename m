Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E2B1AA1F6;
	Tue, 22 Apr 2025 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331119; cv=none; b=Bo1Bje5D3J3KukDEbFw3CmSzcduTx14cXGOrXG0qezWhgFSKxF5D6vqgIRW14PFbi3qzG+8alevzTvRtlDT8ONxOHpeTifEfJwrqi5SckYXXFFRNXx1p0cBysJ5S2GXAiMs/+iHWD5PUshXrySVBCIy9yqxawdnVX9y6igZuscU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331119; c=relaxed/simple;
	bh=FUabY5mwS7kzsV5hxeUPIJlBNWxqP+UBUAF3u28sMhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XuBqEGlER4haGvLrXNjvlfmkiRJWntEPmiCRNkFXrcXawU8fhitdYW1r6Ajl7BFQgbwibKuam/2eoLZrfcbYDPYTXZTGoNK+uwfz9AhfMhFzpevGC476WtEoCwCgOpUYWVyjgpbyq2Gxy4OU8d1MB4+IAoCkA0ZfwaRSUEMVuJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f754SAX9; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f754SAX9"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEBoIB1983572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331110;
	bh=lud/orpWCqDvSqvMG+PNDdoot4w51To9S3IfgDckrw4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=f754SAX9JbOlRl9Zeyr3XxtKdM6x7L5PlBjoBK0OVXs1amsTlP2H6b9jZ/PGZjdSk
	 tpBgGfI26yFVdRid5jfmWMMpJjreVhut2xHXVlrSxNWhtgD72i9+aTDIqQOXQMzsfv
	 tuAYX0XxOs7tqqd+7QfZWphASZjTGTZ+YlsyrUmE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MEBoVY024798
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:11:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:11:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:11:50 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MEBkKf122223;
	Tue, 22 Apr 2025 09:11:47 -0500
Message-ID: <cca0a53c-6ee9-4837-86c6-3e67b8ead5ed@ti.com>
Date: Tue, 22 Apr 2025 19:41:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: ti: k3-j721e: add ranges for PCIe0
 DAT1 and PCIe1 DAT1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
 <20250422120042.3746004-4-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422120042.3746004-4-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Thanks Siddharth

On 4/22/2025 5:30 PM, Siddharth Vadapalli wrote:
> The PCIe0 DAT1 and PCIe1 DAT1 are 4 GB address regions in the 64-bit
> address space of the respective PCIe Controllers. Hence, update the
> ranges to include them.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Link to v1 patch:
> https://lore.kernel.org/r/20250417120407.2646929-4-s-vadapalli@ti.com/
> Changes since v1:
> - Fixed the 'ranges' to set the size as 4 GB instead of the incorrect
>    value of 128 MB.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/k3-j721e.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e.dtsi b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> index a7f2f52f42f7..b6e22c242951 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e.dtsi
> @@ -126,6 +126,8 @@ cbass_main: bus@100000 {
>   			 <0x00 0x10000000 0x00 0x10000000 0x00 0x10000000>, /* PCIe DAT */
>   			 <0x00 0x64800000 0x00 0x64800000 0x00 0x00800000>, /* C71 */
>   			 <0x00 0x6f000000 0x00 0x6f000000 0x00 0x00310000>, /* A72 PERIPHBASE */
> +			 <0x40 0x00000000 0x40 0x00000000 0x01 0x00000000>, /* PCIe0 DAT1 */
> +			 <0x41 0x00000000 0x41 0x00000000 0x01 0x00000000>, /* PCIe1 DAT1 *


Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> /
>   			 <0x44 0x00000000 0x44 0x00000000 0x00 0x08000000>, /* PCIe2 DAT */
>   			 <0x44 0x10000000 0x44 0x10000000 0x00 0x08000000>, /* PCIe3 DAT */
>   			 <0x4d 0x80800000 0x4d 0x80800000 0x00 0x00800000>, /* C66_0 */
