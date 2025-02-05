Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA52288CA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749282; cv=none; b=G2VzGOFI2TdKS9UoV8g5bhzRDos6E/csuQ4a95t4p3slBTWqKUiv/UNWKs5GmSzRmLqx1CkELNEEhQIJ2dbSM/ejYcJeoosvcyokDImEA0e7qexbucRjG59u52Zt9w9lWly/zZhDax/FWCVE/U4oKQ/csOD5Ju/Rk3XmMaOYitw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749282; c=relaxed/simple;
	bh=PUVVLQAgpAgygECJpV33ZfJAge5MhSAHMizNAyElbds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glb+JljrV0pVUmKLkcsipR3R57cbsTb/wq/SMInDbSKhT3npNvW+8L0h/t3pnyB/aFI8dEzHdZqSOsEBShL8NV5hxNFOp189CKGc0Bj8/shhfN0zS8QXKqzRh7AQS2CaEotEjPMOwsaTeRibL1BhnnzhIdCVONv47sWC181gaC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C4UQm0Tz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C4UQm0Tz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso12015512a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 01:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738749279; x=1739354079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=26+FUsbPIooMUfvZN5cQVmkmpv5qmC1JGNlRzoWOE7s=;
        b=C4UQm0Tzcleo85LIq8I1x7V63oyonZZt2CppdFrvOQ9qCoaEiHNvljrF3cC99bslbJ
         ypc/pLDiGp3m2U28LoAx/7YzXluQ24wDWbMOZZamjj8DOrVPZC9w6M5TsKmTptyJRI3i
         6kE5G1k8p+ODKagyRx04bybS6saQ5fpPuinLeUD4ctvln8oXjp6XVOuMzMccpQcIQ5kM
         ahXCIoMxQB1kJHAw8mLyKjs7h0y+1GXX+vIab4iLhtJYzD5Zol7CgCwme7dHy0Eg/sZw
         UCq4gff0nFGxrwNgtgcKMHw9kSY4oLUiUisg6LADp5ujp7jP5CRyftzwvbP0YvTluRlw
         CULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749279; x=1739354079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26+FUsbPIooMUfvZN5cQVmkmpv5qmC1JGNlRzoWOE7s=;
        b=GBW7TZQE9+BOvtupCcBfJKJL/xpqJDsDxEEEtKWP8p/0QYwVKmyeyjaS638ng+R1V8
         vWydOEBw6HdWGoRkzCiVzpAjr/bzkRH0mPSCtw+sK4tfUrceWZWzCLmOosq7uQ8Uo44g
         gyy9IAR69poAu7G4vdF+7TyV9uLRvRZx1/ZwMgquX6MBOwmM3ybX9Rm3haAbTV0nAljZ
         kq8tLgdppktbx0P/35QD+YGzCE1WLfybl6hqKDAA6mLV1LJKZS706rO1lxVCIkYQrlu3
         /L8T6XLzpwP39/iAQ3hyihoa1Z3VsRG9MWWegXm5/Kh3kZ5se+MjhK+/zLZlEkDhRKwO
         cL5g==
X-Forwarded-Encrypted: i=1; AJvYcCXx8UZoQ82VKz0aRSu3ZnMhojvATcdaJiKjlgfeo3gdQShfedDxpPmAPdFt7zbzqo7+1osbUxZG9Mf5/wg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TT4QdJPT8POPHRavoesEKtRKtrrtQ6V0vcJLLTQzDkv2YjeE
	ZhmetXlYyUPnCjhBZZ/ovsFPqymxsrW7kHl/qWsK7mJFpxu6dBtylX6na8oRug==
X-Gm-Gg: ASbGnctA+GaN9GV68uTS2mkf61p6UYYP++Y+lxynZ3hvZYW/jMkzTPi+zd+FuFPR/lX
	6WCx+b9I0P1YMKlO1ja5oBUxDzlb738YppfayPvi+7WuPklhf4P6tZVlQeFjqnZBc0hVnDESO/k
	ohxFPK0iqEHhZFYoR7AXV9jR0wmIllV7RMYJiWDVdX1fBYcOlobg5NG/3C357asWfAQrHFxtML3
	O+mJSjapkbtQz7vDk7oGcoMYkl8WsDkBQ0pl5ulubp5xxAsz/8BnLrIlWPUDtvCRUVOngfVp76c
	fgOib47ROZJkywAE5aKMYPzMxDpPyHtG62AqvXAie32pocB7BUJSgbB9xbX442gKpbgjf0CJUkN
	p
X-Google-Smtp-Source: AGHT+IELVJBoh9ZdPEyiDWkaN+/h9BP6aE6Q9sAb3i9RWqC0vw+yNq5Yo+nUVwPqE+xIoZ2Gj1yDIA==
X-Received: by 2002:a17:906:f59c:b0:ab6:fee1:60e0 with SMTP id a640c23a62f3a-ab75e0cde78mr234595366b.0.1738749278760;
        Wed, 05 Feb 2025 01:54:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f1dcasm1073058966b.79.2025.02.05.01.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 01:54:38 -0800 (PST)
Message-ID: <0b094f98-401b-4af6-be41-6cfe1bd91560@suse.com>
Date: Wed, 5 Feb 2025 10:54:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20250205091056.17796-1-jgross@suse.com>
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
In-Reply-To: <20250205091056.17796-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 10:10, Juergen Gross wrote:
> xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
> most only once during early boot, is clobbering %rbx. Depending on
> whether the caller relies on %rbx to be preserved across the call or
> not, this clobbering might result in an early crash of the system.
> 
> This can be avoided by not modifying %rbx in xen_hypercall_hvm().
> 
> Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/xen-head.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
> index 9252652afe59..4378b817ed32 100644
> --- a/arch/x86/xen/xen-head.S
> +++ b/arch/x86/xen/xen-head.S
> @@ -117,8 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>  	pop %ebx
>  	pop %eax
>  #else
> -	lea xen_hypercall_amd(%rip), %rbx
> -	cmp %rax, %rbx

There's no memory access here, but ...

> +	cmp xen_hypercall_amd(%rip), %rax

... you now read from memory here. That can't be right. Afaict the original
use of LEA needs to stay, just with a different scratch register.

Jan
