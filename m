Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713A25C70E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194895; cv=none; b=f4oXpjRW3UCn+pp73Rw/BEuocEp1gip5aHgvoBQZX8u/G4lXsB32gCu+9CtGk2CoNSq9PaPq3sy1tydOKl0Hh3vnImaFlux4FYkET2OZjUMmcFgnAylGH5RNwtF9e1OaxlTPT6eyFEwk4lV76j8z6Gal4+wHsyST/tJWm7aYddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194895; c=relaxed/simple;
	bh=y80JdRCC/lrs6ninnOq1vil6zfwFfGxnBpWl0uLjwyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GUIfPRegJmq2P92Uu+n+GNu73ecUMG69pF+XD5+9PshvMXor94AEj0+yo5euqQoPW6fK2Wkc1D1VxyUezGjA3ecq/WuN5Pp6Az7KpSfBnbBgpnJGcZqmtX+5eNGdaq8Cczri8aMCM44p6MAVKlrLQrDGH79+V0kd5HdDcPgJ4t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KOf14fxx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KOf14fxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744194892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=83roHr45eFAfDwWGjHwmHyxjB/WDYkk0hQKFuD5ukgE=;
	b=KOf14fxx6uxJEYgzCex+gtQ2wIdGJS9ZC8VsDjXP5H7UTcwfCTZfKNIAOQNy9jYgVbTQCd
	owYx/5TNMrFmjwOVjqGyDVS+ng182mk1Vj4DGJ/c3GlZCuwb4H2OEoQitp0MkLhFchCYCI
	zI5N0KkHs3jr/pktBMQmddDGGG/z8ZM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-LPxRLKccPHaxwfvNfk8vig-1; Wed, 09 Apr 2025 06:34:51 -0400
X-MC-Unique: LPxRLKccPHaxwfvNfk8vig-1
X-Mimecast-MFC-AGG-ID: LPxRLKccPHaxwfvNfk8vig_1744194890
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d733063cdso55222275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744194890; x=1744799690;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=83roHr45eFAfDwWGjHwmHyxjB/WDYkk0hQKFuD5ukgE=;
        b=f8EkvcB4JAquXb6JQU1ZcvbAgYierthgNvg6eGOlU3tHZSnc6I7+dpVtFq2QUAswfl
         mwq7qbLN5ghNEazaH60AxipvKksgvKPwFqK8gvz1XiFhfl7PmvXZgfw86fHMnnXihU79
         8KWrwPKnzquANoPTpoyCYQYMDr3sIb1BFzYMvFFdO8nYaWPwNkYbWXsnnw4tnaowXKbJ
         ATTqcIt4mqgcTSneqGEwUodKWHBlQR7H6aagmSbkEhCWtDQ28eRWRKyy2SftoiVisMkA
         PLjCeq6fHc/e7If2fbH3W4jbdKRXFlxearn2xrOjY+wlzbF1cIHK4FLXFJPsTcVCMKGb
         llGw==
X-Gm-Message-State: AOJu0YzDZBGmRnOfNfLQjkHt8NkKxWERDJaRUCww5cp6yI07NnFjnoxG
	dGtjDOPnU/4A5kBWL/Gg0AUvOeWO6JE8l01lx4hzzRrb1ENjGiLWm60bcLlg1hoQOf0Zeg7uuvw
	qL0XJC8xVj4mPe8voShJxm+ofIt21WtJ2O7Gn9Tw0fmf6zRtHpfjJ78JBFZ2+pg==
X-Gm-Gg: ASbGncuersZ6fylQTrPam7P4w9aiE9r30nx9Q+mX73J8dLxAETu401yEhvLjbWt1QIK
	ptQXp2/NWzYNXGe00BxUFjDTSF0CwDXA9Mt6G2bOO7BWtak6SQwr0VzBrrP3t5pHtP3OoyxU5r2
	QofgmUw+jJXH8GZHS3VH7FfLUopz4hzhcYJScjz5tE7OXXZFfsiHeYLAyUaDADOYbZE6ywVmft8
	NrYYWzWRNKhYyBmaMa7YyuXZ9ZWq1yogRPNeFGxNUWW4uoaYlRJtlQP8eFDw2yPSdaGfVeX6nFq
	Akk8lSfOuW7993C0Zt1FJGsGnSH5NrtqWCha+qkqcsqZvUhCR7fOtP0sRimxXckAwEHDlEpVpDx
	yDAp9jeIH+ZbIknPFWfxXgEINz/F/gWrvmg==
X-Received: by 2002:a7b:c5c8:0:b0:43e:b027:479a with SMTP id 5b1f17b1804b1-43f1ecdad2cmr17328085e9.16.1744194889803;
        Wed, 09 Apr 2025 03:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbCKJCIIyD6uSvYRB2J5oGynfaNGKKM5UkfpatHWUgekD4QxrjfUPEtg+ep230sZKa6VK3rw==
X-Received: by 2002:a7b:c5c8:0:b0:43e:b027:479a with SMTP id 5b1f17b1804b1-43f1ecdad2cmr17327815e9.16.1744194889450;
        Wed, 09 Apr 2025 03:34:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:8400:ed9b:a3a:88e5:c6a? (p200300cbc70d8400ed9b0a3a88e50c6a.dip0.t-ipconnect.de. [2003:cb:c70d:8400:ed9b:a3a:88e5:c6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572bb2sm11794645e9.29.2025.04.09.03.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 03:34:48 -0700 (PDT)
Message-ID: <acc128b8-2c29-44e3-ae83-da753e147060@redhat.com>
Date: Wed, 9 Apr 2025 12:34:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/mm/pat: (un)track_pfn_copy() fix + doc
 improvements
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250408085950.976103-1-david@redhat.com>
 <Z_ZMqPvQTxsyhCa9@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_ZMqPvQTxsyhCa9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.04.25 12:32, Ingo Molnar wrote:
> 
> * David Hildenbrand <david@redhat.com> wrote:
> 
>> We got a late smatch warning and some additional review feedback.
>>
>> 	smatch warnings:
>> 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
>>
>> We actually use the pfn only when it is properly initialized; however,
>> we may pass an uninitialized value to a function -- although it will not
>> use it that likely still is UB in C.
>>
>> So let's just fix it by always initializing pfn in the caller of
>> track_pfn_copy(), and improving the documentation of track_pfn_copy().
>>
>> While at it, clarify the doc of untrack_pfn_copy(), that internal checks
>> make sure if we actually have to untrack anything.
> 
> Note that the title isn't accurate anymore, it's not an 'x86/mm/pat'
> patch, but an 'mm' patch.

Agreed. Who will take this patch? If it's Andrew, can you fixup the 
subject please?

-- 
Cheers,

David / dhildenb

