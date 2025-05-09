Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFE078F40
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746757597; cv=none; b=Url+dnfrFTEf4e5TLGsZfiBO9zG9xydn4SyeZdY8Hlfhh3tFC2iTVyUy7ZY7F8ukgVQVHQXUxbCN50uz7lKDaUCXDTqTEi4d5nLe1+ZuRXsywHQoMeMcB2YRgvuazYAcfNxz/UAhQ8LEphoDq8TOIzxPYPgsAfOLA4dyNGA/1Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746757597; c=relaxed/simple;
	bh=XSonRHjyMxv7QhoD1aF/PcIVM+vHVShBkU3065/kATw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=QaXrKUdOLrZFyF0PikCZ45dn7tQ41BKFH2VYlnHwrc4mMSobjrd5KR6b6DxL438s+o5WFge4OqZgGD0zgKh62z0aO7l5FlOlAugYxSCvhXV/KpgUx8Uj1zUN+DNLkF9h4Eh5jtuehUp1a+q19OTc5p6s2laCPHYV8srnq1rHyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OGEarOQC; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OGEarOQC"
Message-ID: <49efb43a-703e-495a-b076-dd386eb65e81@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746757591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qgax1qxmnnXBJrVyhYvCTzKZkFT82YdUQy2hoO0gB9o=;
	b=OGEarOQChPshmpoobKLvjK+ORbm6S7J3q3S+pMIs923GGw/t4CiEH+kU5fLNvhQv5iWCaT
	OoIHPfNJ1mQ4UazVbpgQBQZgp6cZmr0vhaElMxmYpBoRfUxpZdlVa7F5Pw5PKsNS2jGIg3
	FwqWSHttvHq/XZwlYZexgzVxIt1dOuQ=
Date: Fri, 9 May 2025 10:26:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 0/3] generalize panic_print's dump function to be
Content-Language: en-US
To: mhiramat@kernel.org, llong@redhat.com
References: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
Cc: Feng Tang <feng.tang@linux.alibaba.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Cc Masami and Waiman

On 2025/5/7 18:43, Feng Tang wrote:
> When working on kernel stability issues, panic, task-hung and
> software/hardware lockup are frequently met. And to debug them, user
> may need lots of system information at that time, like task call stacks,
> lock info, memory info etc.
> 
> panic case already has panic_print_sys_info() for this purpose, and has
> a 'panic_print' bitmask to control what kinds of information is needed,
> which is also helpful to debug other task-hung and lockup cases.
> 
> So this patchset extract the function out, and make it usable for other
> cases which also need system info for debugging.
> 
> Locally these have been used in our bug chasing for stablility issues
> and was helpful.
> 
> Please help to review, thanks!
> 
> - Feng
> 
> Feng Tang (3):
>    kernel/panic: generalize panic_print's function to show sys info
>    kernel/hung_task: add option to dump system info when hung task
>      detected
>    kernel/watchdog: add option to dump system info when system is locked
>      up
> 
>   include/linux/panic.h | 12 ++++++++++++
>   kernel/hung_task.c    | 29 +++++++++++++++-------------
>   kernel/panic.c        | 44 +++++++++++++++++++++----------------------
>   kernel/watchdog.c     | 11 +++++++++++
>   4 files changed, 61 insertions(+), 35 deletions(-)
> 

