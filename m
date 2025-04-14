Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3761E3DFD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662471; cv=none; b=SOxwdLwmK121LvoayUZkVdO+pYw0vCtmlUCXEkOq0ocE8aLYI8P0X5W8yN29FpYY8y82Mfysz5OlHtk1+/z31E4LnmKhQXZe0p/E1CRTTmL2Sl3829CumpLb6ohwjIbsGu/LmrCCwpXeAEqZqCkV4y0oA+lhOcLJ7UXHSPGh1OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662471; c=relaxed/simple;
	bh=i82yG4DPYcbhR95YOHHytAKOvdfKDBlLSc5uac84AF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LPnj1UuLLFIRJ6F6gSgsmy/zsGh5nr04GQNeuYN3nY63y1vdL+UqqlfaGmO7gNozXE8NNKgKTFwLE1gSFZSmXBgpoN0CgAck+o/FosxK474wmqbHfndsHOYWXcy/HdSIv4OKqEsAaUIVAwwaXYO9wpbWkGLtLCDA+9oDteH6UwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RS0tZGJO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RS0tZGJO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22580c9ee0aso49975145ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744662468; x=1745267268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FpFBwiHdEgQDg0IQrpqMzAFITSNp5w8uPN/sxeBVsiE=;
        b=RS0tZGJOlqZluny2+5pE+u/kq5+59Be7LJ2FjtljJfRA1ojHMOwYybApRMlc5UwWnU
         BOEeTzBS2Nj2+2n3DRJiVNCX0HqDkYyIBaCyyjuGANZGIlPO6tdN+ByjH27zIxbP6xuz
         w08X6QoFXlNglLRLlXJMKub4Sy6IuCkfOt2NxXdSLZkU89KBlO+JFOwhU1V8Jr2C9ZN0
         iaUUxqH5PwYvd03aO4NCIIMvO0pYf5K5eYRwyn0ueNSkMi5fuoWuejNlmFcjdZ0xtmRC
         NCQZR8TNh7uBNnD0yInsRm++6ohmcBpnVTR0uSIoP+d3L46naYRzdd2qM4+zBxtwdQ3C
         uA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662468; x=1745267268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpFBwiHdEgQDg0IQrpqMzAFITSNp5w8uPN/sxeBVsiE=;
        b=Egcg9ATujqZ1gGk5hL+Neyl8WZ1ytF+MQPdgR/lQHAI2FS8q78cEtwJ8dMnTfoOyYJ
         9ruZ2JiAMOj+edb/djI49B8i3EnrTNIZtVkEpXqybdLTFdJPIgq+/B8HwRnVkx+BoQ2K
         JlS96YOx8Yp3Ppj1gRkgt/PjPhi38/PTmRZUQ3ISjinGtiKsFg6Wgh8LDJNjq6EF2mX1
         Y/cujx1RCvaO9iu4rAyu55tmnEA+FznVWjlKQEY5un6ORMIeXHjHu3dRlkm/ek71gr8I
         xjjwX72RDoB+/zHZFsmDeQTFe4Rni4VPKfY8hGnkI2YHOD5u300b4O5OIFOsKSw21Jbk
         qg9w==
X-Forwarded-Encrypted: i=1; AJvYcCVu9Pq2DZIkDuSmrnIrWD7tmcnvwUyMann8++5TxFKYOWWO9N6hElEREA9E4z3LMA3xjkm64lYMqb1G/gg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3BINdD2aDW6X+q+g8+euU8ucdPbkNU5cZbI34hX4kxM1Yteju
	ywsQJFo28QtH6i3NzQqqANXQAn1Uq1QH/5vwGfMshU7q259Bk/aS
X-Gm-Gg: ASbGncthncJhwGbO6CT6RvgyIE00DURtCljTO0ei7W7iytuXWmORxxzfAoKswyz+sXP
	r01OUOC3sVVh+B46pyZ6XqUDcFP9T6+7PWZfz6U7FifmcquRXxpLGe9yTrNn+EET2ZVQbcVCAiW
	fkV5StL3ARGTowbkjWc61ohvPvczG2b5C0+iGl2rdQrQ0Klre3ckOQdLqvwq6ERyI8tMvCyxhX/
	uSGADElRcqZvUbAESZ9OUeikO71tpXpeCi3+8TfSxpCNYF3AWJZm0rq17XWPHHQHvQaHNU3Hk1s
	wXPM9MgDviXFnXqLLAk2EbguqcuBYYo1X6jn4c0Mdq6ICAbo8ycLFkZBTON5rZDCO5O/KxB9I3g
	+uyA1/4nZGvwpuA==
X-Google-Smtp-Source: AGHT+IEH6rm83qe55w5eYPTK09xwjLp1XyL/RYOAOdehM9RFwyc8sk1cDQclwnH6so0wfxDuADpBAg==
X-Received: by 2002:a17:903:1b08:b0:21f:85af:4bbf with SMTP id d9443c01a7336-22bea4b70d6mr191325105ad.20.1744662468302;
        Mon, 14 Apr 2025 13:27:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cbasm103251495ad.133.2025.04.14.13.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:27:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f87758bc-8298-4135-9410-34c2afa1850a@roeck-us.net>
Date: Mon, 14 Apr 2025 13:27:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/Kconfig: Fix allyesconfig
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
References: <20250414011345.2602656-1-linux@roeck-us.net>
 <CAHk-=wir+NJgwwrmRzj_giQYBuXBh=NRhhnPEqMmOM-phANVNg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAHk-=wir+NJgwwrmRzj_giQYBuXBh=NRhhnPEqMmOM-phANVNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/25 12:59, Linus Torvalds wrote:
> On Sun, 13 Apr 2025 at 18:13, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Solve the test build problem by selectively disabling CONFIG_KASAN for
>> 'allyesconfig' build tests of 64-bit X86 builds.
> 
> I think we might as well just disable KASAN for COMPILE_TEST entirely
> - not artificially limit it to just x86-64.
> 
> Apparently it was effectively disabled anyway due to that SLUB_TINY
> interaction, so while it would be nice to have bigger build coverage,
> clearly we haven't had it before, and it causes problems.
> 

sgtm. I'll wait another day or two to give others time to provide feedback
and then send v2.

Guenter

