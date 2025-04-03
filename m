Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86C2E3385
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673736; cv=none; b=Scwrzz306o79FLB4/6Gi9M8/sYvskZUmc0d4d8nuItZO+cjWWFpyDNm7TFuKZPqL4Q3nlfPazkwr7goPBM3siaSwp7tF2QdCH6PTyErGZ1c45KJlElZovbTNEuCByAl88ODcyNxvxRL7Hvmdaz03i1mVmRdSJeQ0Ll6YTQdECVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673736; c=relaxed/simple;
	bh=D1u3Dw16nTQapd7dwi6wT8AkSNR7lRJ/GJGmaBis954=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5xTUNtYGRyBdNIk92j9Ma+3VfufamETaKmKJc1sCAFS27gA2gw8S+8lCMBOYCembaf+h4yIoAsKQ1aH5FgN4MpzFV+BRudi4rd60BRJnyGvCEz7TW3mG0bn6ok+5I9HH+EILPFPgMQ+yu86w9VYw0pTzvkp0h+e97Xli6VT0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=enYYufhc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="enYYufhc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso623362f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743673732; x=1744278532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Psp9hh/unXclzKLtQPwrGIUeNhodK6mFG+ltXehZxM=;
        b=enYYufhcB1BwSLrAHsU2mQ+Zs4y9fg4X7nTBIrGQT23ESPAL6By3gyYgZJFSnywr17
         vS09HAEJGoSnUCgSUXPUMunNdFnbzUMHTSbE2d4wDm+YuGtZz4oiyw4ZK8YC46lTxF0M
         wo13SGfUIApFDVPhU2+4+f0hEaPBSLQDkoAlWsLNXABYgEjQj0TyxaHbLeH1HgB2r0Zp
         txzehRIA4BllvHY3B6kYCMRNFp0hV7XYXOySKyC/xUt3Ueza0Yy8z8McYUwYn/FUq2hA
         ZicpE6l2Te0uuW6axjBhvF6xPhcem8yYYI4CiWHcMH77UgG1bJBWu9Mx/0ebWHdfWv3f
         TwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673732; x=1744278532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Psp9hh/unXclzKLtQPwrGIUeNhodK6mFG+ltXehZxM=;
        b=BEC5uoJyKaygrejP83vfx9nEd3gJOjN/1esoeUlmLZV9cC22i3WgTX/X1SuR+ZjrAu
         SSDEmLnCtDZJo10wJIv4k010dhW6v+Zf9UbqAXPmYr7KE/ymOPunZ/Ca5v/fG4lGn/wb
         JxJtXsjoe8cUVdSRfmsFGZnPiwquKNOYOEnsp0cd0p/sVzd8WCxMxn8KWfRrQEwHo8Q2
         uDd19vYT2UbPff7YlbqtJDjSopVX5Rnvf37FBtdJF2JtAkKUAbkJHV8Xy0OOFaEUrWlA
         fRt1qZF5BU19eVvTOlOSTEBR3eWQsxlSxK1KGjJKsnGSurdVEI8e5A13O6iJHz7aBSB2
         Y99g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6A9JmshLGrqW+h6ybafpPixyPkJkuxCnhS8KyAaMnQVcH1YSv8EfFo1EyWHiE1x1qzIP8z5CGyo7xTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lIgHULDVdBtjYS8r6hITJUSz7lgvuubCfANpYLcv2vY3OhVS
	YDbxPYizIX5t+KvvgQsVYyMrt7PZ8qNPKeoGiCb0mAcoRj+iFA4SUtW5Nt2Z75M=
X-Gm-Gg: ASbGncvukfcLQkXV9puZ7127UFJrJ6k9GdXBNgkva+pynNbmZcYQ45MML6Z9/+u9M/+
	V0QBw63MdtEzkh2C3b/JNj1mKElQC3nthCz+Q1Q5sDudVPvL14ug8t80XUxZlEFFPCpuuC6pA4C
	qldOlPxfGHNIgn8M7CIhk7M69jhcV8plIz37svqvToopnNc4lN1lxTzxTCw3SWBio7pUywNyanp
	4d0mlcA7LXchVF3JFGm1WtmENopXc7XLXqm47rWI7mqjpSWnQO8Tb++F5bhnAN8HcyNDbBvm0Dq
	vi0yjwGsfXX92yD0NIuMMaWXuAwzIa6RLVfWcNcQ96miv7rOi+vztg==
X-Google-Smtp-Source: AGHT+IF+EMQjdfUWsTac/ovnxYjZzhDsNs9ysnYZoiG5v9tCt9Pm/x1O8yqeEMQfzytKgbQ5jjGzWQ==
X-Received: by 2002:a05:6000:1aca:b0:391:1458:2233 with SMTP id ffacd0b85a97d-39c120cb5b1mr16167141f8f.11.1743673732414;
        Thu, 03 Apr 2025 02:48:52 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968a1sm1340663f8f.11.2025.04.03.02.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:48:51 -0700 (PDT)
Message-ID: <3078c954-7863-4d32-aa03-3dc75a129592@linaro.org>
Date: Thu, 3 Apr 2025 10:48:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
 <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
 <871puaqz6m.fsf@bootlin.com>
 <5463acad-ee29-45de-9d22-16eb7947002c@linaro.org>
 <87cydty6aq.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87cydty6aq.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/3/25 9:53 AM, Miquel Raynal wrote:
> Hello Tudor,
> 

Hi, Miquel!

> On 03/04/2025 at 07:19:15 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 4/2/25 5:57 PM, Miquel Raynal wrote:
>>> Hello Tudor,
>>>
>>> First, thanks a lot for the time spent reviewing, much appreciated.
>>>
>>> On 02/04/2025 at 16:19:00 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>
>>>> Hi, Miquel,
>>>>
>>>> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>>>>> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>>>>> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
>>>>
>>>> why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
>>>> in the supported ops.
>>>
>>> That's true, but single modes are literally always supported, so it is
>>
>> literally, meaning from experience I guess, or is it mandatory that
>> dual, quad or octal dtr to imply single dtr as well? That's fine either
>> way, just curious.
> 
> Yes, I do not know any chip not supporting single SDR mode, just because
> we need a common ground to perform the discovery? The core would anyway
> not be ready for such chips if they were about to come.

okay

> 
>> Does quad dtr imply dual dtr? And octal dtr imply quad dtr and dual dtr?
>> If so, then maybe name it by the maximum IO dtr supported.
> 
> Unfortunately not. Chips supporting quad may also support dual, but not
> always. These chips flagged 'dual_quad' indeed support both. However in
> this particular case, octal chips do not support dual or quad
> opcodes. Hence my idea to name the variants about what is supported,
> behind 1S opcodes.

sounds good. It's common in SPI NOR too to have octal/single dtr but no
dual or quad dtr.

> 
>> btw, not strictly related to this patch, but for the overall
>> architecture picture, why do the SPI NAND flashes need to define their
>> supported ops? SPI NORs for example are capable of discovering their
>> supported ops by parsing at runtime some SFDP tables that describe most
>> of the flash parameters and setting. I see SFDP standard (jesd216g)
>> mentions SPI NAND devices as well. Have you or anybody else played with
>> SPI NANDs SFDP?
> 
> Not at all! SPI NANDs commonly advertise a parameter page which is way
> more succinct, but no SFDP table.

okay, the ONFI table I guess.

Cheers,
ta
