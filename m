Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384461D54D1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636553; cv=none; b=ITQ5roRb9o/fEQzMzlMhT1RIOCg/HXNwV/ABwqPErBQpZhqB6gJKLGXfDUw9XjRVLy0RmraXt3ZnBmHvwzJ6hw9R23rBk9SGvgbrt6RthhFzHVbuCxcMN6jbVfDbMZoWgb43nGTPfsB5OrmJoCTaMV8eiA4eIs5fociBNVwU2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636553; c=relaxed/simple;
	bh=Quh7ZSW4pkO82Ix/E/iXT5DEOGTKv9umRQf1pTdenhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUSX61JZ+zZn07lisdevSm0DoPzhbjSF9xL8KqSkqlESqUxAvntY8nLs+A0pY6YSEaNEjztlU+K8jVBbQjqSLljnHOR5mNdOJ78d6iHIF29XeLjk7GblSe4uJ1BaDwtr+ztAZtDxQQLNGGQaiQcoppfBg2ziTU4ZdaGBJ0faP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65AE016F2;
	Wed,  7 May 2025 09:49:01 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D860B3F58B;
	Wed,  7 May 2025 09:49:06 -0700 (PDT)
Message-ID: <a3e83058-5a7d-4077-9249-f6d128510f37@arm.com>
Date: Wed, 7 May 2025 17:49:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
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
References: <20250425173809.5529-1-james.morse@arm.com>
 <dd2b3b2b-84bc-490e-a2f4-2096cb08c84c@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <dd2b3b2b-84bc-490e-a2f4-2096cb08c84c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 01/05/2025 18:51, Reinette Chatre wrote:
> On 4/25/25 10:37 AM, James Morse wrote:
>> Changes since v8:
>>  * Added check for closid_init() on monitor only platforms.
>>  * Moved end-marker into array and added default cases.
>>  * Additional patches to move prototpyes between header files.
>>  
>> Changes otherwise noted on each patch.
>>
>> ---
>>
>> Patches 20-26 should be squashed together when merged, taking the commit message
> 
> To make things as simple as possible this needs to be as detailed as possible. For
> example, drop patch 21, *then* squash patches 20, 22 - 26. Having your repo as
> reference is a great help.  

Ah - I thought I'd deleted the python script from the version posted!
I'll tighten up that wording, it should really say which commit message to keep too.

If there is unlikely to be further review for those last patches, the other option is to
do this for v9 - but point people at the earlier version if they want to see the changes
broken out. This saves some work for the tip folk.


>> of patch 21. They are posted like this to allow folk to re-generate patch 21, then
> 
> "patch 21" -> "patch 22"
> 
>> review the differences on top. Not squashing them together would expose a ftrace
>> build warning during bisect. (but who does that!)
>> That would look like this:
>> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v9_final
>>
>> This series is based on rc3, and can be retrieved from:
>> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v9
>>
>> This series renames functions and moves code around. With the
> 
> This series evolved to do more than this ;)

Good point!


Thanks,

James
