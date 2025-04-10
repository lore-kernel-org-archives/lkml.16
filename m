Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890D416FF44
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296647; cv=none; b=DePShcp5Z1p1cWylC3ASiB5bADMPmy/mXtc8+Hs3S4pQszM1UVjvQ4tjwMZ7BDytTDg6pDEwX7pRJ/x8hcYvcbDWae6O47HvvptZ6mI4GaODWj58W8lyHpJ5SrEDKqR964PXxfd/cXgTwyuY87TKzESnp1DQ5t+qq5G9WEVymtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296647; c=relaxed/simple;
	bh=68ODpyPpeUavUH0aVpwC1OsK+oojrXZM/EEzBNWEbTI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s+xwVIwz55QVtYG0V+/+8O5aVvIz70f2ugn3LMZXkRgxk7rxWHuHt+zKLUdYegWmcFfOS9wS8KxtoDfhJuSQm2rZs4dL03/s9JLndzxJ2pfmzVkqy9Y1M/RlY1HMVirLY4A1R3Jzg3qDvXYLQgnqMZCLudFmI7me06pJE0qGZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bgZdegMi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bgZdegMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744296643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeMtIO8B5kYF8BvgfwbClULPfr2L3LVch9JRVHbKge0=;
	b=bgZdegMiyqWUfZpMkaH6gkyla+iHyDodBLkrju+KeI9+8lOq06plFy6MBetM1XmYgjaFep
	NzKnrsE8ZlaVpK9RqvXQSsSDa4Ki0lCmD+G5y0Ji25ueJQrEMH/b7CC+iNAPj2k79t7wJv
	qdNp1LTH5KazmMOwhpR1IS3aE9TiSnM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-m133qv5JMMi_7FchOU1I5w-1; Thu, 10 Apr 2025 10:50:42 -0400
X-MC-Unique: m133qv5JMMi_7FchOU1I5w-1
X-Mimecast-MFC-AGG-ID: m133qv5JMMi_7FchOU1I5w_1744296642
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f4367446so9188506d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296641; x=1744901441;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EeMtIO8B5kYF8BvgfwbClULPfr2L3LVch9JRVHbKge0=;
        b=oS5x3SG/dh7sS9RTBkraesZqIl1hkO5/xBNdd7xhPQN3GiMBPF+zvPp834/Aulm03c
         lpFsDyWrn5xVUC8lq69Hf062yRfzAIUu5v3Nav7eI1AQavftJYdyvOgDhknNGOz+MKK4
         UcjScr714SmFTbHrlz5+1hX0OZ425WmsMuEkLC2rsW+IgvlUlJsKkoCi4vSdUMg2yHiO
         V5XQLE+JF/C2H3u+l/7+h0fuqSe8v3nl5L8y1Cjj8u6h1ScQeUkxsVl3SWuZD8aj7F5o
         b2kUlUa7OABLcyb0HxKYE0daVpkhqMPvKOeo8vYwEL5LGckThqmpjhFUAvjc6l5U5cwf
         wEFw==
X-Forwarded-Encrypted: i=1; AJvYcCXSbggtvwzCo1znz/u2wHHyBaGiXYSG4IiHE2+HxUHps9PjQylzX4h9qQtuIMo8bYjzfJzf+k14Bdh1IAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2pSABZPX3bs4ZaJY84AtPIldEB251NSboWIGDKhgwfqC7QuO9
	DqUrmqvrohO8xLUymCaH5usC2etUCsF/YjFKkR+QdxjWpOU/Ko7TG04DLp7EvXmHGGPwJN5wloK
	SMxGKfOIN4ZcZh8w/twPtFUOmHK0tLBUmt7DVyeCM0/KXI1n/giObwSiDexBGyk2VaEQrqg==
X-Gm-Gg: ASbGnct8oZHnkz0JnMWMv1m5OcMxETHoXNE6io5WXOUBH+osDJYTyZgFkauYrSQRWHo
	lMF5kGXB9SZWDjR4UVsiRicORse6ui2FLgLtIdNV5BR1VYuDnpP7nFAGae07WCl/ZwCqF9MBiZY
	fn5L6wv6nH6R7yx1zEaB8lBjpoE62581vh6XQ6zQpulQnrAzG8WO3f5xvDDZP7YWoIOCwKjVeVh
	+3kgResLU5rPQ4x4my86JlMgZREOnsdsxQTS+onEajgHqEI3PHTOiCB5dDK7QHUspCLTV3p0wYv
	p3bGvhCYqMeJDDFaDBXnDK6xw4x/1C2bAktCvcwdOXcv/ucowCSuic0ksw==
X-Received: by 2002:ad4:5c8c:0:b0:6e6:6c7f:111a with SMTP id 6a1803df08f44-6f0e77c1ea5mr31925846d6.40.1744296641291;
        Thu, 10 Apr 2025 07:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYCHJaRRelUsjHecM7kFULtH6jx2CCV3cVzNWjrXk4A/aCl0aCValzVi72H1vO3OBv1qZbFw==
X-Received: by 2002:ad4:5c8c:0:b0:6e6:6c7f:111a with SMTP id 6a1803df08f44-6f0e77c1ea5mr31925636d6.40.1744296640980;
        Thu, 10 Apr 2025 07:50:40 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de95f701sm22144476d6.9.2025.04.10.07.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:50:40 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a2d6f50e-8f65-4586-b7df-20609bdc111e@redhat.com>
Date: Thu, 10 Apr 2025 10:50:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250410065446.57304-2-gmonaco@redhat.com> <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <77988036-7550-4ee2-a738-9f9bd4417001@redhat.com>
 <Z_fZJfgwzpz_ccny@localhost.localdomain>
Content-Language: en-US
In-Reply-To: <Z_fZJfgwzpz_ccny@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/10/25 10:43 AM, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 10:35:55AM -0400, Waiman Long a écrit :
>> On 4/10/25 9:03 AM, Frederic Weisbecker wrote:
>>> Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a écrit :
>>>> On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
>>>>> How can that happen? There is always at least _ONE_ housekeeping,
>>>>> non-isolated, CPU online, no?
>>>>>
>>>> In my understanding it shouldn't, but I'm not sure there's anything
>>>> preventing the user from isolating everything via cpuset.
>>>> Anyway that's something no one in their mind should do, so I guess I'd
>>>> just opt for the cpumask_first (or actually cpumask_any, like before
>>>> the change).
>>> With "nohz_full=..." or "isolcpus=nohz,..." there is always at least one
>>> housekeeping CPU. But with isolcpus=[domain] or cpusets equivalents
>>> (v1 cpuset.sched_load_balance, v2 isolated partion) there is nothing that
>>> prevents all CPUs from being isolated.
>> Actually v2 won't allow users to isolate all the CPUs. Users can probably do
>> that with v1's cpuset.sched_load_balance.
> Perhaps, and I think isolcpus= can too.

No, I don't think so. The following code is in kernel/sched/isolation.c:

first_cpu = cpumask_first_and(cpu_present_mask, housekeeping_staging); 
if (first_cpu >= nr_cpu_ids || first_cpu >= setup_max_cpus) { 
__cpumask_set_cpu(smp_processor_id(), housekeeping_staging); 
__cpumask_clear_cpu(smp_processor_id(), non_housekeeping_mask); if 
(!housekeeping.flags) { pr_warn("Housekeeping: must include one present 
CPU, " "using boot CPU:%d\n", smp_processor_id()); } }

Cheers, Longman

