Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A31E98E3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086262; cv=none; b=C3k4P/0FdZH4j6Sa4OSK6mH6NwtJMTbIGZKP9z8yx/LH7uB0WlXga/dSsLBWvut5z90332QFghfw2C/o0lmXe7k+Fq62XJhD/eNaiL7oTrEm+zsQNf1fHk6Fj0gLFj3S1/rnfNJeKZrkfOUKIAOkZzXpZmt8695aaVm7ZI2n8Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086262; c=relaxed/simple;
	bh=HEykssZD5J28YSpYFoII3aTAnMY175rXXJ1SMmYG02A=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mmvrplUugHv+nCE7OcxetN48c6+p/+a1RQoSUXdaWSMTVAmYL+qflLXwWhAxbkE4ddierHh5wqxgjhR9VCfa1FhWwMtMVvmQzxowWj0qYag6hY1rwHPU26B0vRdVTfvN1+olKPYs2FdEsSwrkSPFkBf13cBvHANbiba1IdjRd6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bLY7t5lxnzRk3L;
	Mon, 16 Jun 2025 22:59:54 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 61F9314022F;
	Mon, 16 Jun 2025 23:04:10 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 23:04:10 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Jun 2025 23:04:09 +0800
CC: <yangyicong@hisilicon.com>, James Clark <james.clark@linaro.org>, "Arnaldo
 Carvalho de Melo" <acme@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Ali Saidi <alisaidi@amazon.com>, "Leo
 Yan" <leo.yan@linaro.org>, Will Deacon <will@kernel.org>, James Morse
	<james.morse@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, yangjinqian
	<yangjinqian1@huawei.com>, Douglas Anderson <dianders@chromium.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Adrian Hunter
	<adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>, Jiri Olsa
	<jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, Namhyung Kim
	<namhyung@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
To: Leo Yan <leo.yan@arm.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
Date: Mon, 16 Jun 2025 23:04:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250616130736.GA788469@e132581.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)

On 2025/6/16 21:07, Leo Yan wrote:
> On Mon, Jun 16, 2025 at 09:54:43AM +0000, Shameerali Kolothum Thodi wrote:
> 
> [...]
> 
>>>> -bool is_midr_in_range_list(struct midr_range const *ranges) -{
>>>> -	while (ranges->model)
>>>> -		if (is_midr_in_range(ranges++))
>>>> -			return true;
>>>>   	return false;
>>>>   }
> 
>>> Looks ok to me.
>>>
>>> You could do it with slightly less churn on the kernel side if you keep the
>>> function name and arguments the same there. There's only one usage in
>>> Perf so that one could be renamed and have the midr argument added back
>>> in.
>>
>> +1.
>>
>> Can we use a separate one for perf here, something like below(untested)?
> 
> Thanks for working on this. Agreed.
> 
>> --- a/tools/perf/util/arm-spe.c
>> +++ b/tools/perf/util/arm-spe.c
>> @@ -842,6 +842,18 @@ static void arm_spe__synth_memory_level(const
>> struct arm_spe_record *record,
>>                 data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
>>  }
>>
>> +static bool is_perf_midr_in_range_list(u32 midr, struct midr_range
>> const *ranges)
>> +{
>> +       while (ranges->model) {
>> +               if (midr_is_cpu_model_range(midr, ranges->model,
>> +                                           ranges->rv_min, ranges->rv_max)) {
>> +                       return true;
>> +               }
>> +               ranges++;
>> +       }
>> +       return false;
>> +}
> 
> Maybe we can make it more general. For example, move this function into
> a common header such as tools/perf/arch/arm64/include/cputype.h. Then,
> util/arm-spe.c can include this header.
> 

ok this sounds just like as before except rename the midr check function and modify the
users in perf. will do in below steps:
- move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
  since they're only used in the kernel with errata information
- introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
  is within the ranges. (is_perf_midr_in_range_list() only make sense in
  userspace and is a bit strange to me in a kernel header). maybe reimplement
  is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
  no users in kernel
- copy cputype.h to userspace and make users use new is_target_midr_in_range_list()

this will avoid touching the kernel too much and userspace don't need to implement
a separate function.

Thanks.


