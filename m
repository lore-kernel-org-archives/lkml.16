Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DC22A808
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751428; cv=none; b=FVKhum7T3gLCQOOYXit18Pqb6lzhLR6dlQWrnDllhkxNJim/ZHqBCauJcXeDPZKAw/FnEtDDawe2Jc0Oi3jrW/1ouB1pkO47Hllc9XDpuEfsdJcV+/4gYWNK7v2l6iAjPlLIgFMFcG9maSwc14R3rlRozADVeG0mLoQ/jLs2iuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751428; c=relaxed/simple;
	bh=8u9MlKG6mUFw0n3/OsskbUYxby06jVsfzET5OVklmYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiA8MVbf+fGtT/Oolb0YD/BuwfZVI8DbwxNyHP5AVgVZdj3EIFKq+YVzONmUPGYvD2V5rtQXv/0+G9grTg32/mljfaedR6NYmaU7/cMVoHGbEwO/O3GQf6jKMw/4FgCHS05v96tzE8hZUfNqBXhzRfE4jDBdb0lcm3+xSH8TTJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XhEUQRb1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XhEUQRb1"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso9167079a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738751424; x=1739356224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f11pNxeCeyJiZwba/OgLh/+aQOP7sRbMWhLLOan1njE=;
        b=XhEUQRb1cckmDa9dUZGAAHJlgpEC9PDJ21N/ZIV8Xth1xjbqdjS7y6riUzZhr5QQoU
         fsuH5ZmFPb58eYMtRRbrNjKgP2IozxzWFa6ZPw9S2ynt4KEgED1jcCXl4o+8w/5ReJ3C
         l1/NxcJlWS+3/AuFasDEWTEzN8qgWiH2WxsSWLkx+hm3TM0FCOvnDrrQq2MiO0BRj9T5
         OmnYEpbjrbmXin6Dol+2jFpJqK2BqI31k62Oa+wn7zHkkLmXwTgcTeFw50/N8i1hjUMI
         nIg0AU/MzFucmR2MxVk6anOYl4s4Vn3k5aM5NQlMtAhrA3hN/w4PUOxacPHUoMZElWY3
         vN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751424; x=1739356224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f11pNxeCeyJiZwba/OgLh/+aQOP7sRbMWhLLOan1njE=;
        b=fZeD6fE/F7S2orzOV4PSM/ErQvqSSfqyWSgZ6xsKypbG+/0gOHg1qqYUxJFfqqSCKM
         BiLKYDQJZSk2t3O0aSB8+KHCTrBUGt4KdGJg4rgwkuWAdx4nospB7G0f72RhAQzS2zfd
         +whZBsq8mWTH8Gd48jXGviEJrUA5HMwy3riBppOioQLCTKQVKxEoCGZmv1Sp5TCws4CL
         R1SJWYDfGYRVP9ALzdA70kUB4vcaYr5qs20aKJEkzQCW3Ln/gw+HeAyq6fhaIUN7iO3T
         DKT+EFP/TLgjXCYCxUDQzZRE+FRMamtNsgdOo5FGpZqgBBNgR4hHEEeLt5vOUmyCj/hY
         0dhw==
X-Forwarded-Encrypted: i=1; AJvYcCVEfMorKB0oDGtBP16TmBRr33Rkyy4b5o8oBU5u3MjK12RUjKuwp1a2ERPiE6+bfR7zLovK3Qve8PRyQ+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbtsPaCOjxS/DpZyEyoXbm8JX2JS1i+Z8aWw9fcu66yCIbPRjZ
	V9rjsjMaNcqsAH3lokzaDkXTIume8xHB+ANEVtUSL87QQhBI9qFN42dm3ytOUA==
X-Gm-Gg: ASbGnctWxDUCZNlnbPgsJKCv7TkAnWHofDwEbz/TyMHQ6tnskClGuTA8bjIxeJy/G82
	Kww0aM7bjR+er+1PhKe6AB5cMiVM3+ZPVil4wV2KLyCA1FQg+OAxkdWZRRc23Zk1jwslhGl70Hs
	qB4e8D01lqL31oS6RhVv4eG1QU+i5je16WRatWzRNqJ1ZBfNzww9F9ffkcrJWnVg5PCAaE2AlHi
	JlQvmhmsX3XkIfV+vj+oJyossxFR0NH4f8qayrboBrnmRQPPM0GQ5+/1+2jevriP3UoZC+DwXf6
	0WlZySMipCfxgdEmYutkRaeMoS4YSnJGd3rf+FvpCL7hPOLMVWBAQAn66EmGVf+wUdUJRiF3VG4
	L
X-Google-Smtp-Source: AGHT+IFmzSEVMEFCRheA/H5UWL6RXrJT5rkJf/RMfhLI4S9Lv3xOxjxeI4jh6OwwcO0Hu/OkNnkEZQ==
X-Received: by 2002:a05:6402:3205:b0:5dc:71f6:9724 with SMTP id 4fb4d7f45d1cf-5dcdb76382bmr2675736a12.22.1738751424347;
        Wed, 05 Feb 2025 02:30:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd8dcaf17sm1634658a12.15.2025.02.05.02.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 02:30:23 -0800 (PST)
Message-ID: <cc3bc206-932a-4747-ab3b-74683ea89c80@suse.com>
Date: Wed, 5 Feb 2025 11:30:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
 <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
 <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>
 <a2b93e7c-be69-4cfd-8b34-de22dda4cb6f@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a2b93e7c-be69-4cfd-8b34-de22dda4cb6f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2025 11:04, Jürgen Groß wrote:
> On 05.02.25 10:38, Andrew Cooper wrote:
>> On 05/02/2025 9:17 am, Jürgen Groß wrote:
>>> On 05.02.25 10:16, Andrew Cooper wrote:
>>>> On 05/02/2025 9:10 am, Juergen Gross wrote:
>>>>> xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
>>>>> most only once during early boot, is clobbering %rbx. Depending on
>>>>> whether the caller relies on %rbx to be preserved across the call or
>>>>> not, this clobbering might result in an early crash of the system.
>>>>>
>>>>> This can be avoided by not modifying %rbx in xen_hypercall_hvm().
>>>>>
>>>>> Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>>    arch/x86/xen/xen-head.S | 3 +--
>>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
>>>>> index 9252652afe59..4378b817ed32 100644
>>>>> --- a/arch/x86/xen/xen-head.S
>>>>> +++ b/arch/x86/xen/xen-head.S
>>>>> @@ -117,8 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>>>>
>>>> The 32bit case, out of context up here, also clobbers %ebx.
>>>>
>>>> ~Andrew
>>>>
>>>>>        pop %ebx
>>>
>>> It does not, as this part of the context is showing.
>>
>> Hmm, so it is, and worse, it can't be changed to match the 64bit side.
>> That's nasty.
>>
>> But while I'm here looking at the code, what's up with
>>
>> #ifdef CONFIG_FRAME_POINTER
>>          pushq $0        /* Dummy push for stack alignment. */
>> #endif
>>
>> ?
>>
>> That's covered by FRAME_{START,END} normally, and Linux's preferred
>> stack alignment is 8 not 16.
> 
> I've added this due to a review comment by Jan. As he is more into ABI
> matters, I believed him.
> 
> Google is telling me you are right, so I'll remove those extra hunks in
> V2 of the patch adding FRAME_END.

Oh, I'm sorry for misleading you. Clearly I must have been mis-remembering
(or things may have changed, and I should have re-checked).

Jan
