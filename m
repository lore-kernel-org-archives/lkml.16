Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C354652
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598473; cv=none; b=ndCrYN5ISetXjya4LBo+Z+hp393pnKMTe/siL6mqe4Y9hNLZaD4hJz/8ZCxKM0xTpnXDZvfGMxz7NdLFfJBHOQTxVlTgvsJ6i/JlSv45U4MG/XEPHdUZiSfEYmUKqgA7WgrG9orL4mzLftliK9oaybvZNrbMSoBjdu70Azs7uTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598473; c=relaxed/simple;
	bh=fPat80MPsBERl9+V9lznILNBH9q5jZ7uaIj+jy+zQjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aZC6JqOTZ6adCvFSfEPC0LpxeaeVREaLVoDsmc+gGYkwloxetxrkPkzfLBBcm/ac2diW/9QSzPzd5XCigONfDDR3ijqGA0ewYCJ60+Ix5CW4tWDE7Ok3PzQGlDsjOJDJBJHqySXcEB519+BWmoB1i/ZoH+O4mH04dG7Cn+OfwY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fb+r1go3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fb+r1go3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748598471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wfAmhiX8GmCFAxokpsMnfWBjFSdezrVGBamjGu0rQl4=;
	b=fb+r1go3ppf6hVbMfyy2C+VWozRkZzJN3ruPMVRhy2YebYUt22Zyoo35xhF9qgEx4WdiGW
	QZYD4GFsAU6p0Ryf1WumZH8ldc/MNxyB/Laltbxed3gAsK3pj4FFSeSNBXfikf7Ixk7gaf
	4WkYQoPZKkb17qZaGDavnMk0mRIm9c4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-EAlcyR23M7ud609kajZNLw-1; Fri, 30 May 2025 05:47:49 -0400
X-MC-Unique: EAlcyR23M7ud609kajZNLw-1
X-Mimecast-MFC-AGG-ID: EAlcyR23M7ud609kajZNLw_1748598468
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cec217977so11895665e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598468; x=1749203268;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wfAmhiX8GmCFAxokpsMnfWBjFSdezrVGBamjGu0rQl4=;
        b=NAml7xGNMNEDuYzgNifK9lN1+98IJ5p4tyIvW7mlHZc5HMTlyWsFdyQW7eIhVuBuCy
         Du7/xOKNlqq5t+FuXwZuOPJX5ohxWlIy4ZuPIQIHmsLZGboZLixF5rB7WuxOXg5fWJmV
         UpyNmqIM6ctyiKB9RU3qK88bxgIIGbPx+mpK8RE8YkLbk4PG/tZAEo3vpewxyDgxrqC5
         kChEyqouBY82rE0GfKPFRxGGYoftgqIdnrV7qUJtfcbW1YEQM5Gw5RHUsYQGwZutvqPJ
         hP5QFNvRbd3Ggy/xGaSjTIuGf6chGW7vO6N4Lkd06f8fzDc6A6FgBS6HGbZmSwRwJx8h
         wtsA==
X-Forwarded-Encrypted: i=1; AJvYcCV3IDCeN0FwfkULtMVZtAC4JZn/de8yB/8eV1PSUpr8ui8KlFmiDBe+lyvaMm5FMCNi20x1pGaELXGme7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1M5DXKMdOzejxaVfky0Rzmc/DAL1KTkCtJg166AMvgjqg5My
	c5mRN3YVyKa1fN5GQp4ESyoVxdQIJY/Za8LI+pk/Y5rJSBaPFJJtjoIK7R4aDTb+8SOFIZNmnCG
	tFjfhHoGsvYOEi9IU1A6veqjruFCbRD47r40ejiSH9KZy/F0oXGrpwtW06OE8AcyaDg==
X-Gm-Gg: ASbGncvWF0VB2MXjOKcRgxXDpG8wMi8SSfve+ichRknyt6FSU6ttdTO5+6AAbDT5wzo
	lIK51AZhKjYcCI9moR8F8f3tT0kbf4e6khv95DXY1t/UFSDEC9hMR4/y7WRzsIqjQsnnM3j6S/I
	gP/1HlenzJIh5IG4rb+MvVHBEm7RHgVu8HgH5CjVySEQ5NMKzr/OaqbiCzzPOd9Znw+rwgPe/3a
	QvjeLshVuh8PdVMU1iwETdUpWnGkPAt5ZyTnxVC+Kjn34aCqRaBxkHT4I+nXv+XGAPnNnI3sMva
	iezW/OQBpq/ayAph5inCNXZNZI+K4eT7nTP6yAvVSfWGNW0D/E/bna9ht3nN2kTmA+OLD9qN/ai
	ymkW07v5SyPt6ULw4sTiAukDNQPw5ni+6DFeSXgY=
X-Received: by 2002:a05:600c:6207:b0:445:49e:796b with SMTP id 5b1f17b1804b1-450d886f1f3mr14894745e9.17.1748598468245;
        Fri, 30 May 2025 02:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwHV3a7pm41ph3Tdq1BY1w51HsiBJlc3eQX7poOec+XB3vOA8eRZ2EJbez4lGCHx+/2UqnnA==
X-Received: by 2002:a05:600c:6207:b0:445:49e:796b with SMTP id 5b1f17b1804b1-450d886f1f3mr14894395e9.17.1748598467820;
        Fri, 30 May 2025 02:47:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a00f5sm4376727f8f.95.2025.05.30.02.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:47:47 -0700 (PDT)
Message-ID: <f95f2f30-1393-4ae1-96b1-96e4abfc368f@redhat.com>
Date: Fri, 30 May 2025 11:47:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
To: Jiri Bohac <jbohac@suse.cz>
Cc: Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 Donald Dutile <ddutile@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
 Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <dhildenb@redhat.com>
References: <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
 <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
 <aDl1ViMpK_6q_z06@tiehlicka>
 <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>
 <aDl7rHb34zIXEf6j@dwarf.suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aDl7rHb34zIXEf6j@dwarf.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 11:34, Jiri Bohac wrote:
> On Fri, May 30, 2025 at 11:11:40AM +0200, David Hildenbrand wrote:
>> On 30.05.25 11:07, Michal Hocko wrote:
>>> On Fri 30-05-25 10:39:39, David Hildenbrand wrote:
>>>> On 30.05.25 10:28, Michal Hocko wrote:
>>> [...]
>>>>> All that being said I would go with an additional parameter to the
>>>>> kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
>>>>> otherwise. That would make the optimized behavior opt in, we do not need
>>>>> to support all sorts of timeouts and also learn if this is not
>>>>> sufficient.
>>>>>
>>>>> Makes sense?
>>>>
>>>> Just so I understand correctly, you mean extending the "crashkernel=" option
>>>> with a boolean parameter? If set, e.g., wait 1s, otherwise magic number 10?
>>>
>>> crashkernel=1G,cma,cma_sane_dma # no wait on transition
>>
>> But is no wait ok? I mean, any O_DIRECT with any device would at least take
>> a bit, no?
>>
>> Of course, there is a short time between the crash and actually triggerying
>> kdump.
>>
>>> crashkernel=1G,cma # wait on transition with e.g. 10s timeout
>>
>> In general, would work for me.
> 
> I don't like extending the crashkernel= syntax like this.
> It would make hooking into the generic parsing code in
> parse_crashkernel() really ugly. The syntax is already
> convoluted as is and hard enough to explain in the documentation.

Would another boolean flag (on top of the other one you are adding) 
really make this significantly more ugly?

> 
> Also I don't see how adding a boolean knob is better than adding
> one that allows setting any arbitrary timeout. It has less
> flexibility and all the drawbacks of having an extra knob.

I guess Michals point is that specifying the higher-level problem and 
giving less flexibility mioght actually be less confusing for users.

> 
> I am inclined to just setting the fixed delay to 10s for now and
> adding a sysfs knob later if someone asks for it.
> 
> Would that work for you?

Sure. We could always add such a flag later if it's really a problem for 
someone.

-- 
Cheers,

David / dhildenb

