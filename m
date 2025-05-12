Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC911258CC0
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038246; cv=none; b=G/WL0Gm46WWwMct/3yfZzLBCa8WAfuSxO9aXr6NxvqEYR+v5PmVPnQzQ7Qmi8jmCCb1mIuO2TL/vMKtspVXTi2Z7aIrPeX8yMrocQjFRvDBi2QPhbPNdoJSuuOuum3LAQD5k7y7dX3RCO0GfcuCiMltgmQ8C7kK8BzmjigNMD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038246; c=relaxed/simple;
	bh=RVERkuO+Icf4ZI8o+6mMJrekC+d+ItdWOEKd+uRXquY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJjJOEMvGC4ynRhWeQnSMejrA0A6z6EolioNRS61TAgWr4Hivh4RSch64o3oAW/+YaxZrA/gqu0G1TU0euJ8HKuEqQ0XaV/LHxrQYCdZpvXAYjUjNi/JZhe8vvF1zLjvhjkRiGah7QYtt6WiB48IE3xYbQO0LJO/yMY0QmcIEbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mwE317VB; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mwE317VB"
Message-ID: <1a5bc420-c716-4d0b-b767-32adf32f4958@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747038236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TElvHhd7DydXVZlOSat7FJ7I+zBIH483XZd4jOzKuP0=;
	b=mwE317VBw59kffo3mY/wpiIuV3gaWone3np+Bmn8zz9jaFdOrRrVrjsFE5zdUXBzaBJ+5e
	XHyovyO4VXM2KJvMq61v5ircvRKvdL0zeE5mm7Zy/v9aDBJ5lGiif3w+FIdzvkTFiuIbTw
	B5+PRG+PCXj4UVcKFd+HfyC9MrNpoOk=
Date: Mon, 12 May 2025 16:23:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/3] generalize panic_print's dump function to be used
 by other kernel parts
Content-Language: en-US
To: Feng Tang <feng.tang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, llong@redhat.com
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511184617.85d5fe22fde831c1edb8321c@linux-foundation.org>
 <aCFnjmRWwBjgV2Hv@U-2FWC9VHC-2323.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aCFnjmRWwBjgV2Hv@U-2FWC9VHC-2323.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/5/12 11:14, Feng Tang wrote:
> Hi Andrew,
> 
> Thanks for the review!
> 
> On Sun, May 11, 2025 at 06:46:17PM -0700, Andrew Morton wrote:
>> On Sun, 11 May 2025 16:52:51 +0800 Feng Tang <feng.tang@linux.alibaba.com> wrote:
>>
>>> When working on kernel stability issues, panic, task-hung and
>>> software/hardware lockup are frequently met. And to debug them, user
>>> may need lots of system information at that time, like task call stacks,
>>> lock info, memory info etc.
>>>
>>> panic case already has panic_print_sys_info() for this purpose, and has
>>> a 'panic_print' bitmask to control what kinds of information is needed,
>>> which is also helpful to debug other task-hung and lockup cases.
>>>
>>> So this patchset extract the function out, and make it usable for other
>>> cases which also need system info for debugging.
>>>
>>> Locally these have been used in our bug chasing for stablility issues
>>> and was helpful.
>>
>> Truth.  Our responses to panics, oopses, WARNs, BUGs, OOMs etc seem
>> quite poorly organized.  Some effort to clean up (and document!) all of
>> this sounds good.
>>
>> My vote is to permit the display of every scrap of information we can
>> think of in all situations.  And then to permit users to select which of
>> that information is to be displayed under each situation.

Completely agreed. The tricky part is making a global knob that works for
all situations without breaking userspace, but it's a better system-wide
approach ;)

> 
> Good point! Maybe one future todo is to add a gloabl system info dump
> function with ONE global knob for selecting different kinds of information,
> which could be embedded into some cases you mentioned above.

IMHO, for features with their own knobs, we need:
a) The global knob (if enabled) turns on all related feature-level knobs,
b) while still allowing users to manually override individual knobs.

Something like:

If SYS_PRINT_ALL_CPU_BT (global knob) is on, it enables 
hung_task_all_cpu_backtrace
for hung-task situation automatically. But users can still disable it via
hung_task_all_cpu_backtrace.

Anyway, the global knob (when set) controls all feature-level knobs, but
they can override it if explicitly set ;)

Thanks,
Lance

> 
>> As for this patchset - sounds good to me.  For now I'll await input
>> from reviewers.
> 
> Thank you!
> 
> - Feng

