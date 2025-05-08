Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2612147F5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725991; cv=none; b=VF/9KlCPb4xETuLRetTA7Nepkduj6mgW2AI2J/Fq9VAqOV9K60AOCOZxbtY3XJ/sGs/Pjjhyq8vTAUQAscuXxkfkt/gFZv32fk3dtHf0kKD1/wTAuj5VO8rQzbK5spcmVEP4I/pg/AyimRRFdjdyBcIlkTXcqefyhcD3dpBiDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725991; c=relaxed/simple;
	bh=KtvjGY9Fe2YNuKZctqRUqqkBT45SxE7zJ1x41PHf2Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkgC9C/ldSNA8JofjccYrPfYbm+oDyRrEOyPdxoqijE/F/bSc2xGVw04/tRfMfxZb0RpUoeW1L+3KJOE44YVtOMz7LiZK6TbDQX+jPaZNDgJregFeuFgvqFF7xsPFclbtj2fZCRHGm8CbcOAt4IJ6n9HLk2FlL/MtXjfqhHffAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=baNQpvSF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="baNQpvSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746725987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I+0CDo+4PSjAmJEYgOmFsoS8iuBIY+yAGCzqnnXpejE=;
	b=baNQpvSFYRTHY3CXN0FxJdaM4i8cxeVjR/a7JRnybng33y1DhGZhpAefYUSAK94QWRQK9J
	AQvkC5drK9j6InwRjGVrhY1oY3LUN53mYQdCEbUDYGEvrFCkLNCICaxSUtwQoKonnJfvHc
	w/gNSzTfQJgI0i80mzfFm6vcMIoqZy0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-n35X6InVPQCVyG5nPiz7Aw-1; Thu, 08 May 2025 13:39:46 -0400
X-MC-Unique: n35X6InVPQCVyG5nPiz7Aw-1
X-Mimecast-MFC-AGG-ID: n35X6InVPQCVyG5nPiz7Aw_1746725985
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so764800f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725985; x=1747330785;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I+0CDo+4PSjAmJEYgOmFsoS8iuBIY+yAGCzqnnXpejE=;
        b=Hk56gUs7H9F8vN1qZimybpffMNCFo8hmUVWq6J0qbZPdh29jcyjIuHJS0qyCEqqY9p
         Wr59CwY01ruiNNj+Ppzk2KkCwywJpLf0kHWhSGMMwuBjq45cbbyQyws80t9X1jiCSnVt
         VKGCtg1HhXZppVG9bGayB5NGNOUQNvybRyeaX0gaEp8Rg0Asaf3PGk6L0GUCC8o2CA43
         3Opr8g467ITj58GE7ZRTy0/RxHGFtidUQlr1h3tj+6d+e6cudauys6IxAE/QWd3PgQxc
         4PoiKXShHShnWsgGHVm/oGB//6FlGpC2oziEOviOcJupODsCcwuFfHGdoylGVqbzVJP7
         jdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx+vmEl60WhQhKEty/U7iq4AwJCt040LumWerHdgvU4C69KBCY1p/4y2lOVpw+/w8IMLOJiukCDFZrdjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqBZIuegqKMvwrmmNaHdRlx1780C66xwXxZRyXTqc+VD2S5Rib
	MBX7YoemYyPYlT5H28RhN2Ok/mnsRGCymJhFhrmbSm3MoNo/9aB1YWmP3umvuNdMbJs7RToJon9
	4U65I8eFdBP7USf9gEwV3Ut4Z5PQ8/g3eIKnQFvriKaTbvBB/Hh7lp5g4a9/yNg==
X-Gm-Gg: ASbGncsw9OXQino4bRmw6eztv2B4x3+rMTr1c5AJ9J2aT+5pnBgoe3MwQlfMAWX/Rf6
	fSXSJ8E7L6KfpDPH/tX0Z7wGiB2fkfkMYi87tba/lpBFljX4o5eyrGUQsNwqGpMU5P9AO9u2GQ0
	W9iBj6DxVbJKn5D2GPrL1Jj63UYDd3pYFchNb15BNQIfjrgCss3bQFhzWPCu5/KJFV8aWXhKHes
	H+KQbFRqBVE5+CTkqLPwQmphlYRqtqQ/x2HdX7k/s6+S0pvRnkekA9s9PTnhv+ovDOgA5PggF8O
	G2z+4ug5Mjjo6+gklseWhyMEvYsMnh7e1x6fvs5AJQMwN4y5H6UXDzEhn/yR6pwl6ts+XwJwL7T
	q6VkIeMB2V86F+l3YIGsjF1Q8rumbBWUhwdYb9Co=
X-Received: by 2002:a5d:5984:0:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a1f643ab18mr433541f8f.7.1746725984697;
        Thu, 08 May 2025 10:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbw18mzIu7WpRLnqIzNWQ0KTsMcidXjPK89BSCJDTBPOnW7iJ/5xsX+2ngF8ic7//XakpBXw==
X-Received: by 2002:a5d:5984:0:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a1f643ab18mr433516f8f.7.1746725984300;
        Thu, 08 May 2025 10:39:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebd6asm601685f8f.35.2025.05.08.10.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:39:43 -0700 (PDT)
Message-ID: <3f7ba97d-04d5-4ea4-9f08-6ec3584e0d4c@redhat.com>
Date: Thu, 8 May 2025 19:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <3b5d929f-ec2f-4444-825f-81e71f804033@redhat.com>
 <e706e2fc-201f-4e45-8dd9-e2e17c269466@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e706e2fc-201f-4e45-8dd9-e2e17c269466@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> We did something similar with PR_SET_MEMORY_MERGE.
>>
> 
> For this you mean the prctl command would do for_each_vma and set VM_HUGEPAGE to implement point 2.

Yes. The expectation would be that the prctl is either a) triggered 
early when there are not that many VMAs yet or b) inherited during 
fork+exec such that the target process immediately gets it enabled for 
all VMAs.

> For having point 1, I think we will still need extra mm->flags, i.e. MMF_VM_THP_MADVISE/DEFER/ALWAYS/NEVER.

Yes, and it's unclear what we really want here.

> 
> I think it would have the same affect as what this patch is trying to do? But would be just more
> expensive in terms of both code changes and the cost of the actual call as you now have to walk
> all vmas. On the other hand you wont need the below diff in from v1. I do feel the current approach
> in the patch is simpler? But if your point 3 is better in terms of code maintainability, happy to make
> it the change to it in v2.

Yes. Having a toggle that

a) Changes the default of new VMAs to be VM_HUGEPAGE

b) Modifies all existing VMAs that are not VM_NOHUGEPAGE to be VM_HUGEPAGE

c) Is inherited during fork+exec

Would not add any additional checks in our already-complicated THP 
allocation logic, it simply changes the default/value of VM_HUGEPAGE.


At least to me, this sounds like better semantics. Would that make your 
use case happy?

-- 
Cheers,

David / dhildenb

