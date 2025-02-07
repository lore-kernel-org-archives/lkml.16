Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE6123C8B3
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943762; cv=none; b=Y44WMabkkh0bqVQx97NHsVJMBadiKxHQZVB2TRAqhwSZIcKANUCmc4iNq0pyA8bmCtlk5mijK6JSkd3DlGXPWok9HITiQmuYGEKf8Uhdf5kjxjDaLA/Ki8yrXqZIeEChNIP7Mml+vWn9ZMTFy2VN5CnEp+bCV9pdNkDBTzhlQB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943762; c=relaxed/simple;
	bh=kRXg5LkgUzZcBF1lrkYw0cvMSEC6hEXG+ngaxDmdiyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/Qz5Vxwg3NssmH1pJDgLboOiskdQZq3Z6LbCRvy7DOWz1w/JrjbD5ShzXgNduohfzUqhW2AZ2rOU+C1mx5+5UvtWRiV/0JQutZuxFuFOKKuPKl/ij/Ga22Tn8zagqr33XSDCsUR3IbLtSADZdGz9ptMQe9bFZAJOWHb4BqM7Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94ECB1E32;
	Fri,  7 Feb 2025 07:56:22 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89F493F58B;
	Fri,  7 Feb 2025 07:55:56 -0800 (PST)
Message-ID: <3477e165-3ad7-4599-8641-10fd30a91b86@arm.com>
Date: Fri, 7 Feb 2025 15:55:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 40/40] x86/resctrl: Add python script to move resctrl
 code to /fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>,
 Tony Luck <tony.luck@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
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
 <20241004180347.19985-41-james.morse@arm.com>
 <ZwW7cWgXJmfW8AQP@agluck-desk3.sc.intel.com>
 <a009c748-dff6-45ae-8a38-fef66561af22@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <a009c748-dff6-45ae-8a38-fef66561af22@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette, Tony,

On 24/10/2024 01:17, Reinette Chatre wrote:
> On 10/8/24 4:08 PM, Tony Luck wrote:
>> On Fri, Oct 04, 2024 at 06:03:47PM +0000, James Morse wrote:
>>> +functions_to_move = [
>>> +	# common
>>> +	"pr_fmt",
>>> +
>>> +	# ctrlmon.c
>>> +	"rdt_parse_data",
>>> +	"(ctrlval_parser_t)",
>>> +	"bw_validate",
>>> +	"parse_bw",
>>> +	"cbm_validate",
>>> +	"parse_cbm",
>>> +	"get_parser",
>>> +	"parse_line",
>>> +	"rdtgroup_parse_resource",
>>> +	"rdtgroup_schemata_write",
>>> +	"show_doms",
>>> +	"rdtgroup_schemata_show",
>>> +	"smp_mon_event_count",
>>> +	"mon_event_read",
>>> +	"rdtgroup_mondata_show",
>>> +
>>> +	# internal.h
>>> +	"MBM_OVERFLOW_INTERVAL",
>>> +	"CQM_LIMBOCHECK_INTERVAL",
>>> +	"cpumask_any_housekeeping",
>>> +	"rdt_fs_context",
>>> +	"rdt_fc2context",
>>> +	"mon_evt",
>>> +	"mon_data_bits",
>>> +	"rmid_read",
>>> +	"resctrl_schema_all",
>>> +	"resctrl_mounted",
>>> +	"rdt_group_type",
>>> +	"rdtgrp_mode",
>>> +	"mongroup",
>>> +	"rdtgroup",
>>> +	"RFTYPE_FLAGS_CPUS_LIST",
>>
>> Something goes wrong with moving the RFTYPE_* defines. A new copy
>> shows up in fs/resctrl/internal.h but the old copy isn't removed from
>> arch/x86/kernel/cpu/resctrl/internal.h
>>
> There seems to be a few more duplicates: RMID_VAL_ERROR, RMID_VAL_UNAVAIL,
> MBM_CNTR_WIDTH_OFFSET_MAX, RDT_DELETED.

I had a follow-up patch to remove those[0] - but I've fixed it in the script now.
These were mostly due to a missing else when spotting macro's that weren't multi-line.

RDT_DELETED was a good laugh - that has a tab after the #define, not a space - I stared at
that for a good while!


> Also please check the trace files after the move and related CFLAGS.
> arch/x86/kernel/cpu/resctrl/monitor_trace.h is just empty and the
> arch/x86/kernel/cpu/resctrl/Makefile still has the "CFLAGS_monitor.o = -I$(src)"
> Also please check fs/resctrl/pseudo_lock_trace.h

I'm afraid this last one is expected. There is a follow-up patch to remove the harmless
boiler plate that gets generated here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot/v6.12-rc1&id=02cd8d6facc3d3a8984b260203d71cba9d2e462c

I could hack in something to delete the files - but it'd need to know something about C in
order to remove the #includes too - otherwise the result can't be built.

If this is a problem, we can ask whoever generates the 'final' version of the patch to
merge that follow-up in.

I'll add a list of these corner cases to the 'commit message'. (we shouldn't commit this!)


The additional corner case is the includes for 'asm' or relative paths that would break
the build on other architectures - but don't matter yet.

I couldn't include those patches in this series as they don't apply without posting the
generated patch ...


Thanks,

James

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot/v6.12-rc1&id=2fada2eb99e2814984bbba9106a9695ef6d4b8b1
