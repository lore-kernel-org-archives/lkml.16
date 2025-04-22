Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F191321481B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324064; cv=none; b=XSTeo/59uYIOZv8StMAfTmYdNCQLKH4RoHuLTsYTcwhhUw9/G+sc6t6Gu4N3pJNSZK8niQrDUWBOm2RhxY8By7QZr3z9BTD6Yx4lWCC9PeXLacj8g2v6haQhiTjCZ19W0UT/0ya+3CoVeN1zO2pquPaoKeDIx+jR6sNx9wuC4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324064; c=relaxed/simple;
	bh=g6oO19aYOA611QEIuV2b7I9kC2sJUiJiY2o1X0zVcdo=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=VbrqjwHgZi5wJ++lElGBzm7CnEOY/AfHHlU8TE2XO+nE2g3l8UL7/78lCabMDO743UvNCogQrCACvJ2K83/G0muaq5NbYp4RxEZz79QkA3T4oCVTG+yz2wBBmNRATMM3POqdCGcWtPsOz83/y68q2cawO45fXYiXN83dXM93DgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Zhh3w19Fdz1j5w8;
	Tue, 22 Apr 2025 20:14:04 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 1509B1402CE;
	Tue, 22 Apr 2025 20:14:19 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 22 Apr
 2025 20:14:18 +0800
Message-ID: <68078819.1050006@hisilicon.com>
Date: Tue, 22 Apr 2025 20:14:17 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Sudeep Holla <sudeep.holla@arm.com>, "lihuisong (C)"
	<lihuisong@huawei.com>
CC: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory
 region handling
References: <20250411112539.1149863-1-sudeep.holla@arm.com>	<0e34d68f-c5fb-4fdb-90bf-2ce005c7cf66@huawei.com> <20250415-cream-jackrabbit-of-psychology-57f038@sudeepholla>
In-Reply-To: <20250415-cream-jackrabbit-of-psychology-57f038@sudeepholla>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500014.china.huawei.com (7.221.188.63)

Hi Sudeep,

On 2025/4/15 16:32, Sudeep Holla wrote:
> On Tue, Apr 15, 2025 at 02:26:40PM +0800, lihuisong (C) wrote:
>> +Wei who is Hisilicon SoC maintainer.
>>
>> 在 2025/4/11 19:25, Sudeep Holla 写道:
>>> The PCC driver now handles mapping and unmapping of shared memory
>>> areas as part of pcc_mbox_{request,free}_channel(). Without these before,
>>> this Kunpeng HCCS driver did handling of those mappings like several
>>> other PCC mailbox client drivers.
>>>
>>> There were redundant operations, leading to unnecessary code. Maintaining
>>> the consistency across these driver was harder due to scattered handling
>>> of shmem.
>>>
>>> Just use the mapped shmem and remove all redundant operations from this
>>> driver.
>>>
>>> Cc: Huisong Li <lihuisong@huawei.com>
>>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> Reviewed-by: Huisong Li <lihuisong@huawei.com>
> 
> Thanks and sorry for dropping it assuming you will pick it up.
> The maintainers file just list you.
> 
> Wei,
> 
> Let me know if you want me to repost or if you can pick it from [1]
> 

Applied to the Hisilicon driver tree.
Thanks!

Best Regards,
Wei
