Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B43214811
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280788; cv=none; b=sIlFYusiImnf+k8YCOt128obnmOcJDI1JV6yKdxeye2TCIYzUaCWW2wvuYZL87U3yzXdo2m0A9PB3yUHW1tHfrBr50G32lWqXQ5DDJ225UMZ7aY85MHlh6VpafVCUFxtDlXaxHQnOgL3kVfXx4gx7hVJrGrG5Ez05k9c5HKYD7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280788; c=relaxed/simple;
	bh=F/uVM4urhQmPU67aNljV30BzNnXlmck7yA4IpjXNK8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJpRvgmpEbG491R6aS9N+OQZd8PGkR+L96H4cmYq+PAb1sBVLRLNANlf8HYNHWuAtC9ZL71/pjd3fZj3fuFGvyAhhzGef/mxZEB3CVCw74nozIq9iKoC3X3HVl8s9GSBpmrivDg8h7XhJXsLAGC74ipggrNVTrqEFxp6DC+ET5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=iTeYHwbr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="iTeYHwbr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso18254935e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739280784; x=1739885584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wrmDUq/HHsKw+sefoEbxInuEgbCMl1q15xZjalPz7Q=;
        b=iTeYHwbrE3I/skGQErBc6mKDGWpUjWEGaITlke9puMzAKpoABdBckyxkW9yav3Em6n
         k6Vh2tWMU0veNz03SKWBQWUCjSN5nJzGgzx+yjk0LwEDN5ndW3kdv46mQoaGMkkiGZ1k
         EUls8eBiUBfadhnSbrr6mLkmGuiAozBtJKVoEly+pUSEA81i4tZVJhFfxov/cF78dc/c
         X87eqQeQdL7kRIA0dbl3gXEGbgDI2gx757INHJAJwN+cSX/rp2ywP4CVf7e8ZMvKITDw
         Z+j9RUmgLhV9LqVLKiTf/UA4DtmnpFqhQo0F9VUcyLxNqlyDJ0f/NxMJR74fgoFKuQJ5
         x+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280784; x=1739885584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wrmDUq/HHsKw+sefoEbxInuEgbCMl1q15xZjalPz7Q=;
        b=Yxu6uLKJcvVAYXkXymMvAARgvqlfdUdjZQqSFiFYkXlb8SQK93p0LrXEM/Kqk/RW6+
         cXgX69RkICL3QkhtISYFkjSVtxglTMgvPqBsGX26l9uFuFDQsS3sTPb4RHLdTcTTVlhs
         4bVqzrk/o9XOLoGGTTwlx7fBDQsCD72vB4bfoYp+zjfBtnQrLXj1scLa7xvVCOEwXeoL
         TxY9hzTMfqxYggmk9EKy4Wu85776b6Y/OZ7RMmAXfSUbDe7oLCBXkA+/AhAUqUKxU+hZ
         ts4JKCuZ4fKzXR7YlZnugDVBCgh9a/5g4cjPi02JA9NqZfGY/G/BBq6wcEQ0CYd6W+2b
         cRpA==
X-Forwarded-Encrypted: i=1; AJvYcCVi5HnnpR294u+2J0Nfz5dVO5dkibsd787sYQnbpczGTYjkezrXwjv6PGQaDWDANTV/lIPU+8HzusyAQm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8HuiHqjizaA0GfC/q5Eh5iwMyBmNRpOqgkVHiBon4zFnm0g2G
	WvCSRyNPZ9pbX6oSkIkZyfHEUUIOrSWDdHXA71C57Wx//AWlHBnwDXnOL+NRTno=
X-Gm-Gg: ASbGncsSwIcd0WLme+eheyoMnWgxPHmhEwbkZHSoT5Xjy/QBXe1JzC89IM2jR/PLXbH
	Y94p8khITzNJ2/IgsQ/0yin1O8Ui1Q9QafPH5GCt8BwDEuH24uCoJs5lVt60QicJPsxLq/clGjL
	yKwZkk++BxwiRUP6+FlDXwDXgJ1xZRyfWtyovU7uAgwMm7anMAYPO2+b7cEw39kgLh3N0ed0GFo
	/56PByvYJ93ybPlqkyI8NJE/HlN2H4RSkqGvA5fKbjNiFsnriePgORo8v07NNntdLcYSfNDTwVC
	stUbQLvk9SSL4+WptSuzUK04UeDFepvp3iFvTW7SZqEbD/90nqDtyuNuG1F+
X-Google-Smtp-Source: AGHT+IEqlc/lpTpwK9yYW79C3YmHjyqoHdYU9IFEmIVHONYafZyXfrM25WF2Citl+iuABPW8/Dn2HA==
X-Received: by 2002:a05:600c:1987:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-4394ced8c52mr27059525e9.12.1739280784044;
        Tue, 11 Feb 2025 05:33:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43935d4bd5csm104208905e9.6.2025.02.11.05.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:33:03 -0800 (PST)
Message-ID: <e0225e44-b86f-4935-b524-86a28131fe7d@rivosinc.com>
Date: Tue, 11 Feb 2025 14:33:02 +0100
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
 <f1ce7aa9-63e3-41bd-9bb0-a54ebc714dff@rivosinc.com>
 <20250211-implode-mute-8ff31f44bdf9@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250211-implode-mute-8ff31f44bdf9@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/02/2025 13:34, Conor Dooley wrote:
> On Tue, Feb 11, 2025 at 09:45:44AM +0100, Clément Léger wrote:
>>
>>
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
>>>
>>> Link: https://github.com/riscv/riscv-crypto/releases/tag/v1.0.0
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  arch/riscv/kernel/cpufeature.c | 49 +++++++++++++++++++++++-----------
>>>  1 file changed, 33 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>> index 40a24b08d905..1c148ecea612 100644
>>> --- a/arch/riscv/kernel/cpufeature.c
>>> +++ b/arch/riscv/kernel/cpufeature.c
>>> @@ -138,6 +138,23 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
>>>  	return 0;
>>>  }
>>>  
>>> +static int riscv_ext_vector_crypto_validate(const struct riscv_isa_ext_data *data,
>>> +					    const unsigned long *isa_bitmap)
>>> +{
>>> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
>>> +		return -EINVAL;
>>> +
>>> +	/*
>>> +	 * It isn't the kernel's job to check that the binding is correct, so
>>> +	 * it should be enough to check that any of the vector extensions are
>>> +	 * enabled, which in-turn means that vector is usable in this kernel
>>> +	 */
>>> +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X))
>>> +		return -EINVAL;
>>
>> After a second thought, I think it should be this:
>>
>> if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X))
>> 	return 0;
>>
>> return -EPROBEDEFER;
>>
>> Extensions can be enabled later (but can not be "reverted") so check for
>> the extension to be present (in which case it's ok), or wait for it to
>> be (potentially) enabled.
> 
> Ah, of course it is operating on the /resolved/ isa, not the source one.
> Makes me thing the parameter of all the validate callbacks should be
> "resolved_isa_bitmap" instead of "isa_bitmap" to make things clearer?

Yeah that would be helpful I guess.

Clément
