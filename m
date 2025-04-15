Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6312427EC9A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707318; cv=none; b=lDkmWm6ET4PFjHhtmA0tEMRPObZmBamR1v8U6zf8L4MntktGaKLh9ycz1PUap0uI8jC+/ESqxkxCp4FnT1UMr7F8atG9BT9ycwaqy7m0Js4H2Wxrw42cOEQMqw+6NXG8W0t3koKY3SdMADLIMc3N4XqqgnzY7LNtCZ466B68tv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707318; c=relaxed/simple;
	bh=Dycwk5DnvC5JW2XKu9floBP1fDiTtIHxsEGEhVd16E4=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=poy+ANVY5fe5ibeBCmkbJHaDlD0vomK3yNeTWXVkoXOY780jAeCc45Ke2RgJPGYd4qkf1PR94hzZJ+QosZTgGTb/cBxYhvhqKm5ffo/S4oCWXMRn+FNslvMUzMQcPLv5R7fj70tucb+u4eaZEmJSyEVtrpx7/Y5pOZK2iBS3CPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZcHxR2Zkwz1R7fH;
	Tue, 15 Apr 2025 16:53:15 +0800 (CST)
Received: from kwepemd500014.china.huawei.com (unknown [7.221.188.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 82263140143;
	Tue, 15 Apr 2025 16:55:11 +0800 (CST)
Received: from [10.67.121.2] (10.67.121.2) by kwepemd500014.china.huawei.com
 (7.221.188.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Apr
 2025 16:55:11 +0800
Message-ID: <67FE1EEE.1010802@hisilicon.com>
Date: Tue, 15 Apr 2025 16:55:10 +0800
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

It is OK and I will pick that.
Thanks!

Best Regards,
Wei
