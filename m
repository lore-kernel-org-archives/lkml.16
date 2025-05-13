Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BB61DFD96
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154757; cv=none; b=KrcrqHfCC7nW95MU9Bt5JEaklnk0qkKFVy+YuhM1Eob1EyupaWOoamqdOPRgP92ePBbBJyIg/wxZhr1SQHPTViG3gKD9T2OrsALavbi2SYBpQS6O+3CjsslTGG+a681DeZyDUUya6Gphkzf2QPbMXx5MQhm9zuP95j6sRS6wE2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154757; c=relaxed/simple;
	bh=n8HQLytcOAdobhHpnYRDrBIig+xBeeekssVwl+Ekk+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4ddwn/cLY8xtcPaWi5qdurwPzmx4LZGyRu1P7p1VSH4BQgTzLBaj6CwFnBL7YpZ28mJ9I9yTbUbG0HclU161E7rF3qhLCVzlJ6rm2kyVC+GuhbSWMmh6WIvCm6YDqOY0D0ln3hia6adWqo8p0UxcXyK/75oBiCzWRSowsJlgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4F581688;
	Tue, 13 May 2025 09:45:43 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70EB53F673;
	Tue, 13 May 2025 09:45:49 -0700 (PDT)
Message-ID: <1a75e173-8a90-4f57-ba23-40008f445b71@arm.com>
Date: Tue, 13 May 2025 17:45:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/30] x86/resctrl: Fix types in
 resctrl_arch_mon_ctx_{alloc,free}() stubs
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-19-james.morse@arm.com>
 <7c7d8278-d188-4280-a5ef-c8dfcd8387fd@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <7c7d8278-d188-4280-a5ef-c8dfcd8387fd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 08/05/2025 23:45, Reinette Chatre wrote:
> On 5/8/25 10:18 AM, James Morse wrote:
>> resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
>> resctrl_event_id that is al;ready defined in resctrl_types.h to be
> 
> al;ready -> already

Bah - me and my fat fingers!


>> accessible to asm/resctrl.h.
>>
>> The x86 stubs take an int. Fix that.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Tested-by: Babu Moger <babu.moger@amd.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> ---
> 
> With typo fixed:
> 
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>


Thanks!

James
