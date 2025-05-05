Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499721B4233
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746432777; cv=none; b=A+CS0dkxKeSVVJXmCHwNIoSDln1XT4YzTRuZ/FqrAsHFb54kq6Nxv8rtSgFbDdNTph968WcvsgtCYT6i1U/AqtgHSukuVAcWlcDgKwwgbSbLwoBEHlkaoFNGQvLpmEWc6gY+Ic4sMtZhoc5PN7OaLD+m25PZ8CjYstUJCbrVCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746432777; c=relaxed/simple;
	bh=3CDkhUT9mHsRffZ/q+wRStX8Ryx1n7GyqHVoHpKSfZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f82cFxOgMj60iTXnFRO4WoarUcpngaXncQmGsfspq3yfUDgpf5nL8p35mmIhjnoLXbEynsRkigaNgeaIzYcPcsJsw+KXk1DYeZ8ALT/WV6xkytVxGNfT/S7zHWurqa6V5WOAsyOAc68MYr7KXcHNThU+7wP2f69FtadCJHpWgBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PB+hxEWO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PB+hxEWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746432774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mILibTU1UkPOxOW3myLm0EdMporfnLf99L4kIIsQHLg=;
	b=PB+hxEWO7udGy4C3MeJr8c71rOyAxMVuoVzsCKvoIYgW9A978t5Ba5NVoM0pOpSW5Lp7dp
	Tjy2jXeed4pWt9Gni/qSbIB7D671xhi+/duLheqfVFe/lSRXYLLh2elruZ1nx4sZTloB4t
	jj2dUbfFo0bVxjw6I5+bo9PAwNLBkyU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-aaps9TiPMbWrnuFBsn3D9Q-1; Mon, 05 May 2025 04:12:53 -0400
X-MC-Unique: aaps9TiPMbWrnuFBsn3D9Q-1
X-Mimecast-MFC-AGG-ID: aaps9TiPMbWrnuFBsn3D9Q_1746432772
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a07a7b4298so2006846f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746432772; x=1747037572;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mILibTU1UkPOxOW3myLm0EdMporfnLf99L4kIIsQHLg=;
        b=IKGL/BYmVUI0slpXtssWjMTSJwStGQwPzUoBvv2GnMu69hsxmIJ+q2eoIhkTE+p9YQ
         fd+ds+n6yrFAYrWjy4spmNGQiDDXOhb9MuCTl+mq0DdINGNtc6xEowZG1LoSP1Tc+knd
         pjkd7jPfSlLHevL+9ghi8o6fxhtW+FifqIEsY3Yo58T8NypkX8pPJY1PxRE/3QGA1f6C
         99lmnUPWGs+5HF/wnmmxUR6SYCOMwO17RYkRIGWn5FFrmCbOz/UhSwiE6V6tAutFyehq
         FOE/IujpVzx4sBfnQ+AYnVg9UojnpYO2HjoivhkCkx094ucek9EMB7+K/3S4pJ/vRuau
         No4w==
X-Forwarded-Encrypted: i=1; AJvYcCV+5qW9lVhH8dgZ4uWYsCcDRu9EmA052zWeGLy2+9A6lNOhZDa8Xt3Mzno+3yjyIzurYctmrvmLUoxRN2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywre4Ub2GxuUyzexcwH++X09H4mN1ygtONhnx5Y6c2pLFid36O4
	o8yuMpG5woo94s6vR5hxzPcFUybKJKaDLl+s6XIw0P5jKyHY0hea/jJSU85JP9jKvaSngotLGsh
	9tD/ElV4/R+uRdwuXvyBJA5GAcwXZOq7Ecz9+V5lB5AXUeVrxCdXt5KVUZoGe8A==
X-Gm-Gg: ASbGncvRJbIe8eDlxMqaZjXznbXEezCia0/VVefy3pG8IuTc3+h/P7EKirzsoRD6zu8
	bnH1tVHL1LDnQPDd31u5ZNtnp2bPGiMfGwyOvFa38PnZmZgoEguGRvQvLLB5Ckbks++NB++021e
	KYUSsd/t+0ysD/G4STT/DUzdEDckDBNURtBPxOg7GONjCZ97VnQ/3CN7by3QzdBVSmxklK6pUrZ
	MV+xqoC3g9OuPt6ObozBIl+bcsi1RaQHEpPEOHpTf3GWo1WqvR7uRMClsYhg5tG7gSsOUyegBf+
	7P64xMJtIdHzvrwjTcuWXUN3JTTnt/ZM3wpGePPtj2XGaXAC42LX2fJzER+r/AE6LqJfrZaVccQ
	lpQ8LbtQcSJFF2EFGGze1R65mxdkD/jt1PYMLJKQ=
X-Received: by 2002:a05:6000:4285:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-3a09cf33e8cmr6069846f8f.44.1746432771983;
        Mon, 05 May 2025 01:12:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdkyGWWcKckpuYwsLkF1MLrYcbBxEEHpPqRXXp7PhmIlbU+1Fq0VPJM32ELVD83qnLHQWyuQ==
X-Received: by 2002:a05:6000:4285:b0:39d:724f:a8ec with SMTP id ffacd0b85a97d-3a09cf33e8cmr6069824f8f.44.1746432771645;
        Mon, 05 May 2025 01:12:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:2400:3be1:a856:724c:fd29? (p200300cbc73d24003be1a856724cfd29.dip0.t-ipconnect.de. [2003:cb:c73d:2400:3be1:a856:724c:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31695sm126153245e9.40.2025.05.05.01.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 01:12:51 -0700 (PDT)
Message-ID: <0e568e33-34fa-40f6-a20d-ebf653de123d@redhat.com>
Date: Mon, 5 May 2025 10:12:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Oscar Salvador <osalvador@suse.de>
Cc: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhva9D6H5BtkSID@localhost.localdomain>
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
In-Reply-To: <aBhva9D6H5BtkSID@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.05.25 09:57, Oscar Salvador wrote:
> On Mon, May 05, 2025 at 09:38:43AM +0200, David Hildenbrand wrote:
>> On 05.05.25 09:28, Oscar Salvador wrote:
>>> On Mon, May 05, 2025 at 09:16:48AM +0200, David Hildenbrand wrote:
>>>> memory hotplug code never calls register_one_node(), unless I am missing
>>>> something.
>>>>
>>>> During add_memory_resource(), we call __try_online_node(nid, false), meaning
>>>> we skip register_one_node().
>>>>
>>>> The only caller of __try_online_node(nid, true) is try_online_node(), called
>>>> from CPU hotplug code, and I *guess* that is not required.
>>>
>>> Well, I guess this is because we need to link the cpus to the node.
>>> register_one_node() has two jobs: 1) register cpus belonging to the node
>>> and 2) register memory-blocks belonging to the node (if any).
>>
>> Ah, via __register_one_node() ...
>>
>> I would assume that an offline node
>>
>> (1) has no memory
>> (2) has no CPUs
> 
> That is right.
> 
>> When we *hotplug* either memory or CPUs, and we first online the node, there
>> is nothing to register. Because if there would be something, the node would
>> already be online.
> 
> I think I do not understand this, but let us imagine the following
> scenario:
> 
> - You craft a VM with qemu that has a numa node which is memoryless and cpuless.
>    This node will be allocated in free_area_init()->alloc_offline_node_data() but
>    it will not be marked online because it does not have any resources.
> 
>    Then if you create a cpu device and hotplug in there, this will
>    trigger try_online_node() from the cpu callback and go all the way to
>    __register_one_node() to link the hotplugged cpu to the corresponding node.

Assume you hotplug the second CPU. The node is already 
registered/online, so who does the register_cpu_under_node() call?

It's register_cpu() I guess? But no idea in which order that is called 
with node onlining.

The code has to be cleaned up such that onlining a node does not 
traverse any cpus / memory.

Whoever adds a CPU / memory *after onlining the node* must register the 
device manually under the *now online* node.

Maybe we have to adjust CPU hotplug code if the existing
register_cpu_under_node() is misplaced.

register_cpu_under_node() has this weird !node_online check in there ...

... it's a mess

> 
>    Now, I do not see an issue with that.
>    The only think that makes me go "meh", is that register_one_node()
>    calls register_memory_blocks_under_node() blindly when there might not
>    be any memory block to register (I am sure we bail out if we see that
>    somewhere, but still feels kinda of "wrong"?

Yes


-- 
Cheers,

David / dhildenb

