Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8609628CF73
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596709; cv=none; b=mU4rhta9p0NHxhWhJhSxeQR2ycQkY9g15aFw+pCWBmY9oyYyGqg7qFnpWvf9mRMGvW+Z6rgnaaOVc2duIt/NxQ21aDdC8zSr3PVcm/6MmWOoBAzUtKlbrVeihYGx7PjRveQJsWUhO+BJkQ08/k8Ofpkl7FsSXt3+bRURX/9Z/xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596709; c=relaxed/simple;
	bh=/aqRWYDz3+PhDQbMHa1tp3WDDi8A4VT+Cr+UuJ3SKC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PN/Sih55TejjwkfN4Xh6j0K/XnEI8Dmh89jhvOspnMCIiM77tSb64HZqmrkqjrMC7plBu3sv05/kL5ghlZXE9h539FYbxo2/Ie0Cqvh8sbamTkTdf5LRS6Xnsk++PuCd2AVC1za6vqNKeYTKR0uHtOcg27QCmlXFnIq9QV8iUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfkiu2bO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfkiu2bO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745596705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dlJYDwbFFHt9mjy5FeeoBwjn/d0ty4DWBjurl4PTHGQ=;
	b=dfkiu2bOUwxiQkiptVDjunQfIbVd8/HUulseX6+3kmK1xUoO3q4JM9vTHjKqPo9B6C5K17
	MCIeftj9qnWdBdj2e/xL41x100DpTNplQ3eaItKIg38MJklT5iHcycJIrhQ5PAq+ZwG3dV
	btueHpRrMryOlpz8mRpvEecRziZj4q8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-sq3jnsKqMkKoDAVfawrRxQ-1; Fri, 25 Apr 2025 11:58:22 -0400
X-MC-Unique: sq3jnsKqMkKoDAVfawrRxQ-1
X-Mimecast-MFC-AGG-ID: sq3jnsKqMkKoDAVfawrRxQ_1745596701
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so12541705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596701; x=1746201501;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlJYDwbFFHt9mjy5FeeoBwjn/d0ty4DWBjurl4PTHGQ=;
        b=WNRO9uixWJxr1EjQADdqVRPUL/uKDfxKlusfze5zYvzdDE00IRvxqgRSfOe71xaooF
         4UzR6TyUKV7vuHjmT7+RvTLgfQG5m1nwHD4JC+002PgEJMEBz+KyRBzdUnLAKhBeXm8w
         l2Xcxa9Risl/lsi5++2h66mf1g/hK8p25zDGnSdRUu9bJwJhYyeWJ8C4ffKUaPAefmn7
         Yx+Kp3pLVNu15QXmsEB08RU+PnFyUG0FeGfSNevGjgM+SZ0zpiCT56MTFLn25iOSaPNb
         iKMbbQr9+mARuelosAPspKv2j6fpaXO7okZzI6iRfMIKK2L3/eDHIzZSP7Jme2OU4l/z
         LSlQ==
X-Gm-Message-State: AOJu0Yzpd/47UnuTHtvVanHhwTroGgQBnsuVOlyQnf7MwtFroEtX8nZ5
	2LKf0cVnKIyH4HdY8awQ29dS6cfkI3u7GsZbDS2N3xMvUDGwdaTk7njxtOK47CRK69e7HPrhT69
	uZUvjscCEzvaNNg0G9TWC/BYy3d0yVV1kTDNcAJ5odckCnnWachkVhLFxolHKrg==
X-Gm-Gg: ASbGncuG5cI/HBvz8UQpr/0CbgabNEmVdn8Q4vNiAwq5hX7x8OPjrd1he9ITde0OR40
	me+bgp7WMvL7qLVkYq/EhIXfkSvZuW5yeultR83vs8iduNZ6OrdHD5R66ANpZCOegwkA3WI9lAk
	RTZPUlTpvfWR0Bf6NxynMDcRzNxcxj6z08FhltWW7Te38CsPvPJxrE9ehYbYd+2b9vIm5F6CxY1
	+2XOsClT5z1M9zSo1/3Gnny/jFE0Uxl++l2yBU+iPpB48YqZNUnvYfk7wRc4tRU2BifseDFf+ef
	pDl1McxkIywT/ZC9pa5eFJMsfk116nbR0PrSts8RimGl5Gk8ag9zCZxjENQm73bgrLk42JKW/nz
	vM+h1+qTsvZ+xEOl9YwPvQN4m+DYmDY547Gq/
X-Received: by 2002:a05:600c:1c91:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-440a65dedfcmr26860455e9.11.1745596701013;
        Fri, 25 Apr 2025 08:58:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf/cX7CKiG2B5aqouPDe8G518RQAT+gieqSXtXcKyyNhh6mdgrU9lR51b+m2trr5gamUeeMg==
X-Received: by 2002:a05:600c:1c91:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-440a65dedfcmr26860255e9.11.1745596700656;
        Fri, 25 Apr 2025 08:58:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:6900:6c56:80f8:c14:6d2a? (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2abf73sm61323305e9.20.2025.04.25.08.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 08:58:20 -0700 (PDT)
Message-ID: <dfc6db2d-0af2-44c2-8582-7e783b0292ab@redhat.com>
Date: Fri, 25 Apr 2025 17:58:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm/userfaultfd: Fix uninitialized output field for
 -EAGAIN race
To: James Houghton <jthoughton@google.com>, Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250424215729.194656-1-peterx@redhat.com>
 <CADrL8HXuZkX0CP6apHLw0A0Ax4b4a+-=XEt0dH5mAKiN7hBv3w@mail.gmail.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CADrL8HXuZkX0CP6apHLw0A0Ax4b4a+-=XEt0dH5mAKiN7hBv3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.04.25 17:45, James Houghton wrote:
> On Thu, Apr 24, 2025 at 5:57 PM Peter Xu <peterx@redhat.com> wrote:
>>
>> When discussing some userfaultfd issues with Andrea, Andrea pointed out an
>> ABI issue with userfaultfd that existed for years.  Luckily the issue
>> should only be a very corner case one, and the fix (even if changing the
>> kernel ABI) should only be in the good way, IOW there should have no risk
>> breaking any userapp but only fixing.
> 
> FWIW, my userspace basically looks like this:
> 
> struct uffdio_continue uffdio_continue;
> int64_t target_len = /* whatever */;
> int64_t bytes_mapped = 0;
> int ioctl_ret;
> do {
>    uffdio_continue.range = /* whatever */;
>    uffdio_continue.mapped = 0;
>    ioctl_ret = ioctl(uffd, UFFDIO_CONTINUE, &uffdio_continue);
>    if (uffdio_continue.mapped < 0) { break; }
>    bytes_mapped += uffdio_continue.mapped;
> } while (bytes_mapped < target_len && errno == EAGAIN);
> 
> I think your patch would indeed break this. (Perhaps I shouldn't be
> reading from `mapped` without first checking that errno == EAGAIN.)
> 
> Well, that's what I would say, except in practice I never actually hit
> the mmap_changing case while invoking UFFDIO_CONTINUE. :)

Hm, but what if mfill_atomic_continue() would already return -EAGAIN 
when checking mmap_changing etc?

Wouldn't code already run into an issue there?

-- 
Cheers,

David / dhildenb

