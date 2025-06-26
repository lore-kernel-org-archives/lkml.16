Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FFD2EACF6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950791; cv=none; b=bS+zoP8V4bP+Eiy4m/C24XGmPKLndfH98lQGlPud94fpqG42+FIwF+Wu49B6njO13lMGzAq5nc8FsQjpEspOhrHQR4gZL2+YBtygI4H/ImIbeCMpU51vBIbx1m9aQc503Ilqfl+zC60kuQTp0paIiMJoocpd/aEABxz316Wdkd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950791; c=relaxed/simple;
	bh=3f3qxDKvxDl4HUf3HIbqzgM9/mI/iNDu+z+hney4Tq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gixve7bh3B+aiXLIXDSOZ1vPhJMwPNXlzu+erj3XQ2QmOA0W2pFaCVnjQ42dcLZ36rct9HSpPjltcn63/wSnLLJzubrKt+UdhdYAmYDrCkGMu45wjzbJv5lM5p1YS1HDdI7OyHCEyl9jadId/B/5d3rda02NTtnBLS/YQY9qMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ghG0PZyW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ghG0PZyW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so7542255e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750950788; x=1751555588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq8L/7jnSV6837VjO0hrxDQrv+5WbHPxhbytT6DZZLk=;
        b=ghG0PZyW9sxmwApYdhwqcZq2laRem4xdNhf4zmI00QlpufPBayN9ZiNdSgKi2AqJv7
         3P8CoeGrlEAorqQh0uJQkRgPk6nSk4kZPOOriByRLk57dOLOsQAnP1EQKrfGAro1RK49
         84H1z6n6OlVvG6AgzpihXvTyzqR62rZRNvdWnoOgyWxFZKxYCDWmASEvadzAmwpbPTiP
         GzAdimiSR2tn63TfUNy0puI1vTbTTnRSfCJP9bLNG04XNLXvlJt46iIgvDntRHKKIshW
         GmxYAZxKHysDsfN/qplcnTZ54a8hY9DkL8b/j2MVBwkQVWy4IRalJkvtO8peyhtboEVJ
         p3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950788; x=1751555588;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sq8L/7jnSV6837VjO0hrxDQrv+5WbHPxhbytT6DZZLk=;
        b=LlaubpKXyuk6OZAzM/WRlrcguw/D1beSF4FgIVD+zfDvRuzvUZgjMxRpaeyV2MwRLe
         i+0Yo2IbTlNC05CP6qUYqT2hlBihXBv8jPU4UauJxiN9xPev/bVmOaK1AqHQ4pAqhlZt
         tc2Ovh8j3+xpsg2KzJVcA5PfpCCMWfPiEP8j1MKhzyZ67iPaU29QshvNjxuANT3KIfoz
         FuKK9f/TQRCNKdP5PnOrmROzcJq3/agsUswSf39t+78/8bB0IVhbznzELAbnGjK3BX3N
         EdPn8JgTj37GH4PmjUStDWKKk5zf7hTuHinVwL3DiRr7EHcN0uDreoR5BqRlMZ8gF/J1
         SPiw==
X-Forwarded-Encrypted: i=1; AJvYcCXSPtHaBhQyFZ6Jt+dJ1EnncDqeYu0cM4P/gLRg3HTGD1f1w766WxOYrh6tZHCbdQTomoFWcuolPQ8e5dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/JxsCYxP51cJyDaqw9a8U4XdVDByOY1WawbDModEgfRiIwSW
	h+QVtmmDozK3gUdGpDEks1xISuFk8Pg4ER5bctG/G3Cr0mnsnxoEVEXR6Pr+oN69qdo=
X-Gm-Gg: ASbGncs/mJAl63sb9OWAP+OYDctKWQSyeSSMbKytZmxURT2xqnYBOWqX8+jIe4yuDlp
	c83O1b0BOSlpIWd3EclWOZONMmHA2/pJgqyYO60Kn4tFN7BIQadxWFkx5XX29rv/gYXYQdwE7JZ
	0Xijlpsh330yVr7jVlLGw1JiLl9OEeBLAfQITe8mb04N0hoiEUkHR9bRZF9f/d7e3C1Dd+KK+yB
	+8Bk1R2o2sxKPBDvwvsv8EQlF01sKsmXwnmasfD9O4vTBZ7jwYvPDLafV7TIUHfakIef4br3hVF
	z60TQRPJ8cgCVQsdZuFuIQtQYrEnOrqkDszAJaKKx1A1OGn5PhNfBA6IL//Zyp1vKeTUd338efd
	J
X-Google-Smtp-Source: AGHT+IFPF71+mfSO9NvN0xkeypXe5O2hTFR0l2NynQYTObOWmXChzYdnye9o5T5yiOJKGSQbmmhpVA==
X-Received: by 2002:a05:600c:1c29:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-4538875c58amr47054965e9.16.1750950787825;
        Thu, 26 Jun 2025 08:13:07 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390bf8sm23178575e9.4.2025.06.26.08.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 08:13:07 -0700 (PDT)
Message-ID: <295f94d4-f5e2-4849-ab62-9fdc75722e20@suse.com>
Date: Thu, 26 Jun 2025 18:13:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/bugs: Remove 'force' options for retbleed/ITS
To: Peter Zijlstra <peterz@infradead.org>, David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org
References: <20250626142703.716997-1-david.kaplan@amd.com>
 <20250626144047.GN1613200@noisy.programming.kicks-ass.net>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250626144047.GN1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/26/25 17:40, Peter Zijlstra wrote:
> On Thu, Jun 26, 2025 at 09:27:03AM -0500, David Kaplan wrote:
>> Command line options which force-enable a mitigation on an unaffected
>> processor provide arguably no security value but do create the potential
>> for problems due to the increased set of mitigation interactions.
>>
>> For example, setting "indirect_target_selection=force" on an AMD
>> Retbleed-affected CPU (e.g., Zen2) results in a configuration where the
>> kernel reports that both ITS and Retbleed are mitigated, but Retbleed is
>> not in fact mitigated.  In this configuration, untraining of the retbleed
>> return thunk is enabled but the its_return_thunk is active, rendering the
>> untraining ineffective.
>>
>> It is wrong for the kernel to report that a bug is mitigated when it is
>> not.  While this specific interaction could be directly fixed, the ability
>> to force-enable these bugs creates unneeded complexity, so remove it.
>>
>> If removing these options entirely is unacceptable, perhaps for
>> compatibility reasons, another option could be to only allow forcing on the
>> affected vendor (i.e., only allow forcing ITS on Intel CPUs), which would
>> at least limit the potential interactions that need to be analyzed.
>> Tagging as RFC to prompt discussion on this point.
> 
> Testing; I use these things for testing. Makes I don't have to run on
> affected hardware, I can just force the feature on and inspect the code
> and ensures it runs.
> 
> If you use force, you get to keep all pieces -- no warranties.

I concur, however using force won't always guarantee that the code runs 
though, because there can be other condition that must/must not be met 
i.e trying to run ITS on AMD hw (yeah, yeah I know :) ) also required 
commenting out some checks in patch_retpoline.
> 

