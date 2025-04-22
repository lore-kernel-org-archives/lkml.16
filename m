Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B028EA59
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333701; cv=none; b=ARtHXL77RIvr8l3PrZAZ8hTVkQkeN88DhedVCSwIDRVHwibSU1J4rMFA2fFuecqeqA/y1xm9sRM3Q+aJR31MkfdczoP+19W0EJBnQWy05tsqgBFcvAxVyoRgo+lQ2syLZHbdBoIEZrrzWmvtp4Zq+MYdgZXxeALDXal61XuNKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333701; c=relaxed/simple;
	bh=Zm9oCDIcst4iG1Sdv0EzgN7tQUykHQ/Qo3PQjfMAcus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKVGrNpJHcNkuKle6rkSFBGl4g7AQlCPnPHvz9GDqO7y4wcvVf7XEepRQk4AePqMholV0rWJqmQmuT3ZsMTCEXWH4XN3EeSJvS6dTSkn82o8FcYZzMBInUVi/pOtA8qrfPwOsfaefVXBLyZxlUkDyRqFjq3lP9kPstfWvI5aMr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PkkpUNx3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PkkpUNx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745333698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=V9n4xCS++5NLC2SIIwS5+2KTMa8y7w2A9E/HfXPsNqQ=;
	b=PkkpUNx3hE4fTBV1+NXyd1sfculW+/SxcpEMWfI/ESF3xQTD0HOFyD1sV7Q2FgsKzPbB3m
	tccUaEStMI1qNI74IT4PqmypTb8fIVDzGvbTKj1RD3X+lCROG/BusZuksd3VCvPA7hsrLG
	hKRsquhhqbGlgTDfUa0LeszppmlXlHk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-OSZQE-bFMzuMnQuYQCqWew-1; Tue, 22 Apr 2025 10:54:57 -0400
X-MC-Unique: OSZQE-bFMzuMnQuYQCqWew-1
X-Mimecast-MFC-AGG-ID: OSZQE-bFMzuMnQuYQCqWew_1745333696
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so30559595e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333696; x=1745938496;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9n4xCS++5NLC2SIIwS5+2KTMa8y7w2A9E/HfXPsNqQ=;
        b=ek69/6jNogqaOb+1yB4LkeU65z3d2ak/q1XYKsBP6wvQETS99Dqs1s94DlEMe92UMO
         yWRa3NF0S8aIe5d+B5S1ZYtqiNpZR46s104wJY7ZeWI0sY8ICi25Q8V2hK/vpHoL01Du
         RdjoBDO0ZL0kV95USJohA5x0/KxsRxPKRj1L7tWHNINnipznfDV+dFHO+Aw6Iagd6Yl+
         VYTjOjREZoRjTam7SUMUd5GT8WO7LU5dcXdJnwf54UKxOY9DBpPvHs6T9CSmQOAm3fNS
         4FpwijBMBOVq+qDC5E42yDJkGYqyoHnqKZmaY67XE9da3UxrPU72UNEJHCxlu8ewUXim
         zwWw==
X-Gm-Message-State: AOJu0YxiyPI/mRV+EbpbcQfpv6/gX/iiC6zXmZFBbT6LFazMJhEMo2hZ
	uafl7IsnO7ayG/IIZ9SFpbdY7kPIlJ+W2LlTpYGaHvVes92yQMVGzT9vPHrE2lQvMQeviNi0KLS
	i2aiI6s0wrgy1n19ev0uuSdixt3up6raWFwUkdDfcb2pj1fGh4w2NXmSn24GW6qmZNzNJVgxiHD
	10CEqCHy81qlKEzIeHHtfhHYgtVpdkss5N0x7roqHXJb0L
X-Gm-Gg: ASbGncuaUb2JffNQYC1N/rSBdHFKFW/Ocvc9Fvga7T9v5ZwHzIg+Of0ialQ1/PqYzei
	5j8tf91rYOxEZqn9P5abdX9arQow/zssz6Rabo76o6Mv7PLTOUVSlRNJEzfyxIhplWD7MNCfMsB
	d5wJiJkRnD7f5us6y4OU58I6T0/N/iTLV0zn4dpGgcLu97JjOw52GKvL2vfNWi1tSB1iHHxCBmN
	PE5iD9SK65tii4weHw5+pYBYa8iMSuCFU9is0vQAWF6DygCQJ8XnIybHBaSb/nb2QVXg5rraZ6D
	1HfzCG5XY0CvTIFZWtMzO2yILQuSvCY6L9dW5USrHmnVEXjuHtPbjUoBOFLVTKcWW1Zpgb1sl7o
	SWBe8Je8FRSiD/wsboPQMu/dukSGnKNHGPhDp
X-Received: by 2002:a05:6000:420b:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-39efba5c43amr12631803f8f.33.1745333695950;
        Tue, 22 Apr 2025 07:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRuEwbBYMQsCCDWda6wGIiHy+7hTwpx+J9K/WMvz6TrXnSpkhfkHpSi71bO195mNjMxFxiMw==
X-Received: by 2002:a05:6000:420b:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-39efba5c43amr12631769f8f.33.1745333695581;
        Tue, 22 Apr 2025 07:54:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d22esm15688875f8f.52.2025.04.22.07.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:54:55 -0700 (PDT)
Message-ID: <9b83ba9c-ca6b-4dd8-8f00-1384c22f5c80@redhat.com>
Date: Tue, 22 Apr 2025 16:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Ingo Molnar
 <mingo@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250422144942.2871395-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250422144942.2871395-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.04.25 16:49, David Hildenbrand wrote:
> Not intuitive, but vm_area_dup() located in kernel/fork.c is not only
> used for duplicating VMAs during fork(), but also for duplicating VMAs
> when splitting VMAs or when mremap()'ing them.
> 
> VM_PFNMAP mappings can at least get ordinarily mremap()'ed (no change in
> size) and apparently also shrunk during mremap(), which implies
> duplicating the VMA in __split_vma() first.
> 
> In case of ordinary mremap() (no change in size), we first duplicate the
> VMA in copy_vma_and_data()->copy_vma() to then call untrack_pfn_clear() on
> the old VMA: we effectively move the VM_PAT reservation. So the
> untrack_pfn_clear() call on the new VMA duplicating is wrong in that
> context.
> 
> Splitting of VMAs seems problematic, because we don't duplicate/adjust the
> reservation when splitting the VMA. Instead, in memtype_erase() -- called
> during zapping/munmap -- we shrink a reservation in case only the end
> address matches: Assume we split a VMA into A and B, both would share a
> reservation until B is unmapped.
> 
> So when unmapping B, the reservation would be updated to cover only A. When
> unmapping A, we would properly remove the now-shrunk reservation. That
> scenario describes the mremap() shrinking (old_size > new_size), where
> we split + unmap B, and the untrack_pfn_clear() on the new VMA when
> is wrong.
> 
> What if we manage to split a VM_PFNMAP VMA into A and B and unmap A
> first? It would be broken because we would never free the reservation.
> Likely, there are ways to trigger such a VMA split outside of mremap().

As expected ... with a simple reproducer that uses mprotect() to split 
such a VMA I can trigger

x86/PAT: pat_mremap:26448 freeing invalid memtype [mem 
0x00000000-0x00000fff]


-- 
Cheers,

David / dhildenb

