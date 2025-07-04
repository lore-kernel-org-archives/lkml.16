Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05810136E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621663; cv=none; b=SmmFLv0N7amHH0dXpM6jZGQlwNhqQRy9DxWmkndMVIbGTgmTRy9z+3fYmNSnub4ZC9g+g5DGIOEEa5FB4d6UkDhVc0j662oKOnbg251fclS53FvJtFe12sPFwtSmBVA4pqZVePRcmho2hyiBrdaXS6ZLzbFZG/GQxIKGdrrdPJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621663; c=relaxed/simple;
	bh=5W+mBk1T7SRSreBG4Asnvz67nlDmhMK9+EHjLKRrYpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwnFEckXEkvCUslcVM8vW0N8J8iEWLMi99rZ4ox/w3xTY6aDUGvksp/JBgMpQOhFg+BELufI4/f5iwYIv1vii74AzkScd4yGI2V5KhL4Xf0CFOLeItIMt3adn9AQ9vuQ69H8/pU1Cf2MB28wcy8myru2mwDBwW3gHwEj3gy5coA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YuztWvAr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YuztWvAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751621661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vUERQM3v5VllKmAdt9GYRM2UgOciLRiZRDMGXoHbHdY=;
	b=YuztWvArldf9enrssEV8gEUqJNZpTqayfGqoudUOmJ1zo8alj864rYL3Ao96exo2QDD3YP
	YRbeidI/kyYxagFGKP+qPaaWlaingIEb8WMXf+fmDrBuaT9S1c9xApOj/MlUupxIamDWGp
	g8rp5GleT6/aJJCeLscREQ8z2dfSqJ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-G1dv30CGOJOhc0PnFc_kgw-1; Fri, 04 Jul 2025 05:34:18 -0400
X-MC-Unique: G1dv30CGOJOhc0PnFc_kgw-1
X-Mimecast-MFC-AGG-ID: G1dv30CGOJOhc0PnFc_kgw_1751621657
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d64026baso3021925e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621657; x=1752226457;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vUERQM3v5VllKmAdt9GYRM2UgOciLRiZRDMGXoHbHdY=;
        b=gsiFvyDKrNFebgokkNIYIxwEv9dRco71r9gcajTBpK8eUAt6iPAPWn5ZeZSsl96Nel
         YEt8hcHU/Eaz8NEW5Yqm+AGe3uavK2rz+BhxMFTEAqcmHofftBszxNOybtzlRjDYSDU3
         Qih7mDiW6ks/mz5Z3HCeeKwOAQggTuTY/05pdt+IBN4nEsz8MMLTg6I6Xlfp6CZd1Qyx
         p7XYVBJHSD48sod0/RdWCsJ/2jjvbPo0eg5XGplVSzQn+E4yxqZf5xMiFrjGOc4wQzOS
         2OqbsnSo2m3eojFP3ayVbq8kw/HNGKM2d2aUv+k4zhXWUd7G+TRvAEzDBmNg1MzX6Txu
         wEQw==
X-Forwarded-Encrypted: i=1; AJvYcCUuxM7PJDSkocvX6CxYG24y5KoTvmIcdWiLh28N7wCzt60DyUwjyFN1TIy16K5IbsD/gdQIg4p4iXs8HHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQz2vqTVH9dp2UKm8wrwH1200n/wWa1XvQ9bbALY/OAKProwy
	HTspOnAVgM57Cm0Jck09M5I87UyF8/IUtampKyIjgYijxMAfsB/ODRd+AaN/sGyPmn0Oq327XzX
	XFLmUlaGOigg/kxbH1IY0XeRt7ejKkIs6NOp3zXhQlGXtaoVoKoeh8mjPd0k6Kbhz/mCn7MBvoQ
	==
X-Gm-Gg: ASbGncu0yUSpQKzGOm1kH0IiHCC+UfujhPVXnU/MVm1ognoHhnwabUrm2pGBzGFPfqJ
	Sf81XlFvBmoyLUCuGPpCjrZVhzcwCzy2iIJAusaOdEMZpMfv7Omfe/UUoYQSZ//e3Psq0+aKlrI
	t6biUMiMRoXrRPSiGKzuQ6qbw+ZqO8IZSzT3H4UBwY7nSm9/A+aZ8Q7Tj/+IYmVdcybIniYPLeA
	HWUpCQGYCbq4rwKdSrU4dx0vXaZW5KpmeqxHWec1bFeo/3A4Wxqpdf+Z8FsCwgWaxGm7+3VEKvk
	2YYfToltvjOPWFg/lT6NsqHrdNsFpT0NOP35mPLgnz/kz3Uf+Aj+m+BWreUPptzCs7xvRNA/Fe4
	XpQtlFHpGsQ47aNDzoYEMZrqqV+UNC/LLVg/jMwM0VgLAdVg=
X-Received: by 2002:a05:600c:6986:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-454b31091ebmr16668195e9.6.1751621657289;
        Fri, 04 Jul 2025 02:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOZC1LO0fx4NHYKNyc9x7D2J0uIQgS+jfV+8CMPe9J8Gr3bIH5iG32fG6pfWAKzTjixOX+3A==
X-Received: by 2002:a05:600c:6986:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-454b31091ebmr16667785e9.6.1751621656860;
        Fri, 04 Jul 2025 02:34:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d07ffsm2073032f8f.31.2025.07.04.02.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 02:34:16 -0700 (PDT)
Message-ID: <289eede1-d47d-49a2-b9b6-ff8050d84893@redhat.com>
Date: Fri, 4 Jul 2025 11:34:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
To: Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 James Houghton <jthoughton@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Michal Hocko
 <mhocko@suse.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Axel Rasmussen
 <axelrasmussen@google.com>, Ujwal Kundur <ujwal.kundur@gmail.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <aGVu1Isy-R9RszxW@kernel.org> <aGWMsfbayEco0j4R@x1.local>
 <aGbCbW7hUf3a2do2@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGbCbW7hUf3a2do2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 19:48, Mike Rapoport wrote:
> On Wed, Jul 02, 2025 at 03:46:57PM -0400, Peter Xu wrote:
>> On Wed, Jul 02, 2025 at 08:39:32PM +0300, Mike Rapoport wrote:
>>
>> [...]
>>
>>>> The main target of this change is the implementation of UFFD for
>>>> KVM/guest_memfd (examples: [1], [2]) to avoid bringing KVM-specific code
>>>> into the mm codebase.  We usually mean KVM by the "drivers" in this context,
>>>> and it is already somewhat "knowledgeable" of the mm.  I don't think there
>>>> are existing use cases for other drivers to implement this at the moment.
>>>>
>>>> Although I can't see new exports in this series, there is now a way to limit
>>>> exports to particular modules [3].  Would it help if we only do it for KVM
>>>> initially (if/when actually needed)?
>>>
>>> There were talks about pulling out guest_memfd core into mm, but I don't
>>> remember patches about it. If parts of guest_memfd were already in mm/ that
>>> would make easier to export uffd ops to it.
>>
>> Do we have a link to such discussion?  I'm also curious whether that idea
>> was acknowledged by KVM maintainers.
> 
> AFAIR it was discussed at one of David's guest_memfd calls

While it was discussed in the call a couple of times in different 
context (guest_memfd as a library / guest_memfd shim), I think we 
already discussed it back at LPC last year.

One of the main reasons for doing that is supporting guest_memfd in 
other hypervisors -- the gunyah hypervisor in the kernel wants to make 
use of it as well.

-- 
Cheers,

David / dhildenb

