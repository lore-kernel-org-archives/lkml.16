Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FBB35942
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743477139; cv=none; b=G8hyOuLuMXhSAozw7NRpCH5qgA3Hj1Jp/vWt+ZQSPhoQpny+biJHYIBG7onJUoHxyE3PRhpR4GqHqHC8NH+ahx1V0wUMMUux7jW3SOznUahIELKWmaii7PdKhBtJilU75CAGztj0B5K51SMX7NJB5jouzRrCf4MOisH3mPpORmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743477139; c=relaxed/simple;
	bh=YH7JCvQ8t1ajK7yqoxSreEprl3ng3fcJ/g1aGkjZ1Ok=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n0Zx6tQOgGk2/gSOxPl6JfSY7gkv1mZ9SfLpnlXOYBulXyqwAwWpkbf1Mmg0g1LKa9oCSjYCWtO+UY1RR7FCmo7Zsru3MaTs8LF4/A3BbRXWh8eb+9KA4y9VrZsljylQX0kFjbv8lfbSvK5LE2EWey5050/HVzjtcTTMtO5egkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EifkrBKb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EifkrBKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743477136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+yChQ8LHPX/9hgzwjNue2CwizV8oJdhGjOx1G3bhZ4=;
	b=EifkrBKb5igA0BYklHY0ebl4RlY9I0oBIefvA+5eAi7RqKzEsSffCYOK1LwJwC2IF4RWpw
	bi39gdxAAaV97qbXBgBYjXU436JAj4FgVJ6BQJyUQAKgJeMSFDhHiHdlQqaHqNnh+M8nRk
	gNtpjxi1ZDUDxZnq0bIR5KOMYmQyESY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-avG4W-ZLOp-lEbLPngEBTg-1; Mon, 31 Mar 2025 23:12:10 -0400
X-MC-Unique: avG4W-ZLOp-lEbLPngEBTg-1
X-Mimecast-MFC-AGG-ID: avG4W-ZLOp-lEbLPngEBTg_1743477129
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so762112885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743477128; x=1744081928;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+yChQ8LHPX/9hgzwjNue2CwizV8oJdhGjOx1G3bhZ4=;
        b=WBMyJm0HWnZH3b6RE1uzyif0a7Ft5XltLCGLruM+UOqmWx8sDhS0sT+nvp3yiEpe9D
         5O6y0toSAY6jwhLdzKCUvuen4P+WJSvXT4G+WgD6E65kJ2P4ffBPrkDhEWi6AjC8qwWO
         fMF6Vw02i32z/E2EORoBjxqCHWqlz40G/J1M5NVCfD3E74jBWIswatkzRDhOqKuvFWx3
         uKxN3pzZna438VKumHe08iE0rvly4bW7sSSWhTCtzw4yclAyTZL6EN6F4eb9HtWfkOIN
         7+V1nwoPSNxZGbyD6+/PJKiIOHQitUfZWsk4ag0N629Btdw4ZRujsFGKEUioA0WU/G/p
         /jlA==
X-Forwarded-Encrypted: i=1; AJvYcCUM6LuROwPIZ1WkFNQhMS5IuOQK0lQcN5SXb47zh+/T6Kr7Fj0xBm5MKFvM9NdUMWjJMbdJwOgOmZZHaFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHHVkZLcZXTy9ViV0OrHf87Rdjt98osX1S7BH/wHlRuCls6gtR
	aNXihPoYDquA69Attz6EBxJhx1sZJsWLXDlPl+/dL2VJ3qA1mFIWQviwaKW70ag5lVC+4RNtrl3
	8SLG3iRfR32GL2KD2a3dr7g3HB5Ji2Ype8jpPNbQaO2FQnWXvQDsi46XC5T1VjlaBJk4k4Q==
X-Gm-Gg: ASbGncs6fk4gOcH0PKTfV1LP1zoqh3GYQgKpNAar3YhS+OUndUL4Z+GTTEwFUWNq436
	+KT47suy/JI9N1zxcfGgXjfI/YgQSzb22xWCooVxYgco4uMNnTSmZEw6IJUM+1UjVZiR9POWteg
	I2FJYuLx5gGU4hcxNEu93/Wtd6iFdiwfh0QhOoSmuFmGM6ajznB2VnE6RWx82LWs1Hf815xsE1g
	9dwnS/dIMBr5OFw8w4QoZjgD0Ptc7kOp5sPtcoLbX8PF0KW1cn39zv3rewHYh0KB16PCS8SqXaZ
	oVNUGBu/Q4sYu1LEt1VgZVu8fawTf/jQY0/H3ZfC/hHHcDdaNLtSAJdedPsDdw==
X-Received: by 2002:a05:620a:3193:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7c75bbb2973mr216489585a.13.1743477128007;
        Mon, 31 Mar 2025 20:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg1j7Vc+zuUQ1pOrhianPa9k1mLxzvuGG2Gm2NPTKGwMMBDaWsWyn19rFctKJdNGrDvU+WZw==
X-Received: by 2002:a05:620a:3193:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7c75bbb2973mr216488085a.13.1743477127711;
        Mon, 31 Mar 2025 20:12:07 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7764c7fsm587396785a.84.2025.03.31.20.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 20:12:06 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <915d1261-ee9f-4080-a338-775982e1c48d@redhat.com>
Date: Mon, 31 Mar 2025 23:12:06 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] cgroup/cpuset: Fix race between newly created
 partition and dying one
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-2-longman@redhat.com>
 <Z-shjD2OwHJPI0vG@slm.duckdns.org>
Content-Language: en-US
In-Reply-To: <Z-shjD2OwHJPI0vG@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 7:13 PM, Tejun Heo wrote:
> Hello,
>
> On Sun, Mar 30, 2025 at 05:52:39PM -0400, Waiman Long wrote:
> ...
>> One possible way to fix this is to iterate the dying cpusets as well and
>> avoid using the exclusive CPUs in those dying cpusets. However, this
>> can still cause random partition creation failures or other anomalies
>> due to racing. A better way to fix this race is to reset the partition
>> state at the moment when a cpuset is being killed.
> I'm not a big fan of adding another method call in the destruction path.
> css_offline() is where the kill can be seen from all CPUs and notified to
> the controller and I'm not sure why bringing it sooner would be necessary to
> close the race window. Can't the creation side drain the cgroups that are
> going down if the asynchronous part is a problem? e.g. We already have
> cgroup_lock_and_drain_offline() which isn't the most scalable thing but
> partition operations aren't very frequent, right? And if that's a problem,
> there should be a way to make it reasonably quicker.

The problem is the RCU delay between the time a cgroup is killed and is 
in a dying state and when the partition is deactivated when 
cpuset_css_offline() is called. That delay can be rather lengthy 
depending on the current workload.

Another alternative that I can think of is to scan the remote partition 
list for remote partition and sibling cpusets for local partition 
whenever some kind of conflicts are detected when enabling a partition. 
When a dying cpuset partition is detected, deactivate it immediately to 
resolve the conflict. Otherwise, the dying partition will still be 
deactivated at cpuset_css_offline() time.

That will be a bit more complex and I think can still get the problem 
solved without adding a new method. What do you think? If you are OK 
with that, I will send out a new patch later this week.

Thanks,
Longman

