Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8E203710
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738699556; cv=none; b=AmSxq0dkWMaHqojItQ/4yP2DNHqb+Rdv2O48FIqKuyRkvSJrwEgpJqqEkEsu+Ex5LIbWJE5HmMQuxzyO28WzkLeAuJUPvfzPu8WMklwfSmA/XS0IKbYUBKI/p7j9TY8RSOOJazGBhseoQizEWfKixgyt3LgrJr0PbAj07PXBRRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738699556; c=relaxed/simple;
	bh=/olLaUo61/eZQsJ3+p1Up6SF1K9ByqVJ2cIpCv1f7rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MotbeUA+n92cLfzNRwbKMw3BQlVgP5B9evBhkF+G57dXFB+H5Wu1UfztpKmGijaLQAlm50yQqg1dY71l8YApNYRt4/+aa3hUaR36mftjCSBlHkdOxGOjJozJqyYubOq6+qtPs27pym0x1Kh2lFmr5iOERG6aA4TW3B22XwI5H+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bZN3jMyf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bZN3jMyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738699553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TG0VBOjtwhIY69XdWI0075eMKEZV/1x1lm+RtT6Fsec=;
	b=bZN3jMyfZC14VUUFArCNL2UpoqRhileJ+CpDamRgrpPTJUmO7ZBEQ/0b1lXR+e8xQxu642
	18E4ArU+1eRWihzDxMuLao+fKCXZi77kF1OOYvaViTI0yBv+rGeUME9Zvo2iwBwAou44Sb
	SQIQ9OEz3xUasK8T9SDcZGpfrLG8jK4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-9e9HPp0ZM3OF7P25kx46Pw-1; Tue, 04 Feb 2025 15:05:52 -0500
X-MC-Unique: 9e9HPp0ZM3OF7P25kx46Pw-1
X-Mimecast-MFC-AGG-ID: 9e9HPp0ZM3OF7P25kx46Pw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so47791915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 12:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738699550; x=1739304350;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TG0VBOjtwhIY69XdWI0075eMKEZV/1x1lm+RtT6Fsec=;
        b=KV6uPbahNmrF0gPAF7wKwaH33SMLU9eAhPWFClt0d7ADxy9HmL8J0+nF9Yt3By9JKH
         Trldjn3ZBwLgrdpfE0PiqUutUJRYl10ZY7KqKjy6BmIfznrnYvDFF1w9KIgWjS8lQIc3
         Sg/v6SSxtZzXc+q5Urr2/OMRNCTnhSSxHx3UNahoVhEGHzDFg8S/HK4AlhM7kGjR5Cyf
         t6FXzoh87HkyG7Xc3Gjft6oSN4kDRAZM96gYGm7cYsvivY3v4XYGsIdEdKl7QKlVIcmQ
         oVldxBcyTnDqUqiLv5XozC+Ham/WN20na+qVcyUVJyGRyo7PgdaZ0/IJiOo76P7R7k75
         +v+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXy/yFNRFXZWEhvqVCf0frTeBs2caNSpj7fkwrfYMixTpLeTQ04/6LD66n1wQJtkCBlKUmuPGvBIkq/cPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7Rq3Fk3VO4XV2/NSZB6SR8Wwv2dejz1iYeTAQej1cEe1nti1
	850BOOld2lQNNUZSBk/OvhEdOLG8cTHdS7DHwfiQpCGRUiEcYUkX6c/E6Gq2eWvM61EpKozU49U
	HFsZTXDwkKUcGGY3thCOQfjvbNvzMqbHHNlpHmHFye2N9JK+I0JSTjFdRxq/ztA==
X-Gm-Gg: ASbGncvJpD/RfTtVsvrDaLtEM3fMN/ojloxCFUC3hvtFEeqQN6EPxkT4QrOepmyyMqa
	6eq8KpoZfd47vckmZFJ8lFIFewMVXKv9WURK9avlots6nLLwtPcCUWjQTK6HIyjg+BapMmTysIE
	3asoq7IPwWTaApDRpWDulpBo/fgqfDfTAbxOKscPwWjyJHRIb8aiqAPNVA2JOErCzLv5Hw436VM
	VmOPUNir0xbM5ubQbpKIcEBx6AZmqraJYGe4rsBd6HVPkAyQblFL+BKa04Cln7UuJ2sR+TMhEwQ
	TcvcdVVhomVCDB6Bkgs77tDUgkUhit4/Z5HYRtU4Nh38rYQAvvZ0GzXObI8mflgCcLgeD8L5nlX
	P3UsceKpDhnbQuAK5AQbLz5jQqZw=
X-Received: by 2002:a05:600c:1c1e:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-438dc40b8e6mr219447535e9.23.1738699550200;
        Tue, 04 Feb 2025 12:05:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl0e1PfrO/acX8KQ8HrvISVvYQxN7zWLjFZBtvwxXbc2Stz1EA3DpEu6vsB8sdtfjDtXs5tw==
X-Received: by 2002:a05:600c:1c1e:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-438dc40b8e6mr219447295e9.23.1738699549830;
        Tue, 04 Feb 2025 12:05:49 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm239135565e9.34.2025.02.04.12.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:05:49 -0800 (PST)
Message-ID: <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
Date: Tue, 4 Feb 2025 21:05:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250204183933.GJ2296753@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 19:39, Jason Gunthorpe wrote:
> On Tue, Feb 04, 2025 at 11:33:24AM +0100, David Hildenbrand wrote:
>> On 03.02.25 10:58, Simona Vetter wrote:
>>> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>>>> This series refactors the existing Page wrapper to support borrowing
>>>> `struct page` objects without ownership on the Rust side, and converting
>>>> page references to/from physical memory addresses.
>>>>
>>>> The series overlaps with the earlier submission in [1] and follows a
>>>> different approach, based on the discussion that happened there.
>>>>
>>>> The primary use case for this is implementing IOMMU-style page table
>>>> management in Rust. This allows drivers for IOMMUs and MMU-containing
>>>> SoC devices to be written in Rust (such as embedded GPUs). The intended
>>>> logic is similar to how ARM SMMU page tables are managed in the
>>>> drivers/iommu tree.
>>>>
>>>> First, introduce a concept of Owned<T> and an Ownable trait. These are
>>>> similar to ARef<T> and AlwaysRefCounted, but are used for types which
>>>> are not ref counted but rather have a single intended owner.
>>>>
>>>> Then, refactor the existing Page support to use the new mechanism. Pages
>>>> returned from the page allocator are not intended to be ref counted by
>>>> consumers (see previous discussion in [1]), so this keeps Rust's view of
>>>> page ownership as a simple "owned or not". Of course, this is still
>>>> composable as Arc<Owned<Page>> if Rust code needs to reference count its
>>>> own Page allocations for whatever reason.
>>>
>>> I think there's a bit a potential mess here because the conversion to
>>> folios isn't far enough yet that we can entirely ignore page refcounts and
>>> just use folio refcounts. But I guess we can deal with that oddity if we
>>> hit it (maybe folio conversion moves fast enough), since this only really
>>> starts to become relevant for hmm/svm gpu stuff.
>>
>> I'll note that in the future only selected things will be folios (e.g.,
>> pagecache, anonymous memory). Everything else will either get a separate
>> memdesc (e.g., ptdesc), or work on bare pages.
>>
>> Likely, when talking about page tables, "ptdesc" might be what you want to
>> allocate here, and not "folios".
> 
> I just posted a series to clean up the iommu code that this is
> cribbing the interface from: add an ioptdesc, remove all the struct
> page from the API and so forth:
> 
> https://lore.kernel.org/all/0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com/
> 
> I strongly suggest that rust not expose these old schemes that will
> need another cleanup like the above. Page tables just need an
> allocator using simple void *, kmalloc is good enough for simple
> cases.
> 
> Drivers should not be exposing or touching struct page just to
> implement a page table.

Fully agreed, this is going into the right direction. Dumping what's 
mapped is a different story. Maybe that dumping logic could simply be 
written in C for the time being?

-- 
Cheers,

David / dhildenb

