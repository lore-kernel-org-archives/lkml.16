Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B219535D8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 00:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749430783; cv=none; b=nAxesNnrBnHyr8DxoRUZpS4Z88lCklmvo+fX8iCahF9gNvGqPZWqgKwaUuDdHe6++CBMb9bdB6gZnkxImSOoVmZXSDh510rs6Yz/8zSmJ+hyc+0eDcdBv9/TZOSZ4Tjqq9SoxoESgj8gscTIDm3EgHOLV26NfFb/w2LYQjeRXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749430783; c=relaxed/simple;
	bh=sLkKCB0YGk5fpH9OsMxG596h3txXzgfrqiButk+JWxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZX3n3AVs3/nnTP9tzkboQTIE1JYGPWYrMp26g3JkgoTcgnzt3dMsUvraN5pLe6lJ4xTUd+NK+TcyPVH1w179MpdOyXyzYLS8RkO3VJbssOx4Af4ALrEg5BStmwljiohpR6hjROGrw+Hra7vdrLptbrKM7S6W7XTlt4LqIlu5+oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N23qjpjw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N23qjpjw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23602481460so19822355ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 17:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749430780; x=1750035580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1UZ3G3hP2PMByn8gAasj2ugyuBhdWDYhYy8rSg1DMCk=;
        b=N23qjpjwQQ7a4AmGi05mEfYTqW3OUmbUGaDkMj1Zo7v2aM4xUWUU3QTusuIQ3qXGEM
         yXSyT7yICe9X0J5frXXdh3A4oJ8sDUl1oKcv2QhyCOqEtevHSFyHnmmwrBvxIkgElZot
         O+XlvU7wikK0qaTXh/dQGjVUWK/DbzY1V0UNJEn773TNKzHQTbl30iW3tLK2qkK7eBhk
         9GBcO1EMOl6vAr7n1CHPtDKnuwWkW+9dTsvnv1MuHPVF3iuFhKirv6sqUjUpGB/Yk0+r
         O6xXf/QZ1/zKRAePt58IXIVK+wLkbJTeAqDdgKeLSD5jJu0NwzkWX9u/1VTLTpkQKWry
         uBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749430780; x=1750035580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UZ3G3hP2PMByn8gAasj2ugyuBhdWDYhYy8rSg1DMCk=;
        b=LeWaxM0xtxXGQ+HVjQxemX/JRCmmTWPhoCpj5h+2faX6uEdafQlMaiCb8ZQfHHxiQV
         5fUMEwuDVBTnljuS/EK6Y5OgU84fPUYjGwCL29bdxcfYQp2Ju6AMdDQvHAoFGCaeCx8I
         Ccozl2594teKXdXA2knpd6WrChWh7YZaNzthubUUUp9ji+T06aD1TFReFH/1F0TGA4KZ
         DQIE59PM4r232UA5dUxGIFQVxT+5+otV87beZz3UB+b0Q+dhSqWEFuV95umrprTo7JLc
         3OUfXOhOyh+77Is+wsEeCZ0VuSvjox4NyfDq/IvGSK/W/Ko3+AP055Q3JaUTudnRWIZ6
         zbFg==
X-Forwarded-Encrypted: i=1; AJvYcCU5k1L4jhxVQHLp1unU7y+ABivgK2T5hpelUB/A1js5WvVuVMqnO5CMcNDRRORIv73NBWOBGqhb92d7GCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Mk8POxN76ba5RB+SWpvI7RAjcGixuht/zep+1GfFbbU9TBxy
	cvQ7wWVUmbKDjzh7MGwT93BNVytJt+DCttQ/rqGfb9PAiJqUAzJ9L7ZR
X-Gm-Gg: ASbGncvwuYZgb/QRqtyKhkltpAjyM07wYSlZ00Mn5o/Om/lXTsR7JNPf59cNmR4Q6nC
	xCYV7MX0blXX2EkNbYf8D/aeCvRJLX8YtmedhnGQGYbVDnCXkQBCJjhbEVQNDC6Zghh/2bo3AiC
	v8B1gu08rI6QbuiWktzOIVF5PrWiN1NLbRA6Qe2lWkoHB6BfuOnDOvtz+2JJO5izi8qKG9M7wWE
	2Ygi2mvC/4eYHRMCelzv29O81ZIs0IRjxUQddOZ5wkCAFSv8DddxL2CC/9aP0pGNQji2wZFpuYN
	kPBvJHNCO0+hgqAo5jc/iZSBfYJng0+tuAeIuCbnAKapRY6Lg0j8Uc+i4GDG1iZroAIhJwhyndj
	BGEBazMNOgPGlxdEQQwRbUSGXbkYmBpZ14SYjPwFqYvYGAQ==
X-Google-Smtp-Source: AGHT+IFx7Bw//bf81ZFuNLNFxpt0Z3XFm1C4VkqMkhOt4fhQ54pvjlNDTtmhS80ppAjEon3na2MsaA==
X-Received: by 2002:a17:902:e84b:b0:234:cf24:3be8 with SMTP id d9443c01a7336-23601d172bbmr161947955ad.28.1749430780376;
        Sun, 08 Jun 2025 17:59:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603096983sm44234525ad.85.2025.06.08.17.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 17:59:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
Date: Sun, 8 Jun 2025 17:59:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <87bjqyja7o.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/25 12:37, Miquel Raynal wrote:
> Hi Guenter,
> 
> On 08/06/2025 at 07:00:10 GMT, "Usyskin, Alexander" <alexander.usyskin@intel.com> wrote:
> 
>>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>>
>>> Hi,
>>>
>>> On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
>>>> Create master device without partition when
>>>> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>>>>
>>>> This streamlines device tree and allows to anchor
>>>> runtime power management on master device in all cases.
>>>>
>>>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>>
>>> Several of my qemu boot tests fail to boot from mtd devices with this patch
>>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>>> see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=y
>>> when
>>> trying to boot from an mtd partition other than mtdblock0, with the
>>> mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
>>> Is there a guidance describing the changed behavior, by any chance,
>>> and how the boot command line now needs to look like when using one of
>>> the flash partitions as root file system ?
>>>
>>> Thanks,
>>> Guenter
>>
>> I've tried to make is as transparent as possible for the existing users.
>> Only change is that now every partition has master that is not partitioned.
>> Is the CONFIG_MTD_PARTITIONED_MASTER=n fixed the problem for you?
> 
> No change is expected, can you please describe the devices that you
> observe with and without the patch? Maybe there is something wrong in
> the core logic.
> 

I am trying to boot supermicro-x11spi-bmc in qemu from flash partition 6.
The qemu command line is something like

     qemu-system-arm -M supermicro-x11spi-bmc,fmc-model=n25q256a13,spi-model=n25q256a13 \
	-kernel arch/arm/boot/zImage -no-reboot -snapshot \
	-audio none \
	-drive file=/tmp/flash,format=raw,if=mtd,index=1 \
	-nic user \
	--append "root=/dev/mtdblock6 rootwait console=ttyS4,115200 earlycon=uart8250,mmio32,0x1e784000,115200n8" \
	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb \
	-nographic -monitor null -serial stdio

This is with aspeed_g5_defconfig. Note that the flash models need to be specified.
The default flashes are no longer recognized when booting from qemu since commit
947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info fields").

The above only works with this patch reverted (or with v6.15 and older, of course).

Guenter

