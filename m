Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CC525F794
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967816; cv=none; b=Ena1ARvwOWeA8gVjIp92Iysua/b3xoxy9Sv2VjYmejabCRQ9A22/TieLvNDx0DpCdIPalty9Z9j737gwO7ZMsc5IMuJtMrullzKJT4OMuio1TseyY+fgmoJyTh0bkFli25hprX3aUIWXrcNrDimQ3W8e84h/012ff4peYyNUmLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967816; c=relaxed/simple;
	bh=WrTIC4Zu7w2DdsEvhxy1DYKPPbfJNE6tRFl78OegCRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1ajIHgMY82mplGhHexdsIEVL74mBlAt5nOjKsKj4YdTBOgd0cMPOwyPK/b9J8Dfu3vjTcXHq9rFOaNwUESZseyxfsouo/63kVUCmuz2KtSqYun6gLD051ZWIv9nCMmKdms9TWImq3Nj4my6bKoC3Wbld5vUzlTzC5rUyKlQvWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=LlD/zErv; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="LlD/zErv"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-72c3b863b8eso5142913a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1745967813; x=1746572613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4h2Zx2ZJ3PJJWUHECtRl2VVxFz3+sw1JZ9JfZPVtSQ=;
        b=LlD/zErvTsf+PGa5crn8cmTs0o6rnHg55J5oYW2It7WPtGl4NXrRsbu8UfVgeMhS1b
         eusUU6I3R8/L3INJ4TPj9tTUAWZjaB4MfF15c0HlL6eiIEjXj7yftv5PlvGbxsNyKa++
         9TirRu7jU8VgaD9MzJbLZF9UvHPwYhRjnA68Qa6gcG8tftvnCD5VumflL+uh42i2U0gO
         8R8a6chVTtjiRC1E22dMxLD+D0Sw0q2IKoxaQu4dmvUdMlb8rTAMDPJYpY5QhGe7CMmo
         0VKxZ5MiwYWN5jUMzzFZRjbNR8J6ICP9xSa96MBAcgW5P/tdu3leJ/rxnywKVbA/xszR
         srbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745967813; x=1746572613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4h2Zx2ZJ3PJJWUHECtRl2VVxFz3+sw1JZ9JfZPVtSQ=;
        b=MpZsx2fm3Y8Sc8zsTDJxjP8IVYtBjV5mHBfobxYnEuQDRP7/68r/WiPRH9QzO/Ywbm
         /oVq4FHGkHuIfe9CGRmrbBwq0Vvf9gRyD1qIKUiqzezmkDvlQwYzrSZOG2y/6OOPbjrl
         qriAF8G4JPc0d/xIgBcNQs5V1tLtoAmLS4kHE43FS9yDbIZS8mN2H7ua20uJxJci4N+u
         ekY4CWwy3nvV5YadMlHBZg9ugKknBFyVOxaqXfk06dnNQV6UL/PT261ZTnhXh8lQF9Fv
         BFr+XD9EoXmAVrVxGMraDQMHwGHb4yf09PXcFttjHU4KbTPABQ4NpM4idRgjatDZTtt+
         hwQA==
X-Forwarded-Encrypted: i=1; AJvYcCUMG9f8w9eSKM6jdndOIn22II5Q17IGy1j9lDDewSjdBtBCWlGqO7cz7MlQDRSNSQSRtNTyNUU7g/6b99Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiaxAX6if1c3gH3DDp6XBZPv+DTMnlJ5onatJgytovPrmKcIzh
	33xEqUmHpFZnPR/ztZBp4Ze4uLOgHbxF1YfJdGSHnHV4FlvF5pYrK2Sh+l+6RCQ=
X-Gm-Gg: ASbGncuggdfZWXGpP3KlNrgByVLnKWPdcCfMFtONPgzYEgIWGzO4Lu2EAFmHZsDPa0y
	JGtDvnkyXx0CtZsYHKVIFZjlqVww7y0oUZiU2QkVk7cTOZxKGYbYtDCYAMCMXEzJqBtP51997Xg
	DbeUUrdhm+3Il4QxCqhb0UBeKHhoItueu/yfzBI4xF7HjTh5B9fwwS4kid6EweUviM14cSRVEnw
	5d59Cy17GiOU2eTALbjQTU7ctefI66wpTX30OEFxR6z8hMZqI135cxDkwSkC71pmS5StDWKvPFa
	n1efGHGRODbkPRmwnSOAe/SHk6W8trL6b+Eajy31wQaEWigXbsw26qrBMGsMzcb0EK2jNK4ylbA
	q/2yfp6Q=
X-Google-Smtp-Source: AGHT+IFSzc5QJatgIdXqD+DXzmM7zgwxRI5PeZqMUOs9h7WB/uYl4w/dFaI6QbQK1mGmIDai2DP4ow==
X-Received: by 2002:a05:6830:2909:b0:72c:32a7:8830 with SMTP id 46e09a7af769-731c0babbebmr817146a34.26.1745967813046;
        Tue, 29 Apr 2025 16:03:33 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b0f3ffdsm546230a34.9.2025.04.29.16.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 16:03:32 -0700 (PDT)
Message-ID: <8e02de22-aaa0-413e-91fe-534d4a74c4e7@vt.edu>
Date: Tue, 29 Apr 2025 16:39:22 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
To: Andrew Morton <akpm@linux-foundation.org>
Cc: carlos.bilbao@kernel.org, tglx@linutronix.de, seanjc@google.com,
 jan.glauber@gmail.com, pmladek@suse.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de, x86@kernel.org
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <96516ac6-777a-469a-b5d3-9897a0e40de5@vt.edu>
 <20250429155329.73bd3f5835e8d6a2864873f9@linux-foundation.org>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <20250429155329.73bd3f5835e8d6a2864873f9@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey Andrew,

On 4/29/25 17:53, Andrew Morton wrote:
> On Tue, 29 Apr 2025 15:17:33 -0500 Carlos Bilbao <bilbao@vt.edu> wrote:
> 
>> Hey Andrew,
>>
>> On 4/29/25 15:39, Andrew Morton wrote:
>>> (cc more x86 people)
>>>
>>> On Tue, 29 Apr 2025 10:06:36 -0500 carlos.bilbao@kernel.org wrote:
>>>
>>>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>>
>>>> Provide a priority-based mechanism to set the behavior of the kernel at
>>>> the post-panic stage -- the current default is a waste of CPU except for
>>>> cases with console that generate insightful output.
>>>>
>>>> In v1 cover letter [1], I illustrated the potential to reduce unnecessary
>>>> CPU resources with an experiment with VMs, reducing more than 70% of CPU
>>>> usage. The main delta of v2 [2] was that, instead of a weak function that
>>>> archs can overwrite, we provided a flexible priority-based mechanism
>>>> (following suggestions by Sean Christopherson), panic_set_handling().
>>>>
>>>
>>> An effect of this is that the blinky light will never again occur on
>>> any x86, I think?  I don't know what might the effects of changing such
>>> longstanding behavior.
>>
>> Yep, someone pointed this out before. I don't think it's super relevant? 
> 
> Why not?  It's an alteration in very longstanding behavior - nobody
> knows who will be affected by this and how they will be affected.

It’s difficult for me to imagine how someone might be negatively impacted,
but I understand that it could happen.

> 
>> Also, in the second patch, I added a check to see that there's no console
>> output left to be flushed.
> 
> It's unclear how this affects such considerations.  Please fully
> changelog all these things.
> 
>>
>>>
>>> Also, why was the `priority' feature added?  It has no effect in this
>>> patchset.
>>>
>>
>> This was done to allow for flexibility, for example, if panic devices
>> wish to override the default panic behavior.
> 
> There are no such callers.  We can add this feature later, if a need is
> demonstrated.

I think you'd then prefer what I originally proposed:

https://lore.kernel.org/lkml/20250326151204.67898-1-carlos.bilbao@kernel.org/T/

IMHO it's true that this feature might not be necessary ATM, but as Sean
pointed out, it could be useful in the future. I don't have strong
preferences either way. Would you be happier with the current v3 approach
if we add comments to the code explaining the purpose of the priority
feature?

> 
>> Other benefits of such
>> flexibility (as opposed to, for example, a weak function that archs can
>> override) were outlined by Sean here:
>>
>> https://lore.kernel.org/lkml/20250326151204.67898-1-carlos.bilbao@kernel.org/T/#m93704ff5cb32ade8b8187764aab56403bbd2b331
> 
> Again, please fully describe these matters in changelogging and code
> comments.

Thanks,
Carlos
