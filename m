Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F171F4606
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963343; cv=none; b=GL4o8kSfAeuz9kYkhxq3r5TjI1fsnyjJALuIqRxSoYQQQtnrarDOTB+mzaRx+u1/dFKHQz+3OnuLaCkyCAer1azbZq1hWCQOdtG2e3ixQgsbqZRSeiYl2IzM+VDLlVN45UsrjAq7+zL1NmMsJJDBaBp+m+p1wiV5GlbDrEpF1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963343; c=relaxed/simple;
	bh=doJ/84ufXnCErpttu+yczx4NqWixX94IhXs08xdFFxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnCZfS4glZZ5/mPIDpxt4uc2krWQQHRSKJwZEgWGVhmaZDKsXB4jNU+TVzjCtLLponz1UsCxFXVXiOd6llPIHEo2M0fYUVfL3Sj5UhsXAmIUSaU2lSVSunvFUewayFi9BeW3A/iq8NfcImF1StvukNqaCjzPnSUOn8FBgC7WebI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ivOSoTFd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ivOSoTFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748963339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ro/GpxtlQC02LLrRGJVJw68CvIsIt0uXmLCN6ISlO4M=;
	b=ivOSoTFdyWNHhZT8Se+kUAuADzZAV0o8rkW6DPDw9SXtZaJieQFRjN1Y6OnMfVkjzbV2QM
	J0YecGwscCjvc63amJiGCuyVbWiKj68+GgMsQulUS4z/AtWDagqC2q4FfgA9zXgH3+baqo
	iHLyePcc+MS3Rug4C3ezNMOYXmYi3FE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-vk_AnXeDNPOIygQ79XMMgg-1; Tue, 03 Jun 2025 11:08:58 -0400
X-MC-Unique: vk_AnXeDNPOIygQ79XMMgg-1
X-Mimecast-MFC-AGG-ID: vk_AnXeDNPOIygQ79XMMgg_1748963337
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so3431808f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748963337; x=1749568137;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ro/GpxtlQC02LLrRGJVJw68CvIsIt0uXmLCN6ISlO4M=;
        b=uvuBuuaYgT7PhkW4tqw73P6W+wtePJZ4P0jirPTZbTOutzKT8lfHIEWLcv5J9HppR+
         pF9Par+Cwd6/VpKobQDhizwXEN2WaAkC3Sdo3YphFy/IjsvbtrBRznzdEycTwBqRhnfW
         SNmaDfkQtqNncGFB5rY2XDxAGlwPKqaN0kW1az/nGgefBoIdSWR8RRBLLbKGE4V3GU+3
         KILfh9WjTWoaGV/9y7jhXC6Nsup44uT5kUKDTxVj3AR5gvv1+lx2zUlcA6JQVnQ7NfWR
         /ZnBMx3fQajfzkhUnExvtU85dPiM0Vl2W4OAMFacHQcT3vvu7aZKNW5ZwiUdJryhkYKT
         caXA==
X-Forwarded-Encrypted: i=1; AJvYcCXF1mcTAY/4fdY7AQmuurYe59+WodWIo2G5bm9B3bcoTPxCkCjdVXafXeqKXd3WrkYaB6EgG1pbbMHyTgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4utda36C3PeEvyNI3O5fGouVa5VkmVt7NvI1+pEtBMyMmmuMq
	ZuQYWn3yL6G59xBgASXW0oI0SoX6jjozs9WzDNoP5NvpLyxFuvQcWtSOcKGpd/HrXGdrRIJj7u8
	E1xelkLVkVRYiCYLzFB2ycqVCdjrH+pqMPV991w8cHq2zcZ8BDLQ5WqslQkMJM51e8g==
X-Gm-Gg: ASbGncuQyTTHYSNtFj9DDDr2tfs6RTx+fWVjpGlDzYXvtSXdJoTYCDUfEa9nI24excY
	xUTfst+7s2x+uP8+hUGnu/JM35ml5K57NxK1lDDl5mFbIZhUNhmKGC1JZZLSoKys/sHtYYvc0OO
	0dRxXNbcVhBSga5CbQlpDl9yQRcxN8jZSGxowsO4yivvFCd/e65+YJmD0NJjhBE2fZXuaqDGhw9
	xzjut/0DB21sXxaoiFetd03Bnu/N8wGQx1lSWp+6OgBO1+N0IcB65LLpINmt1ecu5P+GCLLOpRO
	YNsMnFFxIUS+mE6WPpncGhBbsQBllteTkS3Qkidsa7/0UG7c2J+mUDkyu4jkaB5L7TkVn+yZWLx
	mfhvOokcXZvdYTu783qdmumpOrn1p227QXOxPMR4=
X-Received: by 2002:a05:6000:1788:b0:3a4:eec8:c9b3 with SMTP id ffacd0b85a97d-3a4fe178d04mr10445212f8f.23.1748963337018;
        Tue, 03 Jun 2025 08:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELDBqz3udfciZDly0ZRZmcuyuiHl9S4QKsQsIkxu0yCfgzfgyPZaRX5jbk4UePelyOHBMLIQ==
X-Received: by 2002:a05:6000:1788:b0:3a4:eec8:c9b3 with SMTP id ffacd0b85a97d-3a4fe178d04mr10445172f8f.23.1748963336498;
        Tue, 03 Jun 2025 08:08:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm18884082f8f.69.2025.06.03.08.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 08:08:56 -0700 (PDT)
Message-ID: <fd10b2b3-064c-4ee2-ad7d-e30a0e194533@redhat.com>
Date: Tue, 3 Jun 2025 17:08:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
To: Peter Xu <peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, James Houghton <jthoughton@google.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de> <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain> <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain> <aD8NUSUV5zA4yNY3@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aD8NUSUV5zA4yNY3@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 16:57, Peter Xu wrote:
> On Tue, Jun 03, 2025 at 03:50:54PM +0200, Oscar Salvador wrote:
>> On Mon, Jun 02, 2025 at 05:30:19PM -0400, Peter Xu wrote:
>>> Right, and thanks for the git digging as usual.  I would agree hugetlb is
>>> more challenge than many other modules on git archaeology. :)
>>>
>>> Even if I mentioned the invalidate_lock, I don't think I thought deeper
>>> than that. I just wished whenever possible we still move hugetlb code
>>> closer to generic code, so if that's the goal we may still want to one day
>>> have a closer look at whether hugetlb can also use invalidate_lock.  Maybe
>>> it isn't worthwhile at last: invalidate_lock is currently a rwsem, which
>>> normally at least allows concurrent fault, but that's currently what isn't
>>> allowed in hugetlb anyway..
>>>
>>> If we start to remove finer grained locks that work will be even harder,
>>> and removing folio lock in this case in fault path also brings hugetlbfs
>>> even further from other file systems.  That might be slightly against what
>>> we used to wish to do, which is to make it closer to others.  Meanwhile I'm
>>> also not yet sure the benefit of not taking folio lock all across, e.g. I
>>> don't expect perf would change at all even if lock is avoided.  We may want
>>> to think about that too when doing so.
>>
>> Ok, I have to confess I was not looking things from this perspective,
>> but when doing so, yes, you are right, we should strive to find
>> replacements wherever we can for not using hugetlb-specific code.
>>
>> I do not know about this case though, not sure what other options do we
>> have when trying to shut concurrent faults while doing other operation.
>> But it is something we should definitely look at.
>>
>> Wrt. to the lock.
>> There were two locks, old_folio (taken in hugetlb_fault) and
>> pagecache_folio one.
> 
> There're actually three places this patch touched, the 3rd one is
> hugetlb_no_page(), in which case I also think we should lock it, not only
> because file folios normally does it (see do_fault(), for example), but
> also that's exactly what James mentioned I believe on possible race of
> !uptodate hugetlb folio being injected by UFFDIO_CONTINUE, along the lines:
> 
> 		folio = alloc_hugetlb_folio(vma, vmf->address, false);
>                  ...
> 		folio_zero_user(folio, vmf->real_address);
> 		__folio_mark_uptodate(folio);
> 
>> The thing was not about worry as how much perf we leave on the table
>> because of these locks, as I am pretty sure is next to 0, but my drive
>> was to understand what are protection and why, because as the discussion
>> showed, none of us really had a good idea about it and it turns out that this
>> goes back more than ~20 years ago.
>>
>> Another topic for the lock (old_folio, so the one we copy from),
>> when we compare it to generic code, we do not take the lock there.
>> Looking at do_wp_page(), we do __get__ a reference on the folio we copy
>> from, but not the lock, so AFAIU, the lock seems only to please
> 
> Yes this is a good point; for CoW path alone maybe we don't need to lock
> old_folio.
> 
>> folio_move_anon_rmap() from hugetlb_wp.
>>
>> Taking a look at do_wp_page()->wp_can_reuse_anon_folio() which also
>> calls folio_move_anon_rmap() in case we can re-use the folio, it only
>> takes the lock before the call to folio_move_anon_rmap(), and then
>> unlocks it.
> 
> IMHO, do_wp_page() took the folio lock not for folio_move_anon_rmap(), but
> for checking swapcache/ksm stuff which needs to be serialized with folio
> lock.
> 
> So I'm not 100% confident on the folio_move_anon_rmap(), but I _think_ it
> deserves a data_race() and IIUC it only work not because of the folio lock,
> but because of how anon_vma is managed as a tree as of now, so that as long
> as WRITE_ONCE() even a race is benign (because the rmap walker will either
> see a complete old anon_vma that includes the parent process's anon_vma, or
> the child's).  What really protects the anon_vma should really be anon_vma
> lock.. That can definitely be a separate topic.  I'm not sure whether you'd
> like to dig this part out, but if you do I'd also be more than happy to
> know whether my understanding needs correction here.. :)
> 
> In general, I still agree with you that if hugetlb CoW path can look closer
> to do_wp_page then it's great.


As stated elsewhere, the mapcount check + folio_move_anon_rmap need the 
folio lock.

-- 
Cheers,

David / dhildenb

