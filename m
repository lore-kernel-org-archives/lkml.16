Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532B226B768
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925782; cv=none; b=l6Ly48ISHd7FYaAZ8HpB2hkilbSRxA1ocsBCVVBif1YMIskrDN6OrAwex1FR+RqZCHhcyLXvCOISbpQ47XbIXfOABWC4gaJz2rYAO1qRoG4tJcBFyxJIoU/MJdXCJGqKKQaQLjU4C9QY4tR1Vw7Z0pE0P2YhPPrBu2AMiimQX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925782; c=relaxed/simple;
	bh=2LaGHgeVxQQQMShe/h5KD7WE7trB8mcdOthVmXTBBMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xo2Fv11Ts9ntuhy1WXixI6wCTKMVHmlgIte+64Di2QSZ5NYa69Q1o3r1J8LlLABgNuSEJ8lq7xzCZs9q78D+gAVVDpLiCPjwaqqwcdk3DksyEYKyyInDaEkkAmj5jjnR2CJDCKFYbYv1gw8WHf4mJhJBcbjaLeu0hmOTzvvMkrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dEGS2Xpo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dEGS2Xpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750925777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qWPpr2CE+JfSG6/BLYsiDYGa2S9ML4EFd6pyLeDhF/g=;
	b=dEGS2XpoadtKfdEKop+qQdwkgkUa21STAFVrAYxRtwiAO11UycQA7y+bXaCUma8EGkQCu9
	uPuQbZvvNL+mLPwhBWsJROJ+br6zqXaMSDRrEn9OzMgp4ZkIGwrBs+4F4ZaQSfc1/C7pnW
	j4pNkm+rOuMHqUydOPY0ZFTSBOG0XXM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-dMoxIvQNNzui3FlaH-p6Fw-1; Thu, 26 Jun 2025 04:16:15 -0400
X-MC-Unique: dMoxIvQNNzui3FlaH-p6Fw-1
X-Mimecast-MFC-AGG-ID: dMoxIvQNNzui3FlaH-p6Fw_1750925774
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso3850055e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925774; x=1751530574;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qWPpr2CE+JfSG6/BLYsiDYGa2S9ML4EFd6pyLeDhF/g=;
        b=SHg001yEWOIYDlBFIrTmaZt1XIevyVNQsVEunrgI8LsxWzKkn/uT7BECqvDs+gBK8d
         KWOt3hJJXG5PkmUQr4r6ieIPiDI1c8l9boOMH7T01cpzXDUk8/nbVnDPkot125WiSJHj
         iY8jKjT3cyndNlbC6eAQ/dGRmLu+r26FuFqT55B2WogYgB52f/QUorFRZQZJSwmU+Alo
         Tq6Rr6+FN5x18NxjT9vgfq+eKrSwxQmG59o+kmIt2ot5jXfGNdYlzFserRObTRqS9j5m
         qFBCD2OHvl3sqyEIjd5xqRgAEnE+uril00+YS3byMZGivxv//HinnUs08NW/ihPEAAn1
         CmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIzIwgV/tjOc1/e2D27judqz09ULqu81SVACpjHq/92Vel0hYLHA/nzXwM0kPGN/NKlgJGON3/lDH0hzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBlg1kAqlAA/uCnj5QAnCnEF1v+wzgRavM9YqTZnX1y78FSqJP
	IUZcHAbUzOe+m/YaX8aXIzdUBS7SKpghcJe/b9svPrh7um/EgTave4iy+35c0p8C8n6dJj1TfcO
	jtQSXXQHmz+EkctXWhIlZgYzZ6uvvvPWWQ0BKeX2El+QSi8emjNkWXdpyHg8ow5yLNA==
X-Gm-Gg: ASbGncu5ouf7+j3+MzheGQ4FMzsI+9P5TzoQNVM8DobEh+932+pMMCRhION/kaTJ9ox
	UNPYNy7gVUkOH4OF+8FzunDLRqbnPeCuCZ+osWK455Sk2BlCglAe3w47QEaC3+puLKoFn71wSko
	/OLbFcJ10XmKOhHZHpfLFetAbKCD8tkQDiG14GnVLmcu351lkf6t5j/XPlu/Nj7R/JwxEd6R7ms
	RFnDd92D51nAh3jJHR08/IDeAyJSG+6DRSLGhU7XUjzPp6s6fBNR86KQxvTaQKnT9ddoui4HcZd
	I24BNqzYAJjJzH01JtGch8LaWCU5QqyG6xQhNOwtiYsweSz3S0wPOhBYLVH+EJnzcnkPxL2o+k0
	5QbVSLTrlnaj1cyOGVf6a5CJS9AP6Q5TksoTnOKx/gX1U9ZCP5g==
X-Received: by 2002:a5d:64e1:0:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3a6ed5e9c5bmr4874179f8f.9.1750925774104;
        Thu, 26 Jun 2025 01:16:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr09EJOFj1LiA0nSuyZyXutey/xEu/VWRh+xl0GZg6IjKhv9F5hRjD5Tch3vMl1jREoIlygg==
X-Received: by 2002:a5d:64e1:0:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3a6ed5e9c5bmr4874148f8f.9.1750925773722;
        Thu, 26 Jun 2025 01:16:13 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe043sm11573745e9.26.2025.06.26.01.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:16:12 -0700 (PDT)
Message-ID: <ff2421bc-fe91-42c8-af42-91b57824e312@redhat.com>
Date: Thu, 26 Jun 2025 10:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix do_pages_stat to use compat_uptr_t
To: Andrew Morton <akpm@linux-foundation.org>,
 Christoph Berg <myon@debian.org>
Cc: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>
References: <aFrBhyHQFffJ4xgX@msg.df7cb.de>
 <d42cc185-b774-4d5e-9a51-0581dd5f3962@arm.com>
 <aFwUnu7ObizycCZ8@msg.df7cb.de>
 <20250625133909.1a054c24d933cd97afd0027d@linux-foundation.org>
 <aFxltX73iZLT2HGx@msg.df7cb.de>
 <20250625141551.ca068f6bc901943559df6bdf@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250625141551.ca068f6bc901943559df6bdf@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 23:15, Andrew Morton wrote:
> On Wed, 25 Jun 2025 23:10:13 +0200 Christoph Berg <myon@debian.org> wrote:
> 
>> Re: Andrew Morton
>>> I'll update the Subject: as David suggests and I'll add a cc:stable,
>>> thanks.  I'll also add a note that David suggested an alternative, so
>>> please let's advance that option.
>>
>> Sorry, I'm new here. Do I have to do anything now? The above sounds
>> like the alternative coding by David would be preferred

See if my proposal makes sense, and then incorporate+test it.

You can feel free to add my

Suggested-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

