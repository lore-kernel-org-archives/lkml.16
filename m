Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328C185920
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754928; cv=none; b=Tpvz4a5eqOfPiszy9PUw/d4YaFPArU/gIJuOz8mSfGzkZdg8Y5XhSLkcUJBYpPnfSz9IyOpCOx/ZIOl/4jTmLqvJz0CR+6bC+E9zA0ckpJCaI1BRQyWMNAZaIteWlwd1rdi2L9Sa0lG2WvI5YTaCUOUXOgEkuiJuCWYD+ZM04yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754928; c=relaxed/simple;
	bh=BnDobGEcRmQ8EgfMlva/f1BL82VcYQywu6JTEayvEvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVlztO+jBC3pdqRd5uXhKMnhwtg9J2N+MedTEgSylW6H3GrrmBFcugUpD7DaQyZ8eM/XeM88AppzXv/AIHXroIAv7bA67ue7uD3+DexqtQFO6D5k5uXqj/DQAp+ELbaFEVxVAUV60nu17lALXDYJFytYG6EWCvOcKfE0JqLjmu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTeTHWAy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTeTHWAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747754924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=byrAFI+fttkzvGOx8TlNVRJimGElnWzOfywL7N/Lvpc=;
	b=DTeTHWAywRK9LKgFOZsKRYrK3R2FZ0BXgSAoJET4LeURa5/N17hr3iF+AqjCqZeKtTaFBi
	+0nwKCuyLtI+dYnHuM4fMTdBExHbJKXtQRfov9rJb60RVDrlqw4cnmx7mEz8csK88RkPJW
	JrIpCnFe1kv78duIUA2RO2tAJEz4Xuc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-RTnph5a7MFqbWt5LKp5dqg-1; Tue, 20 May 2025 11:28:38 -0400
X-MC-Unique: RTnph5a7MFqbWt5LKp5dqg-1
X-Mimecast-MFC-AGG-ID: RTnph5a7MFqbWt5LKp5dqg_1747754917
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a364d2d0efso1965434f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754917; x=1748359717;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=byrAFI+fttkzvGOx8TlNVRJimGElnWzOfywL7N/Lvpc=;
        b=BkLTyKkjU5jjQSgp+DWsKZANi+GvEY3XI/0jhc7SQYa8XTbjQugG3ma512T3po/NvL
         khY/14k5MbLOjARmObUxLthZHclNVAJGFGlYAsjx2sDr+HXTr0gk6e+lXOq6hKTiE1Df
         yDiMdE57lwYr9+MOvTZOLBheUcdgSuOipZTNv914seLvhMsMax6b2m6TRnzesJnphswi
         rUuHYluWhdeXc1OgHfaA30kqgtSFzd2onvScMR4do8awK5mszarykEHR7VtFoLfEf0lg
         T+x4UX3sYyuQtlLorzHx+BHX90Nm0+Cp4V/IQA2Vnxc6ffXGWgwNkcB+qJUUAXkWzMhS
         POUg==
X-Forwarded-Encrypted: i=1; AJvYcCW5cHHFx6oblwGzEkdfwiHr6HXdGGCGsdI9B7zBER99Ai/fP8U/mLGmSYDCK/B/0sYE1qnyEGX1v5qJ2aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjhGq9eI1FDSp0l42bA7WD5Ily3J85ZtwFx1fLNwV0krE/Sq5
	X1/YJM3RPpa52QX2E2bdo1+oxJuVN74KB6+6lJJMlfqIEV+EYnHuvnBzMfklo2Qwmjxyhm792WN
	xCrzteseDXnFSk6uGT+ZO5bb0W98HfRy+WlKMpFO4HcUl5SZ/Ddx7BmJwRix5gC0x8Q==
X-Gm-Gg: ASbGncvrN3WsQjgjrfOJ5Z8gsLYjshZkTZ8mQAJzijfbzHk5/003na7p/7nH4R9iTq6
	SOMQQIklm5Btu4FAvWyIH0PGfUuA1l3TFgUP7UoNDZ4GgK7h+5jMpxQRpmU6AuCgKeXHJngh7VW
	Q/0r7OAZ8xjMCTRc+JI2FUGPogMFwJfOZf6FohteSQDmiQEEacRFkdYcfFX2b8+B4b1WD4L70NB
	i81gbixZZGBG/HKCLHFXRA8QfG+DGV5/S0owd3j+He34K8jmtT1VksYluKBpnB9rwrhEZFWg/88
	221WbCTe3QHfnjHG6VQKk656Yv+475HvCJxGXk5epk492JXxazRAJCiTgQNvk+uEOcwj7lQXXrm
	N1aKeLsCml2IGqF9iwQ+wugEMHz+HTN/bI+NuZxo=
X-Received: by 2002:a05:6000:a8e:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3a367bb9065mr8080789f8f.53.1747754917210;
        Tue, 20 May 2025 08:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLsOEhsg8h1nrTdRgjk/8RLDndqMdRcLLHCqsI59w6NB/PhJyjBEvxNPDXk4C1Blkmv+7FZA==
X-Received: by 2002:a05:6000:a8e:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3a367bb9065mr8080775f8f.53.1747754916768;
        Tue, 20 May 2025 08:28:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a365bc0b5esm13048900f8f.9.2025.05.20.08.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:28:36 -0700 (PDT)
Message-ID: <dd062c92-faa9-46a6-99a8-bcc46209e102@redhat.com>
Date: Tue, 20 May 2025 17:28:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] add process_madvise() flags to modify behaviour
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Usama Arif <usamaarif642@gmail.com>
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.05.25 22:52, Lorenzo Stoakes wrote:
> REVIEWERS NOTES:
> ================
> 
> This is a VERY EARLY version of the idea, it's relatively untested, and I'm
> 'putting it out there' for feedback. Any serious version of this will add a
> bunch of self-tests to assert correct behaviour and I will more carefully
> confirm everything's working.
> 
> This is based on discussion arising from Usama's series [0], SJ's input on
> the thread around process_madvise() behaviour [1] (and a subsequent
> response by me [2]) and prior discussion about a new madvise() interface
> [3].
> 
> [0]: https://lore.kernel.org/linux-mm/20250515133519.2779639-1-usamaarif642@gmail.com/
> [1]: https://lore.kernel.org/linux-mm/20250517162048.36347-1-sj@kernel.org/
> [2]: https://lore.kernel.org/linux-mm/e3ba284c-3cb1-42c1-a0ba-9c59374d0541@lucifer.local/
> [3]: https://lore.kernel.org/linux-mm/c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local/
> 
> ================
> 
> Currently, we are rather restricted in how madvise() operations
> proceed. While effort has been put in to expanding what process_madvise()
> can do (that is - unrestricted application of advice to the local process
> alongside recent improvements on the efficiency of TLB operations over
> these batvches), we are still constrained by existing madvise() limitations
> and default behaviours.
> 
> This series makes use of the currently unused flags field in
> process_madvise() to provide more flexiblity.
> 

In general, sounds like an interesting approach.

> It introduces four flags:
> 
> 1. PMADV_SKIP_ERRORS
> 
> Currently, when an error arises applying advice in any individual VMA
> (keeping in mind that a range specified to madvise() or as part of the
> iovec passed to process_madvise()), the operation stops where it is and
> returns an error.
> 
> This might not be the desired behaviour of the user, who may wish instead
> for the operation to be 'best effort'. By setting this flag, that behaviour
> is obtained.
> 
> Since process_madvise() would trivially, if skipping errors, simply return
> the input vector size, we instead return the number of entries in the
> vector which completed successfully without error.

I would focus only on adding flags that we absolutely need to make the 
use case we have in mind work. We can always add other flags as we see 
fit for them (IOW, when really required ;) ).

Regarding MADV_HUGEPAGE / MADV_NOHUGEPAGE, this would not be required, 
right?

> 
> The PMADV_SKIP_ERRORS flag implicitly implies PMADV_NO_ERROR_ON_UNMAPPED.
> 
> 2. PMADV_NO_ERROR_ON_UNMAPPED
> 
> Currently madvise() has the peculiar behaviour of, if the range specified
> to it contains unmapped range(s), completing the full operation, but
> ultimately returning -ENOMEM.
> 
> In the case of process_madvise(), this is fatal, as the operation will stop
> immediately upon this occurring.
> 
> By setting PMADV_NO_ERROR_ON_UNMAPPED, the user can indicate that it wishes
> unmapped areas to simply be entirely ignored.

Again, is this really required? Couldn't we glue that to 
PMADV_ENTIRE_ADDRESS_SPACE for our use case? After all, I don't expect 
anybody to have something mapped into *the entire address space*.

Well, okay, maybe on 32bit, but still ... :)

> 
> 3. PMADV_SET_FORK_EXEC_DEFAULT
> 
> It may be desirable for a user to specify that all VMAs mapped in a process
> address space default to having an madvise() behaviour established by
> default, in such a fashion as that this persists across fork/exec.

This is very specific for MADV_HUGEPAGE only, so I wonder how we could 
either avoid that flag or just make it clear that it shall stick around ...

Having that sad, PMADV_SET_FORK_EXEC_DEFAULT is rather a suboptimal name :(

-- 
Cheers,

David / dhildenb

