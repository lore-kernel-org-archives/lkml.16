Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156513D897
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738846596; cv=none; b=ZYew3BHMbVzsD+MPqn/HfgPq5zQsJiqLoVPp8hU/QkDj2ZXF4Rxna8wvfqeebrpEBGSZ9mykrWnSYxCsO+QNC72yWVt3b375jSa4kQ6ztPa0JUzwD9oeiv4YWxccMSZ1VVzJen312eJQSBE3MS2gWZ6nGGUHQ2wMvIgdBhpY6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738846596; c=relaxed/simple;
	bh=3g/wINSloqxIGUCYfp0t6LFlzfc4hL1rcpwnzCDRZUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/iPMgIQNr50Wbv8HuWNKmuxLFR4dQmjILlqF3FErZVIwppgS6BnnW4B+iiShTQVFkXKxB4wEnJE3EGbUaY1huxmHjFmWk4RIl6yUrzpJKxQ4JluL07uHulmLoSchPKURP0rF8un9yF5DVCX24yeHZwePoTwCqf9HmFxfCm7LRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=A4amCw3V; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="A4amCw3V"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361c705434so5950175e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 04:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738846592; x=1739451392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSneZhQMz42NLjIZ9INmqk/5Ehqq2enW8mbh8jsOOB0=;
        b=A4amCw3VFFd0gqBO/UFM9gSXELeRlXBB9b4KhozlMibnc0gaeTU7yXBJHWx5Z1yOvk
         Cyq9Qvb/FQDfnCJPTCAJHZ/fq0+2oMknHkagt8Cz7RuajqbCbM1Mam9DfHm8MfQjsqi5
         4Ic3/X5ATY7okVNjiH3YK3U4mFJ3SyD26weUHTLB3MRjR8wzUrvEJC+qwXUpJVlWcHeE
         yR4ZN3te1+8kmQKsSkpVbDBcGCOj1k9KgyLJk41iBHTzP7/vuDKTxd+ayiLbHFyoPrD5
         I7Gp/AOJgCxquSVSzB2M3u/hBJ/OO8O5eyrVboAKEGsf6XYuoFEVYiVY9Z5wD8IpAfz9
         elVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738846592; x=1739451392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSneZhQMz42NLjIZ9INmqk/5Ehqq2enW8mbh8jsOOB0=;
        b=mm6oF9UwAeR1F3eaxIJ2/MNhaz+6F3tHNZKKj4Gf4Z3ZZ6C6WZTiHXzJ5QoG2LCD7T
         5UzGQ8Wof0M/fZVKgp7PaQChPay+amifjTkANUjG4dqbyJurQUmQy/YKQY8t8jDdo0Jq
         FFCk+uEUmz8hGhgvt6/P8RIHj+Id8DeRSk4slIkpcfSr/m+tb4bzeIWrCKF6gcyTeNQG
         SysQoYqy/kPGI1RwK4bUYbeF1t8lJbIOCYEXT+hjyGS/uEn2aigXOkKNKIQkl2sLS3XE
         x8pxMUsxVI1XQTEG8I0Dpfmrfjd32yZoFuHnK9GWOkLrKiCcs7JFXmu5s+QpQ/rLQD7M
         Y9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCW4SyMwTQMd6chro7OTxHgw613bL7n+R8zV8X4iLYAbao0R1MmQ2m0Z4eQKu2IG3KgVjoE0Fb0sMu1jUj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YymS09WL7DuoFjLfXO+YXkYDomZDMnMQS49ywokWZLkGamDOxmV
	owjpxPk/S8aSxI3lWNVESjIlZHYJnc2qgkxRgCt2PKAJrU2xJClA///gzTsnJOI=
X-Gm-Gg: ASbGncvWRtD6YB9MmzSHh8lVjXzYbr+OHeW61gIxOL3h31Y5IKph4VPYfVzCjpL6ZkB
	RtXkCJaMhiRPqToidjHt/S7x23Kcniz9k+FQxXcg0C0T2e4rrumxGR0qnPOjFmsEQlACzGEHVrq
	Mi9cTAgBoPSvjCO/X3lc69sMQh31XnnSxO66gZWWJjzL9ZIxEk3Z+j85rncr1CcQhRZBcnxFSGV
	88U8Y64A0sjaQCuVGFNba41dMhs9QHHYUkqbJiorUY/n8WBQ8VPnEGUxdX6JOX9SUEc2LI6/pR9
	c9YqtOHJkVL48qRlpSeBaSY7f+lKYEjt8lzku3x53KvWwH1E3lz+GPPvYn7H
X-Google-Smtp-Source: AGHT+IHo0rAwCXLXwfKWz6RSqfUjc9Bk6Vt9OF485t+NIZ62i+CSdactAKssxCygX1CrtVfPW8ntaQ==
X-Received: by 2002:a05:600c:3b0f:b0:434:a529:3b87 with SMTP id 5b1f17b1804b1-4390d434065mr56547865e9.10.1738846591542;
        Thu, 06 Feb 2025 04:56:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd8000sm18420605e9.37.2025.02.06.04.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 04:56:31 -0800 (PST)
Message-ID: <00485221-2343-4d5c-93ca-3a28a59427d2@rivosinc.com>
Date: Thu, 6 Feb 2025 13:56:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Eric Biggers <ebiggers@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <00dc2fb7-da9b-42c3-9c3b-47d917df7cf6@rivosinc.com>
 <20250206-overcook-legibly-0350a9af8a2a@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250206-overcook-legibly-0350a9af8a2a@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/02/2025 12:24, Conor Dooley wrote:
> On Thu, Feb 06, 2025 at 11:20:35AM +0100, Clément Léger wrote:
>> On 05/02/2025 17:05, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Using Clement's new validation callbacks, support checking that
>>> dependencies have been satisfied for the vector crpyto extensions.
>>> Currently riscv_isa_extension_available(<vector crypto>) will return
>>> true on systems that support the extensions but vector itself has been
>>> disabled by the kernel, adding validation callbacks will prevent such a
>>> scenario from occuring and make the behaviour of the extension detection
>>> functions more consistent with user expectations - it's not expected to
>>> have to check for vector AND the specific crypto extension.
>>>
>>> The 1.0.0 Vector crypto spec states:
>>> 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
>>> 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
>>> 	or application ("V") base Vector Extension. All of the other
>>> 	Vector Crypto Extensions can be built on any embedded (Zve*) or
>>> 	application ("V") base Vector Extension.
>>> and this could be used as the basis for checking that the correct base
>>> for individual crypto extensions, but that's not really the kernel's job
>>> in my opinion and it is sufficient to leave that sort of precision to
>>> the dt-bindings. The kernel only needs to make sure that vector, in some
>>> form, is available.
>>>
>>> Since vector will now be disabled proactively, there's no need to clear
>>> the bit in elf_hwcap in riscv_fill_hwcap() any longer.
>>
>> To which part of the commit does this refer to ?
> 
> Copy-paste mistake when splitting in two, whoops.
> 
>>> @@ -397,8 +414,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>>  	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>>>  	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
>>>  	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
>>> -	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
>>> -	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
>>> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts, riscv_ext_vector_x_validate),
>>> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvbc, RISCV_ISA_EXT_ZVBC, riscv_ext_vector_crypto_validate),
> 
>>
>> I'm not sure if I already made that comment, so here we go again.
>> Shouldn't Zvbb use riscv_ext_vector_crypto_validate() as well ?  The
>> spec states that Zvbb is a superset of Zvkb and Zvkb uses the
>> riscv_ext_vector_crypto_validate() validation callback. I guess Zvbc
>> should also use it based on your spec excerpt in the commmit log.
> 
> Zvbc does use it, no? I'll amend the Zvbb one, there should only be two
> users of the "x" variant.

Oh yes Zvbc is already ok, forget that then.

Clément


