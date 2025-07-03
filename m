Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FBF2DE6E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547597; cv=none; b=a/GlFQWB/akdGtN5R30fiDad4oNlWhPCqDXCcn+aYSw+9EtHmEtXDm23SAk9G+zIQc8e8jkuVIqS+nc63YNYbHDWakVKcQ4CeVs9xXhj7j62MfqQy1D8IX8+fQk0IvyvqzARM6rb1gogN08M6RSLV8pCdH8uTYS678z1a7gihFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547597; c=relaxed/simple;
	bh=Z9nU9t4N68JZjsXfauyUl99qRwgf0v/fPWnSy+lH4mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rx4S6DwtC/T95BUVjIO+tFeN8CU3uMVeROpYA+z2iBr/D3E7F9nUaDFRtLrzhgLOUI8MyE3T4y8XuVu8YGS4YIIG7rwxeD3ZL1vPgDq8yW+c9ktencxB5IhildGozhCA2g4YOpa40fKPFdxO8R4d3Le5AwSv3/nj24GlJe2POks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VwT3bCD0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VwT3bCD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751547595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RPqm9+gCQ4G++ODNHAXi9UZv0hvANLxxg7IJ6626syU=;
	b=VwT3bCD0ZPbw7iN6C6PR7HyX6bdZyneJ7yD5ZnAbCg+iRyYovOYip3u03sflZyP5GeHw9V
	x1G8RlJp/pEKVQ3YE4XdMb8vfevalOBuVZja8OwX2AxFimyHTb/2p8OqduO6cAhaXxFAXx
	z8Mp4ZwdrNCNkw287Qk1KB6Ax9SnYDM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-Jp-T29vCNVKQCpRtmlso4w-1; Thu, 03 Jul 2025 08:59:51 -0400
X-MC-Unique: Jp-T29vCNVKQCpRtmlso4w-1
X-Mimecast-MFC-AGG-ID: Jp-T29vCNVKQCpRtmlso4w_1751547591
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ade5b98537dso534196466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547591; x=1752152391;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RPqm9+gCQ4G++ODNHAXi9UZv0hvANLxxg7IJ6626syU=;
        b=jrxs39R6UHoGDUEQ+QXXPidI5ZaJbpd2QxLdVVUqd3AoUSNeN6dMw8ElcLzm8lhkKr
         A5kvqjexwtdwERjeDOEH9BlrMeeN/k3D0ALo18jLzwNqF6MHFaJNTYamUPzEB6Sgwa6t
         Z2qisr9HOzjHkAakqIghJVhv/O8zxbYD7Bk2uo8rDi7yIt9tmZ1DNAZcaklzNswLzQvA
         hNWGysW1M/Gqhgc+HFkOshAtyPuogRadhnOmyHv7sti55PVqndnogeGEBzGWLqec2t+F
         xJZk9+0AQ3Sp5ctUmuxViM+wQTLbxUuZClQItipH58LZVgimF/5x6ZvLb/e9NgMAAqXU
         jivw==
X-Forwarded-Encrypted: i=1; AJvYcCXOvP2a3MBkUa/4UaLByF3RcIgKUgaT7gkiDSQzYftg6PNRDmGnhSnKHu+DQinJW/zd7fVoTSwE09NdCdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjbZ6nAQiN7leexp/8UX4xqUvPwDrhvGfAOhudWhYvM46oRScv
	deOk3FKEfu/T12TadsjLJDCN/RoXcHXUs4jcgCulAmYbP4oi1Lv0uQ7x40AqoRJuYfxJXY3/F7n
	FMV/cloiIWwuDY4C0D8qz6jF5TYp0sS0ZXgZQp/+EikLOrIVBscJeJMipj8lWXRXunw==
X-Gm-Gg: ASbGncttOG7+UopJtgrck54IN+scsFEkj6ZEXMBFdi3xfcV2E0NhMh4OGnhYgZCCOjO
	yD/2zPW+SsdIkeG+2ARcYE6ndAqlpNT3+OJ7laEgucFmbEH44eOHUiEph3ESVDlfhMj9na7ywJG
	niEV7rHy8airacp0XnF4UqzXMqBy+5GV/NkygX1+cTSEcFiqLsV7O8nVRDLqrjxufBhjFg7gjXj
	4VsX2NvROIj/v+22PbB1J7ldMjSDOo59BZOGiVEcS8pnFwte475PssgjiQWlh4fKrA2ht6+BO0G
	KGb34Xy2u137/jcjVuSZscbthqdU/Zpe9BFZtHSm/tc3
X-Received: by 2002:a17:907:e989:b0:ade:42a7:dad2 with SMTP id a640c23a62f3a-ae3d84f7bdfmr291462166b.33.1751547590642;
        Thu, 03 Jul 2025 05:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC0vmyCUfKNh5+RJRYCTBoX/Ahh5v1AgHscMOi05wRVFGjPHp+ArXAFWzQGHk5tNdxXoWaiw==
X-Received: by 2002:a17:907:e989:b0:ade:42a7:dad2 with SMTP id a640c23a62f3a-ae3d84f7bdfmr291458066b.33.1751547590098;
        Thu, 03 Jul 2025 05:59:50 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bbe3sm1258053466b.118.2025.07.03.05.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:59:49 -0700 (PDT)
Message-ID: <46474fc9-cf31-400d-aa65-d7fc013e6274@redhat.com>
Date: Thu, 3 Jul 2025 14:59:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
 <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
 <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
 <d54cf100-3c74-450c-a7d1-8fedbc97bdb8@lucifer.local>
 <3ce333ae-dae2-4341-83c5-39877b6f2bd4@lucifer.local>
 <1d1312e8-325f-404c-9ea4-03b38ed7b1e1@arm.com>
 <9c7a0541-219a-4ea7-a7d8-83aaee992b1a@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9c7a0541-219a-4ea7-a7d8-83aaee992b1a@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 17:22, Lorenzo Stoakes wrote:
> On Wed, Jul 02, 2025 at 08:33:39PM +0530, Dev Jain wrote:
>>
>> On 02/07/25 4:02 pm, Lorenzo Stoakes wrote:
>>> On Tue, Jul 01, 2025 at 02:40:14PM +0100, Lorenzo Stoakes wrote:
>>>> Let me fiddle with this code and see if I can suggest something sensible.
>>> OK this is _even more fiddly_ than I thought.
>>>
>>> Dev - feel free to do a respin (once David's stuff's landed in mm-new, which I
>>> think maybe it has now?), and we can maybe discuss a v6 with everything else in
>>> place if this is still problematic.
>>>
>>> Ryan mentioned an iterator solution, which actually now seems sensible here, if
>>> fiddly. Please do try to attack that in v5 to see if something's workable there.
>>>
>>> Why are computers so complicated...
>>
>> Sure! I'll be out next week so the mm list can take a breather from my patches : )
>> My brain exploded trying to understand your and Ryan's implementation conversation,
>> will read it all and try to come up with something nice.
>>
> 
> No worries, it's actually genuinely annoyingly tricky this... :) we may need a
> few more iterations to get there.
> 
> Really the underlying issue (other than inherent complexity) is the poor
> mprotect implementation in the first instance that makes the complexity here
> less easy to integrate.
> 

I haven't really scanned all the discussions yet, just something to keep 
in mind:

In the common case, all PAE values will match. This is the case to 
optimize for.

Having some PAE values not match is the corner case, that can be left 
suboptimal if it makes the code nicer.

-- 
Cheers,

David / dhildenb

