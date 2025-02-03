Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C34320A5C2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598326; cv=none; b=QrjzmBglUzTjBRueV6a4K4aur6xuwAyvaU0pfAl2GwruQSCW842bB8dJdUSb26tcjGGEXZCAL9dUYwbKqETzTPGfDJqgU7lR62xZG5wmBRE7GQ6QM3zkXUiuV4as4zYLfDAnEVETe+63XV9jUnuvtd9ixD7ryC3vhw27NtuaxdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598326; c=relaxed/simple;
	bh=HaqSRVIjYecNiCeUI80LtyiV/KB2arNBCPJKjiB4ngI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=jj49AWc7HMMLF5u92CF8l4YsjwEvy+MLzzZ3LyOLM0fMsKPRJxyaG81ybtXpBDPi6Xdnx8yMmjTi0X+7i+cOSl+KBisUP4Xj7bZ5/ofTQaXvUXl2ypgaFgH9bscKRd3ShHSbVSwz4AVGou+rq9nu3/D/Dv3r5ijzawykSborp5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apevzner.com; spf=pass smtp.mailfrom=apevzner.com; dkim=pass (2048-bit key) header.d=apevzner.com header.i=@apevzner.com header.b=LxIs+5Go; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apevzner.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apevzner.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apevzner.com header.i=@apevzner.com header.b="LxIs+5Go"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307bc125e2eso12286681fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=apevzner.com; s=google; t=1738598321; x=1739203121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVwfvvt8sGDIx88933QOte4EitOaJG4KEZQc/GBV0TM=;
        b=LxIs+5GoFTEmhH51fRtWmO0arBsL5XqFsFe4w8Y6NldEF6ptfcTJfa7o+X6lAw7R9D
         T0ZdBT0ix08yC9aWMwpMbicqFJ7kjPMAY82XSoipj3J/X6ra9bOl4yEs1so8na9GtzRK
         ZnQPJC2sBpDmbaMoaBLyL9wLH81oXUQxljH0hrTjSa8GzN8/FP3a7q1Sn2EQ7F4e1jWa
         rh3lg2VFYGZr6ClECF2DSJbtALuV7xKQ5+UJSufcmjxpwa8N+ifb46zocfEiq8PnLjPj
         IZ2tgqo7mf0asN1188bjIIRTLPnBuFphLGAol12p2Emat/oixyIhnEsBhYYtmcXGbSTb
         uEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598321; x=1739203121;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVwfvvt8sGDIx88933QOte4EitOaJG4KEZQc/GBV0TM=;
        b=teUaBU945u/DfpcBHhMJJg372I7W7o7osq8rTotd5S4/XPTcMAvgTDHizGT/ji2buX
         VCCyzyYtY9MmJ8i4KdgO/QKeadTLPUWG15PDJ3yzt0EDNdCCWRvlRuAgNlJN/vDVfINL
         SQYFnABPWjpsKI1rtv4kzkZCKT0cy6CccAoYa8ABZUfPCip+ruwrF9O3VOPy5RL2u7ep
         glpVezr5gwbXiVJHk6vMcXWZ1XDzX0fwlzpFGgGYZom+EbYLI8iapdOglTkKdZfem3Rq
         CLxhi83EUoOoSjCGvRNe7yZDqI2ngzconu7EjOlPb8AiT122lCuQp+0eMUNzdJdwbXXj
         WR2g==
X-Forwarded-Encrypted: i=1; AJvYcCVrWd3NrvFKD0gKaIZ+S6eXGBrmjwlMYperH+oj/SbK/hqSsSsn69VqZCIpNSg5c4FAIq3dY8nSe8Elfq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO5LXHcMm1eBqtXJiHnitVfFCMwAJ6CsrF/m/Wdbtn761ANzDk
	ISmR5doOPMnk0iv1l57evHSUV+QdEuZ7KoBZ9iSC9G0FF16TQ5y4H7Gsg/kQ9r0=
X-Gm-Gg: ASbGncugEICRb+UulHtkRkxrrcPJIAm6msJS/Ro8l65spifRYk9YYk+CfCfOJCg4n2A
	lWhSLWdF0MOsyRkA0rTmuQqLklzxk2+L2i0UH64y9dBn5pbCTtM0MFGogQRExhDFZrK1W/lPi8z
	vGXhgVSeEM2Izo1zgHLL6Fnmdk4pYWXFz/K86dtC/Mr1cBzOp1eVk/4Fg48nqnLfffYc2atxmIK
	7q1heNYed8M8WrI2cQq/gHfgiceRs6PRCU0HKIFUnfGpDbJsLYeWYFoFuSX9A9nJnjXeZ7m/4Bi
	2ER9ltf3cvqo0Z6zrElheyxPwdbZFEg6DwMWgTgqZi4JNh7VUVY=
X-Google-Smtp-Source: AGHT+IHXcrt8a+4+lWw5j7onoSpd8/q5z886NRH+OyrBNPHtma2d3YKVsnSdoKZTB3IKf2QKnQ7k9A==
X-Received: by 2002:a05:651c:1990:b0:300:33b1:f0e2 with SMTP id 38308e7fff4ca-307968b9135mr64018451fa.3.1738598320882;
        Mon, 03 Feb 2025 07:58:40 -0800 (PST)
Received: from [192.168.0.6] (ppp85-141-194-172.pppoe.mtu-net.ru. [85.141.194.172])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-307a3088d24sm15155041fa.40.2025.02.03.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 07:58:39 -0800 (PST)
Message-ID: <c56af12c-8964-4a76-bc6d-3e520e14a3c0@apevzner.com>
Date: Mon, 3 Feb 2025 18:58:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
From: Alexander Pevzner <pzz@apevzner.com>
Subject: On 6.12.x kernels I2C dies on the Intel i5-1235U CPU based notebook
 (KVADRA NAU LE14U)
Cc: temaps@gmail.com, m.novosyolov@rosa.ru, a.sudakov@rosa.ru
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

On the KVADRA NAU LE14U notebook, the I2C subsystem stops functioning 
after a period of inactivity (10-30 minutes).

The notebook is equipped with an Intel i5-1235U CPU, four Intel 
Corporation Alder Lake PCH Serial IO I2C controllers, and a SYNA3602 
touchpad connected via the I2C serial bus.

After some idle time, the following lines appear in the kernel log:

-----
RSP: 0018:ffffa7d5001b7e80 EFLAGS: 00000246
RAX: ffff93ab5f700000 RBX: ffff93ab5f761738 RCX: 000000000000001f
RDX: 0000000000000002 RSI: 0000000033483483 RDI: 0000000000000000
RBP: 0000000000000001 R08: 000004c7d586da52 R09: 0000000000000007
R10: 000000000000002a R11: ffff93ab5f744f04 R12: ffffffffb964fe60
R13: 000004c7d586da52 R14: 0000000000000001 R15: 0000000000000000
  cpuidle_enter+0x2d/0x40
  do_idle+0x1ad/0x210
  cpu_startup_entry+0x29/0x30
  start_secondary+0x11e/0x140
  common_startup_64+0x13e/0x141
  </TASK>
handlers:
[<00000000fa02aea8>] idma64_irq [idma64]
[<00000000d22a6968>] i2c_dw_isr
Disabling IRQ #27
-----

After this, the touchpad connected via I2C stops working.

This issue occurs on ROSA Linux with kernel version 6.12.10 and Fedora 
41 with kernel version 6.12.11, but it does not occur on Fedora with 
kernel version 6.11.4.

According to the following discussion, it also reproduces on Arch Linux 
with kernel version 6.12.8:

https://bbs.archlinux.org/viewtopic.php?id=302348

Although the notebook branding mentioned in that discussion is different 
(MONSTER HUMA H4 V5.2), the hardware configuration appears to be similar.

It seems that the problem is not specific to any particular distribution 
and is related to the 6.12.* versions of the kernel.

We also have a simple workaround module that resolves the issue by 
installing a shared interrupt handler for all IRQs owned by I2C. This 
handler does nothing but return IRQ_HANDLED, effectively preventing the 
kernel from disabling this interrupt as spurious.

The source code for this module is available here:

https://github.com/alexpevzner/hotfix-kvadra-touchpad

When this module is loaded, the notebook operates very stably; the I2C 
(touchpad) functions reliably, and the interrupt rate appears reasonable 
(around 400 interrupts per second when the touchpad is active).

-- 

	Wishes, Alexander Pevzner (pzz@apevzner.com)

