Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DACC1F0984
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572131; cv=none; b=XeGe1EZaPdkCfIEK3f6oPiBz0ikk1u6YVKVuKjfcEFzpMCbsocGOzFyYw4kOrQIugifC07UH6gn++WJNVcc8dV/ZH4RtS0ry46Na8MNgRxRh0s840kCpgn+m2jFCfAYo9Elb+axuOeQXRcdD4XAMP5ybgvGIHyB9LnB+IdKh27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572131; c=relaxed/simple;
	bh=1co5tVLP/u/Jmc8gRcL0YoUwLrdb5cdKzfJRPDUKtnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnPVM37pcxDMsItrTdTgyMHTIBr9ORGQMO7BuPwhwrgp0VpeafNiHZ1rNX/37VNympG4sxICuVbtUygHKZgEJxMP49QZBsX4pHSVs/QZOas+spvU9wGW1tq7aT8MrJMAc76xeTpQBg6XqDVbTlSxlS/cs4iyvfD+TUZ4YoScbnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmIxjD/R; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmIxjD/R"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6488222b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749572129; x=1750176929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SGmRJAWB9RdYxrzDZGLu8XN2tBT3An3sj/2b1cUQNXg=;
        b=dmIxjD/RZeynB15Kdf6l4uRzeHgleZWHk4MdZYef9dESJYkbl7ShSuF1Zru1HdmF1N
         tlbSX9LJknXJ8yNq2e9/JN37FVqxaHatrSQ+hVEOGBqOTvM3L6UrWQW6rbOo7xQRe91U
         NKKp5+2GG4hIwl28osqqopkpxgV4IzNRRZOWPSU/zAOPUHN0gVOfmj9e9m97o194PEQN
         jrGMWYSFDLdg5UEbHKXdDTfNGM9ISUmeYADJeocNZg/qnTRhWW/9H0Ovb7FvuE7mnUeX
         P2PYIaFR+hqCiGMU1BDYXlwxhtSGiy8CpOddmjcR2qPW5UQhv7nm2OKy+MMlFtMrpF5K
         77hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572129; x=1750176929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGmRJAWB9RdYxrzDZGLu8XN2tBT3An3sj/2b1cUQNXg=;
        b=vJPxxUrtYyBnm5R5StqRcwHDplTRhZppJpVhXhCSShKfzZcUGBZYuErLNwwiTkZIfh
         Fxfb4MzK+AO8n5ldNcy6DX4qi/91GDy6MDJgW8Hccf+VYTn6jC28P69DfLv3RQUXCXjH
         GTeglx7SEwUFunDnLXSbAnRV5UsUcFVIIJF2aO5IJeGCSM2e9uU0Q2D7nhdxqrZt/PiR
         1JK7j4+0SgHMC9vAlizbkNFybrJJba8+McwOdr/j9hkdJ3yelrgTAaXjo7FO4GVTWRap
         //A2oyOuOg67FG4uz2yCwMp7QhfJjPix+3bCEo1iRFhH0lJAyvBx+nnhPe0R9ZRARyfZ
         evuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWURXMEdvvDIJNDY3mGdCT5Ooafrobe734L/h1kqmz7JldjPDCQ3RzjNGX14oUe8LWEZl78SSqUC4tVwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN2qYaxwtBNKVgRmnQwhvLvUqfQZdFgBmIert8Zs/7iBLPCWT1
	xrgXraJYChWIny6ysXVTrI9q8nJ390g586iWgHMcTMkvbsmamUG61G7F
X-Gm-Gg: ASbGncvixX4u8BX8uZFKhfNJsgww4YZmcvcxXJnjA9jUAlbRvPmk/U7bO3BLYxfpJwn
	NSTu3qzgej65l797s9nat306ap5rHvCaxprVI3vmTI4wRJYaIgIAl93us2vePjBfRMbJq7/oUsX
	Yk60mdg6dOfH03WKYPxtz2F50bEz/Upr5eI8R/rjtSD3xmMnGIkgIk4wxbwIsFDwI5P3QiojiEO
	6PFadjltu7X99pSbBLXDGhuaWpzcHhraaEJUSx3LGBprLiEN8/PkGQ2tlkj6zNwF6eEjyYpwZbe
	ZeRCk+Zx4E2/DDmSmaxnJBFxqA+26+OIqzUyYtAPvlfgQvzqq84DjoU775C4nz5NKdPB68L9Jcr
	ocLneCEqS5SODhbVQevmXE4v29HQjaMPJ6WA=
X-Google-Smtp-Source: AGHT+IHYQYM7G6bttifJeNfjnkDx1F8NGq5T9NLpKQPd57Ef2ALNRna0f38GlbUS9BZPkJm49q/Gfw==
X-Received: by 2002:a05:6a00:2d15:b0:746:3200:620 with SMTP id d2e1a72fcca58-7486cb4ca2cmr227347b3a.9.1749572128739;
        Tue, 10 Jun 2025 09:15:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af38378sm7923696b3a.16.2025.06.10.09.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:15:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
Date: Tue, 10 Jun 2025 09:15:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
To: Richard Weinberger <richard@nod.at>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
 <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/25 05:54, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Alexander Usyskin" <alexander.usyskin@intel.com>
>> Richard, I've reproduced your setup (modulo that I must load mtdram manually)
>> and patch provided in this thread helps to fix the issue.
>> Can you apply and confirm?
> 
> Yes, it fixes the issue here! :-)
> 

It doesn't seem to fix the issue if the partition data is in devicetree.

Here is my sample qemu command line:

qemu-system-arm -M supermicro-x11spi-bmc,fmc-model=n25q256a13,spi-model=n25q256a13 \
	-kernel arch/arm/boot/zImage -no-reboot \
	-snapshot -audio none \
	-drive file=/tmp/flash,format=raw,if=mtd \
	-drive file=/tmp/flash,format=raw,if=mtd,index=1 \
	-nic user \
	--append "kunit.enable=0 root=/dev/mtdblock0 rootwait console=ttyS4,115200 earlycon=uart8250,mmio32,0x1e784000,115200n8" \
	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb \
	-nographic -monitor null -serial stdio

This does not create any mtd partitions, even after applying the
patch suggested earlier.

Guenter

