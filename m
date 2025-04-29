Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB51E282D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964119; cv=none; b=fr2ha6SUyQ6211SD04e65m8737haFYhizs15frS/uARbi0+ju3iXLj1myU+RyO509I1/sH58uCyJh8652Djbdg6BqLMHS84yEMkvY9rEbqQsLS457o3t/qoCL66Y2XN2xz1UvuB4k2h9xwSkd4hzH+PR7/9bW2RIgLVgco0dl+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964119; c=relaxed/simple;
	bh=sPJqgOyX29R9KKlPV6B43tSpDg21WwbqwYOhi4lpMVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LuUDrRtEYSRcXWrdca9Mnf+gJpRL/7X1ruSu8CTslBPFixPoMf8Ywn/0nwsUbSz4UzKUimgMg5YpLMtgYF2gv3qagzVVkvdAJ4afR+IuxaJRlGWcRvVUU9pJdwI9vdrpCPTodqHq/JfAwNDq4TwL/Kz+3xQp0Hc+4DFDb8XBGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=bNQH7ILQ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="bNQH7ILQ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72bbead793dso5227177a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1745964116; x=1746568916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s/Iy6G1QbQ70EX/jQq/aMS57PpOXhBvcYl5cYZVpbY0=;
        b=bNQH7ILQPybteHuAcdGD6mMZ7BqeA3/IYUeGtm/ml1JPXQeqGZDZxEz+20Yw3IhGIy
         y8Wao+Pi/h0E9ab9rGAlFVrb84fEqKYjCw5vSQ1mbbCVBN2ItpwrSYU5d7rFMIgl2f17
         vWOYC4dgHJ+Ajl2x+lI5xoMSxv2sbmrNqiWBv0w8rJljKiEGt9pSfNH3LvGMe8Iy1bdm
         JmkR2iUkNcbyxi+fvPF0H4ciKfgq84/4UY3rB4bIzEaZWDRxXL5JR/LVnfa207ecyK5z
         7dOXou+qyWzK0tlgE/j/zPs1RU28G/X/oCbUzQqH4Ea49xMTO3K/l0zxfT9nI7lVztRR
         7KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745964116; x=1746568916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/Iy6G1QbQ70EX/jQq/aMS57PpOXhBvcYl5cYZVpbY0=;
        b=MzSj3wQ+RZt28CrbxMCK1Q9AOxPlnTtW4+ocQwut84EKMxlf+cYU5ASixp+q4da8aJ
         tuTybqeO8SnSb6OKLgGWJCQQcUaIexs3I46vXY1dDtDjk5p6UETxvvm7+PfrM0GXHZIh
         0ORL92OHBltM9+CZI8i1vPbmD4ftnnrFvHuEU/Lu27PZgCe3fb4CUmxNe0RRngxyOjQi
         4VeWGxpUrj7bEyA2S+PssfvAoCdO7FVFtxwWr5WnqcwL/l8skepYx/i6QIGuMpO3/gBo
         zlSAWJBO8hi/Ho3ucArz/wnroiyTAKyChrIFDAuyWIf3XcO7/ihHObLf19IQtdmkgUIJ
         sfxg==
X-Forwarded-Encrypted: i=1; AJvYcCXkEA4DB7FeLTIsLdkjD7JD5oiXWxv72hXHzSf6fbpt70s/k/yINDewwE6suN5mkiZMCXoXTd/HlDa5S8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/b4h82qTh5jHlIZQV/xxOrJeWXcRlPwqt8/6hIfu1rwEIRT2l
	nNILw2HACo5QqxXt4elyPPo6EW/UalmRNXlVZy98ciqDtqQeWxTUpviY710Rql0=
X-Gm-Gg: ASbGncvfqkX/RnibMaldfvuI6e10hQqsL8+ZqJeNWENy/nQMjfvqyrqWjUPjSquEHNv
	tRQjudJbCifXm2VAVZgfRkOv/QIwcth4Lie/daYViafX3tXZeG3xbR3//ZWuA+Ekjw82+QojTFV
	NDWh4GcFjPulXyF6bT29zM+KirNfIJdVfXgeDE9frmQjfQynD8ZNU4QLD0Bg7emOyVNE0xuj2mD
	HCcH2xRiiyJ+B4UJi8PTUwkO5HvFG4PfszjSa1td2hSUoGyz0Y5zxt3N2OU+SyGAlS3Yn67lv/Z
	JIs+BpFywLxikYeLS3Xut7bQ6UFTmrxNNZbLS8jcJCsk8/S7DGn8V8DI0hp1WXYisspn0mtmRmu
	SMSI0nySJ/cVRJrAh2Q==
X-Google-Smtp-Source: AGHT+IEhDNMyfCEPOBhSZmHlOMiioLQII4XVVfboVPxcNey7XhZuybzhr5UHdTndkzt1/V3AUZCVzQ==
X-Received: by 2002:a05:6830:2a93:b0:72b:a064:fab0 with SMTP id 46e09a7af769-731c09d8de0mr591119a34.3.1745964116293;
        Tue, 29 Apr 2025 15:01:56 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b0f9632sm529162a34.8.2025.04.29.15.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 15:01:55 -0700 (PDT)
Message-ID: <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>
Date: Tue, 29 Apr 2025 15:32:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
To: Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: carlos.bilbao@kernel.org, tglx@linutronix.de, seanjc@google.com,
 jan.glauber@gmail.com, pmladek@suse.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de, x86@kernel.org
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <20250429210650.GD4439@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <20250429210650.GD4439@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey Peter,

On 4/29/25 16:06, Peter Zijlstra wrote:
> On Tue, Apr 29, 2025 at 01:39:41PM -0700, Andrew Morton wrote:
>> (cc more x86 people)
>>
>> On Tue, 29 Apr 2025 10:06:36 -0500 carlos.bilbao@kernel.org wrote:
>>
>>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>
>>> Provide a priority-based mechanism to set the behavior of the kernel at
>>> the post-panic stage -- the current default is a waste of CPU except for
>>> cases with console that generate insightful output.
>>>
>>> In v1 cover letter [1], I illustrated the potential to reduce unnecessary
>>> CPU resources with an experiment with VMs, reducing more than 70% of CPU
>>> usage. The main delta of v2 [2] was that, instead of a weak function that
>>> archs can overwrite, we provided a flexible priority-based mechanism
>>> (following suggestions by Sean Christopherson), panic_set_handling().
>>>
>>
>> An effect of this is that the blinky light will never again occur on
>> any x86, I think?  I don't know what might the effects of changing such
>> longstanding behavior.
>>
>> Also, why was the `priority' feature added?  It has no effect in this
>> patchset.
> 
> It does what now, and why?
> 
> Not being copied on anything, the first reaction is, its panic, your
> machine is dead, who cares about power etc..

Thanks for taking the time to look into my patch set!

Yes, the machine is effectively dead, but as things stand today,
it's still drawing resources unnecessarily.

Who cares? An example, as mentioned in the cover letter, is Linux running
in VMs. Imagine a scenario where customers are billed based on CPU usage --
having panicked VMs spinning in useless loops wastes their money. In shared
envs, those wasted cycles could be used by other processes/VMs. But this
is as much about the cloud as it is for laptops/embedded/anywhere -- Linux
should avoid wasting resources wherever possible.

Thanks,
Carlos
