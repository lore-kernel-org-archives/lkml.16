Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C2239E8D;
	Thu, 19 Jun 2025 05:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312587; cv=none; b=uUxuu1bUNJ5HGi+CYeMMB3Nl6x0xwSr6tmSzzR1aw8yGIjY6QMfKzI2WVUviwTh9ReCKYBsMUczdd52NwVkjulMYtH3gXTpdV22yO0hXAWIUWgS9aJ3u+fSGZWZmGklri7xEaVNGH2hVWyyeXU/trbGevGyWtnU+cwCRPwBdC4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312587; c=relaxed/simple;
	bh=qzwEDgPoJity0tqP0/P4eCieKrO+jS22y4Yfba4q7FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a9Ped8p91IikQi1m8ylToWqccMe2aF+rzAhs6+j8WECnyUV0XOJhaPw/fX7s/bZIj73wMTusNz1/zptstHGe5rrLN7dkem9vQ4LcoLkmtsUfdFy5Sd7esRZkiRaBA0GmPwDrcLrJtTZIW4awhtO41gRMdcnJWJVbXSajB6bnmyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhShRsXu; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhShRsXu"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso297539b3a.0;
        Wed, 18 Jun 2025 22:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312585; x=1750917385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9lTx2lA8dlik7Wov+P/HO8cPT+eBFwE+42x6H/JxB8U=;
        b=MhShRsXuUQpIERuBAUtClPzZhn/MgucEhNLWXhudM5E1bIlJ+ozyDtZaa5EqlfzIJD
         VESEqtCRlPWUvt44kDkBPCLJ9uhjCsyDwMXhIGWHhdw0JOF2qtrfsBV2pxgTP2LJk3Kf
         8/6wzACN5cEB6z+qJGO+wEGksz70SqTokCePihn2R9ICLnV/L/37PUSN+GRtjMF1jhJV
         a+PKRZU8CvpwQUhSAW/aspZkDLyYsFWQ4pZMLqKzURggupDtJ2eE3pHupp3sUoRUFz1y
         4COk+ydg3G4D3QNGwNakYx+gCjrfate5PXOKJgMEbjOL1qLDHLUAqk4iFwPuqn79r91g
         ceMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312585; x=1750917385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lTx2lA8dlik7Wov+P/HO8cPT+eBFwE+42x6H/JxB8U=;
        b=SFq5Cc+Zq96D2tdaolkCYZRk1y+KQWE+AP7wotnrvV8d5/N7pYyEQIgXFqMFumdZNa
         TM7KlwDFPYJEPKotTZUbqmYKN8FXDlaPHwZtPi+/odWKvztNuajJ/1V9sMz0Ozj2t7r6
         EOzD1RWuxm/4541Q6/VKZA0drJ6SIWU/+ce8dBTvOZtpDlt9O7vovr+brKtWqA/j7NPa
         AsI+EAn6bm/ta/J50GGqdFv8j3HZWzcBWFrEl7EEKnRyqmsaF0kiW1tDyGYUm+6vYXa2
         PzVCqFXS+ZPXlGxO7LRiadeuzizwg8mG1LBI8gBR6Z3i3POCqgIpQh06TiEw9uTw1hL2
         vvzg==
X-Forwarded-Encrypted: i=1; AJvYcCWCdNbpFjDa6EsITfnxnlf4U+ifn9M3tVshDjdalahU+zNlNTT1uA+x3uel98lqFTfK5UyO7ZMTx7YC4Q==@vger.kernel.org, AJvYcCXA6fLFjWex2o835dd7I2vcXaAQKG2OUk18ugFnTgvjlObCX5LjoH1k+iyXjfHBAogzWZRSPuNf9NGI5RKS@vger.kernel.org
X-Gm-Message-State: AOJu0YzrW78FjImCiP33Cl/6yKZKeW8283Gq3p4lSMHAjorchrPuKyCd
	N6kijwxC/Et1zkdI3pnC1/h49nXNeAaND8HOdNiaA+KmAwBA8XVDOuFX
X-Gm-Gg: ASbGncsdnFMEau9xqZPqGlYa1nv8GYVNtSlb2nXPfzPzKe80xVbuat8b6ywwE/5Eta+
	krfcZaiZAavwCOJ2UrVPiyZ/Ayv0XQDfWyhtPOYvEsrr3I223bdn3r10iye+O28YNdMMa73wwBF
	4xlTbsXGTax6jwS0NklYV0zllY0g44XQlftM29nULRKs7ePTx8Jcj9bmNawRrCdx1vsHkjuee8z
	nlrE5AkD8JMxzEV/DVlBvbU1gc/c+nQR9pEKneWB5dTfeAtA0/lKLp7WZk4C4XPOUfzMToKSjZp
	sphZ8h7WjRLbaKh8dEOTfA0fMTxrIQlF6qMGqOTQrGIfPWS0vsTFnWDEDXsXrpDmb4TU1U61W+H
	0wKzw7E59jHzRtVzGnjFA88cBsF3j7hmW6Iy8iwaKRcATnA==
X-Google-Smtp-Source: AGHT+IEYdV+mC0ydH3lbVnFmw0ed+n4LOkJPkSEcQ0a1Sg0R3988YD5TK8HIbJREtBk1QNnuPg8cHA==
X-Received: by 2002:a05:6a00:399e:b0:748:f8ae:bdd7 with SMTP id d2e1a72fcca58-748f8aebec6mr2589703b3a.9.1750312584961;
        Wed, 18 Jun 2025 22:56:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748f856891bsm1011904b3a.47.2025.06.18.22.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 22:56:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <145b2916-830b-4654-84e6-3d5c356c6283@roeck-us.net>
Date: Wed, 18 Jun 2025 22:56:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [hwmon?] KMSAN: uninit-value in get_temp_cnct
To: syzbot <syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com>,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, mail@mariuszachmann.de,
 syzkaller-bugs@googlegroups.com
References: <685392a0.050a0220.216029.0168.GAE@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <685392a0.050a0220.216029.0168.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/25 21:31, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4774cfe3543a Merge tag 'scsi-fixes' of git://git.kernel.or..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10e3f10c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
> dashboard link: https://syzkaller.appspot.com/bug?extid=3bbbade4e1a7ab45ca3b
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 

It doesn't need one: The problem will be seen if the data returned from the
power supply is shorter than expected. In the example below, the problem will
be seen if less than NUM_TEMP_SENSORS+1 data bytes were received.
One possible fix would be to record the returned data length in ccp_raw_event()
and to have each caller of send_usb_cmd() check if the returned amount of data
is sufficient.

Guenter

> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/0cb38ba04f99/disk-4774cfe3.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/ff376a7ba200/vmlinux-4774cfe3.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/570051315dbf/bzImage-4774cfe3.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
> 
> usb 7-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 7-1: config 0 descriptor??
> corsair-cpro 0003:1B1C:0C10.0017: hidraw0: USB HID v4.06 Device [HID 1b1c:0c10] on usb-dummy_hcd.6-1/input0
> =====================================================
> BUG: KMSAN: uninit-value in get_temp_cnct+0x1f3/0x3b0 drivers/hwmon/corsair-cpro.c:497
>   get_temp_cnct+0x1f3/0x3b0 drivers/hwmon/corsair-cpro.c:497
>   ccp_probe+0x458/0x790 drivers/hwmon/corsair-cpro.c:622
>   __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
>   hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
>   usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
>   usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
>   usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
>   usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
>   hub_port_connect drivers/usb/core/hub.c:5535 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
>   port_event drivers/usb/core/hub.c:5835 [inline]
>   hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5917
>   process_one_work kernel/workqueue.c:3238 [inline]
>   process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
>   worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
>   kthread+0xd5c/0xf00 kernel/kthread.c:464
>   ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> Uninit was stored to memory at:
>   get_temp_cnct+0x1ec/0x3b0 drivers/hwmon/corsair-cpro.c:496
>   ccp_probe+0x458/0x790 drivers/hwmon/corsair-cpro.c:622
>   __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
>   hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
>   usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
>   usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
>   usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
>   usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
>   hub_port_connect drivers/usb/core/hub.c:5535 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
>   port_event drivers/usb/core/hub.c:5835 [inline]
>   hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5917
>   process_one_work kernel/workqueue.c:3238 [inline]
>   process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
>   worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
>   kthread+0xd5c/0xf00 kernel/kthread.c:464
>   ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> Uninit was created at:
>   slab_post_alloc_hook mm/slub.c:4154 [inline]
>   slab_alloc_node mm/slub.c:4197 [inline]
>   __do_kmalloc_node mm/slub.c:4327 [inline]
>   __kmalloc_node_track_caller_noprof+0x96d/0x12f0 mm/slub.c:4347
>   alloc_dr drivers/base/devres.c:119 [inline]
>   devm_kmalloc+0xd7/0x2f0 drivers/base/devres.c:864
>   ccp_probe+0x114/0x790 drivers/hwmon/corsair-cpro.c:596
>   __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
>   hid_device_probe+0x539/0xab0 drivers/hid/hid-core.c:2761
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   hid_add_device+0x5ed/0x7b0 drivers/hid/hid-core.c:2907
>   usbhid_probe+0x1fec/0x2660 drivers/hid/usbhid/hid-core.c:1435
>   usb_probe_interface+0xd04/0x1310 drivers/usb/core/driver.c:396
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   usb_set_configuration+0x3493/0x3b70 drivers/usb/core/message.c:2210
>   usb_generic_driver_probe+0xfc/0x290 drivers/usb/core/generic.c:250
>   usb_probe_device+0x38a/0x690 drivers/usb/core/driver.c:291
>   call_driver_probe drivers/base/dd.c:-1 [inline]
>   really_probe+0x4d4/0xd90 drivers/base/dd.c:657
>   __driver_probe_device+0x268/0x380 drivers/base/dd.c:799
>   driver_probe_device+0x70/0x8b0 drivers/base/dd.c:829
>   __device_attach_driver+0x4ee/0x950 drivers/base/dd.c:957
>   bus_for_each_drv+0x3e0/0x680 drivers/base/bus.c:462
>   __device_attach+0x3c8/0x5c0 drivers/base/dd.c:1029
>   device_initial_probe+0x33/0x40 drivers/base/dd.c:1078
>   bus_probe_device+0x3ba/0x5e0 drivers/base/bus.c:537
>   device_add+0x12a9/0x1c10 drivers/base/core.c:3692
>   usb_new_device+0x104b/0x20c0 drivers/usb/core/hub.c:2663
>   hub_port_connect drivers/usb/core/hub.c:5535 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
>   port_event drivers/usb/core/hub.c:5835 [inline]
>   hub_event+0x5588/0x7580 drivers/usb/core/hub.c:5917
>   process_one_work kernel/workqueue.c:3238 [inline]
>   process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
>   worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
>   kthread+0xd5c/0xf00 kernel/kthread.c:464
>   ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> CPU: 0 UID: 0 PID: 5855 Comm: kworker/0:3 Not tainted 6.16.0-rc1-syzkaller-00203-g4774cfe3543a #0 PREEMPT(undef)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Workqueue: usb_hub_wq hub_event
> =====================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

