Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363D209F45
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648874; cv=none; b=EHtqsMTX96xVkegzvRkJuo6Cs1CcB6ssDR/6P/F4n/QfiLvT2xDUI33soCrWYPhq+6lJIG+QkvBKqjluCc1Aky9NBzXBHAmFADKUeAQ0KTNlrjcx3w9k9ZrYkWJCsxbJhAbXlT4FCfHQqebcbfHhcaW1SzTikJTzXrDQ6Vu0ePU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648874; c=relaxed/simple;
	bh=61qRZmN+Q09efrT5xgxj3jNCO6jzB1dGBeY60oZbbJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hssqAC0Jcl4fw5DYSmasndPNfmadv2W+nHPj6Y4+/inpF4qaBq72aBSNixrKKNvMd4ZQ6gAbOh1Zqn0Cxq74C7+5oxiJs5HWVaRNmYjH650h8809eCAJ+ppaA0dMcEq6Vv16pYbaPzDE22kZNmRZjnwTJWFSMQa5qfy/TFOFG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+Tb5fda; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+Tb5fda"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c27166ab3so173321a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746648872; x=1747253672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61qRZmN+Q09efrT5xgxj3jNCO6jzB1dGBeY60oZbbJA=;
        b=R+Tb5fda0VqI0r3HV+u/EeZp2apHkLmlMYw71iDYACwdIxAygBiWgisS1J6W0LPO6q
         46z4xPq00pGzMKrPfsjchID08kTFS/xFfk8fGkyFw/9uenlCpjb9cTEbil2T/5ObDK/k
         YMFVxyqAsXJwGCj/hrKL6X2o47MwA978OXx/sv9mYDdmmJeSDQC6v4GKhXyUJR966nlp
         vFTv1xQtiSShyUdMzY5ZRqO+uvimMuT4Xa4NXLg4cFYqOppjXlAyjePd8Z9XDaJFk2vJ
         Az8Z0iEx0YCfXsl6IAeFpgFIehDucXiIX3qApqmnr0zr060yWfyNQVRIwMg9g7Ywv7rz
         dmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746648872; x=1747253672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61qRZmN+Q09efrT5xgxj3jNCO6jzB1dGBeY60oZbbJA=;
        b=LyuiAZmfOCKeMSPt5iksSk1SkWqGkdP+3k2WgnW3Z3XrCHFjcydhT4qW6DjAJkv7go
         AqurmzJojvZqhhiEP7izBgQ2dUmJ33RyROYrDk5otgqLGStPpzSQdna8DUwS9f+52z+J
         kbVPBCZqo+ayhnn8AZ5aPQkjaYGpAP/jMDZ7wrMXBLg8GSC0D7ro/HUzUQYxhoXeJIPh
         0j4XDxjoLV9k+zm7PHVz4AYvmbJ2ef9FeaFnLoMMd69Ut5FUC+DbqfGcxdqxXKdfdRWl
         Fo7mKI4IPdgXfQQsJw1LC/bA5nffC9JT74Sxg2HDzi/ejpFWTNQ6z3leZT1IHqV+KK6M
         dQEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtJIKwk3YhLFZ6tZGc+kXsWWW1xFKbpHkmA3uO2x1gnm361doDBxST9AylHc5Fa08LI5HfOAh4GWf8K3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUZ2pQrg6A04dsEZ8Ntc07UPKiT83vfcJh95ruuzpOZEjiGltb
	c0euh3uvtTzsdaDejbfntFVE2/xZEKWnSTn/AXHJ9tuZ2HKF2u1T
X-Gm-Gg: ASbGncuSyikcPyfE3btPoQZhQohAzIK2nAQGzjFdzYr9nJBehteAUo6hqICg8oOAT2L
	TJjpaneaitMlAsI4LX5GxB75UedigQI2vwYPhgED64ZWcAhV1AkestkNCadU9ZK6rn+Fx2CVX60
	A7RV69JmyPsPpbw6CnW9208J4cEGaGkXvwOiuWM06MiqyXfyMPT9LH0nu6qKfp6movXCtxYpBGn
	Gcfa8UVPfqw4KAnZTSWkcDFlAjM13SdzHnPriu31wwsyz9nezYu6t71DD69pt1Lf0qD2n/PdtGl
	gWITt+9kqF2VVKzEm7k14KWkF6xdpg/pzLk9YF+MpflciuBTriTXIHZ7Sla7GqwGo0dHYI1BvsD
	EpmaIgr1YA9QNAXoBGDTyF+Iev7g5wGATcRpmQLQ=
X-Google-Smtp-Source: AGHT+IGbOaDLg7RwKcF4Ef5VkxSd1b6ZWl0tz3q1F21g43CpHGH8jatCPGElo0KRmPcggCubKUyYWw==
X-Received: by 2002:a05:6830:2906:b0:72b:87bd:ad47 with SMTP id 46e09a7af769-73210a72f1emr3059099a34.3.1746648871898;
        Wed, 07 May 2025 13:14:31 -0700 (PDT)
Received: from ?IPV6:2600:100c:b2a7:c99a:12d7:b0e2:f546:4c3b? ([2600:100c:b2a7:c99a:12d7:b0e2:f546:4c3b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73210a19326sm729554a34.30.2025.05.07.13.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 13:14:31 -0700 (PDT)
Message-ID: <9a3f8105-1156-486d-9b6e-f444e36a271f@gmail.com>
Date: Wed, 7 May 2025 14:49:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
To: Peter Zijlstra <peterz@infradead.org>, Carlos Bilbao <bilbao@vt.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com,
 carlos.bilbao@kernel.org, tglx@linutronix.de, jan.glauber@gmail.com,
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
 <2e075491-538c-40e1-8086-5405aecb2779@vt.edu>
 <20250501085528.GR4439@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20250501085528.GR4439@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Peter,

On 5/1/25 03:55, Peter Zijlstra wrote:
> On Wed, Apr 30, 2025 at 01:54:11PM -0500, Carlos Bilbao wrote:
>
>>> All that said... the default more or less does for(;;) { mdelay(100) },
>>> if you have a modern chip that should not end up using much power at
>>> all. That should end up in delay_halt_tpause() or delay_halt_mwaitx()
>>> (depending on you being on Intel or AMD). And spend most its time in
>>> deep idle states.
>>>
>>> Is something not working?
>> Well, in my experiments, that’s not what happened -- halting the CPU in VMs
>> reduced CPU usage by around 70%.
> Because you're doing VMs, and VMs create problems where there weren't
> any before. IOW you get to keep the pieces.
>
> Specifically, VMs do VMEXIT on HLT and this is what's working for you.
>
> On real hardware though, HLT gets you C1, while both TPAUSE and MWAITX
> can probably get you deeper C states. As such, HLT is probably a
> regression on power.


That's a good point -- wouldn't TPAUSE achieve what I was trying to
accomplish with HLT? Assuming there's support and wouldn't just #UD.


>
>> How would folks feel about adding something like
>> /proc/sys/kernel/halt_after_panic, disabled by default? It would help in
>> the Linux use cases I care about (e.g., virtualized environments), without
>> affecting others.
> What's wrong with any of the existing options? Fact remains you need to
> configure your VMs properly.


See, that's the problem -- it's not _my_VMs. It's the VMs of cloud users,
who are ultimately responsible for configuring their kernels however they
want. We can try to educate them, as some maintainers have suggested me,
but many people either don't know what the kernel is or don't care -- they
just trust that Linux will have sensible defaults. I get your point that
VM-specific problems shouldn't burden the broader kernel ecosystem, but I’d
still like to think whether there's something we can do to improve the
situation for VMs post-panic without negatively impacting other use cases.


Thanks,

Carlos

