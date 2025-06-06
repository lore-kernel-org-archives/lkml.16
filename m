Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BEF1E9B08
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749233718; cv=none; b=VK8mwC8Dq8UmgCMKkx/xyRuoT3JGNjc5C79A/se5hy0LY3ig7LoX6bfTiX+OJpCa/LztS5obU8xOhe2bI7foPrxcSiHiKHrD8Igo5d84tQTybgUazjf4bsTaHOat/9VFl4SEYtf2EnCyJu5auK2b9+e9xqP+SGtWMZN+FbGoxSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749233718; c=relaxed/simple;
	bh=0CavxzNZRBByrOe4hoGQ7s9LvZmT/QcztA82q+yxIK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK5lI0J8uKG24JtamWPmyLk+i4XdFrsU8WbvhTO+TYPyIkhxORS6WZLb3W/h6n70MVqhYZj6ftXMo2j09jLuhUonlhmwRYQGcYnnJA3SOf9/115/69S7y84pBPjht/DQRsbgEpEsG0jgzGocd9/oB6rXBMsBDQg2fawC1a87AT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A7ilFfLO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A7ilFfLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749233715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OE4idWy2VKv7Bw/zl0Geam+S+3iLl8H5F2QeCaZuLc8=;
	b=A7ilFfLOwkC1ggqsXKn7RWiyd4+ivtIAW6EjiZxqNz+oqJlLwCnrDPVjRGK001aiwOOvC9
	TmfyKmf+UgnKGpN0GLk6iqi+AG46GzG+kC6+r9Ta5E3sRogbj09g2UFNCFCNi5GLpNHPg5
	tXru06atdoghV5KFgToxKawejAr/Zvk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-G2HrolLdMUGTyURZqFm8OA-1; Fri, 06 Jun 2025 14:15:14 -0400
X-MC-Unique: G2HrolLdMUGTyURZqFm8OA-1
X-Mimecast-MFC-AGG-ID: G2HrolLdMUGTyURZqFm8OA_1749233713
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso15367545e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749233713; x=1749838513;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OE4idWy2VKv7Bw/zl0Geam+S+3iLl8H5F2QeCaZuLc8=;
        b=G/APq9FyR82hFPqx8j/siIVQGvPH5fFIlyTHecwE0EAFuuOASTAQ4frLJplIVRcolp
         Bmlcd2/02XBDn1Pu2NURDECjl0TYuLbWL/0FL6JAhH5yBJ4/Z/IesrD41Emynh43bUIC
         6zWNx11uUi83LmUds8YkaGiVpRoLcB3tHXKMP6qXzwQ+YE5hvlSyiODj3F9VeNaYKQte
         ptsdMcGz7+YiQJB09EaLfsE5q9YCFdKler/LQLHESBcMxFxMGQSP5Xn+jGLeq22vwD9u
         l1m4gqkOHu1S+EsO6QRD0FnhQ8W/NVRAhMZlkZ1EIb+t7S7Trkp40OFVZenfQdEYvnLM
         3Jzw==
X-Forwarded-Encrypted: i=1; AJvYcCVT+296g6cjsxlJz0cWzSft5slPnUjhVXk4SUagXycS+DoxJVEnER38ImceBkGgbCILwqtf1N9gBhn+AX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDIflmudcRKT+scVF3GHm3U2ClYWyMV9FbkPYoWVqpBl3sgYxM
	zcu8AzgVaEHlToRy71lXvveBCJ6dv/qmdCOw42VaG1+duyw+xoBJ3/P4Kp1m4JVsE/+/oPjcV3T
	N1rWlDGlpfOlZRByX28XI8a1mpIpnRPBcz9hf5wWh0mvbLEYBSNAnvMpyC3Ropd1bJg==
X-Gm-Gg: ASbGncuT8ifAEnsG+qHMyool/5NRxDBlVY9z4gSfKUu7SS2YqZlFpW1Ebe9pakvvGeF
	BRU+mCe4BHsgX5oMswudORbRIF8W2CR8TKq7mCemjp/G23CasfxWvTMKIjYJSr3GpfkmJbU+H3O
	NlTQJkB3CPzHUQXbu4wdN2EwJ1f4uzR2CzwAXta1kBXlB0qBvmwd13kMH+ZdyumBJxIA9FAaOB/
	Qbg0GhWJ6xVv9ANFMbyhJYNpnqtQedEg3PLUrhQiCIc1AHCxJLPfNFrkAcyJMPohqJM+ixHH2Ec
	VkWZ7o6nszjVu7XqY4Aed5G2wQicvGuDviydQEkaJsEVL9nfzSnI6NMYDg+hsQlmP5bcnV8J1Sq
	wRMxUh0qerYgTjs4RuIG6675Xy+/ifdxfrKqftTAVbA==
X-Received: by 2002:a05:6000:40dc:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3a531cac62bmr3925807f8f.21.1749233713282;
        Fri, 06 Jun 2025 11:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGssiO8Ow3R0FvPtRrsLuzY/j0dGJqcSp48DFoi18EmLbcjqoXudx25H+OfHMHvVIy7kLHAA==
X-Received: by 2002:a05:6000:40dc:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3a531cac62bmr3925791f8f.21.1749233712885;
        Fri, 06 Jun 2025 11:15:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e055ff5sm30814785e9.8.2025.06.06.11.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 11:15:12 -0700 (PDT)
Message-ID: <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
Date: Fri, 6 Jun 2025 20:15:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 John Hubbard <jhubbard@nvidia.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 20:06, Lorenzo Stoakes wrote:
> On Fri, Jun 06, 2025 at 10:57:44AM -0700, John Hubbard wrote:
>> On 6/6/25 4:04 AM, Lorenzo Stoakes wrote:
>>> On Fri, Jun 06, 2025 at 12:28:28PM +0200, David Hildenbrand wrote:
>>>> On 06.06.25 12:19, Lorenzo Stoakes wrote:
>>>>> On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
>>>>>> On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
>>>>>>> On 06.06.25 10:31, Michal Hocko wrote:
>>>>>> [...]
>>> So to me the only assessment needed is 'do we want to warn on this or not?'.
>>>
>>> And as you say, really WARN_ON_ONCE() seems appropriate, because nearly always
>>> we will get flooded with useless information.
>>>
>>
>> As yet another victim of such WARN_ON() floods at times, I've followed
>> this thread with great interest. And after reflecting on it a bit, I believe
>> that, surprisingly enough, WARN_ON() is a better replacement for VM_BUG_ON()
>> than WARN_ON_ONCE(), because:
> 
> Right, these shouldn't be happening _at all_.
 > > I'm easy on this point, I'd say in that case VM_WARN_ON() is the most
> _conservative_ approach, since these are things that must not happen, and
> so it's not unreasonable to fail to repress repetitions of the 'impossible'
> :)
> 
> But I get the general point about ...WARN_ON_ONCE() avoiding floods.
> 
> David, what do you think?

Well, in this patch here I deliberately want _ONCE for the unpin sanity 
checks. Because if they start happening (IOW, now after 5 years observed 
for the first time?) I *absolutely don't* want to get flooded and 
*really* figure out what is going on by seeing what else failed.

And crashing on VM_BUG_ON() and not observing anything else was also not 
particularly helpful :)

Because ... they shouldn't be happening ...

(well, it goes back to my initial point about requiring individual 
decisions etc ...)

Not sure what's best now in the general case, in the end I don't care 
that much.

Roll a dice? ;)

-- 
Cheers,

David / dhildenb

