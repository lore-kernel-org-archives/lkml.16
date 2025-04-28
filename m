Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B71A2390;
	Mon, 28 Apr 2025 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825629; cv=none; b=Wi03Lxc/aWnUgZAWUpjrGrHDTQO0ryU0u6N98uVEvuCQln2Mpj0smMquPCcEzqh3pS+Qb0IkpB3ImdxblzU7cht1lFqLpoVzzwpYF0AnAGfEYhpWPGXl3tHqd+QSKxDSLoJn26iWpJ0b9cnT9FdVyoIvjLyvsfdPT/u4MePYzwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825629; c=relaxed/simple;
	bh=w0trRv/aiHgdOVgWFwwCKH1rwU/eOHq5LBYcPpeyzFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzhPOmf6CgvsJlBsoVkswaR5zcPFCsPCp19OcXKeU+1tcqHtpyCBrV6VoPFkDNaKeGWWhDrIvAI4vDWEh3rrrScvsUZRQR7tEXtTJKp0NnyGkcrV7esg9PeqP+zX3ReTmXwd+ILwR1zwZkJMumm9SluBw6f0kF3szV4cvG2njHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqaXt4Oc; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqaXt4Oc"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7376e311086so5985110b3a.3;
        Mon, 28 Apr 2025 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745825627; x=1746430427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FqFx51kwbdn9/Yn2MOQ5kxLiDF6tT9b0pK+93MXGxpQ=;
        b=GqaXt4OczSGAKBn04jaWS7OGde8mOYIACthQD4HojNsrqzXl/HlWQgvt5mTHftgvF8
         TwTHbQ2egywSOCuXwzoj1dbd44aTP8AzhId8LpeId2ujh4mtv+wAsD2LCXS/ObptqSAn
         D3L90XkN8C1x0YDJkvBfzRcZZhQuyUbj2zmoqF1sOwTFtao7HdgdQVGUgRBinB1du87p
         xUYvbSB35l7MOruWr331/nbo/wa2YN4Gqg2kn102pPCUSrgoiirkf3NrHW/UTzlVAWSg
         POy+3i2HK4xtMKevi8FGwhrOxuIxyJ6I2fdLbYxq0pphnxMHT1K9bxRyLfh+frAMBrZ/
         qPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745825627; x=1746430427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqFx51kwbdn9/Yn2MOQ5kxLiDF6tT9b0pK+93MXGxpQ=;
        b=NeVkpXGO/RuKtuiWgWbKafl79gjk/wt9QHpGlmsbxAvL4/3glPe9hqcgGbFDj+ePvo
         VJSSk0syNCNjDjabjz8iK5cb6IL3/t0EpxbfZYcSturrDtDI/BdwhqD3o5jHRNktIALZ
         fFwhZITDkRog20DAzBOdBEvB/6Q6D985zTiUXkfpzE29UOYDOUh8pOSBWDFFijs8GSm2
         +SZT3mf/UQxh4McZz0apS6lrBtKzrm7ZGgxSQDqQP//fvGACo6odCKVWFC9++EGJiVCw
         WBOPCxw/TNQ4wWhqCYz2SeS8Q636ZQWRFe/fQSlJ1VjuuVgBjmLE+7mFBtXm/REL8izK
         ce8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwjI/G1fxJPWz6LbaLEaNO8Vicn9DcF3nF5+Fc0ygPKvMf1U5xGHCC79GJgM2lKt1GnauWF7sHlmiGAA==@vger.kernel.org, AJvYcCVPOP//C6fKpIGVud44VNS6H1Zj20bd0Q3uJf68ZsArMCa997GXbHKQIJ92t3iRqGoKJ6i5dG/Lpkyf6MJM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcv5xUY2O0GctRDq30udPZHrzqxlKlGohQa+8JVDC73K/LAPU7
	rUheBHCJEYuhFvL9Gpq/4lHKkJ8Rjk7MwBkFIjJzkdBXRHtGWzIN4k5NFA==
X-Gm-Gg: ASbGnctMtdVMLVEGwXIC/2mHX8q21+pQ3fTVq8cqINZi+CScy/LI2kTV7eKeY7jzJr3
	ptHCNHU3BHRltTiI3lL+03ltLXaVGABrXEezbhpEQzKTNSUgoIExcRGtHrkqt4g/Qalpdge0ZCY
	6IUrmOEJ88Hl6a4ZSIxWnjgRXt45d79KgQVmArr6nDGlDms+FaWNiDRPuMKeU11aaaxY8EUP8kR
	vCtjTPZUxRXvufAkrx+8J4KDSF8sLZfK4fHCxLzyo/43BkttpWh6C5mmO/Sjw6Pdad+bFOS8c1t
	Hje4vxklt2+xxhcIhgUqSVxeV0EvnY4mzZ0izouFhPc2JkKCcRGZaCJ8orHfK4SLSM4c7sHsWjO
	qApG5bbIcp4CuYA==
X-Google-Smtp-Source: AGHT+IHqRPUFqdNxA18OJ5g8x/iCKmEjMqe3djDNqB8CeqJzs90fQYDM3j19oovnKg2G7Nb/eVUU8Q==
X-Received: by 2002:a05:6a00:3255:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-73ff816def7mr7131663b3a.15.1745825626611;
        Mon, 28 Apr 2025 00:33:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941e6asm7547701b3a.61.2025.04.28.00.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:33:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8dec9c47-d13d-4e59-b1ca-fcb9e3beccbd@roeck-us.net>
Date: Mon, 28 Apr 2025 00:33:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid
 sensor index
To: Eugene Shalygin <eugene.shalygin@gmail.com>,
 Alexei Safin <a.safin@rosa.ru>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20250425200051.2410-1-a.safin@rosa.ru>
 <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/25 00:11, Eugene Shalygin wrote:
> On Fri, 25 Apr 2025 at 22:00, Alexei Safin <a.safin@rosa.ru> wrote:
>>
>> Prevent undefined behavior by adding WARN_ONCE() when find_ec_sensor_index()
>> returns a negative value.
> 
> I'm not sure about WARN_ONCE, does it bring anything useful? Clients
> see the error in the return value, sensor reading is absent, do we
> need to duplicate that in the log? Guenter, may I leave it up to you,
> please?
> 

If this is seen, it is an implementation error which needs to be fixed.
Returning an error to userspace will leave users annoyed but will not
result in a fix. The warning backtrace is warranted in this situation.

Guenter

