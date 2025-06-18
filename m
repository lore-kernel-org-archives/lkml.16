Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2C27C175
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236233; cv=none; b=tnI1WIKUzKEH8wm4LelrhaWvcyvo2dOal7dkxZUfYTlJj8A1N+YBVCl4rcXPnFtPDh5ntoMg9J2xDZ8W6yoKrb+d0sdCCFHCQBg7PuXxAgkg6EfdejMgFaOL8C1D6P+oZTB0JZH3Sxj8WJ8AIRqJ/0mW5s5YvsF/NqlzeSBcofI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236233; c=relaxed/simple;
	bh=8soPAAfLxXff2xBBSMwGZoAXvs3+hC8lR9JgIdDl/cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuoN3KE/dpW7J1Y8nYOvwWSj9a/63UhVyvTprFdw0vvfHIH+IBueLXdFEm9O7v9xzQ8fpjecC4DliDLAd7208IwuVVOy040Q9EfIaZIDyY3AbdR8Ov2IiJUpxtxaTM4yrkYUqr9MOsuqxsYG7VKBqNI30IxePGW57NvuLvOr7kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQOYzgcG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQOYzgcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750236228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cAg51vj5YTL8mvA0RSV48ObRQWxBepqYh83sUTBT4Yg=;
	b=EQOYzgcGMfiaeEFeHqG98yBr9iIAcNHyPuOaljYU1JMn9a49KqhLf2MwJSUScqOUFAa4wQ
	YvUnLEbar7oJAnWR1YGnDgInA3DzxBSkBP8UD0U4wriAKgB98Y2W/dH8ELJZ4UWF162YAp
	6BXPdqM+lJ7tWfJZbDhEiHZJ3v2ELn0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-MxXW1b5uPJ6W7xqStDfPtQ-1; Wed, 18 Jun 2025 04:43:46 -0400
X-MC-Unique: MxXW1b5uPJ6W7xqStDfPtQ-1
X-Mimecast-MFC-AGG-ID: MxXW1b5uPJ6W7xqStDfPtQ_1750236225
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4535d300d2dso239245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750236225; x=1750841025;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cAg51vj5YTL8mvA0RSV48ObRQWxBepqYh83sUTBT4Yg=;
        b=UqAcace4G8zk8u5iudSyaAr8+9WoRr4wxEYVMeOen6+uyamGjVngD2N5lzMWiO36e1
         VSSoYpmPTLhhrr/u+wYdrnb3c/eE1oH8n8bmsucfdhm727gCFkU4iJErmmE5VEjoEqOx
         9kLybdyNDF2o9VhT/+PZa/87Tfb6dxk8pNpaegTdGoZZJyNyawN2Mk8euE9f56JrJUEa
         XM4lx+stCsVxlGKnFlc5fU1wa9wkTfVjnVjwM/6uu/65atUMoG56Rh0jzq1nrrE9OU2q
         hErFGBe1gweZfXLxdfqonlDm6QjryDXAyGkifV3Lcyw07Tmpfm43urLGridY89Es1h4e
         JaJg==
X-Forwarded-Encrypted: i=1; AJvYcCW9j35NPhJxrdizvA5AsnJvbyNGkMGn55oWCw20WXJDaW9eui1zUAQ4qi8R0GSLBvQgtbRCxrIm2wOVeW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzagEf3MhTXlmXXGLquUgKjuDmKgPTUDMPa6GvA3btkguEA7kvP
	t/3oxbaiXrOrEJTiAvf15C5edlEN8bD9rHgSPXqAAqQXrp1iZKaFB6jIl6ppHs7qr4FZsZyL5N4
	pSGPDH6rOT8Dh9iLeXzYa3fSLg08M4j9GzCnBG+17gQRWoorFm4sPXxQQ2XJahigXkA==
X-Gm-Gg: ASbGncvTBWAeeTl9oRaV3wTVcW4lLZSIfmJtdu4PCLh7vcBSpoGpCe9PncNGPIbkDLb
	UqNLFcOj5EUQikCksyHJuP9w6ba4miX8hUnjpQzxDnivVIA3EAVU/aLv3JcSKs5Wd2ZKP5CXc4z
	ssgW1CBXg/u4MH7SiT2rcJSCHtoGsub1TKtG0qMWiEKFDCQLtVNxvQS+C8OdoEkBJs5VxX+1IGo
	DQw/3bhxRfBubDQnAf+/DIaaVCiD0lFnGKYrgFuHKgwHQTmML1AYIFaxzlJuVjdgQhCf63Kdj7d
	pM5LeHhGS71PIekudjq1SNWs20FkpXs12EG3CcMRwrvHmDnrf5huayBTnccAG5QGSqsNV7+e2l7
	gkKX6oMsdmVmOijnFlbNUlUCgWnckPG50kjFsOx6N8CWmt9Q=
X-Received: by 2002:a05:600c:638e:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-4533caa5df0mr133958455e9.22.1750236225365;
        Wed, 18 Jun 2025 01:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNfo8U44of14xDVOjpsqjNXcN3E3ermr6A+QqtE8oO6byp1IVan3s/P5U8vqMzDW53xvKeuA==
X-Received: by 2002:a05:600c:638e:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-4533caa5df0mr133958225e9.22.1750236224947;
        Wed, 18 Jun 2025 01:43:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4e4f1sm15944540f8f.87.2025.06.18.01.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:43:44 -0700 (PDT)
Message-ID: <8f41d3ed-d490-4207-a907-75090c81bfc9@redhat.com>
Date: Wed, 18 Jun 2025 10:43:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <1eceff0f-4df8-4716-8e3c-e2cb9e142511@redhat.com>
 <ba8ec54d-586e-4bde-95c6-1dc2a9a937fb@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ba8ec54d-586e-4bde-95c6-1dc2a9a937fb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.06.25 10:33, Anshuman Khandual wrote:
> 
> 
> On 18/06/25 1:49 PM, David Hildenbrand wrote:
>>> +    case 'p':
>>> +        if (fmt[1] == 't' && fmt[2] == 'e') {
>>> +            pte_t *pte = (pte_t *)ptr;
>>> +
>>> +            spec.field_width = 10;
>>> +            spec.precision = 8;
>>> +            spec.base = 16;
>>> +            spec.flags = SPECIAL | SMALL | ZEROPAD;
>>> +            if (sizeof(pte_t) == sizeof(u64)) {
>>> +                u64 val = pte_val(*pte);
>>> +
>>> +                return number(buf, end, val, spec);
>>> +            }
>>> +            WARN_ONCE(1, "Non standard pte_t\n");
>>
>> What about 32bit with 32bit pte_t?
> 
> Ahh, missed that. Just wondering which all platforms might
> care about the 32 bit pte representation.

I think e.g., 32bit arm has 32bit ptes?

arch/arm/include/asm/pgtable-2level-types.h

typedef u32 pteval_t;
...
typedef struct { pteval_t pte; } pte_t;

-- 
Cheers,

David / dhildenb

