Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2682B27468
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255129; cv=none; b=N2p/Cm7fK3t56oayDyGLzEtOjP7jh84+JY/zn3t2D7UjGPJw3EK0HE4wVAzQyUkshv39iGoPAjxubOtND1+Lh9ZhSXTMpieFYzyrPPxsGowtsGHeSnHsYOo1S3hfXtBqt/5+Tzf8o6zvvxIdD/iEtxee13JEe4II/9LBT5HQMMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255129; c=relaxed/simple;
	bh=En3M8+sPUg3r5CpIH4rbVUPLsPjMTgBNlUfmIZpf1u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNErg6YXJ4UE5Y2ssc+sKvcKkxG5z4OogUxlOERrL070h99RYq9nxmlwx73SeP8lB9RBXX0dGQys1WKcH5p25Tn5myOw52c+48/T8RWrAp5v/LK0R1qNiC9gobBCda03VMjKoIRxz6jCIl3gjB+/W+6Fkc1Mym5OZRXqZ/IlDoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=WysfUYTw; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="WysfUYTw"
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A3IC7R3875792
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Apr 2025 20:18:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A3IC7R3875792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744255094;
	bh=WQvzgiSKQjwsQO/1UyRD7P7gh1UdDMANljygNiYHs1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WysfUYTwKtmvkf4W1Dy9Re/Oi77kncY0buVC1NnifYo37GR2dpsM5Gg3St1A3Mtoy
	 FGYmP34HNgiqkR23ns3bTjH/X3vQbMmKs/LSt9CBynnA+uIeq2Oo+4qz0DQg/L9CtW
	 vIANl9X8sWMIbIL4kdM0UzXY27ZRwxF+4APfi66LzdnXGw4x0QcSWnJQilUTMPSIMz
	 iz9/FAeEBPqsXwnBRr+MfjeieEs5C4/XTw9kmxla1ySN4NMX12oNycaO/FfXCGihwY
	 bRRt5hpTuyInD43+vQEpCMBBpXvSitp/5yYb/g21kOQalL70XKBhNkm+5WPXkZp2kN
	 ggk6DgJDncOOg==
Message-ID: <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com>
Date: Wed, 9 Apr 2025 20:18:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in
 <asm/msr.h>
To: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20250409202907.3419480-1-mingo@kernel.org>
 <20250409202907.3419480-7-mingo@kernel.org>
 <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com>
 <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/9/2025 6:37 PM, H. Peter Anvin wrote:
> On 4/9/25 14:55, Xin Li wrote:
>>
>> It looks to me that we don't use the "const" qualifier in the code a
>> lot.  However since the MSR index is usually not expected to change
>> inside the MSR API implementations, would it be nicer to add the "const"
>> qualifier?
>>
>> The same to the MSR value of MSR write APIs.
>>
> 
> "const" on an automatic variable (including function arguments) is 
> usually not very meaningful, unless it is manifest as a memory object 
> (see below.)
> 
> Personally I tend to use "const" anyway in more complex functions to 
> make it clear that a variable is not expected to change while in scope 
> (and I also prefer to reduce the scope of a variable as much as 
> possible), but for a simple function like this it is more clutter than 
> anything else.

Good point!

A question NOT related to this patch set, the MSR write API prototype
defined in struct pv_cpu_ops as:
     void (*write_msr)(unsigned int msr, unsigned low, unsigned high);

Will it be better to add "const" to its arguments?  I.e.,
     void (*write_msr)(const u32 msr, const u32 low, const u32 high);

> Now, "const" on a *memory object* (pointer target) is a very different 
> thing and should in general be used where ever writing to an object is 
> not going to happen.
> 
> An automatic variable becomes manifest as a memory object if its address 
> is taken anywhere in its scope (using the & operator or an unindexed 
> array) and the address of that pointer stored. The last part means that 
> the compiler (if it is is smart enough) can take a sequence of 
> operations equivalent to *& and eliminate it.
> 
> Keep in mind that, for C (not necessarily C++):
> 
> 1. in *all* cases "foo[x]" is exactly equivalent to "*(foo + x)"
> 2. *if* "foo" is declared as an array type, then "foo" is exactly 
> equivalent to "&foo[0]".
> 
> "const" in C a little less strict than you would like; the only way in C 
> before C23 to declare a "true" constant is using enum or a #define macro 
> (which of course pollutes the global namespace). In block scope it 
> usually doesn't matter for scalar types and const or static const will 
> work just fine, but it is only in C23 than C imported "constexpr" from 
> C++ (which has had it since C++11.)
Nice to know.
Thanks!
     Xin
