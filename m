Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71402D6615
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632172; cv=none; b=DfUTS7S3IEcPJQDwHvnYAM4OsFw6Dnx4dW/K1+Kr3++2yelUk2PzwvlF8GSj+XFXFbGbJWUSuKtreYYrnUJIrO9hypw98Xic5JTYCZc6vNaU+YOcdkmkgzafzjnYit53FQ6JHeqjke/xbgs9pv5b1ee0HwibZ+LwAhWs5a8TeAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632172; c=relaxed/simple;
	bh=Q4tcshuFWdW5pVrmTVatAcM0jKS98xgjiUhT7tKdrtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrtk5wRzhvEna/PLNAT5aA3RgxmpTQc9sYICoZnnZlCBya9GxDUrrHYZ3iCdjUXxbcIgbiQ8iSV2BdC6aPaBaQK3rkOJC8bMe1YBY82vckHK0zSRSE93i+lAcDH3S1l5vfyUgqRI0FbOyDHVnlMAISKXJ+Xj3T4jgFMboScG228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZgfAsbw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZgfAsbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751632169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nMfOzscqPrNeO+wtav6AyTkJRAUgHSVpqHt0DNresKQ=;
	b=PZgfAsbwjaDmPPT1WMFkBcqoJ1KVQ2mDPEAb4v2OlfcMwXbDZ3+LxMHYpfyuEk6tn3TRFC
	ZeMmz0LAghY27AKE43SFnu07IqxEmtfK2pmHoZMvF8pAZIVgK/UOmE8avtrSrA6kD2tAh9
	1toVnzUFuHDTY7tJHmtJdhs91QJb5+U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-D6N_YwrJN6ig7nHNNT7jGQ-1; Fri, 04 Jul 2025 08:29:27 -0400
X-MC-Unique: D6N_YwrJN6ig7nHNNT7jGQ-1
X-Mimecast-MFC-AGG-ID: D6N_YwrJN6ig7nHNNT7jGQ_1751632167
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso596935f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632166; x=1752236966;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMfOzscqPrNeO+wtav6AyTkJRAUgHSVpqHt0DNresKQ=;
        b=mRluVOgoxJ/yt9XEVm5JP6xQUDhCTZScfoqy1+XsJ/4PCpgb93LflekdqhRc1S4CR5
         0Ku5psOCAQR7DRv4ata9pYiLqTHwV1g18kgAEJHftAksFVFOyCL6GY6UuCx7XANFeaSq
         tzUtOHzlfY2wUfjhwVphBz0ssg4HrVgmX0YsqHam7j/tiWY6Bvu7/3XvgW/nd3R13Fiy
         sXeIBfUl8DXU9amQU0jpLUKIJHHRCbb7xbpRWrFsyXDiwAWvWYJfRwHEKg98Omti6Py1
         w3zVlX++VDGNNMlXWKW1QFoWe8mEpzFqa+KHPdAaQb0JrC+7AS34ku91lAKJUWiNLZKn
         notA==
X-Forwarded-Encrypted: i=1; AJvYcCWaZwT5V/468NF2VTRngtJkbjGsgH+dzVnX2sBzpwnRCmp8RwVckLa05xUjtFnDS9cTGbuEFCZoaPySCUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1W/eNYAeuDUZgw0fMF0m5+vlio+GoQDiz9/k+GTGMHzlDyl+F
	x2jvT3YyYzJX8V3O2KS+0f01K2lNMFagSI6vHA4dZB2PMCveFj5PAWKX5GspTJ7SRQy/uEsfC5q
	vxLzza8H5CzA3XT50A++Njt+xBzrxiXK1GE2tW0uBAWw4PhLcHPcM+POdoSMMJCMc8g==
X-Gm-Gg: ASbGncteZ99vgSFvkq6OmZpDZKmY/ecf2z4EPN0g7HCuggZihs0/8qhjaE8x49j3c9T
	gmDjfVvPQr5ApQpbLYkJpo2ZxFYdW6axj/PH+CKDS4s1+Rn0eAWuLOwsUlAtnJYtzZZKEn7YPaV
	ejjYyrNMD6rJD8LFanbDTk3okJbPmgjB0QTqH6ssxVnNEtbjeV0Vky9Mkj8+UL4fVL6Qbwt1doD
	ScIe1NO3KBZQNB0G8bEz2fII9AxRH9a/zOdAjCqOby75p1aNcibnZqf/KB4mxrinzRmg58xVb/B
	R1bpGc2pHXFMrnLxVU3Fxh2SPuFXwzXUelt9DvKEm+7d6P/6LFBdi9UCeoH/WZ+Xm/aIXyYlrn2
	5qCHTVCG5x/q7oJm4MsjUgkWTmKnSMfMpwuRGgK1azhhKYxU=
X-Received: by 2002:adf:b350:0:b0:3a5:51a3:2ef5 with SMTP id ffacd0b85a97d-3b496627048mr1392759f8f.58.1751632166498;
        Fri, 04 Jul 2025 05:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqBeqY6SkUrcobkDtTYO7nmm0Jh5I1+0Jk87TY5Y0gDytQOExUortOgjmHcTphF5n1W0izoQ==
X-Received: by 2002:adf:b350:0:b0:3a5:51a3:2ef5 with SMTP id ffacd0b85a97d-3b496627048mr1392737f8f.58.1751632166104;
        Fri, 04 Jul 2025 05:29:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470f871casm2381833f8f.45.2025.07.04.05.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 05:29:25 -0700 (PDT)
Message-ID: <0e36647a-414a-4f53-9159-1ae3ac836d11@redhat.com>
Date: Fri, 4 Jul 2025 14:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/node: Handle error properly in
 register_one_node()
To: Donet Tom <donettom@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
References: <20250702112856.295176-1-donettom@linux.ibm.com>
 <aGUqQbybFXd6uJu-@localhost.localdomain>
 <83012fcc-36ca-41fe-8e2e-949f1ba8adf3@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <83012fcc-36ca-41fe-8e2e-949f1ba8adf3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 14:59, Donet Tom wrote:
> 
> On 7/2/25 6:16 PM, Oscar Salvador wrote:
>> On Wed, Jul 02, 2025 at 06:28:56AM -0500, Donet Tom wrote:
>>> If register_node() returns an error, it is not handled correctly.
>>> The function will proceed further and try to register CPUs under the
>>> node, which is not correct.
>>>
>>> So, in this patch, if register_node() returns an error, we return
>>> immediately from the function.
>>>
>>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>> ---
>>>
>> ...
>>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>>> index bef84f01712f..aec991b4c0b2 100644
>>> --- a/drivers/base/node.c
>>> +++ b/drivers/base/node.c
>>> @@ -885,6 +885,8 @@ int register_one_node(int nid)
>>>    	node_devices[nid] = node;
>>>    
>>>    	error = register_node(node_devices[nid], nid);
>>> +	if (error)
>>> +		return error;
>> Ok, all current callers (based on mm-unstable) panic or BUG() if this fails,
>> but powerpc, in init_phb_dynamic(), which keeps on going.
>> Unless it panics somewhere down the road as well.
>>
>> So I think we need to:
>>
>>    node_devices[nid] = NULL
>>    kfree(node)
>>
>>    ?
> 
> 
> Yes, I will add this too.
> 
> But one question: if register_node() fails, is it okay to continue, or
> should we panic?
> 
> What is the correct way to handle this?

panic() or BUG() is not the answer :)

Try to recover ...

-- 
Cheers,

David / dhildenb

