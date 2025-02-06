Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07DD194A6B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864948; cv=none; b=HccgxxRiy3X0ttXOoDnyiLcNdNcuHjg7K8uRhlk7P43qJeCyXRiUSzoaQP8p4nOg/TRE8ZqE3YfSo+y4UZ+nUI8Biod+xgbt6E2Qlur8oJumNHEsxufhMgALjfIiU1cJED616DaBq8PdL4HLgZ7EsiDlNPmT3aoFXw0Oxa+8kzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864948; c=relaxed/simple;
	bh=fFX7WX7rESi57HzdupGRxeDT1ZOE6dLiv8gi7agAbqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtVvkCym5bbzbYfYoNR6pNQp5sVNDPNlT5ej/NIAwghrOtBlwgvLkklKTa8wJ+ohILrtlUHQbasKUzUt2HSqyi9Sfv4B0oxwjyH/Sjc5EZ2j6GFBqUtwpD9EQq+6e2TbBuwb68QgKnszn9EwmA/aCYCYmqne2tBdUMEWORvGXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiutHiC4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiutHiC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738864945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H/X7JAyslUMpcovSijR9H3y4JHmJ9YSE8ky354gYVF4=;
	b=NiutHiC4Ckgg5nLWtpIlCYvsXbl8cpM4cInhH4BNVkeOnZEPGIpmE8IvExxqic2KOG0RhR
	UFLUslzkRgR8DLxOPSUpouCGKaAPyCiyWGHg9JxD3pA2fgWfS8qe7gcMjolw6n5TDOf0+W
	ZrrI5j/9ItCOdTo32Hv/wUTS6Mun+YI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-vhzkh2LDP2e2esXWeIjm1A-1; Thu, 06 Feb 2025 13:02:24 -0500
X-MC-Unique: vhzkh2LDP2e2esXWeIjm1A-1
X-Mimecast-MFC-AGG-ID: vhzkh2LDP2e2esXWeIjm1A
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa66f6ce6bfso133304066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864943; x=1739469743;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H/X7JAyslUMpcovSijR9H3y4JHmJ9YSE8ky354gYVF4=;
        b=GK5u+i1PzmjblpF10fq5txLqiMh2hNSfQc13/2LcBqRUKQ3HxSZEvu/XyNyimO0Ob1
         S5uVwDh9Gkar27ynyFvjnkHnWSfmtjKVjxDl1c6QrTcVd9UVOrtgedo65xv0U438JFEZ
         qQZvgxrYpg4BE6smJNUgHoOld8SQOEdcyO5ZgtlUXdNB4RSb7Cg3kTsbfg7ukGFTnXTH
         Ju0n/Y94+twR9vOFUmKGpceeaXT8lfBJYSqzAVSpwhH6kJ0iFaJcorCJgB1wadVZ8FSG
         zUVtf5JYLAFFkyu/fHJdr5FbderrZNLlJwiVpNmPGspVF1FDQTTVzJT2xFmAQap9+0Ky
         unMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkft2j1jHbQvvZWpvjLqVlE3sc6xUzeFsMOtW86clHjaG143JccuwvzanTCX27gWVN0wWWihvZojQVohg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoaEuZvwn04GTN7+Ih9eX1mMhLoYLRmcSn1ZdIVS+6Co9AUmt7
	6a2HW1OAfskoo5FWkiIq7NFjiPNrAbge76ZEwmvYVcxYAyJIcD5dTBqI1Y8UH8cDO1vvFFdVfra
	v+nMz8AByjDDgMFgcdeH/yTh3CWP3tvv9MO3DyFN3w2AU4Gtk+VBRx98aWZYAyQ==
X-Gm-Gg: ASbGncuhQ00CRQLbtyvf/pFFQmYqjqpBfssJcylIpHCb13Stk8JAqV549zvUm2F+lk6
	fywkfXEdEl/F5wmwOWmiUZkygtOhWzzBZPCcaRoP4lbKh4uaTkxgHEGJ6fPr0z/QuPOetKmcX78
	RY8t9wvhWPw/Nou9Ss2S7//gc7Nj/5EgO9kCs7eK31As7d47EyWlxjBSzI7dPXS87AAeRACXvpJ
	rnYOdaIAnTd5XvsFe29D1HOCC009deHD5lR7ZWMMp0QNftTA1bb192Jg2n1RraVbzl0xbvJ4jDV
	Fot6lBeLx+GYI+Q7gbtRChkYoWWCgr4cffRoFi60IIrlyMgBsKzkmtspO7l2alXvUwqEO//H/9f
	eDWhb60ieX3W5AnZ2YvqLGSInbvqRWGMF
X-Received: by 2002:a17:906:f59c:b0:ab6:fee1:60e0 with SMTP id a640c23a62f3a-ab75e0cde78mr953331166b.0.1738864942855;
        Thu, 06 Feb 2025 10:02:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1CRSDzu2YE392s9ny77vHMbFVHNidfotWm3TklIkUk0mLEzrAsbd8dkVb+LKOWwa7+Aobsw==
X-Received: by 2002:a17:906:f59c:b0:ab6:fee1:60e0 with SMTP id a640c23a62f3a-ab75e0cde78mr953310066b.0.1738864940868;
        Thu, 06 Feb 2025 10:02:20 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:3000:a06b:56f1:d152:db83? (p200300cbc7073000a06b56f1d152db83.dip0.t-ipconnect.de. [2003:cb:c707:3000:a06b:56f1:d152:db83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f4870bsm134060366b.32.2025.02.06.10.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:02:19 -0800 (PST)
Message-ID: <38333d54-62e4-4d61-a49d-48489d6f977e@redhat.com>
Date: Thu, 6 Feb 2025 19:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Asahi Lina <lina@asahilina.net>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
 <20250204202656.GL2296753@ziepe.ca>
 <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
 <c4c39ea5-3602-4b92-9ffd-af33e122538d@redhat.com>
 <f8d06a49-4154-42d2-99c9-f8d59d39ab9f@asahilina.net>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f8d06a49-4154-42d2-99c9-f8d59d39ab9f@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.02.25 22:18, Asahi Lina wrote:
> 
> 
> On 2/5/25 5:47 AM, David Hildenbrand wrote:
>> On 04.02.25 21:41, David Hildenbrand wrote:
>>> On 04.02.25 21:26, Jason Gunthorpe wrote:
>>>> On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
>>>>> Fully agreed, this is going into the right direction. Dumping what's
>>>>> mapped
>>>>> is a different story. Maybe that dumping logic could simply be
>>>>> written in C
>>>>> for the time being?
>>>>
>>>> ?
>>>>
>>>> Isn't dumping just a
>>>>      decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?
>>>>
>>>
>>> IIUC, the problematic bit is that you might not have a directmap such
>>> that phys_to_virt() would tell you the whole story.
>>
>> ... but it's late and I am confused. For dumping the *page table* that
>> would not be required, only when dumping mapped page content (and at
>> this point I am not sure if that is a requirement).
>>
>> So hopefully Asahi Lina can clarify what the issue was (if there is
>> any :) ).
> 
> Yes, the crash dumper has to dump the mapped page content. In fact, I
> don't care about the page tables themselves other than PTE permission
> bits, and the page tables alone are not useful for debugging firmware
> crashes (and aren't even included in the dump verbatim, at least not the
> kernel-allocated ones). The goal of the crash dumper is to take a
> complete dump of firmware virtual memory address space (which includes
> the kinds of memory I mentioned in [1]). The output is an ELF format
> core dump with all memory that the GPU firmware can access, that the
> kernel was able to successfully dump (which should be everything except
> for MMIO if the bootloader/DT have the right reserved-memory setup).
> 
> I *think* phys_to_virt should work just fine for *this* specific use
> case on this platform, but I'm not entirely sure. I still want to use
> the various pfn check functions before doing that, to exclude ranges
> that would definitely not work.

See my other mail, in /proc/kcore we do exactly that. See 
fs/proc/kcore.c, especially the KCORE_RAM case in read_kcore_iter().

So I would hope that at least for the Devcoredump we can find an 
alternative that does not require rust bindings, and maybe not even new 
c code at all (in a perfect world where you could just reuse  /proc/kcore).

-- 
Cheers,

David / dhildenb

