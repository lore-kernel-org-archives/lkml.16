Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1022921ABDA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391085; cv=none; b=D0KA9vDn20M6PLnfy1onCwLQT6J/fWo4PzUfvDKelgHSRFiU+DxNi6M1PBCeosj9I4oT7hFmUi4jWzKeXIKl9ik49c8/Rv2LWJYjApEk0vXtesxd0sYPjlhWekktaYU1bxcpKnYMoW4WhdpIxbWRxGxViDmG8gb04pCbAHi+5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391085; c=relaxed/simple;
	bh=mDAt7tJbnE9JW8s7WAZb5psSs6j+Beg6OdkdET+SAmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TD9NjZQxWNEvv1fEjJnvOTq+aDEhdvmhukGri0RfQ8g21QMUFObBSIiokyU7GURwurU6cYUXeKNEUzm1rWJal074k+AWwFCUNjqAl592kDZUecYfTehAdng0NjAZ8kJ7uVXf8Xewzklkgk7MjMaRV6OZVAe9yjkHHMcD8EHXpjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EF6A169C;
	Fri, 16 May 2025 03:24:30 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA34B3F673;
	Fri, 16 May 2025 03:24:35 -0700 (PDT)
Message-ID: <f1344c85-f7ab-4d9e-8b5e-468985bd403c@arm.com>
Date: Fri, 16 May 2025 11:24:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: "Luck, Tony" <tony.luck@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250513171547.15194-1-james.morse@arm.com>
 <aCOQRW6vAjtdFTTb@agluck-desk3>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aCOQRW6vAjtdFTTb@agluck-desk3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tony,

On 13/05/2025 19:32, Luck, Tony wrote:
> On Tue, May 13, 2025 at 05:15:17PM +0000, James Morse wrote:
>> Changes since v10:
>>  * Changes the online domains check in patch 7 to walk control and monitor domains
>>    separately.
> 
> Built, booted, and lightly tested on regular and SNC systems. All looks
> fine to me.
> 
> Tested-by: Tony Luck <tony.luck@intel.com>


Thanks for testing that!

James

