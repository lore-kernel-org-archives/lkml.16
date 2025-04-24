Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1099F28BAB6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514757; cv=none; b=eNLz8Rc4nB9g+NFQzYUqqv2PmEMAt6aP6/jw35LI4NaVVahwX+9mWkRz6yZXXxzXBftDiut2gYD01JS9mM9398e8Fn0KmCao0b3E0YhyjSgNbYRbW6QqMxl49OwEBUkBg/edL/4JG4hkFfjqZ/rW8nyXgxC0tLYt+TJpvsujiwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514757; c=relaxed/simple;
	bh=hw9wtee+gYP7dgYAyX5G5r5JeT+tyNHMHmgqr3xo1h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/XxB0nfuOqk0sJ3BUJ9K9eEKKR4lFZmh2kf1dML2hYL63U5iaBXFAHsjz4z14hVZpU9zQ/Xe1cE6lcEbm5SqVhId8mJFguDVsAYctM+iH8L+i7xoycsO2QJy8nStLzsmWYTFZJreQMY8EGFStowm9MGZW+qkUjmWAxy7AIGiHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B6E91063;
	Thu, 24 Apr 2025 10:12:30 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A28353F66E;
	Thu, 24 Apr 2025 10:12:30 -0700 (PDT)
Message-ID: <7fae53df-8a1a-44c3-8d2d-81f3e842b55b@arm.com>
Date: Thu, 24 Apr 2025 18:12:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/21] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
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
 <Z_6qASaZHG0QfpD2@agluck-desk3>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <Z_6qASaZHG0QfpD2@agluck-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tony,

On 15/04/2025 19:48, Luck, Tony wrote:
> On Fri, Apr 11, 2025 at 04:42:08PM +0000, James Morse wrote:
>> Changes since v7:
>>  * Switched to Tony's alternative for having a structure behind struct
>>    mon_data.
>>
>> Changes otherwise noted on each patch.
>>
>> N.B, the disk in my machine recently died - so I've re-done the feedback
>> changes multiple times. Appologies if I missed something on the second pass!
>> ---
>> Patch 1 has been posted as a fix that should get picked up independently.
>>
>> Patches X-Y should be squashed together when merged - they are posted like

> X=17 (the big move). Y=20 (last of the cleanups from the move)?

Probably 21 as well as that is mechanical changes as part of the move.


>> this to allow folk to re-generate patch N, then review the differences on
>> top. Not squashing them together would expose a ftrace build warning
>> during bisect. (but who does that!)
>> That would look like this:
>> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v8_final

> This "final" branch is missing the patch that move resctrl.rst into
> Documentation/filesystems.

Right - sorry I cut it in the wrong place. I've have loads of MPAM driver on top...

Hopefully it illustrates my suggestion for reviewing/merging...


>> This series is based on rc1, and can be retrieved from:
>> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v8
>>
>> This series renames functions and moves code around. With the
>> exception of invalid configurations for the configurable-events, there should
>> be no changes in behaviour caused by this series. It is now possible for
>> throttle_mode to report 'undefined', but no known platform will do this.
> 
> As far as I can tell x86/Intel systems are still working as before.
> 
>> The driving pattern is to make things like struct rdtgroup private to resctrl.
>> Features like pseudo-lock aren't going to work on arm64, the ability to disable
>> it at compile time is added.
>>
>> After this, I can start posting the MPAM driver to make use of resctrl on arm64.
>> (What's MPAM? See the cover letter of the first series. [1])
>>
>> As ever - bugs welcome,
> 
> Couldn't find any bugs for you.

:(


Thanks for taking a look!

James
