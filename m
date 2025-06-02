Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B62012D1F1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902922; cv=none; b=HoeftJPsEe2GGmup5VjL9QaQtDal7H4v5Z0MHFlW3Q5FZQsPEsV1nXH7zaNbCsZ+Nt7HGqa6zCymhey3XYgpwH1+Dxxn4uWCPLyb8Q3emYYEGSzWYg5j/cexYXNDdyJKq1hB3kLT2Cicopisz60pZyWfElF/L6FgU4GOIdfpaZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902922; c=relaxed/simple;
	bh=Z/SP8Pk+F4FFxk8vgq2hVCMlYSJpgDiQRlCq91lj+T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMNgaa/AXicJ44N6O6PnldZmkHhGTfg4RDtja9axYq+eqyllJuPTFegmopQtxIyQPnAsuWeobe51j440a7gsetf/kr6KZrSpHJIDrj0JL9dJ2Vw2UVsCyTYXf+LbZIwQy5pIT7gwrW79aLOCL4BpkjpUY7Y/JxxzLxWglqrl4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C47MePDa; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C47MePDa"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-872886ed65aso126858239f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748902918; x=1749507718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iu4wxZAVQO2hf/eLt9ktDv6KrJsBEvpVaW0no81zuhU=;
        b=C47MePDaWyByizHbbBL3rebiBMdYA+ggmXNk9CWPs0jD2613mRQwxIPoY3Shu8qUoT
         YRPFlbHjThRgMtNY384o7e6wX/5r7llcbTDr7Jde3tUCpPzPWFmS9XWqpeBCHQTzO/jA
         T2jsaxtJ0B+w1/z53XSXETol0aqiwcrHY9vtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902918; x=1749507718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu4wxZAVQO2hf/eLt9ktDv6KrJsBEvpVaW0no81zuhU=;
        b=Lyo5E71AA6S4HkKl35e3PyPUOctXh7ro1U1N4mGp+7FR3CHnAiDw1MFI0HPIfs3PSQ
         0VzkoUM8RGVg/SVZgklRnRSrx9J9VpJxvZvsQklW8XrhPxoCXlcmaTFA4CAJOhiCOeea
         IrXgN1z2eDzPHq5hugwjWejMn/g5X5yCT/YWBL//xJ85YdvvoznTe1Sunnp+I69HX9j2
         wh2qgbydJ50f1wKIGzq9ges5fnU40nYB17BL+Dhnfff308Zi7nKTH65J8y8n+0P5EfM5
         LfnOLHgF3dqBYlsf+smibXziyCrdM3mJq42ZEZgVPxJ1eecfk8HD1OH3Y4h1vi9MSOJ6
         2kbA==
X-Forwarded-Encrypted: i=1; AJvYcCVdbubN3RGRWqj2SJZ//JA9XS+Kpx7rv1gGlwTfDJEIv9wZW8bOO7PuGpYfZTx4JZAdbOajPhb/RSjWRDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8WYZQDu8Dd5k6+DOVkMneZaYRiTbangiQMv/UNREM2910mTJS
	Pb3dkzpjWwZwjFN9YzIjT6JNYa1ooFUHHcDM5Cw4jWZEZygw/4lRnsSVLnf63IhUq+E=
X-Gm-Gg: ASbGncu3Sh7NTnen65Ll/zvpVyMfvB1v7e5OqmZABXYAaqQqL3duV34R7ld3zVAEc+i
	PNqMxVXaXAVSzAix5mVEHUHsS663iqHwJTLRWcOsKfvJeC8yyx6pgdIFm7y8Wm94EyL55KETzQO
	cNuWHwYgGP5TztjcBQsFXlZ5CDTZVKVBaJY0JvK5S/W8gY5pMin/Kak1t9dabSmthVVH5938r04
	d6qaDcAdOUBS/3XEv4RSypPugYuptaGLkWkHlQRicyg3/vws6NSriraJlesRXuRo9yMDa1I7Lqq
	FL7vC0EoJwpX+mcHfpIRTuzfGIiU+B2tmXrH/37NKB6Y+ptEG+KDyLugQ1AWPg==
X-Google-Smtp-Source: AGHT+IHeGCNq4cv4J4LIgdnexVFJmTDFs9i9Zx9R+h4U+awQWpIRMwn7SGjs0Hi+OSqiNOAK0FCywQ==
X-Received: by 2002:a05:6602:3806:b0:86c:f2c1:70d9 with SMTP id ca18e2360f4ac-86d00099634mr1794429539f.3.1748902918105;
        Mon, 02 Jun 2025 15:21:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7e29877sm1977626173.53.2025.06.02.15.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 15:21:57 -0700 (PDT)
Message-ID: <b2e62143-fa68-4cd1-bf6c-67f0ad49c670@linuxfoundation.org>
Date: Mon, 2 Jun 2025 16:21:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ptrace/get_syscall_info: fix for MIPS n32
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Shuah Khan <shuah@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, strace-devel@lists.strace.io,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250115233747.GA28541@strace.io>
 <0262acf1-4d3f-471b-bd56-4ddf8a2bc1a3@linuxfoundation.org>
 <20250329124856.GA1356@strace.io>
 <alpine.DEB.2.21.2503291345580.47733@angie.orcam.me.uk>
 <20250602115924.GB329@strace.io>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602115924.GB329@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 05:59, Dmitry V. Levin wrote:
> On Sat, Mar 29, 2025 at 02:02:28PM +0000, Maciej W. Rozycki wrote:
>> On Sat, 29 Mar 2025, Dmitry V. Levin wrote:
>>
>>>>> +#if defined(_MIPS_SIM) && _MIPS_SIM == _MIPS_SIM_NABI32
>>>>> +/*
>>>>> + * MIPS N32 is the only architecture where __kernel_ulong_t
>>>>> + * does not match the bitness of syscall arguments.
>>>>> + */
>>>>> +typedef unsigned long long kernel_ulong_t;
>>>>> +#else
>>>>> +typedef __kernel_ulong_t kernel_ulong_t;
>>>>> +#endif
>>>>> +
>>>>
>>>> What's the reason for adding these typedefs? checkpatch should
>>>> have warned you about adding new typedefs.
>>>>
>>>> Also this introduces kernel_ulong_t in user-space test code.
>>>> Something to avoid.
>>>
>>> There has to be a new type for this test, and the natural way to do this
>>> is to use typedef.  The alternative would be to #define kernel_ulong_t
>>> which is ugly.  By the way, there are quite a few typedefs in selftests,
>>> and there seems to be given no rationale why adding new types in selftests
>>> is a bad idea.
>>
>>   FWIW I agree, and I fail to see a reason why this would be a problem in a
>> standalone test program where the typedef does not propagate anywhere.
>>
>>   The only potential issue I can identify would be a namespace clash, so
>> perhaps the new type could have a name prefix specific to the test, but it
>> doesn't appear to me a widespread practice across our selftests and then
>> `kernel_' ought to be pretty safe against ISO C or POSIX, so perhaps let's
>> leave the things alone?
> 
> Another similar test I authored (selftests/ptrace/set_syscall_info) has
> been merged, so there are two similar tests in the tree now, but only
> one of them is permitted to use this approach, creating inconsistency.
> 
> Taking all of the above into consideration, please approve this fix.
> 
> 

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
