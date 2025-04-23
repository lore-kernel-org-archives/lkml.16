Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC61293452
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422237; cv=none; b=oUt88hKPftGz0K4f92FyEi7xW1vMXlJ71oiTElgSFBMgbEdUaJl3ulyIsjiqX5HChb5vG8HRtJWGVU8Zr2uY9qc5lmS4xxgCLPM2FqoKzVa4Zp7F9VomeB8l5D+bKfg97W/embcQKs1wmfg6I9Lpfk6WKkTdrhFzXAqEY6Us+5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422237; c=relaxed/simple;
	bh=Vivzai33M5M8JmKMXQPDIeM9vDBB8fWL2SEo9HplLtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ID7aoE27L1T4yfvE1MbkK2qfZRyjdLMSgmb6rD+pO6TvfCVjY/DNSlY7YNz4WARc8+yCeZGsdItyr6/aFxcLlnwcV4V2TEUpY9N8yQsuB7OcesjdwsA2kjzIYyGiyWESO/YZNQ8iDEYzxsU+uNz4+i0JMH6EmNlyCdNzAwuLASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fwzs3stg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fwzs3stg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745422234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M797C/ITF0HAWTXP5yhOrI7XoNfydx3Ludug+71sxiA=;
	b=Fwzs3stg+ZP5mzc2+SNXuMIod/Y/261NwycIMuM2NoS0hlSqaCx5tXjbGylbtC1IcPk5Ih
	VX9SYZT2jVXHjSRUgBkVIr0E0SGtwXafTN+bel15hDuReN6IZfeiAQ2MRyMsO+CpYnLz2Y
	9cShGhGHAwfn0d0XM+kXagnP3lPSC10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-MFgMEmCOO-OJmYFOFpWKAw-1; Wed, 23 Apr 2025 11:30:33 -0400
X-MC-Unique: MFgMEmCOO-OJmYFOFpWKAw-1
X-Mimecast-MFC-AGG-ID: MFgMEmCOO-OJmYFOFpWKAw_1745422232
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39130f02631so2340145f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422232; x=1746027032;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M797C/ITF0HAWTXP5yhOrI7XoNfydx3Ludug+71sxiA=;
        b=AdAqU6juIn23RmpNaoDOMMDjKWd+b9mL0IdW6KScaXv2Wkg9PnVFy9V+ZSs5HjHiwI
         8lhW5io7iM7IQg6CkYAjT0wELOH7vl4rziujaigR70HzSgzm5WjYIuUuKVKcpFFQENkd
         KReYFUvXtiDuCwR6Gg7FtqNMhWVvczLfaeitBjfqm7YWBDhogchXgkI3X9eLZhAQoyBZ
         VNkyZJ4WR9ubNhvFYN3Po+C0byotVD7gTZdPK2ro8t9C8L8AmMzDFOYHmWsSoWHnyhgv
         VpK2udPiDy24f4YuCWQ2psUP1tBQuSys7RuPMDsTI5obN92Tl2/EZ9guJFtQWtCg7iEo
         C7sw==
X-Gm-Message-State: AOJu0Yx1ftjedg6XG9o3wLsJ8BUP5SOiDzRxjGJ8Khrb2IVFacyHNmVt
	zpSQprHZ8G7zutIzzYgo1sKVRJeozlheFKWoSV2k9yAiWlciEEWnQ/vuXhVX8/KhQrMhdHzk0S0
	obx4YU3614He5GqNQ9Q8hVnfC0lz7MbmPe5uqeND4W6YbD1YSqrr3ndiDrwChEg==
X-Gm-Gg: ASbGnctxZBiRPh28FfGWPSH0zFSoX/nH5e9SjvUt8ewmTvY65GbjsTh7dH4XtQsM7R1
	uKuzSc5VfP3eRUOuo3vGHRMMZEVqBOHA+NVskDsEMCsTqHjRB0vITeX1IiQy26E1LdMp6xygeaC
	YeIw9zDx5uOZvRZ//j1iMetNQ0r5n2wKh3zKdLsQTPxNvuPIJ7oD1Aur0yVl4xjeS3wkciPJ1IG
	MRtOprMYyFRUCORs4lfU10+G5XkRe7X1Thiyacd0MAqJTSYjmE2k5RXig9Mki+46T0QwpCQ5H+c
	10PbWtDa9Tw7Q5/87nAO9gD1pClPLPF7HixlQmadSCbcFeJeSCjxjdf/R4l5sY1NkbLOQA/Uv+v
	0dVPJYfsmKVfmCcxqsefTdjxp9kkU6ixKQVJ4tp8=
X-Received: by 2002:a05:6000:2483:b0:39f:f4a:e852 with SMTP id ffacd0b85a97d-3a06c3d281cmr8825f8f.55.1745422231913;
        Wed, 23 Apr 2025 08:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7jRETXRnxkRae/SMJsqLh+ziz7A4V2u74HPeURUqUHuiBNkAkhRAGBWIYLnde5zc4MmpWrQ==
X-Received: by 2002:a05:6000:2483:b0:39f:f4a:e852 with SMTP id ffacd0b85a97d-3a06c3d281cmr8795f8f.55.1745422231512;
        Wed, 23 Apr 2025 08:30:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:2c00:d977:12ba:dad2:a87f? (p200300cbc7402c00d97712badad2a87f.dip0.t-ipconnect.de. [2003:cb:c740:2c00:d977:12ba:dad2:a87f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c0fsm19072148f8f.88.2025.04.23.08.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:30:30 -0700 (PDT)
Message-ID: <1d65a3fa-b870-40ba-ab99-e7e17b6297e5@redhat.com>
Date: Wed, 23 Apr 2025 17:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250422144942.2871395-1-david@redhat.com>
 <9b83ba9c-ca6b-4dd8-8f00-1384c22f5c80@redhat.com>
 <7f8ed4e6-1743-4eaa-916f-25dca7575346@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7f8ed4e6-1743-4eaa-916f-25dca7575346@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 16:42, Lorenzo Stoakes wrote:
> On Tue, Apr 22, 2025 at 04:54:54PM +0200, David Hildenbrand wrote:
>> On 22.04.25 16:49, David Hildenbrand wrote:
>>> Not intuitive, but vm_area_dup() located in kernel/fork.c is not only
>>> used for duplicating VMAs during fork(), but also for duplicating VMAs
>>> when splitting VMAs or when mremap()'ing them.
>>>
>>> VM_PFNMAP mappings can at least get ordinarily mremap()'ed (no change in
>>> size) and apparently also shrunk during mremap(), which implies
>>> duplicating the VMA in __split_vma() first.
>>>
>>> In case of ordinary mremap() (no change in size), we first duplicate the
>>> VMA in copy_vma_and_data()->copy_vma() to then call untrack_pfn_clear() on
>>> the old VMA: we effectively move the VM_PAT reservation. So the
>>> untrack_pfn_clear() call on the new VMA duplicating is wrong in that
>>> context.
>>>
>>> Splitting of VMAs seems problematic, because we don't duplicate/adjust the
>>> reservation when splitting the VMA. Instead, in memtype_erase() -- called
>>> during zapping/munmap -- we shrink a reservation in case only the end
>>> address matches: Assume we split a VMA into A and B, both would share a
>>> reservation until B is unmapped.
>>>
>>> So when unmapping B, the reservation would be updated to cover only A. When
>>> unmapping A, we would properly remove the now-shrunk reservation. That
>>> scenario describes the mremap() shrinking (old_size > new_size), where
>>> we split + unmap B, and the untrack_pfn_clear() on the new VMA when
>>> is wrong.
>>>
>>> What if we manage to split a VM_PFNMAP VMA into A and B and unmap A
>>> first? It would be broken because we would never free the reservation.
>>> Likely, there are ways to trigger such a VMA split outside of mremap().
>>
>> As expected ... with a simple reproducer that uses mprotect() to split such
>> a VMA I can trigger
>>
>> x86/PAT: pat_mremap:26448 freeing invalid memtype [mem
>> 0x00000000-0x00000fff]
> 
> Wow.
> 
> Might be worth adding a self test for this if not too difficult, even if as
> a skipped one w/comment just so we have it ready to go?

Yeah, I think it's as stupid as mmaping two pages worth of /dev/mem, and 
then munmapping only a single one. It's so easy to trigger that it makes 
me absolutely angry.

-- 
Cheers,

David / dhildenb

