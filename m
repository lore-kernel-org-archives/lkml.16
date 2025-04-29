Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B1274678
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965181; cv=none; b=mGu/bY47cCC9UWHTfItIwb8R/tad5KbT0nErkj1qzWmvq0scgP6GYjzFrv2ni3Aq16U3I/36bv2i0GPPMEKs6z5+eRC+YPM0UM4kvILOC80RYo6JcsjCtF766VSIrbWJsnaDMuxkKm/KzfWbnukykESIG4DK9wvgXgdcBptsd34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965181; c=relaxed/simple;
	bh=npwFnTkq6ClVsZtyhYC8oM+YtbGVUvfrZIC3pUaRyjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs0bUssTXfFfDlAg/3wSdEWtuo+Sl8sViL+ihHJfO5GSnzg+J6DqMaxOnpJzVkPzwOzWj9ggeiy8nc1TpjeVVI1ut9vojrHMdmmJoGLpzssqLI5/a+MV/PTWIVJb4j3QEW+WNfOFaQZjoYb6MKoUU/yduuplSQiFci4Sop5AOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=FbS3Woau; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="FbS3Woau"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72bb9725de1so1312063a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1745965178; x=1746569978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=et/K/MNghigKGWczEEZX99Lv+RpVbFTZl6Eg9jXsd/g=;
        b=FbS3WoauLsv3CHDOf2vKYAYTcYlr454zQ86OZYI75TuUHPe0Xsp+sCmA8TrlwOJkG8
         6ma870VDjtqbzUDyJpW0cXIdYv2bWzwro+VJzpG0boniR75gLCAdKwEy5lMqiEneVCLa
         8oR8X+NAKXvrItlW4cofKL+8wLi1nKGhFUUI/7QjVf6S48kjdWzyULI30XR9y4cT8Kb7
         Nd+6zNirChEt2e64dn5lSgwTIW04nb8ULIwvfA6YiMPVaFLoMZ0P4aIrHKswargdrn3G
         DUieavxFN4HEwREc7JAqLeUkHYVTxZMJbrXDm6lJuCA9mU5k0kY7fX44QNpRhC9q+xTt
         YyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745965178; x=1746569978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=et/K/MNghigKGWczEEZX99Lv+RpVbFTZl6Eg9jXsd/g=;
        b=UyUjIMaNy8oPyY9jQVLxttNwDx2Q1nUZ9OqOXaqEGe3SLJcryW4IeWz9h0K2sKosPy
         8c1fBRfvVastkXB+V0+tFLhcF0erLonSd26OuZucr/dbFN0J+r/XkypytsPPDAdqGOJB
         8tL8oZxLYBzqw1d+WvHgPZxbBTDubCEMw5Azp6n894G64yeFy+MHCBgV1ySrPRKlJPFh
         l/4wRlJhZzvtJuP/hX/oJDb8tAXMZtb5SJLgvMIsoYgDpiaMfPa1Zd5beBH+X3UIXPzk
         bPBGDtb2kIfakEYQBA25z9VP9DwDGTfjP7JBU8xhEFsBbn7GhaeK4E7npr8GRxg9N/p4
         ez4g==
X-Forwarded-Encrypted: i=1; AJvYcCXPnV3deuQJj/UbKtrVsqOkkILNVeMqMYRt69/I/f8tKlHnG3G2cnaDBu3/xfSg5K+f+CaWKU4KMVNsB+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBpf3GSSzn5XQQoJd9U2rDF0b3HCAE1TUKEdcUUnOBrpyxwMQ/
	tyXh+ZhxFZnmWA+Tyr0J50VuDAyLl4cEP4sa5dQd9XAvwp0eAv+Fiuby+YsLKSU=
X-Gm-Gg: ASbGncsHQ+NVdhVwdTXvu5H8rYhWXYOhBudvRH7U9xLIZlZ08Ats9hSbN428A9wCD5e
	3gGE0l0TF8kpeoujPg2QTXRoNDzwf/V1Cnqd0YilBlhr4R3eC53nfRY0wGxOuBjuCv/8RZ+b1Mn
	tVqreKmvn5RLzR7/oqyiRpjShWeToKJzhvT+PFHR+/B1FVfG6SNZV64wKmmNJ0GOI0GIn7uLGiB
	391yC7A/UUXBQYSV21bzoHQAPwC6+DKawkAZVAMJq9w/tzDNSnxpB96GlLlLPvyXpyZwKRGaRzz
	dPxNeyJvVviAIn27gU02wBRm2ysmI7/kvELsW+oBDiKSiIorDqCc7Ls/SIO5HvGRqNErMxPLjPq
	UjyGiSkY=
X-Google-Smtp-Source: AGHT+IGspJVlKsD2nNxDA5jmTflNeQsTYpJafp1NHFwSsJfZ8IPEGuUMeZp4V9HwbgY2c0zlDT2u5g==
X-Received: by 2002:a05:6808:6095:b0:3fe:aeaf:316d with SMTP id 5614622812f47-402c7267c82mr215187b6e.20.1745965177994;
        Tue, 29 Apr 2025 15:19:37 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40212c4dbf2sm473764b6e.47.2025.04.29.15.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 15:19:37 -0700 (PDT)
Message-ID: <94faa778-38d5-4ea5-aa0d-9259b56999a4@vt.edu>
Date: Tue, 29 Apr 2025 15:52:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, carlos.bilbao@kernel.org,
 tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com,
 pmladek@suse.com, jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, takakura@valinux.co.jp,
 john.ogness@linutronix.de, x86@kernel.org
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <20250429210650.GD4439@noisy.programming.kicks-ass.net>
 <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>
 <20250429221049.GG4439@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <20250429221049.GG4439@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 4/29/25 17:10, Peter Zijlstra wrote:
> On Tue, Apr 29, 2025 at 03:32:56PM -0500, Carlos Bilbao wrote:
> 
>> Yes, the machine is effectively dead, but as things stand today,
>> it's still drawing resources unnecessarily.
>>
>> Who cares? An example, as mentioned in the cover letter, is Linux running
> 
> Ah, see, I didn't have no cover letter, only akpm's reply.
> 
>> in VMs. Imagine a scenario where customers are billed based on CPU usage --
>> having panicked VMs spinning in useless loops wastes their money. In shared
>> envs, those wasted cycles could be used by other processes/VMs. But this
>> is as much about the cloud as it is for laptops/embedded/anywhere -- Linux
>> should avoid wasting resources wherever possible.
> 
> So I don't really buy the laptop and embedded case, people tend to look
> at laptops when open, and get very impatient when they don't respond.
> Embedded things really should have a watchdog.
> 
> Also, should you not be using panic_timeout to auto reboot your machine
> in all these cases?
> 
> In any case, the VM nonsense, do they not have a virtual watchdog to
> 'reap' crashed VMs or something?

The key word here is "should." Should embedded systems have a watchdog?
Maybe. Should I've auto reboot set? Maybe. Perhaps I don’t want to reboot
until I’ve root-caused the crash. But my patch set isn’t about “shoulds.”
What I’m discussing here is (1) the default Linux behavior, and (2)
providing people with the flexibility to do what THEY think they should do,
not what you think they should do.

Thanks,
Carlos
