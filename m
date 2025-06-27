Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3292F3234
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750983121; cv=none; b=eje5KSYvqN3RxCUiuo1ZdmXA2cfI4uVwiE1gUTwgiT2onHW5yToq7mgcoGsHeN4pTZJcPBLfqTi59oQYB/eku4lKOvKRbZ1jdSmnH+1LxrZkyOdE4lP9LpcqgqoJYW5aTN1aY2k7/viCvAbSufQ0xeOdBwzfn0NjspSNEVUAKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750983121; c=relaxed/simple;
	bh=AfuA1Q4dGW/R/LmUZ6GkNdE8h//0/AIDkbN+a8Ve9nE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JHV9BYv3T2WTo3IiHmrVAAxG5vP9Ju+roo0wJNbq9rKMIw7mstl+CKvAPExgOd3LEDnsfE7qsL1OWN/eLtBcLYTir0xd9JRVwgwBmS8aFbpEb1Ys+7XFRxpzKTsAT+d2Cw8kmkh7enkYV3zpZRZ7Wa2HwqIk0X7K1GETwZkB3WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZcBJiqI0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZcBJiqI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750983119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDHugx8Wa0UzYJ/GA4AZ0RcTmsVFGQY+Se/1LaUcEqs=;
	b=ZcBJiqI0nwra7BZ9GEYme9wCUrYxfdY8sXZtDZ5OA+uu1y0iTRRaYH7TCHq+LW4CVSzO/P
	VnUC2PGWqZ9S9OCBTxA/4HagfDlzbaUpvEqidMKx1fVrJZKroe2cFYHrY9nLUSaBnbQ9ZG
	dAjLY1kpmTJQlJgpD9uiLeSusf+GOv0=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-YuyVYs2qPem3Qds_P_ASLg-1; Thu, 26 Jun 2025 20:11:57 -0400
X-MC-Unique: YuyVYs2qPem3Qds_P_ASLg-1
X-Mimecast-MFC-AGG-ID: YuyVYs2qPem3Qds_P_ASLg_1750983117
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23536f7c2d7so24789195ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750983117; x=1751587917;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDHugx8Wa0UzYJ/GA4AZ0RcTmsVFGQY+Se/1LaUcEqs=;
        b=vKsfKi2paIVaiBA+wBvVARaEjJlkIsFlaC8eUW7Is0C2N/cTN3ZGlc5a31ePnI6cYG
         oUrC9f9jSJZ8RvGqmHtoTj4/lJ/XG/UgIoA430uOa//IzidZcECUWHOMQVT+9mMZDaCY
         d8KwD6RjX8q7d6z3W6113VTIP5+bekIcunWkNdeOxrUp0Vu8C4zvczRvpdN8g1v18302
         dCarpWbmT4BzWTh+ZRXxNkma1iny/2/FaxyW/2fZBw3xg+K6dFGl9BWdnLna8N9MgR3S
         xATJYCvpMGl7OKIgWI9hJZsVmwrcwbP7nkz1GypT0VyTbUQ4aJOpgGlg7+TmlQGbm1zG
         Tjmw==
X-Forwarded-Encrypted: i=1; AJvYcCUA4ZmpzC6kpFMcIixjml0mP/IO0qMCuRm/vjVAj/kzvt5NLc3RQ1UgHxoL+yNyhPDtZ4tSm30TveHt010=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTDYDEGBARvjV0cl3ksf0nNY7g/1J6uFnhRLteS/bIo7aCteJq
	yTHEhTi8QVlnih/BiL3LoxF7U3Wt+Vy2+jY2jX1q+Y81FMk3IDHgESl2Npsnpb3OXTKe/RwLY13
	s6k//eIfjVaywvxE4F76kECv3RwAb08xqNnrmE4mwKuGfvbXvYmNT1Q2IstULFcc/pA==
X-Gm-Gg: ASbGncsNHumVsRhGUancVvMgT0iL86Tho9wW3mS/8S8nd5tcK+DDy+xCO2CKtm7Ccow
	pGaV+TcH4K4TzxZIyNrXlBKQeFF7awT/ei6M7boJqKB0Ohm3+sJUoZf7tSV3tjUJz7KIwBIWBMZ
	jgGhVqC3BhpkyFKbAjNpwPjJa8SU8Sx22n+EsIEl5ziHrtLiYQXlEN1z5EnWwVZiGjH0WdG66PT
	VZHZOfC1FAsJPGnZVpkwbb0/8hLZ82TYNLvZ2U3qPTJWG9/vUOuzaXN/7hBqxiVrkkdIyd+gugV
	MP12wbLFXOaXKpT8EFH8r0KcJfkM+7KPuU7b0FtSH39jTCdpP1Ol7y+CZhYtpPv33FRj
X-Received: by 2002:a17:903:f8c:b0:234:b123:b4ff with SMTP id d9443c01a7336-23ac45c1c84mr15752435ad.21.1750983116787;
        Thu, 26 Jun 2025 17:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQqDn7AQvFlJHqTfJzSWTr9Jz9pgORHBaAe871Av2pUzBCUnRY6E9Tr0X4OTANhkUrVWw6Iw==
X-Received: by 2002:a17:903:f8c:b0:234:b123:b4ff with SMTP id d9443c01a7336-23ac45c1c84mr15752195ad.21.1750983116422;
        Thu, 26 Jun 2025 17:11:56 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b0052sm2188785ad.158.2025.06.26.17.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 17:11:55 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c205b6a8-89ee-424e-ac83-94584d59a449@redhat.com>
Date: Thu, 26 Jun 2025 20:11:54 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
To: Phil Auld <pauld@redhat.com>, Frederic Weisbecker <frederic@kernel.org>
Cc: Waiman Long <llong@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
 <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
 <20250625121850.GA57862@pauld.westford.csb>
 <aFwI6sCtObAGoMBt@localhost.localdomain>
 <20250625155017.GC57862@pauld.westford.csb>
Content-Language: en-US
In-Reply-To: <20250625155017.GC57862@pauld.westford.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/25 11:50 AM, Phil Auld wrote:
> On Wed, Jun 25, 2025 at 04:34:18PM +0200 Frederic Weisbecker wrote:
>> Le Wed, Jun 25, 2025 at 08:18:50AM -0400, Phil Auld a écrit :
>>> Hi Waiman,
>>>
>>> On Mon, Jun 23, 2025 at 01:34:58PM -0400 Waiman Long wrote:
>>>> On 6/20/25 11:22 AM, Frederic Weisbecker wrote:
>>>>> The HK_TYPE_DOMAIN isolation cpumask, and further the
>>>>> HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
>>>>> future.
>>>>>
>>>>> The affected subsystems will need to synchronize against those cpumask
>>>>> changes so that:
>>>>>
>>>>> * The reader get a coherent snapshot
>>>>> * The housekeeping subsystem can safely propagate a cpumask update to
>>>>>     the susbsytems after it has been published.
>>>>>
>>>>> Protect against readsides that can sleep with per-cpu rwsem. Updates are
>>>>> expected to be very rare given that CPU isolation is a niche usecase and
>>>>> related cpuset setup happen only in preparation work. On the other hand
>>>>> read sides can occur in more frequent paths.
>>>>>
>>>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>>> Thanks for the patch series and it certainly has some good ideas. However I
>>>> am a bit concern about the overhead of using percpu-rwsem for
>>>> synchronization especially when the readers have to wait for the completion
>>>> on the writer side. From my point of view, during the transition period when
>>>> new isolated CPUs are being added or old ones being removed, the reader will
>>>> either get the old CPU data or the new one depending on the exact timing.
>>>> The effect the CPU selection may persist for a while after the end of the
>>>> critical section.
>>>>
>>>> Can we just rely on RCU to make sure that it either get the new one or the
>>>> old one but nothing in between without the additional overhead?
>>>>
>>>> My current thinking is to make use CPU hotplug to enable better CPU
>>>> isolation. IOW, I would shut down the affected CPUs, change the housekeeping
>>>> masks and then bring them back online again. That means the writer side will
>>>> take a while to complete.
>>> The problem with this approach is that offlining a cpu effects all the other
>>> cpus and causes latency spikes on other low latency tasks which may already be
>>> running on other parts of the system.
>>>
>>> I just don't want us to finally get to dynamic isolation and have it not
>>> usable for the usecases asking for it.
>> We'll have to discuss that eventually because that's the plan for nohz_full.
>> We can work around the stop machine rendez-vous on nohz_full if that's the
>> problem. If the issue is not to interrupt common RT-tasks, then that's a
>> different problem for which I don't have a solution.
>>
> My understanding is that it's the stop machine issue. If you have a way
> around that then great!

My current thinking is to just run a selected set of CPUHP teardown and 
startup methods relevant to housekeeping cpumasks usage without calling 
the full set from CPUHP_ONLINE to CPUHP_OFFLINE. I don't know if it is 
possible or not or how much additional changes will be needed to make 
that possible. That will skip the CPUHP_TEARDOWN_CPU teardown method 
that is likely the cause of most the latency spike experienced by other 
CPUs.

Cheers,
Longman

