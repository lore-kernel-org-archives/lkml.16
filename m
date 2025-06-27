Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59552E9EC9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042355; cv=none; b=tkY2saCE8YL7eOQOqcmT6hV/mhv+Jl4UdCtWk/71shUfPnKPSkqFrEk/w5BJt4qXsKc7YkCHfHxWlyInWoiDXqbbpKLDtWPji/WxtOX4hXErzG+Dy3L9klWckToE1fdw4oWin5VTP34/Eu8UX+Bb3LwAV43Ihb7dVrdZi0Twefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042355; c=relaxed/simple;
	bh=wmffTCaBtqV93K5UXJPTZSzNkdWhjSSrTLWLsSBr51M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ew1b4zaLzPzvUHyZnAcE8r/YJnx5Ux9KojJYLU6UyapXdKmqEQjm58ry1bUnNqRS0+Nykpdxeheb3Jriu6A9ncS22sDpiLdkZmLoVbG2P7l/xRgmugwqG/nCcr3rTKShgBzYI3/e7RMxYo+T9A2dj5Wdfvgj6hjr3tv2Ry2WTIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDEF91A00;
	Fri, 27 Jun 2025 09:38:55 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8D93F58B;
	Fri, 27 Jun 2025 09:39:10 -0700 (PDT)
Message-ID: <6b50806b-3b0e-442f-a056-166cba039c2d@arm.com>
Date: Fri, 27 Jun 2025 17:39:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>
Cc: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>,
 "'sudeep.holla@arm.com'" <sudeep.holla@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Ben Horgan' <ben.horgan@arm.com>
References: <20250617172132.00002844@huawei.com>
 <OSZPR01MB8798CDE4E2ED8E1B1B40E6608B45A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB8798CDE4E2ED8E1B1B40E6608B45A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shaopeng,

On 27/06/2025 06:54, Shaopeng Tan (Fujitsu) wrote:
>> On Fri, 13 Jun 2025 13:03:55 +0000
>> James Morse <james.morse@arm.com> wrote:
>>> The MPAM driver identifies caches by id for use with resctrl. It needs
>>> to know the cache-id when probe-ing, but the value isn't set in
>>> cacheinfo until the corresponding CPU comes online.
>>>
>>> Expose the code that generates the cache-id. This allows the MPAM
>>> driver to determine the properties of the caches without waiting for
>>> all CPUs to come online.

>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c index
>>> d8e5b4c7156c..6316d80abab8 100644
>>> --- a/drivers/base/cacheinfo.c
>>> +++ b/drivers/base/cacheinfo.c
>>> @@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>> struct device_node *np)
>>>  		id = arch_compact_of_hwid(id);
>>>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {

> Since "id" was compressed into 32bits by the function arch_compact_of_hwid(),
> is this required?

The need for this is clearer in the patch that introduces it - arch_compact_of_hwid() may
not be implemented by all architectures that use OF, and arch_compact_of_hwid() needs to
be able to fail if it can't produce a 32bit version of the hwid. (on arm64 this would
happen if an aff4 was allocated in the RES0 bits of MPIDR_EL1 - which is why the helper
checks those bits are all zero).
This check ensures that if any cache-id is greater than 32 bits, then the platform doesn't
expose any cache-id to user-space, which will let use fix it up in some way without
changing the values user-space saw for the 'other' caches.


Thanks,

James
