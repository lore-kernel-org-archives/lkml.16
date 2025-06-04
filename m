Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E2218E1F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052886; cv=none; b=NsQ8Dd9DXU1svMgSDAs9t3NeR05VCJQCYyeIYhpUrRFxmtOA+zPNYTp2LKSyfyKT91bw0j5o/wLpH7cfeA56TRmKSgcvWsazVxC1qifiytQqDVG9F3H2nYEZrVyw52MIN7zQep3xZGplONFKVNfNZHR/z1szX8obU3pjo2kiPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052886; c=relaxed/simple;
	bh=So/HGqU97KJHHqPHYEMnLPE/RFB+cOZGCVzLOuORFyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbQVQbKSVfjsAj9MWKZfyzlHBtAyRvossGVYMY1NM8GTf4J/2y0H6vbWWNQwf0nyPSzBceqMD66y89FedLgXXFlhztQogfu0nBmrHmF6/UhEROh/735U8Eg4j8o9p363PK3svbZRvT7uib7CchtXL6jNPtoEZogAe3qtm6NEN4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bd5XYboK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bd5XYboK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749052883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B56ZzCeADf+QuixmHfBf4Zix4sjQka+6qDzfyc/+jrI=;
	b=Bd5XYboKulMZ9HFin3ch+5PjpON6GoXcdyJyyX47RZq82g3di8n9H+a/bxUQ647ikUbxtB
	+6BXqK5uoQEyx/JtsH1G4I5rvlv5pLFAoXuhPmzfYF+58pXH8dfhImUGzkX+ZaUJPN0T+u
	diZmJjUvH15h3w79JzQ+Cb2N+vodlDo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-yjjlgPRZOYaJT0ji_z_hFg-1; Wed, 04 Jun 2025 12:01:21 -0400
X-MC-Unique: yjjlgPRZOYaJT0ji_z_hFg-1
X-Mimecast-MFC-AGG-ID: yjjlgPRZOYaJT0ji_z_hFg_1749052881
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso3101324f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749052881; x=1749657681;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B56ZzCeADf+QuixmHfBf4Zix4sjQka+6qDzfyc/+jrI=;
        b=Q0bA6sWTaUqjILjaBzNuI4E0mYHgHiSayiNEVQesBn1uVl7A2bCDONy1s6NjhHJ/qY
         yEh7998Ab2uF5UGTBDkfLUJeUvPtoL5ZsH22DWfu/yB/pbZQ58LSFfKPZZzVMkmyZDwH
         032qIgCbK7pYUG+baKKRfasrKd2M3K1Ev0d9Wojy1oZpOCjX27wuZRqxLlxNJHXjaGre
         Ff7ucRxS2S/RuhoYOYpaAteqXqHVIpwzAbMXtgN4W8XgaRT4255Aa2hoPv43+w/Up16j
         6oYyILuOoq6QfDOQpoESPX8r5BJHBnPLNOWQRXb4JI2Mo//7upWeIzBaka7ZcBQygkrl
         +l9A==
X-Gm-Message-State: AOJu0YzPoavUwEHNGGCUh48+HI4es4xT1q5zzuRDEem6nuM/yoycJFEk
	fiP2UPYTp61a0bitfz3puL7w+GFIwMPNVnc4HmGiphYSn+3druLuLMkB0PUMquxeIvCU9xBvEVr
	b8MeHF0hChCDaGu4KUNYO/j8BgtLaNHz52sTvlOSaEEvG1BzgFWGkc5pgHPvVWv3irA==
X-Gm-Gg: ASbGncv0u441JAcPzr/XRgaF4GaoEGJSxCWhE0NxQ+TcvimcHORo814awr+5QC9qAHd
	PR8+pOcoUQLknTyirQB2sAccX5B6uKC9vsIJ+KJFn1Dinf7XlTd9wD1WQW72uMuOhbTzQCnqd3e
	rds3SU7TsswNxNexyqCxqnR0CLfPcyvztPKfSc58AuxWNrpeVEKTZ3mka9S5xoe9i8puyBjpAkj
	Zj7sb6t6yF9VF7FdzhuRT47tG2/Ibp8yGmy/mv8uC/zYkLA3aQ5nk86R82tM0ScOKgpdm7iK96m
	MTWslthcejEX4EAsk7ALzW8q0VVnCgCR+V6V0ekxjt+nxy3J8ZpDk3MfAwGuBw1Zm7WSi9qK7wg
	7ZC1ZL1bvOTKB9zDpGjBFCh3TG4Ede1ooVdxLUQ==
X-Received: by 2002:a05:6000:3105:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a51d9744d4mr3009231f8f.42.1749052880628;
        Wed, 04 Jun 2025 09:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNcOM5E1TMCd9aCuR/EMdBHoJZu1zLwHEDg1xmViWYAlHFlrGCO/djEJ0bT20tVETFzcuA6g==
X-Received: by 2002:a05:6000:3105:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a51d9744d4mr3009114f8f.42.1749052879574;
        Wed, 04 Jun 2025 09:01:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097210sm22068168f8f.73.2025.06.04.09.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 09:01:19 -0700 (PDT)
Message-ID: <ef0a22a9-facf-4b3a-ab44-64fb1b06aba0@redhat.com>
Date: Wed, 4 Jun 2025 18:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <20250604151432.GC17991@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250604151432.GC17991@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 17:14, Jason Gunthorpe wrote:
> On Wed, Jun 04, 2025 at 04:05:44PM +0200, David Hildenbrand wrote:
>> Especially once we hit one of the assertions in
>> sanity_check_pinned_pages(), observing follow-up assertions failing
>> in other code can give good clues about what went wrong, so use
>> VM_WARN_ON_ONCE instead.
>>
>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>> well. Add one comment for the pfn_valid() check.
>>
>> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> I'm fine with this, but IMHO, using ON_ONCE is wasteful here.
> 
> They have been BUG_ONs for ages, they really do never happen. If there
> was ever a case to justify not using ON_ONCE this is it..

Well, history told us that if one of them happens, we get a whole flood.

... which is usually not particularly helpful when trying to extract 
information from a syslog :)

DEBUG_VM is already "wasteful" ... ;)

-- 
Cheers,

David / dhildenb

