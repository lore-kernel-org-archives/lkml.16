Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CB9C148
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474498; cv=none; b=DJ/liGoTZhnRxTSibCoHBnvqYo/LHJ+SxeNqpjJIuBvhI47gJtzVzIMeC3uSIDf4fSM6P4ik5d5xFJ3BN5ELsdUEm7Y+hz42bT5lEgntRWhh628lAcI2tm9vE2q4OklfOaRXrJIX5Q2nT2mM4vvgqIUNVSlx/nUw0Ar3CYaG3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474498; c=relaxed/simple;
	bh=OEsX4zSC6/Js6pq8PgqImksMj3yLfMtQsuuOnv9J0xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9aeXmgD0fGDsmgyT2+gg8TuVIDRzcaER3TucqNXz7VX3tUOOdGL8dV42V66oaFCXn0xX4vvMb3rLXwOp3V4QRD9bXrNhJqVdVgY5MffqdDZnPxBo6Rhr6sAXJ7PYL+hlEqfxPs0KoGb9Vj+VBPi6ACBxocg4BwW+hrC+xXtoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6+eY5GW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6+eY5GW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236192f8770so9544385ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749474493; x=1750079293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JasdH9sO7B39h3KaOqP1P5iFcVzbxD74IewCCIgfbQI=;
        b=P6+eY5GWoLzUY07QdXDcfdRRE/fxMH+7tko7aR9ssvgMvNinguRP9YQTDXJiMGUew/
         wXdtF0w2Y1/pjs1wgpCT3e3Y/IBGiIETVc0IFelmrJUg4PWtF8aKqBJAasZfkMOgnKzG
         61UCu3TxfH2iah3chyC442C+olE6Ki0oqmyK8I9t2hYyaXljXFFwUL0nKc0YCarlWHYj
         NzCsT9xEqFjCQIpo1PmULtfHFc4pJxVkrk2jLxY0kAtfv7iJEW3c5ZxLmT2unHPlP8rZ
         h1Vyw/23qwbBh55eNi2z81EtmNEVbCPoopc3InjG3gg6pyvjrT0Nks9DYxKugFL03YOL
         0ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474493; x=1750079293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JasdH9sO7B39h3KaOqP1P5iFcVzbxD74IewCCIgfbQI=;
        b=oowAlqIzd17CZMWADd0W5ZuVcUsWhgeVQBSPQHGEQVs/Ruk4HjmpfT4opfOAT1qWK1
         DhwwAvESdoGYQrJtva1NYNP0+lnpuaLmMpZ0eEHEpz8gH9gKLq8CLT+Ki3cm7rySJbhx
         EcOJ+EfE7Z4Pc4Usw9X1g7yUKqN+/P4oat+ZzaxrhnHz+DjWYeZAHe4rA7B5m9anS88w
         CNefM7fPvoO0sX9BovyUqiRsmRgtqGPFkbUnEFAPQ75gXYc7BEuFrNinugLaVEUNQbpo
         GQxsnBnRaR+XWtK4RLvo6dEKaadom4C/cLhgEfvYMG6qBljd8sTWUrdQVo1Z5MDm/4Rl
         PV5w==
X-Forwarded-Encrypted: i=1; AJvYcCXOx1vvHzgZm5Ro2pN4esHOJiBQrvfjYJtS/ucITuM8eUcPZHqTirRnFXm/QSn4XL2etqhnCcQ3JNJgGuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm38ey+5Lop7dzkbb9lkpn3NK2QRf3xmsfz/9HCjV3S6T1Uxh8
	Tg/5NGacJ9NTESIHe9IpO82hbhRJKShRnxxFoSb68/xJCWiUyYn4Fu7U2niM1OIf
X-Gm-Gg: ASbGnctHzzmZ/Xnbv1i3mKqz6YTbvUhhusEpn3W4pJRESmHGpp49ftQRAlVToiUzm5F
	TVLA2svwQKN2H0wHDQZPIw/F4e7xZ0ufgcUgfZwl1mW+Gdl91IuYh0a63ceJq/ll4BMY2DDJK/8
	qSH/pWWjTcA0M0N/y3rHxdZ7Ow9IKXFzz/utElcoxhmRnkX2adHdVj0eSXxTMNSBCHFvWbJYaMm
	xAy+z7o/nJcgqsTM8keCK5vLptLO4jqlx37gZROKm5w53JHS7RtRVWq2xpEnpRNYxkp1202sFc9
	UJum3kOGegPc6r2pztvkOEj3aXdGodkfVi0V3YeQjMliAMkcOn3H+m4B9KFvSArxiU4D6pNpxo+
	sa04yBN+f8wlbr/fra8SUkMn5
X-Google-Smtp-Source: AGHT+IGLPIg4M72EaZClfJ0131IzZTUL6Xj38FgV1hP3MoBxkpUgOKd78G/eggsj6YV2UxQmc/nLxQ==
X-Received: by 2002:a17:902:cec1:b0:235:efbb:9537 with SMTP id d9443c01a7336-236135d1d6dmr119962225ad.3.1749474493294;
        Mon, 09 Jun 2025 06:08:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f17be8sm5702200a91.3.2025.06.09.06.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 06:08:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
Date: Mon, 9 Jun 2025 06:08:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87bjqyja7o.fsf@bootlin.com>
 <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
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
In-Reply-To: <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/25 05:23, Usyskin, Alexander wrote:
>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>
>>
>>>>>> Several of my qemu boot tests fail to boot from mtd devices with this
>> patch
>>>>>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>>>>>> see this affects configurations with
>> CONFIG_MTD_PARTITIONED_MASTER=y
>>>>>> when
>>>>>> trying to boot from an mtd partition other than mtdblock0, with the
>>>>>> mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
>>>>>> Is there a guidance describing the changed behavior, by any chance,
>>>>>> and how the boot command line now needs to look like when using one
>> of
>>>>>> the flash partitions as root file system ?
>>>>>>
>>>>>> Thanks,
>>>>>> Guenter
>>>>>
>>>>> I've tried to make is as transparent as possible for the existing users.
>>>>> Only change is that now every partition has master that is not partitioned.
>>>>> Is the CONFIG_MTD_PARTITIONED_MASTER=n fixed the problem for you?
>>>> No change is expected, can you please describe the devices that you
>>>> observe with and without the patch? Maybe there is something wrong in
>>>> the core logic.
>>>>
>>>
>>> I am trying to boot supermicro-x11spi-bmc in qemu from flash partition 6.
>>> The qemu command line is something like
>>>
>>>      qemu-system-arm -M supermicro-x11spi-bmc,fmc-
>> model=n25q256a13,spi-model=n25q256a13 \
>>> 	-kernel arch/arm/boot/zImage -no-reboot -snapshot \
>>> 	-audio none \
>>> 	-drive file=/tmp/flash,format=raw,if=mtd,index=1 \
>>> 	-nic user \
>>> 	--append "root=/dev/mtdblock6 rootwait console=ttyS4,115200
>> earlycon=uart8250,mmio32,0x1e784000,115200n8" \
>>> 	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb
>> \
>>> 	-nographic -monitor null -serial stdio
>>>
>>> This is with aspeed_g5_defconfig. Note that the flash models need to be
>> specified.
>>> The default flashes are no longer recognized when booting from qemu since
>> commit
>>> 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info
>> fields").
>>>
>>> The above only works with this patch reverted (or with v6.15 and older, of
>> course).
>>>
>>> Guenter
>>
>> Alexander, can you please investigate? We need a fix because Guenter
>> might not be the only affecter user. Otherwise this patch can't stand,
>> unfortunately.
>>
>> Thanks,
>> Miquèl
> 
> Maybe something is moved, and it is not /dev/mtdblock6 now.
> 

With this patch:

# ls -l /dev/*mtd*
crw-------    1 root     root       90,   0 Jan  1 00:00 /dev/mtd0
crw-------    1 root     root       90,   1 Jan  1 00:00 /dev/mtd0ro
crw-------    1 root     root       90,   2 Jan  1 00:00 /dev/mtd1
crw-------    1 root     root       90,   3 Jan  1 00:00 /dev/mtd1ro
crw-------    1 root     root      244,   0 Jan  1 00:00 /dev/mtd_master0
crw-------    1 root     root      244,   1 Jan  1 00:00 /dev/mtd_master1
brw-------    1 root     root       31,   0 Jan  1 00:00 /dev/mtdblock0
brw-------    1 root     root       31,   1 Jan  1 00:00 /dev/mtdblock1
~ # ls /proc/mtd
/proc/mtd
~ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00010000 "bmc"
mtd1: 02000000 00010000 "pnor"

After reverting it:

# ls -l /dev/mtd*
crw-------    1 root     root       90,   0 Jan  1 00:00 /dev/mtd0
crw-------    1 root     root       90,   1 Jan  1 00:00 /dev/mtd0ro
crw-------    1 root     root       90,   2 Jan  1 00:00 /dev/mtd1
crw-------    1 root     root       90,   3 Jan  1 00:00 /dev/mtd1ro
crw-------    1 root     root       90,   4 Jan  1 00:00 /dev/mtd2
crw-------    1 root     root       90,   5 Jan  1 00:00 /dev/mtd2ro
crw-------    1 root     root       90,   6 Jan  1 00:00 /dev/mtd3
crw-------    1 root     root       90,   7 Jan  1 00:00 /dev/mtd3ro
crw-------    1 root     root       90,   8 Jan  1 00:00 /dev/mtd4
crw-------    1 root     root       90,   9 Jan  1 00:00 /dev/mtd4ro
crw-------    1 root     root       90,  10 Jan  1 00:00 /dev/mtd5
crw-------    1 root     root       90,  11 Jan  1 00:00 /dev/mtd5ro
crw-------    1 root     root       90,  12 Jan  1 00:00 /dev/mtd6
crw-------    1 root     root       90,  13 Jan  1 00:00 /dev/mtd6ro
brw-------    1 root     root       31,   0 Jan  1 00:00 /dev/mtdblock0
brw-------    1 root     root       31,   1 Jan  1 00:00 /dev/mtdblock1
brw-------    1 root     root       31,   2 Jan  1 00:00 /dev/mtdblock2
brw-------    1 root     root       31,   3 Jan  1 00:00 /dev/mtdblock3
brw-------    1 root     root       31,   4 Jan  1 00:00 /dev/mtdblock4
brw-------    1 root     root       31,   5 Jan  1 00:00 /dev/mtdblock5
brw-------    1 root     root       31,   6 Jan  1 00:00 /dev/mtdblock6
~ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00010000 "bmc"
mtd1: 00060000 00010000 "u-boot"
mtd2: 00020000 00010000 "u-boot-env"
mtd3: 00440000 00010000 "kernel"
mtd4: 01740000 00010000 "rofs"
mtd5: 00400000 00010000 "rwfs"
mtd6: 02000000 00010000 "pnor"

I am trying to boot from "pnor". It looks like the partition data (from devicetree)
is now ignored. mtdblock6 used to be the second flash.

Guenter

