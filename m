Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76F1F03C0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213823; cv=none; b=eWXwu9ruOyr2J8aTEVvi2OcNolTJ21F6jFuMFQr7sUBqpfs0jnnDp8TRcRjfAWpLi2u5vWG3lArxDeo6b+3C/5f9f/qk6j5PhqGi/H4FK1N60SpqiZx5RMHhYEgUKMLGG7eTNKWhOUOghvMp+8n+IiMObSqr9frQGuSkgFdJ8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213823; c=relaxed/simple;
	bh=ZC4E/D1FhgXQ3/38d5sAmilpgW6OxmN/EYFk73tVtow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2BsAmHA6mUylvdMujR4AqkBgiI3HUU46Xt2yXExpavJ6Nz5etAMUOwcwp+ZIvMXkwX0OmXS+WsMfNCENtrOZROFYHGWsBrc/70jLKCAtBx0PflkvBebS9TzELw7SjLwfD6aO/9sLQOIjvRZVW/sKw3rE79ByOncihpLGkDY7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NOLdvh7I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NOLdvh7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747213821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KMvcwyusyaxlzOQeDfmS10ltdnqVSlhGrkX173O9EhE=;
	b=NOLdvh7Il6VHQ431K0G7LRVsZfSQwfprPxyei2xlV3XqQP4G5NhIJ56Y2/M4xuFVDokoLR
	S1Arq4Npi5s0K0MzZjaRkAFumBMzZaoo77XvMAcXnZULIf9YzqGBWVY4HRkC35BU3I5Pxu
	vu1C8bMvEpPuavtan8lZt1h6Yv95XbM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-8Q6cGpIHMU2p3TutzFzO2g-1; Wed, 14 May 2025 05:10:19 -0400
X-MC-Unique: 8Q6cGpIHMU2p3TutzFzO2g-1
X-Mimecast-MFC-AGG-ID: 8Q6cGpIHMU2p3TutzFzO2g_1747213818
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf446681cso34985045e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213818; x=1747818618;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KMvcwyusyaxlzOQeDfmS10ltdnqVSlhGrkX173O9EhE=;
        b=XEpgg94BvQoNbMol5wZcvLDLDADlzv/x7RO35bELEk+wuHMpvA5/vzTwRqg7JffygP
         +M9KD1cbLu1T+fonMMCYLvT0qbmW2yYBmcC9QiYh99akUU3Eqny6IXNVNIrKucKvPbfD
         ZIv1KknCP/TR7v9iCZpSe5aZz9rSABM4c70yO7Zj+WpKEqlefCfej+9r5I7pPJ2zWmEO
         9KWsUtwGpST6QhHGgXDd8vfJcizpZAqVHQ7HAPhFBQkEXuPeHPGBDPmWYjFNjV6B7BSb
         euk9ajys2XfTGZ+X/2G8hLWCCSnltnE+yz5i2n9MrgGpFMxvCn4GZlrVPLbINVSTl+ST
         FisA==
X-Forwarded-Encrypted: i=1; AJvYcCXw82HfYAdfe3kmieCc6pcwHmxQxWQNjcNnaMus9J2pyX1bl72hddqyoJkx1nlvpw8DJXy93SaThuD3THM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd9tepodfI5fnOmuWQzzJ8FOcip4ajLoBGMS6xAsJponEvrHff
	WufLzH6FBFrGgwKoNhpNovYYDj4JhlPtzS0uug1cB7i6GtQY9XghWGOpcI31haVwAAAWPChpPyS
	o5JXxv4hV10YqFlFJsrV2nn4fAxbGfrxu9BMNFydp6t1HehRoWtE2b+9g/h+w9A==
X-Gm-Gg: ASbGncsX5p0YMCXoDjzVB2PsTlpmuUw+nUGu3QF5JlNXcUq07WPnB9WCfPrd/PmjOuA
	OEGXasb17kNxiyKj1j/5W1M9LrbRRc1DdOs7RCU9HH+IVdJTzUy99FW4+w1DG5garDo+OPMXMZo
	sUq3M7kDtgOaPS3P0GDniHkSrzE9miXTlhccN+Ybtjm+XcvYy9U3xwnW0HHhzpEcxLms8ErcCaa
	mougDpmVZNH413m3nUiMWY04MO0DGvEFlX0OKSWrBfJ4AH10gOwrY+ebIqEufbmQOyAIRlaFo99
	Z18JYvJcqGJt5aisgcB+e2UG0vS/kbX4n7lIsyf+HTUlpXUfo+1rh7+BG0o1Hh4zYO2obgfdXbs
	voTJ0360WTV3IIoewtSxIcw4iOTJDXP7uAV2JgEk=
X-Received: by 2002:a05:600c:8012:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-442f216074bmr19560005e9.23.1747213818111;
        Wed, 14 May 2025 02:10:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvuvD/g6GDVOXUbnTeRuYzmrbEa5QBwrsP/XbZlpNljnOYIjrqgbNyr+llME01Z9XRS0AoXw==
X-Received: by 2002:a05:600c:8012:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-442f216074bmr19559645e9.23.1747213817725;
        Wed, 14 May 2025 02:10:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f15:6200:d485:1bcd:d708:f5df? (p200300d82f156200d4851bcdd708f5df.dip0.t-ipconnect.de. [2003:d8:2f15:6200:d485:1bcd:d708:f5df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3967f62sm20877615e9.25.2025.05.14.02.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 02:10:17 -0700 (PDT)
Message-ID: <f3d52fe7-991f-4fd1-a326-6e8bfe54ddec@redhat.com>
Date: Wed, 14 May 2025 11:10:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: remove WARN_ON_ONCE() in file_has_valid_mmap_hooks()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
References: <20250514084024.29148-1-lorenzo.stoakes@oracle.com>
 <357de3b3-6f70-49c4-87d4-f6e38e7bec11@redhat.com>
 <f7dddb21-25cb-4de4-8c6e-d588dbc8a7c5@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f7dddb21-25cb-4de4-8c6e-d588dbc8a7c5@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.05.25 10:56, Lorenzo Stoakes wrote:
> On Wed, May 14, 2025 at 10:49:57AM +0200, David Hildenbrand wrote:
>> On 14.05.25 10:40, Lorenzo Stoakes wrote:
>>> Having encountered a trinity report in linux-next (Linked in the 'Closes'
>>> tag) it appears that there are legitimate situations where a file-backed
>>> mapping can be acquired but no file->f_op->mmap or file->f_op->mmap_prepare
>>> is set, at which point do_mmap() should simply error out with -ENODEV.
>>>
>>> Since previously we did not warn in this scenario and it appears we rely
>>> upon this, restore this situation, while retaining a WARN_ON_ONCE() for the
>>> case where both are set, which is absolutely incorrect and must be
>>> addressed and thus always requires a warning.
>>>
>>> If further work is required to chase down precisely what is causing this,
>>> then we can later restore this, but it makes no sense to hold up this
>>> series to do so, as this is existing and apparently expected behaviour.
>>>
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>> Closes: https://lore.kernel.org/oe-lkp/202505141434.96ce5e5d-lkp@intel.com
>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> ---
>>>
>>> Andrew -
>>>
>>> Since this series is in mm-stable we should take this fix there asap (and
>>> certainly get it to -next to fix any further error reports). I didn't know
>>> whether it was best for it to be a fix-patch or not, so have sent
>>> separately so you can best determine what to do with it :)
>>
>> A couple more days in mm-unstable probably wouldn't have hurt here,
>> especially given that I recall reviewing + seeing review yesterday?
>>
> 
> We're coming close to end of cycle, and the review commentary is essentially
> style stuff or follow up stuff, and also the series has a ton of tags now, so I
> - respectfully (you know I love you man :>) - disagree with this assessment :)
> 
> This situation that arose here is just extremely weird, there's really no reason
> anybody should rely on this scenario (yes we should probably try and chase this
> down actually, perhaps though a driver somehow sets f_op->mmap to NULL somewhere
> in some situation?)
> 
> So I think this (easily fixed) situation doesn't argue _too_ much against that
> :)

Again, I am talking about a couple more days, not weeks or months ;)

At least looking at the report it sounds like something the test bots 
would usually find given a bit more time on -next. I might be wrong.

next-20250500 had the old version without WARN

next-20250512 had the new version  with WARN

So the new version has been in -next (looks at calendar) .... for a 
short time.

> 
> But I take your point obviously!
> 
>> Fixes: c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file callback")
> 
> Is it worth having a fixes tag for something not upstream? This is why I
> excluded that. I feel like it's maybe more misleading when the commit hashes are
> ephemeral in a certain branch?

mm-stable is supposed to have stable commit ids (unless Andrew rebases), 
so we usually use Fixes tags.

-- 
Cheers,

David / dhildenb

