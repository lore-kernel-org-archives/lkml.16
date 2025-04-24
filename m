Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81919289343
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514501; cv=none; b=nHGrmX6iAXZ6MD3KWJFym5JqamilxN6wS2SoRPOHOgex+U4P3HA9adDwS728U141ZRhbPzE2aVBsAEi3KsPswUgyF79/mkQ1CqPQtLb+C+Go9XUJV6IZxXufL4TD8N5mnESQdKWluXlbPbWXYOhjP54fq7mqdWVJP4ZErb2QJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514501; c=relaxed/simple;
	bh=Nn3IqT/C0A2osgbr8seSlLToPDtlK0Cg+n9C5ZHDRRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+QRBS1MYzmUIf8/Ntva7D60td1CpQ94qsvTYgmi5XMawnNOe71jG0OxxTYg4E8Vfo1xlwIbjTCmEwi5mAKg62ItNrkdwJXY38yZXeva0EBXhfYU0h209M+TTYjl1jj+IBLl6wyN4Lya6PtwwpRWhGCVS9bbE2dxMOL9/BAca5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAD6F106F;
	Thu, 24 Apr 2025 10:08:11 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ED2C3F66E;
	Thu, 24 Apr 2025 10:08:13 -0700 (PDT)
Message-ID: <76d17d67-9ff7-4547-be14-75ba91ae6044@arm.com>
Date: Thu, 24 Apr 2025 18:08:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/21] x86/resctrl: Always initialise rid field in
 rdt_resources_all[]
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
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-17-james.morse@arm.com>
 <a61c329f-370c-412c-840e-b088d82b9dc3@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <a61c329f-370c-412c-840e-b088d82b9dc3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 16/04/2025 03:14, Reinette Chatre wrote:
> On 4/11/25 9:42 AM, James Morse wrote:
> 
>> @@ -996,7 +992,11 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c)
>>  static int __init resctrl_arch_late_init(void)
>>  {
>>  	struct rdt_resource *r;
>> -	int state, ret;
>> +	int state, ret, i;
>> +
>> +	/* Initialise all rid values for_each_rdt_resource() */
> 
> I find the above difficult to parse. How about:
> 	/* for_each_rdt_resource() requires all rid to be initialised. */
> 
>> +	for (i = 0; i < RDT_NUM_RESOURCES; i++)
>> +		rdt_resources_all[i].r_resctrl.rid = i;
>>  
>>  	/*
>>  	 * Initialize functions(or definitions) that are different

Thanks that's better. I think I removed a 'for' as 'for for_each...' looked like
a duplicate word...


Thanks,

James
