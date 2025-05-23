Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168729899F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024061; cv=none; b=Gpv5WJxjO8OMQ9NIHO3HKRe8hrHz+ykf8amY4Lz8iO12yL0LXjguXZKzLNjjLBon4LMUDl/DlFJZXaJtXxT11g29GaJuFdKknVBEOhCuZn2Qsj5vaKvMh/0baRd3NLe86D/dDpIlM9Q3FQmUkPVdGBAsfTUEkHZu8BlOVJfKaok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024061; c=relaxed/simple;
	bh=RQB31qFVL6VtyYD/q8h3xheIj6fbkAcOVPAePkY2WOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBdnDKKz9MzDO3FI3VK/VT9OrrHUOjKX9OBHOtYxYUaJ28zNI4Fsft2hi9PoE6lPd1AnnOeZM5NSxq6NqxrCF4Dt4fmEOp32+UaSrkklHv+UygslQ3AqYrQXKZmW/5TL+0PYrkQl5fb+GjWUaM4HTa0EX/IvEDp75FFjTm3mvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUnjOVAH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUnjOVAH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30ec226b7d6so212361a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748024060; x=1748628860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kzFJW90w481Ie2sxBC9R+vr/rXdbG7y4vnmCcu5qDdw=;
        b=hUnjOVAHyi3c2Ru1NIGtHo1kqb1A8DMDRickptKeg6ZprWQFp4aE4q8bDN+ViUXQd8
         DiiSx9y8skwlbM+BkHfa8HGce5UaT+/CJ5RCY4ocwqZY8wDpansX5UgcPDLy3wxZWNaZ
         v5VnTXpRi/upuwyc8W4WsVhNdeHvVjG+FEh57z+iP5OL2GEntIX0oNR6GU+EKzwKqvdP
         kE+bTcZ/ZI8/BGtjrV1SgsgLXCTQdX3AHBfFAgoFLMXrLfJj1saMWyEr46JKQyDcxuyf
         GHo/gsVksyPhwkv693b0p5md0/2Jf+EEObc3lzTcrumGhyRnnSf01PDYfAqWHio/j9C0
         WuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024060; x=1748628860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzFJW90w481Ie2sxBC9R+vr/rXdbG7y4vnmCcu5qDdw=;
        b=Q8N67H+uvNV2HBbnkC7x6Yi5W/UMqpjdslzpd8H4Fp4yfpCu70M0atpOKgNU7BEb1I
         Bc7zQpwbMwkNI2+IVufZ0xKmnJp1BUwPXApO8DrVMdYXapGNA+DaAnET8v+fc/DVii1Y
         NBaAkipgORl4V/8mhTgt3A3syHbrHl+FNFdd3k98IeJZ4MOBBSGjSWaGeDG4rsKd8eCH
         ogV5pNHGSRKSP4dO4SqhZhsLn9+JszgkkaMjhVwxp3SVOnKjC2EsSji46N9iomXan69W
         S7b026ZSIcJ4MvcrgS9TjyHm890Dh7XNotH6Nm3Mc0hUnRuRIj4bhF/faKxFdQcZAAnm
         hpkg==
X-Forwarded-Encrypted: i=1; AJvYcCXFcfklR0h7zDWEj1UZgWjEHzevVOtUR95nJslb3NLT5qttLWi7XCcXwm4tyM10zPhKrMpuZbBx/vWXdhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JcWNRRSh0Z17/m7JfS07QoDS5mbEL0xJd6lnYFG0sHKQuCWj
	7u0iU3p2q3Yu0mZUVNnj0+Q5i4o5ix+b9cvHUgOAPtiQ/l4XbINNRpdZ
X-Gm-Gg: ASbGncu7EBnhyG14DhH4J47mCQd+bBC5XyWyNEjX71vdt63MZI4j/E08zTu2rHp2SZ4
	sxqZHaekXvm3+Pwez5HfRpxbumWcaUuy8sREEFwjkXczkT9D2XQq/yF7QT1zMCu8agC4acT4Osy
	9lA4NiMtbd7Y79MAIjdx2+HZA5/JluXe1ac5JrzGOi7VUYXnLDkn9h4As5gV6NuBb7NJ+/4cqWB
	Vwv2Pg2jfeuh2jJD5VI9UZLy04afKNPtS+8mSwIepCnTnNomGpVXz8/AJySwF60e9yVjK4tA1W7
	grYanEX5YCoxojiUOoz12Fb/JWqdhaJlvk5fEQSGUcUtX2pz5pF6YJD5x4NfHI5qSd5v99pkmsL
	KonA=
X-Google-Smtp-Source: AGHT+IHEb1qIm4dgm5SiPpsjIXRHMZuuOcVTFciAKrVULppe1jRjRhW46xCzA68xc84k6mE0xTyLOQ==
X-Received: by 2002:a17:90b:3851:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-3110f20df3amr126230a91.15.1748024059484;
        Fri, 23 May 2025 11:14:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365f49e9sm7638092a91.43.2025.05.23.11.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:14:18 -0700 (PDT)
Message-ID: <bc44f895-3df4-41c4-bf93-d56e6ed203f3@gmail.com>
Date: Fri, 23 May 2025 11:14:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: clear freecpu bit on detach
To: Juri Lelli <juri.lelli@redhat.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>
Cc: Doug Berger <opendmb@gmail.com>, linux-kernel@vger.kernel.org
References: <20250422194853.1636334-1-opendmb@gmail.com>
 <609e6fe5-2893-4c13-8e52-e9df05146ffb@gmail.com>
 <aBTCWPSXgu9cId6D@jlelli-thinkpadt14gen4.remote.csb>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <aBTCWPSXgu9cId6D@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Moving CC list to To

On 5/2/25 06:02, Juri Lelli wrote:
> Hi,
> 
> On 29/04/25 10:15, Florian Fainelli wrote:
>>
>>
>> On 4/22/2025 9:48 PM, Doug Berger wrote:
>>> There is a hazard in the deadline scheduler where an offlined CPU
>>> can have its free_cpus bit left set in the def_root_domain when
>>> the schedutil cpufreq governor is used. This can allow a deadline
>>> thread to be pushed to the runqueue of a powered down CPU which
>>> breaks scheduling. The details can be found here:
>>> https://lore.kernel.org/lkml/20250110233010.2339521-1-opendmb@gmail.com
>>>
>>> The free_cpus mask is expected to be cleared by set_rq_offline();
>>> however, the hazard occurs before the root domain is made online
>>> during CPU hotplug so that function is not invoked for the CPU
>>> that is being made active.
>>>
>>> This commit works around the issue by ensuring the free_cpus bit
>>> for a CPU is always cleared when the CPU is removed from a
>>> root_domain. This likely makes the call of cpudl_clear_freecpu()
>>> in rq_offline_dl() fully redundant, but I have not removed it
>>> here because I am not certain of all flows.
>>>
>>> It seems likely that a better solution is possible from someone
>>> more familiar with the scheduler implementation, but this
>>> approach is minimally invasive from someone who is not.
>>>
>>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>>> ---
>>
>> FWIW, we were able to reproduce this with the attached hotplug.sh script
>> which would just randomly hot plug/unplug CPUs (./hotplug.sh 4). Within a
>> few hundred of iterations you could see the lock up occur, it's unclear why
>> this has not been seen by more people.
>>
>> Since this is not the first posting or attempt at fixing this bug [1] and we
>> consider it to be a serious one, can this be reviewed/commented on/applied?
>> Thanks!
>>
>> [1]: https://lkml.org/lkml/2025/1/14/1687
> 
> So, going back to the initial report, the thing that makes me a bit
> uncomfortable with the suggested change is the worry that it might be
> plastering over a more fundamental issue. Not against it, though, and I
> really appreciate Doug's analysis and proposed fixes!
> 
> Doug wrote:
> 
> "Initially, CPU0 and CPU1 are active and CPU2 and CPU3 have been
> previously offlined so their runqueues are attached to the
> def_root_domain.
> 1) A hot plug is initiated on CPU2.
> 2) The cpuhp/2 thread invokes the cpufreq governor driver during
>     the CPUHP_AP_ONLINE_DYN step.
> 3) The sched util cpufreq governor creates the "sugov:2" thread to
>     execute on CPU2 with the deadline scheduler.
> 4) The deadline scheduler clears the free_cpus mask for CPU2 within
>     the def_root_domain when "sugov:2" is scheduled."
> 
> I wonder if it's OK to schedule sugov:2 on a CPU that didn't reach yet
> complete online state. Peter, others, what do you think?

Peter, can you please review this patch? Thank you
-- 
Florian

