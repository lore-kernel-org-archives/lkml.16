Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BA26D4CF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408271; cv=none; b=TClcNkwH7DX9YUpNAH4Kii4Yb/pf4yZiq5+4JvTMW8u/UlKKkUHmcVSukS6Mc0cH5keZycqhfci+uKFirLFUEwFHAHKhL/zv89O4pXhRQu7DDVezl7zTZ50DNwIyY4mpfqn+v28I9W6fbZ/RUxZqNix2zE/vYZAmIQE28AsjTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408271; c=relaxed/simple;
	bh=FQQQ/K5rW6vlX9BcB6bydAxidGDB2slgR5PpP4BqqSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGaM6vZw7h8LxKy4lVM+0K1Du7LsPFtjsk8LHQBOUuEHtcc6swicVQFQMGt+ZPcAoWF83qnnEKVN16wtsSRVlLBMjPufC1FA5rwElIczBfumCN2EzaUqmoCgN2pLU/jyLiX8fomfs3o9ziIKu+JYph37ZHmoJqIeAOPlQi/O/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9qYYqJB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9qYYqJB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so50650045e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745408268; x=1746013068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhExEbzgWbHRdVPDka5irWi7FH/fa2wSUUhM4mfor5I=;
        b=Q9qYYqJB46Y3xtT8+KddP5vuXsJms74pxWkiCHc3ylvVECG9k2kt24vlEr6Rs4jQYH
         7LZPpbfSpHazWPc5jzbrldwAnyORohmEEeh5Dsh8wMtv0bvR5AS74+ZL9Oecjsru0YeA
         0HfJmywstO5ijnASyHHvmpIDQXXVorlQt4gmvct76HmhVr7AvIZaDNqPLz4Qbt6l2zJN
         1NHhF4qwf1doH/xfiLBUWk1Te8AKAYGVq1ixgltKiF5/oJESwE9AY3VQDAtaXPKinSas
         1gKJ54GqxsELHEFnpfP7i5sBLumxWYFccV3TZR/lNOb0pesNBetJC3hzBf9M9nqPFtX/
         Cs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408268; x=1746013068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhExEbzgWbHRdVPDka5irWi7FH/fa2wSUUhM4mfor5I=;
        b=tOZ2ZvHzBpbWhRxm8PL9fMFAnQB9T6DYIZ2W8L7YDC29Q+Atz7GzMdw4hVY4aq4l8s
         ufcMpbvjdhyy6BWApvUHETsmJCVpV/Xgdyp72wb6UbrCZI3Kg6NSSwfggU7rG4dWNiWN
         /L46EH0sNTrl0NFYU9chJDjxb8E4cecaz22mgveES6EhpCr6PepDcWWnjf2P/qUoVUcN
         h5CB5VZPDKTMDa0cZojJsXpp82KRxjL2Ox6DUH7ndUsubrx8buJ6pwoMBUbLWRYiJo22
         ShFApZz/P5g2fHGwYFUQeNEsAJUhOmsHCrbB+ocBQf5hs2Q5BPQS2RywxtLn7Y7cFIqe
         CP+g==
X-Forwarded-Encrypted: i=1; AJvYcCXc4kdL+c6azb4k/POp+yXTtwY/NABGuJRnyzrtcgqvnQE9Cd1kep5v7G5aSNI8H7Ass1dbHiOPHrAQgVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsQTO5wFCxgSN+Vd9Ol0zAdE5zCDg39exyzp5i2MxbKykR5OAA
	9FsMp/j36sdEoKfFdJtjUtOYYyWm7nf5F8Vm/DDx/1G8PY64a7lWwDYA/Q==
X-Gm-Gg: ASbGnctRoS8P97viECTpPJU/yS0rC2FyLoGekqauuDFQ1xWFu9Um7kyJ3tUwEo45IDX
	gFQoZ54Sp9jZXWSHi3nUbAkKhnCrBywu+2pbg5kXorZFzqF/cIWXgYP0HiuhNV+HM2bX/GJY7GD
	fjujMBe62zXgWxTjjtBVcElz38STyjR1Dxg4XMQJ6XHY8m/F3BsaihzIVyiepDgEWCiy1hzfMzj
	eDvL8D4LZr7qEAW0U/zpI/tvj/24mot8dh80ThOI4XdC/+IRz6nTuvVoNh5jmQMEgduF/bUOzMN
	ujgoBYXsLgNTg3nA23ovHJoqQ3bmdIVB399dO1TiJZBBvUC5XRcoGT6xIsB/aPUhS9eBF1jzOjh
	CdCx46YndNK0jKrAR59x0XHjesuqqmUW0
X-Google-Smtp-Source: AGHT+IGYez2ECW8B1kEuSylophgfv1+Bkfs2ZDLT9gQj6bh2P/nNq51jUvWpsxpfSvT8b90/rY8rxg==
X-Received: by 2002:a05:600c:cc8:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-44074f18848mr156108385e9.18.1745408267809;
        Wed, 23 Apr 2025 04:37:47 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bf28:2e00:ff96:2dac:a39:3e10? ([2a01:4b00:bf28:2e00:ff96:2dac:a39:3e10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3ed88sm22899445e9.35.2025.04.23.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 04:37:47 -0700 (PDT)
Message-ID: <08e3ec4c-4401-403e-9d81-5ee0abebba5c@gmail.com>
Date: Wed, 23 Apr 2025 12:37:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] maccess: fix strncpy_from_user_nofault empty string
 handling
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, rostedt@goodmis.org, mhiramat@kernel.org,
 andrii@kernel.org, kernel-team@meta.com, linux-kernel@vger.kernel.org,
 Mykyta Yatsenko <yatsenko@meta.com>, Kees Cook <keescook@chromium.org>
References: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
 <20250422172011.feb243d2f7478c0e7109b74c@linux-foundation.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20250422172011.feb243d2f7478c0e7109b74c@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/25 01:20, Andrew Morton wrote:
> On Tue, 22 Apr 2025 14:14:49 +0100 Mykyta Yatsenko <mykyta.yatsenko5@gmail.com> wrote:
>
>> From: Mykyta Yatsenko <yatsenko@meta.com>
>>
>> strncpy_from_user_nofault should return the length of the copied string
>> including the trailing NUL, but if the argument unsafe_addr points to
>> an empty string ({'\0'}), the return value is 0.
>>
>> This happens as strncpy_from_user copies terminal symbol into dst
>> and returns 0 (as expected), but strncpy_from_user_nofault does not
>> modify ret as it is not equal to count and not greater than 0, so 0 is
>> returned, which contradicts the contract.
>>
>> ...
>>
> Thanks.
>
> Does this fix any known runtime issue?  If so, please fully describe this?
Not that I'm aware of. The issue could be found when trying to copy empty
user space string in BPF program (and relying on return value).There are 
some usage of
`strncpy_from_user_nofault` in tracing subsystem, but I'm not sure how to
hit those code paths.
>
>> --- a/mm/maccess.c
>> +++ b/mm/maccess.c
>> @@ -196,7 +196,7 @@ long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
>>   	if (ret >= count) {
>>   		ret = count;
>>   		dst[ret - 1] = '\0';
>> -	} else if (ret > 0) {
>> +	} else if (ret >= 0) {
>>   		ret++;
>>   	}
>>   


