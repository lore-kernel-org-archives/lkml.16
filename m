Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC5F212FAB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485979; cv=none; b=IJUcjPDOoa0ilQAAqlArr/q41SejtvKD5wJaVVIEtP89vVWov1kFMuRgikZM733KqViI5Ze9kmNxkMVb21tDKrai8vQ7+JXHpA38nSIKvsUnnYyYpnTiSU9+mOpY2ViwiDr3BEmNXa3QIDw7wLUkv+fRii6UhMyDt2FoJ7ks5bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485979; c=relaxed/simple;
	bh=SNvrvkzELPh+J8VelbJdQHAG6JP1J2IlEogM6VwNAKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rF5JhJYyMl62spZs5kJupZ6Xp7iGVMwkeRMyuM4gRLYhAsFZrLpDzUBd/IKBpdFK7sjWEhkwoS7Jl9fg0kvLOkJ1w6cLsgymWysbGzjyTJsyBbq5ly+sjEUC94OIz/2HyATzFnb6StFM9hhR3MDV8F7/B+qGkERAQIXtHsi/OtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F93D106F;
	Thu, 24 Apr 2025 02:12:51 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 367143F66E;
	Thu, 24 Apr 2025 02:12:52 -0700 (PDT)
Message-ID: <f6418779-f656-427b-9d79-48ec94adbcbd@arm.com>
Date: Thu, 24 Apr 2025 10:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/21] x86/resctrl: Rename resctrl_sched_in() to begin
 with "resctrl_arch_"
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-4-james.morse@arm.com>
 <45b8763a-cf8a-49bc-8b9a-0e3c188934b9@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <45b8763a-cf8a-49bc-8b9a-0e3c188934b9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 15/04/2025 22:11, Reinette Chatre wrote:
> On 4/11/25 9:42 AM, James Morse wrote:
>> resctrl_sched_in() loads the architecture specific CPU MSRs with the
>> CLOSID and RMID values. This function was named before resctrl was
>> split to have architecture specific code, and generic filesystem code.
>>
>> This function is obviously architecture specific, but does not begin
>> with 'resctrl_arch_', making it the odd one out in the functions an
>> architecture needs to support to enable resctrl.
>>
>> Rename it for consistency. This is purely cosmetic.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> 
> This is a duplicate "Tested-by" tag for Shaopeng.

Fixed,


Thanks,

James
