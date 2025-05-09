Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63D91C5D44
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782725; cv=none; b=tK/6vZ+7+QMJOLM0M1CNiB6eSNpKuYNhUNzLetfaBFASUU2jRvXx0iAMTT+UHeUsjDoA8YagIr3fB3hx8Dn1ieXBWSmNX50d9u8+shmYhhFsh15Mgh4uv9rnj8AJPxnBBTT3ups6aH0N1ZsKPfpmS4CqyB+goB/mci/rRJm1QDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782725; c=relaxed/simple;
	bh=dOkZJ0at/y7eDTF/u/Hu+ypXmbh0wn/CN8t/CxaMH1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsj9mpDkctnlHTwbRHhdkxo+x7lf+U5crO8h3RPnCedhbvbesh5LmdyqWojZSL60GOhmnl1nifwv5pXpXQ2ljlpvlCzwfPd7a+8VoUZ1LSoziPssmarVrtFvDIwytipCP5BxcBQcOUFzCrZpf9KU3QAUBfzsoTvg3PoNd/G3BTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dA19gBvb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dA19gBvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746782722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gC3niovTNsKcfBpvniJnuYKmRNkE6NrDTmNF28rL3a4=;
	b=dA19gBvb+zrRZoUddLB6UKnLoQppR8GI11nXoYF9WU4iRyjiHTfkIrARtT0kCl/awVEylK
	L1zrCTZTAuqomboDionH4VyvyEIrta8La0SaALd4EU48DQbRqW0qZo4OnOrIKLohxVpVoy
	5M2+SzwJlj6ZbC8JYeMBWXV1w6gp2VQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-P8K12WpDMVCpebLU4Qdbng-1; Fri, 09 May 2025 05:25:21 -0400
X-MC-Unique: P8K12WpDMVCpebLU4Qdbng-1
X-Mimecast-MFC-AGG-ID: P8K12WpDMVCpebLU4Qdbng_1746782720
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so777893f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782720; x=1747387520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gC3niovTNsKcfBpvniJnuYKmRNkE6NrDTmNF28rL3a4=;
        b=gPfj2nPZ2mhybF/c6li/EGKzWVDdLadAV6GAfPd9Jgsz6E8HWIn+uz1QFJyrOPQTJ7
         gcrn5iqIi5zGOu5VGs86GNne6nTS98Tso6xvEOPd74kFN0vrpo9aHkkpiXvdZTTX9xRv
         SwimaILwkJQ/Y2OM6qCyF1TUz8xOugbHCkR1cRNFCcj+cur3e8x+DRKL9U62A7y+a7qg
         0kHTl5vw3h7SyhBuThhHuiBB+ANZeQfLTse0WzlSi2NrlkKNFKbWOflvCc2g+l4PcoWf
         3ubrv3w8onnRSgs4lm5MQAL+0UbycRaiCJbVkJ+WYPj8WHNa4y7V50jsw01MM8OJ29M6
         QFKg==
X-Forwarded-Encrypted: i=1; AJvYcCXsXor71RpiBkxkkUNfRvKcMFq49xNfW6LOC/F2E/hxyQEaUc02sMJ3HKDiCcN45UmPcrOAfA7h/PHmFjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztK5npypmPASynkCux2OerTYk6q56HXrQ41NQl8HeBD8u5AJxr
	tI61ZiG7gn+rgcC5bqGbBR4kjPIJcciT1JUgs7gpQQpz2GWqyA9nkIXPZZyujyFWTIstfnh/xXn
	MVrz1o+S7hFvxFk3KoicWL8dMFDntgGCJJFuszlhE4WpJQGCNIy1R91Ywr2n1Fg==
X-Gm-Gg: ASbGncs6o/tVk3V1U5RABWREZxXq4wNLW6YCONoZU2nsE6m5YfxeA5f3ZZZlhey4QCo
	4MeWX1iXuBqsihdxM382KKhsltfRzkaThqxHeSIRmLDdMgSYXzgoV2YZInrUV9wBvViAPMVRzJ7
	5boZh6Hg3ezs1D37npq4sa0QO12BRq9v58Nn4hcOWhQkHg5SSf0psug0qeaIU/fYigH/p2L3kMg
	3bGc7wlQpjxN3CFYG1HJJzOGIXiENlmRfWrJEkydWXZujx69A6g6NfDvtziel5cGX8HW4DUUzx0
	Wzbq1sKhCZcC4ktkfg940t9q0LEhh4Cb72ifPOfpkOzgTwgHAuDuxJinIT/Pvj+QbRrMsWJxgyT
	4LsO9PlCioiwGWIgGtgLgh9Xbd3MdR5JgCbPLsvU=
X-Received: by 2002:a05:6000:1a8f:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-3a1f64a4beemr1911778f8f.56.1746782720193;
        Fri, 09 May 2025 02:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyyuyKxffd2MwgFvIsx7BZh9gLdSEtqPQS6R9hlTmutbGZYTSY+BF45tOubAe4+GSiv5pt3w==
X-Received: by 2002:a05:6000:1a8f:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-3a1f64a4beemr1911747f8f.56.1746782719842;
        Fri, 09 May 2025 02:25:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm2642810f8f.5.2025.05.09.02.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:25:19 -0700 (PDT)
Message-ID: <8bdde7df-15d7-4f24-b358-e9ffab0de1d0@redhat.com>
Date: Fri, 9 May 2025 11:25:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
To: Xavier <xavier_qy@163.com>
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, dev.jain@arm.com,
 ioworker0@gmail.com, akpm@linux-foundation.org, catalin.marinas@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
 <20250508070353.2370826-1-xavier_qy@163.com>
 <9ada79ec-f2b4-42bc-84f9-3f7b461ad829@redhat.com>
 <29f1ebb9.8e60.196b45626fb.Coremail.xavier_qy@163.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <29f1ebb9.8e60.196b45626fb.Coremail.xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 11:17, Xavier wrote:
> 
> 
> 
> At 2025-05-08 16:30:14, "David Hildenbrand" <david@redhat.com> wrote:
>> On 08.05.25 09:03, Xavier Xia wrote:
>>> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
>>> function by adding early termination logic. It checks if the dirty and
>>> young bits of orig_pte are already set and skips redundant bit-setting
>>> operations during the loop. This reduces unnecessary iterations and
>>> improves performance.
>>>
>>> In order to verify the optimization performance, a test function has been
>>> designed. The function's execution time and instruction statistics have
>>> been traced using perf, and the following are the operation results on a
>>> certain Qualcomm mobile phone chip:
>>
>> For the future, please don't post vN+1 as reply to vN.
> 
> I will pay attention to it when I submit it later. Thank you for the reminder.

The rationale is that many people will just treat it as some discussion 
noise as part of vN and not really have a closer look, waiting for vN+1.

-- 
Cheers,

David / dhildenb

