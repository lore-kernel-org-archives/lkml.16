Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED54728468B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514494; cv=none; b=Z7EHF0bd+wujlyuAbxTJ/w5FQ9OpZxpyR9ONOovtHOt6RbHDs4FniCj+ceqzOzZePye3FCQDAOZccQx47Lh1zY3xMkRqcQD2rEIWCWqZI7QudnHPBVlFiS1ws3z7TILLooQyMJQQO46nh5NpLm3MWuPseBGqeeVOiwQ6bYe+xqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514494; c=relaxed/simple;
	bh=tVlQkasqROqwRz3vMlycb+/C3ehK1UaXvPfLj3rs7T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/59bJ8xT4GkCczsh6EdV6jYD+3q6TzUg/PCbarWFQqiY5sGfJVHcaiUveOAYriDBTh5xwNbvkO3J1ii8mgqopuJWsu1ltX/dajk6o+zquMzWVKV2JwiH4a7GSsupZdx0KMtCdbBzby1UojsntI99RSMwJC5fB3VNLPHF2sbTw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 154321063;
	Thu, 24 Apr 2025 10:08:06 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 250BF3F66E;
	Thu, 24 Apr 2025 10:08:08 -0700 (PDT)
Message-ID: <fe6d8592-7b54-4017-80f0-cc37dd2a0ba5@arm.com>
Date: Thu, 24 Apr 2025 18:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/21] x86/resctrl: Always initialise rid field in
 rdt_resources_all[]
To: "Luck, Tony" <tony.luck@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
 <20250411164229.23413-17-james.morse@arm.com> <Z_6uoqLNCXuc2COl@agluck-desk3>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <Z_6uoqLNCXuc2COl@agluck-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tony,

On 15/04/2025 20:08, Luck, Tony wrote:
> On Fri, Apr 11, 2025 at 04:42:24PM +0000, James Morse wrote:
>> x86 has an array, rdt_resources_all[], of all possible resources.
>> The for-each-resource walkers depend on the rid field of all
>> resources being initialised.
>>
>> If the array ever grows due to another architecture adding a resource
>> type that is not defined on x86, the for-each-resources walkers will
>> loop forever.

> This feels a bit weird. Having rdt_resources_all[] be a "swiss cheese"
> array full of holes where other architectures defined events that aren't
> supported by x86.

Today, there are none of those for x86. The MPAM driver has to do this, but so far the
array is small. I agree if the array becomes large, and no architecture implements
everything then some other structure would be better.


> But it does work, so it can go in like this. But someday I may revisit
> some experimental patches I did a while back that:
> 1) Split the rdt_resource structure into separate "ctrl" and "mon"
> pieces.
> 2) Replaced this array with a pair of lists, one each for enabled
> ctrl and mon resources.
> 3) Changed the resource walkers to use list_for_each*() macros.

Sounds good - this matches what the schema list has become.
The only oddity is the newly proposed "resctrl_online_domains_exist()" that would
sanity-check a resctrl_exit() call - but I don't see a problem walking one list after the
other there.


Thanks,

James
