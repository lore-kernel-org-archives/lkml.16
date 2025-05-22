Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7101C3C04
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907734; cv=none; b=kJH/O5jAHIxdHxDdq6h62wYr/+ssLKj5Ste8b4Eak/XyqXgkatA9fCXxurUtX3G+32zF0Xn6p7tIKNq4xnMo/RbtBSzfHH8nXn/JQTOSsLrmZKDnhTLScw4b/wksKJ/DqxyvVAUZs1o6PgXSdO09mnX0kTac+CVODDItlg6wyoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907734; c=relaxed/simple;
	bh=xV4GN8NTZQGrbOHhBmyR7WDzmGB3WcFfShC5kOWX+yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYD0SwhzCRTxaYHrEs942dwWRpF1ZFIYP+iu70ix3N0gwTYyFF/r4tKqk1O6fELqTQxkNCww7FBRbmFDK8F0zbT4K3Rh663IIXGAm0mN8bL399Ck3vjt4D2LBN5Llshkmw2rfZhyiXicwXnMbxJEdj1UAl+Lnoz9Nat3s5FOlMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=r3FV7THt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="r3FV7THt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-44a57d08bbfso5150655e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747907730; x=1748512530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N85CK9sWp6+mFnqAqGxmA0vF6xRLZ1OY4Jq5uN3nns0=;
        b=r3FV7THtMNcC5TFiMQ2vFMXj+1NExc1EGxMJx7GLdw3cnbQn/H0Kmd5I8fRKh9yV3c
         NqIpdZENt/6HQKLk2UABo1ZQ3mvMahq2UykniiK5dLMFaPeuUwl5X4F7eltuyvvuJrBQ
         zYAS0be6tQ4hs8ovV53mW+6+bSLcN8dLq+hp5hm2nqnv3PCioYQSa/YinfOtydMynY6E
         Is73Zf3eEcm5l4fVbeR1u3mtf8FqWf/jR6JWY9JFzIiuuCePjDiaE0sSsZ40wyyr9Obd
         aetKzIvf57rrzFxkG+FP6gl/0IhIz6PMs+JWJH983FLY9B5MX9hwcZOkSuS/AKB7qcm5
         O04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907730; x=1748512530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N85CK9sWp6+mFnqAqGxmA0vF6xRLZ1OY4Jq5uN3nns0=;
        b=coDmOJ1X0Tyn22JXElHEZhQdAz+QmZKgGva7gwpm+KU92neqHYIK1sjZr9dnv72jaf
         oWVM9DSlULT3vkJNa6VaOfvbHz+mlWgRqLWrJU3bpF6VLDTtOe4VoPsB/m7ABys+FmJ9
         1fUDH90BBUf++koKWo3WVuqR8OFLtmCtKbfPzrGqbbQ9YEFWp5C5AkLewwv/dskgLiwa
         DlWwAYdu0ijU++3opF48pgmFVh1t9SHex00qm1DUdv9cVY+ikMx4c5mWB096FinFRVYO
         Pgmzd4u+QPvx9Ocr9+eeojEiylxMjjsGVsPnMMqdme+rTZUFCtexyXYlgVH5kQgBvgez
         37PA==
X-Forwarded-Encrypted: i=1; AJvYcCXm59bBtla434Y45PZ0i4zoQ1N8Hrnm4G6HGAn8aA9inMMbHiovDhl6FO8Ofe2hVKMOGFtJTjWsElGYICk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2gyz6eUle7QnB5nzIY+XvjK/H5eSe09Fx1hc0GiHNkYD/B5+v
	VJ3Itlced1iT2jj/vDWHORaLYhj9ksdX55euN83PGGE8TOSCjeaKL74sWdUnepwSW34=
X-Gm-Gg: ASbGncvXkkZXdIONyM8TzXbRYqDduL+rO92kPyK66ggExbb2Gl9HmZrJN0jgp0fEPep
	SmcmGXvKYad1Qy3svqxhJtVLle0LNvf1Jk7s4s/zExesNRAtV8+HncoS2MgvA1ezXTEebRxCMie
	VPhTGq0ZNscmxXa7jPSk6iJx59ZDvznPLv7A7oGeOYJhcCUvjRhGWFoLNCUKngnwxgpcUdZ19ea
	OmwHnsZYfBY5T2lDoM3pGr0fN1gfANZmbu5lyjQKO87hZv7ZuBNCFK2DQn6h71lJfLJGYeShIGB
	pvHuzA9bnS+CfBiKrmsL9iM+IxKCKL3WA1sNR2UfDBwJwGfwinEIsfhB7j1qceWp8+R/TGYgGyI
	FC7/xe19i6B0a8kc91A9+
X-Google-Smtp-Source: AGHT+IGlBdPQ4Ket+t0Pzwh3J2o3hjvlvuhgKqsoA4ERFUZXVz8H96bSIMPAXq+HQL+iX73vE7/+8w==
X-Received: by 2002:a05:600c:c059:20b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442ffc60edemr147130325e9.3.1747907730316;
        Thu, 22 May 2025 02:55:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfdd9sm96314495e9.18.2025.05.22.02.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:55:29 -0700 (PDT)
Message-ID: <3c8474fb-75fd-4ea1-887a-53f625e4eadf@rivosinc.com>
Date: Thu, 22 May 2025 11:55:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
To: Qingfang Deng <dqfext@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250516152355.560448-4-cleger@rivosinc.com>
 <20250516152355.560448-1-cleger@rivosinc.com>
 <20250521074627.4042832-1-dqfext@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250521074627.4042832-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/05/2025 09:46, Qingfang Deng wrote:
> Hi Clément,
> 
> On Fri, 16 May 2025 17:23:41 +0200, Clément Léger wrote:
>> +static struct sse_event *sse_event_get(u32 evt)
>> +{
>> +	struct sse_event *event = NULL, *tmp;
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(tmp, &events, list) {
>> +			if (tmp->evt_id == evt)
>> +				return event;
> 
> `event` is not being updated by the loop and therefore is always NULL.
> Did you mean to return `tmp`?

Hi Qingfang,

Indeed, that's a mistake I made while renaming the evt/event stuff. I
didn't saw that since it is only used to check that we don't register an
event twice. Good catch.

> 
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
> 
> <snip>
> 
>> +static int __init sse_init(void)
>> +{
>> +	int cpu, ret;
>> +
>> +	if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
>> +		pr_err("Missing SBI SSE extension\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +	pr_info("SBI SSE extension detected\n");
>> +
>> +	for_each_possible_cpu(cpu)
>> +		INIT_LIST_HEAD(&events);
> 
> `events` is already initialized.

Yes indeed,

Thanks,

Clément

> 
> Qingfang

