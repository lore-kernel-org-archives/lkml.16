Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5A281376
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747766383; cv=none; b=YsnlwJL6167iMuaeBhJkhEajiUSnuPkFNrmR+z0bSbAsRlO7p93sWiwXOS9zJoKbOamCifBz1zStrfWK6HG/QUMyLG+d9SCDRpRSfe3YwW6cckEhoWCStfluhj159uhBM3eKPqLJv02pTTNNUGG9giKlvFSZ9aPUBW47NDUnY24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747766383; c=relaxed/simple;
	bh=5QKQrev1/bzNB/AS189H+KFjgOl0eLI/F13MgOgywxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phNu2E4ej0cij5s0dxk6HeulFv57+FlmrbInYnSOCkeSrazBnIIB+OYB8hAQhgd1DgUzxPYkg41VZ9TG3JMTlzrJ9/vlKJ48KeHWmH2iUrPyMgOtyh3QIX1wofkBk4dQCmSnZiwtaAvSUTe4uzJYzzX9DBnnQTa/+G/xs1Pg3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fj89U2Uv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fj89U2Uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747766379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oazkVRuA/8xr6yaO1AP5mGcCl5dBYx20SpTg/7GEVjY=;
	b=fj89U2UvvOWxJw3iDCh/NW60loc24aFjuueICBrwtdlcG21cPi/JOpXVWHnby0kBtSm1QX
	mJ8TtKUmoGwYVuKLz2EYzAP54KGFWu9F+qcl2X2SQjQSIdaRwLc96z0WnKgKzX5Qqn+qj6
	m/2/oS8QpD1oG6ae32gBXiwJuix0yH0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-mfD54SVMPRSTxbzf5DJddA-1; Tue, 20 May 2025 14:39:38 -0400
X-MC-Unique: mfD54SVMPRSTxbzf5DJddA-1
X-Mimecast-MFC-AGG-ID: mfD54SVMPRSTxbzf5DJddA_1747766377
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442ffaa7dbeso12668195e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747766377; x=1748371177;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oazkVRuA/8xr6yaO1AP5mGcCl5dBYx20SpTg/7GEVjY=;
        b=saazM41TLTQVp3Wor2vt2wJxNTdB0qUUnB5gMiHnbREJzGOnqIT7lv0xwR6k3s6DW6
         +VHtX0kLthQZWY7+IpfdaRLHwEFkpGhIaxeS7cR2EVCjBy0GQshR+FbGdxR4QkxVB5nR
         y/NjVCOrQWwME6er01Pk/VxvHBmiMYICbNZ6jfnU8GvmL3qy/MTFQi91uZm/pgVealSb
         2xkW1euMF2WoJj40SZz5VGW17i4tfNB/uEwNHyRWh2mHAYdqLfZDrU9qOTiV1Zsui4VB
         tAkufLmbQ2J5yTi4dFtdYui/Ac1THcaz1j77s8f7yR6EkRJ0lwhsie6eDG4U5+WxcMO2
         qxrA==
X-Forwarded-Encrypted: i=1; AJvYcCW6EHGFZhXvmScSTqArJIQcYqTMn4fQ1rwrhmFSzacS+hce2uuSdhWC6IQ9hf3ZDXLwKmjKOHGNyzgdDbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3mYaxf50qQDpn+FZ3xn8Iu1+gHQ4CZXnwd/tvhI6AiVq4rtR
	T8mAsoSV/SxL9drfXkNIWZ6hhwWKgIIZ9un/1axI94TEiXO6Q8fIVnR00Lvv6fnV4w6ZH8NcOdp
	OrBOICd4ix4VX2XqRzV93nH95KFV1AkaR+Yqx/72T05fZOJsw+OsV9rGqe7jA6Inzhg==
X-Gm-Gg: ASbGncsocWEQigFb5jdqEMUDdGBN1nzUxdA1tqVR5SbgomUc1L2lmRpX4gq6/lya0jc
	w5xKqeVhYlqAeN9P4ky0Tkf3UW40qtQhFJ/GCdQ4TRUWbrtIOOwAdMbAHMSuynPmOUZdpNAveEG
	jomUqVsDDaLuibbNgLXhFpwVSf+71TFZAFa05+/U0GsW7Dbq8viSSRorgKsFdyGVU4na5jpdq3s
	Nx11RMj6yl89qQjzYMDXpLu7I0lpKh9XpogR1bAJZjZTMTF0Jy5O8tlqBgxHPgQYtCq7xK5Dxmx
	ho34uUHaS7klEl+ivSjKEnOM6PWw5ER6v19BZ91STZ474+3FZQxckpENzoVcK0L9/W0MchleZ8h
	tR4xAx6jBWeP1BTNLzZnEuYOmmiq9TfCvINHqnJE=
X-Received: by 2002:a05:600c:1d07:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-442fd664797mr117644665e9.22.1747766376936;
        Tue, 20 May 2025 11:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9YxDvQpu/N8+vewgsq1dqcABzcf6fx4Rd1KP/cw42FWieBp13GKqxbHTIaldPb58U8SWiQw==
X-Received: by 2002:a05:600c:1d07:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-442fd664797mr117644575e9.22.1747766376544;
        Tue, 20 May 2025 11:39:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f182538fsm42330715e9.7.2025.05.20.11.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 11:39:36 -0700 (PDT)
Message-ID: <c90c79be-f27f-40ae-89ff-c4123b639874@redhat.com>
Date: Tue, 20 May 2025 20:39:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] add process_madvise() flags to modify behaviour
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Usama Arif <usamaarif642@gmail.com>
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
 <dd062c92-faa9-46a6-99a8-bcc46209e102@redhat.com>
 <c54d2c5b-e061-4e77-ac10-3c29d5ccf419@lucifer.local>
 <bbf64de9-3b15-40b8-8b9a-dbf05fa3b4c9@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bbf64de9-3b15-40b8-8b9a-dbf05fa3b4c9@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.25 20:25, Lorenzo Stoakes wrote:
> On Tue, May 20, 2025 at 06:47:48PM +0100, Lorenzo Stoakes wrote:
>> On Tue, May 20, 2025 at 05:28:35PM +0200, David Hildenbrand wrote:
> [snip]
>>>> 3. PMADV_SET_FORK_EXEC_DEFAULT
>>>>
>>>> It may be desirable for a user to specify that all VMAs mapped in a process
>>>> address space default to having an madvise() behaviour established by
>>>> default, in such a fashion as that this persists across fork/exec.
>>>
>>> This is very specific for MADV_HUGEPAGE only, so I wonder how we could
>>> either avoid that flag or just make it clear that it shall stick around ...
>>>
> 
> Sorry missed this bit.
> 
> I don't really like the idea of only for MADV_HUGEPAGE (and MADV_NOHUGEPAGE)
> defaulting to doing this, I think that's far less clear than a user explicitly
> asking for it, plus most users using process_madvise() wouldn't expect it.

The thing is that PMADV_ENTIRE_ADDRESS_SPACE already adds something 
unexpected: suddenly also *new* mappings will be affected.

But maybe that'd be covered by the PMADV_SET_DEFAULT idea.

Maybe

PMADV_ENTIRE_ADDRESS_SPACE | PMADV_SET_DEFAULT | PMADV_SET_EXEC_DEFAULT

... hm, but "PMADV_ENTIRE_ADDRESS_SPACE" can then simply be "pass in the 
entire address space as a range" ... and ignore errors.

I'd probably have to see a revised proposal after the current discussions.


Anyhow, limiting the flags to a bare minimum for now usually makes 
sense, as long as it is expandable.

-- 
Cheers,

David / dhildenb

