Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EC03D3B8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853387; cv=none; b=stPUBkhxT/Lmei+mXDTwq4ZOhMGaBt8sjeh/6sUUN9CDkFp8cYZNSJ6q5ZOefiy3TqTD1ShkYjxt3nPmla1aiqnmz+mfozN1BHQctiunkcPkaVaOfftmT+D9xuBYM+SafrlfGtZsBh1rcNyMHS1TFTe9D5k81v1e+BQOisSg/Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853387; c=relaxed/simple;
	bh=OSmayF2pnpISa8neO/2EAXmlFcilAJ7icqw/Tfm2+DA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORrWDBLOff59oSXrlK9UsXNADf9+/v7gADZZj62bsAisXAE3dgbMGpeJaoF6yyhQcaWkHziy4puQiEsIMEVuQ68LifAObCMV9UhZNuUJBOFHkUUcu4qqnjZZR9ctfbeAhZcFBaIF0UMXARNIxCBFadyMs1l2zFN2InEni0mzvNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N1cHkyiM; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N1cHkyiM"
Message-ID: <665652ac-2e94-48b4-bf47-32870b823464@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744853372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L0gLeQVBA/1TN3OHnR2dfCZ1PPm9waoie4D5AdMGKf4=;
	b=N1cHkyiMXLR7vMguTWELg9BfjiIi0zSwEppi4YHck13tnQjhoTnwyYaEipVrO+TdbGv13g
	R2SdWUpFNt20o/7l57O5Lsf/22qE2xhmhgCpv89sRVZ1KckOtpXshr/3MLA0t4C5gC9Dei
	Nht/vCEsl6z7QxDjdqTaDnEy2sdrG1Y=
Date: Thu, 17 Apr 2025 09:29:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] tools/drgn: Add script to display page state for a given
 PID and VADDR
To: paulmck@kernel.org, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-toolchains@vger.kernel.org, linux-mm@kvack.org,
 Ye Liu <liuye@kylinos.cn>, Omar Sandoval <osandov@osandov.com>
References: <20250415075024.248232-1-ye.liu@linux.dev>
 <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
 <42f50a48-10da-4739-9e51-f865fbf04bdd@linux.dev>
 <098e977c-55cd-498b-bd36-725333c06210@dorminy.me>
 <7e45afc8-dde0-481a-b0bf-0237f551ebe0@paulmck-laptop>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <7e45afc8-dde0-481a-b0bf-0237f551ebe0@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/16 12:02, Paul E. McKenney 写道:
> On Tue, Apr 15, 2025 at 11:28:41PM -0400, Sweet Tea Dorminy wrote:
>>
>> On 4/15/25 10:46 PM, Ye Liu wrote:
>>> 在 2025/4/16 10:14, Andrew Morton 写道:
>>>> On Tue, 15 Apr 2025 15:50:24 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>>>>
>>>>> From: Ye Liu <liuye@kylinos.cn>
>>>>>
>>>>> Introduces a new drgn script, `show_page_info.py`, which allows users
>>>>> to analyze the state of a page given a process ID (PID) and a virtual
>>>>> address (VADDR). This can help kernel developers or debuggers easily
>>>>> inspect page-related information in a live kernel or vmcore.
>>>>>
>>>>> The script extracts information such as the page flags, mapping, and
>>>>> other metadata relevant to diagnosing memory issues.
>>>>>
>>>>> Currently, there is no specific maintainer entry for `tools/drgn/` in the
>>>>> MAINTAINERS file. Therefore, this patch is sent to the general kernel and
>>>>> tools mailing lists for review.
>>>> Help.  My copy of linux has no tools/drgn/
>>> I noticed that the current upstream Linux tree doesn't contain a
>>> `tools/drgn/` directory.
>>>
>>> I'm interested in contributing a drgn script tool as well.
>>> Given that this directory does not yet exist in mainline, where would
>>> be the appropriate place to add new drgn scripts? Would it make sense
>>> to create a new `tools/drgn/` directory, or is there a preferred
>>> location for such debugging scripts?
>>>
>>> Thanks,
>>> Ye
>> I believe the traditional thing to do with new drgn scripts is to add them
>> to the contrib directory in drgn via pull request:
>> https://github.com/osandov/drgn/blob/main/contrib/README.rst
> I have an RCU-related drgn script in tools/rcu, so maybe this one should
> go in tools/mm.


To determine the most appropriate place to submit this script, I looked

into existing drgn-based tooling in the kernel tree. Several drgn scripts
have already been added under `tools/`, such as:

- `tools/sched_ext/scx_show_state.py`
- `tools/cgroup/iocost_monitor.py`
- `tools/cgroup/memcg_slabinfo.py`
- `tools/writeback/wb_monitor.py`
- `tools/rcu/rcu-cbs.py`
- `tools/workqueue/wq_dump.py`
- `tools/workqueue/wq_monitor.py`

Given this precedent, I believe it would be reasonable to place
`show_page_info.py` under `tools/mm/`, since it's focused on memory
subsystem internals and would follow a similar organizational pattern
to the above.

I'd appreciate any input on whether this is a suitable direction.
I'm happy to send the script for review once the location is agreed upon.

Thanks,  

Ye Liu

                                                                   

