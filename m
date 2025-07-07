Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516629994A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887374; cv=none; b=f0EAYBnGQ1lOMaQ7j0NCtxIATLgJOlnP7DA7qXSbAMpLrCDHY136FBLsZ/1DAt40LVPQ19iuGj8aOVyyA9A4Pj3wb9vuSY/Hm0Bjs1ty24BPBTpa+cRKUzXflwGqlhbAK7vRSxN13uTio7eIPrXUGSe9OhWwRsAdpPbdBgjB/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887374; c=relaxed/simple;
	bh=7SKvBSBl8ewoL2gELoxqBtizcHpPDe7vJ7QfhlYKQBw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iBBY/xeTq7MXj1x3pJGjybvIdsy1DJ0wMzVTLSgZbR5H0gACauUqrIkyPV//pQ0vRDc1Bsxs0BjS1JIawDT4HgK6966oCsBc6tnsC5CYDeLIIx1fOW9dtkw/79ox9gziw9WD16vHLgOhVkBYEECCDcRTcevD9YucSj5725uoMB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLaUdpuW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLaUdpuW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9C5C4CEE3;
	Mon,  7 Jul 2025 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751887373;
	bh=7SKvBSBl8ewoL2gELoxqBtizcHpPDe7vJ7QfhlYKQBw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=VLaUdpuWGl63t3PCbX0rj5c8Gc/xPwxvre3xaZ9PEbb94QtwN9rF8MnLd2hWPznD4
	 mm0BvI8CwRqhcvaobVhY4O9oGgfsx2CScqGtAWtDtrH7E6yfDxbFojoAWISUWp0vai
	 jTf/tdd2AAHBKwMUfXospWrwgu2SgWECFeOHeHYjyQeKlt2KOmpqMgLEY2iCp8txtW
	 zbJqIrCvumQjdhvhDLrT0pixtoptAmaSS+zE79Hlee4X13NUNT12QoLAgQ/NqvuLYL
	 s4BScdlc97AYGluH1Wr5onG0mDlERyj9nZYe7oRLUfVAcTVz9lAHgVsvYaTodVI9+9
	 gznLghs949HgA==
Message-ID: <0b45c2d9-a610-4839-baa6-75041a6c37d5@kernel.org>
Date: Mon, 7 Jul 2025 19:22:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale
 <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>
Subject: Re: [PATCH] erofs: fix to add missing tracepoint in erofs_readahead()
To: Gao Xiang <hsiangkao@linux.alibaba.com>, xiang@kernel.org
References: <20250707084832.2725677-1-chao@kernel.org>
 <c911e159-d216-4b0f-865b-f4524e6f8f0f@linux.alibaba.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <c911e159-d216-4b0f-865b-f4524e6f8f0f@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/7/25 18:17, Gao Xiang wrote:
> 
> 
> On 2025/7/7 16:48, Chao Yu wrote:
>> Commit 771c994ea51f ("erofs: convert all uncompressed cases to iomap")
>> converts to use iomap interface, it removed trace_erofs_readahead()
>> tracepoint in the meantime, let's add it back.
>>
>> Fixes: 771c994ea51f ("erofs: convert all uncompressed cases to iomap")
> 
> Thanks Chao, btw, should we add tracepoint to erofs_read_folio() too?

Xiang, I guess it is useful for debug if we can add it, let me figure out
a patch for that?

Thanks,

> 
> Thanks,
> Gao Xiang
> 
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/erofs/data.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
>> index 6a329c329f43..534ac359976e 100644
>> --- a/fs/erofs/data.c
>> +++ b/fs/erofs/data.c
>> @@ -356,6 +356,9 @@ static int erofs_read_folio(struct file *file, struct folio *folio)
>>     static void erofs_readahead(struct readahead_control *rac)
>>   {
>> +    trace_erofs_readahead(rac->mapping->host, readahead_index(rac),
>> +                    readahead_count(rac), true);
>> +
>>       return iomap_readahead(rac, &erofs_iomap_ops);
>>   }
>>   
> 
> 

