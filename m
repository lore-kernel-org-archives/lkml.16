Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF281F4187
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104870; cv=none; b=aoUpiRslixgeN4djiFKTXJTNkCVt9oe2KSt3aus0FD9z4cI2xSI4pRyxpqU+HNfI8Qn9tSzWjseeKqmiwF6k2sTk8hTY47k/rYFK6SOoXdb1R3vLDJsor9XCTn0Z1puWNB6h/NiBzZBWnYaUD/ZFR4XogBWV+heVUfrAJhb/fhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104870; c=relaxed/simple;
	bh=cCE3ErDale2WCt3eW7s5MfG2qNRk9Cnn248VZzGg30I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=D3QDycGXsE4D6waThB+z0B1p0IfTfIXIyUYSUpyNxkcdxqU8FOaU5pyZDmU3TNqgi8c1mWduMi/apTzZ5eE1/OQWnnC3BT22N+DXZait724LCvqNcRHzHT/Wt0dNVP50V47ZRF8paPYIc5Tgj4GWcXNt7unGgM6CIeFODihMkN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZHYuO9q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZHYuO9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749104867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JQqBl5Hav61/7+PIBHrIWkPi3ZbnG5D1ATYx/fnwPpk=;
	b=WZHYuO9qTtoKULsTWW8B5MpHpBo6i+mb30/YB7D0xrSIBZl5XUDiaFhaKN+fA2S+JV3h8U
	2xFk6OYatMtg3EyOaleF965ggGZ/CLf35hoYlAG2VWJKJkX9cGXAHhXOu9qvRr0NtvmTWj
	aa/DngUctBM7kQVOXZd7bAX02qvdi3A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-m4j8hCOEPKO4hHLlfnHNTg-1; Thu, 05 Jun 2025 02:27:46 -0400
X-MC-Unique: m4j8hCOEPKO4hHLlfnHNTg-1
X-Mimecast-MFC-AGG-ID: m4j8hCOEPKO4hHLlfnHNTg_1749104865
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so223798f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104865; x=1749709665;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQqBl5Hav61/7+PIBHrIWkPi3ZbnG5D1ATYx/fnwPpk=;
        b=CIh12yFo+Cn1I2xk2qyoRUx3AziIgGKU+GQ1xlZr+ILBCERDB+vPMUEpNV6naTxHsa
         xW+HJF2cxcueEmII5wt6ZVnlCUg/Nl5pZARGezRRZlLJh2/mklg0bTjT9K/Cuekm0PDA
         aqUTtk8s+Spj90B52VF6ns21eHOIe5sBhhlSSY4lbWW6kb8Nkh/OGXp2hsrnMzUK52TD
         oGSV5o6W5ivfrjoRfvJryZGl9qucH/26mNM1Fp3p9AUfSZ0fiIQ1K2F1GUDlKHy65TT4
         cdTZOqx8WM1pR7Q52plHkob69gf5o1ob1R5sI91qonWvYHW46LTovG5etCTMVk/0uE1u
         9hmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC/A0KdA8+dvVpBTFU9SUxi98MLjSkFyE6tgNQ+zCeOoj64vSUXOdY5ijLhKGRAQVYbzyVlP1lST6fxZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiAi7DKjUAT/y/ULn9IRESD4qiYIyVqiDVGPaH1Y0VtZ+bc8j1
	68T6enxedmAFencsSDYkgxyg8K5S0d2yFg6gJVAul+hkUynsOWjPuog2yG4PbtMYk0hD0jetIDV
	nqp/imay/v2uE5KhEGtqh89I9hVr0Rl9dfLPdr8HQj6gTtiqIkeULUPlPXvM1gsJXon+HZkKmiw
	==
X-Gm-Gg: ASbGnctswE5fL1oDHrCeCC8kUIvCGxoadl1fsyBXiwj3npprO0kN14uqTKuSYlGjksS
	RzsFsqesHTkLwTxjbSXrUpwlT1KA44w5cLphbWTVT2v6t+bbucDynqiFUIa9Zue84zGJ6+OYi3o
	mlR/1FKJ2czsDyAjgq5KujCy6c+5hF8nI5yCFXK4/wvV8JzxZjqQ5mxPJnmpAb3Lvy6HncwnbxR
	hktggJkRY5X5B5L6D16qn43i07u+ycr8nq7Y39iOx8YFQ8x+udNXydJkhsEMrSil2NitgL7EIwq
	Cih/8fY+9fDj/Jjad0t+LavttZSFXGgC3+aIns1D0xrCWPi1Gbd1zsXBtnmt4/IFeh25rd2PMJa
	TmgapgHOjZ8DQR25pBxQ2Ts+9KBCLDrVKfGZy
X-Received: by 2002:a5d:4291:0:b0:3a5:2875:f986 with SMTP id ffacd0b85a97d-3a52875fc63mr914842f8f.44.1749104864923;
        Wed, 04 Jun 2025 23:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP82DWNcm4kr+3DIl7a/WPr3+qXyLZ69SiIugt0U85UNyOjfOXBI6jcGts81CLJP1ReI/69g==
X-Received: by 2002:a5d:4291:0:b0:3a5:2875:f986 with SMTP id ffacd0b85a97d-3a52875fc63mr914822f8f.44.1749104864597;
        Wed, 04 Jun 2025 23:27:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b962sm23296810f8f.7.2025.06.04.23.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:27:44 -0700 (PDT)
Message-ID: <fda7a3e3-1711-4f1b-a0bb-6a4369aa80ab@redhat.com>
Date: Thu, 5 Jun 2025 08:27:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in try_to_unmap_one (2)
From: David Hildenbrand <david@redhat.com>
To: syzbot <syzbot+3b220254df55d8ca8a61@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, harry.yoo@oracle.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, riel@surriel.com,
 syzkaller-bugs@googlegroups.com, vbabka@suse.cz, Jens Axboe
 <axboe@kernel.dk>, Catalin Marinas <catalin.marinas@arm.com>
References: <68412d57.050a0220.2461cf.000e.GAE@google.com>
 <4fc2c008-2384-4d94-b1bf-f0a076585a4a@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4fc2c008-2384-4d94-b1bf-f0a076585a4a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 08:11, David Hildenbrand wrote:
> On 05.06.25 07:38, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
> 
> Hmmm, another very odd page-table mapping related problem on that tree
> found on arm64 only:

In this particular reproducer we seem to be having MADV_HUGEPAGE and 
io_uring_setup() be racing with MADV_HWPOISON, MADV_PAGEOUT and 
io_uring_register(IORING_REGISTER_BUFFERS).

I assume the issue is related to MADV_HWPOISON, MADV_PAGEOUT and 
io_uring_register racing, only. I suspect MADV_HWPOISON is trying to 
split a THP, while MADV_PAGEOUT tries paging it out.

IORING_REGISTER_BUFFERS ends up in 
io_sqe_buffers_register->io_sqe_buffer_register where we GUP-fast and 
try coalescing buffers.

And something about THPs is not particularly happy :)

-- 
Cheers,

David / dhildenb

