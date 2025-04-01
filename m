Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7C3209F31
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541006; cv=none; b=US4WTl+g9mK6Wk130RRzhTop0ItDLpuXh9kMzg9Yat2fLjufsN/foyfANcdARUcA74sCB1RvDeClG2anuQE6Aqj0jTcEKA+N2tutOrRBINTGevuaTmL6Jbc/GTquZG3pYO3HM2xZtaXj7hBa1ZsfGwsIW3z9AZpzG6H2eL5/CKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541006; c=relaxed/simple;
	bh=v56HhO7BnNvgOsrqPYPyyvBFZCpogEYgRZeTU4L4oNw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AaSVNJ7vWgYYXGiYvPEYnYbpy6QV9myw30WDERszvW8Hlr9mvwcPniJHiM2/nds8WZCHquZMlSa7LzkCEtcU90BxuUBDUpHd350CEZN/9VTsbqXYJaYeCgUYrmKgS9UClQFZm6MhFb55zLvIM/OOGjev2M+1dmaTEykgdxVpQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gWvVeGqj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gWvVeGqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743541004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHHA8OPc+IFjSo96+/YuwMdjMD429Mu9O83tqhpNzsg=;
	b=gWvVeGqjHdf69v03xz1LgpPVLyfuFpJa0yWq+IXf+Dy4nl3cvj67Se2+ROCihzmIlp9itP
	ODlfnxdxpxVz6lc4clsotVlabtfaH7V5R2/IAlXUXBvGvkHouCVR1PJv2gy0yEbCSQ+z6y
	JTL4KLMF35dEsg04ArADvxqksmmaD20=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-cmNv12IvPZS1IoQD3FCGFA-1; Tue, 01 Apr 2025 16:56:43 -0400
X-MC-Unique: cmNv12IvPZS1IoQD3FCGFA-1
X-Mimecast-MFC-AGG-ID: cmNv12IvPZS1IoQD3FCGFA_1743541003
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d9d8890fso43873285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743541002; x=1744145802;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHHA8OPc+IFjSo96+/YuwMdjMD429Mu9O83tqhpNzsg=;
        b=TR/RNKWkpb4rBdxMG8xqcYeRRXS5Fd8vjDxwb9k0tDokm2wzqLSbEIJV5tuxW2Q+Si
         XtjRdCLegg5t2htM+VIVJEKyR9joljXfwZgUkHJ+2j/4WdcQatjoRIYNQ9FV2cfV9IKF
         Ti/1n+ZO0/C5BTIjo9jbxsYg8HnKThqX9q801X/e3Ek8l8e5oeT81iRpLObcdStf6OnH
         S+qZnBL9X3UuVGFJS07aP7HPfqvmyn8OoqJIT59VdN/+jClwID8ib8xzx6xu3HYrPb0W
         1jmCkp8kW+hDhZwcsc834pcCuXP9zexSHlOFqUv8BQ8WmqNdc6lVic865Tg8ZAOZsC3Z
         AL9w==
X-Forwarded-Encrypted: i=1; AJvYcCVgEhy3f7xNMXjarf/VCmw3byTRPPAcizoskzIWya5Ve5cVTIKDGYW8HjDsw4qKgdg17Wlz00yGVepxwek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf90CkX4l/fLBR+dcuem6YclMwUYNv3BIqy1PgMPensWpbc5zl
	0OD4gNb9k8hSCv0+vxt5KbzmWQwfhMPqCU+rg9RFjCcnklrLeV9HEa3pgJDZC/Ao4qAA2C0smtd
	Dd8wpMHcg5YZLfHGYutWE+XhFEchgH/awCl/0FzVp9/fusz/4uN+B5vAe1hioaQ==
X-Gm-Gg: ASbGncvar/a+oo42jbCwVa12g5jP4SPnZi52VojxaDsKmAIJco2RY4WbwW/8GSo/Xaw
	zHjtoqO/2gjP5nHxhd2w9cwvRAOYq1YCrLmZRfPC+6As0isXgx5GL/VO4fiz6iIsdr50trO4DT4
	RnriG/gPpIoKvwGFvV7j/wvXkptW0jfRxJfPzyu8eME7X9RYyMZnCh1Eytfr8ZylPmxO3JE1FDo
	Y38fk1tNnELlpGXYdawmBbD3tzY3y6TR7JlcrJs5CJeKMCT1XwmY4uaE2uuhKsp9fZ7IYzav5oS
	3QPil9+6Xy+jcw3GrF+PA0sbjwkbPmV2qXh19ANcg2CdcOGBtvhyPJs72jBguQ==
X-Received: by 2002:a05:620a:1794:b0:7b6:d273:9b4f with SMTP id af79cd13be357-7c7629b4f65mr246979285a.11.1743541002704;
        Tue, 01 Apr 2025 13:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcWWJmpseCDQqpeazL0dYAKCMUkDVUD6rJ+imI807rIIXOntpqMKpKESFZbFQCT/dHY6xXdA==
X-Received: by 2002:a05:620a:1794:b0:7b6:d273:9b4f with SMTP id af79cd13be357-7c7629b4f65mr246976685a.11.1743541002366;
        Tue, 01 Apr 2025 13:56:42 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f76b2650sm703707885a.62.2025.04.01.13.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 13:56:41 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <d8d7c633-a9e3-4990-8904-4c7710894789@redhat.com>
Date: Tue, 1 Apr 2025 16:56:40 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] cgroup/cpuset: Fix race between newly created
 partition and dying one
To: Waiman Long <llong@redhat.com>, Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-2-longman@redhat.com>
 <Z-shjD2OwHJPI0vG@slm.duckdns.org>
 <915d1261-ee9f-4080-a338-775982e1c48d@redhat.com>
 <Z-xFqkBsh640l5j0@mtj.duckdns.org>
 <d9c96490-98bf-406b-8324-6cf86a536433@redhat.com>
Content-Language: en-US
In-Reply-To: <d9c96490-98bf-406b-8324-6cf86a536433@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/1/25 4:41 PM, Waiman Long wrote:
>
> On 4/1/25 3:59 PM, Tejun Heo wrote:
>> Hello, Waiman.
>>
>> On Mon, Mar 31, 2025 at 11:12:06PM -0400, Waiman Long wrote:
>>> The problem is the RCU delay between the time a cgroup is killed and 
>>> is in a
>>> dying state and when the partition is deactivated when 
>>> cpuset_css_offline()
>>> is called. That delay can be rather lengthy depending on the current
>>> workload.
>> If we don't have to do it too often, synchronize_rcu_expedited() may be
>> workable too. What do you think?
>
> I don't think we ever call synchronize_rcu() in the cgroup code except 
> for rstat flush. In fact, we didn't use to have an easy way to know if 
> there were dying cpusets hanging around. Now we can probably use the 
> root cgroup's nr_dying_subsys[cpuset_cgrp_id] to know if we need to 
> use synchronize_rcu*() call to wait for it. However, I still need to 
> check if there is any racing window that will cause us to miss it.

Sorry, I don't think I can use synchronize_rcu_expedited() as the use 
cases that I am seeing most often is the creation of isolated partitions 
running latency sensitive applications like DPDK. Using 
synchronize_rcu_expedited() will send IPIs to all the CPUs which may 
break the required latency guarantee for those applications. Just using 
synchronize_rcu(), however, will have unpredictable latency impacting 
user experience.

>
>>
>>> Another alternative that I can think of is to scan the remote 
>>> partition list
>>> for remote partition and sibling cpusets for local partition 
>>> whenever some
>>> kind of conflicts are detected when enabling a partition. When a dying
>>> cpuset partition is detected, deactivate it immediately to resolve the
>>> conflict. Otherwise, the dying partition will still be deactivated at
>>> cpuset_css_offline() time.
>>>
>>> That will be a bit more complex and I think can still get the 
>>> problem solved
>>> without adding a new method. What do you think? If you are OK with 
>>> that, I
>>> will send out a new patch later this week.
>> If synchronize_rcu_expedited() won't do, let's go with the original 
>> patch.
>> The operation does make general sense in that it's for a distinctive 
>> step in
>> the destruction process although I'm a bit curious why it's called 
>> before
>> DYING is set.
>
Because of the above, I still prefer either using the original patch or 
scanning for dying cpuset partitions in case a conflict is detected. 
Please let me know what you think about it.

Thanks,
Longman

