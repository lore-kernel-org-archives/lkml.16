Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868BB1FF5F4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828846; cv=none; b=Da/Pv7TsfAUOIfHcyPx2PS+S6WlnpdHfano6iu4TkwvVW8RZxwKsWveJcIkiZ46FJGhRKePs+NO1ZpuQID6i1X6QAoAFF8fcPEMCpiWns7zSBdpEQO869rPzZxdY2uq/FVTBjQ3mziyn7EuGSoQ/rBv3PiVDSegRCOYzHKbkbPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828846; c=relaxed/simple;
	bh=mVbb4ScIhxRkfp203SPf9XqhsvJ4735LdOh908V/ZkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/N7R5lGsYl7K+ClTKlICrHIiNkJJF94Y+z6Wv+kIOs9pJ2CstZoLqPdlP2tAogL1rvjQ9ddYRE+6DIihVOjqQMizKHKOMKUP5T00Tj51+C+KsR3v1Yx2FIut38y+2zPzCUeKVQcpgr3+RT9BuMi7jeQlhLmiOUj2XZidKrgwAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jOiHK7HV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jOiHK7HV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436202dd730so3508555e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738828841; x=1739433641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+GCjkHP7kox+0IXgdQDHwE+WSzGHO5LcWVwz/Fztvg=;
        b=jOiHK7HVzNZsWwA4OVDktEMm9z3mH3ftO2Dmb/42tL7b6e4SlqZy/m5dHky711eeof
         pSYfvG4AOo7N+aXgP+/OaEFQlUgRitjIfJNTOitPeudK2WBRmTrZL8ZdpBxwht1VyHK7
         JNS/ix45aatKpbiaVk1pGf3EQdUGHoNTKSQyI34mvbyX07KZ/SvjCZJQ6Q09aGiC1SLf
         TD5hZruthdhHhk3WOcGHyDh1K+91wS29h4Q6PGzVvLr4ymhjT//aEJ2AFgCjx1apslYF
         M3ImrLo99AreZvDkZQCyjN4qxqDT2yQyHjMSfCF+0i7iemYgvxshp9q6jAqcvY0cFB6P
         8KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828841; x=1739433641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+GCjkHP7kox+0IXgdQDHwE+WSzGHO5LcWVwz/Fztvg=;
        b=ICLv5tsrmJN2Tckw5HvMVIhcnuZYMtAsdNO/VRegVjrhmGja/dg1d2SlDylpB+j5t3
         ULsCyPcOGJ60ZyMNaYgRJnPIcj42zfPf4EPcOzO64k64aRHq7Aw8xkKfrmzO9FMCDiPX
         +oS6OB4MDqcPKQmG/NlVY+ItIQoxrdEXg4zYK2Lqn9aF7f+DHZWnT/VqcO61mqgq/1zf
         OCMXgYhlMTWBbLEvKpxdVYhQxbNSCFivxWNspkhPF1+WQfK2ZalwAQBOpWmaR2M3vFH1
         XFPe1Mx7x4bsYqY17YWwuK6vBO0sbNsZHRg1fQBFHfXaw9UtG4zPhtRvnYUJ0u4Yp+7X
         mO+w==
X-Forwarded-Encrypted: i=1; AJvYcCWgi13W/S2XjzPSum+eEWRH32eq6kzoB3dFBoDLEBxJ/SeoEVYM4+j1Wu0uyVvhxvR82Eia0tCpH6YdNwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyA1Iku6rmRUMXaUVrSmjGkib/Y19tYqKi++shvxTCiMKF0/go
	Gj5L930hs6jtoCXHzRSG5WKLEFpax7xQlJlj9jcGlLEwhPZhsmwIBnIEoUscbfw=
X-Gm-Gg: ASbGncvSuZAi+xvfqoawEGGVCp2w8bzePsExwyztApGUqjIHlpaNA9SERh3BtbDRQ8N
	BMFyQJ4waAWTmA2v9Ga8pYsT0cTzBPwm1Cp59ak+Ity1Lpt7+8HlAmx78WTynrYGnJ91RKzH9U0
	6RPW6o51iXkzdVwc6z3Ug53eZdJk7nXa3PfjAhNGPColz3ahPEK/3v8d/WTd7SsQga5sWJHa7R7
	CZ0N3U+D/BlFtNz6MNjkUqkNK1UrKsOSeS8YPaHpx55irXQANppyP2G7G+3VY5w/06gveW+YncR
	n1+uICiRdBislRq/TaRrASoR/32h5HA1+/7u1gR5noeZooHRLLSUuEHaIJN+
X-Google-Smtp-Source: AGHT+IE63/d1YDQPU2ol7YBukKeXIHONwg+QpJ6YCVuOco/y8AfE/VDbKeCaRtUVyf+5SFyf0eqHZg==
X-Received: by 2002:a05:600c:46c9:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-4390d42ce2bmr43469615e9.6.1738828840662;
        Thu, 06 Feb 2025 00:00:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9648dsm10940205e9.7.2025.02.06.00.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 00:00:40 -0800 (PST)
Message-ID: <b41bdffc-6185-4cce-9ddf-cbb7b82145f6@rivosinc.com>
Date: Thu, 6 Feb 2025 09:00:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: hwprobe: Use BIT macro to avoid warnings
To: Palmer Dabbelt <palmer@dabbelt.com>, alex@ghiti.fr
Cc: jesse@rivosinc.com, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, ajones@ventanamicro.com,
 linux-kernel@vger.kernel.org
References: <mhng-2665f589-5f29-42fa-9c6e-3b00a39c38de@palmer-ri-x1c9>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <mhng-2665f589-5f29-42fa-9c6e-3b00a39c38de@palmer-ri-x1c9>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/02/2025 00:53, Palmer Dabbelt wrote:
> On Sun, 25 Aug 2024 23:28:17 PDT (-0700), alex@ghiti.fr wrote:
>> Hi Jesse,
>>
>> On 22/08/2024 22:39, Jesse Taube wrote:
>>> In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
>>> which causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
>>> these warnings.
>>>
>>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>>> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>>> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
>>> ---
>>> V1 -> V2:
>>>   - Reword commit message
>>> ---
>>>   arch/riscv/include/uapi/asm/hwprobe.h | 102 +++++++++++++-------------
>>>   1 file changed, 51 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/
>>> include/uapi/asm/hwprobe.h
>>> index b706c8e47b02..d0874ff2fd37 100644
>>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>>> @@ -21,57 +21,57 @@ struct riscv_hwprobe {
>>>   #define RISCV_HWPROBE_KEY_MARCHID    1
>>>   #define RISCV_HWPROBE_KEY_MIMPID    2
>>>   #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR    3
>>> -#define        RISCV_HWPROBE_BASE_BEHAVIOR_IMA    (1 << 0)
>>> +#define        RISCV_HWPROBE_BASE_BEHAVIOR_IMA    BIT_ULL(0)
>>>   #define RISCV_HWPROBE_KEY_IMA_EXT_0    4
>>> -#define        RISCV_HWPROBE_IMA_FD        (1 << 0)
>>> -#define        RISCV_HWPROBE_IMA_C        (1 << 1)
>>> -#define        RISCV_HWPROBE_IMA_V        (1 << 2)
>>> -#define        RISCV_HWPROBE_EXT_ZBA        (1 << 3)
>>> -#define        RISCV_HWPROBE_EXT_ZBB        (1 << 4)
>>> -#define        RISCV_HWPROBE_EXT_ZBS        (1 << 5)
>>> -#define        RISCV_HWPROBE_EXT_ZICBOZ    (1 << 6)
>>> -#define        RISCV_HWPROBE_EXT_ZBC        (1 << 7)
>>> -#define        RISCV_HWPROBE_EXT_ZBKB        (1 << 8)
>>> -#define        RISCV_HWPROBE_EXT_ZBKC        (1 << 9)
>>> -#define        RISCV_HWPROBE_EXT_ZBKX        (1 << 10)
>>> -#define        RISCV_HWPROBE_EXT_ZKND        (1 << 11)
>>> -#define        RISCV_HWPROBE_EXT_ZKNE        (1 << 12)
>>> -#define        RISCV_HWPROBE_EXT_ZKNH        (1 << 13)
>>> -#define        RISCV_HWPROBE_EXT_ZKSED        (1 << 14)
>>> -#define        RISCV_HWPROBE_EXT_ZKSH        (1 << 15)
>>> -#define        RISCV_HWPROBE_EXT_ZKT        (1 << 16)
>>> -#define        RISCV_HWPROBE_EXT_ZVBB        (1 << 17)
>>> -#define        RISCV_HWPROBE_EXT_ZVBC        (1 << 18)
>>> -#define        RISCV_HWPROBE_EXT_ZVKB        (1 << 19)
>>> -#define        RISCV_HWPROBE_EXT_ZVKG        (1 << 20)
>>> -#define        RISCV_HWPROBE_EXT_ZVKNED    (1 << 21)
>>> -#define        RISCV_HWPROBE_EXT_ZVKNHA    (1 << 22)
>>> -#define        RISCV_HWPROBE_EXT_ZVKNHB    (1 << 23)
>>> -#define        RISCV_HWPROBE_EXT_ZVKSED    (1 << 24)
>>> -#define        RISCV_HWPROBE_EXT_ZVKSH        (1 << 25)
>>> -#define        RISCV_HWPROBE_EXT_ZVKT        (1 << 26)
>>> -#define        RISCV_HWPROBE_EXT_ZFH        (1 << 27)
>>> -#define        RISCV_HWPROBE_EXT_ZFHMIN    (1 << 28)
>>> -#define        RISCV_HWPROBE_EXT_ZIHINTNTL    (1 << 29)
>>> -#define        RISCV_HWPROBE_EXT_ZVFH        (1 << 30)
>>> -#define        RISCV_HWPROBE_EXT_ZVFHMIN    (1ULL << 31)
>>> -#define        RISCV_HWPROBE_EXT_ZFA        (1ULL << 32)
>>> -#define        RISCV_HWPROBE_EXT_ZTSO        (1ULL << 33)
>>> -#define        RISCV_HWPROBE_EXT_ZACAS        (1ULL << 34)
>>> -#define        RISCV_HWPROBE_EXT_ZICOND    (1ULL << 35)
>>> -#define        RISCV_HWPROBE_EXT_ZIHINTPAUSE    (1ULL << 36)
>>> -#define        RISCV_HWPROBE_EXT_ZVE32X    (1ULL << 37)
>>> -#define        RISCV_HWPROBE_EXT_ZVE32F    (1ULL << 38)
>>> -#define        RISCV_HWPROBE_EXT_ZVE64X    (1ULL << 39)
>>> -#define        RISCV_HWPROBE_EXT_ZVE64F    (1ULL << 40)
>>> -#define        RISCV_HWPROBE_EXT_ZVE64D    (1ULL << 41)
>>> -#define        RISCV_HWPROBE_EXT_ZIMOP        (1ULL << 42)
>>> -#define        RISCV_HWPROBE_EXT_ZCA        (1ULL << 43)
>>> -#define        RISCV_HWPROBE_EXT_ZCB        (1ULL << 44)
>>> -#define        RISCV_HWPROBE_EXT_ZCD        (1ULL << 45)
>>> -#define        RISCV_HWPROBE_EXT_ZCF        (1ULL << 46)
>>> -#define        RISCV_HWPROBE_EXT_ZCMOP        (1ULL << 47)
>>> -#define        RISCV_HWPROBE_EXT_ZAWRS        (1ULL << 48)
>>> +#define        RISCV_HWPROBE_IMA_FD        BIT_ULL(0)
>>> +#define        RISCV_HWPROBE_IMA_C        BIT_ULL(1)
>>> +#define        RISCV_HWPROBE_IMA_V        BIT_ULL(2)
>>> +#define        RISCV_HWPROBE_EXT_ZBA        BIT_ULL(3)
>>> +#define        RISCV_HWPROBE_EXT_ZBB        BIT_ULL(4)
>>> +#define        RISCV_HWPROBE_EXT_ZBS        BIT_ULL(5)
>>> +#define        RISCV_HWPROBE_EXT_ZICBOZ    BIT_ULL(6)
>>> +#define        RISCV_HWPROBE_EXT_ZBC        BIT_ULL(7)
>>> +#define        RISCV_HWPROBE_EXT_ZBKB        BIT_ULL(8)
>>> +#define        RISCV_HWPROBE_EXT_ZBKC        BIT_ULL(9)
>>> +#define        RISCV_HWPROBE_EXT_ZBKX        BIT_ULL(10)
>>> +#define        RISCV_HWPROBE_EXT_ZKND        BIT_ULL(11)
>>> +#define        RISCV_HWPROBE_EXT_ZKNE        BIT_ULL(12)
>>> +#define        RISCV_HWPROBE_EXT_ZKNH        BIT_ULL(13)
>>> +#define        RISCV_HWPROBE_EXT_ZKSED        BIT_ULL(14)
>>> +#define        RISCV_HWPROBE_EXT_ZKSH        BIT_ULL(15)
>>> +#define        RISCV_HWPROBE_EXT_ZKT        BIT_ULL(16)
>>> +#define        RISCV_HWPROBE_EXT_ZVBB        BIT_ULL(17)
>>> +#define        RISCV_HWPROBE_EXT_ZVBC        BIT_ULL(18)
>>> +#define        RISCV_HWPROBE_EXT_ZVKB        BIT_ULL(19)
>>> +#define        RISCV_HWPROBE_EXT_ZVKG        BIT_ULL(20)
>>> +#define        RISCV_HWPROBE_EXT_ZVKNED    BIT_ULL(21)
>>> +#define        RISCV_HWPROBE_EXT_ZVKNHA    BIT_ULL(22)
>>> +#define        RISCV_HWPROBE_EXT_ZVKNHB    BIT_ULL(23)
>>> +#define        RISCV_HWPROBE_EXT_ZVKSED    BIT_ULL(24)
>>> +#define        RISCV_HWPROBE_EXT_ZVKSH        BIT_ULL(25)
>>> +#define        RISCV_HWPROBE_EXT_ZVKT        BIT_ULL(26)
>>> +#define        RISCV_HWPROBE_EXT_ZFH        BIT_ULL(27)
>>> +#define        RISCV_HWPROBE_EXT_ZFHMIN    BIT_ULL(28)
>>> +#define        RISCV_HWPROBE_EXT_ZIHINTNTL    BIT_ULL(29)
>>> +#define        RISCV_HWPROBE_EXT_ZVFH        BIT_ULL(30)
>>> +#define        RISCV_HWPROBE_EXT_ZVFHMIN    BIT_ULL(31)
>>> +#define        RISCV_HWPROBE_EXT_ZFA        BIT_ULL(32)
>>> +#define        RISCV_HWPROBE_EXT_ZTSO        BIT_ULL(33)
>>> +#define        RISCV_HWPROBE_EXT_ZACAS        BIT_ULL(34)
>>> +#define        RISCV_HWPROBE_EXT_ZICOND    BIT_ULL(35)
>>> +#define        RISCV_HWPROBE_EXT_ZIHINTPAUSE    BIT_ULL(36)
>>> +#define        RISCV_HWPROBE_EXT_ZVE32X    BIT_ULL(37)
>>> +#define        RISCV_HWPROBE_EXT_ZVE32F    BIT_ULL(38)
>>> +#define        RISCV_HWPROBE_EXT_ZVE64X    BIT_ULL(39)
>>> +#define        RISCV_HWPROBE_EXT_ZVE64F    BIT_ULL(40)
>>> +#define        RISCV_HWPROBE_EXT_ZVE64D    BIT_ULL(41)
>>> +#define        RISCV_HWPROBE_EXT_ZIMOP        BIT_ULL(42)
>>> +#define        RISCV_HWPROBE_EXT_ZCA        BIT_ULL(43)
>>> +#define        RISCV_HWPROBE_EXT_ZCB        BIT_ULL(44)
>>> +#define        RISCV_HWPROBE_EXT_ZCD        BIT_ULL(45)
>>> +#define        RISCV_HWPROBE_EXT_ZCF        BIT_ULL(46)
>>> +#define        RISCV_HWPROBE_EXT_ZCMOP        BIT_ULL(47)
>>> +#define        RISCV_HWPROBE_EXT_ZAWRS        BIT_ULL(48)
>>>   #define RISCV_HWPROBE_KEY_CPUPERF_0    5
>>>   #define        RISCV_HWPROBE_MISALIGNED_UNKNOWN    (0 << 0)
>>>   #define        RISCV_HWPROBE_MISALIGNED_EMULATED    (1 << 0)


UAPI headers should use _BITULL/_BITUL instead of BIT_ULL/BIT_UL which
are not defined for uapi headers (at least once installed for userspace)

Clément

>>
>>
>> Why isn't this one ^ converted too? I did not look but are there other
>> occurrences in this file that should be converted too?
> 
> They're multi-bit values, I poked around looking for a macro and
> couldn't find any.  That said, the "<< 0" doesn't do anything -- it was
> there from back when we though we'd pack multiple values into this, but
> we screwed up some of the value/bitmask on this one so it's deprecated.
> 
> So I'm just dropping the "<< 0"
> 
>> And what about the rest of the riscv sources?
> 
> Probably Jesse was just squashing the checkpatch warnings in the files
> she touched.  Either way I think it's a reasonable cleanup, I'll send a v2.
> 
>>
>> Thanks,
>>
>> Alex
>>
>>
>>> @@ -85,6 +85,6 @@ struct riscv_hwprobe {
>>>   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>>>
>>>   /* Flags */
>>> -#define RISCV_HWPROBE_WHICH_CPUS    (1 << 0)
>>> +#define RISCV_HWPROBE_WHICH_CPUS    BIT(0)
>>>
>>>   #endif

