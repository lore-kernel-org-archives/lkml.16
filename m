Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC241E5018
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299034; cv=none; b=EnIU+Dge3whsLyRMilvfbLCPF24WVVzlRJqnlZWm9xctok8z+etdqL0kd8eqOxoLWwsbwtLR8B5bnVQmyXZUFpiCtGptIN8yROYvvjfaRE+rUNr6dldy2vkrQvLEyhp3EN6UQ73xDldJUI5NaRNCA6uYaMWOJWpSL1SnRs5LTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299034; c=relaxed/simple;
	bh=rLWgDrNtVe38hLs1jON1nOmASB0PtweQ1yIvqpmQbxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsJLW01YYJ4iWUVfKq/Hfa1POXK320ebosldkctueHyBIg4nPGIWIb4Qk84ud+Zu0Fv5c/GPLLQnC6+hamUC9dPmmY+bTjRfuo8HYy6z8eFs3Qb64z8TRMBziKyPDpMcLxNASwULwERcZ54DoMwAbbLrxp/X/YiTKg4N5kjskUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B54C1424;
	Tue, 11 Feb 2025 10:37:33 -0800 (PST)
Received: from [10.1.197.49] (eglon.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 609BE3F58B;
	Tue, 11 Feb 2025 10:37:08 -0800 (PST)
Message-ID: <df73713e-eacf-447e-a8e3-860a1e0606b4@arm.com>
Date: Tue, 11 Feb 2025 18:37:03 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/42] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: Peter Newman <peternewman@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, dfustini@baylibre.com,
 amitsinght@marvell.com, David Hildenbrand <david@redhat.com>,
 Rex Nie <rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250207181823.6378-1-james.morse@arm.com>
 <f600712d-d089-4285-8d04-e12f53a61572@intel.com>
 <CALPaoCjY-3f2tWvBjuaQPfoPhxveWxxCxHqQMn4BEaeBXBa0bA@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CALPaoCjY-3f2tWvBjuaQPfoPhxveWxxCxHqQMn4BEaeBXBa0bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

On 11/02/2025 14:36, Peter Newman wrote:
> On Mon, Feb 10, 2025 at 6:24 PM Reinette Chatre
> <reinette.chatre@intel.com> wrote:
>> I'd like to check in on what you said in [1]. It sounded as though you were
>> planning to look at the assignable counter work from an Arm/MPAM
>> perspective but that work has since progressed (now at V11 [2]) without
>> input from Arm/MPAM perspective. As I understand assignable counters may benefit
>> MPAM and looking close to settled but it is difficult to gain confidence
>> in an interface that may (may not?) be used for MPAM without any feedback
>> from Arm/MPAM. I am trying to prevent future issues when/if MPAM needs to use
>> this new interface and find it confusing that there does not seem to be
>> any input from MPAM side. What am I missing?
> 
> I've looked into monitor assignment on MPAM a little, so I'll share my findings.
> 
> Like with ABMC/BMEC, MPAM's counters can be configured to monitor
> reads, writes, or both, so there are situations where it would be
> useful to be able to assign 2 counters to the same group to be able to
> break down the bandwidth between reads and writes. However, a group's
> two assignment slots are called "local" and "total", so if MPAM's
> resources only support one of the two, then only one counter can be
> assigned to a group.

Wouldn't this be a problem on AMD too?
... specifically 2 counters with different configurations to the same group ...


I suspect it may be simpler to support complex things like that via perf.
I'd dropped that in favour of ABMC, but one platform has come out of the woodwork where
there are only monitors on the L2 - and I don't think we should expose new counter files
via resctrl...


> MPAM does not support any filters that would differentiate between
> traffic serviced by local or remote memory, so it's difficult to see
> an MBM event other than "total" ever being used.

The driver guesses from the topology! If the counters used are on the L3, chances are they
are local to a NUMA node. If they're on the memory controller, its probably total.

That code does need tightening up to check the cache boundaries match the numa boundaries
- but I haven't found a machine to test the bandwidth counters on at all yet.

I don't see how this would change what resctrl exposes - mbm_local and mbm_total already
exist. It's up to the MPAM driver to best match what it has with what it can exposed to
user-space...


> Multiple MSCs
> measuring memory bandwidth at an interconnect and a local memory
> controller could potentially be used to together to infer the "local"
> and "total" counts, but this would require the implementation to
> understand the platform-specific relationship between different types
> of MSCs and somehow present them as a single rdt_resource to resctrl.
> As best as I can tell, the MPAM driver today will choose "local" or
> "total"[1] for what it will present to the FS layer as an
> rdt_resource.

I think 'both' should fall out of that logic. It should keep moving the 'total' bandwidth
counter down the hierarchy until it reaches the memory controller.
I'd expect a platform that looks like this to have bandwidth monitors on the L3 (or
whatever cache matches the NUMA boundary) and bandwidth monitors on the memory controller.

Having two sets of bandwidth counters that measure different things in the same MSC is not
something that can be described by the firmware tables. (I did ask)

I think the logic here would be contained to the MPAM driver...


Thanks,

James

> Based on this, I would prefer the arch/fs refactoring changes go in
> first to give us more time to think about how better to abstract
> counter assignment on a non-RDTlike implementation. I believe finally
> settling on an arch/fs separation for the currently-supported feature
> set would make the counter assignment work clearer for everyone
> involved. Also, my own users have been using an implementation like
> this one successfully for over a year on ARM-based platforms while I'm
> still just experimenting with the usage model of ABMC on AMD hardware,
> so I consider the MPAM work to be more mature and would not like to
> see it delayed on account of ABMC.
