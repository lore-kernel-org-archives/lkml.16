Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D4A1DA53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785607; cv=none; b=tIwAV8gkQnFw2IPdVncgrvuFQF1VNFCiPtguj8Zv815uT3qfEQma23ruEtl8DrnlAMjpbte8rlPQmTcB+zJTpCFkFOgNB4lsG1m9mJZV9eYj2ZfW9Rnkv4i8+USsRs+C+SHahtVU3vOi76ADyhQ/qimqt1knKHpodCs+Wjd4AMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785607; c=relaxed/simple;
	bh=WORPt9GUwD6aHd//sUFjGuGJVC3VwnulKDGvRND/0cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcN+5P+FXhlCwpQKGeypnsuDq5vuJrYrdjekFWa7EMNLvIqN+fK2Qh4njSi3tC8uEd+7zT/jnSG3y9Og+m0byIvzwJ4FWobFurvB3vWHsvJVNbgnuZDFYAT1QPpDQuG6JpwmpprQg3IYZ3jmqlma2ZSbLdNPqpk1N/PAfeSS3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47DB51515;
	Fri,  4 Apr 2025 09:53:26 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55F9A3F63F;
	Fri,  4 Apr 2025 09:53:20 -0700 (PDT)
Message-ID: <9134dd8f-25fb-4a76-aff8-be2f9bd212c2@arm.com>
Date: Fri, 4 Apr 2025 17:53:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 37/49] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
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
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250228195913.24895-1-james.morse@arm.com>
 <20250228195913.24895-38-james.morse@arm.com>
 <e1816cbf-e2a7-44cf-92f9-bbd24d9e264b@intel.com>
 <a54fe3e7-19cb-4f84-9189-f0e3853e98fe@arm.com>
 <9e47d037-a47c-4869-8ac1-2ab151608b08@intel.com>
 <Z-H-VesKknnUMmpb@agluck-desk3> <Z-7enNN7bxHmf8T6@agluck-desk3>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <Z-7enNN7bxHmf8T6@agluck-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tony,

On 03/04/2025 20:16, Luck, Tony wrote:
> On Mon, Mar 24, 2025 at 05:52:37PM -0700, Luck, Tony wrote:
>> Is this all overly complex trying to re-use the "priv" fields from
>> the default resctrl group?

I was trying to keep the kernfs hierarchy as the source of truth for this, and
keep the extra memory allocated to a minimum.


>> Would it be easier to just keep a list
>> of each combinations of region id, domain id, sum, and event id that have
>> already been allocated and re-use existing ones, or add to the list
>> for new ones.

I agree this is much simpler!


>> Scanning this list may be less overhead that all the
>> sprintf() and kernfs_find_and_get() searches.


> I played around with the simplification some more and tested on both
> normal and SNC systems. Below is a patch against:
>  
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v7
> 
> Note that this is *after* the move to fs/resctrl as I was too chicken
> to try applying this before the move and then re-run the script to
> move things. But if you take this suggestion, just mash it into your
> "Expand the width of dom_id by replacing mon_data_bits" patch.
> Maybe give me Co-developed-by credit, but that's not important.

Done!


> Note that your expansion of mon_data is going to be very useful going
> forward.  I want to add extra information to struct mon_data:
> 
> 1) Flag to note that an event counter can be read from any CPU, not
> just the ones in the domain specified by the mon_data/mon_L3_XX/*
> file.

Awesome - (some) arm64 and risc-v have this too.


> 2) Type field to specify how to display the value of each counter
> (since I want floating point instead of integer for the energy
> counters).


Thanks,

James
