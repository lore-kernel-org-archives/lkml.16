Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B2286895
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729097; cv=none; b=Khin0B9YlScUze3c9cCt3ldG1SWSidV5ekSIuLZ2vrFsmEctMzCw2yHRWO0uACpkiAjqGdQE9zxdakn/uDb4oir88KGQmJKZtOgvp++oXMHWLbRS2Z6LvaOBW9jvP3a5eetl8O6v2fL9D+TCdSAOzNaXwLvc44JjIoO/MMjAJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729097; c=relaxed/simple;
	bh=wm3dOrSvvgVGsNdsN/GgekD2jmMewdv9Zqhqm84IxlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvr7ed8RWVpl0p1NxPivlstyRlrO1+fvY4hj6Bngos/qRhnVCz4NDAUIa4fL8NvLoSeAxOiT7czCTP0bkFp6mgiXvdPddHJ4I4rQYDJ3ubXRoD1ZKXruPT80S9gWVrpfiOlpj7mtv/r1vBRf+4Kj7UKL8W1q5ZyrHEG1SKQMe+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JBiEThWl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JBiEThWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746729093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O5LOL9apDhXCHCE2rKEyyGCCSmv2Zn14K6pYAPfmHyc=;
	b=JBiEThWlfVF9HgKfwxUdE2TV9eY7/GzKN/irjSGlnxVtK/Z38n98JQbN48V9SewjQpRV0n
	MCPjylOO2ud1V/aovwYDMoKauo8DB3ZdD7kDWceMQce3yK4JA2NsoGiNcQONFo8uoa3A1+
	eV5mjocAL4XVhEolIwxmSi/WX4eFk9I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-vnM3XNrlMCikVhy0g3eQEg-1; Thu, 08 May 2025 14:31:31 -0400
X-MC-Unique: vnM3XNrlMCikVhy0g3eQEg-1
X-Mimecast-MFC-AGG-ID: vnM3XNrlMCikVhy0g3eQEg_1746729090
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-441c96c1977so8785405e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729090; x=1747333890;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O5LOL9apDhXCHCE2rKEyyGCCSmv2Zn14K6pYAPfmHyc=;
        b=Tw9Ll1q5KBTwnk+SJa3XNBj0BTw38j+bm/758j5El+DC8Rs4UuDg422Z8kOrFjEkNa
         OUFLZei6HtiA2EeYAXWfYyS7Wr6OCrFn7+vr2grp4w2yylqR2WVyVe30EAJtOHIv8Xh9
         Q7dGiFffIw1k3hXvuxI98Ukd65YdvO3FV/Nsioh18juoPJYSuGimdnBge/krTYyZSGPN
         u4pZiwF3YNZEZ90Wy7TnOhuJbsv6b/X6L3WxKfrGs7CIzxDXDu8byhfh9AxcV0KHreur
         mR2mwd0/0hapey7xRU83vbRKH+D9SjJiu01NQLeCEDMQTEDbUnhrsfPRMBGXr0rAIar9
         +t6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgUwkxTU2ItVAnr1dGk4wmWwGcNZaW8arj2+CBwNjxOVgaLSagqc6DIAVFIqdXggnguKkz7M8dcC2HLyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCmshS4Q7IrYayt+zgBcWRheo45ywfABfAWJuDI0/U82ww7By
	4tbIKoRdr0b2lHygvf4bnwJ4SjOjIuPwmj7CCdlGr0oTnNgg2QLKGfR5XxEuusOvrY1qnGDsdXR
	Y9AQja6qTEuxAuNa7A0Nd7yIwZRqVsIijYP87XEd7lZfmEF1ZL7ufCnbCswd2DA==
X-Gm-Gg: ASbGncu3URcIo6lciBxYTpUttfvCFqLIyKJG2TPW+X9kGOb6mlfXqvLUFeAJiXQ8fLz
	eTTZKKfO6/7GwtxwQm2tHfJuYZWPbL1oXVNIU0DF+gkOHGCB0manK41R8ZMzd5F2uxUmziAm1tU
	acer+A3vkLhltx7gLnjdYQ/6/fRGvnzX8XuEBlg9EuCZZTgUFPvkZOBg9fdIdBODuA4fFxogWqx
	4KFy5FsxlyxGiFZjOVqzqk14t7hIi9vcOFsWzLZH2ZzHkps+A1vVUIdwWNOodofA04QmqGUZP2V
	o8hsQjn15sm+LmEBQjoyy9kjXQy8lj+VJ8CW19YCQx+ZMm2s8AmfB8rQ329QkFDVZgy63s1tCAE
	xt+T6x9dHsJ/znijCAUF+biIPJWjKd/GTzVlObDw=
X-Received: by 2002:a05:600c:5106:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-442d6d18c48mr3020595e9.5.1746729090540;
        Thu, 08 May 2025 11:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGleNYLquOMR4F3IzlNEmy8f6WieQ/FpcyFqyeNRzNW+11qe7QBOp0+1Gl0rXtnZYX0wfVSgQ==
X-Received: by 2002:a05:600c:5106:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-442d6d18c48mr3020395e9.5.1746729090187;
        Thu, 08 May 2025 11:31:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d5cf5d6bsm9004055e9.1.2025.05.08.11.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:31:29 -0700 (PDT)
Message-ID: <7d214c08-56ef-45c7-9ba3-18d7e4691efd@redhat.com>
Date: Thu, 8 May 2025 20:31:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
To: Shakeel Butt <shakeel.butt@linux.dev>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
 <mhnz33dwwd3npj2re7dn7invntzk6dk7u75ue2pzg35vdappjd@tgqlccmoydar>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <mhnz33dwwd3npj2re7dn7invntzk6dk7u75ue2pzg35vdappjd@tgqlccmoydar>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 20:30, Shakeel Butt wrote:
> On Thu, May 08, 2025 at 06:37:35PM +0100, Lorenzo Stoakes wrote:
>> In furtherance of ongoing efforts to ensure people are aware of who
>> de-facto maintains/has an interest in specific parts of mm, as well trying
>> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
>> files - establish a reclaim memory management section and add relevant
>> maintainers/reviewers.
>>
>> This is a key part of memory management so sensibly deserves its own
>> section.
>>
>> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
>> in the reviewers from both, as well as those who have contributed
>> specifically on the memcg side of things.
>>
>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Seems fine to me, though I would put Johannes as M (if he is fine with
> it).

That would be lovely.

-- 
Cheers,

David / dhildenb

