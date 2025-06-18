Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDE9212D97
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229288; cv=none; b=Am3Z/clfgVF1Hh8NP464VyFmTXWqon0B4cc+GfhGFKB/owMtzrN9LWMMZn4RaaM6zdQGgQNFeiv40A+Vvnz2irGpGmat7rf0Pxmz18zwnbUl9Y47CtBytYjaN0Y1xY62HOtLkw/LmTR+DMDIabbkzw5bUzBOwUb1G0B6M29FF40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229288; c=relaxed/simple;
	bh=CHsdhmU/Wt6ZtmEBaroHYLYQI3At4KYiICerBaMh1DY=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QbVnwd9DJtLKZMrougSAAbqXPPM2AS94PFbQIPEMJpM7+8bw6It6joNE6IYiKujbABHxcV4z+Wvxn+Nd6n+sGQQyx2+WgjCF7TPedRsw9QnnWKzAckJWLond6kS1mNg90a59UsdxQF8VKAaa0twX80AIDpQsmPCjs5XY4NXlfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bMZ4n4C3Wz13MbW;
	Wed, 18 Jun 2025 14:45:45 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0AF371401F1;
	Wed, 18 Jun 2025 14:47:57 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 14:47:56 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 14:47:55 +0800
CC: <yangyicong@hisilicon.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>, James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
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
To: Leo Yan <leo.yan@arm.com>, Mark Rutland <mark.rutland@arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com> <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <8c5180e3-9040-a694-3160-023c05976157@huawei.com>
Date: Wed, 18 Jun 2025 14:47:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250617141810.GB794930@e132581.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)

On 2025/6/17 22:18, Leo Yan wrote:
> On Mon, Jun 16, 2025 at 06:47:25PM +0100, Mark Rutland wrote:
> 
> [...]
> 
>>>> ok this sounds just like as before except rename the midr check function and modify the
>>>> users in perf. will do in below steps:
>>>> - move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
>>>>   since they're only used in the kernel with errata information
>>>> - introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
>>>>   is within the ranges. (is_perf_midr_in_range_list() only make sense in
>>>>   userspace and is a bit strange to me in a kernel header). maybe reimplement
>>>>   is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
>>>>   no users in kernel
>>>> - copy cputype.h to userspace and make users use new is_target_midr_in_range_list()
>>>>
>>>> this will avoid touching the kernel too much and userspace don't need to implement
>>>> a separate function.
>>>
>>> My understanding is we don't need to touch anything in kernel side, we
>>> simply add a wrapper in perf tool to call midr_is_cpu_model_range().
>>>
>>> When introduce is_target_midr_in_range_list() in kernel's cputype.h,
>>> if no consumers in kernel use it and only useful for perf tool, then
>>> it is unlikely to be accepted.
>>
>> I think all of this is just working around the problem that
>> asm/cputype.h was never intended to be used in userspace. Likewise with
>> the other headers that we copy into tools/.
>>
>> If there are bits that we *want* to share with tools/, let's factor that
>> out. The actual MIDR values are a good candidate for that -- we can
>> follow the same approach as with sysreg-defs.h.
> 
> Thanks for suggestion, Mark.
> 
> It makes sense to me for extracting MIDR and sharing between kernel and
> tools/. I have created a task for following up the refactoring.
> 
>> Other than that, I think that userspace should just maintain its own
>> infrastructure, and only pull in things from kernel sources when there's
>> a specific reason to. Otherwise we're just creating busywork.
> 
> I agree with the methodology.
> 
> Since Arnaldo is facing build failure when sync headers between kernel
> and perf tool, to avoid long latency, let us split the refactoriing
> into separate steps.
> 
> As a first step, I think my previous suggestion is valid, we can create a
> header tools/perf/arch/arm64/include/cputype.h with below code:
> 
>   #include "../../../../arch/arm64/include/asm/cputype.h"
> 
>   static bool is_perf_midr_in_range_list(u32 midr,
>                                          struct midr_range const *ranges)
>   {
>           while (ranges->model) {
>                   if (midr_is_cpu_model_range(midr, ranges->model,
>                                   ranges->rv_min, ranges->rv_max))
>                           return true;
>                   ranges++;
>           }
> 
>           return false;
>   }
> 
> Then, once we can generate a dynamic MIDR header file, we can use that
> header and define the midr_range structure specifically in the perf.
> In the end, perf can avoid to include kernel's cputype.h.
> 
> If no objection, Yicong, do you mind preparing the patch mentioned
> above? Thanks!
> 

sure. will post today.

Thanks.

