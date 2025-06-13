Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECC230BD2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845859; cv=none; b=LrHLtlhObFtFwK2Jf4kipQwkJkpPAmqjFnmK+gFZmOPU08O4wVG1Fi24Ss0pv74X3KlqY2wJFnDaB0bd2bI0GVZb7z9qCGwGEdnHFtaf0iLQjt1D/UKZI72KgZQwRt3LrEeM21Qcb/W/LOaZG0gtjn0dXSzh9+gYzu2xTg4pupM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845859; c=relaxed/simple;
	bh=gjB8mr623UDTmWiMONy9/UbCpWqWHYvRiv/XI+5XyZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3mKU8U9qMnSXjQ872loiQ5jjmDC8udCla+Tq2uTK9h6caQ0sUTEh0WHZlD7bxh8/GF4/ncnF9im4kpWujOB34/P/zO95nRNANehDM5gF8EBdyN1HuJKGg48lIlktp4h3a5ILPsMgzvg0bjf2u3nrwFQcIfjdzYtGPFal/LjN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=ZCczIE/D; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="ZCczIE/D"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso4122376a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749845854; x=1750450654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyQglbq3/0mpmKO8dOewpYZ8PCVwx6dPi9o99Sc4S9g=;
        b=ZCczIE/DSpRsnNLV9HLEqgIIapGNVgTMv1iBNXJPj4L506qn5lfHK9xT5p7mJlk3AI
         F/gntubun4boURXNysXHTyaz1uWRjlUKI6UMcOBH3SfN1i+Yo9WYyJkf49Nhny8ZyCVP
         UC9z7um6Tj+zL6P0GRK6blGNT1XAvClpm2Y+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845854; x=1750450654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CyQglbq3/0mpmKO8dOewpYZ8PCVwx6dPi9o99Sc4S9g=;
        b=dxxixacbMn9qHxpioebc8Hw6FiPIR7mtZRNVkIDNzaiTljCju3Th1v4ShdujehHhxG
         px6PXM76sU4utZG87N5Wf6OsgOjQBBjIwGg6CKV+P6jMkVIMJsw1uugBrk4eN8elOdUX
         Wwgka7B+JLxob45mqde3Fyv4BYthk2z+pp2lRnHn2nhWIWiVPcsS9Ais0KoxD1AVxoZv
         lw/RnXGtpTcXmY/dvevl3y+00OqJgaZGo95IwwIg3DPeYSQbC5305IeMS0Oi/VTeDeSz
         MgFxo3ClJrlTY5gLVaLLtIjlbShmsjXT03BkBjbP9/5xvgK3hnCnQZAfg+wYdHTv8pwd
         yNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF6/YxgP6kXdLXx/GAqOv0ZKgdjIyWU7WbYyBWHcUrYD96jAqEAgRhcQETu0ti/9lGP9Cw4ROTWBSMn24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCiz8FoirGoroglDtndSYroxFvBfM2Sjvc3ViTHKzXUem/7EIo
	JUQqkJmPFwuysLlUMukdr34eaOZ0aCJLK0jYduRgZBmfRyLz/TNyEp+yn5oWJU9puihpTHc3VSL
	gcCVhJ5k=
X-Gm-Gg: ASbGncuiPzsthhJdlumWTZj5vwOzEiML7MblELRzg6JMCLiZNHgUhBGodGPCqXzm+cm
	KAMVcXewKk80JjrP3jvMpB004Y9+JkYevoDyVyCfTQwXDdimeSKBbv7n4ZSqnJQno4Tj9NdTzA1
	KnDE0Hc1sSXr7u3iCnLbo6OLO9wPJUjmma/n5/dOOL5iSrVr6GItplYRPK58AauOTu6WGF8sQbh
	lpOBr+KSBnp+cP/XdnuTEDgxl6fRsMRzmy9Qx62za101vraIHOT52c4m0AEoByLbb9022ulqpBb
	9yw2OLM5iTeOpDp87zqVmF4Qns1eGbhsh374CR1B1CkAFTeCafwr6J8K7Sta9bnf+A==
X-Google-Smtp-Source: AGHT+IE01LEMd/Qic8Fd2OmHEm54/6La76xa2sKwbCrdjEu0M37Sr1UFg4VnN+fQSeCdY7kqlcKBuA==
X-Received: by 2002:a17:907:1ca0:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-adfad438078mr46790966b.28.1749845854453;
        Fri, 13 Jun 2025 13:17:34 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892cd85sm177000066b.139.2025.06.13.13.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 13:17:34 -0700 (PDT)
Message-ID: <cce191c5-1467-44a5-8f8f-56dde0e05fb2@neon.tech>
Date: Fri, 13 Jun 2025 21:17:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/mm: Handle alloc failure in phys_*_init()
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech>
 <a404d023-e0bb-4dc8-8952-accba299ab50@neon.tech>
 <22cd0fa8-d14d-4d37-a6a1-5e6827d6182b@intel.com>
 <2080ec7c-8dc8-4f03-bd96-78ba47e55a97@neon.tech>
 <7c204a40-532d-4afe-94f9-e685fb9be454@intel.com>
 <f6834f95-49d0-4948-937c-e6eb7704ee35@neon.tech>
 <586a10c2-fc65-4b39-add6-c383bbf46078@intel.com>
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <586a10c2-fc65-4b39-add6-c383bbf46078@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 20:36, Dave Hansen wrote:
> On 6/11/25 12:26, Em Sharnoff wrote:
> > 2. Change the phys_*_init() functions to return int, and directly update
> >    max_pfn_mapped from within them. They already call update_page_count(),
> >    maybe this is similar?
> 
> That seems like the most straightforward. Each time they update a
> mapping, they call a helper which bumps up 'max_pfn_mapped'.

Update on this -- turns out I was wrong again. 'paddr_last' is also used to
update 'pfn_mapped', which is more complex. Hopefully still within reason.

I've posted a new patch set, patch 1/4 adopts the "call a helper" route.
Design-wise, it's less clean than I'd like, but let me know what you think.
https://lore.kernel.org/all/7d0d307d-71eb-4913-8023-bccc7a8a4a3d@neon.tech/

Em
