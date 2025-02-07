Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95404240616
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942939; cv=none; b=tl4lB6B25DL7gZG+aimuhLfsth64AfK5OtqOsPjQQ1kXqSKi+UKhFAzUv3msmUgSkeWy9yE0vwxs8irel9StLIsIeO1E226mnEV0NosbGQJte+01W3V3gvvdQ0dwSMi0ueKSuz++VClTdwJWeN4U99kX5yeAKJUL6onwDfqA9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942939; c=relaxed/simple;
	bh=NGt8iaSBVYD3inTXLqEbc/hC0KrYz9nc7QXZCFqibks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgCKgw0nBIMHQ0Og9upf7Pn8RwEbAmLkH46ipUxTa/Niti/MWM+5ojYGBedU2lrnLauAl7qFC4hlSryDi7AmiNRv4tYlU+IcFEyx7rU56VjljiSDuny0esV+yahSupjdNieDcTCAjhYU0Mq9YhGRq1hePGoPIMnD/UVn3Twofy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87287113E;
	Fri,  7 Feb 2025 07:42:39 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54E103F58B;
	Fri,  7 Feb 2025 07:42:13 -0800 (PST)
Message-ID: <c18b0221-5c46-43af-b658-32a859f1354d@arm.com>
Date: Fri, 7 Feb 2025 15:42:10 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/40] x86/resctrl: Generate default_ctrl instead of
 sharing it
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
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
 <20241004180347.19985-9-james.morse@arm.com>
 <3780be3c-07d9-4c36-a1aa-eae505ce8cb0@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <3780be3c-07d9-4c36-a1aa-eae505ce8cb0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 22:15, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> The struct rdt_resource default_ctrl is used by both the architecture
>> code for resetting the hardware controls, and by the filesystem parts
>> of resctrl to report to user-space.
> 
> This is not accurate. The hardware controls may be different from
> what is reported to user-space, for example when MBA software controller
> is active.

That is what I'm trying to say with both paragraphs. This is an odd one when trying
to reduce the duplication in defining properties - its used as the default, except when it
isn't.


>> This means the value has to be shared, but might not match the
>> properties of the control. e.g. a percentage greater than 100.
> 
> Are you referring to software controller here? When would this not
> match properties of control? That this value may not match properties
> of control contradicts first paragraph that this is used to reset the
> control ...

I am - the hardware takes a percentage. Sometimes resctrl blindly reports that to
user-space as the default/maximum, but if mba_sc is in use, user-space is told something
different - but the hardware still takes a percentage. This value is used as the default,
except when it isn't. This is messy to generalise.

I'll replace the commit message with:
-----------%<-----------
The struct rdt_resource default_ctrl is used by both the architecture code for
resetting the hardware controls, and sometimes by the filesystem code as the
default value for the schema, unless the bandwidth software controller is in use.

Having the default exposed by the architecture code causes unnecessary duplication
for each architecture as the default value must be specified, but can be derived
from other schema properties. Now that the maximum bandwidth is explicitly
described, resctrl can derive the default value from the schema format and the
other resource properties.
-----------%<-----------


Thanks,

James
