Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C9B1F0990
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744338840; cv=none; b=r93raeetQFCW5NZGZttnyr9i8MBMjxhYXizKcetFFPHB8jNfums2nZ48hW72O6lX++E7E2dj1h800/eceYebCcPHMmzS8f8YfAIaxFqKK41+3P47kfI/KAIzS+q6EvRnCJnsbRCDPOmDJIw2I14oQT+Env/U1JIfIzfNU3q3aAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744338840; c=relaxed/simple;
	bh=tZp/nWpeL3IjPih7amkifGty8bjxnO64DSgmN83xU/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5PYinQF/7AokbP5KQ35KkzFdZ/0LNJsTBycgac7mwPafa8P5UOGCAbyO7++T1IM93N8a34pVtvwy9idR4GOKNCbrX/jdxUnv3xsTrKavdFEnVpxUszCl0RnfZirY/L7VZ2Ny2LO+G2L91iGYYgIJzoQIqxFRR5v8R9IT8lgak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VJzcRa70; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VJzcRa70"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744338834; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=E9bGGUreuEr9WcQwyHdCJYupubC8PqSvroGU5lP73V0=;
	b=VJzcRa70n7ZGccrp2rhtDhj0p/UFDo7WHJYue1Zra1Oqsy8xehin038BlATyTdbpSYiYSPLP0Nb3/r7deEKO6RdbLHWV9kM3Nb1rBtF8efRWR3dYzMztUR8G6Go7lfkoZFYRGwclZsI7zYAHZSQWBwRaObyf/3Qyf1KbQx7wMqI=
Received: from 30.74.129.90(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWRQjjz_1744338516 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Apr 2025 10:28:36 +0800
Message-ID: <3f901a84-9157-4f93-86a4-b56f5c240f78@linux.alibaba.com>
Date: Fri, 11 Apr 2025 10:28:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] erofs: add __packed annotation to union(__le16..)
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
References: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
 <20250409195222.4cadc368@pumpkin>
 <7af3e868-04cb-47b1-a81b-651be3756ec5@linux.alibaba.com>
 <20250410215305.0c919e78@pumpkin>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250410215305.0c919e78@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/4/11 04:53, David Laight wrote:
> On Thu, 10 Apr 2025 07:56:45 +0800
> Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> 
>> Hi David,
>>
>> On 2025/4/10 02:52, David Laight wrote:
>>> On Tue,  8 Apr 2025 19:44:47 +0800
>>> Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
>>>    
>>>> I'm unsure why they aren't 2 bytes in size only in arm-linux-gnueabi.
>>>
>>> IIRC one of the arm ABI aligns structures on 32 bit boundaries.
>>
>> Thanks for your reply, but I'm not sure if it's the issue.
> 
> Twas a guess, the fragment in the patch doesn't look as though it
> will add padding.
> 
> All tests I've tried generate a 2 byte union.
> But there might be something odd about the definition of __le16.
> 
> Or the compiler is actually broken!

Sigh, I'm not sure, it's really a mess but I don't have
more time to look into that.

> 
>>
>>>    
>>>>


..

>>
>> I doesn't work and will report
>>
>> In file included from <command-line>:
>> In function 'erofs_check_ondisk_layout_definitions',
>>       inlined from 'erofs_module_init' at ../fs/erofs/super.c:817:2:
>> ./../include/linux/compiler_types.h:542:38: error: call to '__compiletime_assert_332' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct erofs_inode_compact) != 32
>>     542 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>         |
> 
> Try with just __packed __aligned(2) on the union definition.
> That should overcome whatever brain-damage is causing the larger alignment,

Currently it works fine with `__packed` on the union definition,

do you suggest adding both `__packed` and `__aligned(2)`, may
I ask what's the benefit of `__aligned(2)`?

> 
>>
>>>
>>> I'd add a compile assert (of some form) on the size of the structure.
>>
>> you mean
>>
>> @@ -435,6 +435,7 @@ static inline void erofs_check_ondisk_layout_definitions(void)
>>           };
>>
>>           BUILD_BUG_ON(sizeof(struct erofs_super_block) != 128);
>> +       BUILD_BUG_ON(sizeof(union erofs_inode_i_nb) != 2);
>>           BUILD_BUG_ON(sizeof(struct erofs_inode_compact) != 32);
> 
> I'm sure there is one that you can put in the .h file itself.
> Might have to be Static_assert().
> 
>>
>> ?
>>
>>
>> ./../include/linux/compiler_types.h:542:38: error: call to '__compiletime_assert_332' declared with attribute error: BUILD_BUG_ON failed: sizeof(union erofs_inode_i_nb) != 2
>>     542 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>         |                                      ^
>>
>> That doesn't work too.
> 
> That it the root of the problem.
> I'd check with just a 'short' rather than the __le16.

.. sigh.. I have no more interest on this now due to lack
of time (my current employer doesn't allow me), I think
if there is no better ideas, let's keep the original patch
way to resolve arm compile issues...

Thanks,
Gao Xiang
