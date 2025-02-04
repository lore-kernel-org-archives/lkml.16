Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DA2080D7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665212; cv=none; b=X94EfHy8hOAnfLvd1EO4H2bVBzzvGeZWdlx5Zub8rUgjAAOI2yjhZZrpU9jturxwzEMkqE1+L2xQNYC8KaH183EGKoClir/ZHIOnZLO0nMUJSl6dhPT2f00cgeGC3FL1SXxyOi1beYgYgXH/j723r8ciCOvMidnKpzdYddKOCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665212; c=relaxed/simple;
	bh=clAoy2znCo2xQaRpN04BsX/Jlt5NhiyxhV9tU/geWuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J2hYcY7GD9qGpPde04Kpnz9K4i6x1+zLfVP0ev3j0FbOYVGJfvqgK1yric1IOqXfo+aA9cAy1ulSIuxlIm4B8xfr30PY0x67RigrTMspu3DfP7Nc7ZsWse+GnqowuOhrrVSYQ+P6ppBmHzvweo9+JNgu2ThWAOHADd5DgIqd7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CiFziZKV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CiFziZKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738665209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yy2YcCoH8vLRUbPjUQceyiGbB/n8HRoWxC0XWbSBbdI=;
	b=CiFziZKVWnHOU3SANEE0exDN93e4IxHiTegcIn9fmHjSYlcLPz872UmtGCWMflpgckfAfO
	ZicHM+KdBY9x/dPvfDzCOhtHVrI/oQO+ME7t5N6opny+2ols02+QI1Oc2jlmzCZQFnjj0L
	uD8Sne2G4nnVv9LUbPvJHHcfMHJAM7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-FVx8ICffPHqBWGjKHmj1hQ-1; Tue, 04 Feb 2025 05:33:28 -0500
X-MC-Unique: FVx8ICffPHqBWGjKHmj1hQ-1
X-Mimecast-MFC-AGG-ID: FVx8ICffPHqBWGjKHmj1hQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43628594d34so28129905e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665207; x=1739270007;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy2YcCoH8vLRUbPjUQceyiGbB/n8HRoWxC0XWbSBbdI=;
        b=hC5ZLDZPXMYM9Z9yNWBXRJE1jUOb7ZAYuQkpsDRM1OK+wxr4CvFvdJWbxfXznvML60
         2EeRguTXC7oPjW5C85xX2XyCczwv1/EvX8NeQpY3XhSKdG6FadL0Vz2UApYXbPODCHYD
         mU5ChZgEOBMumcsf5KWwzhrgMqsUyHZj8w3Wr2AivBVYiG54LnVnXCLW7hVG9SSTnegL
         /dFcdA6x9P2Nduy43tUkYs6zu39Ff5ENjXObda0sXpWTpZDmlWGTI0EtTAXlUcVZaJL3
         zgp9JjoCJ2be4uXDOlnNqMGiJZBZS0GxzS95ri/o2jQD1tdYZnbcwglhNBRPXxP2VltR
         gVhA==
X-Forwarded-Encrypted: i=1; AJvYcCXw5B08RvFLp1nMH0mvBhOUpN+OLE7olXhmY3D+xXiqDSrN5XVnDwMzgGE6Rh1fVbn0BjyE27K+1LIUEj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKjrQ3XZN+V9BOOp1jZVYKx1nXotZoVqmcioZ/Ol79BKrtLDn8
	MrszMnjtZA9zwR2jumpF1ED21lcofrEMNPRlNNw6T6/6Y+ZFM7ASZ3aw6VPMuQCdt/XHO94ulFh
	z51sweFABSZ+NvSv2UpGccw4pHW7n8DX2Ca4c2lQvPF27PQKTeJdpnABFiLNwhA==
X-Gm-Gg: ASbGncvTTv7hoqCLI3b/pFav78dAf+D4p6BVK2p2Acl9GXhFAMZqpw/D1hy6jmDy+uK
	20fzivCQ+17GJ+OpuUP6ay+Hohh5roIo0ZHXJcZTdt0MlfzxWNicI4aGxyGUHm2xiJVpbzEEX1z
	obTi2at9YQDLt07i+Ot9K/SpT9suJBFxzE2jL7eeALVA95/KMulYrl5Yo7nsflvm4TEe09MDZBt
	CK3bOqlVzh+m3Rdam8cHrn1JJnPBmPlvrB1rWyi8lNUnjHiI4zi5SeRIFhL1UnqeH2vsCac11NL
	3wYbnIc4uIDWPX2h6vTyXhi4mOPsuWVLy8VRzwdMuYwQTD/+EEhSZRUeyXJKXnUdFpSyXH+j809
	g0PG3AjjCKJZJNUYsnxKds/W/6lk=
X-Received: by 2002:a05:600c:1e1b:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-438dc40ffcfmr206405665e9.23.1738665207167;
        Tue, 04 Feb 2025 02:33:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhXa3p8fLF86zz7ZWoFvpMmhvGqL5LUgi0p6/K4bHUqzfvvX8VkPoos3ndj/J9gUNMcZDIiw==
X-Received: by 2002:a05:600c:1e1b:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-438dc40ffcfmr206405315e9.23.1738665206729;
        Tue, 04 Feb 2025 02:33:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2e384sm226274815e9.19.2025.02.04.02.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:33:25 -0800 (PST)
Message-ID: <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
Date: Tue, 4 Feb 2025 11:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z6CTLB2NggwYafi9@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.02.25 10:58, Simona Vetter wrote:
> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>> This series refactors the existing Page wrapper to support borrowing
>> `struct page` objects without ownership on the Rust side, and converting
>> page references to/from physical memory addresses.
>>
>> The series overlaps with the earlier submission in [1] and follows a
>> different approach, based on the discussion that happened there.
>>
>> The primary use case for this is implementing IOMMU-style page table
>> management in Rust. This allows drivers for IOMMUs and MMU-containing
>> SoC devices to be written in Rust (such as embedded GPUs). The intended
>> logic is similar to how ARM SMMU page tables are managed in the
>> drivers/iommu tree.
>>
>> First, introduce a concept of Owned<T> and an Ownable trait. These are
>> similar to ARef<T> and AlwaysRefCounted, but are used for types which
>> are not ref counted but rather have a single intended owner.
>>
>> Then, refactor the existing Page support to use the new mechanism. Pages
>> returned from the page allocator are not intended to be ref counted by
>> consumers (see previous discussion in [1]), so this keeps Rust's view of
>> page ownership as a simple "owned or not". Of course, this is still
>> composable as Arc<Owned<Page>> if Rust code needs to reference count its
>> own Page allocations for whatever reason.
> 
> I think there's a bit a potential mess here because the conversion to
> folios isn't far enough yet that we can entirely ignore page refcounts and
> just use folio refcounts. But I guess we can deal with that oddity if we
> hit it (maybe folio conversion moves fast enough), since this only really
> starts to become relevant for hmm/svm gpu stuff.

I'll note that in the future only selected things will be folios (e.g., 
pagecache, anonymous memory). Everything else will either get a separate 
memdesc (e.g., ptdesc), or work on bare pages.

Likely, when talking about page tables, "ptdesc" might be what you want 
to allocate here, and not "folios".

So in the future, this interface here will likely look quite a bit 
different.

(I know there was a discussion on that on RFC v3 with Willy, just 
stumbled over the usage of "folio" here)

-- 
Cheers,

David / dhildenb

