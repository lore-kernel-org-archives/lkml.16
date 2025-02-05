Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7F022B59F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755560; cv=none; b=LzC6Kq1YK4B9mJqR79jGV4HpkqBzM8Px2SCRJneoiVMnMe5H99vfieJbME0e2wkLxQSvQLRbdBlQtld/QvMK9wMAUfrKZi8fH/BMFoGrDcpRMn0u6N7E875NNl28xiimj9iKkf7eeBo7rAlkpK4Ahv6Y7ssfGt1YvptwZhLR9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755560; c=relaxed/simple;
	bh=Oxz3VyXFgcY7eoNu9aTKjL+2ROjT66+HHnAKizsqU/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojTaRWdWqHaCcZkk+CUZENVRIWw1uLfKL6EmkZ5soQVM+mtCHXn1Zk+L4Dh1Mfu03uiFTy0oAjrQTbDczGGffpzLoKaLHIny8zlR0bU9r/CCYA8sL2OfeW0Zj5l9s+0jk93OVzh7mbha5PTMIi6uu2deqt0E917VSASx8ylq3/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VmoOFyYA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VmoOFyYA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaec111762bso857513766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738755556; x=1739360356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=heca1CkwRY0geQle2e/RQNz/OuP+e76q1LqnUUBxWHM=;
        b=VmoOFyYAtmMvDrUVvETvHx75hhiBpgLF5YQYMmqYQTpqi7a1zrRQFhCro8xgcesvk2
         KD9smxZmAz8EkKxazmYGysmFcUf5lPUqjbFofu+hoBCDndTkK9Mk1MTx6PZ06hGYGnTr
         hJIaA6jQufqwRPd9K8yVjlxY7GaA5Gy7qYoSL03pxrF3Ymfs9Ji8gg/TbvMjvCL6XQKz
         XmdpgJLhzD+qa+2kh7qs6+Te3sfebc6Xg7L2ci5e67+RO9nPew3tfu09FBdqhUgJCkyF
         /ZuQx88HeT8+B2LS+/lKpfzx7ThoCsxPCzhu0XDL2aJmDxiJF52RuZPix6e05yzA3prP
         PGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755556; x=1739360356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heca1CkwRY0geQle2e/RQNz/OuP+e76q1LqnUUBxWHM=;
        b=igOpjWfNl5i4Pi7083L1RgXGilVyaQyZbbQWnUx9BEw9MRBE1LnbZvdCbq6wqEtjQM
         z52kpMYb5dyWCsiVDEhNv14Qi7n8xcvipNeMjzXfgQ6s1s3K3hnOxiPCo7ISiVDWsXn7
         yavYMWA6rg8vLUvsgsBH9cjJJRHrp204wrss4lLPy8nMCrsYYwPV0AOAVu9JJkvBz7/+
         0vHIfmz1yQCHArDZQPgl/BjuNFr3rUAyC7epiQuvKUF2xZlFXu9M8y1Y4kyfi6bonpYw
         FXvU62j1pFD5kBT6HT9AtqnCyfxl4vWOMTafjMti+rB/u1s4TDHkp/HgahfDFbikHjMf
         irKA==
X-Forwarded-Encrypted: i=1; AJvYcCW9C1t9WkZwg8k+4922sCPAJieK5Axv9ET2i6XOSW3X0KsppthL5KHG45MH7CQ3tZOUFzOR/10xux3hLqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmGEbfzVi2WXLDTX54G5vD4U3G+W9pzj/DlioVwhGuWu3ciFJ
	BBX6r0bFfva/VJsWr+MrsETj+0/hJrYuul/mUB9tg7QD0FyH3R5MtGsJJ6ME5g==
X-Gm-Gg: ASbGncsMkALunx8fnU+i6QfIjAmw3LJRSCPuUCx5Wwfh8ry3ldVcIqU0GeqEZAZ1AYs
	wselIJkBK86vhaqa2v9POSUG+bss3L1xnWCMBOkLDOBsejJvQqbvqTYxZSUOA/GRvZF+UGRcOrV
	kzcg9AVOOwfTyTIF9fjdaUGDuNl1bGYX60HLkvOTjmeEebMaCG84CKIEHlhwMEzmUH3HoLJ+bWF
	+aPj0ovzFOx9e/+V4LeAmZv0I09UjpFmoTdAwBj6H8bsVRY3HgHWKHWP8pOvqvUVyU97MRUZtoq
	dSnONkR1Nbg4u+dc9rZMZZridTz+56Bredfup4FRBCiWhby4LTaBGJNVuR2g3xCnSufYPUHs7QX
	O
X-Google-Smtp-Source: AGHT+IF4l0S39gz25a0TR1Go6gKpCC/s8Q9FNfEboFf25fP1gs64OZGiYJRyo8gF1+u/x+oAsKz3sw==
X-Received: by 2002:a17:907:1b29:b0:ab3:2b9a:4a5a with SMTP id a640c23a62f3a-ab75e362679mr247700666b.51.1738755555732;
        Wed, 05 Feb 2025 03:39:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm862254966b.53.2025.02.05.03.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 03:39:15 -0800 (PST)
Message-ID: <f1aae953-cd21-4bd2-b35c-01a88684f9a6@suse.com>
Date: Wed, 5 Feb 2025 12:39:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] x86/xen: some xen_hypercall_hvm() fixes
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20250205110651.26280-1-jgross@suse.com>
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
In-Reply-To: <20250205110651.26280-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 12:06, Juergen Gross wrote:
> 3 fixes of the xen_hypercall_hvm() function, with the last one being
> probably more a cleanup.
> 
> Juergen Gross (3):
>   x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
>   x86/xen: add FRAME_END to xen_hypercall_hvm()
>   x86/xen: remove unneeded dummy push from xen_hypercall_hvm()

Reviewed-by: Jan Beulich <jbeulich@suse.com>

