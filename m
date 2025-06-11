Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E791779B8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749672387; cv=none; b=IJ4shZ8QjXcAOpei7Wc/3vQNCBeq8IE4vUIcuZw3/SuhTKW0R+trFUmhMPFwZt9iHdl+6rzd7bjPwe+Z4WiLD13D152yNxsAlbNLBO7WKo/23ALeJpTf2enoj6YGtru1KHg/2tdzooZ7QgrkRZw4RQBon/CGa04AbXmzs4ItHBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749672387; c=relaxed/simple;
	bh=zLzuwCQy0sqvKo6xxihGDD/ronVLRGYRZGFH+xpjo1Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Srl1hwCFn/Su7JmaR7i/DoMf4qhxL0WTmZhaIegBu5kGHWWjM81bC6YUmSfixXXRsZMTgZXO+3ru3snAWAW0V4VBTG1A2MyS/B3dicoN6mj9ospWWjIAfhAWJUxLy2DwGHuRihGyl36BRPickW0J+jKZe9MoKlMWkpC7r/aZtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVT557Wy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVT557Wy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fc7506d4so338343b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749672385; x=1750277185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn+P+FSbbX0BVu2Zaip/uDTNA8o9dJ4FK0R4uAOSFes=;
        b=hVT557Wy7UriICbHdGPYe/NYhpwFxbhSu3mdN7/9mHg6RQ37eM48ToWW8SIuZm02a7
         m56HaQocGemg1cBaQHQZwExF6I9PMAhRuKBL+fZi9wh8eTbsmcnboBMveY4L+00MKe2z
         Ve9chya4WrGmHIs4eJdcNVwIPSz7NH+5zMO8s8PesdyW7OjEDdxO4zwJc811CgMoIZwd
         ckj6n2c7PDV11ivnP9o/ym6/gVWHAo85mTHBLiky61RFQUZDLKdN27PDTTgGBqX29GCv
         RoP08ksIOCM00uOrlPTtny6rrZj9lIWutsua2tlhVDrlbQZSuJWvmfZPMdFjYQaswPUx
         kNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749672385; x=1750277185;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yn+P+FSbbX0BVu2Zaip/uDTNA8o9dJ4FK0R4uAOSFes=;
        b=HYI+6cWYNijx69HkcKoIrjpXlGNpYWehtkNIJ7U3MnL+XG6uyOdpm8HSDTL7w9IAQo
         K/Tz7oQnNuqp4dWi/xknRF9hqXVBR6mXaykIUWD2M5vMD6YoJPtkBUssPquhP6fJgwIT
         NpL9XXxyyW3tUTbYMcxnm3V6FJOMlRSxW29GEoXxnz1hQCu7xOMdpuydR9ojrm/KEPoD
         6EoY2UGrxvvjwkv94dxA1Od4UMwboHXspuGI3s8XfwahCGBXgWZ3Xw5IFEUkgAelFQeT
         v5ApJyI603v/awtgrEqdmvgHy77VTc7r6yIMLHYLgVNuhE40KW9VjokqBHK1wEJgcDXn
         iiVw==
X-Forwarded-Encrypted: i=1; AJvYcCUJyqHFAmmk/f1YYzkgUqp3zJRZEGtGzOUK96K4fUfa2asbZPyR7Xh+W5IeDNcZjdQAGkJGh3L3ZJToxq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzGxn1GbeZUCgPsQp839qg0+aRlK+8GOMS1lWr7HmL3tBLzQVb
	K8/yJQq/lRFiMOTjRUtxWk5EwU3gR+yHdiqTFEcNB0Z5Sd3O2cIaQxmF
X-Gm-Gg: ASbGncvQFVRrk0n/PioHHX1zxhbcbEm7/dqIO5MALkdnBvFWWqwHQysYD83S6xBSrhn
	YtZAcZubj/M8WKETU9gDmB6mGg+im45nnZQwT3myq1creYc+g4OoZQDhLGSV4ZSLhTGO6JDvI7M
	8b5XAF2GzmaiWK6gXm1QM85OJ6BXivoGVzx7V270ogDPIrKTvu/ZcJgE1wS7UgZNSmRpdVxR/L1
	v28PIVp9KBsfnIpA6rTBUEvRGdTGhbJ/NMSr8/gkUWvpDCgUpkXp/+AZeTdZsfSbMlaCmmTscKv
	SmVw0aerv8gVHVyruaK14zlSQApWDTWEm/55yRYW35ipc+OzPPHgpiBzVMEj1DuunSrpg4e0Oax
	SnCXEO2zo7r3aFXGeWeOv6Npx
X-Google-Smtp-Source: AGHT+IF4uvQA7uBjUaYXWNtkUgF28lsjwPAfHq7zgwktz2clGL8gkEZZOCA/vFhZmlFMa1nw/ZcbYg==
X-Received: by 2002:a05:6a00:3c8e:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-7487e2f46bdmr438745b3a.20.1749672385029;
        Wed, 11 Jun 2025 13:06:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c7db7sm9924706b3a.138.2025.06.11.13.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:06:24 -0700 (PDT)
Message-ID: <3a24b5bd-6d78-46ee-8410-9e50c5d313ff@gmail.com>
Date: Wed, 11 Jun 2025 13:06:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: clear freecpu bit on detach
From: Florian Fainelli <f.fainelli@gmail.com>
To: Juri Lelli <juri.lelli@redhat.com>, Ingo Molnar <mingo@redhat.com>,
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
 <bc44f895-3df4-41c4-bf93-d56e6ed203f3@gmail.com>
 <d46f7efb-db0c-44a4-9d67-bbdc91994cf9@gmail.com>
Content-Language: en-US
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
X-Priority: 1 (Highest)
In-Reply-To: <d46f7efb-db0c-44a4-9d67-bbdc91994cf9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/25 09:18, Florian Fainelli wrote:
> On 5/23/25 11:14, Florian Fainelli wrote:
>> Moving CC list to To
>>
>> On 5/2/25 06:02, Juri Lelli wrote:
>>> Hi,
>>>
>>> On 29/04/25 10:15, Florian Fainelli wrote:
>>>>
>>>>
>>>> On 4/22/2025 9:48 PM, Doug Berger wrote:
>>>>> There is a hazard in the deadline scheduler where an offlined CPU
>>>>> can have its free_cpus bit left set in the def_root_domain when
>>>>> the schedutil cpufreq governor is used. This can allow a deadline
>>>>> thread to be pushed to the runqueue of a powered down CPU which
>>>>> breaks scheduling. The details can be found here:
>>>>> https://lore.kernel.org/lkml/20250110233010.2339521-1- 
>>>>> opendmb@gmail.com
>>>>>
>>>>> The free_cpus mask is expected to be cleared by set_rq_offline();
>>>>> however, the hazard occurs before the root domain is made online
>>>>> during CPU hotplug so that function is not invoked for the CPU
>>>>> that is being made active.
>>>>>
>>>>> This commit works around the issue by ensuring the free_cpus bit
>>>>> for a CPU is always cleared when the CPU is removed from a
>>>>> root_domain. This likely makes the call of cpudl_clear_freecpu()
>>>>> in rq_offline_dl() fully redundant, but I have not removed it
>>>>> here because I am not certain of all flows.
>>>>>
>>>>> It seems likely that a better solution is possible from someone
>>>>> more familiar with the scheduler implementation, but this
>>>>> approach is minimally invasive from someone who is not.
>>>>>
>>>>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>>>>> ---
>>>>
>>>> FWIW, we were able to reproduce this with the attached hotplug.sh 
>>>> script
>>>> which would just randomly hot plug/unplug CPUs (./hotplug.sh 4). 
>>>> Within a
>>>> few hundred of iterations you could see the lock up occur, it's 
>>>> unclear why
>>>> this has not been seen by more people.
>>>>
>>>> Since this is not the first posting or attempt at fixing this bug 
>>>> [1] and we
>>>> consider it to be a serious one, can this be reviewed/commented on/ 
>>>> applied?
>>>> Thanks!
>>>>
>>>> [1]: https://lkml.org/lkml/2025/1/14/1687
>>>
>>> So, going back to the initial report, the thing that makes me a bit
>>> uncomfortable with the suggested change is the worry that it might be
>>> plastering over a more fundamental issue. Not against it, though, and I
>>> really appreciate Doug's analysis and proposed fixes!
>>>
>>> Doug wrote:
>>>
>>> "Initially, CPU0 and CPU1 are active and CPU2 and CPU3 have been
>>> previously offlined so their runqueues are attached to the
>>> def_root_domain.
>>> 1) A hot plug is initiated on CPU2.
>>> 2) The cpuhp/2 thread invokes the cpufreq governor driver during
>>>     the CPUHP_AP_ONLINE_DYN step.
>>> 3) The sched util cpufreq governor creates the "sugov:2" thread to
>>>     execute on CPU2 with the deadline scheduler.
>>> 4) The deadline scheduler clears the free_cpus mask for CPU2 within
>>>     the def_root_domain when "sugov:2" is scheduled."
>>>
>>> I wonder if it's OK to schedule sugov:2 on a CPU that didn't reach yet
>>> complete online state. Peter, others, what do you think?
>>
>> Peter, can you please review this patch? Thank you
> 
> Ping? Can we get to some resolution on way or another here? Thanks

Peter, can you please review this patch or ask questions or anything in 
case something is not clear?

This is currently preventing our systems using the schedutil cpufreq 
governor from being able to pass a few hundred CPU hotplug cycles before 
getting a hang.

Thank you!
-- 
Florian
