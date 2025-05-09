Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D528D28F937
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787882; cv=none; b=ifBi0ilsGwnyxOgSd8ashFERiLC0a6gFbeEYsUWczDMM/M89Mv06Xehs/Tli6FzHD+uIko3CMYLtIjsKPsjzHHVn0JY10qJAWQCbeL4RujbalXWKWI4WXstP3BtGPJGxZFnULN6f/4VkAalQ4Ll1EKX4+8vni7eUD5xP4BM/yy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787882; c=relaxed/simple;
	bh=UBCZ1+sSaKXyeyJcQaM8lEhD146clZRwqkJYIwJGA/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1ZVIqNv8pI1ngy5D6pojzU8ttQ9U17wCXP4c2MvNZuyOtDeZ0YjAOtxL9syskwSL+womeX4fA4PP8o+f7KpHmzh66wTZg+wwxquq/aWnrjA9z8ae+ggqTm5IVidB4NnFgDIEmbF3KRqv75ZZTlmPhZvH3iqNvhJc10U2FbeeNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCIAmmTL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fCIAmmTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746787878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z5icIjBSNxm7SGKTGDkQBagM25AN1tReFtwzfV4hoOk=;
	b=fCIAmmTLuA5NtXcb7n+eX09QSyTqitBMpUuj52FjmAZMTqw3CO0BFnZRzsGASnUJSaG9gL
	TlD6vrl9At5ybJJr0d+5l4Cqzrzam39sSsmPzU36r6K0jiFEknBdMERZqPl+JuL1opV8HL
	I5VzcDzLXO2oB3ICGOsw542qlRSgQKY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-Z_AdPkX0PWCb-hKEytFdHg-1; Fri, 09 May 2025 06:51:17 -0400
X-MC-Unique: Z_AdPkX0PWCb-hKEytFdHg-1
X-Mimecast-MFC-AGG-ID: Z_AdPkX0PWCb-hKEytFdHg_1746787876
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so9580535e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 03:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787876; x=1747392676;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z5icIjBSNxm7SGKTGDkQBagM25AN1tReFtwzfV4hoOk=;
        b=Mg/4BWBIFogGeYiUDGLi6k877pij/e1nRzbq3S8QPd/Eb4Kpsfwl38oFpmru1i/+MZ
         0iK4ahdPg/fvZsx2takOTUs22+E3mWJ+skqQKxp0+/6UuN2BXsdNCTJXhsBMSvWSF0Gk
         Sqa1R/r+GlYdKtymMDrxFaYFCtioTPB6pXMsQcrpeV1893Ob//pWIAC8Ggu5by2zsj2f
         3qM+FvIhcB2ETGGWOWfpRDQQpWzm1AQUFUvR9N1INKaOGM1v6NsscBsLkKJA4FGK4c9P
         su5P/+V2uG/dySR/WbH4gW3NadTWsRromkl4tcAPtVww2g1dLmRGHzd0hlS2GjqCLJxn
         KNtA==
X-Forwarded-Encrypted: i=1; AJvYcCWtxHzlZbVqVjC+/ogDgM/Bg0wHlF3uajIJXpTk1OJRfImmFdL2SeTPvVwWCk1N5WC1NdtQVOEygp5rLCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LRB8b1XQDsSsh/VeKD0coX0fW9WBYdAYWcKdfu/xZ49paYi9
	LTXxTySbh4Jq3LQE2UUAY6sG1PAQZBia3C3yvR74HMCQKiLuTUML7EBmAQe1c5UsTr9fv9eq0zd
	MVtirOhoKDvX2Xp2xZyO1dWE05bbxrAbw41cI5ZH1qUyFbYCWDy+vKKD/mo5saA==
X-Gm-Gg: ASbGncvzroOPECMhdU7HOU02gAE8Jfto7K5Eb/8M+h2NR7npsrcqBxMMblPmAHHTZWv
	+kkrbxVjGz8nYmVTp+5y6OtROu5rrRLeOhlTp16/YbEgRuiXQZTbyXKYtBFDEyP9C+5BA1h2N0j
	pTDQs6o4AzHugVqkqfR4CVbGqZbG0sVN2//WFBPg1dNeisbSWaEzvp6FOq1ZtKb+SEXCuJ3+wuW
	ewurVgGgbm4/e7Vi7L89G9nvYCpZtnFhuzqE/YVlG1Rv/DhpCqt6YikNZPMheAw5LcBw4exqnOV
	zVfj/tFgAGvGyFcPmcIBBhOyMJD+RMS0dz+mxSQSg+UxyriGNegV7sCj7NUhIEZ7278P5YQvPmq
	JIn01bzTbNYvVINlIHVTSEQcvDcOnc4YiHhBobmY=
X-Received: by 2002:a5d:64a8:0:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-3a1f6488b27mr2586481f8f.46.1746787876157;
        Fri, 09 May 2025 03:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXjHjIupjD+BZKfpHHFGZNjGd0bQz2NgtE5c2XPYngOYrYz0AB54ZsfI7X60joYdxPg6InXQ==
X-Received: by 2002:a5d:64a8:0:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-3a1f6488b27mr2586456f8f.46.1746787875732;
        Fri, 09 May 2025 03:51:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf0esm2875526f8f.79.2025.05.09.03.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:51:15 -0700 (PDT)
Message-ID: <5a489fa9-b2c0-4a7d-aa0e-5a97381e6b33@redhat.com>
Date: Fri, 9 May 2025 12:51:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: introduce new .mmap_prepare() file callback
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
References: <cover.1746615512.git.lorenzo.stoakes@oracle.com>
 <c958ac6932eb8dd9ddbd2363bc2d242ff244341b.1746615512.git.lorenzo.stoakes@oracle.com>
 <2204037e-f0bd-4059-b32a-d0970d96cea3@redhat.com>
 <9f479d46-cf06-4dfe-ac26-21fce0aafa06@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9f479d46-cf06-4dfe-ac26-21fce0aafa06@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> +
>>> +static inline int __call_mmap_prepare(struct file *file,
>>> +		struct vm_area_desc *desc)
>>> +{
>>> +	return file->f_op->mmap_prepare(desc);
>>> +}
>>
>> Hm, is there a way avoid a copy of the exact same code from fs.h, and
>> essentially test the implementation in fs.h (-> more coverage by using less
>> duplciated stubs?).
> 
> Not really, this kind of copying is sadly part of it because we're
> intentionally isolating vma.c from everything else, and if we try to bring
> in other headers they import yet others and etc. etc. it becomes a
> combinatorial explosion potentially.

I guess what would work is inlining __call_mmap_prepare() -- again, 
rather simple wrapper ... and having file_has_valid_mmap_hooks() + 
call_mmap() reside in vma.c. Hm.

As an alternative, we'd really need some separate header that does not 
allow for any other includes, and is essentially only included in the 
other header files.

Duplicating functions in such a way that they can easily go out of sync 
and are not getting tested is really suboptimal. :(

-- 
Cheers,

David / dhildenb

