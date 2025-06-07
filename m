Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A60A1B7F4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749319995; cv=none; b=bu0qdm0xVDeMtXfaQI4ey/6DpvJuGDtApgxJO9XFr9GYHocbB5LkE2bXIIVc2XaUUfk08eSMwt2KJx5aNZELjrQu55XjAvLjwEoc8b7mtEXtJtA+vJsZqbrZJfDsV9V6OcOgH+KsZQNteTEgi9pyBDC/x6SOsxcmXeyLaoI5PQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749319995; c=relaxed/simple;
	bh=771EgWHmZ27YrKHyY5MR8yckTZDwg/eVg77jI7TgWzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vA31edzhxYanavunACOEeEHB9TdVDxlVVTPsl0i2Jg9SzvP1sDbYZYhFNq43LsondJ/W7yhGzQNqQVZK9ndQCYU5AAO03fSDpQEfStccxVBGRhhHEL5R2YCrsjsujPznCDFQEtH4saGOMKWl8AeubrKSVi6dlRN6UAmk+/UNKY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RvzYHrjg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RvzYHrjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749319992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=29uFvuOP3q7rMVz1eFPMEyXv+qkCGU0VGEskSTBBmwc=;
	b=RvzYHrjg0UpfN5cV/wn8iLKwM+zFmJutXLN7zkRJckL4kHgN2GHWNWSzPY6n1OXWs3E54M
	d6qBglGRJEC9Fu2l1f1BAzUgxvNWJOIkcTYq/0fQiBYjvEG6HPMHmIooR2gifVNFg+MJqI
	ZxnIUbbZtwbptVYl011gpNuhs3eRK0U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-mzoWqvSUM-GBS6hMw8ugXA-1; Sat, 07 Jun 2025 14:13:10 -0400
X-MC-Unique: mzoWqvSUM-GBS6hMw8ugXA-1
X-Mimecast-MFC-AGG-ID: mzoWqvSUM-GBS6hMw8ugXA_1749319989
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450eaae2934so26391135e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 11:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749319989; x=1749924789;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=29uFvuOP3q7rMVz1eFPMEyXv+qkCGU0VGEskSTBBmwc=;
        b=I2J0sASO+9/UjXIp78OYPoKVeORNM3Cbz774dYoId2SshFtWDB0SUmTVUeTcZYxsnt
         FhdN4ToJ/0GvQVLQ9Ud9EwnoT5HgijyjBEjCPoyThPS2twkFN2IyhKhQ9/3SKjiASQN5
         p0PZtulAPejeBRSKUrw2YJ3B6ID1sEI6b46LTHTEd8+N6I5kxP1/9DaVR08MW1Wzw93V
         fNyxvnQLnd7dMaKf9PDeLWwbFfDSFusBJzDtN4+cUAtdbDgeqXKRTdbBqjadKXlr1H2y
         hAjlK5/3YDfys5nTTicyfaTDMmbFVrd5Z4h2rsWXj8USnUfZMbWJSwVerDrjDFsiMH5l
         BtXA==
X-Forwarded-Encrypted: i=1; AJvYcCWnTPo1SQ7E7yr+PKaUAq5L3fbTekWdXytt3ZHYw3xy6C09BSuscVxW9PCu/Pq3FbzxNxSY2m/BL/245h4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXpNIcrhp95nvo2MErsM9/hZKT9aM1/IWk8Nwx+gsDENaRWjm0
	MrCSOEMUzN2urPzjWucpu/mrB/yrb2FkGM7Aj1cG3YOxaiAz9SA7iisVtf2+YhfYmMMcB6HffKe
	loldIeVj6C6/+c5jx3EQqZklEAdrlAv9+cqscZoJOkieuqYkMHLPtwl5rGSAmVJwJ7A==
X-Gm-Gg: ASbGncsdI4hvlbZohDzCiGsGbw5KIQ4x+MovudhTu6PzhJFo+JkN8C7dC9HSE9wdoV7
	m4+oIzNPG0fjoQKKnSo8LqYbl0djH5cSU0N972NNV0W9aoBcEUe0sVuzQZT0fR2pEclZPsTVAYA
	b80RD6AwYI9mnRCZnhaLcXdicPFn25kt+wqt65hUW51HNStFwfvATCNG0PHSmuX3gvViIbDZAKG
	A8QLllVkhrih8ky212WPj472+n9lLQbaJ5YZ5kvr5aiHGuALw1pqHlUW5eBHgg4VpH8XyQLRphi
	eY5hgfJaX4uMcN3QKGsNHLjsTkXQiHVDotl1TqGMHMICs8wkkgq5kZQANNuWHcMdLFL11zlWPQ2
	OqWRWvTr8Q/9vwfqvUr37sB/zj21t6tQBHg==
X-Received: by 2002:a05:600c:8b57:b0:444:34c7:3ed9 with SMTP id 5b1f17b1804b1-452014d97b6mr65420075e9.26.1749319989430;
        Sat, 07 Jun 2025 11:13:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/pIpFNXUFob0u68ykRfY8AaVZm6baVknHkl8tlWjirCBRTSx3Hhj1WqNTeV+3GhyDuMHJ/Q==
X-Received: by 2002:a05:600c:8b57:b0:444:34c7:3ed9 with SMTP id 5b1f17b1804b1-452014d97b6mr65419885e9.26.1749319989059;
        Sat, 07 Jun 2025 11:13:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:9f00:3bce:123:c78a:cc8? (p200300d82f4d9f003bce0123c78a0cc8.dip0.t-ipconnect.de. [2003:d8:2f4d:9f00:3bce:123:c78a:cc8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532131df6sm5079756f8f.0.2025.06.07.11.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 11:13:08 -0700 (PDT)
Message-ID: <366227be-e22d-4757-b3c7-3eedc07df1b2@redhat.com>
Date: Sat, 7 Jun 2025 20:13:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/debug: Use BUILD_BUG_ON_INVALID() for VIRTUAL_BUG_ON()
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250607-virtual_bug_on_invalid-v1-1-b792ac2b0920@columbia.edu>
 <2a768123-4423-4f52-a0ef-96fa69872949@redhat.com>
 <CAKha_soMjczpY3HTpPVuw-fKTq0ZATdCnaPKPrsnTj_5ROepmA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAKha_soMjczpY3HTpPVuw-fKTq0ZATdCnaPKPrsnTj_5ROepmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.06.25 18:21, Tal Zussman wrote:
> On Sat, Jun 7, 2025 at 3:59 AM David Hildenbrand <david@redhat.com> wrote:
>> On 07.06.25 09:09, Tal Zussman wrote:
>>> This allows the compiler to validate the condition even with
>>> CONFIG_DEBUG_VIRTUAL disabled, and aligns VIRTUAL_BUG_ON() with the
>>> other macros in mmdebug.h.
>>>
>>
>> In the light of recent discussions, I think we should get rid of
>> VIRTUAL_BUG_ON completely.
>>
>> There are only a hand full of callers, and I am preety sure for most of
>> them VM_WARN_ON is a suitable replacement.
> 
> Makes sense. However, all of the callers (except for vmalloc) are already
> gated by CONFIG_DEBUG_VIRTUAL, which doesn't depend on CONFIG_DEBUG_VM, so
> using VM_WARN_ON_ONCE() would break DEBUG_VIRTUAL on its own.

It should either be folded or made dependent on DEBUG_VM

> 
> Perhaps it makes sense to convert the non-vmalloc callers to WARN_ON_ONCE()
> instead so DEBUG_VIRTUAL still works.
 > The vmalloc caller would then become>
>          if (IS_ENABLED(CONFIG_DEBUG_VIRTUAL))
>                  WARN_ON_ONCE(...);
> 
> as opposed to VM_WARN_ON_ONCE(), in order to maintain the existing
> DEBUG_VIRTUAL behavior.

 From a quick glimpse, I am not even sure Fedora/RHEL enable it in the 
debug config (and if so, probably it's not enabled by mistake)

I think we can make it depend on DEBUG_VM.

> 
> Alternatively, DEBUG_VIRTUAL could be folded into DEBUG_VM, but that seems
> like a slightly more invasive change...

I'd start with making it depend on DEBUG_VM.

If there is good reason to not fold it, then all VIRTUAL_BUG_ON should 
be renamed to VIRTUAL_WARN_ON and get defined as VM_WARN_ON.

If there is good reason to fold it, then all VIRTUAL_BUG_ON should be 
replaced by VM_WARN_ON.

The only question is what the performance overhead is. I mean, 
performance with DEBUG_VM is already bad (debug kernels), so not sure if 
we really care that much.

-- 
Cheers,

David / dhildenb

