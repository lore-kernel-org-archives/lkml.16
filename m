Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9E62AC17
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744234915; cv=none; b=TNdLzFZY2kQQf6EQqlJd5LZmqdxEuHviyHymNVKiYPk88ZE4Vrq0BUZ4S48vkM01ui/F39zTYeIJejgTUXRpdBQc0c14XxvESkEU19XudFiVsI+sbuujx7Z1PTEvfyo3/2AQ6OH6uVLcubaGk0Tx/KWXyIR56fJRmRoZVKvYFBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744234915; c=relaxed/simple;
	bh=vDepLo67fCgM7EaoQDf0lNDhGaiPl4ZU8kLeOKG5zzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwkaq60L3NslPDap82Rw8huDwRjysAKrTT0CieL3gFlZssEkhOLuD2Ujf3DrBMpmADD9k7n0dmo2n8f5ic+p8n2bi11lnm/CoAOVxstntkpUZQHBK4r4nw4SKkf30r+bSnX0W9C21AwVM9BJhab9yPCNRHHylzg63UkWOvMxKlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h1wddYgi; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h1wddYgi"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86117e5adb3so7334639f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744234912; x=1744839712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNvoT2pNA5tulehhl/Q180fpctljW6A4B1umhnN+kMk=;
        b=h1wddYgipJYOxOB9VK/2BnT3DA7hwBQd3DgC6J1+X/1yDosWrBS6tJXHGQPY1NaNem
         HDxGwE61AJbeo7t+qrwMJmfH5gSkCKW9pcsiTGnqgsGwXbzyP9CUQnEghPwChgW8qYT/
         cQ5GsjGMh5SgbZCVPLE9ixQOBdjvvCBuqVi5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744234912; x=1744839712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNvoT2pNA5tulehhl/Q180fpctljW6A4B1umhnN+kMk=;
        b=eKf0XlvmAjH4Hlln+LCoygYSAJeeNKpCgNv6R7t3MVAmfutyND+gkfyRjFmWlPShSK
         sxELR0zGaa+B3xDTwPhcJRazW/YAk5KwRHmKau3qlOh8gCGrcebWn9ZHnkQFErDpbZpF
         wr7CX01kVz5qu9yBKzUn1Uqq7hd4VEQ6N4Y9Lq3xou8WN/6ZLFsee+ytcpzILQo/+mDH
         CL+VGRrhqOoTdHvsO694jIPlUDV2wiaQhSIzmpXmEb4ToZr2TNKDOf0EbW4Uik18uG4Q
         jRyLtzp5Pjt/tHq5qoz3l1ejv6MKda4zeiq8kHLiSU4MjDwOT7oqdC5/S53RyXB3OeKB
         iqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1rLdoqUp0Y15YsiCYmyd8L67W7pZsvo4IBoxOpreqRFlRYBYqmBQYUuMdlcQZ41UkYf061CaRu7d05E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAk0WpeLy21hwyIiFviHcnpDqkwpGqq7juC/v3Sg3sc2xCk82S
	MKZS6iSEwGswxiUPOvJnHQziOcz0wEg11VYue8wQkk8ghpaoxN5lAmSza/D8c5hj/t+QUnpMlsB
	0
X-Gm-Gg: ASbGncuC5yVwOj0vCDlwRdkjQNMOJZTyWbtLsaPeUbGxIEwqtTril5NG4T/OepPzFUn
	NqGKpwuZP2vX4VXzzT32DAYMRXsaiqNFzNBLtdlOFo8+/GEd53kMb6Qw6xPNHD6zzm0JD0vM8Cv
	4fQRiAF+uvRAcYcS6nhTIKExkbvrLNCzJ/+YEZxuokXbQrehqNjJ3bC5XhJ6U9Km6uvTi7QOkLk
	YXGj/HI/uzHz0HHOa1CXYLA00tfGVmFm0FrmHI90Zl9+PlZzXbYfs3xPe5Yr6yK+UZprGrCEFCy
	jgof/OChMvJwh+0+C/gbX2Ik/67SrKzL7K17rwCOI2SF7luXZn8=
X-Google-Smtp-Source: AGHT+IELr4jfqHRtQxojFHm3kKSCMKpeGx1hcvh2nll8x0kQyYQAO1c2FpamK66P0wipeOw1sZrzFQ==
X-Received: by 2002:a05:6e02:160a:b0:3d4:3a45:d889 with SMTP id e9e14a558f8ab-3d7e475e4a2mr6989965ab.14.1744234912262;
        Wed, 09 Apr 2025 14:41:52 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505dfd731sm431971173.88.2025.04.09.14.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 14:41:51 -0700 (PDT)
Message-ID: <e0842dd0-71d3-4de0-a2ee-e83493df890b@linuxfoundation.org>
Date: Wed, 9 Apr 2025 15:41:51 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/Kconfig: Fix dependency for X86_DEBUG_FPU
To: Ingo Molnar <mingo@kernel.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, hpa@zytor.com
References: <20250407231057.328010-1-skhan@linuxfoundation.org>
 <Z_TIMh7UsWQiSkqg@gmail.com>
 <f9642a9f-27d4-4f84-818c-390194b898bf@linuxfoundation.org>
 <Z_bnzs3IPyhVIYaT@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Z_bnzs3IPyhVIYaT@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 15:34, Ingo Molnar wrote:
> 
> * Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> On 4/8/25 00:54, Ingo Molnar wrote:
>>>
>>> * Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>>> Compile fails when X86_DEBUG_FPU is enabled and X86_REQUIRED_FEATURE_FPU is
>>>> disabled. Add explicit dependency on X86_REQUIRED_FEATURE_FPU to fix it.
>>>>
>>>> ../arch/x86/kernel/fpu/regset.c:411:(.text+0x4cf2f): undefined reference to `fpregs_soft_get'
>>>> ld: vmlinux.o: in function `fpregs_set':
>>>> ../arch/x86/kernel/fpu/regset.c:445:(.text+0x4d0da): undefined reference to `fpregs_soft_set'
>>>> ld: vmlinux.o: in function `copy_fpstate_to_sigframe':
>>>> ../arch/x86/kernel/fpu/signal.c:197:(.text+0x4da98): undefined reference to `fpregs_soft_get'
>>>>
>>>
>>> So I cannot reproduce this build failure on either v6.14 or v6.15-rc1:
>>>
>>>     starship:~/tip> git describe
>>>     v6.15-rc1
>>>
>>>     starship:~/tip> grep -E 'X86_32=|M486SX=|X86_REQUIRED_FEATURE|X86_DEBUG_FPU' .config
>>>     CONFIG_X86_32=y
>>>     CONFIG_M486SX=y
>>>     CONFIG_X86_REQUIRED_FEATURE_ALWAYS=y
>>>     CONFIG_X86_DEBUG_FPU=y
>>>
>>>     starship:~/tip> make -j128 ARCH=i386 bzImage modules
>>>
>>>     ...
>>>     Kernel: arch/x86/boot/bzImage is ready  (#5)
>>>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>> ---
>>>> 6.14 compile worked without X86_REQUIRED_FEATURE_FPU enabled. Might be a
>>>> new dependency. Enabling X86_REQUIRED_FEATURE_FPU fixed it for me on my
>>>> test system.

Right. That is what I meant by new dependency

>>>
>>> So vanilla v6.14 does not have X86_REQUIRED_FEATURE Kconfig flags, at
>>> all:
>>>
>>>     starship:~/tip> grep FPU .config
>>>     CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>>     CONFIG_X86_DEBUG_FPU=y
>>>     # CONFIG_TEST_FPU is not set
>>>
>>> Because X86_REQUIRED_FEATURE_FPU is a new v6.15-rc1 feature, introduced
>>> via:
>>>
>>>     3d37d9396eb3 ("x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs")
>>>
>>> I have no doubt you are seeing this build failure - but I think there
>>> might be some other .config detail required to reproduce it, not
>>> mentioned in your changelog. Could you please send the config you used?
>>>
>>
>> Config attached.
>>
>> grep _FPU /boot/config-6.14.0+
>> CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>> CONFIG_X86_DEBUG_FPU=y
>> # CONFIG_TEST_FPU is not set
>>
>> I noticed you are building ARCH=i386 - can you reproduce this
>> with x86_64? That is what I am building.
>>
>> thanks,
>> -- Shuah
> 
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86 6.14.0 Kernel Configuration
>> #
>> CONFIG_CC_VERSION_TEXT="gcc (Debian 14.2.0-17) 14.2.0"
> 
> Is this a vanilla v6.14 kernel? Because on upstream v6.14 'make
> oldconfig' gives me:
> 
>    Generate BTF type information (DEBUG_INFO_BTF) [N/y/?] (NEW)
> 
> Maybe different build environment?
> 
> ... and after answering that with 'N' the build succeeds:
> 
>    LD      arch/x86/boot/setup.elf
>    OBJCOPY arch/x86/boot/setup.bin
>    BUILD   arch/x86/boot/bzImage
> Kernel: arch/x86/boot/bzImage is ready  (#3)

Yes it is vanilla

> 
> More importantly, X86_REQUIRED_FEATURE_FPU *does not exist* in the
> vanilla v6.14 kernel, it's a new v6.15 feature. So this part of your
> changelog totally doesn't apply to a v6.14 kernel:

I started with vanilla 6.14 kernel running oldconfig on it.
In this case if X86_DEBUG_FPU is enabled in the oldconfig,
should the config generated for 6.15 add X86_REQUIRED_FEATURE_FPU.

It appears there is a dependency between X86_DEBUG_FPU and
the newly added X86_REQUIRED_FEATURE_FPU

thanks,
-- Shuah
