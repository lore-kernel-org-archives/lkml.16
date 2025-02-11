Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D037524F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280468; cv=none; b=N9e9uENl4LZ2GpLd/+9geFWE80mqcsT42A2nc/2vUYAHUF5VWoBXhpOTOVCojD2xqJAz8vCKf2lTaU/HV0OGkSVc0DDnAjiT5NfnmhE9f8QEoBj2QEjiBqNBmJIA9jhV+q+oIRUIW4aV1zHK3uNTCOdfHKXr5QcGWP5mCfw6qcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280468; c=relaxed/simple;
	bh=CX7lnilW9sbI3Vky73CNlewLMliV3YoE8FiZmFwXgTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcD37sO8zmX8NK35k0gWNaRBSIvCe3LdQ+H6SkMYXL6If/OpSVOgbdjzMF+OJbccREggNx9ojQyuYjp1CIrp5SkJAcr/+OuOm4opfgC5OXN7MV2A9ME86fJ0tJHRR6VNWGsHgy5/1C7vs1sSkzzFJaEGWevSMAcfWVbC4wsdyMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ETyLvKzm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ETyLvKzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739280465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+DkuDtOtzjY6Gb6ZkxsAXFxf0AKiS7x2SvB3W65iASI=;
	b=ETyLvKzmg85syqTSu0uxRU9sMpnSCS6tYCiLMgpaTxHVsVz6vGpf33caQuoLqsFbXzzTJz
	X1Pn8d1kS0lqLi82o1enPV1zZ+xtvxNWY1wjhBzCg6LiE4HYN5ciL6C6HmUxIlYyjzIhnx
	fMGHIXFYbOecdbV4ErcNWCIqYJRbhGo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-FtqJ3SjlPfOJ8GJKOGJX3A-1; Tue, 11 Feb 2025 08:27:44 -0500
X-MC-Unique: FtqJ3SjlPfOJ8GJKOGJX3A-1
X-Mimecast-MFC-AGG-ID: FtqJ3SjlPfOJ8GJKOGJX3A
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38de0923dbaso911104f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280463; x=1739885263;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+DkuDtOtzjY6Gb6ZkxsAXFxf0AKiS7x2SvB3W65iASI=;
        b=OvBKDSoXDn1s/CWfADfX/7qsGUKYKqY3KWbvep910Hf0mXY3qnaGEf9Ai/E+KWhNf9
         yPSEB8yJ/HwrAp1GxI1MgaV3H0ZP7NsLzf8e/gB37MgxYs9PfePrzffNW7AnfiSpKtIk
         cnWagY4HTu57pMuuZXhIx0WvNQFxc3FtoRn9mnHv1QuFgKN+rI/+DpX5eUl2bO1xJVeJ
         1ghJKU/5MmmsviZHVVHPGeJKFtyswGWWBUakjXHN4DZi+B4Yl2rDKWe3ViIrV4dsrDtW
         gplWmqJUBNJekxct+5UWQBG8NRQVf/oMJB9tipurno0fDMUsNb2kBENGfAK2ihEEjrxc
         NpUg==
X-Forwarded-Encrypted: i=1; AJvYcCVl7mdkF93Kv4imY9pjcBzEPh+wowjUuOJXp23zwxfeDZYJOe4mtYaIxSxC+O6a/7J3zK9jaFlKPPmLYYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0ds1HuvnOEyuH5yU+Iy5pmpt0S4lOe9cLF0ZLfgrWufMvoB4
	c7BiNGGX35wP2U2HOqGks9vTwOlrxla6QzKwSmTNkpKXmbpr+AUeFrGuO8r9IqeRP4YqpZbhlkw
	eypq2mYPHrdts4Wyb0FYrUPcNXQHR/RiP3pfhXdjLqAzOo5lL0lbqTjXI1dTuDg==
X-Gm-Gg: ASbGncuIQCV3e4FsrFVlBfxdsoi9Qxt/dHVGu7liUYF3lVAEV6xiSc4qx63Ug9YBQEa
	wnoq1frXcvCLtQbrKYTgCbf+3PUq3BcjqEe5HT7KjYTaAJ+xdh3BUTHpH3k7XCQ/o5XrIwwZl2r
	7xAySrv1TyB60OrWlcv3ZDC1Yy8L3soUbNxWr7CbcCimRa8VawmGlEbsEkc/Zr82IR36hZqN2n5
	kT1/ugO1vWmfaMJWrx9UPliidJXQ+F4bZTHsZjajQIOsKsYgqhLsANjRJm7yvjEX8LlbyOAMTEr
	ZvOUH7uXBfDktrRx0mE+iNZuk1u6Pr+ENAdFahM=
X-Received: by 2002:a05:6000:178a:b0:38d:c771:1a21 with SMTP id ffacd0b85a97d-38de41c54cbmr3306682f8f.50.1739280462797;
        Tue, 11 Feb 2025 05:27:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES8BmD5KVnJ7AOsEX1VJGJXGv3OpI33bF4yN3HJaiNguyrQtCmoYvDdbWdljJ4VKqKgxqbLg==
X-Received: by 2002:a05:6000:178a:b0:38d:c771:1a21 with SMTP id ffacd0b85a97d-38de41c54cbmr3306647f8f.50.1739280462362;
        Tue, 11 Feb 2025 05:27:42 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd8213f2sm11803708f8f.67.2025.02.11.05.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:27:41 -0800 (PST)
Message-ID: <d19e60d7-8abb-4e46-8935-bc989b1d5d68@redhat.com>
Date: Tue, 11 Feb 2025 14:27:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ACPI/MRRM: Add "node" symlink to
 /sys/devices/system/memory/rangeX
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tony Luck <tony.luck@intel.com>
Cc: Robert Moore <robert.moore@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown
 <lenb@kernel.org>, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Oscar Salvador <osalvador@suse.de>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
References: <20250210211223.6139-1-tony.luck@intel.com>
 <20250210211223.6139-4-tony.luck@intel.com>
 <2025021111-deepen-landing-4252@gregkh>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <2025021111-deepen-landing-4252@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.02.25 07:51, Greg Kroah-Hartman wrote:
> On Mon, Feb 10, 2025 at 01:12:22PM -0800, Tony Luck wrote:
>> Users will likely want to know which node owns each memory range
>> and which CPUs are local to the range.
>>
>> Add a symlink to the node directory to provide both pieces of information.
>>
>> Signed-off-by: Tony Luck <tony.luck@intel.com>
>> ---
>>   drivers/acpi/acpi_mrrm.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/acpi/acpi_mrrm.c b/drivers/acpi/acpi_mrrm.c
>> index 51ed9064e025..28b484943bbd 100644
>> --- a/drivers/acpi/acpi_mrrm.c
>> +++ b/drivers/acpi/acpi_mrrm.c
>> @@ -119,6 +119,31 @@ static struct attribute *memory_range_attrs[] = {
>>   
>>   ATTRIBUTE_GROUPS(memory_range);
>>   
>> +static __init int add_node_link(struct mrrm_mem_range_entry *entry)
>> +{
>> +	struct node *node = NULL;
>> +	int ret = 0;
>> +	int nid;
>> +
>> +	for_each_online_node(nid) {
>> +		for (int z = 0; z < MAX_NR_ZONES; z++) {
>> +			struct zone *zone = NODE_DATA(nid)->node_zones + z;
>> +
>> +			if (!populated_zone(zone))
>> +				continue;
>> +			if (zone_intersects(zone, PHYS_PFN(entry->base), PHYS_PFN(entry->length))) {
>> +				node = node_devices[zone->node];
>> +				goto found;
>> +			}
>> +		}
>> +	}
>> +found:
>> +	if (node)
>> +		ret = sysfs_create_link(&entry->dev.kobj, &node->dev.kobj, "node");
> 
> What is going to remove this symlink if the memory goes away?  Or do
> these never get removed?
> 
> symlinks in sysfs created like this always worry me.  What is going to
> use it?

On top of that, we seem to be building a separate hierarchy here.

/sys/devices/system/memory/ operates in memory block granularity.

/sys/devices/system/node/nodeX/ links to memory blocks that belong to it.

Why is the memory-block granularity insufficient, and why do we have to 
squeeze in another range API here?

-- 
Cheers,

David / dhildenb

