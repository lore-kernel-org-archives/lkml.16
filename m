Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338A23E35D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405720; cv=none; b=FAAHd8Jyse8absJmhBM8lZmJjCSlEP8Yl1I6wbp8jZbs4IqvEmV18z9pDmyhiBYMzI0YuMBpfavedJocYjzXMN7N1iSST1C4/nMZr7sdu+rXUWNIOlUEUZxhXfKyVGzo7z1x6PPIxlbM5OEf+TGZ6GsWP4xyLDmCg2LZjrDf1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405720; c=relaxed/simple;
	bh=vwjrDtO8vu3q7AzPRougVdG6M89UkfX5qhhy45R4EJQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HzLlb9yERGRHkH50+Slvrt5HCR+IyV8tMj6FlpEp+ho/Q8OfAS/y8RKtppJ3yRwJMML6V414hbCWBrk6Dbk9JS92dPBRbwoccpkwUmGp+deMFJ1y/DqHoOOmuQbPaV2BwyzeNyolSyqQWNz1I9bI9YZjf2LzoIer94C8phULh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FiifFGTY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FiifFGTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744405717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3W9KclZfqlYgP7Iz+t99weLE980bndnAhFOf+DRnuYg=;
	b=FiifFGTYVMTvqCqyEuj1/z/PkO4mSzU5fZRPLhoXC+w5zoRHWxxpCQXYQxGRP5imsSMKA9
	iSR87vjOhxxJfjos8vFut2E2PSp6NqukD0TDeJ2vH2heUARbZBZC3793rcTgILM+c9NmPj
	4Q0EfMn2DnHWTA3YkkZ52gR147oMjOY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-8tvfnVUwO9CtqemFaXK98w-1; Fri, 11 Apr 2025 17:08:35 -0400
X-MC-Unique: 8tvfnVUwO9CtqemFaXK98w-1
X-Mimecast-MFC-AGG-ID: 8tvfnVUwO9CtqemFaXK98w_1744405715
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767816a48cso62419271cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744405715; x=1745010515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3W9KclZfqlYgP7Iz+t99weLE980bndnAhFOf+DRnuYg=;
        b=rYuJyi5cR9KQ287mXO8+Vmrm1tnSxnHEci4nN1BBQCfwwOC2TBZCQvF2MzCODYoLgt
         NUE6xycHvoBTqocAjfFj5p3GNDaGImdKCogs9sLaTlVyjVUr78wi4Zehy75qwAtOeHcr
         LUZeZ1xkUsN7eJe8FASKSk7dj6haMYNxJweG2t8PQeHN8Qnk36FWfKTxFMe7DOImDqiI
         cFJu5hF2JCYtFTfxH864xGFd2tuqnZscBVtJsbK/WGIdrThhX/ls04Bz2hsWM37kaYg4
         BTBAX9toZSVUSt9HdhQ9wOaJD/0iDXbdztXgFxGyh7aItPPMKiDYmj8DB8uZ0/jHX0wZ
         RrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCViQStRuAbIOaD/lxVzP0weIFlOG/nz0kurCsJC5kAXQAtF6yaSv5lb5aRouBsbvPEyzUFsvICajZSfQxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqFO0tA6MXQcWuoSrcuO6cx7Eoh2cJqu0niwjuGE5zXZJh+YeP
	EQpFB5+q1scjIQ5trT162K1nV/DxKNa+3hbV5fysoIwV677ao8Wx9tHJ2P5KPEvUZEy5aB2Hwe0
	sPEZcASsE1FYmEVdVVeeb+SozBli3b1zjNqimva+Xszvtw5h+tIoeXHPUQ9wqiQ==
X-Gm-Gg: ASbGnctY5a2SzV3Fb2ucbh81eR9iD97ZgsQRwvdDFsza1wFBdhcSBo9MOmwrQKKLDNQ
	JrDnjslqQEbHsB6ScgjAdXY0ey0xLlv3bcDv8hUHMn6xM9cM8xOS7UHjhcu4XPM3b5uM4JQE4wh
	Shyl6W5bl5c9ShUUwtacQeTH7Lk8Y656TVXjiBZBDAz23xT5ToB74SQ4FGBIqmvR7CKz2kQga/C
	IqKWnGQbvd3f+UQ/5RcbeB3NcmujC2m6MT7vLRbpGyl74to1O1LGitj1dcTw7nQe4Ety+YKoP4e
	o9unbzZFvsUjtARWWxI0znMkPUOrN6Bl75Lhmv7SCZcDcsvJAoJcC7n+Cg==
X-Received: by 2002:a05:622a:178e:b0:476:6a3d:de44 with SMTP id d75a77b69052e-4797753b8ecmr60226541cf.18.1744405715389;
        Fri, 11 Apr 2025 14:08:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0y+vSo6hGThZEztK8iK0sDkq82eXR0S+/0TDkk0ytOKTiwg9dU/ESnAPHOzVuad6BuHXsiQ==
X-Received: by 2002:a05:622a:178e:b0:476:6a3d:de44 with SMTP id d75a77b69052e-4797753b8ecmr60226251cf.18.1744405715042;
        Fri, 11 Apr 2025 14:08:35 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2c07fsm31907501cf.44.2025.04.11.14.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:08:34 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6d81d576-7e94-4523-af9a-d43298ea64ba@redhat.com>
Date: Fri, 11 Apr 2025 17:08:33 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mm/vmscan: Skip memcg with !usage in
 shrink_node_memcgs()
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20250407014159.1291785-1-longman@redhat.com>
 <20250407014159.1291785-2-longman@redhat.com>
 <awgbdn6gwnj4kfaezsorvopgsdyoty3yahdeanqvoxstz2w2ke@xc3sv43elkz5>
Content-Language: en-US
In-Reply-To: <awgbdn6gwnj4kfaezsorvopgsdyoty3yahdeanqvoxstz2w2ke@xc3sv43elkz5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/25 11:25 AM, Michal Koutný wrote:
> Hi Waiman.
>
> On Sun, Apr 06, 2025 at 09:41:58PM -0400, Waiman Long <longman@redhat.com> wrote:
>   ...
>> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
>> index 16f5d74ae762..bab826b6b7b0 100644
>> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
>> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> I'd suggest updating also the header of the test for clarity and then
> exempt the Child 2 ('E') conditionally from comparisons, something like:
>
> @@ -380,10 +380,10 @@ static bool reclaim_until(const char *memcg, long goal);
>    *
>    * Then it checks actual memory usages and expects that:
>    * A/B    memory.current ~= 50M
> - * A/B/C  memory.current ~= 29M
> - * A/B/D  memory.current ~= 21M
> - * A/B/E  memory.current ~= 0
> - * A/B/F  memory.current  = 0
> + * A/B/C  memory.current ~= 29M, memory.events:low > 0
> + * A/B/D  memory.current ~= 21M, memory.events:low > 0
> + * A/B/E  memory.current ~= 0,   memory.events:low not specified (==0 w/out memory_recursiveprot)
> + * A/B/F  memory.current  = 0,   memory.events:low == 0
>    * (for origin of the numbers, see model in memcg_protection.m.)

Sorry for the late reply. I think it is a good idea to update the header 
as well. This function is actually used by both test_memcg_low and 
test_memcg.min. So I will use low/min instead.

Cheers,
Longman

>    *
>    * After that it tries to allocate more than there is
> @@ -527,6 +527,7 @@ static int test_memcg_protection(const char *root, bool min)
>
>          for (i = 0; i < ARRAY_SIZE(children); i++) {
>                  int no_low_events_index = 1;
> +               int ignore_low_events_index = has_recursiveprot ? 2 : -1;
>                  long low, oom;
>
>                  oom = cg_read_key_long(children[i], "memory.events", "oom ");
> @@ -534,6 +535,8 @@ static int test_memcg_protection(const char *root, bool min)
>
>                  if (oom)
>                          goto cleanup;
> +               if (i == ignore_low_events_index)
> +                       continue;
>                  if (i <= no_low_events_index && low <= 0)
>                          goto cleanup;
>                  if (i > no_low_events_index && low)

