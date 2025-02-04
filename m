Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464F219E99
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738701698; cv=none; b=qcb9iXmwzkPAI+IRw8hh0VTwrqYt0HAt61oIFnUFFJWvV0nmspRowtRfxsE6bu76OY79+eSJV8OuC2rRuvGRKORoHYw/ZCGW6qJEQKX/6qbBzHjNhUefq9L9Ji7jDT0XMfHhppZvwFsVcjer/H/gxe2hVAhyloSI0PNpjznNHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738701698; c=relaxed/simple;
	bh=6NCRsRrnyj8VHUmHGh6x7SaptsToqqYWr1qQapiVN/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtftJrC1GV1CwUmjy2n20fsv2r39OXfU2T+6HB9RbAk4h72Fyx4wqWJlLLEHlWX98ggy32HumSrHJEOxM2WH7Kg6HfvgJU+OVUCfg1w3zhz5p9LBmrNFnA2OLMrxG3xoNx0mfhGXFVz73YZRA2Ovvm/2iMXUOCyPLOyU9ob5bhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fqi+wi2/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fqi+wi2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738701696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=756onm9SaiF/RTT8cEu/91K4nMKJxzo0rdjfNMK8HaU=;
	b=Fqi+wi2/w0MLdG2aj5MB+QfP0NWvpPHHQ4YUUp7f6bguc4mduDnAXdKpYxQT+kak6/Ix3a
	KKZ9XibUHs2j8YjcsmzVJ8WpdIqyixE2387mQHaPukm7/M7pB1ZXZ/ziD2nK0Kg276JdXX
	hJ66XWJ7wzrVdY7y3pT+p43+Jd3SyL4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-zdh8O1qvNEC0B4kpOd382A-1; Tue, 04 Feb 2025 15:41:34 -0500
X-MC-Unique: zdh8O1qvNEC0B4kpOd382A-1
X-Mimecast-MFC-AGG-ID: zdh8O1qvNEC0B4kpOd382A
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361b090d23so30335265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 12:41:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738701693; x=1739306493;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=756onm9SaiF/RTT8cEu/91K4nMKJxzo0rdjfNMK8HaU=;
        b=f9XcqAy5tu1wCH5cVoI05RfIeHuinxKEbIg63xnOSLQcu61iMbw8MN3iougZ+CuAKV
         /QXzrPw5LD+bZRiWSUjs8XN+nIW210KFGaGY0n58BNNaA6QtFMWV8o4U2/kfUH3vl0ly
         YnT/mUdwbLupKc4H1VGLPzvY7X8cLVM1zXvS63VVkYgzql+VPdeuyzN1ybnRQkKue0sF
         rpsdF47ms9Mh6dnqqMWGrVnQgeTcbHM56nNK5EACWueQ86FDEGgGLlpbR66PKPr/kQL4
         7bTWuLiglB/1+pEZDdTjHwLMXQ4RJesjSnKspOIb8tPVbmAFnVdFFnq1VvEnkWkGhZMK
         u4yA==
X-Forwarded-Encrypted: i=1; AJvYcCXlHdXHCG3Oo7PdwVB7vjwFSTnI0uYNhzv4821YmLMWjSFuWsnnooUYqNFx+e0m2A4XcLmJ9+mMjxqmhn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDxajlgG9Y9xdiCFHpZqsuMeFOhBbL8V8vveqv7co6gFotu/q3
	hEbSI+sQ2IMZipW3joSzoUVhIKZMLvM1I12gTkJm+H0VRbZ6EO0gM5sHngPJ2QCcMFNTfoQ51n5
	M6jzSuVzvTrSIMFGIPJbWLQVXimvXhNGvQuF6XWlPYw5LYLJaFJPGDz1EvtGN3Q==
X-Gm-Gg: ASbGncsiicirYRC5JjxZ/+xkZ54BGoLssYfZdlvMAtphWWCrdSPISg0D+k25D+UxMLt
	RUQdQK1C2suRLLvtXOk0z/YXrstaIn2JKL12y2v3xstE1usAYDFbhuzb2szAE+fxow+MthmX7Ju
	h4aBDV5LUmDKOJHsDdINezYJecXGbdIb6ZNk6FR1gudGIHQmdDTm9IWm8AYaqUoHTj5PFWoIsc2
	0G2IQue+kPurPNvPw5ZZS3TV/d6LbjhiR8kfyQgEyfaorBBSQQfo48Sa20TwGiQppVPn0nSa/ba
	Bqn+i0dBWLUPoT4uQtGBKSGLfXw4yGEy/whNyMPXLMXK4lq53CQ9WN698JP/5RSDZq50H0qdPVS
	oYqRS6ch2EmMCBSscsFssDqNVJ+E=
X-Received: by 2002:a05:600c:5112:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-4390d42f7c5mr546345e9.2.1738701693456;
        Tue, 04 Feb 2025 12:41:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcWlZw4eJvcxbYnSulvZuQawICjLqew9irCZxtfosmn3w3Phu8MvPHgrklUczGiYiTiVvfwQ==
X-Received: by 2002:a05:600c:5112:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-4390d42f7c5mr546225e9.2.1738701693147;
        Tue, 04 Feb 2025 12:41:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dac5a3e79sm2706524f8f.63.2025.02.04.12.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:41:32 -0800 (PST)
Message-ID: <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
Date: Tue, 4 Feb 2025 21:41:29 +0100
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
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
 <20250204202656.GL2296753@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250204202656.GL2296753@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 21:26, Jason Gunthorpe wrote:
> On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
>> Fully agreed, this is going into the right direction. Dumping what's mapped
>> is a different story. Maybe that dumping logic could simply be written in C
>> for the time being?
> 
> ?
> 
> Isn't dumping just a
>    decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?
> 

IIUC, the problematic bit is that you might not have a directmap such 
that phys_to_virt() would tell you the whole story.

> If you can populate the page table in rust you have to be able to dump
> it, surely.
> 
> Or do you mean trying to decode the leaf entires into some struct page
> detail? Does a GPU need to do that? Agree that would be better as some
> C function to take in a KVA instead of a struct page and populate a
> string with details about that KVA from the struct page.
> 
> Jason
> 


-- 
Cheers,

David / dhildenb

