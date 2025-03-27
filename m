Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC571FFC45;
	Thu, 27 Mar 2025 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072245; cv=none; b=f4OXcIkHNvPrzw7usNKEcItQyjY97gfxCMMnI495kxZygWmQ1iBUHGhUCDG6yER40N2VN4cNCILDOuvvdoJ8vCtpGj/F4/LKc3ucXcMSbRl8tOjRSYBZVwVinaPbmOHM+dyucen6sEB7/8App1B/D0YHS05ytUBLVu46hG8OBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072245; c=relaxed/simple;
	bh=IFw6q1pUFNq5z2c3JTgi/YJrkBAQTyo3eErhd2X2sqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGUKiaT/ulL8M+1eBSyhe8RTOGx3HwOmTjjju2Cswqa80ucxW92MvnjNHPN26fkvquIa6Lw7K3wckOvX/kAf1DjCtYJ2E455MCIvgKebTzA8ASSsVpWaB1YzkbugpnDSspzhuwPr1azyjrMgB8YIj1nUsyWhaxziSYnX1uJw1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blhDMdb6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blhDMdb6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227d6b530d8so15651645ad.3;
        Thu, 27 Mar 2025 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743072243; x=1743677043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTJyz617q7cxczcoiG5Izuzs8qnkruFS6Mj8VArUtXY=;
        b=blhDMdb6jgFMM41dgI2gf6hnCfi9lH4BRkTnJGLMavsAZsHgWGtIqKq5QMkqcC08KS
         lXUImi25Z6Hw00HKaNpHbUW0r8XgfhBZRMEvIZuIhSKjfRy+REGuZ9z9670SAiCXKqlZ
         LijBaPnRWn2Zi1Ga7FGVQgLtH3W9zjRxe46b7jq3Nq+y68YZ74EvGxTwuT4H+qDmW0Ix
         NQCfJKT6ratXuDqnFIkfH9QciRG3NDYKMd6TwHpRjFwj/cXbW6CpvDiKOAG3efA6cHAs
         8tGx9vn74TftqesH1sfmrIIgHZFMiDAxQ8QM2tmAodALbP2f/Ysp1/FgWemfpcZJke+K
         7wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743072243; x=1743677043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTJyz617q7cxczcoiG5Izuzs8qnkruFS6Mj8VArUtXY=;
        b=YpJgIL9Wg46z2qOJWBNSOPx/XnSMnBDgaoO7EQxpMrG6D+DqCYfeMwlx9f2dMq+nnT
         EQv26MvgKLO09cQrK6ru3dVVH+yKRs9WBuuMquFhfdZMx0KkWBM+Ku3e8efWzvMnZ/Pp
         GEWWuuOjSWywzuSlcIy0kV/WuPQmkOavZUmvsk+rXPsY04iIpnzmimqyec8Rjj4GA7RE
         Yy8zvCSHkCYnPKNyzjQI59rgauoxPk4tHGpDF5YfFFT+2EwJdHpZfYs+B3udEkxSIY1P
         vVXwAP00itR3DKBC/yposwJjnamB0XUPZHfPAEWgdLb96n6Vat+UgQvhku5CIzv9KH9b
         cWoA==
X-Forwarded-Encrypted: i=1; AJvYcCVi0BiU3/BP6OCKPGsHH0FW2jYue8ZwigtqiyG5G0oJpL6sM1+NTAky9g+ZOc0S7eUW27U5iKjxuQwb2bZk@vger.kernel.org, AJvYcCXOF6Vtqx382JvWos4v7dnJT3wkBcXOQLn78zQJcp21jxvekEG9WfNdBk4KjzM4NMnB0LVF0BYU9wsN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bwwwKW4BQFwDjQmwu9z8fbsLb+rl+oBhlP1huwsH0I6drRYS
	2YBE04EQ5EekICoTf7CluxLxp0TerE9tV2HuQwGnMIer1gCiDcYN
X-Gm-Gg: ASbGnct4SpVlo2GLNcwIBFw3Z7+6ECuM5FiPjb33+vL4dtKAH+Wgh+bchFQ+VaQJ3ep
	Ec1o+HKT6c4PA9kzd76asFx9zAa1jJ9eXdLRAYdShMBVCfz7TEKulnudfGw//hry7H8rNOeYW8x
	7ALX0bfvhA0c7xwqDi/wKeG//vvtGIAIZLl+Vt9/Q0SzuY74Sgl8hrR7D5G/Ifa8TcbvBTJ8L+a
	W1nMsruq5H8Cttkzfo0phtHG9JHI11cNZGdhh7lmEBeVoqdhu4A6WKz/X1RuO3w5u6n5elih4lU
	Ae6KTa0EmvetaO3EQJzrED6Rbg4iMF/iNxw7d0JELt6kHLpmj/Ck9ufmMqWkwZojCsOEgEqspzz
	90YHgHOrEkcV88Ckyofsq
X-Google-Smtp-Source: AGHT+IHq/Y6uC/Z00BLfu9Yma5EAHMzO0zuQt7fcToR0/FheLKLnTEahpmMne9PLwBs+vl8u3GLHEA==
X-Received: by 2002:a05:6a20:4389:b0:1ee:dcd3:80d7 with SMTP id adf61e73a8af0-1fea2c2a320mr6373055637.0.1743072242982;
        Thu, 27 Mar 2025 03:44:02 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a282be07sm12565149a12.34.2025.03.27.03.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 03:44:02 -0700 (PDT)
Message-ID: <e1baa67a-d62a-477f-9ccd-83cc2dae501a@gmail.com>
Date: Thu, 27 Mar 2025 19:43:57 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bacem Daassi <Bacem.Daassi@infineon.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Mark Brown <broonie@kernel.org>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
 <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
 <20250319233024.GA2625856-robh@kernel.org>
 <a3818477-5a67-43ad-8961-88fa02916968@linaro.org>
 <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com>
 <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
 <D8LSAUU0358V.2H1D7QXB9WBOF@kernel.org>
 <be8e5758-8f85-4476-b6c0-4400c8151cbe@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <be8e5758-8f85-4476-b6c0-4400c8151cbe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/2025 11:44 PM, Tudor Ambarus wrote:
> Hi, Michael,
> 
> Sorry, I somehow missed your replies.
> 
> On 3/21/25 8:00 AM, Michael Walle wrote:
> 
> cut
> 
>>>>> The
>>>>> problem that I see with that is that we no longer bind against the
>>>>> generic jedec,spi-nor compatible, so people need to update their DT in
>>>>> case they use/plug-in a different flash on their board.
>>>>
>>>> This chip is clearly *not* compatible with a generic chip.
>>>
>>> I think it is compatible. The chip defines the SFDP (serial flash
>>> discoverable parameters) tables. At probe time we parse those tables and
>>> initialize the flash based on them.
>>
>> I disagree. It's not compatible with "jedec,spi-nor", which is
>> defined as
>>
> 
> cut
> 
>>
>> See my first reply, on how to possibly fix this mess (new
>> compatible if accepted, just use RDSFDP sequence which is backed by
>> the standard and do some fingerprinting).
>>
> 
> this won't work unless there's a unique parameter or ID in the sfdp or
> vendors tables, which I doubt. Takahiro to confirm.
> 
No, cyrs17b doesn't have it.

>> FWIW, a new (or rather different) compatible is needed because we
>> cannot distinguish between random data returned during the dummy
>> cycles and a proper manufacturer id. So there is no way we could fix
>> this in the core itself.
> 
> Yes, I agree, new compatible it is then.
> 
> cut
> 
>>> I think the property vs compatible decision resumes at whether we
>>> consider that the dummy cycles requirement for Read ID is/will be
>>> generic or not.
>>
>> It is not generic. Because it will break autodetection. And that is
>> the whole purpose of this. Adding that property means, we can just
>> autodetect flashes within this 'group'. And personally, I think this
>> is a bad precedent.
>>
> 
> yes, I agree.
> 
>>> I noticed that with higher frequencies or protocol modes (e.g, octal
>>> DTR), flashes tend to require more dummy cycles. I think with time,
>>> we'll have more flashes with such requirement. Takahiro can jump in and
>>> tell if it's already the case with IFX.
>>
>> But hopefully not with RDID. Again this doesn't play nice with other
>> flashes (or all flashes for now). Instead of adding random delay
>> cycles one should rather define a max clock speed for this opcode.
> 
> This could work, yes. But not for this flash. Or maybe encourage vendors
> to either contribute and enlarge the SFDP database or define their own
> vendor tables for all the flash properties that are not covered yet.
> It's strange how Block Protection is not yet covered by SFDP after all
> these years.
> 
> Thanks,
> ta

