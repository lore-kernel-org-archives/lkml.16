Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853919F422
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743879131; cv=none; b=ZcCE6046NvD3pcwC7oGlpbH5uMicMDc5jXb/wD1cGhkW+U11C397jflNUGeDEu9NqN8xMQKWhIO3D7f8WwOsPUkfnUeautYaLN5Tuu2bL0yVn46IL6GKvyU+dXtA7FmR19feMAdUqZIqJhFpiiy55MPoj5IHwEZZmWm/ZzDCDnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743879131; c=relaxed/simple;
	bh=yglMeQsz123gDcvxpHoJHPRefkgMmB+L1OHo5trNH0k=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SwcONrkKJ7fRLuh2ZDz/YT8qaBvZrzXtC+1KLojbObbQO4Qig4pxf1fY03oFpGi3MmVtmgipWgfySaCwza0hFz/3Eh6tdlgXpVRRDPAq1cJ3bE64ioi+rJ4N1bZSp9kH+5R66JsMpRnIQuqpDGgmznz593NfX8RNJK/kHf5FAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3fGF0oz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3fGF0oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743879128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zl94fjucYs05RLWzioyJn3c96IDAkKlAGNSFTZYapG4=;
	b=G3fGF0ozT/FWNAW+zopoKvo0I9LuGbv1RDewLsh4DTaMxkflO5wqJEDtUAubyYeSZiD1uK
	EgEKztJP/y/i+kbacCb0STTglwZt3c89LesWtG7XLFhVsDGgN0q2/r0MI1Ye6dAvPeY1bm
	gsrTKLgCh22HK2Gwlo1JPdKW7mKehfg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-hzznsmyfPEeb4T_Hp6ETxQ-1; Sat, 05 Apr 2025 14:52:07 -0400
X-MC-Unique: hzznsmyfPEeb4T_Hp6ETxQ-1
X-Mimecast-MFC-AGG-ID: hzznsmyfPEeb4T_Hp6ETxQ_1743879127
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ba3b91b1so588268285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 11:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743879126; x=1744483926;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl94fjucYs05RLWzioyJn3c96IDAkKlAGNSFTZYapG4=;
        b=o8j04c9PlJqbk5OhMjcnOV/gTDgsxn78UxFw2taCyQCCoaxJo55t5ggZv2YpqiaVF2
         +CCbbspAFhCdr9ncxn2WIsEJy0sff10KEfCIKhDyF4HXdBS1av/FLpnvX0T8Y18GWCGd
         QCBnIoF+QqdiMTA6EcD1dS5lBBKuoNn3qkt16MuZeMtlH3fs1gNIz5EfquT+JUDBuYY9
         taVpMnMzTz7tyMzRkG8U2HH3aEPPrzX/5xI3BeNQRFh9ewE4W7CmnC+3YcYKZDSklQqK
         s+xmnZEdnsNtuRFH9a2dT1d9Ja6cG2rOReKhWdkR6HtlOL0d1liAWQ4troITcXlf/MlK
         vfNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKYqewLIxfZ+QBScCi6K+t8VlvrTLoT6IbuqlLDxKju3V+hol2v8IfZIbDIPmzPkGTf5mX4njW3dLiUNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPblfcxwU1L0PlDEKmPEFIZDo+zRID5yoWyNmZ4GBNSL1mD8Jr
	u5h8hwgqMVTYMN4/wghFy29WIPVxRZmk3gZA6/Nh4ehciIsqEKUairXM6Onp9lLNwyeW6oZjQWh
	Cf/iPNji6vtL9O0gSOCPk3Kn09IcP9ZKf03ygmhkahJi0vNxNwpxE2A95MZX+lEPK9Mfgtw==
X-Gm-Gg: ASbGncuX6VRretwP6Eo0tCEOVEWihfBddNNSP8s6zrEDGgOm0e3SsKthQsgOnScAJnf
	DlYDAQ4Ww7wzcO/mXOBqDr/i6pY055nWpP9qhVlwlOitQsKTi31NNR6kzDoWkUSt1DwS+JX30Zu
	Hc9ATxf4NaocyYWKXt3ZDR3EMxHDUD5Splds00IvVWJkYbOx8r5QGth2iuQ+UTnZ57KDOvfrGe+
	BSmyt+35sX+F1V0f7MjgS8JcUmfx731/PM0Q5mTT2FGTA1lqsXVBhkbQCbioqIPrvW0c/lAMI7O
	FW86sCLoNjK/akNmELUxVavXI9iYvrDNFgIy+GVURyqF4J73QvoMPzSPMlcygg==
X-Received: by 2002:a05:620a:2891:b0:7c3:dd2d:c0e2 with SMTP id af79cd13be357-7c76c98f69dmr1949212385a.13.1743879126145;
        Sat, 05 Apr 2025 11:52:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkQV+pEi+TmbqcIT9YnR48A7CUH0qtIrkXsV397pZvj687wq1qfmiwok5il5SMAFPR0p8RYA==
X-Received: by 2002:a05:620a:2891:b0:7c3:dd2d:c0e2 with SMTP id af79cd13be357-7c76c98f69dmr1949210485a.13.1743879125856;
        Sat, 05 Apr 2025 11:52:05 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e968c1fsm371472485a.52.2025.04.05.11.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 11:52:05 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6712624c-c798-4ccf-afc1-6dfc9efc4b5e@redhat.com>
Date: Sat, 5 Apr 2025 14:52:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] memcg: Don't generate low/min events if either
 low/min or elow/emin is 0
To: Johannes Weiner <hannes@cmpxchg.org>, Waiman Long <llong@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20250404012435.656045-1-longman@redhat.com>
 <Z_ATAq-cwtv-9Atx@slm.duckdns.org>
 <1ac51e8e-8dc0-4cd8-9414-f28125061bb3@redhat.com>
 <20250404181308.GA300138@cmpxchg.org>
 <c4294852-cc94-401e-8335-02741005e5d7@redhat.com>
 <20250404193802.GA373778@cmpxchg.org>
Content-Language: en-US
In-Reply-To: <20250404193802.GA373778@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/4/25 3:38 PM, Johannes Weiner wrote:
> On Fri, Apr 04, 2025 at 02:55:35PM -0400, Waiman Long wrote:
>> On 4/4/25 2:13 PM, Johannes Weiner wrote:
>>> * Waiman points out that the weirdness is seeing low events without
>>>     having a low configured. Eh, this isn't really true with recursive
>>>     propagation; you may or may not have an elow depending on parental
>>>     configuration and sibling behavior.
>>>
>> Do you mind if we just don't update the low event count if low isn't
>> set, but leave the rest the same like
> What's the motivation for doing anything beyond the skip-on-!usage?
It is to avoid making further change. I am fine with modifying the test 
to allow low event even when low isn't set.
>> @@ -659,21 +659,25 @@ static inline bool mem_cgroup_unprotected(struct
>> mem_cgro>
>>    static inline bool mem_cgroup_below_low(struct mem_cgroup *target,
>>                                           struct mem_cgroup *memcg)
>>    {
>> +       unsigned long elow;
>> +
>>           if (mem_cgroup_unprotected(target, memcg))
>>                   return false;
>>
>> -       return READ_ONCE(memcg->memory.elow) >=
>> -               page_counter_read(&memcg->memory);
>> +       elow = READ_ONCE(memcg->memory.elow);
>> +       return elow && (page_counter_read(&memcg->memory) <= elow);
>>    }
>>
>>    static inline bool mem_cgroup_below_min(struct mem_cgroup *target,
>>                                           struct mem_cgroup *memcg)
>>    {
>> +       unsigned long emin;
>> +
>>           if (mem_cgroup_unprotected(target, memcg))
>>                   return false;
>>
>> -       return READ_ONCE(memcg->memory.emin) >=
>> -               page_counter_read(&memcg->memory);
>> +       emin = READ_ONCE(memcg->memory.emin);
>> +       return emin && (page_counter_read(&memcg->memory) <= emin);
>>    }
> This still redefines the empty case to mean excess. That's a quirk I
> would have liked to avoid. I don't see why you would need it?
OK, I will drop that.
>
>> @@ -5919,7 +5923,8 @@ static void shrink_node_memcgs(pg_data_t *pgdat,
>> struct s>
>>                                   sc->memcg_low_skipped = 1;
>>                                   continue;
>>                           }
>> -                       memcg_memory_event(memcg, MEMCG_LOW);
>> +                       if (memcg->memory.low)
>> +                               memcg_memory_event(memcg, MEMCG_LOW);
> That's not right. In setups where protection comes from the parent, no
> breaches would ever be counted.

OK. Will post a v3 to incorporate your suggestion.

Thanks,
Longman

