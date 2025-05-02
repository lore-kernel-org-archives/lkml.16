Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE82571D5;
	Fri,  2 May 2025 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204922; cv=none; b=O8oLiXbIxiqfZL+7eScS1XkDW7LRwi2aNBIENZd29+Quf0JUfyMeg63T8Z4/4tl9L6oFw1UWvjxJrhG7iOMnSZMTWl7TSaaLyUoFDVwfzu3kKLws0wFc7h/WIwMfQ4tIZKCujzOaE+HD05+2b69CCsexGKQwdHdwdR75Iiz8ZiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204922; c=relaxed/simple;
	bh=CP3jeZBrPH5Y+i58jheG3yHFPs48exV22tFrSpFI7OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SOXpj2ZJL9FF0jZKCZS3KauyETX0HIhOm6d5VbH0iJSbuqM4Nuxgj6Rk54b62lnqWNfGmuCQoC1wadtuy2KNi3MD1ZO+lcYlsmm/nUEAyt6ETQmAoPpqiUTFwQCG9OFtdlnhkzo4u6JoobBpW1rlxUWbhwvhkrCQSVzWyrrhJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iKKYORQj; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iKKYORQj"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542GtCsn271542
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746204912;
	bh=k6EziXFSk8NbTx/1V+mCgjnx9+FiwrLm4eimV4AStAs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iKKYORQjlCx7jiQqyBxRbkSiU80TGKBlXfqTcdVoGJo5z2VMRvsTXstGgLm8b5PqH
	 /DhhIutb0xc+SUQOloMg8ZvR2oj6OJR258KabN6pP3Ibfc1phfkKMXCDKY6kkwPjwW
	 dPxwDkGCnS2mBJOxSQwKsZpQhiDHnzK5LOi+jgQI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542GtCqs109949
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 11:55:12 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 11:55:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 11:55:12 -0500
Received: from [10.250.35.60] ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542GtBu7060727;
	Fri, 2 May 2025 11:55:11 -0500
Message-ID: <b7fdd7bf-dad9-4b54-9091-f11c89e39c0e@ti.com>
Date: Fri, 2 May 2025 11:55:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: ti: Add pinctrl entries for AM62D2
 family of SoCs
To: Paresh Bhagat <p-bhagat@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>
References: <20250502153915.734932-1-p-bhagat@ti.com>
 <20250502153915.734932-3-p-bhagat@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250502153915.734932-3-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 5/2/25 10:39 AM, Paresh Bhagat wrote:
> Update k3-pinctrl file to include pin definitions for AM62D2 family of
> SoCs.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index cac7cccc1112..0cf57179c974 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -63,6 +63,9 @@
>   #define AM62AX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>   #define AM62AX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>   
> +#define AM62DX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
> +#define AM62DX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
> +

Your board DTS file is including k3-am62a.dtsi, so you are using the AM62A pinmux
controller and should use its macros (AM62AX_*).

Andrew

>   #define AM62PX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>   #define AM62PX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>   
