Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA722094
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833862; cv=none; b=FGVayUNj4vMP7UWl/KVTjZGPKyR004w/j0DdCYkDgzJzQles7UssV+IbsEgt3JI8PTI6ZZd65j7B/gQZmy85v6hDNntRFZn7LVnfMRy31mLeKu/UapQ4d8+40Lpw6BpzttXOJncqShRT91rUiUd7pNCHJhN/2SYS/yT63CjtM7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833862; c=relaxed/simple;
	bh=3Qe/FdBeOc+QnO+HQahFdAzaCy0xJ/SS+AgmNJWBIbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3c4aPRfA5iq6MCeERO4w7rT8GChckP+ANwsjXgVfrgzB3EoTuDz09I31lj1khpyWBebTM1vHgX+i1w3duRarqNXfbaJpev5b39n7+q/9us0P3xfsRlSwNfL/ZuKpywaiU9dVQNPAeAxFWZcOua/xR8UdUq/voEmGkL2isrCjok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8767C1C0A;
	Fri, 13 Jun 2025 09:57:19 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09E483F66E;
	Fri, 13 Jun 2025 09:57:33 -0700 (PDT)
Message-ID: <c6f9a69e-0c91-408c-97fe-d17b9f938756@arm.com>
Date: Fri, 13 Jun 2025 17:57:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Optimize code in rdt_get_tree()
To: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Martin <dave.martin@arm.com>,
 fenghuay@nvidia.com, peternewman@google.com, Babu Moger
 <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 shameerali.kolothum.thodi@huawei.com, bobo.shaobowang@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Xin Hao
 <xhao@linux.alibaba.com>, baolin.wang@linux.alibaba.com,
 lcherian@marvell.com, amitsinght@marvell.com, Ingo Molnar
 <mingo@redhat.com>, David Hildenbrand <david@redhat.com>,
 H Peter Anvin <hpa@zytor.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Jamie Iles <quic_jiles@quicinc.com>, dfustini@baylibre.com,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250613073733.3642679-1-tan.shaopeng@jp.fujitsu.com>
 <20250613073733.3642679-2-tan.shaopeng@jp.fujitsu.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250613073733.3642679-2-tan.shaopeng@jp.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello!

On 13/06/2025 08:37, Shaopeng Tan wrote:
> schemata_list_destroy() has to be called if schemata_list_create() fails.
> 
> rdt_get_tree() calls schemata_list_destroy() in two different ways: 
> directly if schemata_list_create() itself fails and 
> on the exit path via the out_schemata_free goto label.
> 
> Remove schemata_list_destroy() call on schemata_list_create() failure.
> Use existing out_schemata_free goto label instead.

Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

