Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C462367A2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628044; cv=none; b=jjABKnMRHx3WNxKYc3+MuS+rmoAr1o6AHHHR+XGFcEUnZqE9gf1hY3Zg0N9W4ASVd13BsJa4uSfPOZY+IxfH7BuRpFKaZaNwMoI3e1iE5OycpXjdMNLtzBlad5yEu9pw7+NeHFmxd14OMccWUHssTOKVghDPTD1dZ89WpzG/0J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628044; c=relaxed/simple;
	bh=sXDNCRNhxgLGCkvB2idqUAVZBG4oE4GauE/gW1k5+kw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gJDh/AmpyDh1g4cDJzvwEFtJVh0eFUXhInR+zFhtyxZOn7p1EOpBedGCYbwdgho7kNqs+6n++8TDtRZhVQbLUPBcna1reATzkdIdcJvcj/pvojknfzcOxUbs49stPd2uQgZVoTpCrrEboTbCQMha1TugklLNBia+Zct6Z4J+JVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=hDNWCM2P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="hDNWCM2P"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so19295725e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748628039; x=1749232839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sfOgb0GXZ2fiUDMdiIP+QYNVw+2V0LzFqkjVPX+nUPU=;
        b=hDNWCM2PHCUxIDwvFcGax41n1LN7hr3VtJosGBu15XgfGIPqHgyNiYTULADDjN6qwl
         kJG+VMVbwOlfzyA8XghiPAacVv8HgpilB3OqwNHIxgIwxQCXurKPEaoWYsnVB46tv45Y
         iPLglA/PphuE0pLnc0cBLRFt98jBxm1c9AbxU58k0aHRuXbs8yXGn0YKCZFWKDNscF9h
         XTO0KGuPTnndF9VjqrP5dHAwjQaA8xAjBRy8AO8NWRAi898hkJkuvpDicvMPiBkN6OWN
         Dbz5ma88MxcMeWXEgvD5S8IaIS0mRT1qFhHm2ejblWES80OP/Ny9ZXjZlUmHlmM2g2P2
         348Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748628039; x=1749232839;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sfOgb0GXZ2fiUDMdiIP+QYNVw+2V0LzFqkjVPX+nUPU=;
        b=hsiCmb4yVlMblR4qRKTdUp3uaywFDfiYNC9R6sqlHnXwOX9YOEzat6+x3T+S1pP7qA
         cy6HOGJXEwWzl9UHpFS4lkhkJxXnYy7aOa/1ar9g2L7Ix4Kc1HkNOmF9aSwPYJ4pqo0P
         LkYracVgXLe5OdlcApgUVCKQ4rbmiHZOxq62BmgmRNpDo6Gm2+Kb7wsDt7wo9GQ7+LMY
         Y0juCSjKJxq7/ObaLy7qVQDxwDdcxAQpZ4Zs8U8riM1WFYFMJVK6Ji4iCYSp1jRiiBLB
         3c8rM0BGnTpcwZSX2jnRfABTgxQE43rSHduSDIDTqVvzNPHB5st2EXHnBnDz3U1vfs8e
         31yA==
X-Forwarded-Encrypted: i=1; AJvYcCVqPS4VuGRJi+Wrds6W7cTzfz4b4iFqGmO2kvF3qMLRHPgv5A/6czkUG/m/4+xPDQvm2SENRmvA7GwBLhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+l4LLlNFdmm6xqqeUAk/YVVdaBv2zh24XIhvqtR4cunQp0tD
	Yokf2frBUy3cSt6EBLLbSnwLJlSyo9uZeCM/9xqXRLl3X0P5ArQu289UT54AkgqwQK8=
X-Gm-Gg: ASbGncsiqPUhqChWlGIwaBR9DcdxwOECKTTPV6+ozKgC9Md5jWGXNgcgQe4ND7USmpY
	FlpAaaniglS5VpmqaylWYDVEjZHbaIwnOggxVzDAsHJ9QivoZf696pQl5wkNsy3FTzLSNKY0MKI
	s8FMep7mlekY9C/7KrupwNlrAkpMNPQwkvctSgZiRJJAoWU/YGS72zSlg4UZD5Y7oeqIcCiKpqW
	m3SH8Z7KSL4Z6CaUmOBb0MmLFGEWbrBhHtFaTvcMzOj017vwFu+W4KnraIaZNOCepqNlzh+bXiU
	5xXvhNXdF4iA6HSoVmhD5ag+uGIO0vPbXby7YwYMu8o9nKN3GjT5mdcZ/n9x6+Egdd3zFeucdhF
	9VIHOZngXn2Er51jqCzHCS1HuaPQ=
X-Google-Smtp-Source: AGHT+IHXHQ4bqlYkTL7CIto93dm/2yvBnrzk9B5Lds28V5BUxiyn8ieQpjGMbmoQkvdBXKTRs/X/Tg==
X-Received: by 2002:a05:600c:1ca0:b0:450:d204:34ca with SMTP id 5b1f17b1804b1-450d65441d7mr47622375e9.18.1748628039089;
        Fri, 30 May 2025 11:00:39 -0700 (PDT)
Received: from ?IPV6:2a02:830a:8903:6d00:5e33:5b6f:e74a:71ec? ([2a02:830a:8903:6d00:5e33:5b6f:e74a:71ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009752esm5396309f8f.74.2025.05.30.11.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 11:00:38 -0700 (PDT)
From: Giovanni Gherdovich <giovanni.gherdovich@suse.com>
X-Google-Original-From: Giovanni Gherdovich <ggherdovich@suse.com>
Message-ID: <805e1a14-7f07-47f0-ba86-f326e4ecea01@suse.com>
Date: Fri, 30 May 2025 20:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2025-37832: cpufreq: sun50i: prevent out-of-bounds access
To: Greg KH <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>
References: <2025050824-CVE-2025-37832-e235@gregkh>
 <1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>
 <2025053006-multitask-profanity-3590@gregkh>
 <2025053010-legible-destiny-23d3@gregkh>
Content-Language: en-US
In-Reply-To: <2025053010-legible-destiny-23d3@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Fri May 30, 2025 16:15, Greg KH wrote:
> On Fri, May 30, 2025 at 04:14:51PM +0200, Greg KH wrote:
>> On Fri, May 30, 2025 at 03:57:35PM +0200, Giovanni Gherdovich wrote:
>>> On Thu May 8, 2025 08:39, Greg Kroah-Hartman wrote:
>>>> A KASAN enabled kernel reports an out-of-bounds access when handling the
>>>> nvmem cell in the sun50i cpufreq driver:
>>>> [...]
>>>
>>> The invalid data that may be read comes from a ROM in the SoC,
>>> programmed by the vendor, and is only used to configure CPU frequency
>>> and voltage in the cpufreq framework.
>>>
>>> Even assuming that improper frequency/voltage settings constitute a
>>> security risk, writing to the ROM in question is at least a privileged
>>> operation, and may require physical access to the SoC.
>>
>> Obviously there are systems out there that have this issue, with device
>> trees that can trigger this issue, this isn't a matter of "malicious ROM
>> doing bad things" type of issue, it's a "the DT can't express this
>> properly, so we might have taken data from the hardware and handled it
>> in the wrong way" type of issue.
>>
>>> I don't think this qualifies as vulnerability.
>>
>> I don't see how this is a ROM configuration issue, but rather just a
>> kernel bug in how the hardware is accessed on different types of systems
>> where we previously could not handle such accesses correctly.

Thanks for clarifying this aspect. I'll move to a different objection,
which is that the incorrect power management configuration that may
result from this bug doesn't constitute a security vulnerability.
It seems to me the CPU won't run at the intended clock, which is
definitely a bug but not a CVE.

I'm CC'ing the change author and the subsystem maintainers to hear their
opinion.

> Note, if the maintainer or the developer of the change in question here
> disagrees with me, great, we'll be glad to revoke this CVE, as we defer
> to them.  But for some reason you didn't include them in this thread :(

Sure, you're right, I forgot to include them, fixed now.

Yangtao Li, Rafael, Viresh, Andre:
I'm asking Greg and the kernel CNA to reconsider the assignment of CVE
status to the bug fixed by 14c8a418159e541d70dbf8fc71225d1623beaf0f
("cpufreq: sun50i: prevent out-of-bounds access").
You can find the CVE announcement email at
https://lore.kernel.org/linux-cve-announce/2025050824-CVE-2025-37832-e235@gregkh/

If any of you thinks the status of CVE is well justified in this case,
I'd appreciated if you could reply here, so I can make a mental note
for similar future cases.

Thanks,
Giovanni
