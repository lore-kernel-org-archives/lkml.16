Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1D242D82
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377118; cv=none; b=hi+Ji3vMn2fa940ltOiv48cWE/zJ4wXupmBxrLv+38vth4KdZBwj15OIQADYET4LTp+wAQ3WFztKJOyEYoZ+Kg6tHPjRzF/Qbg3Ha+pqUoisE1O69FJkkXuBKAoQuvTQI0qTH/Zq1sR6sJ5QprlQxU4q1nnuWDl2qaDMvmHByp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377118; c=relaxed/simple;
	bh=Cdqq6uYHA0DExUvdil2feGBxPPppW6P4hoP6tp8w+dI=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ff8E13xROkY7Be+s/QKnz52rlKQd0EVxMto9NjFO2lp6tWjjld1YUMEjjCyWRBBgyea8v0kgOU0SY/JK0fVp5d6DdYBhMNJuTxYiqJn683PPav/ZDjrGO10/ZdEKb5lzGSSR1jU7qHlJ1RL3fQoOHtykfRAGmV6zB+guueY2wRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bWkXK4cHKzHrFv;
	Tue,  1 Jul 2025 21:34:25 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 364CF180B63;
	Tue,  1 Jul 2025 21:38:26 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 21:38:25 +0800
Received: from [10.67.120.218] (10.67.120.218) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 21:38:25 +0800
Subject: Re: [PATCH v2 1/3] coresight: tmc: Add missing doc of
 tmc_drvdata::reading
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-2-hejunhao3@huawei.com>
 <20250620125330.00004fa7@huawei.com>
CC: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangyicong@huawei.com>, <prime.zeng@hisilicon.com>
From: hejunhao <hejunhao3@huawei.com>
Message-ID: <c4cede5e-4f0f-73e2-9b3a-96654c19a4a2@huawei.com>
Date: Tue, 1 Jul 2025 21:38:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250620125330.00004fa7@huawei.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn500004.china.huawei.com (7.202.194.145)



On 2025/6/20 19:53, Jonathan Cameron wrote:
> On Fri, 20 Jun 2025 15:54:10 +0800
> Junhao He <hejunhao3@huawei.com> wrote:
>
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> tmc_drvdata::reading is used to indicate whether a reading process
>> is performed through /dev/xyz.tmc. Document it.
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Signed-off-by: Junhao He <hejunhao3@huawei.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 6541a27a018e..3ca0d40c580d 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -220,6 +220,7 @@ struct tmc_resrv_buf {
>>    * @pid:	Process ID of the process that owns the session that is using
>>    *		this component. For example this would be the pid of the Perf
>>    *		process.
>> + * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
> Hi,
>
> Perhaps reword:
>
> "buffer is being read through "/dev/xyz.tmc" entry" or
> "buffer read in progress through "/dev/xyz.tmc" entry"
>
> I've not checked what this actually means - just looking at what you have here.

Will update this. Thanks

Best regards,
Junhao.

>>    * @stop_on_flush: Stop on flush trigger user configuration.
>>    * @buf:	Snapshot of the trace data for ETF/ETB.
>>    * @etr_buf:	details of buffer used in TMC-ETR
> .
>

