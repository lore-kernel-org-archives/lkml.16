Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E0224AE1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669974; cv=none; b=A7GjYErMT5g9D0Bs4qUNlkVk66ol0S/PCQtyJBL//3Fm/8hWKAbLaoS5bp2CRoXi2O+25uoi/DS92V01kwj4xIG3CXty48WoXjr1GnZZqotxyRonsmXMROBXP48nZ819pHWrCLdOC4TyzmPTm69eV+Yrs0u2AQZHpJ5+Dri5QI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669974; c=relaxed/simple;
	bh=xjUUVePThMCMQMUjoYqC4ZUyQWbEpiD2Y92+XBhRpYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXU5KtCJqb87zX7R5b0J+nx04VysYLBlQjkQsylt33y9zt/1jvmPZOU3UQOu3auThG1VCM9fvugNUscTjmkp/tWLVNgz74Fw1lUpfeNFGY8wzvrxl2s3UL4f75xulPM/mqTnQvs6WJe3Gojc9g8V1j3v6WpD995tqAoZKO/EBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=hPgJSRwb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="hPgJSRwb"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade750971f2so22541966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749669971; x=1750274771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgdsahy7+MpouV5T836yjKIsgGHyAoUAinAmgQTqbhY=;
        b=hPgJSRwbtn7Mdz9mFxsp2R98LWBlVKhtvpoHRR0Rm51BXDPI/6K+61jX3dEaCY1255
         rl0uhVKUvAga0Te+c0zI1mlB5CuHXvJKIeGTbhDdvqem1zPqIWuuTKeDzCD9AuTfEpkE
         9J/RA0rFT4/Paq/rGRbVLl4EhbstxIs2qOXeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749669971; x=1750274771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgdsahy7+MpouV5T836yjKIsgGHyAoUAinAmgQTqbhY=;
        b=ixP+I0yhq+06A3zaSFmp8kGoP17979ueWgkRs4PzPKZkral5k4Sv7Eub3Q8vhjz+Tu
         sNGFLlWf8UPDezsoCZsOwIaZo3dfCKf7PIjY0EEcXY5MFOoOAMfzDsyU6v0qZ26PELO0
         pwTc0AgTSQ890SKrMNwDS6FKKdFIFksUcRkFRGcNkkV7aNY4JTyArxVVoIkL3EurEsQz
         TEiuQgNNaRXiaXEz7/hUm4YDH3xIDCrGuzYv3ERaRUyUedF9/mpy4VwR2gccmy46Z4sX
         rZ9iCLxJnm/0rlEFaQ3WS8i7S4F9Nih/CQAiZohccz9OQFZspdia+QglATMhNjKlosaR
         B75g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/PCyA67eRziC4pLBDwVgzOvY89KDGq1OmB4mZ1nPsOAoZrohzQ1nvsdVbb+CIhff6VO3NwrDsVNsDRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKrjAia7ukcDhrcZ4VjBZ4+5LnPLf1brpk0W5KG/u1JYGZxCC
	84Q9ZAkFWwW3uGHPSRAlBT7SwWnagrqSXrPb8c1OwCHkFavpnhx8UBQABPf+UtEoRq0=
X-Gm-Gg: ASbGncsLVUTGRMXpCYbD/xlGUhLdgzYZPKsHJs+sCvMrIUwkIB4kbO/CLlurxh3dmvS
	Ww475Bk9+apDzeye7IMxnOHBX5BKjgzu2AHJIt2JzhskWOmF0QNXWZsYU2xbrlBuWCwizSHUpy4
	Lz78sNcEjKPfHSf9olicGYJVWEIiwThIfa/nETDbFshZPOxpDFPLeWfFTxqwjKfpomnocNcEpRc
	4tJJTLuF9x1SsImG0JcZeLggoQFnVhzeE0H7sL6hgDlVHfy0SweyY3ykpHhdakpvvq3+gtDyWWE
	Fhsp2A1Gz8lITNN4LfupQP15f796L3m91lIE4y6MocPUfAmy9dztQ/3nGynebxwInQ==
X-Google-Smtp-Source: AGHT+IGMnP+w4WMFp5n+e97Nlh4jE0YqLWoswlRzQ04NQM9lzHRcmeLEfTIdee8WauSnhHH/y0FQFw==
X-Received: by 2002:a17:907:c807:b0:ad5:e18:2141 with SMTP id a640c23a62f3a-adea273e373mr88856466b.53.1749669970917;
        Wed, 11 Jun 2025 12:26:10 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade8804b65dsm197914466b.133.2025.06.11.12.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 12:26:10 -0700 (PDT)
Message-ID: <f6834f95-49d0-4948-937c-e6eb7704ee35@neon.tech>
Date: Wed, 11 Jun 2025 20:26:09 +0100
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
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <7c204a40-532d-4afe-94f9-e685fb9be454@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 15:16, Dave Hansen wrote:
> On 6/11/25 01:38, Em Sharnoff wrote:
>>> Could you please find a way to reduce the number of casts?
>> What do you think about changing the return for these functions to just 'int'
>> for errors?
> Fine with me. No reason to cram errno's into a physical address that's
> never used as a physical address.

Just realized paddr_last is actually used to set 'max_pfn_mapped'.
In init_memory_mapping():

> add_pfn_range_mapped(start >> PAGE_SHIFT, ret >> PAGE_SHIFT);

which in turn only uses it to update max_pfn_mapped:

> max_pfn_mapped = max(max_pfn_mapped, end_pfn)

This was added in cc6150321903 ("x86: account overlapped mappings in
max_pfn_mapped").

---

Some other options to reduce the number of casts:

1. Add helpers to do the '(void *)' casting for ERR_PTR, keeping everything
   else the same.
2. Change the phys_*_init() functions to return int, and directly update
   max_pfn_mapped from within them. They already call update_page_count(),
   maybe this is similar?
3. Change the phys_*_init() functions to return int, and calculate the
   expected paddr_last externally.

The third option I think is possible in theory, but probably too complicated
and fragile. (at a glance, there's complex emergent logic - but maybe someone
familiar with the code could make the case for something simple)


Thoughts?

Em
