Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC9D204F99;
	Wed, 14 May 2025 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212684; cv=none; b=i0dV/YR+AWXztX5lxPDu+l8QWuI/GaJN1kxca0BTo+UcIplx5z8C3Vxg6xWlpcrS/Uz2CipiCbo/eCssDCmdyo+9O9Uipk6LOyvb6yZNGeZTgflA9wC3vYBl3uKTWvLz4ZblEqSV5o5mogau23idKUUOtnP43EmqQ/gZItHolFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212684; c=relaxed/simple;
	bh=JiAiQjNJuZ24gKYWQrxFS7VMAB0adN2kRwbSwer10rs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPOYL5SjzRR/W0htbAZ/9lwy8gZikcuizRwBhD/LRRtG4He91S2acoj1t/lPoFs4BUtZgIetVEA762H3ZrIWvlNQj2knmh676fju2tSYA46dq5okoGgIsaCXkPbpokV2baTHC8xG01Zq9lUaZIkV9BxUtLeDd1KeJcDFRwrWJ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2dywBlz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2dywBlz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso4587943f8f.1;
        Wed, 14 May 2025 01:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747212681; x=1747817481; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwTuwiO0RezGpL8y2KLoL2zHlsfe9yOrP+auJU9r1M4=;
        b=l2dywBlzKJ07+UePa6xSm9ouM6wM2jgyuZDL4erm2KnW1QV+PQztlmk8X6DjVg9fHf
         QA7QA80sFck/dFzRqAzZANyh2tjvK1FL6R4DdP21J/v07oRGfVGUv0XgCCGok+YXHU4b
         XHsyKNa/xrwXUrzzI7poeiHrRD6hcoZk5GhNhD/u2LEkRUcPAMS2NNOkhofh0/epkM2J
         SOBcBYc/VTnncXifg2v47yZ4NWZ7CWwiWLKkvowFGjiso4KsaoitdnElGBlO5MKYFqsM
         1qZFnNyYhN9wIVYg4OV37/pbLIFyfAgEGE1q3vQqIIfdDP+cjM+Dwxa9jsQSUcRoWSAL
         9CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747212681; x=1747817481;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwTuwiO0RezGpL8y2KLoL2zHlsfe9yOrP+auJU9r1M4=;
        b=c90zss4PHZm4Taf6kAWYiHthLtrnjf4UES0oMa59x7HBp71MYfUJkBjTG197OFQU0B
         8p6ieqtQkGTlbgC7Ow2Q1WB+UhJ7RbL0LY5o627e0xfEtNO2EKQmePyYMr6etk5t9D8N
         BRSrAAHDva0uVZkJx5UZhxRAJkUXHaSNL7IdHu14Cak2XGt7mOqPikLV5f9pcNTaCzbv
         LSJI+mELUyVpyGIB/uLDkm9ERyLAl+/lYjz/O5itDvW7MAFqz5ihf7DsSxBXlWfSboat
         CpOem4FxFiEB2tO9AX7CV0DCQk+lj3FTdLcX6WhLb9uRZ/HJSHY9kojk0202K8JrRcO1
         PssA==
X-Forwarded-Encrypted: i=1; AJvYcCUPEUJadsFFMY0t5QRbcMZsMAAwGBYPUhuH0iXYQlmfe+uJbZdGI1jNijM9nsgmOXi6PH5rYJUpX1/MFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkR6VRQLs37Dv/IDT+HkGa7E9/JcTkstGZgJXB2SimBoY4Tams
	aAMjwGBGSbodq/1kB36lpZrTcLV3vKJLmLUFM1uarzyInpJW+RgN
X-Gm-Gg: ASbGncsY2jEWqn3Behbr3heMAtlx49LXmk6jO6mOvWWp62uqB5IBma1uy8kNLRgT3Oo
	TMjdJRX/kEu4tStapbPcel0rLCO0BnZKSA/nE2FkhE75ZmTs+TckUsBCclDLVHh7DjK/W39Zvhv
	WvEk/z8Ag4CD9P4mq/eHqQmKLK4C3Bcru98JnR+png6yDYGj0vOBbI0JQrHfTpEpQCRsxilWez7
	2SDvaCTV4h3GG5dgBusq6i9QUlfh+9euGXTczMven0UyaX5C/3P78H5K9rOcREYa7gsK2wt8568
	wr9lFqvDoYM9bayCeLIMyA8p34LDQtJec36UsFlqLz1LIKfsCk0=
X-Google-Smtp-Source: AGHT+IFn+wdYZm/JO2PEbWTM3UyxmLPVI5Atb7bVxxVXxA4J2E/IMnmzP1HdVeyoVLSg+Fpxiw+n4g==
X-Received: by 2002:a5d:43ca:0:b0:3a3:4b9b:f0c2 with SMTP id ffacd0b85a97d-3a34b9bf138mr948644f8f.59.1747212680804;
        Wed, 14 May 2025 01:51:20 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2c8sm19014642f8f.61.2025.05.14.01.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:51:20 -0700 (PDT)
Date: Wed, 14 May 2025 10:51:18 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: w83627hf crash when loaded on ARM
Message-ID: <aCRZhtgOKC7kCPG6@Red>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello

On my sun8i-a33-olinuxino, when w83627hf is modprobed, it crashes:
[  177.854109] 8<--- cut here ---
[  177.854166] Unable to handle kernel paging request at virtual address fee0002e when write
[  177.854189] [fee0002e] *pgd=00000000
[  177.854227] Internal error: Oops: 805 [#1] SMP ARM
[  177.859231] Modules linked in: w83627hf(+) hwmon_vid dm_crypt twofish_generic twofish_common serpent_generic sha3_generic jitterentropy_rng drbg ccm algif_aead cmac cfg80211 bluetooth ecdh_generic ecc ctr axp20x_usb_power sun4i_backend axp20x_pek sun4i_frontend des_generic lima drm_shmem_helper gpu_sched drm_dma_helper aes_arm_bs sun6i_drc aes_arm snd_soc_simple_card snd_soc_simple_card_utils sunxi snd_soc_core sun4i_gpadc_iio musb_hdrc sun4i_ss libdes ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd soundcore iio_hwmon
[  177.908280] CPU: 0 UID: 0 PID: 7279 Comm: modprobe Not tainted 6.15.0-rc6-next-20250513-00001-g1d1183a441d8 #64 NONE 
[  177.918890] Hardware name: Allwinner sun8i Family
[  177.923593] PC is at w83627hf_find+0x5c/0x234 [w83627hf]
[  177.928953] LR is at w83627hf_find+0x4c/0x234 [w83627hf]
[  177.934280] pc : [<bf2ce05c>]    lr : [<bf2ce04c>]    psr: 60000013
[  177.940544] sp : f0e61df0  ip : 00000000  fp : c2236f00
[  177.945766] r10: c918bb90  r9 : 00000000  r8 : 00000000
[  177.950989] r7 : c2236f00  r6 : f0e61e0e  r5 : ffffff87  r4 : f0e61e10
[  177.957513] r3 : fee0002e  r2 : 00000000  r1 : 00000000  r0 : c8dd3640
[  177.964038] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  177.971172] Control: 10c5387d  Table: 478dc06a  DAC: 00000051
[  177.976914] Register r0 information: slab kmalloc-64 start c8dd3640 pointer offset 0 size 64
[  177.985375] Register r1 information: NULL pointer
[  177.990086] Register r2 information: NULL pointer
[  177.994791] Register r3 information: 0-page vmalloc region starting at 0xfee00000 allocated at pci_reserve_io+0x0/0x30
[  178.005498] Register r4 information: 2-page vmalloc region starting at 0xf0e60000 allocated at kernel_clone+0xa4/0x384
[  178.016203] Register r5 information: non-paged memory
[  178.021257] Register r6 information: 2-page vmalloc region starting at 0xf0e60000 allocated at kernel_clone+0xa4/0x384
[  178.031955] Register r7 information: slab filp start c2236f00 pointer offset 0 size 136
[  178.039976] Register r8 information: NULL pointer
[  178.044681] Register r9 information: NULL pointer
[  178.049386] Register r10 information: slab inode_cache start c918bb90 pointer offset 0 size 384
[  178.058099] Register r11 information: slab filp start c2236f00 pointer offset 0 size 136
[  178.066203] Register r12 information: NULL pointer
[  178.070996] Process modprobe (pid: 7279, stack limit = 0x80574f80)
[  178.077179] Stack: (0xf0e61df0 to 0xf0e62000)
[  178.081539] 1de0:                                     00400000 00000000 bf2ce234 c1f6fe00
[  178.089715] 1e00: c794abc0 bf2ce26c 00000000 00000000 00000000 0000002e 00000000 00000000
[  178.097888] 1e20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 14ef0d3e
[  178.106062] 1e40: bf2ce234 bf2ce234 c1f6fe00 c031ca28 00000000 00000000 00000000 00000000
[  178.114237] 1e60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  178.122412] 1e80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 14ef0d3e
[  178.130586] 1ea0: bf2c9940 c8dd3f80 000d6b18 c2236f00 c1fa6350 c03f2794 c2236f00 c1fa6350
[  178.138760] 1ec0: 00000000 c2236f00 000d6b18 c03f4860 f0e61ee4 7fffffff 00000000 00000002
[  178.146935] 1ee0: 00000000 f0e73000 f0e76ca4 f0e77768 f0e73000 00009230 f0e7bb50 f0e7b9a4
[  178.155109] 1f00: f0e78c88 00000c00 00000f90 00002560 0000126d 00000000 00002550 00000029
[  178.163283] 1f20: 0000002a 00000027 00000000 00000017 00000000 00000000 00000000 14ef0d3e
[  178.171457] 1f40: 000000d0 c1fa5f40 00000001 c03f4bc0 c1fa6290 000d6b18 c918bb90 00000000
[  178.179632] 1f60: c1fa6290 00000000 00000000 f0e61f6c f0e61f6c fffffffc 000a0000 14ef0d3e
[  178.187807] 1f80: 00000000 000d6b18 000d66d0 000d6b18 0000017b c0300324 c794abc0 0000017b
[  178.195981] 1fa0: 000d4c94 c03000c0 000d6b18 000d66d0 00000003 000d6b18 00000000 000d6af0
[  178.204155] 1fc0: 000d6b18 000d66d0 000d6b18 0000017b 000d6af0 00000000 00000001 000d4c94
[  178.212330] 1fe0: becffaa0 becffa90 0002ef30 b6ee6300 80000010 00000003 00000000 00000000
[  178.220500] Call trace: 
[  178.220539]  w83627hf_find [w83627hf] from sensors_w83627hf_init+0x38/0xdcc [w83627hf]
[  178.231022]  sensors_w83627hf_init [w83627hf] from do_one_initcall+0x58/0x200
[  178.238190]  do_one_initcall from do_init_module+0x54/0x200
[  178.243783]  do_init_module from init_module_from_file+0x94/0xd0
[  178.249805]  init_module_from_file from sys_finit_module+0x1a4/0x300
[  178.256174]  sys_finit_module from ret_fast_syscall+0x0/0x54
[  178.261844] Exception stack(0xf0e61fa8 to 0xf0e61ff0)
[  178.266897] 1fa0:                   000d6b18 000d66d0 00000003 000d6b18 00000000 000d6af0
[  178.275072] 1fc0: 000d6b18 000d66d0 000d6b18 0000017b 000d6af0 00000000 00000001 000d4c94
[  178.283243] 1fe0: becffaa0 becffa90 0002ef30 b6ee6300
[  178.288299] Code: e5943004 e3e05078 e7f33053 e2433612 (e5c35000) 
[  178.294391] ---[ end trace 0000000000000000 ]---
[  178.299008] note: modprobe[7279] exited with irqs disabled

Regards
