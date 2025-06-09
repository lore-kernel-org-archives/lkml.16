Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32AE2AEE1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484389; cv=none; b=KCT7b/L10tyGNx29I8BV2T6bcfMGlmNoRmyqtLNBpBTvtrP2vmuNKx7UMI/UZpkLyMT+0CFKBMEhlCaYD1W5/MWROIXQ4wwpUlcgyC7XSzxDY9txKe/kyCx6BWxbOkfIxJXzC+gyQWmhtIcTtlGzu/eRWjO6zCcqOBJ2FsKFMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484389; c=relaxed/simple;
	bh=/oSnwgNh5DjpLBnq8ldjGYSo2huRjkulgXxOyX+eVuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpsWVZxe9KMaAj4uQ1va+WxzdpWWaGyjQgw26+oLsUdmQ1YVm63eqtEub78zilmmekMYSPvtJn5+npeeqTVOlAS6vDGr3cwiOM4XF2PMBIoxvc//RQdDJtkP3NzsH2DO8vlK1E71GNODUKp6IK8Q1o+oPa4X7+8YJ5M0oVb67qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrL5p9iT; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrL5p9iT"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b1fde81de05so2284161a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749484387; x=1750089187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9k5+Ykngl8b7HVjIc8RfX/THRGAxyweF7cixLGl/oLQ=;
        b=XrL5p9iT+rBOEBpBPKtVMtS3vExBdAbIsc+0uHUwhAQchvASy9z1+MrqhBeJad578f
         UjYaL0QAZ8+ervymgEEmHUOpbxHKTYWLTc/LX2OxPGMdk64+UglVSPS3d/hUD22vaP8m
         q0r/Hp9SYZR23ZEPdoKU1oL8TcuLtbY9SGwc3Um1jG+xiOHm0ZqbdBt8rxSfMXBkUdlw
         uZpE0r0DGYj/QvCSNF+b55gOflVRWI+mnG6fRp3JXHHWlU/QmhSK75dLc62MVmAhGprF
         ruEMaUw22L/7FSWpa+UUaIx3ubk6P8phoU8o+aktfKTCNWZ5qTf2At2uaeGZE211mNpq
         nlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484387; x=1750089187;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9k5+Ykngl8b7HVjIc8RfX/THRGAxyweF7cixLGl/oLQ=;
        b=KbCVm/twgxvMXHeIyypXqCdukpcOpvnRTcEFwTpIFsESXWBCHV5qEpRazB2O+JfxWG
         TlM/w7Q7LVZ1hTT80BdOCMDtRI228FY7QbHX+JjDZDK2gxtwBrRb7OWFxTrAgteqPwph
         LR+mg9TLBgwb3rl/uAzfCWutKlTkTxYlAYxKh9DpQ9xhSBX3wjalYlu23Rv1TrzCBsPm
         6P+vCNjhyO/Hb9iCA1gRF5wbvBuX5rlSd/SpbVKkZQpqHHhANaOzLJMTtAMg9pu9MNcp
         Yq4zEWWZ4txzP8C/fO2ZUh/UGKQN2SmRR4Sg0ZnS20PiP9KhsB1WKg3nzuVDEH8mCcfc
         AlDg==
X-Forwarded-Encrypted: i=1; AJvYcCW5FXuFxzpAg5lc56elxqR6QY8WmZzoBmGSoVxi7c30ayY6GU/08UKziNg+jIFbXN9CwOSihkvAlg9rpx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIinrSEE7kti3P7TSer4TGN+k7c6zYxFdBXMDUJ0cYALyqiDtc
	nEXQBdWJgEHAVYMod2rTsyo1NYeoUgdDMGhAuRr7TpZcppV7i5/OWbCa
X-Gm-Gg: ASbGncvNYjy4eKA6TVEaub16RKBoc3Z26LiqcA6eoyyolRgMrhdBwVM0m7hfO9hYyJu
	k+3gu0PbpJBk907WRVCwXFkB5D+x/AD44fV7QN0c+fpTFTJRj9lFzPNRheg5iZ5sW4Q15kILsnY
	w7xh7F00F9m3YfF3xmBKJv0aL8VcBTS0ySj+ZFzLYqdHrW6HlypkGrX2LteewIH4dbxCsraG7m7
	U7liwJafUQMX/ovzN9sy4KVXCmduKp3LDq7lprbpHgaY6b6JJMJR7Vo0IuBJjJ/7t3QgTKDJvu4
	UwuoQk+bghjyi2Is4ek+/jf7yD3arH5hHJqcm+zw2OHWTqBhdFkvFVUeUGeRL+oNDVnzG9E+Xjg
	Itzo+7+tc3rbphx8YnMIRm2WHeRQTDFhZdbc=
X-Google-Smtp-Source: AGHT+IHn6XGqRb0r+PScKvY1/LXjodqC4uuhJh/N8+E16Q0KZPbEdLymBASG89/eXT0jhBGc4IFnsQ==
X-Received: by 2002:a05:6a21:6009:b0:21c:fa68:b47c with SMTP id adf61e73a8af0-21ee25b3bb4mr21289655637.18.1749484386972;
        Mon, 09 Jun 2025 08:53:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f66a88dsm5448241a12.40.2025.06.09.08.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:53:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
Date: Mon, 9 Jun 2025 08:53:04 -0700
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
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/25 08:16, Usyskin, Alexander wrote:
>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>
>> On 6/9/25 05:23, Usyskin, Alexander wrote:
>>>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>>>
>>>>
>>>>>>>> Several of my qemu boot tests fail to boot from mtd devices with this
>>>> patch
>>>>>>>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>>>>>>>> see this affects configurations with
>>>> CONFIG_MTD_PARTITIONED_MASTER=y
>>>>>>>> when
>>>>>>>> trying to boot from an mtd partition other than mtdblock0, with the
>>>>>>>> mtd partition data in devicetree (.../aspeed/openbmc-flash-
>> layout.dtsi).
>>>>>>>> Is there a guidance describing the changed behavior, by any chance,
>>>>>>>> and how the boot command line now needs to look like when using
>> one
>>>> of
>>>>>>>> the flash partitions as root file system ?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Guenter
>>>>>>>
>>>>>>> I've tried to make is as transparent as possible for the existing users.
>>>>>>> Only change is that now every partition has master that is not
>> partitioned.
>>>>>>> Is the CONFIG_MTD_PARTITIONED_MASTER=n fixed the problem for
>> you?
>>>>>> No change is expected, can you please describe the devices that you
>>>>>> observe with and without the patch? Maybe there is something wrong in
>>>>>> the core logic.
>>>>>>
>>>>>
>>>>> I am trying to boot supermicro-x11spi-bmc in qemu from flash partition 6.
>>>>> The qemu command line is something like
>>>>>
>>>>>       qemu-system-arm -M supermicro-x11spi-bmc,fmc-
>>>> model=n25q256a13,spi-model=n25q256a13 \
>>>>> 	-kernel arch/arm/boot/zImage -no-reboot -snapshot \
>>>>> 	-audio none \
>>>>> 	-drive file=/tmp/flash,format=raw,if=mtd,index=1 \
>>>>> 	-nic user \
>>>>> 	--append "root=/dev/mtdblock6 rootwait console=ttyS4,115200
>>>> earlycon=uart8250,mmio32,0x1e784000,115200n8" \
>>>>> 	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb
>>>> \
>>>>> 	-nographic -monitor null -serial stdio
>>>>>
>>>>> This is with aspeed_g5_defconfig. Note that the flash models need to be
>>>> specified.
>>>>> The default flashes are no longer recognized when booting from qemu
>> since
>>>> commit
>>>>> 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info
>>>> fields").
>>>>>
>>>>> The above only works with this patch reverted (or with v6.15 and older, of
>>>> course).
>>>>>
>>>>> Guenter
>>>>
>>>> Alexander, can you please investigate? We need a fix because Guenter
>>>> might not be the only affecter user. Otherwise this patch can't stand,
>>>> unfortunately.
>>>>
>>>> Thanks,
>>>> Miquèl
>>>
>>> Maybe something is moved, and it is not /dev/mtdblock6 now.
>>>
>>
>> With this patch:
>>
>> # ls -l /dev/*mtd*
>> crw-------    1 root     root       90,   0 Jan  1 00:00 /dev/mtd0
>> crw-------    1 root     root       90,   1 Jan  1 00:00 /dev/mtd0ro
>> crw-------    1 root     root       90,   2 Jan  1 00:00 /dev/mtd1
>> crw-------    1 root     root       90,   3 Jan  1 00:00 /dev/mtd1ro
>> crw-------    1 root     root      244,   0 Jan  1 00:00 /dev/mtd_master0
>> crw-------    1 root     root      244,   1 Jan  1 00:00 /dev/mtd_master1
>> brw-------    1 root     root       31,   0 Jan  1 00:00 /dev/mtdblock0
>> brw-------    1 root     root       31,   1 Jan  1 00:00 /dev/mtdblock1
>> ~ # ls /proc/mtd
>> /proc/mtd
>> ~ # cat /proc/mtd
>> dev:    size   erasesize  name
>> mtd0: 02000000 00010000 "bmc"
>> mtd1: 02000000 00010000 "pnor"
>>
>> After reverting it:
>>
>> # ls -l /dev/mtd*
>> crw-------    1 root     root       90,   0 Jan  1 00:00 /dev/mtd0
>> crw-------    1 root     root       90,   1 Jan  1 00:00 /dev/mtd0ro
>> crw-------    1 root     root       90,   2 Jan  1 00:00 /dev/mtd1
>> crw-------    1 root     root       90,   3 Jan  1 00:00 /dev/mtd1ro
>> crw-------    1 root     root       90,   4 Jan  1 00:00 /dev/mtd2
>> crw-------    1 root     root       90,   5 Jan  1 00:00 /dev/mtd2ro
>> crw-------    1 root     root       90,   6 Jan  1 00:00 /dev/mtd3
>> crw-------    1 root     root       90,   7 Jan  1 00:00 /dev/mtd3ro
>> crw-------    1 root     root       90,   8 Jan  1 00:00 /dev/mtd4
>> crw-------    1 root     root       90,   9 Jan  1 00:00 /dev/mtd4ro
>> crw-------    1 root     root       90,  10 Jan  1 00:00 /dev/mtd5
>> crw-------    1 root     root       90,  11 Jan  1 00:00 /dev/mtd5ro
>> crw-------    1 root     root       90,  12 Jan  1 00:00 /dev/mtd6
>> crw-------    1 root     root       90,  13 Jan  1 00:00 /dev/mtd6ro
>> brw-------    1 root     root       31,   0 Jan  1 00:00 /dev/mtdblock0
>> brw-------    1 root     root       31,   1 Jan  1 00:00 /dev/mtdblock1
>> brw-------    1 root     root       31,   2 Jan  1 00:00 /dev/mtdblock2
>> brw-------    1 root     root       31,   3 Jan  1 00:00 /dev/mtdblock3
>> brw-------    1 root     root       31,   4 Jan  1 00:00 /dev/mtdblock4
>> brw-------    1 root     root       31,   5 Jan  1 00:00 /dev/mtdblock5
>> brw-------    1 root     root       31,   6 Jan  1 00:00 /dev/mtdblock6
>> ~ # cat /proc/mtd
>> dev:    size   erasesize  name
>> mtd0: 02000000 00010000 "bmc"
>> mtd1: 00060000 00010000 "u-boot"
>> mtd2: 00020000 00010000 "u-boot-env"
>> mtd3: 00440000 00010000 "kernel"
>> mtd4: 01740000 00010000 "rofs"
>> mtd5: 00400000 00010000 "rwfs"
>> mtd6: 02000000 00010000 "pnor"
>>
>> I am trying to boot from "pnor". It looks like the partition data (from
>> devicetree)
>> is now ignored. mtdblock6 used to be the second flash.
>>
>> Guenter
> 
> Is this with CONFIG_MTD_PARTITIONED_MASTER?
> 

Yes

> I think that mtd_is_partition is ambiguous now.
> We always have master partition when CONFIG_MTD_PARTITIONED_MASTER
> is enabled and parent check is useless.
> We must check grandparent in this case.
> Miquel, am I right?
> 
> We can return to older patch version that have created partition
> instead of the master device.
> Or try to fix mtd_is_partition, like below.
> Guenter, is below patch helps?
> 
No, it does not make a difference. Partitions are still not created.

Guenter

