Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB6E1C68F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747112608; cv=none; b=ZBu68m6JsBghQjNJjK3UgOdetcUoc0PQeDS+HHB3QVxm4QYd2cyMDlKvI6M/mwp1KZG8VxofDW9APtA36DslKQhV/FcZegEjTWsltPBzVF9hXCqI72c1VchidlBrURZH+SOP33oxa7z1gN1LEDjK5lPQvu+J01lB/C04rqPl8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747112608; c=relaxed/simple;
	bh=GG4pSUeRc+j7M2ju8LP4v17FsN5HHWSIcpgaET7KsCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5O/c6Yf1GXnuX8kSpZNjoCfNv80Sg9aWuI8UqAuGO7U/sDR+bAQxXC8WUAi8k6u2liut1TBm/MrLG0zuybrEjiaNsd+dI7DLknKu7qr8Fd8uXf4woyxBmkLbsjtSo8dOcCjieNi8+9xLdZhTCHUNBEw6+gMpzcvVEajpf6+W6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=L3zmzpwn; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="L3zmzpwn"
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54D52ten2131217
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 12 May 2025 22:02:56 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54D52ten2131217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747112576;
	bh=p4NAhDN/gA8YeKjh33O+Bw6Ab+OOn6FOkCBm6hvQv5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L3zmzpwnajJrNvFtvQusWWh5Cu2eA1eifxplyGXnvmJ0mAB+vifCJL0ZmcZXTRuH4
	 N0z/2dc5oKissFP2zZxRd5OOqBBHb9gq1mQ0d/4Hjq6t77naUUKe9e5yAZ+snElLBP
	 b20X3azKfC+KpkW3j4VCh1FzVbuZd2OUj6pRI7MdU2sSVqwghuuB+LL1DoCjCIgSyK
	 pNYbgdRgrCLpSZo0vlxnE6wNHvOoszGAudDEKweg8RHI5ema2sS8CkDIiOKqWlOQFo
	 mWkwT+zvIsybrGoVA5Rcg0D65s8dzL7E8ZTLeu2/Qcp6KKLvf6qBplPVyyTLpvbfWD
	 PluhNhdYOvGMw==
Message-ID: <8c803b78-b6be-425d-a747-85e4c69b4f3d@zytor.com>
Date: Mon, 12 May 2025 22:02:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] x86/fred: Allow variable-sized event frame
To: Brian Gerst <brgerst@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, luto@kernel.org, tglx@linutronix.de,
        mingo@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com
References: <20250512064353.1535984-1-xin@zytor.com>
 <20250512064353.1535984-2-xin@zytor.com>
 <20250512093033.GO4439@noisy.programming.kicks-ass.net>
 <CAMzpN2j1zk854JnoFSP4uh+xJQpz3qfwE6T21J+ic7YrKJJ8yQ@mail.gmail.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <CAMzpN2j1zk854JnoFSP4uh+xJQpz3qfwE6T21J+ic7YrKJJ8yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/12/2025 5:10 AM, Brian Gerst wrote:
> On Mon, May 12, 2025 at 5:30 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> On Sun, May 11, 2025 at 11:43:52PM -0700, Xin Li (Intel) wrote:
>>
>>
>>> -#define INIT_THREAD_INFO(tsk)                        \
>>> -{                                            \
>>> -     .flags          = 0,                    \
>>> +extern unsigned long __top_init_kernel_stack[];
>>> +
>>> +#define INIT_THREAD_INFO(tsk)                                                \
>>> +{                                                                    \
>>> +     .flags          = 0,                                            \
>>> +     .user_pt_regs   = (struct pt_regs *)__top_init_kernel_stack,    \
>>
>> Should that not have a -1 on or something?
> 
> No, that symbol already accounts for subtracting the size of pt_regs.

Thanks for your answer :)

