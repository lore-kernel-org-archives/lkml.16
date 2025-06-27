Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03D171C9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039132; cv=none; b=To+BTIA0Nx8xgDzYzU/phYvZnUthyzdo6H5T9Z7NmcFKGNCZToEDNAI4Mr+39Tey7e1pTWXOtM2zD1GW8zdMv0W+ZhSSh6WZ+G+YeX+kX/0dNVsnA2jwvbiQkyIIXEsRbhXwsBF5Y4jP4Kg4XMxkGE0sW+smEqz5UQ83gXPAugg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039132; c=relaxed/simple;
	bh=dyrNXeueqsvoBFA6tBhA0LImcM48dwOA1AYjkCUCdew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qatVDvtg5p+VH6o5iYYgW9b02EWdN/M9JDyFUn0c5DF6ESyYlPqkyJTSRc2fXNukGbB/jDar4VkszVlKKHFtwAYqVVaJ3XNGoUPLadgghuDuhUnltnq3U5B8swqv6gmct52Z+1W4ZeVJf1xjgRN7s2YYNjJwofgH9opZ68B+YIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V+HDiJBX; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V+HDiJBX"
Message-ID: <2cee98d1-bdaa-4252-a9a6-15b1bc864ba0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751039128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZRFpxZUqLbnyGQPCOgdy9ogKvNkTdMJpkHmLoXCE7sw=;
	b=V+HDiJBXLTL0WH1AkxHG9YhAVQhuDj2+GdXeZy0A5fCjCrZ9Z7OGImiy9nTZ5amX3VRIuJ
	hkZFSeOxy8ymkbygPQMSGBUhzV15J8fPCHd0aBJzbFN37uOfR4vsC9G6wfRzW+wlm49bZ1
	ogp5jNl6yUrR6OwA8aeY4kj2SWoTM2I=
Date: Fri, 27 Jun 2025 23:45:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_ext()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Lance Yang <ioworker0@gmail.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
 <CABzRoya5n6ChTnjfsoYpQuQ6Gtuu61kpH5fc_iXv2cAQHS-KKg@mail.gmail.com>
 <9eb26777-cdfd-49df-9e1f-e326454ab477@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <9eb26777-cdfd-49df-9e1f-e326454ab477@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/27 23:09, David Hildenbrand wrote:
> On 27.06.25 16:19, Lance Yang wrote:
>> On Fri, Jun 27, 2025 at 7:55 PM David Hildenbrand <david@redhat.com> 
>> wrote:
>>>
>>> Many users (including upcoming ones) don't really need the flags etc,
>>> and can live with a function call.
>>>
>>> So let's provide a basic, non-inlined folio_pte_batch().
>>>
>>> In zap_present_ptes(), where we care about performance, the compiler
>>> already seem to generate a call to a common inlined folio_pte_batch()
>>> variant, shared with fork() code. So calling the new non-inlined variant
>>> should not make a difference.
>>
>> It's always an interesting dance with the compiler when it comes to 
>> inlining,
>> isn't it? We want the speed of 'inline' for critical paths, but also a 
>> compact
>> binary for the common case ...
>>
>> This split is a nice solution to the classic 'inline' vs. code size 
>> dilemma ;p
> 
> Yeah, in particular when we primarily care about optimizing out all the 
> unnecessary checks inside the function, not necessarily also inlining 
> the function call itself.
> 
> If we ever realize we absolute must inline it into a caller, we could 
> turn folio_pte_batch_ext() into an "__always_inline", but for now it 
> does not seem like this is really required from my experiments.

Right, that makes sense. No need to force "__always_inline" prematurely.
