Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E4226CE1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877959; cv=none; b=LHT8XVl6mT9KEd2XtIQGhLztlo/DoG7N2DOIg1eM+EizdALNzrnCa8Av+cCMFl2TmAWlhFeMRRY91JVQ++OW3psqhTCq1QW8IoS0eL1YAibtMGq1Xw30guhhbN+CqHP8q27j4c6SndoAvSZmwKqZGmd+WPm42L4jl142rghgGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877959; c=relaxed/simple;
	bh=xCWd6ki5GrDlLykqmHH2klMoYvbEqjjVSnjddmgLQs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpcmYJg731EbPMlPK/Bqd+icpF9oLox/Vk8H78tuJ9HMkmx8UweWdtyFQG0VzsJLCldlNLmGnVFYfYORP/CZNtKXryxsVybE2o0pnTOwpTM1nZx7OkR0En9YwrS4YqRyHLzIlVrsTct29k4chNd3oyLIcFbtUGTOq28bJJycG5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s0Mj1sVD; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s0Mj1sVD"
Message-ID: <c11e3511-62b1-4c6a-aadf-7e0939fda9f7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744877952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFGnHY+VW4c1DYMChWjV1PIKxfT0t/ucmTyO7p9u9R4=;
	b=s0Mj1sVDlzq7lr255WnuuMxP8xJqKJf4R+xdCGn8SdUfUBq17aXWB3GvCuLcrRUyHJqvDk
	AVY4ZpxW02/kJ4EgB4Bm0xUd9R6JS06OpXRbX27mBCvJNj7TemHisT3oR/FjVHwCzleGUx
	SEmdsJjlpNu+GK+Id6I0ufB60TWPvjM=
Date: Thu, 17 Apr 2025 16:18:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] tools/drgn: Add script to display page state for a given
 PID and VADDR
To: Omar Sandoval <osandov@osandov.com>
Cc: paulmck@kernel.org, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-toolchains@vger.kernel.org, linux-mm@kvack.org,
 Ye Liu <liuye@kylinos.cn>, linux-debuggers@vger.kernel.org
References: <20250415075024.248232-1-ye.liu@linux.dev>
 <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
 <42f50a48-10da-4739-9e51-f865fbf04bdd@linux.dev>
 <098e977c-55cd-498b-bd36-725333c06210@dorminy.me>
 <7e45afc8-dde0-481a-b0bf-0237f551ebe0@paulmck-laptop>
 <665652ac-2e94-48b4-bf47-32870b823464@linux.dev>
 <aACaf4_molKromnT@telecaster>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <aACaf4_molKromnT@telecaster>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/17 14:06, Omar Sandoval 写道:
> On Thu, Apr 17, 2025 at 09:29:23AM +0800, Ye Liu wrote:
>> 在 2025/4/16 12:02, Paul E. McKenney 写道:
>>> On Tue, Apr 15, 2025 at 11:28:41PM -0400, Sweet Tea Dorminy wrote:
>>>> On 4/15/25 10:46 PM, Ye Liu wrote:
>>>>> 在 2025/4/16 10:14, Andrew Morton 写道:
>>>>>> On Tue, 15 Apr 2025 15:50:24 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>>>>>>
>>>>>>> From: Ye Liu <liuye@kylinos.cn>
>>>>>>>
>>>>>>> Introduces a new drgn script, `show_page_info.py`, which allows users
>>>>>>> to analyze the state of a page given a process ID (PID) and a virtual
>>>>>>> address (VADDR). This can help kernel developers or debuggers easily
>>>>>>> inspect page-related information in a live kernel or vmcore.
>>>>>>>
>>>>>>> The script extracts information such as the page flags, mapping, and
>>>>>>> other metadata relevant to diagnosing memory issues.
>>>>>>>
>>>>>>> Currently, there is no specific maintainer entry for `tools/drgn/` in the
>>>>>>> MAINTAINERS file. Therefore, this patch is sent to the general kernel and
>>>>>>> tools mailing lists for review.
>>>>>> Help.  My copy of linux has no tools/drgn/
>>>>> I noticed that the current upstream Linux tree doesn't contain a
>>>>> `tools/drgn/` directory.
>>>>>
>>>>> I'm interested in contributing a drgn script tool as well.
>>>>> Given that this directory does not yet exist in mainline, where would
>>>>> be the appropriate place to add new drgn scripts? Would it make sense
>>>>> to create a new `tools/drgn/` directory, or is there a preferred
>>>>> location for such debugging scripts?
>>>>>
>>>>> Thanks,
>>>>> Ye
>>>> I believe the traditional thing to do with new drgn scripts is to add them
>>>> to the contrib directory in drgn via pull request:
>>>> https://github.com/osandov/drgn/blob/main/contrib/README.rst
>>> I have an RCU-related drgn script in tools/rcu, so maybe this one should
>>> go in tools/mm.
>>
>> To determine the most appropriate place to submit this script, I looked
>>
>> into existing drgn-based tooling in the kernel tree. Several drgn scripts
>> have already been added under `tools/`, such as:
>>
>> - `tools/sched_ext/scx_show_state.py`
>> - `tools/cgroup/iocost_monitor.py`
>> - `tools/cgroup/memcg_slabinfo.py`
>> - `tools/writeback/wb_monitor.py`
>> - `tools/rcu/rcu-cbs.py`
>> - `tools/workqueue/wq_dump.py`
>> - `tools/workqueue/wq_monitor.py`
>>
>> Given this precedent, I believe it would be reasonable to place
>> `show_page_info.py` under `tools/mm/`, since it's focused on memory
>> subsystem internals and would follow a similar organizational pattern
>> to the above.
>>
>> I'd appreciate any input on whether this is a suitable direction.
>> I'm happy to send the script for review once the location is agreed upon.
>>
>> Thanks,  
>>
>> Ye Liu
> Hi,
>
> The drgn repository and the kernel tools directory are both valid places
> to put drgn scripts, and it's ultimately up to you where you'd prefer to
> put it. Here are some factors to consider, though:
>
> 1. Reusability: if your script is very generic and would be widely
>    useful, the ideal is to add it as a helper to drgn upstream. For
>    scripts that are less generic but could still be useful to many
>    people, I'd personally prefer for them to go into the drgn
>    repository's tools or contrib directories. At the other extreme, if
>    your script is only useful to a handful of developers of a specific
>    subsystem, the kernel tools directory makes more sense.
> 2. Kernel version coupling: there are a couple of options for dealing
>    with kernel changes that require drgn scripts to be updated (e.g.,
>    struct member renames, data structure changes).  Scripts in the
>    kernel tools directory tend to only handle the current version. This
>    is simpler, but it also means that sometimes you can't use features
>    from a new version of the script on old kernels. On the other hand,
>    the drgn repository supports every kernel version that's still
>    meaningfully deployed. This can complicate scripts with
>    version-dependent logic, but it means you can always use the latest
>    and greatest features on any kernel version. I prefer the latter
>    approach, but the choice is yours (except for drgn helpers upstream,
>    which are required to support all kernel versions).
> 3. Maintainership: who wants to own the script? A lot of the current
>    drgn scripts in the kernel tools directory are written and maintained
>    by the relevant subsystem maintainers, so it's a no-brainer for them
>    to own it without any involvement from the drgn project. It's not as
>    obvious for other contributors. If the subsystem maintainer is
>    willing to own a drgn script in the kernel repo, then I won't
>    complain. I'm willing to take just about anything for the drgn
>    repository's contrib directory, and I'm slightly more selective for
>    helpers and tools.
>
> All that being said, your script looks pretty widely useful, so I think
> it'd make sense in the drgn repository's contrib directory (or even the
> tools directory if you want to make it a full-fledged tool with test
> cases, support for all kernel versions, documentation, etc., but contrib
> is fine).
>
Hi Omar,

Thank you so much for the detailed guidance and thoughtful suggestions.
I really appreciate your insights on maintainership, version compatibility,      
and the organization of drgn scripts — that context is super helpful.

Given the nature of this script, which is fairly tightly coupled to the current
kernel’s memory subsystem and primarily intended to assist mm subsystem
developers, I’m leaning toward submitting it under `tools/mm/` in the kernel tree
for now. I believe it aligns with similar precedents like
`tools/rcu/rcu-cbs.py` and `tools/cgroup/memcg_slabinfo.py`.

That said, I’d absolutely be happy to contribute future scripts to the drgn
`contrib/` directory — especially those that are more generic or extended
to support multiple kernel versions. Your feedback has been very helpful
in shaping how I think about future tooling work in this space.

Thanks again for your support and for maintaining drgn!

Thanks,
Ye Liu


