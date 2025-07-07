Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C828FFD8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882402; cv=none; b=gwwn1rPnEctg5HMlxQQNA1kFfukQHrEaPcCYjG5mQPo77mI5MzZvzjYqdP9G7QEshwO/84fVH77Yey0S868BF5H5l5ccYSLEmV6LdNzA5+i/4JxQJdpDQ6WCBH2SP1LSB+X3GfQQ1HBbA8K3ZXbkoG9Z79ErYRhzaJFvJ2vo3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882402; c=relaxed/simple;
	bh=OQ34og8I8X3z80o99fbXU1v3ZxqvcPIL2A769bcQgaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b08aMLI3iJNseZErzDlDn5ZSDSa7Soh4RkIAJLMHzgYsRJvVJ7TJs8GTyXNtQ2XRtlIEXmNzoHALTYcEGA7Vqbe+wyZG7vydq+b7hdR7RMkbEmmCG+peINGdu8E3HzKR4vBb1Ld2f+br+skJCTYRGPLzG62F6+mSW3LsnDsaDB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=desZQQHh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="desZQQHh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so26168125e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751882399; x=1752487199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GF8vc1c9D0lLEMqMMZKCgAxa6DKwsWgtBoqT1qS5YRs=;
        b=desZQQHhqp3mhpyYeupR5QZNaL047znpGYcRsaIDNHT0aCQ3fYlUJZVXTu41/TPm94
         gSAheh7zv53nzMlaSnWP19iZlOourWHrDpYySkuHtrfveS1XN9rvKYPYUFiqc6+QcZaE
         7MskhgwNV5gYyDnTIxQhvrBkvTsHxxC2pydo5jeLIQZypE0IlyQPKhOXkWlFldiL5mU0
         ix7l3nMTmqZYO7Z0bTjYqJh4Ok/oSLkAhGgSqoKLMTl82tAO6S91m1jVj64SWtv7/NR7
         rTKtG49i0LC+BSKqTGYlI7MTB7OfyoavnJEnFqBu/krWIYy9gbMQo353hC0axZXsAurc
         PA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882399; x=1752487199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GF8vc1c9D0lLEMqMMZKCgAxa6DKwsWgtBoqT1qS5YRs=;
        b=G4qafkU6b9f4IF2jbQqbnCUP0PpBsBGgSOOqQbuT8SlEMkzt10LUPRgDO3l489D/1X
         1IInHsYcqgV21OEXxwYK/5NmRfbblLMMkODSzxC/d0Rr0/Ns0wk62owK9GmBAjih4Ysh
         1GnkxJC7Y04bft1zKelNISskhmygy7+64hZsqw5RsWBA/+VqdjifbCNkru3V9tkN+Vhb
         qqolwsmNhG7GNrspoEwqpmBJ5wRG04HsKy1UZr6E0RDYBbNFvcfw9kEnp0PTEFrp6Z4k
         LeePc17XzKkhEI8ANHL4mtLbyNgqPahAe0RRBd5mx9UZatlGO8/3I8q1Q0lpsbfvlStV
         HImg==
X-Forwarded-Encrypted: i=1; AJvYcCUD4haRf+quhNHejj7ZW4gZwl2Gu7tyY6uvMa+P0P8ZESOClDiMUwQmpJjr/MaKQjCZWk373SEeIGNi7NU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgKNiOoldlhf3OkyOX9H7gs2Y/Gw83wKog2tsF9PEgmDRlcWmP
	zgmLt/D9rZVi9uKORRbg9Dy/kD36IoImTk7jmLfuJLFGvWUJ0Q6zt1sTr3tRgm/QTYM=
X-Gm-Gg: ASbGncviVQFASOdOTIyRlQAiwwleiQBhQ70yPYfGpxbZBJTI451IfX9mVZsgvoV56Le
	Smu5MYn12N0z7NmLtor2dzgGZ/+vOYD3rjwefb/6DYMmw5Ewq1ud3jaXRRmjYn02gbgLI0xwu1u
	QqKZNjU+qU/kZKIHurhxXVYNjVksqLQ9lyPworJDY/IFfVWAtuTgPpjB0RjKF3lslbmKtWPvQKi
	U8t4Y9qcl7UHLK8pF+vK2wZm2N8oTxiyPxlZtTA8lp4XYC3mqlvjtncmfkuihCpE8VGCNaGkWR+
	3lU699l3+gicxaQ+r6OaDOBioy+nYZZUN5mCa6ouuM/yEIgNUO0SVPsrmjRRsVbZqg0FDd9nEaX
	XntazjHEB9KneWva7lFUh/BtuGJNgL9DOGg==
X-Google-Smtp-Source: AGHT+IHvlmHP0oa9KgbeYWJUl4MCBGVkpFuuQN5yKMcqWRZ/ketGUdB/VWArjJjtYOPvEISWj77cWw==
X-Received: by 2002:a05:6000:26ca:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3b497036356mr9229115f8f.54.1751882398533;
        Mon, 07 Jul 2025 02:59:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:1a22:119c:5b1d:302e? ([2a01:e0a:e50:3860:1a22:119c:5b1d:302e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285e241sm9798553f8f.94.2025.07.07.02.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:59:57 -0700 (PDT)
Message-ID: <5d179842-12ac-4b5d-b87e-098643e7cfd2@baylibre.com>
Date: Mon, 7 Jul 2025 11:59:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
To: Nishanth Menon <nm@ti.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux@ew.tq-group.com
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
 <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
 <e0773f0e-8d2f-4918-aaad-aab6345fdb81@baylibre.com>
 <9042d63de85f7ae8bf73760e9d2d7652c18a738c.camel@ew.tq-group.com>
 <20250703122813.jh2muwzwe4ok6b6d@process>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <20250703122813.jh2muwzwe4ok6b6d@process>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 03/07/2025 à 14:28, Nishanth Menon a écrit :
> On 09:25-20250702, Matthias Schiffer wrote:
>> On Tue, 2025-07-01 at 20:57 +0200, Guillaume La Roque wrote:
>>>
>>> Le 01/07/2025 à 16:36, Matthias Schiffer a écrit :
>>>> On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>>>>>
>>>>> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
>>>>> select on ARCH_K3 are not needed anymore.
>>>>> Select MAILBOX by default is not needed anymore[3],
>>>>> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.
>>>>
>>>> Hi,
>>>
>>> Hi,
>>>
>>>>
>>>> what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to boot
>>>> on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I have
>>>> not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
>>>> enabling other unneeded features to pull it in.
>>>>
>>> With master branch if i apply this patch and i do make ARCH=arm64
>>> defconfig and check in .config  both TI_SCI_PM_DOMAINS and
>>> PM_GENERIC_DOMAINS are enabled.
>>> with linux-next it's same. i don't really understand link with  PM part
>>> in this patch and boot issue on your SOM.
>>>
>>> I probably misunderstand something.
>>>
>>>
>>> what is your problem exactly ?
>>>
>>> if you can share log or link to jobs
>>
>>
>> Hi Guillaume,
>>
>> with arm64_defconfig, this problem doesn't occur, as other CONFIG_ARCH_* symbols
>> also have "select PM_GENERIC_DOMAINS" (with or without "if PM").
>>
>> We are using a smaller config specific to our K3-based SOMs however. I have
>> attached a defconfig that shows the problem - if you use this as the base for
>> .config on linux-next, there is no way to enable TI_SCI_PM_DOMAINS, as nothing
>> selects PM_GENERIC_DOMAINS.
>>
>> So unless I'm missing some other configuration that would actually be useful on
>> the K3 platform and that would pull in PM_GENERIC_DOMAINS, I think that part
>> needs to be reverted. I can send a patch to that effect later.
> 
> Is a better approach to select PM_GENERIC_DOMAINS in
> drivers/pmdomain/ti/Kconfig instead of depends (similar to what
> drivers/pmdomain/qcom/Kconfig or drivers/pmdomain/arm/Kconfig does since
> TI_SCI_PM_DOMAINS requires PM_GENERIC_DOMAINS?
> 

I send patch to do this :
https://lore.kernel.org/all/20250704-depspmdomain-v1-1-ef2710556e62@baylibre.com/

Regards
Guillaume
