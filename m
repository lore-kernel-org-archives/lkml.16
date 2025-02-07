Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4CA1EB191
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943136; cv=none; b=NHqD6fP+u2zL3kmzqawvQwLOhwR8g+4b1E+W4ma7Z1b9CJwZEIc1yvSo+vTDC+VC9R0yBpsiXKQkCu2ichErirOZOmWuXUJGY59jfeN2gXg2VhT+pswAQDOBFSk6YMowAREDTEabkbGA2cTv0ISuIo1zJUaQP9lOaKD7tHtOT2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943136; c=relaxed/simple;
	bh=NBE4wnnAhJY/xxZR4XJH2Ga4b5c7REwd99j7ao0GigY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuA3IWppW4xUOHIRbp9Lq2eUGTfFsPEJFql3bXY2+S7dtFAnOxtRGfeCeEpKzHVvj5JSMpjLS7u4/k7RvuxI7tCE8AROMFHsgQbUIG4DHSXWF5Oce0lW4DEJDdzvlOmERFxwxi82dLiD4IDTE96oXEkitiNqnIiIvatp9MxzsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 512951EA6;
	Fri,  7 Feb 2025 07:45:57 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CAF33F58B;
	Fri,  7 Feb 2025 07:45:29 -0800 (PST)
Message-ID: <97181c6c-9080-4add-bd9c-e35456354661@arm.com>
Date: Fri, 7 Feb 2025 15:45:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/40] x86/resctrl: Add resctrl_arch_ prefix to pseudo
 lock functions
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
 <20241004180347.19985-24-james.morse@arm.com>
 <cba3e0e8-6632-4c92-9afc-f3c10c719bd3@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <cba3e0e8-6632-4c92-9afc-f3c10c719bd3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 23:44, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> resctrl's pseudo lock has some copy-to-cache and measurement
>> functions that are micro-architecture specific. pseudo_lock_fn()
>> is not at all portable. Label these 'resctrl_arch_' so they stay
>> under /arch/x86.
> 
> No mention in changelog why static is also dropped during rename and
> functions moved to a header file while no call sites are changed.

I'll add the following to the commit message:
| To expose these functions to the filesystem code they need an entry
| in a header file, and can't be marked static.


Thanks,

James
