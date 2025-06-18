Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3C15D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236986; cv=none; b=hWJok2tXO/kT6Je4uxo1ng6DZwe5Sx3T0AmXzBFH7ArmaY6aZMchrmTO2JOfL+Uo1joIn2xmey/F3gn6L9Glj6IJEXexGOVTe74h/86/sJC+w0TuS+Tz7QfhShVxvs5BfaemSIfZPW3NH46vS7Tyxt9yMN78nAH2gLonH3sNRiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236986; c=relaxed/simple;
	bh=al6tAGSwn4yBJ+cKJbU86+Y2IYPl7NgYgonR4ZtPF9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWfdQ+KLCWZwJBGtcB/LhHYbvDwBaWRZ6GESIyqNwEoj3uWB+A2dMUxWdnY3l7G4TbOZ1D8Wz5GoSxME5qKIRoWq6gG5kub/guC1XHh0lgB7vjHbdIXzxNoHN9XJLp+CL9qOEEDaqN0jf3L93geLIwz4LHv6pHr6ZEWNrj28JhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O6FZ7JQN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O6FZ7JQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750236983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=j/M24CJGobquRHcUhHND5Tn9aL/nU45nc9Ymeq3tsS4=;
	b=O6FZ7JQNP1SkhyGq7s/d02/FtprhohpD4hxvtWiuYdmlH6qSN7flc9IaYl1fQgpjQnrRqR
	zOlau8NkyUZUTCxRnz+b0rfCeWGELb6MIWxI84YVdbl0AqDDOHFfG7kib0vKCwAmDzxrw2
	AHSwMVQM1NVxXpPA6/byL19GyngMAmw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674--7r2EGcdOBi0bRMDOIgb2Q-1; Wed, 18 Jun 2025 04:56:22 -0400
X-MC-Unique: -7r2EGcdOBi0bRMDOIgb2Q-1
X-Mimecast-MFC-AGG-ID: -7r2EGcdOBi0bRMDOIgb2Q_1750236981
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso34573565e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750236981; x=1750841781;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j/M24CJGobquRHcUhHND5Tn9aL/nU45nc9Ymeq3tsS4=;
        b=VcXI1/E0HXWVLKC5JWXvs1b6k9G7famhYlVOA4CaSyjtj57b+TKw+vALHSYr/6qLer
         wa5YhhFG85zOIiraVHh/0xMXZFlM3n+PtAc95PBnUXtlAXf2hWWaftgYnSTlOm7DERF9
         x8OwG3bdsQTbUUtToOOpsZRinsk7aC7X1BiDiC+jm7HOzlhVPhMFtQ8zz2q8sD0EiRaR
         PcQ+jIZem65Cs3Hp19DpjjXHNBbaeaun1ilqnHnd40i5dFwAW7ln+/GFc830tEYldpPC
         CW35OKNEg0Sqe+qPDyhblxvm3LGCRCWTx7OY2F5gitya6EFrIyAkJxAXvmkOzgySYwPj
         eWVQ==
X-Gm-Message-State: AOJu0Yz0N8DHWe7GoSCtHqOos5O2r+RwXcKdx+xNm0fq9AJfkC2fGtjm
	IUXEg3n1ikX4Ny1TP/iphif1TczpnLkPxMpDiMU4Z6rw/ky201ylmUX6d4WzZYVVakUmXp6alvI
	5ANMXVj6JmNNC3Z4ewtq7rth1PKQvIGn88rp/idVPWbGAzJcYN3zSoKuv7DwyaX/EEQQdMN2WQn
	Pt
X-Gm-Gg: ASbGnctM1xXtHrYfgT3vSGN/64gppLMHS8fzGRzhNPsxHbldPTfJWczDU9aizrLl2us
	f2P2jpbkGcd1EB7xvuL6JRriAXTcJhqfBLv4t3T6QUa9RjhDhnC3jDAhVXusZpTYpOlKyjfbXPo
	QBlImeixVwTK8x9umW+udoJHsC1uFRtNmDOyANHYeqseLcJzMksBPrrWTa/WGuG08olOph6TJIh
	9eNX3nubiYB/FImsh4bphmE7Vu4WQqPz0lfRh8N17HW9KAUSWzNTYjrglxEI0LsO7G2ox1MrGJ5
	rPP34H3BsA5zXuzbTozZ7fW6M2E6pc8cBftD6Da1KndyoS2kbHq/SXJhk5qwGnJJF2s/U5AqZPV
	DNZzqca9/za5boE0C/6/U2WvHTYZzhZqDedUlOaTF3rJR1bk=
X-Received: by 2002:a05:600c:3513:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-4533ca7443cmr204491645e9.10.1750236980852;
        Wed, 18 Jun 2025 01:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSZw6B2L/e3yrj0FP4v+sSNgoSUGDRbHqRlotNYU5gIJKYsFDW3FuXCiJ5+/HMn0j7ArHdMQ==
X-Received: by 2002:a05:600c:3513:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-4533ca7443cmr204491445e9.10.1750236980494;
        Wed, 18 Jun 2025 01:56:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b47198sm16035067f8f.81.2025.06.18.01.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:56:20 -0700 (PDT)
Message-ID: <e341d554-073c-4aa2-ab01-f9bdcd51c0f3@redhat.com>
Date: Wed, 18 Jun 2025 10:56:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] fs/proc/task_mmu: fix PAGE_IS_PFNZERO detection for
 the huge zero folio
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
References: <20250617143532.2375383-1-david@redhat.com>
 <20250617163458.a414a62e49f029a41710c7ae@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250617163458.a414a62e49f029a41710c7ae@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 01:34, Andrew Morton wrote:
> On Tue, 17 Jun 2025 16:35:32 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
>> is_zero_pfn() does not work for the huge zero folio. Fix it by using
>> is_huge_zero_pmd().
>>
>> Found by code inspection.
>>
>> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>
>> Probably we should Cc stable, thoughts?
> 
> Depends on the userspace effects.  I'm thinking these are "This can
> cause the PAGEMAP_SCAN ioctl against /proc/pid/pagemap to omit pages"
> so yup, cc:stable.

I think it will be included as PAGE_IS_PRESENT, but not as 
PAGE_IS_PFNZERO. That makes it a bit harder to judge the impact.

In any case, it's a simple patch and backporting should not really be 
hard (automatic).

-- 
Cheers,

David / dhildenb

