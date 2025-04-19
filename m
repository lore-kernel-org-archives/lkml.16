Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8621E78F47;
	Sat, 19 Apr 2025 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745073242; cv=none; b=W5GEkivgQmukJUU9a6P+wR62zIPRygS7FkzR5lE+Y6TQE0RFkg7x1HpCul0VOsdCYnMbWNFnpD6hpj6QwNb0YOpUlp716nnRIYWIX/OSTyEy/YmYVSHYMszQ2/bfHbIKeeEqo7vou7UVlhDls7s0EzuWOH+M94wspCXAW+uF1KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745073242; c=relaxed/simple;
	bh=Ha4P1R9eT1HsEdVkTcuCB9B3AC12wmvj0FU1PqsZXek=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PtBIoQ8qjsd9eGHhdTVQoIRWt5K29QzM88UyNiySR33uhTIth2+pk3AMdHaZ9NPMOQGaPZaMAXbrjjGSQ+gOzrfskWUZqOEJwi/nTcVxvbpgqpgR3tvNLjNfOHX2CxaR5ql6CI7yR2UBGlvRGfeBvyhoEPloAF9jomU8tk1v2ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GmVx0L6A; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GmVx0L6A"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEXsRE509844
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745073234;
	bh=Ha4P1R9eT1HsEdVkTcuCB9B3AC12wmvj0FU1PqsZXek=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GmVx0L6A9wMPfMRLsHxEdrj4BsdwDis1J0+LSNf49rjXAtic9fR5A7CdRrZJaeVPg
	 ZBK4/fq5381a/A2+xY7C4onoR7xYDUhkAQP79SAv/7T0cezlk0r0qwV2/ESiSdUej4
	 d6uRBhgXP0sJU6E41U/HLVi0/vsWZLwijK2m52rU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JEXsOZ028388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:33:54 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:33:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:33:54 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JEXo1e115318;
	Sat, 19 Apr 2025 09:33:50 -0500
Message-ID: <a64ebeae-c05b-4228-9714-308d655ca383@ti.com>
Date: Sat, 19 Apr 2025 20:03:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Enable ACSPCIE output for PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250411121307.793646-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411121307.793646-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/11/2025 5:43 PM, Siddharth Vadapalli wrote:
> The PCIe reference clock required by the PCIe Endpoints connected to the
> PCIe connector corresponding to the PCIe1 instance of PCIe on J784S4-EVM
> and J742S2-EVM is driven by the ACSPCIE module. Add the device-tree support
> for enabling the same.

Please check once if you want to enable PCIe ref clock on AM69 as well.

unlike EVM, this clock is terminated on test point.

Thanks

Udit

> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on linux-next tagged next-20250411.
> The v2 patch is at:
> https://lore.kernel.org/r/20241209085157.1203168-1-s-vadapalli@ti.com/
> No changes since v2. The dtbs_check warnings are no longer seen with
> next-20250411 and no changes were required to the patch itself to fix
> the warnings. Hence the patch has been marked with a RESEND tag.
>
> Regards,
> Siddharth.
> [..]
