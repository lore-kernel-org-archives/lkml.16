Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734025392C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749029; cv=none; b=XouBoKw1Lr6i9vbxKNO6H8At7otOcBm2f+F72mBUUcaOw4mWud6YOfBmiEPGBSIwGJDq9z1dXzX2SmGGd7qeovI6+gukDzIOjyuVay1oe5uULKZ5tLBz9C64jcb8GV2+ZNfL4hWrlWfJvuu/ZY6C8WmS//TjFWzh4rxKP0rCNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749029; c=relaxed/simple;
	bh=/96doEOtwTjIZYMe15BCBKTEvpm2l+nIfJoQ3F8LAq4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PIjn1RI8UmzSbdMMBzOGD1Q5C8VKXrdSprFVDNCrDWSmTc9owD66jum00D6fTAHCNzvHwXXTBN4Z8sLe9jM3soJUvMbXLQICy9tuYpUrcUy0nlOJD2UI9Vuj8wH93cgVqbNgAZiH8LDjI3j9+ppC5GtcqOy5yUZ24GvBEVi2sR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kQZk35Do; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kQZk35Do"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3648214f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744749024; x=1745353824; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loaKyM630zA7zEN1/UNPOs/akSRyWfGEwfls76DM9Gg=;
        b=kQZk35DohW49b5rqYS2YPwxKliYCg8aKspiI2JZcbyhO7fureX5M2+mqTiTbj8dcL/
         avLzwrIaZD+MW2rpaShDJgepoz45KXA1RYXKpilVco3DjiqSAfb0p9f6NW3DvuEgpsoY
         /pWKI9uaOtwNF7zFP+9pBWHKWSAB8InekA87lke4t9S4jRDFCn0bdQx2i4wy8bPZvcZL
         9de3FhZ7v9X9bbWGNyveprhVE+yvJGFy1IkLNlSVhCiSSoHpjVReJVsyuSJW4zj/Wqg7
         41VKQHHISn5hLHmnLwDrrtyXBN5sayniIlTJv3RjHRcL0u9HlZkeIr9toUtD3xObLL+z
         9oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749024; x=1745353824;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loaKyM630zA7zEN1/UNPOs/akSRyWfGEwfls76DM9Gg=;
        b=dx8q2KDbgTczWB202N7T4fhchTDXsxEsYkS48NjfSHFtCWQyCXiFAYI2h/Lx3Ik91w
         H0ZF6epJQ1E1Jav0+4KV6ZD/bIppMrXfQEqwdJsQ9wUrsd5hUA4U62tm0HP2U4jN9wrn
         6M38sR41X5TtugLPWakyKmwcVwOemUjt+jJIaofQhsyycMErE3ordoGJ8RVu0gKji4tP
         s2hIC0ZUOI2TnHUhQGv2tyiurim9so5p6toE32hhTZjg++poedRhSjRZDrBdgm4tJe4Q
         YgJHDCUkgrOEdG2lF21HEBQGWCfcewZ30Kxbpinc4LR4Szlzpbmic/UHT2633JGmQwRs
         hoZg==
X-Forwarded-Encrypted: i=1; AJvYcCUWXMqeE8OvJzT94tr//9XTO6+wXwmrQ+Zfvqt5LgTnaO7kExgozI0PuJXigGhIo+H5jU/h/sDLY60OtB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMenDEpsETZlbNoyEONamGDt6culGST3voxsvMiVD7i6jy0Lha
	cNn3F8Yg6E8gb0UdjOrkp/HawFk12cHTs5CxM3Dsvt/PS/wtQ4j/Osu144kmrtA=
X-Gm-Gg: ASbGncv2Ac1iOL/+TII61L9pyZbM9ZmlU6moQasI5t72+/pD7/Ns3T87/OC/z0t2E1w
	Xv+R2RP+HNF7A7MepInil7rKLOdwOypoRUyoGuFs5j8vAy9Nmw6RAqTgfWMQX0kbg/KS0mPGG3A
	F7dvQsPQjKIVb661eMWkb84hpEEN/86LsQ7YwQog3rf7Aqehw/XVrFddzcPZL918BHIdOW6ryRc
	D++Sek8g5b/BvSCLKV+zr1NOOIchLzaFwBVXREkOBuE8Qnv2bk0WzKX2rJItlKlUE2dHTZEOmtV
	78WkBZ790rQGbjoX0MgCY3oH2x7J+7fDS+eEySpePw60AcIdsaUfp+Cgr6JiMyBZgtGnhCpL1f6
	af48N
X-Google-Smtp-Source: AGHT+IE8Ga583hP6MeWQc3SP+sZk2HL6J0Mdlbn8bdA8Uud4ZliUSVIwJw/726D3uEIjVRfGPnlJIQ==
X-Received: by 2002:a05:6000:430c:b0:39c:1258:2dc7 with SMTP id ffacd0b85a97d-39ee2771b3amr673507f8f.56.1744749023992;
        Tue, 15 Apr 2025 13:30:23 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4405b4d33a6sm282105e9.15.2025.04.15.13.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 13:30:22 -0700 (PDT)
Message-ID: <d2cd5a8a-c8fe-4a6b-9712-15755a4a5e3e@linaro.org>
Date: Tue, 15 Apr 2025 22:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: dl-S32 <S32@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: s32g2 crash
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi,

I've the following error when I run several grep in parallel.

How to reproduce:

for i in $(seq 1 6); do sudo grep -rI azertyuiop / & done

Even if the trace show v6.15-rc1-*dirty, the changed code is disabled.


[  442.556646] Internal error: synchronous external abort: 
0000000096000210 [#1]  SMP
[  442.564390] CPU: 3 UID: 0 PID: 384 Comm: grep Not tainted 
6.15.0-rc1-00010-g67d222ce45c5-dirty #245 PREEMPT
[  442.574403] Hardware name: NXP S32G2 Reference Design Board 2 
(S32G-VNP-RDB2) (DT)
[  442.582106] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[  442.589194] pc : regmap_mmio_read32le+0x8/0x60
[  442.593724] lr : regmap_mmio_read+0x44/0x70
[  442.597981] sp : ffff800084423b60
[  442.601353] x29: ffff800084423b60 x28: ffff8000822b2000 x27: 
ffff000800a91c00
[  442.608632] x26: 0000000000000104 x25: ffff800084423dc0 x24: 
0000000000042000
[  442.615913] x23: ffff00005dc80000 x22: ffff000800a91c00 x21: 
ffff800084423c4c
[  442.623189] x20: 0000000000000010 x19: ffff0008002f8300 x18: 
00000000ffffffff
[  442.630466] x17: 0000000000000000 x16: 0000000000000000 x15: 
ffff800084423a80
[  442.637737] x14: 0000000000000001 x13: ffff00005dc80038 x12: 
000000000001e08f
[  442.645010] x11: 0000000000000000 x10: 0000000000000020 x9 : 
fffffdffc1772000
[  442.652283] x8 : 0000000000000020 x7 : 0000000000000002 x6 : 
000000000000003a
[  442.659556] x5 : ffff800080b6c808 x4 : 0000000000000010 x3 : 
0000000000000010
[  442.666828] x2 : ffff800080b6cf88 x1 : 0000000000000010 x0 : 
ffff800082d8d108
[  442.674103] Call trace:
[  442.676590]  regmap_mmio_read32le+0x8/0x60 (P)
[  442.681118]  _regmap_bus_reg_read+0x70/0xb0
[  442.685379]  _regmap_read+0x60/0xd8
[  442.688932]  regmap_read+0x4c/0x78
[  442.692396]  regmap_read_debugfs+0x138/0x3a0
[  442.696747]  regmap_map_read_file+0x28/0x34
[  442.701009]  full_proxy_read+0x70/0xd0
[  442.704830]  vfs_read+0xc4/0x324
[  442.708120]  ksys_read+0x70/0x108
[  442.711495]  __arm64_sys_read+0x1c/0x28
[  442.715401]  invoke_syscall+0x48/0x10c
[  442.719222]  el0_svc_common.constprop.0+0x40/0xe0
[  442.724013]  do_el0_svc+0x1c/0x28
[  442.727388]  el0_svc+0x30/0xcc
[  442.730500]  el0t_64_sync_handler+0x10c/0x138
[  442.734935]  el0t_64_sync+0x198/0x19c
[  442.738670] Code: b5000001 d65f03c0 f9400000 8b214000 (b9400000)
[  442.744871] ---[ end trace 0000000000000000 ]---
[  442.749569] note: grep[384] exited with irqs disabled
[  442.754898] note: grep[384] exited with preempt_count 1



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

