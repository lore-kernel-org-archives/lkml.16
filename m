Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797742D028A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956210; cv=none; b=mGlMcdBBNgxq1velywJuHw7VwuD1/AgUmxb/xFOVeb2PewKtYvHKxg0OFGIR9K5LvB8Zmzg7eYMSZabyVFvB3Lm1X6WhpMUgfiAcuozstUa1R8Dx5QU9NJiVLwbGkGqHlyRtTTdg/9Is4reEas8OE087xj7HoYoW4/eBf+Oo4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956210; c=relaxed/simple;
	bh=cQOE7AHANFTWsddjSUf1WysWvD/f3zxtPh7qHtOAEc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foTxTSz3TkeFgosbj6uR2TL8oAMkyKuLqTE/XdWWB6S4oEXfIEdKQnJTA3QMpTLKX9OqPS7x7jSe9UwNrarJMCbMeNZXtd6OjxYtTG8XU9oZPZBOPV0kpBxB5dHdxFEUskpgLSt2HhEmq0iYIirjm9mK9uXkY8lbhESinfkOGGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HY3FP8+L; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HY3FP8+L"
Message-ID: <dbd4b59b-4183-47fe-9287-c0a438df348c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747956196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjBrfRlKkyz6t/lnslzV8zqwSeW+0W/IeRXzNqdfJ0w=;
	b=HY3FP8+LzHey1aSQ6Gwrc3cxCS6clnxqyCjH5imoEisJnTk6G3q9M71JLwguxvnl6ZWuZH
	j0XcwEQMDauRhxB3VfWmcEai8RLZwRak+pTXmhYoJxZnWimVTXtBIwb9zNceeGabqVBt4O
	1hfpysRewHlU4PdtCouE6cgSWgis6ZM=
Date: Thu, 22 May 2025 16:23:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v6] bpf, sockmap: avoid using sk_socket after
 free when sending
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Michal Luczaj <mhal@rbox.co>,
 John Fastabend <john.fastabend@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250516141713.291150-1-jiayuan.chen@linux.dev>
 <3eb50302-d90c-4477-b296-f5f29a7d1eca@linux.dev>
 <2c8ab490e47d44ef5250ac755a5388fe147345d4@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <2c8ab490e47d44ef5250ac755a5388fe147345d4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/22/25 3:56 PM, Jiayuan Chen wrote:
>>>   @@ -656,6 +656,13 @@ static void sk_psock_backlog(struct work_struct *work)
>>>   bool ingress;
>>>   int ret;
>>>   > + /* Increment the psock refcnt to synchronize with close(fd) path in
>>>   + * sock_map_close(), ensuring we wait for backlog thread completion
>>>   + * before sk_socket freed. If refcnt increment fails, it indicates
>>>   + * sock_map_close() completed with sk_socket potentially already freed.
>>>   + */
>>>   + if (!sk_psock_get(psock->sk))
>>
>> This seems to be the first use case to pass "psock->sk" to "sk_psock_get()".
>>
>> I could have missed the sock_map details here. Considering it is racing with sock_map_close() which should also do a sock_put(sk) [?],
>>
>> could you help to explain what makes it safe to access the psock->sk here?
>>

> 
> Using 'sk_psock_get(psock->sk)' in the workqueue is safe because
> sock_map_close() only reduces the reference count of psock to zero, while
> the actual memory release is fully handled by the RCU callback: sk_psock_destroy().
> 
> In sk_psock_destroy(), we first cancel_delayed_work_sync() to wait for the
> workqueue to complete, and then perform sock_put(psock->sk). This means we

Got it. The sock_put(psock->sk) done after a rcu gp is the part that I was missing.

Applied. Thanks.

