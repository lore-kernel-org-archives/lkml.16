Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06B128BA85
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596764; cv=none; b=poRjUWoJgXbm45pSPjWBzNYWO2H3g5MbrAFs8M+NhfB5zNFWjgM9awA62rxXY6dnxkted2y6dpsOzBK0PYHWe92ozSO1EC2gECLe2WQ2fCCLa4nP4qun2AjOYbfmFrRgFeW6IQftqOEgqX/O6v1tntbgYyD8lQHbZZAVbBsXOso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596764; c=relaxed/simple;
	bh=mxiK0PjNf8tWGIf47xNImKj8cGQ3MR85tQIHaK5LPPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecVqzPN3DP+33K0JOQ7YUYj+6e2C13RB1zpXdaI3s5dWvPFghPF/Xi2pjMaB7Ueo16T6mjoGcNvIsOCySix/du2fz+OFTbw/yhScxdhhUN3HY71mHhiRmil0mIe3BbvL6WpMXbqGUbNt+wnzsdDqTjpEFLfHtZrI2bemOR00VN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9013F106F;
	Fri, 25 Apr 2025 08:59:16 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 027B13F66E;
	Fri, 25 Apr 2025 08:59:18 -0700 (PDT)
Message-ID: <0f787453-16cb-4904-bda1-e8813c619edc@arm.com>
Date: Fri, 25 Apr 2025 16:59:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/21] x86/resctrl: Remove a newline to avoid confusing
 the code move script
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
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-10-james.morse@arm.com>
 <OSZPR01MB87984AA2D054DD6527BB99DE8B842@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB87984AA2D054DD6527BB99DE8B842@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello!

On 25/04/2025 03:32, Shaopeng Tan (Fujitsu) wrote:
> Hello 
>> The resctrl filesystem code will shortly be moved to /fs/. This involves splitting
>> all the existing files, with some functions remaining under arch/x86, and others
>> moving to fs/resctrl.
>>
>> To make this reproducible, a python script does the heavy lif^W
>> copy-and-paste. This involves some clunky parsing of C code.

> Is "lif^W" a typo?

No - its a bad joke.

Control-W will delete the previous word on the prompt. I'm suggesting the python script is
doing some real work - when it reality its a glorified copy-and-paste.

I'll move this patch later in the series so it can be easily squashed into the move -
there is no need to preserve this kind of history.


Thanks!

James

