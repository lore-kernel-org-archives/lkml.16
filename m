Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06033207A26
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837416; cv=none; b=fXL5AwhvCuKldSS9oAUTItsKsNbNvDlugA7QVGmjfRoiIvBM1tYoAVYheySkkqUbrHF9bzR/gZRXlC81XaeDM9ZR/mY7hqMRf3tu2YXH+srYGF1+nBn7jXSzS9C8P2L9+krDXgbro/sKYR0gJm9Hj5sbIv6rPTyfcxFsXUsT2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837416; c=relaxed/simple;
	bh=IucRYII37uuZDgDqZO8TPq6XvtWCzvD4aB3fHJ/rfyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcYJL3WKGIz0cv/s9agkOC9tLRpd/dt6cwfakD0bU5AcEmJcpiaT3iXSrBsUrBe6JGyFzCMl5AeNC9U7zHxJzbthOp2FZ624Vs+DRrWlKeVwjfYPy8UzssIQKSGSg3F5dQ7KMM77a0P6E1fTrvUZLORpc7Ry9p9DcNCoNZxgW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=izMXtGk+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="izMXtGk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750837414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+VWyYD7FtmHGvesh+xzgd8YBBQ92N0ZCiKER/Pbh68U=;
	b=izMXtGk+q5FZQhoknT4p/R2aWNic+W+1et/9kJz6sq1cXv/rF5ul3iewwjxvjgcByTGxSl
	I1gPbHNztGwrE+E26k8Mm4SuAnKmbi75jZBu+bZ+tk+jWQIo6hqSdnay4QaU9fRPoizsj4
	mCLbiftpqfOC6VESMdHkNMIUL5xZTXM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-4rdR748eMKOnUll6nFzcWg-1; Wed, 25 Jun 2025 03:43:30 -0400
X-MC-Unique: 4rdR748eMKOnUll6nFzcWg-1
X-Mimecast-MFC-AGG-ID: 4rdR748eMKOnUll6nFzcWg_1750837409
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so544533f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837409; x=1751442209;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+VWyYD7FtmHGvesh+xzgd8YBBQ92N0ZCiKER/Pbh68U=;
        b=jV0emCr6IfnsPk4lGkHfXWCjDb2WrIEpZoCzrJm7Y42Mob8u5jdCQ5bfuO/VKWv7Vp
         6yi7t/89R8vSmXpX+qeGj+GALe7cP7N83EijEEYqe0ZuaLJqKlPU3NU8DKHO081zItwU
         RN9RH4BAyw6CFqRSidGWNs9HIPCdGHuUNv6uVadLDkPuaZXPShUE3NkKwbGGSgl+ndbc
         IcNdI2dOvskF509Zgv8368dZ15ymXdseS4tK0Ko5P2QoyobmHav8CJBClPxxYsW1TTQs
         nzVoyNA2y3lWLNht6Ia+MWEXtjepaDSM7G2QCObo5gqLxuWB13ypqCDDj3VkwWA7Ze7/
         eBIA==
X-Forwarded-Encrypted: i=1; AJvYcCUEIxMrsxLIpQbDVcO4Z3Clns/J3xfP+1fmajbTBDNdGgjzqAWlj2mr1VMIgJRpywI/eNf90eRq3CaylNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzytJNqTBSyuikLNIAFILPSUOaN9WtBMPzE17AUZ9yGcqslvV/9
	at6/b3VJJoA2ExYFZNke52gPrjLYyHdekwRdpH2Yq7zTmndO4+eSUU8CBJxMZhyS9u1Rh/gPj79
	IhQsqY06l8ktAAVjS9qdYMDKXORGnSGtY6k2aQ1fZw9Xvny8jVj7/69JQlc9kKx9zNQ==
X-Gm-Gg: ASbGncsXjDsigKuzxYsqJpgcvKR+izJdeiWsn+OkKVxJY2GQhKMyi4DcKczXsUZLSw8
	adI8RuNRTQHr90qiUdZWk2wIug9aybd13+ZeoQdJMIejQEXsMPz/ptYUX994hV/jHCkwZHiZ5ec
	QXAQZYBHmWLHG9m5NyUr1eZB+K7Eth6xdh2LShDgzhgQ2Y9xI9BxcnbTSNkebotfcjy4LXOhbAh
	VrhpeJUWOo+9A3I158sMvNjN6uylpDsu3TLSL93OcvuakSy3ct3GeyMtB/WGUU3/BwWW+acq9eK
	z2yY8FvPq83vJsqJ6fqGO0IUBfYEkrZNMHTQVGBPe4tLwzRuZz1kPIpkc/zrFSsq6dA3XuxJf9B
	NLTZoqzr2vFqJuNRCUCUaVrDWAN2T7iFvMzp3vxkXQqxS
X-Received: by 2002:a5d:5c02:0:b0:3a5:2182:bd11 with SMTP id ffacd0b85a97d-3a6ed62252fmr1347706f8f.20.1750837408868;
        Wed, 25 Jun 2025 00:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIp7DbbYf8RkCcHIGYXE8Zg5wPhCbUB0jKNR96tEG2aN19m8kumRsKhWJIAr3MONXFci4j4A==
X-Received: by 2002:a5d:5c02:0:b0:3a5:2182:bd11 with SMTP id ffacd0b85a97d-3a6ed62252fmr1347683f8f.20.1750837408475;
        Wed, 25 Jun 2025 00:43:28 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382382299sm11335015e9.40.2025.06.25.00.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:43:28 -0700 (PDT)
Message-ID: <be9f5ff8-f01c-41a8-b58e-b26b264940d4@redhat.com>
Date: Wed, 25 Jun 2025 09:43:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 17:33, Lorenzo Stoakes wrote:
> Now we have the madvise_behavior helper struct we no longer need to mess
> around with void* pointers in order to propagate anon_vma_name, and this
> means we can get rid of the confusing and inconsistent visitor pattern
> implementation in madvise_vma_anon_name().
> 
> This means we now have a single state object that threads through most of
> madvise()'s logic and a single code path which executes the majority of
> madvise() behaviour (we maintain separate logic for failure injection and
> memory population for the time being).
> 
> We are able to remove the visitor pattern by handling the anon_vma_name
> setting logic via an internal madvise flag - __MADV_SET_ANON_VMA_NAME. This
> uses a negative value so it isn't reasonable that we will ever add this as
> a UAPI flag.
> 
> Additionally, the madvise_behavior_valid() check ensures that
> user-specified behaviours are strictly only those we permit which, of
> course, this flag will be excluded from.
> 
> We are able to propagate the anon_vma_name object through use of the
> madvise_behavior helper struct.
> 
> Doing this results in a can_modify_vma_madv() check for anonymous VMA name
> changes, however this will cause no issues as this operation is not
> prohibited.
> 
> We can also then reuse more code and drop the redundant
> madvise_vma_anon_name() function altogether.
> 
> Additionally separate out behaviours that update VMAs from those that do
> not.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---

Oh, that is very nice

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

