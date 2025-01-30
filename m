Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27194A35;
	Thu, 30 Jan 2025 01:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738199918; cv=none; b=Ed0Sux8t0jRcORarXYJ0x6jfpfAE16vYmzqkD/Z4g9jtTXgqbscm8qh0pUZw/ksr7DogJLDwK4IxtMz2WwybGtUFSke6+jQ11fmKkVLOFn1cf1U318g+H/Rtv7H1fYrzob/czh0CGvNvVMhgGRfRNVGtzpCW2UCuKnzTncZh37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738199918; c=relaxed/simple;
	bh=9aCkqgnJNrMJCoicVCad4YxwVUCJGb7SvQvHdWNGzoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgvY5N9z+wf26wT4kWj3Wcq0W+dZKuN5s1SYXSLgkX7JzNedlMiRfakYd2ZegPchQHQynMeBDswfQkoXhtBx2qU1tWVa3YKcHDjlK/g5zQK+jc5aJMn0WeLcRp5FvoBt9SeL5yRLzmHuaA3T6E0iefF7hNP3Fi1v+11bSeffoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geBemr+n; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geBemr+n"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-29f7b5fbc9aso88467fac.3;
        Wed, 29 Jan 2025 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738199916; x=1738804716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4OUt2cYpqoi2swd4tRq3M9egM4N1h1iLYMn/lCmviY=;
        b=geBemr+ntXcAp6nwP+ZhV+ArexU4u3d2xVnaP9tUNjUCKsYqmVPFHaXjQb0P3rGwht
         vhrB3CusocmeYtVzKJ2mdpHTlbtFFw+fglqb5az6bSwnfFPH8LzSi0a/flrW32//mjeL
         GM2IWGCr8htuyOIKNe2hF2degJt7kDNiKXdrsSfknG0FfWXugFx86FWbBE8S09NUUnt+
         90rGCe8gQSwQhqWDYnJS8m6Dnx/CdrP2MtycSHiLytOLOh8Db9qnwUT+7fwPe97z0RD5
         WU2B2qYEiFBKpVL0HFr1lI9/J8105GgR5P40Fs9M8ysnaLk900WoMCx18jq0O8Y5ER2y
         MheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738199916; x=1738804716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4OUt2cYpqoi2swd4tRq3M9egM4N1h1iLYMn/lCmviY=;
        b=otA/vTnUz4Xk17LJMQAn12Z8+p83E+86C9hpWBIxL9bbayxa0AjXjrKGlE0FxQ5UoY
         WOi/sC7e/ZkNxVUBB1I6vCmpdIM5IX3LAlInIWu1pwh0gezPagY3cCe1o4ACRbU45wYP
         j7pRLi6lC2NQhogJNsouNmTOYbszot1AARHcPo34ygcD47EDV+uA6CjMTUk0aziUeag6
         xDS4uTSGgsDk83we9JYFgJCLHu8rBNLjMIkFWow2Hex+cV0OV5gqGdIQdHK6Xhi6BHlL
         yCAjxD2So0Z15y4mcuM5kYMwPgGTHZjBAqY6PeS+JU8y1HIUbwrFGczMDpVGAYpclKa4
         uo9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWt7NZB3xfTrKzkWxIsAF4FXGvEodre6qQQLDgVHLY5Z5fnaZgByNsBBK5hdmn0GTHmeslsYi7tLT9cu+nx@vger.kernel.org, AJvYcCXqb4Dfgc3l3IOIvgDeLaVppCtTRAakOyBqQiScf37C86aev3KE2tYGI5m7JxWcoGnnygjGCwm32BI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrvo1kNQqk+wkoh2YH5yCv+W7ZOEGlolOnQotDDOX4sgbuOJM
	U7qEQsna+i6z5kCOBVIsmrwsjplQ4zwXStYpfa9AP8NnzLMGPO1p
X-Gm-Gg: ASbGnctq93dMU/o9qzWiImkTHEiVzUcpD1GA4ccaIS2jpNV4R1XjogT9I+tXGxM5MRm
	EyasotzSPxfLwCEBtXO3whQVb7PQRXafjrnzWDVStlBP1NrwLBTcIhpkATTGWAbYzhcnO0/0qDu
	VcRHJ8G1RFTX79ZyyrbIls8XrPeXzw6kb91mvEZkCjNCrj7tPrFTNffyGU52jKol9rlHU+59iwf
	AD3QKzYvu7TNG/znh3s0Z7qEfrrR5iQ3jM95OlwgEV2gINahhQxBfH77eOnRQ5I80s4bKkN9I3I
	3hbvpJNjKzszZufzahDax0ibA1ZNgLlMr1id4LAQ4GRb0tbudbH7TPshiboPphSWuzTGk2Shdlp
	5irE=
X-Google-Smtp-Source: AGHT+IFs37r51WXSLIqNFlMJAmQX55aPJzH6E5KcEhN5d56k6+af0N1lkHrEgyYIVSZ5NrA1yIb2Ag==
X-Received: by 2002:a05:6870:ff8c:b0:29e:362b:2162 with SMTP id 586e51a60fabf-2b32f098fccmr2737980fac.20.1738199915766;
        Wed, 29 Jan 2025 17:18:35 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc104cc33dsm84385eaf.14.2025.01.29.17.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 17:18:35 -0800 (PST)
Message-ID: <b8cdce66-b110-4db2-b544-7255ccc16ce7@gmail.com>
Date: Wed, 29 Jan 2025 19:18:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] .mailmap: Update incorrect entry and my email in
 MAINTAINERS
To: Jonathan Corbet <corbet@lwn.net>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250125154721.1035737-1-carlos.bilbao@kernel.org>
 <87tt9i7fx8.fsf@trenco.lwn.net>
 <5fd7b4d4-6c47-42e7-a256-764d488e0c44@gmail.com>
 <87zfj965bh.fsf@trenco.lwn.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <87zfj965bh.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/29/25 08:52, Jonathan Corbet wrote:

> Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:
>
>> Hello,
>>
>> On 1/28/25 16:05, Jonathan Corbet wrote:
>>> carlos.bilbao@kernel.org writes:
>>>
>>>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>>
>>>> Update .mailmap to fix a mapping and my email address in MAINTAINERS.
>>>>
>>>> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>> ---
>>>>  .mailmap    |  1 -
>>>>  MAINTAINERS | 10 +++++-----
>>>>  2 files changed, 5 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/.mailmap b/.mailmap
>>>> index 83837191affb..0768824e9d19 100644
>>>> --- a/.mailmap
>>>> +++ b/.mailmap
>>>> @@ -139,7 +139,6 @@ Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
>>>>  Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>>>>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>>>>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
>>>> -Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
>>>>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
>>>>  Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
>>>>  Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
>>> So I am getting confused ... why not just send me a correct patch for
>>> this file rather than expecting me to apply the incorrect one followed
>>> by the fix?
>>
>> Because the incorrect one already made it upstream AFAIU:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250128&id=ed7c0f5395e05057ae6459fdcfe229fb9aaab5b6
> Hmm... it looks like Andrew took it?  It's still in linux-next, though,
> and could be pulled out.  It really seems better to just do it right
> from the outset?


If that's possible, surely. Sending the patch again with the correct
mappings.


>
> jon


Thanks, Carlos

