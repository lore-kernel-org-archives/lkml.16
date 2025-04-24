Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBBA27A126
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514736; cv=none; b=E2GeNtJtdg4sAO7qdRX15Q9qC3awtrKoWs7jyf/pVLDxz/ts91pcOLOHEGFDAufLhO46oy4PAVi0GKGwpay2Ojjii2cS/87b/Sajk12JTj6dJdLld5Ak+IOqojgH7QPhuA6ygPvtdmKYD+Nc1mPgUi0HX30iKTOU1kYxLXCoF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514736; c=relaxed/simple;
	bh=Whh7tDmq274tggb5HSy62sCFoWt4WIh2WxgfhdKkZJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2jkGvL43fbc3PQ1wRfv2LAMpWGnNFVISurqgrNkomT3khx5a92kndkjXc2q/aaUvrcat2mZ+LC06WBXU/3AaEmeH0PF1papsiowyZwJqIo0CxKbL8KhxFaNZk1pNlSuC/Wec2TRW+AKJbu/Mxa5uiSAzrw3fivFCv309IlutSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BEDD1063;
	Thu, 24 Apr 2025 10:12:09 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9199A3F66E;
	Thu, 24 Apr 2025 10:12:11 -0700 (PDT)
Message-ID: <6d459f1a-82d4-482a-80bd-9198c7ea09ae@arm.com>
Date: Thu, 24 Apr 2025 18:12:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 21/21] x86,fs/resctrl: Move resctrl.rst to live under
 Documentation/filesystems
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
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-22-james.morse@arm.com>
 <48c4dc43-a963-4d6d-8d66-021e96ce3c58@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <48c4dc43-a963-4d6d-8d66-021e96ce3c58@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 16/04/2025 03:31, Reinette Chatre wrote:
> On 4/11/25 9:42 AM, James Morse wrote:
>> The filesystem code has moved from arch/x86 to fs. Move the documentation
>> too.

>> diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
>> index a9cf8e950b15..32618512a965 100644
>> --- a/Documentation/filesystems/index.rst
>> +++ b/Documentation/filesystems/index.rst
>> @@ -113,6 +113,7 @@ Documentation for filesystem implementations.
>>     qnx6
>>     ramfs-rootfs-initramfs
>>     relay
>> +   resctrl
>>     romfs
>>     smb/index
>>     spufs/index
> 
> I built the htmldocs with this change and the filesystem's index.html is quite big
> making the resctrl parts not be obvious. The title of the documentation is used as
> a heading so the resctrl documentation's heading is "User Interface for Resource
> Control feature" that I think makes a text search hard to use since it may not be
> obvious to users what to search for.
> 
> What do you think of a snippet like below that will include "resctrl" as a term
> in the title that should make the documentation easier to find?

Good point - that is the string people are going to use, and the file names might not be
something they are looking at.


> ---8<---
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 6768fc1fad16..c7949dd44f2f 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -1,9 +1,9 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  .. include:: <isonum.txt>
>  
> -===========================================
> -User Interface for Resource Control feature
> -===========================================
> +=====================================================
> +User Interface for Resource Control feature (resctrl)
> +=====================================================
>  
>  :Copyright: |copy| 2016 Intel Corporation
>  :Authors: - Fenghua Yu <fenghua.yu@intel.com>
> ---8<---

I'll add this as a patch before 17 as its a little more nuanced that fallout from moving code.


>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> similarity index 100%
>> rename from Documentation/arch/x86/resctrl.rst
>> rename to Documentation/filesystems/resctrl.rst
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c30c6fbd1f7a..f7a829898344 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20281,7 +20281,7 @@ M:	Tony Luck <tony.luck@intel.com>
>>  M:	Reinette Chatre <reinette.chatre@intel.com>
>>  L:	linux-kernel@vger.kernel.org
>>  S:	Supported
>> -F:	Documentation/arch/x86/resctrl*
>> +F:	Documentation/filesystems/resctrl.rst
>>  F:	arch/x86/include/asm/resctrl.h
>>  F:	arch/x86/kernel/cpu/resctrl/
>>  F:	fs/resctrl/

> On the topic of MAINTAINERS file ... if this is ok with you I would like to suggest
> that you add your name as reviewer to this area with the goal of you being CCed on
> any patches that touch any of these files so that you could highlight if anything
> impacts Arm.

Yes, that makes sense. I'd like to add Dave Martin too so that one of us is more likely to
be available. I've asked him verbally ...


Thanks,

James
