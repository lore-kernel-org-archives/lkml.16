Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193CE25EF81
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974182; cv=none; b=P2i49ebu1PL5FKmCgIbmJ9gEVQ4wmpj8+sRpx8B/r2DA9XIoaxN0mvJMoxGxdp0X4wU0QZn0+39ZclJ0a477Z3EYxIw/h95mTobeRFeyAAR0H3uJPLogpvIaQHm4wyHdq0ODyZ/a07r7QaxvaIoio1kbmtSw66d13na/kbZec2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974182; c=relaxed/simple;
	bh=Zl4V58iwZbet/9mZRLMeILtAO+yONh8a+C7b4WWrgAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR9ZnfwpQJXoYKnLDt4dVF4VOkJgUjM5u4J4HSHCTJm/iHy2V0YQtPcDogl8k9lRsByusSrY00FIY5blM/GUn0rdIrVQhGgB+SjTf64JGW7/MLAGFP/D91aPsd2sKXdNvAwPcuHvTnzNM0HdYHDO+0lMbABCJgMM75YETLwvnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckDBn1b1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckDBn1b1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750974178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75dl3DeypNDiAtmR3WWaBq44pb5bGGxuHo+PqUY4Jz0=;
	b=ckDBn1b1R/VEWxxwyWVfi/er4NnsNhQ6TKsRKJihjpD4WFJKr8izJdfBZPIgj5ltBp0AEx
	6Wep3HOJ3ixeAgzZ68kBZBSWBRNB3DkJ4U471wQL7Sgz8Tj0GOSe0vOdhUtsn4X5D1zmZK
	DidslOumQKIMagK2wIiXUJSNzCYZFK4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-daAyZLn7O36EZJ9qSBNDdQ-1; Thu, 26 Jun 2025 17:42:55 -0400
X-MC-Unique: daAyZLn7O36EZJ9qSBNDdQ-1
X-Mimecast-MFC-AGG-ID: daAyZLn7O36EZJ9qSBNDdQ_1750974175
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09bc05b77so235785885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974175; x=1751578975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75dl3DeypNDiAtmR3WWaBq44pb5bGGxuHo+PqUY4Jz0=;
        b=KGJRA/Q30JBXMt8+vNEE96C7+3XJiB4ei2CjhDjJgwkobFDyg0VNMzd9OulgKy8AP3
         tsSLKRr/feOhKPWI986424gGWmLBDCLmZvNeqNCuZrZ0Gs4CbKOXMytWzTgyiyvEt0EA
         wYRu7FQ+++m3wkfaJn9cuqNHOAj1/l4iIXMSmIJE4XBKjd25WiFwl4Cfc4fu32sJEuAT
         hzXHYrTxI8Bp26XxLZ8CEOrnonblDHNhQ+uVYvZ9n57VAD8qpSr0xlrtz7q1usQOX5iF
         xswbImpdBekXcwmG3Lfrh7erGmJjolQYQkACorVECBduTSYaQ4y9NDucmwrSkrJJcQ2Z
         ZwNw==
X-Forwarded-Encrypted: i=1; AJvYcCVDEuRXI4dGQPhjAFEqF1MYPRqo1TtyOlojgEdrXXj/4vGOVyR6ua3eRyNeP/qRG+jQWCHkHnqztNK5VGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5aGayDR4ECCO8B5NZnMV08WCz6as0+UJ48kH7fIdsEJyC311
	pSc+13IC75bdt2HqOlM+BCFRrgSPIBPqE/WgRYUhxCt2fDJ4XtzOU9HIQrNUV85ZwsyJfhwfv3y
	AUypF8UEA5pq0hvBMomGtJO8DJN3B/fttfkCQn+KXyVgqfAhZHQZh7lJYoLg+FkGdlA==
X-Gm-Gg: ASbGncsX/sVpen+dS0dMMzps/U2C53vdT0cICLZ18l0oePCPMO0Y3WNlr2lrqXs6+qJ
	HEaHmYNt0nNTHTQKWzD3HNbxlJCtwUwtgPs3/42YD58Txrk9Mt8cnOqn/PRHYeKXB0uVBACOx53
	YnIBgTv1vyy7pPecaIQpEXBTQ5vIm8SgWc2giliopU4x3oo+SawlbXd1Tq+jaKobPlc6YT3HwlH
	Y+5wbuSxKFvJ0iiqL6AHrUoQID19dRjgFxXq4Db2SUXz5Q2WJZ8iZ3Gsgxe5MFQIaE7mOVx7p9v
	qrmPlDQGSfFX3i356s1DgSYwjxfK4oR2T9KNPAeTzfeey7oLYHPzm3y1Rk0u6oGt2EYq3+yy07o
	LkjgKPOgyaZ9F
X-Received: by 2002:a05:620a:468e:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d443947fbamr183755885a.17.1750974174923;
        Thu, 26 Jun 2025 14:42:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUieCka+aOZrUbXnLnmpVlLncLoLoEijYEGoYBPSFatbcBvDkiAfQTVyy0D8U8ztRdJluPVg==
X-Received: by 2002:a05:620a:468e:b0:7d3:8d2e:1f69 with SMTP id af79cd13be357-7d443947fbamr183753785a.17.1750974174559;
        Thu, 26 Jun 2025 14:42:54 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-65-69-156-206-24.dsl.bell.ca. [69.156.206.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44320265asm46963085a.66.2025.06.26.14.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 14:42:54 -0700 (PDT)
Message-ID: <a96141cb-9eba-4f61-be20-0f2c0d466e05@redhat.com>
Date: Thu, 26 Jun 2025 17:42:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: introduce snapshot_page()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com, shivankg@amd.com
References: <cover.1750961812.git.luizcap@redhat.com>
 <4a9745dd2989f7d5bf5bc69c37fc3e3cfda37e87.1750961812.git.luizcap@redhat.com>
 <20250626143929.a7f2bcbb8e90290f23af452e@linux-foundation.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250626143929.a7f2bcbb8e90290f23af452e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-26 17:39, Andrew Morton wrote:
> On Thu, 26 Jun 2025 14:16:51 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:
> 
>> This commit refactors __dump_page() into snapshot_page().
>>
>> snapshot_page() tries to take a faithful snapshot of a page and its
>> folio representation. The snapshot is returned in the struct
>> page_snapshot parameter along with additional flags that are best
>> retrieved at snapshot creation time to reduce race windows.
>>
>> This function is intended to be used by callers that need a stable
>> representation of a struct page and struct folio so that pointers
>> or page information doesn't change while working on a page.
>>
>> The idea and original implemenetation of snapshot_page() comes from
> 
> tpyo!
> 
>> Matthew Wilcox with suggestions for improvements from David Hildenbrand.
>> All bugs and misconceptions are mine.
>>
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -4184,4 +4184,24 @@ static inline bool page_pool_page_is_pp(struct page *page)
>>   }
>>   #endif
>>   
>> +#define PAGE_SNAPSHOT_FAITHFUL     (1 << 0)
>> +#define PAGE_SNAPSHOT_PG_HUGE_ZERO (1 << 1)
>> +#define PAGE_SNAPSHOT_PG_FREE      (1 << 2)
>> +#define PAGE_SNAPSHOT_PG_IDLE      (1 << 3)
>> +
>> +struct page_snapshot {
>> +	struct folio folio_snapshot;
>> +	struct page page_snapshot;
>> +	unsigned long pfn;
>> +	unsigned long idx;
>> +	unsigned long flags;
>> +};
>> +
>> +static inline bool snapshot_page_is_faithful(const struct page_snapshot *ps)
>> +{
>> +	return ps->flags & 0x1;'
> 
> 	& PAGE_SNAPSHOT_FAITHFUL?
> 
>> +}
>> +
> 
> All looks sane to me.  Small-system people (are there any left?) might
> point out that all the new code could be under ifdef CONFIG_PROCFS?
> 
> I'll skip v1, see what reviewers have to say, thanks.

Yes, no rush. And I'll fix the things you pointed out for v2 (including
ifdef CONFIG_PROCFS). Thanks for the super quick feedback.

