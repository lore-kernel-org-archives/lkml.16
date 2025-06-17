Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A72264B9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149495; cv=none; b=cMXHwT3eV6pLpqpkGw8ykXcbYlJbbtOFfb5DoeF31n3jQ918B78bz7eTTTsS3dzF0M1hAYqdCevEfzkLz1+ivaAelm2S3En+/N+mpJfRceWT+fsZ0DC62xxt6tMQJqaHmUe/Hgg+kzUiXk32nzsRb5uhTlzGvzuCv/PWv2PwhzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149495; c=relaxed/simple;
	bh=0Vn23vvikdfnR3TCYUq7iyLqs7/Ncw+l3QIVm0Ui2WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALMeSlClcw+Lxw57jPa/JpmWg4mhfjFYXYHgE2ho09VjfxYoe0dk+a5fF1UTWMiD6H7G9qQm/GuBkj81THdy7Zch/6GedOBH9PbsdWPhRRK+EMU+WmATSlxv8JQIIlwS4KsQjike61p+rD4tcc4CIld+YrVmKcqkp+r6AA3ZOJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uvg6+MA7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uvg6+MA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750149492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MmqTo5X5o1GGUk3Ji6SPTFrK3ZJSli4Vt2vgFzwoTIg=;
	b=Uvg6+MA7iTYBhXMJJikMFVlcmSD9jO/U9rRCKWbPUxLgrjF5aAHKgIwwBWiSJayVNtOjOx
	R2CMx/K9zyIX8tItQnHeNzfO6df3a5NFn1cOXXcqQ2iTjiMfclaaZc8SVTh5Ko/Kn3LuWH
	S7z8ajRZn0tP+2B4m1ng4KL9XkKsS54=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-qbPV3GbEOq2r6--Gq6_vmg-1; Tue, 17 Jun 2025 04:38:11 -0400
X-MC-Unique: qbPV3GbEOq2r6--Gq6_vmg-1
X-Mimecast-MFC-AGG-ID: qbPV3GbEOq2r6--Gq6_vmg_1750149490
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso35081655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750149490; x=1750754290;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MmqTo5X5o1GGUk3Ji6SPTFrK3ZJSli4Vt2vgFzwoTIg=;
        b=arIHEuhWT/0EemryVu6q4Q0AAaAuI3Jv7OXcmgxRme03y4GnbOD5AMP157qSVyf70v
         CymLt+74YshhAa0MxKf9N2rdn+VKy5ajFPqPgKLuesPkPud9hv0thgpFwlaXmLiIq2wC
         sNWGqL4EyjXZa9ejG8HxtpkKEQU9RTBac014Xf/p6XgkpbBUYExAtT58YHwA/Esv2eu2
         NBqkurJUtIae+SQox0J4XPiyHawv12A/+qwA6GnC3+YuHv5wbeIzGuTBnrSwgUAwyN3Q
         zKJ6mkbWBm8udfKlPbsqYaLynH/Dn0no3wza7LMI1u02BYqHOY4SlQ6Jc6z+Oed4gk6f
         i+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWCUlNeGKOOdvkYVwoHMoRVZXw6egpyriyCXhReGmRYRA8gNTX56rQeQhjZcK8vFrVFvQTDd725Tsd7kjM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxej2ltdBOQBYmddiZDmYTLATlcUeQ2tbUdpWdjpsBXGMdH+FFl
	KSravplXMS7+lOynxyyfEDg1AtQGdLbzIGET5QYVwZUBMHN6pthqCo9U8TNfRjiE8yu5IwmRFbH
	7xdLQlHaVjgzmgusNGjtMyhagre/b7ANNZR06yJ7TMi6EIAxxHiA+86VWCklNLoTkvQ==
X-Gm-Gg: ASbGncvfl2M/1NTc2xlxhcdaNJL/AF0vNMcGHG7fBcUekUbV4T1utDd4WZ+s1qSHXdz
	3X51ghtnILTOfh6oZY81qbqpFRrw3kEc8L1BY6af56MMIuPrrLNsRI3b88cAb6tqX/+uAofkUj4
	FGWRUjQJXtVJKelgsssS0sms4M5uIrWsw5ELsO01lXVXvd/JmB8Gng3zult/FiZ2Yo03dMWbI7b
	FBUb/818Hty8lHkHQIpz1xnxBwull9q6ogU5TMjVl5u4JHmPi/uTlv3JcCabrHkf4Rg4FYhRt9P
	L0GsGPVUXqLlPCzB2GfYVr0itFqgtucfSOBLr3dTy0ieRClf81aUlKPl68+Z67jsQnEl8SPoiug
	V6M19BX/oPExbMzwKJNcCItTfP/g8Se0fT5zqzM0i0EdO3Vo=
X-Received: by 2002:a05:600c:1e1d:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-4533cae690dmr142720875e9.10.1750149489822;
        Tue, 17 Jun 2025 01:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwdczGKW+8rdzPsG3SMNQ+s4av1P7w9f37iq5/ml4P7N8BTaO+qi3Vfd9hogmNw30QeplGMw==
X-Received: by 2002:a05:600c:1e1d:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-4533cae690dmr142720585e9.10.1750149489413;
        Tue, 17 Jun 2025 01:38:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320580af6sm193492425e9.1.2025.06.17.01.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:38:08 -0700 (PDT)
Message-ID: <e174d4ae-9467-4fd7-906a-d575802aaecf@redhat.com>
Date: Tue, 17 Jun 2025 10:38:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lance Yang <lance.yang@linux.dev>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
 <e61a7aea-a87a-441f-809c-10acdfb82df4@lucifer.local>
 <f0a867eb-c66d-476d-8391-f8a4e9968c75@redhat.com>
 <9e80cea5-fa78-46a2-b2bd-2f3846c24a34@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9e80cea5-fa78-46a2-b2bd-2f3846c24a34@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>> 	vma = vma_modify_flags_name(&vmi, *prev, ...
>>>>
>>>> We should use Fixes: then.
>>>
>>> So no we shouldn't...
>>>
>>>>
>>>>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>
>>> Sure? :)
>>
>> Unless I am missing something important, yes :)
> 
> This solution isn't correct as prev == NULL when prev != NULL is wholly
> incorrect.

I am not able to understand what you mean :)

I assume you mean, that we reach a point down in the callchain, where 
"prev" is supposed to be set to something proper, but it would be "NULL".

That would indeed require a different fix.

I wonder why we didn't trigger this case so far?

-- 
Cheers,

David / dhildenb

