Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC323A9A8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748967520; cv=none; b=d+sZG5rSEqnafXs3MKhgPdVhwDH68+HJbUIloq8240LlC90XVFc6oW1pex6dD9Djt8ZV0thw3IbwL7Vunkh6qwsY+Hoyog1MgfMWZQ3AGDc2DQOq1DDhMbQS3NK0LDx4iZMQ993vuT6or9Em1+ie7bH2woH7sjXGpS/BCDDhLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748967520; c=relaxed/simple;
	bh=xXzn8n6SjkZFIrve0wYkavDjXP6zha7Ayyb4UDk080M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzficzSWiORyufe9Q5YgJ8KC9Xy4GtjH7tigst2nc70EudegY4zVdD6K+X+UhCo2b+mr7CYmSd1yaI7wLSZJMD8r6SwGOo+R41O+3+1sw1Fm+c8RlhOWXvs6Iy9h+YsEm3Vjwz4X0eCM1WTRa5ag75U5NG2bQYxGZccrH/3B/Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXjUGV0l; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXjUGV0l"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso901515b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748967519; x=1749572319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U14LCfcUpm2KAnp+Xug9J67tPa+QMhvbA0SNkQos1Eo=;
        b=XXjUGV0lawcHwCHwPW9eAOHluOzLiGADTlLoesqbBCZwSG3DDM9Yu9pR2QW7uekUI4
         Cc26+XUYN4jm1VuYzpnyP4PC1FXi7mAAkWIGyi6ytXPsOBI7dGQkEvOPivR475GTWM95
         i8py/y9MaDT0fB3V4jolyhtbAMaHKItiKEj2xw85J80fNTjIlV0wACgalp7SFu0V4bSE
         nyALqnikwp04b1kcOtNiKe9hvOGg4wk/v/iiCogGHvL04GbekgKLfHJ6fjmjHZTghcC5
         mxkQiZbjxmgQ2jHSzLIqXb/bW/RsoFmfvrYINZErza+JUF8sPVkDhJ7Jmu97g1NYc5f9
         aA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748967519; x=1749572319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U14LCfcUpm2KAnp+Xug9J67tPa+QMhvbA0SNkQos1Eo=;
        b=OZJneLjsmrBlv/N3lj1TFGcwK8sXl+jLW0SRUOu1cWV31WxfdeD6fWoRvlWJNiTIUl
         YBgh7C/0PAZpBaXtH9GS5wJA0MrA3TAvMaJexR2Och6mfRXX7znpAq/PtzwyeFcEkSTL
         X83Jgz+HigriuUXHdhjs8/rg5uvlzCLtbZmh+CPLeDgSgW95THA2JlmDCHFLsL5zPfr+
         Ybe2X+HQm2jO7fH9UvVCFKAcwqcu0EXFOSAKplereG/R4VzLM+XII8ZIv2fQFXok5SKY
         mMGpTG/M0wlW1FP+rn124iXE7kPR4juRDTtREwdQMhuPWX5PyzpuilrUN0NxLtb1/iJC
         D0hg==
X-Forwarded-Encrypted: i=1; AJvYcCWPgiav7C/WdV95ePAZGvQkLtfbolOjGQU13KB7MzWz9JiWwvOT8j5apJljkl+ZtIdoNC9Tu1E8atJVJUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxstnJ3ZX1vSnO0W3/cFyFxnLxeUcHRe3aNsXCHp/mkFef5JrhS
	mZUKHnJQj6UQ3o7x0DXqB90Zj0pBSddm7o2o4e+4Dp9GuLwpeWxEaxz7QDCIjVM1
X-Gm-Gg: ASbGncufGZ+Sdam/I2rmDVU54msO9BvBU+mWG29cin+L60Jswv9/IJJBmXD9Ssa7wzm
	N61uaXvrly6OoupKC7PUEimDlYfwD2bGMmBTZ2nn7c8NX6LRwJ+o8drQ7MRJxiFQIJ9Bu+mb7Se
	/0Ki7on63m+KTzcEozO98zl2RfiuU0BUutiKYkF64qzcGkxYXqqx51cLlPaf6n4QAiZ0CjmasS9
	I/UKgfSLbRjPZvfMkxM5gIysoejZfmNGnVfgXkDl2aKwRmArMeMwtxX1SPVhXn259qaJsz8mjG0
	8Yf5Ewc1PTirpb2fmdp0OS7nxwW7zRkNy8uM/8Cn2RQy9DBT+LI0BeP05G/a/shWSHBmCCclVCg
	PaL3LSfW6Zc+1Gw==
X-Google-Smtp-Source: AGHT+IGROC+X1q8MY+K9hHPJRp7p0pfmCKgdZ8LlmUKlmOCafk3IkPSC3WddX+q+VqChCQzDgOS9ig==
X-Received: by 2002:a05:6a21:ad19:b0:21a:ee83:364 with SMTP id adf61e73a8af0-21aee830391mr13202601637.16.1748967518591;
        Tue, 03 Jun 2025 09:18:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb0c5d9sm6426726a12.8.2025.06.03.09.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 09:18:37 -0700 (PDT)
Message-ID: <d46f7efb-db0c-44a4-9d67-bbdc91994cf9@gmail.com>
Date: Tue, 3 Jun 2025 09:18:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: clear freecpu bit on detach
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
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <bc44f895-3df4-41c4-bf93-d56e6ed203f3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/23/25 11:14, Florian Fainelli wrote:
> Moving CC list to To
> 
> On 5/2/25 06:02, Juri Lelli wrote:
>> Hi,
>>
>> On 29/04/25 10:15, Florian Fainelli wrote:
>>>
>>>
>>> On 4/22/2025 9:48 PM, Doug Berger wrote:
>>>> There is a hazard in the deadline scheduler where an offlined CPU
>>>> can have its free_cpus bit left set in the def_root_domain when
>>>> the schedutil cpufreq governor is used. This can allow a deadline
>>>> thread to be pushed to the runqueue of a powered down CPU which
>>>> breaks scheduling. The details can be found here:
>>>> https://lore.kernel.org/lkml/20250110233010.2339521-1-opendmb@gmail.com
>>>>
>>>> The free_cpus mask is expected to be cleared by set_rq_offline();
>>>> however, the hazard occurs before the root domain is made online
>>>> during CPU hotplug so that function is not invoked for the CPU
>>>> that is being made active.
>>>>
>>>> This commit works around the issue by ensuring the free_cpus bit
>>>> for a CPU is always cleared when the CPU is removed from a
>>>> root_domain. This likely makes the call of cpudl_clear_freecpu()
>>>> in rq_offline_dl() fully redundant, but I have not removed it
>>>> here because I am not certain of all flows.
>>>>
>>>> It seems likely that a better solution is possible from someone
>>>> more familiar with the scheduler implementation, but this
>>>> approach is minimally invasive from someone who is not.
>>>>
>>>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>>>> ---
>>>
>>> FWIW, we were able to reproduce this with the attached hotplug.sh script
>>> which would just randomly hot plug/unplug CPUs (./hotplug.sh 4). 
>>> Within a
>>> few hundred of iterations you could see the lock up occur, it's 
>>> unclear why
>>> this has not been seen by more people.
>>>
>>> Since this is not the first posting or attempt at fixing this bug [1] 
>>> and we
>>> consider it to be a serious one, can this be reviewed/commented on/ 
>>> applied?
>>> Thanks!
>>>
>>> [1]: https://lkml.org/lkml/2025/1/14/1687
>>
>> So, going back to the initial report, the thing that makes me a bit
>> uncomfortable with the suggested change is the worry that it might be
>> plastering over a more fundamental issue. Not against it, though, and I
>> really appreciate Doug's analysis and proposed fixes!
>>
>> Doug wrote:
>>
>> "Initially, CPU0 and CPU1 are active and CPU2 and CPU3 have been
>> previously offlined so their runqueues are attached to the
>> def_root_domain.
>> 1) A hot plug is initiated on CPU2.
>> 2) The cpuhp/2 thread invokes the cpufreq governor driver during
>>     the CPUHP_AP_ONLINE_DYN step.
>> 3) The sched util cpufreq governor creates the "sugov:2" thread to
>>     execute on CPU2 with the deadline scheduler.
>> 4) The deadline scheduler clears the free_cpus mask for CPU2 within
>>     the def_root_domain when "sugov:2" is scheduled."
>>
>> I wonder if it's OK to schedule sugov:2 on a CPU that didn't reach yet
>> complete online state. Peter, others, what do you think?
> 
> Peter, can you please review this patch? Thank you

Ping? Can we get to some resolution on way or another here? Thanks
-- 
Florian
