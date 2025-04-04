Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73471EBFF0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772504; cv=none; b=XpFoWdSbgJgSBRFbjty6TwlnTjl5ZhDeSihWHIzzuWbWVnJYh0MBg7WfQc+lqdOLhNviuSLc+9Z00N9OWrjhvDoYuEbXUNGPTfhEJilkg6liOycRW9ladkhw/d1wKIboFDS6IKqCPKTmHEHfBqySXClnRArS15QyGf9LPDRIudI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772504; c=relaxed/simple;
	bh=vX5p9sVhjz7HA8PKYNL29VclJ3CwR6FtXzBRgjuCEBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPqhnjUowyOpoD0upKTkhq1stTcP+Iqxl0q1tsCErE21vyVXQkROMm0kRNfQW9+rRUX4D1FhRW6ZcQKzTcvuUGV8B7CltO7ND77I4kMJNfl7CAj6a/zXHre+NSHZ4e/kHC3YD3s7vdldjFpSak3o161UKEoiapB8eE4klJu8ukI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6xY8vMO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6xY8vMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743772500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tH/nAZaQYAUEjrfNhy9sHHGSOGo2HXmsmBYYGxcbGak=;
	b=Q6xY8vMOSJp6GX1HWBU8kgiWwhQ/Q7+I8pRYwlDp+VxtdBSZ1v98f/lUllTLFaa3amPOqb
	PdeIwvntX61hBw1lRSFw+KHEBC6LX1d0101DMHDFCId7UQe0DP/Kil5Fr14BZMVEkSZ58L
	JSFc6AVoF+u/C9ZF9pcDynH67It84L0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-w_3_t99GOGG0085Wjmw8Ig-1; Fri, 04 Apr 2025 09:14:57 -0400
X-MC-Unique: w_3_t99GOGG0085Wjmw8Ig-1
X-Mimecast-MFC-AGG-ID: w_3_t99GOGG0085Wjmw8Ig_1743772496
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912539665cso1658232f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743772496; x=1744377296;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tH/nAZaQYAUEjrfNhy9sHHGSOGo2HXmsmBYYGxcbGak=;
        b=tRNOp+kYh/40NcRW/3M/WcZN1TYCY3ZLfxd8m9yVX5gZIQO3rqFoAEvkzt8rg4MdT2
         /TVyVbCkJnO4uDKwsKImoAvEYvjrIkP87AMjL3Lqp0sXTYMi15mFduPnaUAOYoXQYuHa
         9aak0E7rTy5n/ZgJmCuOehxso5JQCVX3NvkyIr5s+yxoT7UvNZMQFCijXQigRtL0mr9M
         YZSV2TDWaCKk76CF11mlrOdKZ4R6lxuShh0+zQFQHuH3RousEBiLIGKZ5G1D7sf/ZYcq
         QvzV/EqcE8FzePennY91mWufZm4tJ8Din7jLUruDG6dxe1axlb9Frr1xgyRiHQCpsXqe
         MxQg==
X-Forwarded-Encrypted: i=1; AJvYcCU+SP900nJGaiMKzqOL+DcQ6MzR4bK2jX39C82s4EAxwlAxKk2AjX4/pcdhvfRqcH27EfJmCvrqt1iQmrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOAMnrPIKHxiZwGdIWJ8ArZkafNL9SZTWTNrOd6sjLFxj7KYpK
	WZkEIjFbpLXfnaKCksDxnyNSm9kRy2yR/Oi2uNYGC54IkR+Zje1BO/pCCnhYvGTp48O/o2MnpMy
	vSmy5/nmpcxlSL6JNqI3J+ndpc/araIwetx48R4KTk7p/4vnYQ6Y2nrkjY7AV+g==
X-Gm-Gg: ASbGnctyEkQlGmWMBxTEhGgOMi06XWjX7R9KMusUCTcJSk3v3I0pqTNrCz7gXac7d/v
	F5BLxArQF14/SLHpsD5Zy/HBpX88e///6Qw4xD71uqcfJOgJOtU0oMtw0HK8bLvKUvGepGTRdS5
	M3cCCb2QbwMgEZ5Q+AJdF9Yyu5J/x/sbFC+3Ep8aw7zaxwK3YVNA+kc0tRwtN1SafahFDDWUmVy
	h3fi01wprWiSxJ4227FBBy8+U366uaBiSK7/F3DxGGU6rrtynmeWfbJyro+o86csQRJKCq1Swvd
	oImflkFGe0vKoMNzr2mr/GD2MUQiOyIMcHoXaAd9S2mTI9ZTAlGvSMyX4zu+Ud9lrpSCPaG5SId
	CBuMxk9Ec5xIhwYdFO4ODOiztuCyDXBcgbq/N6VYKmFQ=
X-Received: by 2002:a05:6000:2511:b0:391:386d:5971 with SMTP id ffacd0b85a97d-39c2e6221bcmr6688874f8f.14.1743772496109;
        Fri, 04 Apr 2025 06:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhpWP0+tSryE/F3HrLI6J9Dy/kxt4ga6GvbmOj8N/pwCmdRImjCHfTs54PUopmUXbTvP9ydw==
X-Received: by 2002:a05:6000:2511:b0:391:386d:5971 with SMTP id ffacd0b85a97d-39c2e6221bcmr6688843f8f.14.1743772495734;
        Fri, 04 Apr 2025 06:14:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366a88csm44791195e9.37.2025.04.04.06.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 06:14:54 -0700 (PDT)
Message-ID: <f289587b-2d0e-451e-ba47-162512b022b7@redhat.com>
Date: Fri, 4 Apr 2025 15:14:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, mkoutny@suse.com,
 Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-2-osalvador@suse.de>
 <9d5567ee-8c48-4fbd-97fd-d13f28325621@redhat.com>
 <Z-_XAjHdG5nd-xEH@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z-_XAjHdG5nd-xEH@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 14:56, Oscar Salvador wrote:
> On Fri, Apr 04, 2025 at 12:09:39PM +0200, David Hildenbrand wrote:
>> Assuming we can remove the _normal stuff and we can do what we do in patch
>> #2 here already ... meaning we unconditionally store the nid in the MEM
>> notifier ...
>>
>> What about extending the existing memory notifier instead?
>>
>> That is, we add
>>
>> MEM_NODE_BECOMING_MEM_AWARE ... and trigger it using the same notifier
>> chain. We only have to make sure these new events will be properly filtered
>> out (IIRC, for most we do that already).
>>
>> Of course, the range will not apply to these events, but the nid would apply
>> to all.
> 
> But that would defeat the purpose of having a diferent notifier for
> those only interested in node changes, which is not having to bother at
> all with unrelated notifications.
 > > Yes, the handling would be simpler than it is now, but honestly I 
still see value
> in having them both decoupled from eacher other, I think it is cleaner
> and expresses in a more clear way the change of what the consumer is interested in
> get notified for.

No strong opinion, just a thought.

> 
> Unless there is a strong objection, I would pursue that path, getting
> rid of the _normal stuff for slub along the way.

Yeah, getting rid of _normal and just have a "nid" will make things a 
lot cleaner.

-- 
Cheers,

David / dhildenb

