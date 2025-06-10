Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB202206BB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541297; cv=none; b=mRI4T91CZWtxgoMAVyKaEFF3fB4VBnuppzfaAitEGd8+hfLHcSrfe3O7ueMTaAiGEESpdC0wYI1l9OixKZmvan99vx2iDqxYQMIOFOtzZALVwpgiLOFUqzDQkM9aH67iEJPrRV4KlIWdM0A7xTwO6nPWVJJo6x0bQueBr/rFJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541297; c=relaxed/simple;
	bh=U65Si34YXlEIcSou7KOoKTcwbhR+pjoVrxeVmX3whsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pm1wxGyn+MvKkHUC5MNYbK23gN5uZ5YMYFYrmlf7Imc3RaXY/7tZNppGAdHwdAMztsiTMU3WrM+HgRO8bjbrwUxtTezDE+KHFSB7efi/Gu/kE6/QukZEd0KoVJRb5+b1YxzniZNPRMXKlDZX02036LXM6KqLVccd4xNSXkj+OM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpEcx8to; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpEcx8to"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4105832b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749541295; x=1750146095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YN6kYOdQXppfRs2bxLnm5FB4byN2ocgKeTmyeRzty7U=;
        b=QpEcx8toWWIYVRiANb0dgh1IMGZGco3sfM5hFPknmjJXJuSU7wSutMzrqK+JMqcAg0
         LIGoP/55FH8IU5hEMA9AGVH0qkJUmDujoeFMGmTTumNNZZfjqwKpkDJVCwb4HYV6xu1F
         miAu5LfzlNirqOq2ia181gq1z544XtWmzKIBmTb9WvxHKu2q58PvjO8OILWBeu2Bursa
         4lhWwqUpb307u/KW6ezqGqdiIJ3CMd6lCiktA0DOZ3N27zSkJ/kf1C8QpNHS6dhmztGP
         my3ntOqsi6su8cGQ57bRPVMe0Wj28biqj9EDVUsXUOuuX60QdHrJRjeunA4h0u45E7y8
         m4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541295; x=1750146095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN6kYOdQXppfRs2bxLnm5FB4byN2ocgKeTmyeRzty7U=;
        b=U8rTT51Sv+8spNsuufYFMG9WHRrWKj1DjMaXwLAGYd+wOwTkwB2TyxnUIjpJNK/WQx
         EzhzPf3XClStWpblgddGyxd/PcEwxxYvSyRiCcdM+e5BjgTRNisOhcwT8QDnYUagD1rt
         iS3sFXx/hQPX/64Kz8gB4shvApXp8LB0Nui5EuUHWMbh/ewgGqlMgVIxwQjg/n8w8esS
         0aIQX0U7Jzc8uK4JZ2C1yG2t9r9ljpNgH1srzrDJT49NiCFZEhJ0Kl59Pbtu5zaVAESj
         n76zCqg1qMs6/ae5WBwpWJRHpL0IIPMOcPg3yU/bjRf381NON9cXLgUiALyjBTleL3Tp
         PYZA==
X-Forwarded-Encrypted: i=1; AJvYcCXadzJNVsZIW/0VQeCRMuihZegLT9uj2vV+UewUs09OZ234lczsazS28CO4ZedaV6mYvqHd5hs3h0JL6M0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbI3Vl4V1CIPQnaagQ2nRRo0QLghuUb+a52X9tl8zWdI2XJvvq
	kPsHv7bDbo7fw6wzGJ8TZpj5d6GMsf4hA0DsCKat8Fcs/FlheR/clqq3
X-Gm-Gg: ASbGnct5VP5bO0/iBCrV2TaECzCBn0hrqxHvgKXayuS0ZOKmPQfkrP4H89AxwIEQu/G
	ZM04KxbVEZ12BCIgDRM0J59rDF0Z1Ij7rTPjmknV8OJWgn0bYmy3Mb43jvqSZ/WsN9v66zKvNYk
	p+gImR5MpMbOeUFKmZLXZ1pwuF+aN9zrTwUpd7ThWgNTfhwKBXk2Y85de/Vs40cQBVW5vBjOj72
	X8gwozZJMFWRrLen69IklYWi7sGFZbtZpVU3m0DH8WsSpmr9HRCBJFLOH0xi0Xi3cEJw6bLVD5p
	MBARkliVLZ68qMX9L5ugs/dyrai/GMNjN6wLuZQMCF0cAeeHV/QHBy2ZfNtzXkZuqedcpHpmc6b
	0bQu3Vp/teKXeugkhxt82AIttLswCH439fys=
X-Google-Smtp-Source: AGHT+IGREhV5+oOFXXMGrU3jABH090Q4SM1tbrFb+Nj9NfxzPhQpiwuhESZpptIjmnQzaZ11AFQZMA==
X-Received: by 2002:a05:6a00:3016:b0:742:a23e:2a67 with SMTP id d2e1a72fcca58-74827f14a6dmr21248420b3a.16.1749541294932;
        Tue, 10 Jun 2025 00:41:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c2679sm6826146b3a.118.2025.06.10.00.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:41:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ff485da8-1a02-40a9-9286-94459e52b26c@roeck-us.net>
Date: Tue, 10 Jun 2025 00:41:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
 <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/25 23:46, Tudor Ambarus wrote:
> 
> 
> On 6/10/25 1:14 AM, Guenter Roeck wrote:
>> On 6/8/25 18:13, Guenter Roeck wrote:
>>> On 6/8/25 05:53, Pratyush Yadav wrote:
>>>> On Sat, Jun 07 2025, Guenter Roeck wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>>>>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>>>
>>>>>> Many flash devices share the same ID but have different part numbers.
>>>>>> To avoid confusion, the part number field is removed.
>>>>>>
>>>>>> Additionally, since SFDP already provides size information and
>>>>>> functionality covered by no_sfdp_flags, these fields are also removed.
>>>>>>
>>>>>> Furthermore, when 4-byte address instruction table is available,
>>>>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>>>>>>
>>>>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>
>>>>> With this patch in place, some of my qemu tests no longer recognize the
>>>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>>>>> this other than avoiding Macronix flash chips when working with qemu ?
>>>>
>>>> Could you share some logs? Does the flash fail to detect, or does the
>>>> SFDP-based probing fail? Since this is qemu, it would be even better if
>>>> you can share a setup/reproduction guide. I have been meaning to set up
>>>> qemu for SPI NOR testing for some time now, but never got around to
>>>> figuring it out.
>>>>
>>>
>>> I suspect that the SFDP data for the affected flashes is incorrect in
>>> qemu.
>>> Since this is very likely a qemu problem, I'll just configure
>>> different flash
>>> chips when running affected tests.
>>>
>>
>> I was able to confirm the above. This is from the kernel log:
>>
>> [    4.500000] spi-nor spi0.0: BFPT parsing failed. Please consider
>> using SPI_NOR_SKIP_SFDP when declaring the flash
>> [    4.500000] spi-nor spi0.0: probe with driver spi-nor failed with
>> error -22
>>
> 
> It's likely the problem where the same flash ID is used for different
> flavors of flashes. Typically we differentiate the flavors by comparing
> their SFDP data and use post SFDP hooks to amend where needed. If no one
> cares about fixing it, we can undo the change for the affected flash or
> revert the patch entirely. Cheng?
> 

Some debugging shows two problems with qemu: The returned SFPD data for one
of the flashes is wrong and does not reflect the data qemu is supposed
to provide, and qemu does not provide SFPD data for all flashes.

I don't know if the bad data is due to a bad Linux driver (unlikely), a bug
in qemu's SPI emulation code, or a bug in qemu's flash emulation code.
Unfortunately I don't really have time to track this down further.

Guenter

