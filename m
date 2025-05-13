Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF83AD24
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155032; cv=none; b=D1BTpQcPer/bJqWEpZG3LWviVDJ9Kb6LO38ika+cZ6jmy70M7Dp1LwRp6B893t01jih7ncctv5xyOZ4wLKTrG9oJr40JuWjFo+iNwKUHe1fVT9ATIkIlmMgw8RX8qJUbEI9m7wD+0IlPy38lFMEy8XBidP6KpO1CQILVlXyUtcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155032; c=relaxed/simple;
	bh=dNP7hJ0cMpm+3n4uWwu6YCiOgJ5xITX+swTae7K4+QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyI8+s/65rflc5l9u0yZv7/A7jkeFqra9I9BkT8kc+9nofFS2TWMgyxF4iz3BYe4puJcKX4ttspIQX7lBERj268SQSOtGjVSD0k2FUczuE0nTJ7JPbPaLRPJMDqDMN7YE64KyIQpLgS8Ki9933G8S6iDzhVKZswemudwdyNqBtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CF881688;
	Tue, 13 May 2025 09:50:19 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFC1D3F673;
	Tue, 13 May 2025 09:50:26 -0700 (PDT)
Message-ID: <f415c9d2-f86f-4fc6-bf73-524f34e4e3aa@arm.com>
Date: Tue, 13 May 2025 17:50:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <OSZPR01MB8798D800E2AEFF81132D856E8B8AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB8798D800E2AEFF81132D856E8B8AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shaopeng Tan,

On 09/05/2025 12:46, Shaopeng Tan (Fujitsu) wrote:
> I ran tools/tests/selftests/resctrl on AMD EPYC 9454P 48-Core Processor, it looks good.
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Thanks for re-testing. The AMD result is useful as I don't have access to one of those.


Thanks,

James
