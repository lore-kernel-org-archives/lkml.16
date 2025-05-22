Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D142914
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909583; cv=none; b=Ua/knbiii4JwJjoU1YgYiHwoOelL0SWmpKRvQetjLqC5WSCP2LAADUxdWebKDquBXG8URAvycOh3E/CDe7HmLlizyadKe8zTM5Tg4dHxWg4nhP9RM0+uw/s3ECYqRBnXddRcHfT+Y7vdt62XtfjQuUZ71jT+SoYEaCNYPsmpIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909583; c=relaxed/simple;
	bh=BH4AfSUwUluLG/Umk11Cy+4Y33d4asjOfV1wYZ7iFvc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jiZxtkchLiufDdFWyxjcdfXhqrSiSuuEueN7FeJV/yoG3fRIuOpMZ9Vbpqe0VXRZirpsWBUA/msN8Mbs6FqtsKvEP3mk6dfxkEpLwbxC7DzD+s3I0zVdiPqJtVTvmDgQu7VweWFGA0NlDwy0ConQSfthQaD3Inq53X7uEuTmXpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C97HKlko; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C97HKlko"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d35dso731058a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747909577; x=1748514377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+x+RUh/jk6JDeP+VXuhVxUngJPLVVyVlX2pJMtOpt+w=;
        b=C97HKlkospQjpAsf4wsVCX6hP0yp1KaAL7gJfx6Y3nJbh+4qAltRKh8mSyV328NIib
         117Vre/tYdn8PrBrrIJO/eL3xIm1Pbu7yL0dx4jr+SYW2hjDDNfBUWLgLfO3EttvI2rr
         7wlQ/6rJWqgBt5K+YFdMCiqzvcb2O4zNH8fCWGmWsBqwdDvPyRow0E816k8U4AiFUKmN
         StV4vlB2e12rA+1stIXwSfuoIbi+BFp7sWXBPPwuTpbnQX6hGqeyZ09rSQDr7TyPskdV
         St9Ofz0ftKAdyHRbgDNHUF37hQcIxlRAaHiDqtjrxpVZZPITmzptMPUeerxntuFNaGdN
         LPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747909577; x=1748514377;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+x+RUh/jk6JDeP+VXuhVxUngJPLVVyVlX2pJMtOpt+w=;
        b=XlJqdvBm/plGDLbUxogzYTN0i1RwmCFuCAA6wlz8H2y5VTufHRuFMYzvk3eX86HWtK
         qDY+UtM3F46+1JzolnBXdEuGE6DAilE9TBsa9GPSMlLIM0UT4jtlkyT+ePCGqRERpiSR
         h6NeHIvWvxKacHD99D4IFzY7TWyw3tUcQIDzLu481fGE02Cmf/skqC+pZDXP9C/M22E6
         w5cey7wqkWlIgUtmvg6foO/195h7jrcmJlrkJh2A1ZLlQK2/wcRFRQidbUma5YmK7o+h
         HbxbIYTKhODpG6kcTaDEsaaCao9d/A3+skikVzpTIWn/5lq3qRLuUK7P33SzQmHD5Usw
         jebA==
X-Forwarded-Encrypted: i=1; AJvYcCUN88YmI353M4rZl6UexTpsZLMjGju8c5bK+H6BAOo+agRg9DHKKZtHi/pY4WKHtA0z0vQU+2YbHnIlu3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsA7sn8Mo1hvkf652LVtQ5jaOuspC6YHE3JcVYJpzobr4CBzjX
	1xhUiWQZsOy8MZoHnwcry5fbzEsq+Unadz3sNivZJMMQtzFz+Tl4KN7o8V735rH07t8=
X-Gm-Gg: ASbGncu8IV7kjKDOXjlZqAC5OQwpOf6NCgkXd9wPuEXK5MN4TXAr64xL6hjhvlXanpT
	2C4vAhjYf1UPSQ42HwDgx3/YgFZ319/67nj+msKiaYC4IKcz4cjkou/IgwOn90kj6tsa1ZXKLMd
	Xo3tOQv1ozt/y1uJ5t9vC/z1QQC7sJxO5R4/DZUxjRVsGeFt5ExBmR5dN4mdTHTDL1IrpchF8iN
	dEPE3C3G6LRa5+KUXVdCTom1ONxPAEvoK62ZNxGDLq03iYsuRQK8d7mIFqtPAla2KysaxHlRiil
	lqHPs1NFZIrvHf/CQBomptY1rxtnw985iUzLp7/mzozj54datq/OAsrn
X-Google-Smtp-Source: AGHT+IHSuzu2L/933JGo8cQwskQkP4JoLo2GvTD4QkfwtG/gZDD9f9/cYATkKi/al0Ii57nyWobaiQ==
X-Received: by 2002:a05:6402:4315:b0:602:2a8:cd7c with SMTP id 4fb4d7f45d1cf-60202a8cf4bmr10815326a12.4.1747909577535;
        Thu, 22 May 2025 03:26:17 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e019asm10143910a12.36.2025.05.22.03.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:26:17 -0700 (PDT)
Message-ID: <4b60f99e-ae4d-49ae-b886-21e7377abe51@suse.com>
Date: Thu, 22 May 2025 13:26:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] x86/bugs: Exit early if return thunk is already
 set
From: Nikolay Borisov <nik.borisov@suse.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-3-70e2598e932c@linux.intel.com>
 <e7453122-54c4-454c-871f-dcb7179506ec@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <e7453122-54c4-454c-871f-dcb7179506ec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/25 13:22, Nikolay Borisov wrote:
> 
> 
> On 5/22/25 05:44, Pawan Gupta wrote:
>> ITS and retbleed can both set CDT return thunk. If the exact same return
>> thunk is already set, avoid the warning and exit early.
> 
> According to the code there is only a single call which sets the CDT 
> thunkand its in retbleed_apply_mitigation() if RETBLEED_MITIGATION_STUFF 
> is being used.
> 
> ITS OTOH only sets 'its_return_thunk'.
> 
> While the patch itself is not wrong, the description doesn't reflect the 
> current code?

So this is in preparation to allowing ITS to select the CDT, but this 
must be mentioned explicitly or simply squash this change into 'x86/its: 
Remove =stuff dependency on retbleed'

> 
>>
>> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> 
> 
> 

