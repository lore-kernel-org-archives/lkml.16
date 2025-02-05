Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAAF22A1CA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738746973; cv=none; b=CPWlIRBxVK07AZCxHbaQPFVVG879NF7JHuJ6Mf30Pea497mWWayEI4IhF9oj18sf4DAH8Xfi5N2Th0eW12vqAsuatjTfTFNAuNhMZip2+uNVOob+X0ddcKjHFkbebkNKJB7nFJLn3dnu+as6koBeNPFOAskXDZS+Na2vlU/opSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738746973; c=relaxed/simple;
	bh=KirepUAvf/eAIVZPd6brn8QTNsAITg+2bChr685D3nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9fp0EHOy/IZ+eTQCijy2XLHVWQWHet9QCcQpQyrlhpW8AdYi+FHIvFaTG/Es47N8WdrTDdmdj/bXtHNO1VdQk2Ch3NfLcmyBLD3tSnLrrvVQ8Zwe5X8rvPX3ilO7446BXqzzY88rpw+rMqm6VuU/7Nnxnx2YgnHyNUVgd0o64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=p0QxatW8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="p0QxatW8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4368a293339so74582645e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 01:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738746970; x=1739351770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VdcpOmahpceHmBhn2JmOwRdihIRdDhMuTiUob4nXfIw=;
        b=p0QxatW8qF9+CklJlzMqXmuWTXh8KHyryeLwxtQXnWCvZO52seN5PlMQW4xuQeFgqn
         mL5hfcuOxUbPxZqQtycdF0FMxQriki2dx+qV47ujVVf7yWjdt+3aI50m0eFiVgyjDdOY
         VsBgmem5YzFHE7XhoSAtcVJrBhL0BIuULjIIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738746970; x=1739351770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdcpOmahpceHmBhn2JmOwRdihIRdDhMuTiUob4nXfIw=;
        b=O1o4ut6tVBu9H48KZIzbCGeJmzM3T1z3XiS44hX6wU9T0rl2cWhcpX5LW1Cx4oY+CW
         629wJMUQUYvKYGhLXTfmo9+gl1bzVbB6emriTZLShCndt0h8iE6FT+rzpIEebqJueEn7
         LXRM+d14yeuALzJr4SPIfRBZupvqSMBz5I2068FYiAphLzU1Pxx66PnUOFmmKQHU1bVs
         rxSpS2pZfKmgpG1dQKDbO55zudzXNvs7VfsR+g84VF1wMtVkF8OdQa4Ufwyih9i6wXUg
         VbqwBy71r5ge6X+z0h4nbMIzdY+pjE2ttJPe0arRDez/CYaUdOqndu9BcbfQ2YU3LHem
         mZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCU68TuNn2jiPOSBrK7NFSyrykcSXfXgjUNg39FVOVNSsTykqRGQ/35Y319NxypVpZ88iQyBQKRS8b4VLXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM3HRbQdVnC1kPhEulM1P/+5RAa22+YCHhDS9tl+trbRkCsop1
	YWDvensthbmAL153+CSWkEMIpV6hD3rS6eSZPso8YufuSlzik9mL6fi+VSKQ1i+53bS8Ixxf03Y
	2IHU=
X-Gm-Gg: ASbGnctrggaEOWJgh38ToQhJRTeMAROapcUF6zjdYO/2Tz07dw3eTR4cyO0Oiqwkd3H
	jCYJq3Jsu+WxKVGvQxeRpoeIrthA/d66zMjl5C677lnlLMrgiCzqO71Vwz7HZDxMZKKyn9ZQgSE
	5BM4XsTRcsyGsK9R5j713Xf4i1BJ6c+EyjUFyH36FLcS9E4k1gZAU1ZlYxWwIwGfNES1A1VsphQ
	BLLtN16gS85zHfucaf0gvOcVJYjcFbYQBbUddXv6r/WSPAwYmaeE4kSK7/MVwdDqr2A+J7Qta5c
	DHM9jzOSW+VWcZvnkzXHkhOqbTucf0PZwkPLCi8azeLKaayoBzaRjWI=
X-Google-Smtp-Source: AGHT+IH5hKQTzKeoCaMh/3XuS+I3ATt1yQjl9abxbvvWh0RZYZEq32UV5l/tX7ZqDFqwU4utAjmg0Q==
X-Received: by 2002:a05:600c:35d4:b0:434:a802:43d with SMTP id 5b1f17b1804b1-4390d574b74mr13843455e9.27.1738746969727;
        Wed, 05 Feb 2025 01:16:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm15066125e9.10.2025.02.05.01.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 01:16:09 -0800 (PST)
Message-ID: <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
Date: Wed, 5 Feb 2025 09:16:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20250205091056.17796-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250205091056.17796-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2025 9:10 am, Juergen Gross wrote:
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

The 32bit case, out of context up here, also clobbers %ebx.

~Andrew

>  	pop %ebx
>  	pop %eax
>  #else
> -	lea xen_hypercall_amd(%rip), %rbx
> -	cmp %rax, %rbx
> +	cmp xen_hypercall_amd(%rip), %rax
>  #ifdef CONFIG_FRAME_POINTER
>  	pop %rax	/* Dummy pop. */
>  #endif

