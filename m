Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F8A19D897
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865064; cv=none; b=MfaG71ZZJut2VXVJrl7DATnQEI4fVa+ZD19256EQbBz/47098ezHBHdAhuO5ZPl5p6v+7aXAFOf+rTxXonCPFXgPybj13Hls77lDEFSlZC2QCr4HNRXgxZQKywOnvEvdVH6SYRp8uVh0iXgMyGJrj2TQdLqSSimgZdsrU6RdKgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865064; c=relaxed/simple;
	bh=T0DI0JofVAkbw1Fe6I9oZn/jHPe1wt/WWlApIe7Pf80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERJlHictceU2QESGJh3XZUVLtE2qhItjJbnOvCy+LvFtxIRe/kNGOzTlR/TgQgpxV8+72YsCY5+8xdcH3YNztMiEFnEacQ6euNUGS2HwnOPTR4C3812jDe6Up0wdrEQs655pXURkhe7W30mFyx/xifURpJ34YTy7LTwLoUGurvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GigHGUj2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GigHGUj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738865061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2iLngwadKtjP/PPZuVV7/kgfyghHfqUDPiEJHU2hVxY=;
	b=GigHGUj2sUlSoQRAk6WWfRaChl8whW+kcknAnWUt05Rd7bPqq8Z/NkloTTzV9sCyFHtcQv
	tdE0aMU6SohQ1vHHLnzULUSoOxgLzu9wd0TsQOeOeJcTcBl/jUMx9cYLnmZa9IRxWUKOpk
	4lM3BfdwD2LNWdq5MAARnopwerGjixw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-8vnYESO_PQyQBZj1dHPHig-1; Thu, 06 Feb 2025 13:04:19 -0500
X-MC-Unique: 8vnYESO_PQyQBZj1dHPHig-1
X-Mimecast-MFC-AGG-ID: 8vnYESO_PQyQBZj1dHPHig
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38da839b458so511540f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865059; x=1739469859;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2iLngwadKtjP/PPZuVV7/kgfyghHfqUDPiEJHU2hVxY=;
        b=vEEDor4JtwrG5Xrxx8Jb7NppBROCcQ60SjmUuHN5g0N2z2jnwSadetDoya80b9eCfo
         3nMNMB4XltROJtxvQuDfwkfccvvOmjakm6kLr5N3Wa+06cKredGbpzgEYNob9/QF/CUd
         xQ5cc1HhJYupFM1eq2Bzsmt3+CFjeJgsv8GS8IjelOaGZK7fFb5+sLoxj3KNGZ8+xMcM
         1/ANEX5cP+FJH01yLfgNJGKWFR+W7okL/l18sMUWCE7H+mhNyEvNj90x8fWfMnylZUDu
         LnFn9J+ZiK7kfnEGeVECzJSogwSWDCvu4aJrxA4CtrR2CYt+FXUdIzGyNjkQFbZycax0
         5XvA==
X-Forwarded-Encrypted: i=1; AJvYcCX9rdjoLZn4sdYDDgoK19gQeoA7DdNMycWAJQzIq+UkrBoJQTGCMn8kCLRQzJH8LHpue6/Huwd8ZQ6uqzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPxzJYqExCMfGljYlByWFWgA6J36bY7SDLVf2AcnIpkYGSvas/
	GmC3ukSCFIL0mSbJvf0BCYQo8C7uQgZ2rCWOHkZp89BWRVOTLTXzShynlMOd1Afyxi5lvT2dBII
	x7EyOQXFuxGnBghxCZ94Lak+myXg9YPgRV1ShJxL2woSLaT2lixnEgYPV29uhDQ==
X-Gm-Gg: ASbGncv2XzKWCuJmV/TocdKcihSlbwo/2DZ8IQA0yHigxQ5a1MpfhPgLw6sF/OItXVg
	um9Txm2Uvoyi1y2Gc4kG7ROEY9dfYaToUAjnc+NgUqwtSa3q3cpuWjUCMn5AKmOe5SOu/RwKDqn
	Fht5a6QzHp17plgYJ/YRLW8YaH7S9yFwHxlIIi899Kl7Q/TWZYHMIq2ZIRfGw12O6M9XI1oGTMS
	MyFYKBZW2xpBSXiojXbsYSIA6eK6bCMekaLVjHCDIphdRDrvXdg8eUXl24BmH6tnxAogsQtUZqS
	WRFQ4nFyj9Q+BqtVCpatFXTiQIpXysrd+d7j48L1p0gCxkrxaU09/x6xdPiK0yV9JtJDjYiAn3p
	GMLW3HBOlPuOLlNpb6wag38bEPlPmKQVo
X-Received: by 2002:a05:6000:18ad:b0:38d:ae2d:f06e with SMTP id ffacd0b85a97d-38db48ca915mr5947572f8f.24.1738865058644;
        Thu, 06 Feb 2025 10:04:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3HxpDV6xjqpzJhQ93aTQD5J/RbAQKck/VmexSIwLXyJ1yhaWNL5QfiD8VtN7YRU4Ifik2JA==
X-Received: by 2002:a05:6000:18ad:b0:38d:ae2d:f06e with SMTP id ffacd0b85a97d-38db48ca915mr5947488f8f.24.1738865058060;
        Thu, 06 Feb 2025 10:04:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:3000:a06b:56f1:d152:db83? (p200300cbc7073000a06b56f1d152db83.dip0.t-ipconnect.de. [2003:cb:c707:3000:a06b:56f1:d152:db83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd368c9sm2349013f8f.34.2025.02.06.10.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:04:16 -0800 (PST)
Message-ID: <27b8921c-5f1e-4cd0-95b3-2f19244b7f3b@redhat.com>
Date: Thu, 6 Feb 2025 19:04:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>,
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
 <20250204204947.GM2296753@ziepe.ca> <Z6Pxfo1xDHUOna6a@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z6Pxfo1xDHUOna6a@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.02.25 00:17, Matthew Wilcox wrote:
> On Tue, Feb 04, 2025 at 04:49:47PM -0400, Jason Gunthorpe wrote:
>> The phys_to_virt() I mean is on the page table pages themselves, not
>> on a leaf.
>>
>> All page table pages came from alloc_pages_node() and you'd do
>> virt_to_phys() to stick them into a next-table PTE, then
>> phys_to_virt() to bring them back:
>>
>>    phys_to_virt(virt_to_phys(page_address(alloc_pages_node())))
>>
>> Effectively.
> 
> except for s390 & ppc where the page table can be smaller than
> PAGE_SIZE, so you really only have a physical address that can be
> converted to a virtual address.

I recall in the context of IOMMU page tables we don't perform this 
packing. So what you say is certainly true for process page tables, but 
likely not for IOMMU etc in the context of this series.

-- 
Cheers,

David / dhildenb

