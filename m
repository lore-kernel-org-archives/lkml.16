Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F4D17A2FB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038871; cv=none; b=foC2X+p79INp5Dqtx+cBfb5Oun8iVumUqO8GB9BAFmjbBQ3G7ogTN7A2lWNg3KM1z2fAGpZd1EPEOoX4hJWRhM8IwQy4kAYy4SEfC8zjF/GP2KNUgi/g/x6VK3JBnleFpo4++lhdFm5IN2hSfjEAwMUHIbJwJA4OHwyTIBm9n2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038871; c=relaxed/simple;
	bh=NzkTbihNw5/mMwQ2vQfgIuDlNTI7oOfN6jzOilGXkHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNK1H8q5626xrLqKaOdUOD05VcDs/Fo1DeolnIfVI/xItWM4xpKFdkacmocMJcPb3QzyRXMn5D4IukZZPnkboKnVwYs0zpWUJFumLSThUWbecE/RniJ8khPGkgm3hN77YUSE6kUxiQ245aEbrldTAz+W5STXn459TiCqS1qKDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A6KB+5Kr; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A6KB+5Kr"
Message-ID: <62c00c9e-1ba4-46dd-a6e0-18e9eee7f93a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751038867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+uh7nr2QVWHptEpAnjQihyKbhrhglo9WQLFj8/DJXyI=;
	b=A6KB+5Kr3BDZXeLJWAdUA+Qbqh46nbflrRZ0WDh1vwtVvuN1LIuR639CI9SJDnT/NYa0YA
	zg25fHaBbEC7iCgO6lx6xBEqL2M1WksjFO/qZp2Ix/RLqTxhlX12ecDrrsLgxbCrdcQGFU
	BoWGakogT5WEytrx6fiUJQXNzTE0Pnc=
Date: Fri, 27 Jun 2025 23:40:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
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
 <20250627115510.3273675-5-david@redhat.com>
 <CABzRoyarK=NnwXis3PUAC_x4YpULUQv_jq-upNpnNQhAPypR1w@mail.gmail.com>
 <ea2d92fe-3083-4aaf-b8ae-1dc950a01d0e@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <ea2d92fe-3083-4aaf-b8ae-1dc950a01d0e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/27 23:11, David Hildenbrand wrote:
> On 27.06.25 16:34, Lance Yang wrote:
>> On Fri, Jun 27, 2025 at 7:55 PM David Hildenbrand <david@redhat.com> 
>> wrote:
>>>
>>> Instead, let's just allow for specifying through flags whether we want
>>> to have bits merged into the original PTE.
>>>
>>> For the madvise() case, simplify by having only a single parameter for
>>> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
>>> dirty bit is not required, but also not harmful. This code is not that
>>> performance critical after all to really force all micro-optimizations.
>>
>> IIRC, this work you've wanted to do for a long time - maybe even a 
>> year ago?
> 
> Heh, maybe, I don't remember.
> 
> For this user here, I realized that we might already check the existence 
> of any_dirty at runtime -- because the compiler will not necessarily 
> create two optimized functions.

Ah, I see! That's a very sharp observation about the compiler's behavior ;)

> 
> So we already have runtime checks ... instead of checking whether 
> any_dirty == NULL, we now simply do the merging (checking for 
> pte_young() instead) now.

Thanks for the lesson!
Lance

