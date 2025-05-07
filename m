Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FF128C2B5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636565; cv=none; b=k37YX+tNDjJ4vZbVGyAzDllIBrqZQqyvTOVlDMb8lgROr3vo3Ytei9KGRZ162v1vvo9e2o81Y8v3cTBNGwlprkj0ba7Eq+xQZYUxfRBb9AFvqWLm+lm6bLbev1gaRLY2RUbONGAUuHnP+OXS69LRbli7ovcio7ECBBmNGouqJmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636565; c=relaxed/simple;
	bh=xapBwpQd3lw7O24kTMMdKUqbDWhVMZlF9fotjLNppJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCD7qW+gD7s6XOpo0z6z9XeQXTQT2mKiMAJ6yZg6WmdUir62w+OszphXvnYYi95S5DSPoTSG+GpsFlzvvkCXO/Ol+GZUEEvPlHsEnKFZUocbe29VxSFwykvjpvSwdn5ckuBR83AdCDI2eJfKw/+kIGJX0waK4PxZmaapRsN3A0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2ED316F2;
	Wed,  7 May 2025 09:49:12 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C07A3F58B;
	Wed,  7 May 2025 09:49:16 -0700 (PDT)
Message-ID: <4176222a-3583-4a4b-8968-0cabeba6008f@arm.com>
Date: Wed, 7 May 2025 17:49:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: babu.moger@amd.com, Reinette Chatre <reinette.chatre@intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Dave Martin <dave.martin@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com
References: <20250425173809.5529-1-james.morse@arm.com>
 <76b16ef7-2f37-4c30-97af-1d372b7fb251@amd.com>
 <f8bf0815-4013-4485-9ed0-a5b5ffab9f26@intel.com>
 <c88ebda2-8506-466d-9687-07566b7432cb@amd.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <c88ebda2-8506-466d-9687-07566b7432cb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Babu, Reinette,

On 02/05/2025 17:45, Moger, Babu wrote:
> On 5/2/25 11:30, Reinette Chatre wrote:
>> On 5/2/25 9:04 AM, Moger, Babu wrote:
>>>
>>> I retested the patches on a couple of AMD systems, and everything looks good.
>>>
>>> Tested-by: Babu Moger babu.moger@amd.com
> 
> Correction:
> 
> Tested-by: Babu Moger <babu.moger@amd.com>

Thanks for re-testing it!


>> Thank you very much.
>>
>>>
>>> It's very likely that these patches will be merged before my ABMC series [1].
>>>
>>> I'm currently working on v13 of the ABMC series and considering rebasing
>>> it on top of James' v9. That could potentially eliminate one review cycle
>>> during the merge process.
>>>
>>> What are your thoughts on this approach?
>>
>> Thanks for considering this. From my viewpoint this sounds like a good plan.
> 
> Welcome.
> 
>> I do not have insight into James's schedule to support this but from what I
>> can tell this work is close to being ready for inclusion.
> 
> Sure. Lets wait for James or Martin's response.

I've got a v9 to post, rebased on top of the cpumask changes. My only question is whether
to post it with the tail end of patches squashed together - to save Boris having to do it.


Thanks,

James
