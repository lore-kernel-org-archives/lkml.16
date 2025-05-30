Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C90221578F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594684; cv=none; b=AjaKtUPWNKJjlF3HZF9aWgO/Gag78E7Yr5l/lpEyGS0TOIDnrZ+zY/EQOd9MbB4L6IGgOL6MEu7wWAJDpwsAAN29SY5GfQ/dfDHQxk8ZabTo5MXDExTOJLZSngD94Wy2NTsOBT4ahyK/+eDHvdO0sUkeRMsgjpylaKkiH/wMBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594684; c=relaxed/simple;
	bh=+inx4YX7P11q+gVVxzr9vdPZCaXWtbFLqOTGNf3L8A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWXAin6ivYUeTXQOPOsbTbxIG7lOhtM2bCfCNFN61Jp4RwGouzMqQsPMIDkVnfyxqmMCBjRcQ5aUC1F7oPcVXjYVqk6DcG6b7BONnISJLx5019mdhGHUlqglkAJ+0jUrTigkmPqTYT/4uB1+ckFeDr6WKJLLXaTndnp5YEdzRJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KegqXLb3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KegqXLb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748594681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rf7ekt8VnRvnpxfQITfqFspKdTksrMp/VZM9tAi2xbI=;
	b=KegqXLb3VG26fNHa4i29WHXgnaHLUG5uYiWN6ZAPAmlkXWwJL+ZNc5CGjZm17ewJZB4pVv
	KZQEuJ7Xy7kv65mAd+4BpabR/3NiXgFduzvvNXnronOBjpY/tqsdy3X4oVxSTSh0oaah7u
	jU9I/8ILlzEX3pllG4Jo+4WUfoIQk0U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-m1LAx0cHN4-fnoLW3ie2lA-1; Fri, 30 May 2025 04:44:39 -0400
X-MC-Unique: m1LAx0cHN4-fnoLW3ie2lA-1
X-Mimecast-MFC-AGG-ID: m1LAx0cHN4-fnoLW3ie2lA_1748594679
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d244bfabso10825885e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748594678; x=1749199478;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rf7ekt8VnRvnpxfQITfqFspKdTksrMp/VZM9tAi2xbI=;
        b=aShJg/bHJB4IOBhH1fFeG8Uzadlj0uuJk3xpWW/w1HLiT8TqPa8RaH+pKDLRuw3hUv
         fb03QBPc9eeDzTD+qwENxXJrGuRGBOsIbewvycF0HOeOA7JH01xZAlo4ZavifaUCM/7i
         /nUU7BS4AesFpC7jfxalbTd5GW7xcZZzNUYBJnZ++vSn8uhXibLE5cY+0z/potSUkQK3
         0J9QZI5zR6M51dxFpRodf7rBocx5kWpI4wWu1MPmQyXKqiMFehQw8FpDxOl69tSXCB1T
         sD3f/cqfKRfcHtULOphm4fxbluXzJkUqef5dbr12b7Q7/VfJIdYk1VV3lxZkkjyCeUNy
         sGsA==
X-Forwarded-Encrypted: i=1; AJvYcCUFncAXGeN4gHEhWk21xV8msQD/NGQNbn5uTESH1iT+DlbesIgtTgkldJ9Dl4lSswMxlh4tTsHw3kSL1G8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWAKSVdDri0HN4IoM0M1zxWZMtFhYm7m9NfGY9jHk0gVvPKoFx
	wR/bHajJnYXXMrf7avubj8IyLCHb2UBSI2Bw0j2app6zRtCr/jMAYjdHiAeLhtyr0ze6LTruRyF
	fzpVyTHlNEK6PPDylhp62LJBpxIEudRGXy9T82kcBNRKzBKVaAS92mn35syDdNZA1MQ==
X-Gm-Gg: ASbGncvj2uuchCD0JcW6Kwmv0V3qQDf+QI3d8UFb9IlhNkcgdzeJst3BeAY6UnPJnkP
	VWAn5z2ELOPpi7iuVTYKD57/n3qlMJvQVcS1Wd9cWFZAiv3suovie/ZVOuju/r5k0m5oOB7elfH
	RWNh956doWZmr/qcBR9hSXsciBjWhYhOlIGLXImFK+Drnt25BtMafcNIKixyBPqlEfrlTfg/EBh
	clk9uK3nj3dCkTfWKW0tw0OOIV3a4z1a5pnyieOUYVQdrcpnnHnkqcnXqedJ/FO+ZTxm7asypPD
	0rEg+t0v8HCblNN5tn3d+3e7v+luF0n0eP5mCiGxBQ5gr9+0I2Nz43vf4WJqsGAO4dK88tBmYzF
	i4c5iPv5F9ZAyuCYuppy3PYaWdNMzrwIc/+lOzpE=
X-Received: by 2002:a05:6000:220b:b0:3a4:e706:530c with SMTP id ffacd0b85a97d-3a4f7aad050mr1548767f8f.48.1748594678618;
        Fri, 30 May 2025 01:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIkKMFr+MevLcEJ8ZP1NLcyzoARn0tQT37zO+7jYywL42mXmcgqbYEYi127MxJvgq+J5nnZA==
X-Received: by 2002:a05:6000:220b:b0:3a4:e706:530c with SMTP id ffacd0b85a97d-3a4f7aad050mr1548751f8f.48.1748594678231;
        Fri, 30 May 2025 01:44:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8006952sm11532685e9.32.2025.05.30.01.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:44:37 -0700 (PDT)
Message-ID: <f3dad5b5-143d-4896-b315-38e1d7bb1248@redhat.com>
Date: Fri, 30 May 2025 10:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fix MADV_COLLAPSE issue if THP settings are disabled
To: Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1748506520.git.baolin.wang@linux.alibaba.com>
 <05d60e72-3113-41f0-b81f-225397f06c81@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <05d60e72-3113-41f0-b81f-225397f06c81@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 10:04, Ryan Roberts wrote:
> On 29/05/2025 09:23, Baolin Wang wrote:
>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>> the system-wide anon/shmem THP sysfs settings, which means that even though
>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>> agreed upon: never means never. This patch set will address this issue.
> 
> This is a drive-by comment from me without having the previous context, but...
> 
> Surely MADV_COLLAPSE *should* ignore the THP sysfs settings? It's a deliberate
> user-initiated, synchonous request to use huge pages for a range of memory.
> There is nothing *transparent* about it, it just happens to be implemented using
> the same logic that THP uses.
> 
> I always thought this was a deliberate design decision.

If the admin said "never", then why should a user be able to overwrite that?

The design decision I recall is that if VM_NOHUGEPAGE is set, we'll 
ignore that. Because that was set by the app itself (MADV_NOHUEPAGE).

-- 
Cheers,

David / dhildenb

