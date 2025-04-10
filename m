Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00191946A0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249095; cv=none; b=J96y9NgfsdVTsRWYdQpm9VVj18lRnl9wueOVsIOqoJwix8YxAKU8hha5/CeCDzlL9LXAk2L2XLaMF1A4ar6BcajmNuuyXZ9dVWPxabdNKOZmVkUf93jl7NE8wqSKFhzDcDxgOVxOlPpUUqQkgU+EJzd7h7nQXGupd2PmSbp3ctQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249095; c=relaxed/simple;
	bh=xzxAJEOwftODG2SJ+VZLE9mvpqS6KFfdGKVxxEPUDls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ra5Tk3CI6E1bGfK8tE/LIMnYpNiSv51lt5YkHpt9mufgVY4ZivzUQ5/+bGdSc35Ts0jVDF/niUiTO8kqs4AOxBtfoGp5x/476I9PB5XHbhDl9S7UOBl8lH2/1gpFPXOuO9OWJNla+LuTyqiMfa8YHwyMkk0j54ImWD4ua1wGuHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=MbsBHj7T; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="MbsBHj7T"
Received: from [IPV6:2601:646:8081:1f94:9d5:a0c2:3619:62ac] ([IPv6:2601:646:8081:1f94:9d5:a0c2:3619:62ac])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A1bd9B3837441
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Apr 2025 18:37:39 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A1bd9B3837441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744249060;
	bh=OUm/gM96Nck3Ut/Orfy8L0BApiXRVJoanbtT2Mdsa0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MbsBHj7T5pzRJw7DNl5oYi7LI3PVVst1BQ0Q6opV6o2UQak/w+yeJldlOaWIW7dq9
	 Yb4E4yrCdA2k/Ynunmh3nGPmgah0IKIHCQ85IoJeDGZpLk7l8Y6uSQvuopOf4cahBw
	 9BjMve/jL4wb3OIW6ko4iYr3zkJWx10zNBkNCZ3xqpYiNqS8+9XyF4L4ieOEFR7mnp
	 /YPBDsdqVsg18Z9tWaMraqr8GgxojrqdkhjhpHD9775kVY3XlEO3SbFg1g3PGlPHTc
	 Tncr5FGfZiPtP9I4yYiXW2YFiNhvMV8jKT+gtcO2fZNZcH1DNWqfo5M4chXgrMAvK3
	 cV8Hrwdw52WGA==
Message-ID: <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com>
Date: Wed, 9 Apr 2025 18:37:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in
 <asm/msr.h>
To: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20250409202907.3419480-1-mingo@kernel.org>
 <20250409202907.3419480-7-mingo@kernel.org>
 <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/9/25 14:55, Xin Li wrote:
> 
> It looks to me that we don't use the "const" qualifier in the code a
> lot.  However since the MSR index is usually not expected to change
> inside the MSR API implementations, would it be nicer to add the "const"
> qualifier?
> 
> The same to the MSR value of MSR write APIs.
> 

"const" on an automatic variable (including function arguments) is 
usually not very meaningful, unless it is manifest as a memory object 
(see below.)

Personally I tend to use "const" anyway in more complex functions to 
make it clear that a variable is not expected to change while in scope 
(and I also prefer to reduce the scope of a variable as much as 
possible), but for a simple function like this it is more clutter than 
anything else.

Now, "const" on a *memory object* (pointer target) is a very different 
thing and should in general be used where ever writing to an object is 
not going to happen.

An automatic variable becomes manifest as a memory object if its address 
is taken anywhere in its scope (using the & operator or an unindexed 
array) and the address of that pointer stored. The last part means that 
the compiler (if it is is smart enough) can take a sequence of 
operations equivalent to *& and eliminate it.

Keep in mind that, for C (not necessarily C++):

1. in *all* cases "foo[x]" is exactly equivalent to "*(foo + x)"
2. *if* "foo" is declared as an array type, then "foo" is exactly 
equivalent to "&foo[0]".

"const" in C a little less strict than you would like; the only way in C 
before C23 to declare a "true" constant is using enum or a #define macro 
(which of course pollutes the global namespace). In block scope it 
usually doesn't matter for scalar types and const or static const will 
work just fine, but it is only in C23 than C imported "constexpr" from 
C++ (which has had it since C++11.)

	-hpa

