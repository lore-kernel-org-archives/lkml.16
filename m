Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229B6DDC1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797897; cv=none; b=RMeV+NH1q1lxygnDBFLJRdwL8z017tHS0/tTL6u9FFFUzgb4ergaLlKUwR4hbpqJgjeJThkXAKcz6NN33EU7uLZpCkifjDr1pXM3mJrH70ej/kETiCPOXkBGWCMjrUUWK8olZtNFC9r5HsN0xv4epv/u4E757ykrcNedhYIjjnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797897; c=relaxed/simple;
	bh=l1LrzonE/ZqRQWf+zSt/07d2A3MYLCZVllDPBAIK7nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpNhS6DihGYDbKZpVoOlw32jbCO4uZvWMEt8wuOHeGlUYPEurs6gTta7KniSqQeQjluyHQ5hvVfm9tGwL0/Zp1TO6HjX6fG+moF0z6WGLSvs5H6Y8IIGoPqZkQZP3i+jA+XU/uDWAE+FZy4HXUCLgnP0TOtGfbInpa5ihaAWaSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h98ooW9d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h98ooW9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743797894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vi+0cSJTE6iZRGZetauXjMyGZcNe7axFfDHJbW+LGCg=;
	b=h98ooW9dEh05YEEoNF6/wRTrNCKe5mfqnzBm9khKAo6jXZuqsNIsQzEeVLBoo+qeoCgScZ
	tYBXUaTRqkO+epmHvdl5k16mPowwxUbEBIaAP5z6TLCXazBg9vTOcEqxWcTVCLmqzKl+68
	5lzw9dcAS1xn5QBtfWgDl+8XLxNbV1w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-pidSAIWVMKOqd8Xqi57jNA-1; Fri, 04 Apr 2025 16:18:13 -0400
X-MC-Unique: pidSAIWVMKOqd8Xqi57jNA-1
X-Mimecast-MFC-AGG-ID: pidSAIWVMKOqd8Xqi57jNA_1743797893
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so13962585e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797892; x=1744402692;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vi+0cSJTE6iZRGZetauXjMyGZcNe7axFfDHJbW+LGCg=;
        b=aDZ9sCs64KpggvvGOGP3/DpM8p//Jc5tt1FcF+DegMWwAFHm3IoTjs9FjfcawBALpf
         ew2yzMMALF49dWddRc0LwKmOtOhWOTlr1qcPMYl2kc1oD2Euo2UdXv/V2ohtOB44xeZT
         FYSa9PvjxKO4wg6A6YDXzhkJHseo2yYzUkW5xjCiXMH+npPof63lIkorXkd4Okyb2C+h
         15wO8BiOTavRD/45CgLs74+LJWOKxv50zJojdqUBzPZvXCcwW6NxKc1XjXaJ9gRbj8UY
         PfiIWevolTaan4WBE9fonmLcpfniyfwIOezc+6ehyA1ESplaNq4DADLCFfUMRCxAUp+c
         t2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVwIfFD7RnoHhAynBzkR8IeJuc8/ORCiS4lsW/w/R/UlE0WfUogHGCUd+sgzQTv7yJXjJn/evFBJgHo1+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzls4Vj7O1MpDtv4B56GDV0wEN88+yJJ0a7z9b3EjEfY/VroO3w
	6uLQpkSSvLvR7V3PN+E0S0DvNAdGQcbAcf91k5iqduKMn5gTqyF8WKZ1p8o2b6/z8tkQ1S6Ohe9
	/c89KwTNZb4JhLREDy+Bdw9p7A4ilIMMwMQsQl8b+pBl4OLbKFcYfoJizElrrHQ==
X-Gm-Gg: ASbGncs0eNrzH7gMTzj628AKWQ+CRvxi2C6JYglsqdtXnbniyZfOI+jNhADkAvZHdH2
	MgfNDenZbWR9BPfkpTrtDVKo+u8LbLgRDAhqwoMM+35MZ/S3adVVKqYff8lHKxb/oUIOB3rJdwu
	RNQtoWi2DAXvQczKW7jo9EqoBZoKFTh+BfwKkrMtiujLRvYBNdWMLVTyH+0jy4yyhOPlrRrELVy
	ahM9Syv3dnpRMl7Q8ZWpW/1ID9ftanuVG3zVXzZz6ZtarxNrXKJgwkiwipf5PwUEV3OL9C0Wbj9
	rDZSRSo1O+lQh/Q9k/9Rvt2DHF9kQGnd/etDBhgV7NcMRM2Mk1SerjF27Y7AemSBSMuww3lrPHE
	R/o0LstpL28Gs/Klu28RVZLBTw98eTj9h1rpiTmzF7nw=
X-Received: by 2002:a05:600c:1e0f:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43ebee7417dmr99071635e9.2.1743797892632;
        Fri, 04 Apr 2025 13:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH71E37FWqlUk0xsBgnBlJF2qjX7NqJqBhqH/W1b2t3I8kJZkGQcK6qSo10KHCgRRFmG7x9vQ==
X-Received: by 2002:a05:600c:1e0f:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43ebee7417dmr99071495e9.2.1743797892282;
        Fri, 04 Apr 2025 13:18:12 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm5197359f8f.60.2025.04.04.13.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:18:11 -0700 (PDT)
Message-ID: <b9bef969-249a-41b6-8a28-a34be4318be7@redhat.com>
Date: Fri, 4 Apr 2025 22:18:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] support FEAT_MTE_STORE_ONLY feature
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
 anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, frederic@kernel.org, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com,
 huangxiaojia2@huawei.com, mark.rutland@arm.com, samuel.holland@sifive.com,
 palmer@rivosinc.com, charlie@rivosinc.com, thiago.bauermann@linaro.org,
 bgray@linux.ibm.com, tglx@linutronix.de, puranjay@kernel.org,
 yang@os.amperecomputing.com, mbenes@suse.cz, joel.granados@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
 <1618bf36-7f7a-4d32-a6a6-242323007d67@redhat.com>
 <Z/A0HJNtUkL+THCk@e129823.arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z/A0HJNtUkL+THCk@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 21:33, Yeoreum Yun wrote:
> Hi David.
> 
>> On 03.04.25 19:46, Yeoreum Yun wrote:
>>> The FEAT_MTE_STORE_ONLY feature provides support for
>>> tag check for store operation only. read operation is considered
>>> as unchecked operation so it doesn't raise tag check fault.
>>
>> Can you add/share more details of what the implications are, how it would be
>> used, who would set it, etc.
>>
>> Just from staring at this short paragraph leaves me rather clueless.
>>
> 
> Sorry for my bad.
> 
> ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
> MTE is built on top of the ARMv8.0 virtual address tagging TBI
> (Top Byte Ignore) feature and allows software to access a 4-bit
> allocation tag for each 16-byte granule in the physical address space.
> A logical tag is derived from bits 59-56 of the virtual
> address used for the memory access. A CPU with MTE enabled will compare
> the logical tag against the allocation tag and potentially raise an
> tag check fault on mismatch, subject to system registers configuration.
> 
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.

Oh, so other operations (read/fetch) will not check the tag.

> For this, application can use PR_MTE_STORE_ONLY flag
> when it sets the MTE setting with prctl().
> 
> This would be useful for debugging purpose
> i.e) finding memory courruption point, use-after-free and etc.

So what's the benefit of this relaxation? I assume it's faster because 
less memory access has to perform tag checks, and the issues you mention 
here can still be mostly caught (not all cases of use-after-free, but at 
least the destructive ones).

-- 
Cheers,

David / dhildenb

