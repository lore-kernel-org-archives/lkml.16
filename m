Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB93295539
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746043977; cv=none; b=iOSg4igoRyCi/DMYU8AoXk5qYpqqwF7WFpLg+w6E8LNAgEnye4pMCjxy5LnC9odkJdiIGLIzEB2MI+omr805tOzyec6toUYjZux2TsElPi/uyHl+0hU+x45PoIwe/F865mtKEJ4fBCcFc3LGRh86Dkrc9yYAm9ED1bPOKVogsd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746043977; c=relaxed/simple;
	bh=/4IcQWZnbn7ApOVG+SxWfV8GEEBr6JgaZRYU6fHLvus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKOIqRrAD3SsPk8C0eSFMvFV7t8Vbrad4nptwBb1dr3/pj/3jrAMFZSzLUv0YVbBDafnETRZQZRhkfw/wRle/A29/wYtxW28c/U2WzsqBamDVbS9YBk8BGfYgxLEvTQsiYP3cGOIF6zEvUnGnQbnTbx+36Px4FAma1tV/g3Waos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=nMOXL2sL; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="nMOXL2sL"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so907142fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1746043973; x=1746648773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB/dwlGj4/L9DBZWcSFU3soJHtf5P0ZeCUQ1DUFPYxE=;
        b=nMOXL2sLtd40yNBdwcDb0N+OlkQM/wXPP24Dwya2OZIDi6K/IpGDcHDGcvMFeZx2N3
         uVUOzQbms2ndOZuKRbYpYXghMsivT4ldSM+gjjYop09HFSUVjwPeu9Dy9ffShSuzhSOl
         Jmty32Lrjg32/e3CQIOZN/mJQ0eDOStC+nmHz/5l/6bsa3x1Stcmrgc0K6Otk5u8MzEE
         jWODFj2xqDAdpXEAWrEgTquV85hrfqwEztqSp718Jzk3W+V0gmWXk+ikJeKbPXVsKvUH
         X3KTb7iWJsvo/bURRdR/VJWvZgmvnLswqAby+MJMBHVZ79f5Fulyt17XHsdMV65HSZ9x
         1oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746043973; x=1746648773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YB/dwlGj4/L9DBZWcSFU3soJHtf5P0ZeCUQ1DUFPYxE=;
        b=FgV4mEHWhnjo6a+Alt1MR4e2OKZQ984Z0zzmvVmSwVqW3j+vEBcXq3xpvxBTgdfLFQ
         ebNot7DX7bvcDWawkSGx87AZ+vMNUGmFxpmSFzFTDcnOHb7hE5+H+IsQgn1kRy+ibV6Z
         cmmYba3mOUFoagtQi3V5vxEpiCHErV5QmJVq+CIHdIT36iKkURL3Alb0oeAnHy4hSwkJ
         GUMWjuc8lmtEbeHLjAYIPkickYMj429KqBjT1a7ABD5lSC9m0H10imVykMal3itS4g22
         Y8ihYi4GQg+cFQKQTfGJy6WV/+ggLQhOTCf/6cR8hInXDTDjABU2ePB2D33tFRP3gJyk
         oRTw==
X-Forwarded-Encrypted: i=1; AJvYcCVFTxVdKcxdzvk95LyOUPkzhuzJTwYd6Gfqu7aeWBz9GQZmYJgpOKtfGEf7IHO8L3/k6AAi77Q0/O4WT98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5KaSkOq9GgmbUPs41bWMlEsxNLTftTUVAk7EDT7NlCFXqDg+
	CThVgRmLcI96yRVUdRFvGOqw7VGWaK/SF+DqsqLjSU9yIrUGQ8yczRnI44ofY6HP8YX2WhD+uJr
	YiDU=
X-Gm-Gg: ASbGncvLgwqWE6wOxp6p1U/qm7qxL9MhpXWO3xkoirjdL5uCWJ3IUmIJMgnduZZb/ev
	vc2ReYFJZo7l7DyQpBmvuE3DWIwAz51tMS0DmTDNjr/tDjN6KxLiFwM9MdCfCE5DUHfPFsd3SvD
	OQwdtD+aATiyUykCTUVoESD5UOJxa2RTpwp/MgTUJtTyqADGADp9YnbU2cWswInQFvM6r4ydQPb
	AVkizP6u/gaQXOfNfcheljYlYyhi0dUuBmX8KHklPIAFjvZSkqu6P0FxbhQht4CPwJk3WroMHtX
	w95HbuBWBVcbi3/ItruNbuJPohCr0Okt1b13SN0rIbTrXwRXnY5SJwp9A2t8PVecesaDpHahIWC
	IlUUsE8o=
X-Google-Smtp-Source: AGHT+IGYLFAnqrA9naJ4ZhvzyGgj6gC8j18eEeq/2H1tf21edn0nev0RFcdD6tvguENZ1VNbImbyMw==
X-Received: by 2002:a05:6870:ad8c:b0:2b8:5a6a:6f5f with SMTP id 586e51a60fabf-2da8b329e7emr507947fac.19.1746043972829;
        Wed, 30 Apr 2025 13:12:52 -0700 (PDT)
Received: from ?IPV6:2600:100c:b2bc:90d0:b4f4:26dc:39a1:b133? ([2600:100c:b2bc:90d0:b4f4:26dc:39a1:b133])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2da6e0524e0sm602780fac.8.2025.04.30.13.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 13:12:52 -0700 (PDT)
Message-ID: <2e075491-538c-40e1-8086-5405aecb2779@vt.edu>
Date: Wed, 30 Apr 2025 13:54:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
To: Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com
Cc: carlos.bilbao@kernel.org, tglx@linutronix.de, jan.glauber@gmail.com,
 pmladek@suse.com, jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, takakura@valinux.co.jp,
 john.ogness@linutronix.de, x86@kernel.org
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <20250429210650.GD4439@noisy.programming.kicks-ass.net>
 <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>
 <20250429221049.GG4439@noisy.programming.kicks-ass.net>
 <94faa778-38d5-4ea5-aa0d-9259b56999a4@vt.edu>
 <20250430084852.GN4198@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <20250430084852.GN4198@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 4/30/25 03:48, Peter Zijlstra wrote:
> On Tue, Apr 29, 2025 at 03:52:05PM -0500, Carlos Bilbao wrote:
>> Hello,
>>
>> On 4/29/25 17:10, Peter Zijlstra wrote:
>>> On Tue, Apr 29, 2025 at 03:32:56PM -0500, Carlos Bilbao wrote:
>>>
>>>> Yes, the machine is effectively dead, but as things stand today,
>>>> it's still drawing resources unnecessarily.
>>>>
>>>> Who cares? An example, as mentioned in the cover letter, is Linux running
>>>
>>> Ah, see, I didn't have no cover letter, only akpm's reply.
>>>
>>>> in VMs. Imagine a scenario where customers are billed based on CPU usage --
>>>> having panicked VMs spinning in useless loops wastes their money. In shared
>>>> envs, those wasted cycles could be used by other processes/VMs. But this
>>>> is as much about the cloud as it is for laptops/embedded/anywhere -- Linux
>>>> should avoid wasting resources wherever possible.
>>>
>>> So I don't really buy the laptop and embedded case, people tend to look
>>> at laptops when open, and get very impatient when they don't respond.
>>> Embedded things really should have a watchdog.
>>>
>>> Also, should you not be using panic_timeout to auto reboot your machine
>>> in all these cases?
>>>
>>> In any case, the VM nonsense, do they not have a virtual watchdog to
>>> 'reap' crashed VMs or something?
>>
>> The key word here is "should." Should embedded systems have a watchdog?
>> Maybe. Should I've auto reboot set? Maybe. Perhaps I don’t want to reboot
>> until I’ve root-caused the crash.
> 
> Install a kdump kernel, or log your serial line :-)
> 
>> But my patch set isn’t about “shoulds.”
>> What I’m discussing here is (1) the default Linux behavior, 
> 
> Well, the default behaviour works for the 'your own physical machine'
> thing just fine -- and that has always been the default use-case.
> 
> Nobody is going to be sitting there staring at a panic screen for ages.
> 
> All the other weirdo cases like embedded and VMs, they're just that,
> weirdos and they can keep their pieces :-)
> 
>> and (2)
>> providing people with the flexibility to do what THEY think they should do,
>> not what you think they should do.
> 
> Well, there are a ton of options already. Like said, we have watchdogs,
> reboots, crash kernels and all sorts. Why do we need more?
> 
> All that said... the default more or less does for(;;) { mdelay(100) },
> if you have a modern chip that should not end up using much power at
> all. That should end up in delay_halt_tpause() or delay_halt_mwaitx()
> (depending on you being on Intel or AMD). And spend most its time in
> deep idle states.
> 
> Is something not working?

Well, in my experiments, that’s not what happened -- halting the CPU in VMs
reduced CPU usage by around 70%.

How would folks feel about adding something like
/proc/sys/kernel/halt_after_panic, disabled by default? It would help in
the Linux use cases I care about (e.g., virtualized environments), without
affecting others.

Thanks,
Carlos
