Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2D22A4FC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796439; cv=none; b=VPoFRqptIBE3ci9s9iijcemjoMC9MZ6BMk8HdfSdzQN6M2XWe/OSWMVAnifbwemJ3sQzSGlJ53s2res0HwiG5qCItv+tO8xoL/xlsGPYdHa9QgIFBS7vLSlGXdL+RGnD1j8hU2FztlJQLeMJLO5T3ORDXh0C4I/Bwwb4MyPeSiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796439; c=relaxed/simple;
	bh=B5PBLphC01QcrnnfqOwYJjeSraaXg7z8RQbSx3o64Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+3XiiNk6KivDrnGzWiOYqK6dFrwRj6FlOE0h8YuUpbzCVgfnptb8ZbsilImm41POe3Bv72Q3JIoxj5DxWBjPCs7dTcBK6FgpMRTLUNvqsrI9IUdz6g860I7a+diin7PXcJM2lC3DLrAffxdvx60w0tBI81A7+BqjOlsR3kh3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hH+fDpD3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hH+fDpD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744796436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a3qNFKxOG2VROH3Xg78LQUUOT835aefirG1coqjdIvw=;
	b=hH+fDpD3mBuvdQDM3bsRl+zzHVftCj1oap23+1/JERYD9SFXBVbo1o7Jt7DdnQQjuNtWfE
	WS+P/Rt8yEnMBgcyZ+m5lRZ/WSQN+Ha62IctNCr+q7vICDL9VPdC/sxbwMq9KEdOKAePHZ
	rIJKTbWVlX7yYAjWVxVYjZjKFRSjADo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-NZEYlvSOOqykfZuZ5v2wiw-1; Wed, 16 Apr 2025 05:40:34 -0400
X-MC-Unique: NZEYlvSOOqykfZuZ5v2wiw-1
X-Mimecast-MFC-AGG-ID: NZEYlvSOOqykfZuZ5v2wiw_1744796433
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so49872315e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796433; x=1745401233;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a3qNFKxOG2VROH3Xg78LQUUOT835aefirG1coqjdIvw=;
        b=dr9jlgLNs06D59XXiKI/R0U4092cTQYe1wKX+GQA5gyfegT8L0OPeRI0SfWZ1Sca3G
         ZicYitePMNhoUY/M+w57JNyM1fUazNOpz5F9eHtpt7PwpHx9lHUiPVkkOd70GxgTefeK
         6CYdU76auuK4DZqjMPnsTTSxnX7QZ1vnJAKLqaWD2j+Wat25bZdnjg0Jp50bFnQ29fgf
         jSyCtjAcPXvmV139mqHEo5Hz31Ez0p0SrHREiToQBijg9yFnhey0g+guX9s32rlljSbX
         geuxd2812iGSOZXNS8xZ/q+cjW/Lw1UpVg9ie7iE1vd65PE2FjnYXbq8fHvspS52HM3G
         Z2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTj+5kEiBdYaY+a0nPxGaQO1FJC8FNcygvAsBKxznHkPqkr7XSYd7T2ASfsRM2q1fDlWlftWJwykO7Zqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD4xyLJsLotskrV0xxMTjYHua4iJ0l6mrPgXFVVNVb1Vr/pUIi
	ib0YykdWrDMh42dgaZFFtm5M34Y+5EDMDERy79U+vTACKofMck6DB6HI05TpY713RbRIIQjovno
	X/pGIHimylAbjXHKurmwprNsBxYcqQU7lqXGBaYpBeYj7W5oBo5Ml3cAxWPRDZA==
X-Gm-Gg: ASbGncs/9DjTjCa6iZCKgQxOmMfZBhNsDA5CJZ1Mg2sAGoORwZQlkU2cABaiMCnWuiA
	5nX8YzEw/PK5ivM4eVRImfyCdRBY1BQWxvvnqD0hG0ifxMft1MiNP0EgnsM0juC6w54rkPpuEt7
	l4RScJw5DPrSlH1k1fYtG0seCsyc24KrfkFX/Wp5n0dVLT2MQwJ0vAk0s+ZPE7YT5zuy2ukFpNr
	Wt07CfZuD6yJQpAl5dYjPLlQMaf4E/ABuJH9xzUsUogII0NvX5kipMwNPmUpe0Iz4KBChE2vVfI
	Qc9hE3LsPA5+I61d4F0IV5A9yHmdbE95dDBqBq1F26Y57JFSTVMhVtNmbJro2j3ZEBY690I4c0T
	7O/CVV/i2gxaVcbEpCiu+wPxJ0UFKED1oCYnFwA==
X-Received: by 2002:a05:600c:1e28:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-4405d63821cmr14036535e9.16.1744796433450;
        Wed, 16 Apr 2025 02:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb5guqL9/wwiKV6Mj3UjKV6wVbSGuBpRQ5PFSwQkGEc5ks0iMgzwS8kwzayLT0kkrB7NujNg==
X-Received: by 2002:a05:600c:1e28:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-4405d63821cmr14036375e9.16.1744796433130;
        Wed, 16 Apr 2025 02:40:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b50b964sm15592645e9.27.2025.04.16.02.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:40:32 -0700 (PDT)
Message-ID: <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com>
Date: Wed, 16 Apr 2025 11:40:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Zi Yan <ziy@nvidia.com>
References: <20250412085852.48524-1-21cnbao@gmail.com>
 <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
 <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
 <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.04.25 11:38, Barry Song wrote:
> On Wed, Apr 16, 2025 at 5:32 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 16.04.25 11:24, Barry Song wrote:
>>> On Wed, Apr 16, 2025 at 4:32 PM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 12.04.25 10:58, Barry Song wrote:
>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>>>
>>>>> Promoting exclusive file folios of a dying process is unnecessary and
>>>>> harmful. For example, while Firefox is killed and LibreOffice is
>>>>> launched, activating Firefox's young file-backed folios makes it
>>>>> harder to reclaim memory that LibreOffice doesn't use at all.
>>>>
>>>> Do we know when it is reasonable to promote any folios of a dying process?
>>>>
>>>
>>> I don't know. It seems not reasonable at all. if one service crashes due to
>>> SW bug, systemd will restart it immediately. this might be the case promoting
>>> folios might be good. but it is really a bug of the service, not a normal case.
>>>
>>>> Assume you restart Firefox, would it really matter to promote them when
>>>> unmapping? New Firefox would fault-in / touch the ones it really needs
>>>> immediately afterwards?
>>>
>>> Usually users kill firefox to start other applications (users intend
>>> to free memory
>>> for new applications). For Android, an app might be killed because it has been
>>> staying in the background inactively for a while.
>>
>>> On the other hand, even if users restart firefox immediately, their folios are
>>> probably still in LRU to hit.
>>
>> Right, that's what I'm thinking.
>>
>> So I wonder if we could just say "the whole process is going down; even
>> if we had some recency information, that could only affect some other
>> process, where we would have to guess if it really matters".
>>
>> If the data is important, one would assume that another process would
>> soon access it either way, and as you say, likely it will still be on
>> the LRU to hit.
> 
> I'll include this additional information in the v2 version of the patch since
> you think it would be helpful.
> 
> Regarding the exclusive flag - I'm wondering whether we actually need to
> distinguish between exclusive and shared folios in this case. The current
> patch uses the exclusive flag mainly to reduce controversy, but even for
> shared folios: does the recency from a dying process matter? The
> recency information only reflects the dying process's usage pattern, which
> will soon be irrelevant.

Exactly my thoughts. So if we can simplify -- ignore it completely -- 
that would certainly be nice.

-- 
Cheers,

David / dhildenb

