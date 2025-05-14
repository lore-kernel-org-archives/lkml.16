Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500E34CF5;
	Wed, 14 May 2025 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226780; cv=none; b=sT3cXxMJxb5Z5KR8eFxp9RC7WIqy9co9xc4g8XTssSD4+fE4QJx+rULM1eTCuMRfUHNysJE7h9P8yVEDAfz1gljpmSXsA3mr0bPMDflkdz1fxB59Ff1xXWvEQD2MSoX3FS7Keog9i8/xqFTRNuB+gb5nfGTzXvjU6VACbb9VktY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226780; c=relaxed/simple;
	bh=S4U3IKiBfcd42Hz/OWlQRE41HRNxq7Bto8HSmxmDbMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSMYYoOB2qyKQ86Npu2f5j2Y04ZaRrkESwJ5c0FjIe6BZynP4yIpfYaAaggSOiAerzhRF1EVvJKcFClu0t2EELc/QKj9d9PVEZpDcTikawSImah3ejG/LbPtboM6moRqa297e6tB9Po+fG5Kk6r9cco1PlucwQzXRNZ6DdOtSgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERhxU54o; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERhxU54o"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5995102b3a.0;
        Wed, 14 May 2025 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747226778; x=1747831578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1FEo+M4Kzgn7iECngUXq9Y1nzefmNWO2FcU0hxjdQC0=;
        b=ERhxU54o1VQHBZmBm4qPUSBczKWeGCxUxAy0vU5LW0PDZqrtBsK7O+CEBF7FSHE4Y/
         nddvpDcJ86lDtTRwTv07auZ1zKqoEGbLk0TDNfK6h9s5gTJJu8lWA8Tjk/VhfDP1sMTS
         MAkNNyho/d1IGNc+vg4fZymanG24Vs8SJg40H6ER1b04/Wjlf1uO18O/mXsmp7oZdZ8F
         6tVJ8c3AqZBU5+I9u8ztluOiEJKjP5ok+zW9LUsqJK49F3hK4396gwMGtR3oFtMtjXZy
         v8tqiDJl1URyEP7ND6vI/oSg3Ex4RLliysHvkaJth8kTONqgVwIgXMGmlIc/5pljdZUf
         sFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747226778; x=1747831578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FEo+M4Kzgn7iECngUXq9Y1nzefmNWO2FcU0hxjdQC0=;
        b=uhsVbmI2mPSY/rMAGuwMZCjOcX0Np7HtMuGY2A9KHBfr99nIfg+IIKEjFUqFAMi1q1
         4hAsUBi7Rx1bsMldycnRSu2Pd73TJ13L+xOdyMUQLT30AqE93yjJJj6MJblPv6zjt9FO
         e5vZsGjPA/mWpxvMdNw9F5GQR0HwYFC++iocPuc336JTifZmOVSz/nxioCSHz4fXOvdu
         ni8pWqA4jwJLYqk21JuwnQN5o8v/Rkh8apI4i+ms28/Lv8gqQYWrR1FAAbKvaZwKgoqd
         vsko2dzAnyrbt4G8rvvHTFpIHRIpQhyI2UNl/Me7uGujj5pwnPsbsBebpgTX6PURFcxg
         F++Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdoEajjx7dO5pGNqlvZjnr43XApfElxko8dZBqsbCUpj35A9VdyFiqq7KY3BfubmIq1Bj6LMytrtII2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmrcdDvGv90CcNxk7fmmNqq6txHX1MAcTTZCuUeiKosjB/AyL
	bax+55uGDrljyJ9R4+4v9g98lGGWCpoF6nFoov9LGOegXEOYkJq1
X-Gm-Gg: ASbGncsTq5nBgltHoLQ8GnmwKwXJOkVwDbGF20ROMBn5Owm3U40pMRgKpaJ5Ir8xhq4
	GVVgbsTZre6B2WFOAjGffD5DnuzH6U1sp5MwKs+TVqBpi1Dkod0i7z9btd5JTqOAjb3wib3yF7N
	q0x4QeIwQzxEHCAVnza5w0c4N0KTkIX3UfwEU6yTKZoE8dP4ixEy+Sa214m5uV1Qfvzvsg66yqq
	sxRHFo/k2S1xSQW+qadLEfTTE7HIvgqcqfddvtxEnClryi5YlQQTzd7v4AIY9BpTMN/ye8vGIQZ
	nqHYmChvxCtAc77SYU4fmuWB+jIWF/kUlEiWGmvqjGoArjAVrtPZL+7SNpFxlgkRiyloyQm39l+
	VMrRpldTn5nSQ/RLYNpRHh1cQiISEZan/068=
X-Google-Smtp-Source: AGHT+IEcoNpXgF2QzoP1X1bi0ULDj9GA0jxmcbkP6IqfHKb/Ihwdr1mlKjq0eAzrEinnLtB6gIHK3g==
X-Received: by 2002:a17:903:3508:b0:223:5e76:637a with SMTP id d9443c01a7336-231981006a8mr49595705ad.23.1747226777908;
        Wed, 14 May 2025 05:46:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3345ecbesm1426821a91.28.2025.05.14.05.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 05:46:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4ce8c308-15e5-4489-a890-612c4e97c98d@roeck-us.net>
Date: Wed, 14 May 2025 05:46:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: w83627hf crash when loaded on ARM
To: Corentin Labbe <clabbe.montjoie@gmail.com>, jdelvare@suse.com,
 linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <aCRZhtgOKC7kCPG6@Red>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <aCRZhtgOKC7kCPG6@Red>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 01:51, Corentin Labbe wrote:
> Hello
> 
> On my sun8i-a33-olinuxino, when w83627hf is modprobed, it crashes:
> [  177.854109] 8<--- cut here ---
> [  177.854166] Unable to handle kernel paging request at virtual address fee0002e when write
> [  177.854189] [fee0002e] *pgd=00000000
> [  177.854227] Internal error: Oops: 805 [#1] SMP ARM
> [  177.859231] Modules linked in: w83627hf(+) hwmon_vid dm_crypt twofish_generic twofish_common serpent_generic sha3_generic jitterentropy_rng drbg ccm algif_aead cmac cfg80211 bluetooth ecdh_generic ecc ctr axp20x_usb_power sun4i_backend axp20x_pek sun4i_frontend des_generic lima drm_shmem_helper gpu_sched drm_dma_helper aes_arm_bs sun6i_drc aes_arm snd_soc_simple_card snd_soc_simple_card_utils sunxi snd_soc_core sun4i_gpadc_iio musb_hdrc sun4i_ss libdes ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd soundcore iio_hwmon
> [  177.908280] CPU: 0 UID: 0 PID: 7279 Comm: modprobe Not tainted 6.15.0-rc6-next-20250513-00001-g1d1183a441d8 #64 NONE
> [  177.918890] Hardware name: Allwinner sun8i Family
> [  177.923593] PC is at w83627hf_find+0x5c/0x234 [w83627hf]
> [  177.928953] LR is at w83627hf_find+0x4c/0x234 [w83627hf]
> [  177.934280] pc : [<bf2ce05c>]    lr : [<bf2ce04c>]    psr: 60000013
> [  177.940544] sp : f0e61df0  ip : 00000000  fp : c2236f00
> [  177.945766] r10: c918bb90  r9 : 00000000  r8 : 00000000
> [  177.950989] r7 : c2236f00  r6 : f0e61e0e  r5 : ffffff87  r4 : f0e61e10
> [  177.957513] r3 : fee0002e  r2 : 00000000  r1 : 00000000  r0 : c8dd3640
> [  177.964038] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [  177.971172] Control: 10c5387d  Table: 478dc06a  DAC: 00000051
> [  177.976914] Register r0 information: slab kmalloc-64 start c8dd3640 pointer offset 0 size 64
> [  177.985375] Register r1 information: NULL pointer
> [  177.990086] Register r2 information: NULL pointer
> [  177.994791] Register r3 information: 0-page vmalloc region starting at 0xfee00000 allocated at pci_reserve_io+0x0/0x30
> [  178.005498] Register r4 information: 2-page vmalloc region starting at 0xf0e60000 allocated at kernel_clone+0xa4/0x384
> [  178.016203] Register r5 information: non-paged memory
> [  178.021257] Register r6 information: 2-page vmalloc region starting at 0xf0e60000 allocated at kernel_clone+0xa4/0x384
> [  178.031955] Register r7 information: slab filp start c2236f00 pointer offset 0 size 136
> [  178.039976] Register r8 information: NULL pointer
> [  178.044681] Register r9 information: NULL pointer
> [  178.049386] Register r10 information: slab inode_cache start c918bb90 pointer offset 0 size 384
> [  178.058099] Register r11 information: slab filp start c2236f00 pointer offset 0 size 136
> [  178.066203] Register r12 information: NULL pointer
> [  178.070996] Process modprobe (pid: 7279, stack limit = 0x80574f80)
> [  178.077179] Stack: (0xf0e61df0 to 0xf0e62000)
> [  178.081539] 1de0:                                     00400000 00000000 bf2ce234 c1f6fe00
> [  178.089715] 1e00: c794abc0 bf2ce26c 00000000 00000000 00000000 0000002e 00000000 00000000
> [  178.097888] 1e20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 14ef0d3e
> [  178.106062] 1e40: bf2ce234 bf2ce234 c1f6fe00 c031ca28 00000000 00000000 00000000 00000000
> [  178.114237] 1e60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [  178.122412] 1e80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 14ef0d3e
> [  178.130586] 1ea0: bf2c9940 c8dd3f80 000d6b18 c2236f00 c1fa6350 c03f2794 c2236f00 c1fa6350
> [  178.138760] 1ec0: 00000000 c2236f00 000d6b18 c03f4860 f0e61ee4 7fffffff 00000000 00000002
> [  178.146935] 1ee0: 00000000 f0e73000 f0e76ca4 f0e77768 f0e73000 00009230 f0e7bb50 f0e7b9a4
> [  178.155109] 1f00: f0e78c88 00000c00 00000f90 00002560 0000126d 00000000 00002550 00000029
> [  178.163283] 1f20: 0000002a 00000027 00000000 00000017 00000000 00000000 00000000 14ef0d3e
> [  178.171457] 1f40: 000000d0 c1fa5f40 00000001 c03f4bc0 c1fa6290 000d6b18 c918bb90 00000000
> [  178.179632] 1f60: c1fa6290 00000000 00000000 f0e61f6c f0e61f6c fffffffc 000a0000 14ef0d3e
> [  178.187807] 1f80: 00000000 000d6b18 000d66d0 000d6b18 0000017b c0300324 c794abc0 0000017b
> [  178.195981] 1fa0: 000d4c94 c03000c0 000d6b18 000d66d0 00000003 000d6b18 00000000 000d6af0
> [  178.204155] 1fc0: 000d6b18 000d66d0 000d6b18 0000017b 000d6af0 00000000 00000001 000d4c94
> [  178.212330] 1fe0: becffaa0 becffa90 0002ef30 b6ee6300 80000010 00000003 00000000 00000000
> [  178.220500] Call trace:
> [  178.220539]  w83627hf_find [w83627hf] from sensors_w83627hf_init+0x38/0xdcc [w83627hf]
> [  178.231022]  sensors_w83627hf_init [w83627hf] from do_one_initcall+0x58/0x200
> [  178.238190]  do_one_initcall from do_init_module+0x54/0x200
> [  178.243783]  do_init_module from init_module_from_file+0x94/0xd0
> [  178.249805]  init_module_from_file from sys_finit_module+0x1a4/0x300
> [  178.256174]  sys_finit_module from ret_fast_syscall+0x0/0x54
> [  178.261844] Exception stack(0xf0e61fa8 to 0xf0e61ff0)
> [  178.266897] 1fa0:                   000d6b18 000d66d0 00000003 000d6b18 00000000 000d6af0
> [  178.275072] 1fc0: 000d6b18 000d66d0 000d6b18 0000017b 000d6af0 00000000 00000001 000d4c94
> [  178.283243] 1fe0: becffaa0 becffa90 0002ef30 b6ee6300
> [  178.288299] Code: e5943004 e3e05078 e7f33053 e2433612 (e5c35000)
> [  178.294391] ---[ end trace 0000000000000000 ]---
> [  178.299008] note: modprobe[7279] exited with irqs disabled
> 
> Regards
> 

That probably happens with lots of drivers which access the 0x2e / 0x4e I/O ports blindly
assuming they are accessible. You'll have to black-list the driver. Or, rather, its build
should not even be enabled in the first place.

Guenter

