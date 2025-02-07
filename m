Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BFE23F298
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943106; cv=none; b=qJCyzflq993coMRIqCpKxCtguclRHAYsDYRGAfn/7uIS8YiG1wGGmPYEuqRp7o+Gsu3mYGQl/1YjyM5U/eD4/PFQ8sJVJ5uRfd8vRRTG6FQN/kXVucOzu0RcScuOsavmbW6g7BBCXKgvQT7u3LJy07QGuFocvgYiAJoRpCePCjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943106; c=relaxed/simple;
	bh=kF1v0IHD3vZBWO3m+vWqStWKVikIwCHnZDyBeBPqqK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFyg2mAgUFbpReAplxYCjZQYhwiEpCeWvPAs3mpR56av/I931pdtr0cBB3TFPbDJK1uXRY5tgal4csoKKbGFh94XMFq6YQQsKJyP2b3VGK3m85KFQkRNK2nSURcrMc6krQ9WBMabt/asNx/3cZ8t4Sy6dzkzL8yvSSYVjkQ1+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 173601E7D;
	Fri,  7 Feb 2025 07:45:27 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64AEF3F58B;
	Fri,  7 Feb 2025 07:45:00 -0800 (PST)
Message-ID: <cd0d072e-2834-4426-938c-56ca87f0f20e@arm.com>
Date: Fri, 7 Feb 2025 15:44:59 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/40] x86/resctrl: Add
 resctrl_arch_is_evt_configurable() to abstract BMEC
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20241004180347.19985-1-james.morse@arm.com>
 <20241004180347.19985-20-james.morse@arm.com>
 <b8506d51-1348-485a-ab29-8347f635f360@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <b8506d51-1348-485a-ab29-8347f635f360@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 23:04, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> When BMEC is supported the resctrl event can be configured in a number
>> of ways. This depends on architecture support. rdt_get_mon_l3_config()
>> modifies the struct mon_evt and calls mbm_config_rftype_init() to create
>> the files that allow the configuration.
>>
>> Splitting this into separate architecture and filesystem parts would
>> require the struct mon_evt and mbm_config_rftype_init() to be exposed.
>>
>> Instead, add resctrl_arch_is_evt_configurable(), and use this from
>> resctrl_mon_resource_init() to initialise struct mon_evt and call
>> mbm_config_rftype_init().
>> resctrl_arch_is_evt_configurable() calls rdt_cpu_has() so it doesn't
>> obviously benefit from being inlined. Putting it in core.c will allow
>> rdt_cpu_has() to eventually become static.
> 
> Why bother with rdt_cpu_has() when there are all those helpers available
> from previous patch?

It's what the existing code does... The helpers in the previous patch are about support
for an event/counter-type, e.g. whether mbm-total exists or not?
resctrl_arch_is_evt_configurable() is to check properties of a particular
event/counter-type, e.g. now you know mbm-total exists - can it be configured?
rdt_cpu_has() is how x86 determines this today.

The rdt_cpu_has() angle in the commit messages is that its a good thing if its all
contained in one file, and as its searching an array of of architecture specific
command-line options, its not going to be easy to inline resctrl_arch_is_evt_configurable().


Yes we could abuse rdt_mon_features to move these existing calls to something exposed as
bits in an unsigned long (and I'll be very glad its hidden behind helpers!) - but this is
done once when the filesystem is mounted, so it doesn't seem worth the churn.


Thanks,

James
