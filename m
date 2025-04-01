Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A298214213
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540124; cv=none; b=Hee074kSQ3piknC8jZysqi3TBF6xKtGh2X3+KJuPWRfRK8pLv8J5/Z8sxY3l7qcyyrbJ9rJBDpRPfc6QMW3vEzjSMBC6X09bUFkzQDeI0YkvFe/Eun8oa+Y/vmkOXunrMSFcduBGJw712sJfQAEeHNwMVtaxQawSNNSZBVsl/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540124; c=relaxed/simple;
	bh=DQqNytcES03RM+rHoX7X/MIHXjVFtwm514rcdrui4L4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MftcJYCNY55BMWNLam3lFrVJteFe3pyjvJS+gwUZ7qPdw85j6b7bKe3wvaCaKcOa6bqyuMigpEido/X520XRHaWA2oa9sI437iEM2cqMG9kLpyr4lXpLMdni19aQfGgtW3ws7q7QPKm2GnKySMOPvErf50pVgUYJ4rrXo99xOBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BS5vT8fH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BS5vT8fH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743540121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Owge253k5OvzgMZCm8XexlvQc59vpIkP2hnOZmugbZE=;
	b=BS5vT8fH1aSN5oEMWfFD39xw4Fbso+NiTVqs4KtI2Hr7onLUdv1u9bNq24z6DfaxvxuK5R
	HL60fz6x192dpw2hN6QndbcsGMj4OG7oUEDQXWOIeBVsg19KVUjKm+nLJvqFGZUhle1Xr9
	Vo5f0R7KNSphEGDrYkwzUxREJqiJfh4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-a009eiMoNXWW0cXA9RSQgQ-1; Tue, 01 Apr 2025 16:41:59 -0400
X-MC-Unique: a009eiMoNXWW0cXA9RSQgQ-1
X-Mimecast-MFC-AGG-ID: a009eiMoNXWW0cXA9RSQgQ_1743540119
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff78so113877385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540117; x=1744144917;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Owge253k5OvzgMZCm8XexlvQc59vpIkP2hnOZmugbZE=;
        b=m2f6Wl4tGhzBvlH71PcDSQ3rEa4BbzkebQ6suQZ4p1se6s8B64A8SNwEEtvgXHkyZF
         lRFGnOkF8K5jviu7tx8Nq6Jbg5RCq12zJhvIiQiIAPrqS4iJKbslj9yRRjIepJ7acgun
         krTYhq0CFgi3X4KUffpvHYe7dM5NnaHqLlilsPEzio8TFnxb5UW+GdXD366hyDCHegL0
         u4YQUeK64kDWWEzK8yI/E2DSX/I524Q6RG3bd9ADZmMJ+8r4RY4Vty6xYSPHxKLN0P25
         ejbKeg4M5m+8G/VJHk4ltbJDc40YD0nCgCy3aiN5QDvQuujkuvX6rpEoAkJ0gtwUnJKP
         S0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnSDtg/Ng5InS9ske36CYbJHvQRT4ouYATTkl5P8ZjvYtIELTxcTahzvM6Xhc0imTKsBL0Q/EBUVg/yGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZdAOKUnKqm5CqIQClGi+qSZKOO+6pIqzxTLWznMjUoEwZjAkz
	yaR9FOhv86eiQt856Bio2pY1seCa/e2JmV8SYzcCD7iSs+Jc37cjY7Cnx4aXfIU7xIL55n/4t0q
	Zs06L+guEZJ9i3ZHE1RVstLGLPYRQ1YFjQzRIhCsKiZhMRN5GcOnLRfZQJJe4hLhWuvBh0g==
X-Gm-Gg: ASbGncuSf9zP2Kv2wBA+kilUA9+uhQh25+it13xMiu4X0kV0CBTNGE19FSbMmHsFXEx
	pbsheT6ZNMQyTKG4/VaZYo077YVXRCdTo1LqFajtWk4mruNtwlgoqbIdomLTvfe6/wz2dLh88o8
	+miN8kRrOH/ZZ5zBkNdAWtC3ZgT6WRlt+6hypaMujAsl3zTvmUnRkUd2ydhuds9qIK/aVepxewN
	HJpRo3NaP+kwq/OU40PKUDGSOHSCez9N7mgdH3QKAjWwXhAZGK1JLPFTWKskaxNafjSj5dwLONq
	h6Bfju+Hlqbo280bSIjNuGgLC55WoUW7RjLcS45goM4k5PRozhBXcwC0oz7i8g==
X-Received: by 2002:a05:620a:4013:b0:7c5:5276:1db7 with SMTP id af79cd13be357-7c6908974d4mr2076453785a.52.1743540117629;
        Tue, 01 Apr 2025 13:41:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH27u1JuY0yEa8uyZ7v4MsZRRq+k/qsw1NKT26VcX+0iVdXSIzNmBeyfSP31h9rLTX0UGAbFQ==
X-Received: by 2002:a05:620a:4013:b0:7c5:5276:1db7 with SMTP id af79cd13be357-7c6908974d4mr2076451385a.52.1743540117322;
        Tue, 01 Apr 2025 13:41:57 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f768b70esm699208885a.43.2025.04.01.13.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 13:41:56 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <d9c96490-98bf-406b-8324-6cf86a536433@redhat.com>
Date: Tue, 1 Apr 2025 16:41:55 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] cgroup/cpuset: Fix race between newly created
 partition and dying one
To: Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-2-longman@redhat.com>
 <Z-shjD2OwHJPI0vG@slm.duckdns.org>
 <915d1261-ee9f-4080-a338-775982e1c48d@redhat.com>
 <Z-xFqkBsh640l5j0@mtj.duckdns.org>
Content-Language: en-US
In-Reply-To: <Z-xFqkBsh640l5j0@mtj.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/1/25 3:59 PM, Tejun Heo wrote:
> Hello, Waiman.
>
> On Mon, Mar 31, 2025 at 11:12:06PM -0400, Waiman Long wrote:
>> The problem is the RCU delay between the time a cgroup is killed and is in a
>> dying state and when the partition is deactivated when cpuset_css_offline()
>> is called. That delay can be rather lengthy depending on the current
>> workload.
> If we don't have to do it too often, synchronize_rcu_expedited() may be
> workable too. What do you think?

I don't think we ever call synchronize_rcu() in the cgroup code except 
for rstat flush. In fact, we didn't use to have an easy way to know if 
there were dying cpusets hanging around. Now we can probably use the 
root cgroup's nr_dying_subsys[cpuset_cgrp_id] to know if we need to use 
synchronize_rcu*() call to wait for it. However, I still need to check 
if there is any racing window that will cause us to miss it.

>
>> Another alternative that I can think of is to scan the remote partition list
>> for remote partition and sibling cpusets for local partition whenever some
>> kind of conflicts are detected when enabling a partition. When a dying
>> cpuset partition is detected, deactivate it immediately to resolve the
>> conflict. Otherwise, the dying partition will still be deactivated at
>> cpuset_css_offline() time.
>>
>> That will be a bit more complex and I think can still get the problem solved
>> without adding a new method. What do you think? If you are OK with that, I
>> will send out a new patch later this week.
> If synchronize_rcu_expedited() won't do, let's go with the original patch.
> The operation does make general sense in that it's for a distinctive step in
> the destruction process although I'm a bit curious why it's called before
> DYING is set.

Again, we have to synchronize between the css_is_dying() call in 
is_cpuset_online() which is used by cpuset_for_each_child() against the 
calling of cpuset_css_killed(). Since setting of the CSS_DYING flag is 
protected by cgroup_mutex() while most of the cpuset code is protected 
by cpuset_mutex. The two operations can be asynchronous with each other. 
So I have to make sure that by the time CSS_DYING is set, the 
cpuset_css_killed() call has been invoked. I need to do similar check if 
we decide to use synchronize_rcu*() to wait for the completion of 
cpuset_css_offline() call.

As I am also dealing with a lot of locking related issues, I am more 
attuned to this kind of racing conditions to make sure nothing bad will 
happen.

Cheers,
Longman


