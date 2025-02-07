Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D017D1DFE13
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937780; cv=none; b=CAQ4i45NRkEik0IXUqcrtF5dal6PYCoeaHDvc7MbsXMnHAzXQsot/3six+ZkxnV6H8fmo/mviSGibx4n+ekTh+s4jAb7ob8RK2czvMqKfZbL+jGxVrgwFFf8UNqVQBZaxFDSEo0kWVWUqzyOTZL0GUE7Sk7lXOg0p2gpbL7ea6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937780; c=relaxed/simple;
	bh=8g4n1tf3/TvpTjGndySBZP7/+YRmEDxVP5hKuIcGMWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A4P1XrfN1S06Q2WGphP5B27gIthb9kium/gQ/AlpE5wDothd22kFk022uQQiciF3mQb8AoVOJnsPowZP2KhpziWWtmio3BPKS/1LzUIW+RS5ZYGW/vMEbZuZFxxH+d03lu1GlUomay2CDGkp/G5JYU3/yWz8EsHJILICtGiyEFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H529LbRA; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H529LbRA"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 517EFqeS3015119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2025 08:15:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738937752;
	bh=DX9YVYA5jAptiqiz3ePOledX+7UoRF1EJu9+pXKGhZ4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H529LbRA3dyOtGm1qwWVVsm8+cYmWi8NhQtbcBehTXvYlPKm8skBqWQViaFJ3N07b
	 919psV9wHQXE+ZMUk6t4MesmwxINdOSaKNyJGxKU5cBZIb3muGJIFzwarJ4Xe/IYnF
	 I+o27B8qhmRiNNNtqGQIJeIuhy9gUF5N7p+XtdaE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 517EFqgh021501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Feb 2025 08:15:52 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Feb 2025 08:15:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Feb 2025 08:15:51 -0600
Received: from [10.250.151.109] ([10.250.151.109])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 517EFm2C044276;
	Fri, 7 Feb 2025 08:15:49 -0600
Message-ID: <274838d7-08e5-4e09-b872-47644b96a219@ti.com>
Date: Fri, 7 Feb 2025 19:45:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: ti: k3-ringacc: include platform_device header
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <peter.ujfalusi@gmail.com>,
        <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <srk@ti.com>
References: <20250207065123.879863-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250207065123.879863-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Thanks for fix Siddharth

On 2/7/2025 12:21 PM, Siddharth Vadapalli wrote:
> Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
> users therefore will not include "platform_device.h", resulting in
> compilation warnings for the APIs declared in "k3-ringacc.h" which assume
> inclusion of "platform_device.h" by its users.
>
> Fix the compilation warnings by including the "platform_device" header
> file, which should ideally have been included since commit under Fixes.
>
> Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on commit
> bb066fe812d6 Merge tag 'pci-v6.14-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci
> of Mainline Linux.
>
> Regards,
> Siddharth.
>
>   include/linux/soc/ti/k3-ringacc.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
> index 39b022b92598..6bbb58068048 100644
> --- a/include/linux/soc/ti/k3-ringacc.h
> +++ b/include/linux/soc/ti/k3-ringacc.h
> @@ -8,6 +8,7 @@
>   #ifndef __SOC_TI_K3_RINGACC_API_H_
>   #define __SOC_TI_K3_RINGACC_API_H_
>   
> +#include <linux/platform_device.h>
>   #include <linux/types.h>
>   

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   struct device_node;
