Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723423BE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849025; cv=none; b=iFFM76EcVtd8cJMx1jDn3l8g4Thntt5sLdAXdM12HCnyNTP8+FTM2G1Il5RFLQJfZdQmcChh54xXi4VdVBTAB9sdykrWNzrd5MKLjvdPBHXb43E3zqO1UTZxIJhNwd3Ni2aClatzFyqGuMy+vn1n+QxlB+GYefEASlTshe6ZFTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849025; c=relaxed/simple;
	bh=L4aG1+L1krMjLXDIAZtwRmNMTb5c0HNpTgN6ft1Ffz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkJ6zLKXLv3KFHC2BeiuclBY0DQWf/T0I+2kSsXn2fE3RNnt5LFowsrZ6tFZF9zbNpFo/GRAgQRk54bC7mCtw7StsiRGNk7xi69AyE20G8wyGRv3mrgtH4KO007S4kBA24wn/23PWob0rv5+xYMj22BJr2MDemg3IDgwBS8J2Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcJG7Ijc; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcJG7Ijc"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af523f4511fso159858a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744849023; x=1745453823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou/vN4o4n3TBeIVFHaSiKpFZDK8cAIRKfyt0XdDezGY=;
        b=XcJG7IjcUydXuSh4JqX8U6xvPpFtfsjki+BMuGFfk6xv1k5sr5g3/BGWfCHm726QSj
         HEX13uuYEO3vIBcfLlPPsyOfQ3acw29Qso2BnqjmUF8l787qTfcK+5UOcPrDNLfBo2IU
         xMleqR3Wd/HwgXZ+LQBzCollqnYyJiA3/CaxduxqNybyVkyld27odYI+7e/i4oYk2w2I
         AQx0hgZ9WQUTGwBiFka/xhMWGX96rNpCoIz1edBs5BxWDWW/C8v/TaKvJbEHARxA1opH
         cWgRQQ+gOxRuMv2rHMaNPVmC8YmM0vyvfVzsyLXBDXTmQ3ho8clM5+8VNznY2DHQAhi8
         ps5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849023; x=1745453823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ou/vN4o4n3TBeIVFHaSiKpFZDK8cAIRKfyt0XdDezGY=;
        b=VhCbpCI4lUlOlNygnR2bbMmp0lDIx/SiZbIG92RyNlRO4lp0/KOkjw+F57633nqeqk
         52Gyyu2WkJ20FK7eZdBXwigMI6PWdtyXaEDtiq74WuoaLmgfd5VpHEghnphOC/P2/lXL
         eUXV0ijehXUCQ3lZ1c+3VvvPzQedc8hUZ2unrevlDw6hLVoGHNXnjd5lyUPgukkyVn9/
         VY95ZuZ30V3Ibrb44e4BUp5MXays9C6yD+iq6BoGA6sBCUik7jtKm8ECUOOhrdiFZrVA
         nLwrJoLeYjhqgZfGHJvcmxzZ90g3PCbFsfz+CJrFbsO3PrWJ99tEQ8xr3yMP6bIv3BIq
         kBlA==
X-Forwarded-Encrypted: i=1; AJvYcCWjiHcYo0vXEzqMduact2WaTTdqXnfSD8zpfhsdGdeFnk70mPzsxxA6mqWzFy0j2vLU/cCSDDzfjOAaZ1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YykrvQxY1CQpLpyvIO8kcFrycTrkq5lxbJyqGPzrsENECACRiWZ
	N1QZVxhcDh+5MDtPy2JepmiRTmDWA3Y4Ysl82Et+zhCdHissackE
X-Gm-Gg: ASbGncslHx6CBoSD0MbE0i3USmsk1oMYWIzmZGKXrkwUP8hIL8OAktMK+mBcLM020k+
	U6Cbp9lORgOYSYXAwHAmhpPun2SfW0g05AfjPsp4vgfApcEeX4CtOCc6ZusDH6MaWxJKEHfzw5u
	uFr2E7au/VDWn117/K8CUDWy5zezwLNGntJP+c5j5BcF9p/Vc4QPoqC5XquVuf/i+vP8ZItLPDC
	kXd4JKcPTkMJ50hcAvHJjS46iul/UhZp4MIobfK5GoAp+GTKVbmwQ407Mm5T6nZpXfeLXRosB5S
	rp5WBUN4ZOphdSh+/PU8+BFnI+lGAdsqxvNVr95Zp8UftUyqncN88W5vsO8GEZ/c4ERxXg+1AMv
	CrBTjPu9T2+DgVJQ1w9s+uWSv
X-Google-Smtp-Source: AGHT+IFMlrsbP2bFmaha56sPH+o4Xf9ssQxi59Scyc2jAjEcnGy1fIixcrU8jXPSzs2Gmrqloly3zA==
X-Received: by 2002:a17:90b:4d0f:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-3086416638dmr5022435a91.25.1744849022538;
        Wed, 16 Apr 2025 17:17:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2f13sm2551008a91.36.2025.04.16.17.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 17:17:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4d9cb937-2a8a-4b3c-af32-f8fae922aa5c@roeck-us.net>
Date: Wed, 16 Apr 2025 17:17:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/Kconfig: Fix allyesconfig
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
References: <20250416230559.2017012-1-linux@roeck-us.net>
 <20250416170359.a0267b77d3db85ff6d5f8ac0@linux-foundation.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250416170359.a0267b77d3db85ff6d5f8ac0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 17:03, Andrew Morton wrote:
> On Wed, 16 Apr 2025 16:05:59 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> 64-bit allyesconfig builds fail with
>>
>> x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
>>
>> Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
>> testing") as the responsible commit. Reverting that patch does indeed
>> fix the problem. Further analysis shows that disabling SLUB_TINY enables
>> KASAN, and that KASAN is responsible for the image size increase.
>>
>> Solve the build problem by disabling KASAN for test builds.
>>
> 
> Excluding KASAN from COMPILE_TEST builds is regrettable.
> 
> Can we address this some other way?  One way might be to alter or
> disable the KERNEL_IMAGE_SIZE check if COMPILE_TEST?  That will be sad
> for anyone who tries to boot a COMPILE_TEST kernel, but who the heck
> does that?

I tried increasing the limit. It didn't work. With the RFC I sent earlier
I made it dependent on allmodconfig, but Linus said I should just disable
it for test builds (which was the cases anyway until commit 6f110a5e4f99).

Personally I don't have a preference either way. I can also do nothing and
stop testing allyesconfig. That would help reducing the load on my testbed,
so I would be all for it.

Guenter

