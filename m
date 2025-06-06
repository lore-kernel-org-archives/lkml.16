Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9A2853E6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199843; cv=none; b=iBVGheqjwhUc1SRIaTgIoAEQd5qkYIMw6Zdl/TihUO5eZC2wg2bd1PPrw5S5vuidpfKwYnUQsp3doJnSuj7+88Bq2/E3EW9cTeY2PqA39yDVTMEjB9c3/62wc/qPcEYySpcaBb6zyU6p2sHIn9ZtBsx/xC/eRDf5jYBXQQxDyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199843; c=relaxed/simple;
	bh=8qrHrxorXCrKtyKvI+TTWOaNq/G8Bi6xaz8Kw1UTars=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqkJ3bNN79DO003IQQbIvR/7CF0w52KmGxnwG4Ljrr2705coJ1Wr+IVPMWtQNVHeWPDOAwzucVP42WWiuyvunAqunTosxpEtlrIBgudLwkmB83fpSWU6nsbrZguiy9i75uz+xywwbDwZpX398RqHADrCw1nyj6b23+0DD71qt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qk1jQzYY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qk1jQzYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749199838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+jVGCLNE+Y84dY/dAizM1Jz9ChfchugSBK8bEjTnJ48=;
	b=Qk1jQzYYSFK+dj+UMISwhEyNwiuQ0UDjm0th1Hf5Puv84S5DccALLXc26q5D7pDJcY1yID
	TU5hdOItzI+/TSkBhz/8dDiqJ7Jh+IAqCLI2hhidp62kXxIExfrJCneVWj+jN8n7fSLEUM
	bpVDRnpUAJjJoO2V5HpDOpjEp3P27u8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-a326KcI_PBibdnMu1tX1kA-1; Fri, 06 Jun 2025 04:50:37 -0400
X-MC-Unique: a326KcI_PBibdnMu1tX1kA-1
X-Mimecast-MFC-AGG-ID: a326KcI_PBibdnMu1tX1kA_1749199836
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d50eacafso10749255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749199836; x=1749804636;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+jVGCLNE+Y84dY/dAizM1Jz9ChfchugSBK8bEjTnJ48=;
        b=ohLx1p07a8OqCVDJR6muH+5BGo0peIJPsUeDUis7PR5J1407WC+Vj1kdwJJ41qnZTy
         gNA5k6hplutoWWaDHb25hE6wpJFE0/PlQn7CwKGQijdXJjKBo+aNcWGS/TnBx0YGDIGb
         1EctwdMty/OHDZUJnWyz6qLJHhBPAu6Tysnc9S/zKvm5Fg4iqgk9jLFxVKu/xpQNlyrB
         wySXqL42+4kpigP8LeubA5VNGWXw++rLqV7CD91DHdYJVW9nGsCmYn3J2WRoXu1Kma8b
         Ys4HrMQ/cJOGSI3CCySdB+rABlxcdUVZ/YvxB6J2s8BDpCP3ET5XHP/1lAXtsFF9eEAA
         ejDA==
X-Forwarded-Encrypted: i=1; AJvYcCVtq5oxJeAgMLQ7K9Y/lhuW5U5spRe92GPygguzfb3o10IYJnknsMcpWDDlCnSNSKn87ncRXTFaZ7gba+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9zqwbxAIOdsQM3DU7AFsuuuUJziJTEZ9TrIQPtZ5456K5NdG
	5WOaCK+aX+RtYFQXrs32vjpBLTB7V4U3HPJbVKVI3q+SP+s2ZXPlwQf77azBCmHICiBF5WszSBD
	z/ukggimhfFTU213gcBBdvN1iwOoT5huluwhYPrlMZg6oRubGcY4PHKYam7SvQVYaRsBlwJcO9g
	==
X-Gm-Gg: ASbGnct+sOLHN0ULd+DMEP8uaoahev+pSlkU6rPv+wlWSwJSKK/ZFopZdhxD1TqaWOU
	M4E3Eq4TQtKHVduK3c0Q8iVQYVI2JF+gFdpHavqbDMC1d2x95hoMh+ae+T/8OjJFU6Ju5+fx4Ze
	PJDnedjU7/HND3sRYxtIIhsNgaK69dLAWNSGpHufYBFMwTDN5N7C6RgKl7Qu31pI0iEhsAkX1AN
	X5pSPqIzBDpKFP5/ZjUimZ0px+J8qBTf3j7xJrhpLQfFeoPyxX7bP/QH43NgEZ8n+f2mEgGu73w
	mlH16LkukSs+l6OYYBg/1SPObopwwIdAqJlFKpFx8xc2aJU9rBaCkPboyHKxONfRZCCwmPRprYN
	1NE323QijZsHUjHKwe1EyteUJm47nqnw=
X-Received: by 2002:a05:6000:188f:b0:3a4:fe9d:1b10 with SMTP id ffacd0b85a97d-3a531caff2dmr1937779f8f.45.1749199836359;
        Fri, 06 Jun 2025 01:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFL0MNruz0U+4MdgmRWYwnLfF4ubZWX/hEe7N/lMd0fy1ZWGQtYG5R4YydA9ydpEvubuZqTg==
X-Received: by 2002:a05:6000:188f:b0:3a4:fe9d:1b10 with SMTP id ffacd0b85a97d-3a531caff2dmr1937762f8f.45.1749199835886;
        Fri, 06 Jun 2025 01:50:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137281b0sm16686905e9.29.2025.06.06.01.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 01:50:35 -0700 (PDT)
Message-ID: <a6559d96-5018-43ea-8d51-4467f5f0d759@redhat.com>
Date: Fri, 6 Jun 2025 10:50:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large
 folio
To: lizhe.67@bytedance.com, akpm@linux-foundation.org
Cc: dev.jain@arm.com, jgg@ziepe.ca, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev,
 peterx@redhat.com
References: <6f0ee0d4-60a9-4453-a08e-2353b234dac1@redhat.com>
 <20250606082713.87113-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250606082713.87113-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 10:27, lizhe.67@bytedance.com wrote:
> On Fri, 6 Jun 2025 09:58:45 +0200, david@redhat.com wrote:
> 
>> On 06.06.25 09:37, lizhe.67@bytedance.com wrote:
>>> On Fri, 6 Jun 2025 10:37:42 +0800, david@redhat.com wrote:
>>>
>>>>>      * Returns the number of collected folios. Return value is always >= 0.
>>>>>      */
>>>>> @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
>>>>>     		struct list_head *movable_folio_list,
>>>>>     		struct pages_or_folios *pofs)
>>>>>     {
>>>>> -	struct folio *prev_folio = NULL;
>>>>>     	bool drain_allow = true;
>>>>> -	unsigned long i;
>>>>> -
>>>>> -	for (i = 0; i < pofs->nr_entries; i++) {
>>>>> -		struct folio *folio = pofs_get_folio(pofs, i);
>>>>> +	struct folio *folio;
>>>>> +	long i = 0;
>>>>>     
>>>>> -		if (folio == prev_folio)
>>>>> -			continue;
>>>>> -		prev_folio = folio;
>>>>> +	for (folio = pofs_get_folio(pofs, i); folio;
>>>>> +		 folio = pofs_next_folio(folio, pofs, &i)) {
>>>>
>>>> Nit: indentation is still off?
>>>
>>> In my editor (vim with ts=4), after applying this patch, the folio on
>>> this line would be positioned directly below the folio on the previous
>>> line.
>>
>> Documentation/process/coding-style.rst
>>
>> "Tabs are 8 characters"
>>
>> :)
>>
>> Good choice on using vim. This is what I have in my .vimrc regarding tabs
>>
>> set tabstop=8
>> set shiftwidth=8
>> set noexpandtab
>>
>> set smartindent
>> set cindent
> 
> I truly appreciate your correction and guidance. I sincerely apologize
> for the formatting issue that I've caused.
> 
> I noticed that Andrew has already integrated this patch into the mm-new
> branch.

mm-new is for new stuff, unless it's in mm-unstable -> mm-stable, it's 
still considered rather "experimental".

> I'm just wondering if there's still a need for me to send out a
> v5 patch. I'm happy to do whatever is necessary to ensure everything is
> in order.

Feel free to just send a simple fixup as reply to this patch.

-- 
Cheers,

David / dhildenb

