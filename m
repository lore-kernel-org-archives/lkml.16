Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE3523FC7B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943187; cv=none; b=LZe3RvqDnaGB30CM47pOIhHkzK67vDYDsjS5Q1BcFiAkVFTH+nACtQ+zaThOkSaCF3BCnTysiKijHUr2csMmktN/B/UZsQy23wm6aPSIls5gV7mZUTnT/Wk+NvbTALRXP0UiRCj0sSwA80/eGLD0iLEYThPzNSdGmRIm3yK8ji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943187; c=relaxed/simple;
	bh=w5uyEtNGcDZlD4PvfHP4W2wGbdvaKXukjZOuGos7Fv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9HzqV1dGMANiQiB+uSNkp4U1aA1W52TXTBeYBhPKmPoR3YHaWGfNhUflaysfa2ZFFG+Sg8YWEojkeM90OnJnJs5Uz8Z3c+uzqlZYhJHWiaoZLRh2zYTe+xf8P7QhpNplbDo7HPrpvyP681PBjRzBs6czyV1xElMN43rDK293+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E82B51EA6;
	Fri,  7 Feb 2025 07:46:47 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C28293F58B;
	Fri,  7 Feb 2025 07:46:21 -0800 (PST)
Message-ID: <20de5d61-c50d-45b2-bd6e-6a200d250237@arm.com>
Date: Fri, 7 Feb 2025 15:46:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/40] x86/resctrl: Make prefetch_disable_bits belong
 to the arch code
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
 <20241004180347.19985-26-james.morse@arm.com>
 <d174c794-6b7c-4a34-8c1d-b992f6eb7095@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <d174c794-6b7c-4a34-8c1d-b992f6eb7095@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 23/10/2024 23:53, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> prefetch_disable_bits is set by rdtgroup_locksetup_enter() from a
>> value provided by the architecture, but is largely read by other
>> architecture helpers.
>>
>> Instead of exporting this value, make
>> resctrl_arch_get_prefetch_disable_bits() set it so that the other
>> arch-code helpers can use the cached-value.
> 
> The "exporting" term has already caused some confusion. How about:
> 
> Make resctrl_arch_get_prefetch_disable_bits() set prefetch_disable_bits
> so that it can be isolated to arch-code from where the other arch-code
> helpers can use its cached-value.
> 
> (Please feel free to improve.)

I'd cleaned those up - but I'll go with your version as it'll be in the
correct voice.


Thanks,

James
