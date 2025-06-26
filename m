Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0659235070
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982292; cv=none; b=p4/JqmFE2lT/1XMK/cYGEXkBe2LKuee0szsRg9a6W+uedstDHc5zZobnkGWEwsODrjBBuTGyN7jDEMs+RE/9Gp6kzwmVaelsQfyy6ztGF51q4XD7L+9fM0s39Ex4/DTuKY0I+hoRH2yT4a2ZWkKqzWKFZhadwFOOxbk3l2LnnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982292; c=relaxed/simple;
	bh=XXuuASV4ibc9aK37puza/fBR+hnOsem4MOV/DQNWTb4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VOxyf9C5EMkptb5+yUPMtYOKdG9TE1dPWE9Y0ZDlyc0uzZv/YVmB1+98uVNGHDzyKjMoKYLFSTgTLG/ECyKiG0CENxsWtDADLV/yyxUgs/aSnURmT/7DRp0LukRCiXbx5gtBEQLZ28xxGh27rruZUeNg/Z03Wcm4WK5mLeiAXNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zx3/z2Td; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zx3/z2Td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750982289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjFYZhLPqlriz67DMVaY4QJPFmjfEkFaipRi29vSOFA=;
	b=Zx3/z2TdudqhL8vPZt4+yAaBSDuZCmvp7zZ0rKq7398drVgYkwGx9kG+R5gfIxtgTVGNO0
	X/OazF02YKLEEodvUEmgMLNqZbHn66F1uoq5JK2FQ+Ep8tLpKRKx868zwF0F5fYR3re8gm
	QDiN8qeRiHN6y5PN0UPKgiV5WCXhGGo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-trsaR8ylOTWmRv-MdAwBZw-1; Thu, 26 Jun 2025 19:58:08 -0400
X-MC-Unique: trsaR8ylOTWmRv-MdAwBZw-1
X-Mimecast-MFC-AGG-ID: trsaR8ylOTWmRv-MdAwBZw_1750982287
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2354ba59eb6so25692405ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750982287; x=1751587087;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjFYZhLPqlriz67DMVaY4QJPFmjfEkFaipRi29vSOFA=;
        b=HTWqfuW/omGOwPfYGG7TxCsy+eYxbPI9HT6g0fx/kWzrWNQg75Ezyv00VdZBnoyJkt
         Gj+JnfDTdZ3dx0YAifmIdKX+AlEXhRhTck+qZptLO+fUSr23B2QS7Ue5HR8GH5Aj+R4b
         UhqNe/IFPIPfwRqkSx+TVWd/mp9IR8jp0xFTUt4iy2mLTk1bjXDibVN/1ditAmjpZgpu
         1LGMReyUF4UwUc5g5Fehk8aib3CTpBPdUtTAngvmXYEkoLVsipGlrYP51ufGKppjurVO
         AOo2rWJ+nxNidDQDwelAhi29KsQsDsS59Yb3BWbPNKesSZmaQYiJxjXgJ+goy5D5vcvN
         zVww==
X-Gm-Message-State: AOJu0Yxst0RYBCA1Rj3EjceTV4kCECsFI1h1gWAm6qApf7jgv0N4t8Lr
	8ABOG5qV7tx0xk7Zojf8dBiXalxmUjuPK6MbWdD20DfpqyyhTZyaFEwLoxNdkiZ5tGR2spVtNgR
	irY8Y8V7dayAMnSg8fcLoq7sgB5svBLX1+YHFhwvmPtGqEcePyFJpOkAvhVwvkKx/2w==
X-Gm-Gg: ASbGnctCqhrv8LIvOUfyRLp1NXMLwfsfkwB9sQD5mIZUyVz+UjF9+gdMcUMMDebdRd9
	U99j8Pn4rDB9TonqjfF6cBtFeHVbpmskW+yqIvGgVsjumQFnkzBYUWbIkbiRzu4SZRqpX6bUYTh
	yU2j3OK05MM41OwVxZnJLou6Dhc9gsO0ALE2BkOKBCP4G41mV/DSxUXMWOezemJVKYLhZIJ6opW
	0/398j5J7znHqeZcBMfHPj/Qi/Ml8QFbg4tLTdWIpOr4GoJmdlu6X8lhLuVD9VkfZAS1ECLkx80
	MLcFttfdBKYwmQo/jbutqeIT2pwipSbwzvDJTpv1kgJEDArsUPXdjnB48sWqjYUh9+QU
X-Received: by 2002:a17:903:22cb:b0:234:d679:72e9 with SMTP id d9443c01a7336-23ac3deb511mr18115785ad.12.1750982287288;
        Thu, 26 Jun 2025 16:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo/5Els0SzMCMXOuz0L1/2xCWiGHH5XGizb6luqjfXqNGfseG6+qU64+bbNHXwYwR+59IRow==
X-Received: by 2002:a17:903:22cb:b0:234:d679:72e9 with SMTP id d9443c01a7336-23ac3deb511mr18115485ad.12.1750982286950;
        Thu, 26 Jun 2025 16:58:06 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e21a7sm2344445ad.4.2025.06.26.16.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:58:06 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <e9ef9cb1-f202-4591-99f0-4451ca945f0b@redhat.com>
Date: Thu, 26 Jun 2025 19:58:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
 <aFwFUk2rWrikLbyA@localhost.localdomain>
Content-Language: en-US
In-Reply-To: <aFwFUk2rWrikLbyA@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/25 10:18 AM, Frederic Weisbecker wrote:
> Le Mon, Jun 23, 2025 at 01:34:58PM -0400, Waiman Long a écrit :
>> On 6/20/25 11:22 AM, Frederic Weisbecker wrote:
>>> The HK_TYPE_DOMAIN isolation cpumask, and further the
>>> HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
>>> future.
>>>
>>> The affected subsystems will need to synchronize against those cpumask
>>> changes so that:
>>>
>>> * The reader get a coherent snapshot
>>> * The housekeeping subsystem can safely propagate a cpumask update to
>>>     the susbsytems after it has been published.
>>>
>>> Protect against readsides that can sleep with per-cpu rwsem. Updates are
>>> expected to be very rare given that CPU isolation is a niche usecase and
>>> related cpuset setup happen only in preparation work. On the other hand
>>> read sides can occur in more frequent paths.
>>>
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>> Thanks for the patch series and it certainly has some good ideas. However I
>> am a bit concern about the overhead of using percpu-rwsem for
>> synchronization especially when the readers have to wait for the completion
>> on the writer side. From my point of view, during the transition period when
>> new isolated CPUs are being added or old ones being removed, the reader will
>> either get the old CPU data or the new one depending on the exact timing.
>> The effect the CPU selection may persist for a while after the end of the
>> critical section.
> It depends.
>
> 1) If the read side queues a work and wait for it
>    (case of work_on_cpu()), we can protect the whole under the same
>    sleeping lock and there is no persistance beyond.
>
> 2) But if the read side just queues some work or defines some cpumask
>     for future queue then there is persistance and some action must be
>     taken by housekeeping after the update to propagare the new cpumask
>     (flush pending works, etc...)

I don't mind doing actions to make sure that the cpumask is properly 
propagated after changing housekeeping cpumasks. I just don't want to 
introduce too much latency on the reader which could be a latency 
sensitive task running on an isolated CPU.

I would say it should be OK to have a grace period (reusing the RCU 
term) after changing the housekeeping cpumasks that tasks running on 
those CPUs that are affected by cpumask changes may or may not 
experience the full effect of the cpumask change. However, we should 
minimize the overhead of those tasks that run on CPUs unrelated to the 
cpumask change ASAP.

>> Can we just rely on RCU to make sure that it either get the new one or the
>> old one but nothing in between without the additional overhead?
> This is the case as well and it is covered by 2) above.
> The sleeping parts handled in 1) would require more thoughts.
>
>> My current thinking is to make use CPU hotplug to enable better CPU
>> isolation. IOW, I would shut down the affected CPUs, change the housekeeping
>> masks and then bring them back online again. That means the writer side will
>> take a while to complete.
> You mean that an isolated partition should only be set on offline CPUs ? That's
> the plan for nohz_full but it may be too late for domain isolation.

Actually I was talking mainly about nohz_full, but we should handle 
changes in HK_TYPE_DOMAIN cpumask the same way.

Cheers,
Longman


