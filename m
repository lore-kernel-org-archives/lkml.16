Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B82E2EF4
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247470; cv=none; b=aREQ6aQ6TiHGbet/HTmSWjHROXHIBzti8C+ZapDtFZhbiBA3oQmI1EU8XasCwbcMbFjJXucIYannusW9fYkPd9D/4qrRWRFTuiPz4AzFi0gp0Q0lgSz90aV1NxDQKpGhzmRtq70lr5xXLJL2bi3fl6ltnu2mxpoqo0PN5Y+6oCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247470; c=relaxed/simple;
	bh=BFnIK8yylhMzA6GVauXQsDSU4rCOQzl1grzcSe1FH88=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JPt5H+UcOeR/1sOMWd83y+pqF9Mbo8zU8EKaJs1c26TwjlEf7YJLFziyjEJTv7V7alASHwQSy+cGS9AKRO+D/cgaCX4dnD0JzJX6Ph7niB+07Hcl72aTYDYcYmm59oSUCe5oa8tmE0snxnB1I7Eaql2KFU86uA2S2pxWGLB6W4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bMhpY29VLzvZBf;
	Wed, 18 Jun 2025 19:48:53 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 075DE140275;
	Wed, 18 Jun 2025 19:51:05 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 19:51:04 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 19:51:03 +0800
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
 <20250617141810.GB794930@e132581.arm.com> <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
 <20250618112440.GC794930@e132581.arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3dbc1f1b-a325-1525-f9f0-8172033438ec@huawei.com>
Date: Wed, 18 Jun 2025 19:51:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250618112440.GC794930@e132581.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)

On 2025/6/18 19:24, Leo Yan wrote:
> On Wed, Jun 18, 2025 at 09:52:53AM +0100, Mark Rutland wrote:
> 
> [...]
> 
>>>> Other than that, I think that userspace should just maintain its own
>>>> infrastructure, and only pull in things from kernel sources when there's
>>>> a specific reason to. Otherwise we're just creating busywork.
>>>
>>> I agree with the methodology.
>>>
>>> Since Arnaldo is facing build failure when sync headers between kernel
>>> and perf tool, to avoid long latency, let us split the refactoriing
>>> into separate steps.
>>>
>>> As a first step, I think my previous suggestion is valid, we can create a
>>> header tools/perf/arch/arm64/include/cputype.h with below code:
>>>
>>>   #include "../../../../arch/arm64/include/asm/cputype.h"
>>
>> Directly including the kernel header introduces the very fragility that
>> having a copy was intended to avoid. NAK to that.
> 
> My suggestion is not to include the kernel header, nor to modify the
> copy header. :)
> 
> Instead, I suggested creating a new header within the perf tool (under
> perf's arm64 folder) and then include the copy header in tools:
> 
>   tools/arch/arm64/include/asm/cputype.h
> 

sorry for the misunderstood.:(
in this way we still have the divergency in the long term and as a workaround
this works same if we partly update the tools/arch/arm64/include/asm/cputype.h
with only necessary MIDR updates and keep is_midr_in_range_list() unchanged.

>> I've replied to the same effect Yicong's patch [1,2].
>>
>> If we want to share headers between userspace and kernel, we should
>> refactor those headers such that this is safe by construction.
>>
>> There is no need to update the userspace headers just because the kernel
>> headers have changed, so the simple solution in the short term is to
>> suppress the warning from check-headers.sh.
> 
> Sure, makes sense for me.
> 
> @Arnaldo, as Mark suggested, do you want me to send a patch to remove
> cputype.h checking in check-headers.sh or it is fine to keep the warning
> until finish the header refactoring?
> 
> @Yicong, could you confirm if you proceed to refactor the MIDR? thanks!
> 

please feel free to take this over.

> Just note, I searched tools folder and found kselftest also uses the
> cputype.h header. The refactoring should not break the files below.
> 

they shouldn't affected. I did a kselftest build test with my latest patch
and they were not affected.

thanks.

> $ git grep cputype.h
> perf/check-headers.sh:check arch/arm64/include/asm/cputype.h '-I "^#include [<\"]\(asm/\)*sysreg.h"'
> perf/util/arm-spe.c:#include "../../arch/arm64/include/asm/cputype.h"
> testing/selftests/kvm/arm64/psci_test.c:#include <asm/cputype.h>
> testing/selftests/kvm/lib/arm64/vgic.c:#include <asm/cputype.h>
> 
> Thanks,
> Leo
> 
>> [1] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m23dfbea6af559f3765d89b9d8427213588871ffd
>> [2] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m6acbfa00002af8ee791266ea86a58f8f994ed710
>>
>> Mark.
>>
>>>
>>>   static bool is_perf_midr_in_range_list(u32 midr,
>>>                                          struct midr_range const *ranges)
>>>   {
>>>           while (ranges->model) {
>>>                   if (midr_is_cpu_model_range(midr, ranges->model,
>>>                                   ranges->rv_min, ranges->rv_max))
>>>                           return true;
>>>                   ranges++;
>>>           }
>>>
>>>           return false;
>>>   }
>>>
>>> Then, once we can generate a dynamic MIDR header file, we can use that
>>> header and define the midr_range structure specifically in the perf.
>>> In the end, perf can avoid to include kernel's cputype.h.
>>>
>>> If no objection, Yicong, do you mind preparing the patch mentioned
>>> above? Thanks!
>>>
>>> Leo
> 
> .
> 
