Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A78423F26E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942957; cv=none; b=G+rpnSelkJfmsLqjr11dkGKTZDr+NynVaJU8xNwPOpjQipva+tV4K9i0pDuXmjboNDJ387x0SU9T8w/iNyl3M0UdZLRun1rtHlYeZXLnMX6hiFfgucN1Mu8+enfLUhaZGo9VzwcbRb3sW3TrTEmasbalTOz7XzyIVIuIUJDg8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942957; c=relaxed/simple;
	bh=EPqJ/Xu1B327EeEneLe6K48DaXUhZZQ3HuqXtOj5vYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWVpuYViK+uvcmE1lyy/D/wxXEoPc9/CVu4MIiOfS9nnQaBJa3RJPrPRfR5jbUZoYhBYxmq2+yjVyleuyll8qlk7Q5NbUXYtfx3rfav5iByONAklMdC07Oqix2MhT/dc5o6VnMyxlmqo4WDL8XgpfADoFLFSlkdiStbghHbBZG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 274BE1E32;
	Fri,  7 Feb 2025 07:42:58 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFE003F58B;
	Fri,  7 Feb 2025 07:42:30 -0800 (PST)
Message-ID: <999360e5-8b55-49e1-8615-b92397e5f38d@arm.com>
Date: Fri, 7 Feb 2025 15:42:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/40] x86/resctrl: Wrap resctrl_arch_find_domain()
 around rdt_find_domain()
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
 <20241004180347.19985-13-james.morse@arm.com>
 <8861c2c5-7377-45c3-93be-4be699163fe7@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <8861c2c5-7377-45c3-93be-4be699163fe7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 22:16, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> rdt_find_domain() finds a domain given a resource and a cache-id.
>> It's not quite right for the resctrl arch API as it also returns the
>> position to insert a new domain, which is needed when bringing a
>> domain online in the arch code.
>>
>> Wrap rdt_find_domain() in another function resctrl_arch_find_domain()
>> in order to avoid the unnecessary argument outside the arch code.
> 
> I do not understand the motivation for this split. There does not seem to be
> anything arch specific about rdt_find_domain().

Not arch specific, but behaviour only the arch code could use - returning the position to
insert a new domain, which only the arch code will ever do.


> Why does this need to
> be arch API? Why can resctrl and all archs not use rdt_find_domain()?

Just to remove the extra boiler plate caused by the ability to insert an entry - which the
filesystem never does.

If no-one cares, I'll just move it to a header file as-is.


Thanks,

James
