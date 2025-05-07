Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5881C84CD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653926; cv=none; b=KktmjbX3tZdlnAOyeEuyZp9S2AZKfGczsjFiB5I+i2j31+JjZFdmRnq2L1yk7N0ht85UZYXFvCkZhK4b34cPNXRecqzVqdKCTn1zFtt8c8gs32XeoZ/MSo4lA5scfiA5aE0uiC1eyeWjkDn5p6xrSy0fmFyZuijmls96hDRXXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653926; c=relaxed/simple;
	bh=1IKQ9X1IIEl0i1h8LnluHWj7StK+W1GVT+t1yHog8jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E61WRcz7Rlv4joVMelBv/XFOT1HBj5YI+wh2zW8w5+pSP9XQe4ARpFE27FH/hDn7UuUBrG2QT8VvJsKJ0Z6Wko/rPP7mDqbtnUiKU9tj2sBmHpBUoaJ30E9YC3R7rQl9dy4vkXNvnqs3FoxeJgLLWhsUYw2jA2ZfniFSO98YyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HFp2dj0N; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HFp2dj0N"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d57143ee39so2159095ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746653923; x=1747258723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZifjbgrrxCfL++2FfK3suLq/IdOp0kek7L8OM2I2Lcs=;
        b=HFp2dj0NUJ5yJXIYPRSUeW730lQMAJe/Gjb6epJF2AvbO00jnHOYAz/Vl7lzb3e5ub
         YTOQ4ugFyWRZsy0Xtv+BU0SYGOCbS/if2cl9XkADTaTA00WC4UnY1YQJ3baLOZp27v0C
         1oyDXNI7s6Ksvq1p5Ra07p63nItNqsRE3aCms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746653923; x=1747258723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZifjbgrrxCfL++2FfK3suLq/IdOp0kek7L8OM2I2Lcs=;
        b=PaVD+XBObz3hEqs3RafbEXyWHUwiEzoD0+Gu0PNPC6QJz9pnhGp4b0J/2o3NRDQP7M
         /sxM1iONPJjpSiaO3PQq4Oo+xWJZ6k0dzLtplMXBNP2ujGkGcUAH6LsLWRRNynM9WWAP
         1GNHcAet7ih6I6IMViV+t94zSzqktmiF92ns80e1WWuHLf6uJKweYZ/wfrG2lrOLOcrA
         jpo+TaMoZohVWELvskEyZDBnml+u0IP7Wzqe+GBv7coII1IcssnVN/F12UgsH7S1Keid
         8uvBFwaOy2a2kExAr7FdWHyAfZrKxxBSbBjEnYuazhPUyGlLjogzwTS1FwcQ8/ANQIGG
         IlcQ==
X-Gm-Message-State: AOJu0YzsqYmKrdM7SgxhYOF1tEfYARIMI/yd82KipAabGjopuElmfNDM
	+nw7h7/SMjOck/LiUCDue+aWldlxaYYC56cbvcgwuGJPPKWCbH8ue9g85Gu2bk0=
X-Gm-Gg: ASbGnctVIraxNLnMhqEYC2li5JMfb8lYZU3C+ru5yqF6m4PELjsagJO9dMmpZD7pCoD
	6LfX3zwaKaNcn2tSdlXC4GMAs+inf289P9rWkRCJUqnMHrTKMMSK0QQR7yt4Apl16H37vYGBCBV
	MDGpeaNVqgwmCgupzYS6dj1PTRa92j143wIK+z/u1IPFSQ0Ht/HPQ/Jk+YeLHVcKJl+eqCK46Ab
	1PBgQh29y6YZRp/PXwdiLoCC+5hzUrMi81PlMBmxpNANCyJFaNMACn3bT1hLXjnVr1rkTkWdV66
	bu2wzxD6SNt+7bqvxGInAkCvxW2a4vE5fnF02fgWoQDg466cL+I=
X-Google-Smtp-Source: AGHT+IE1/slQnUZ/gp64LlLf1Xdhk9pgLlMroXdZw8hWl+UeJwbGOY4V7bGf7pYzD3fEdXviFh0QcA==
X-Received: by 2002:a05:6e02:198e:b0:3d5:deaf:b443 with SMTP id e9e14a558f8ab-3da738ed6ddmr60341025ab.3.1746653922622;
        Wed, 07 May 2025 14:38:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8dea4sm2887534173.110.2025.05.07.14.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 14:38:42 -0700 (PDT)
Message-ID: <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
Date: Wed, 7 May 2025 15:38:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as
 well
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, David Gow <davidgow@google.com>
References: <20250507074936.486648-1-masahiroy@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250507074936.486648-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 01:49, Masahiro Yamada wrote:
> Building the kernel with O= is affected by stale in-tree build artifacts.
> 
> So, if the source tree is not clean, Kbuild displays the following:
> 
>    $ make ARCH=um O=build defconfig
>    make[1]: Entering directory '/.../linux/build'
>    ***
>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>    *** in /.../linux
>    ***
>    make[2]: *** [/.../linux/Makefile:673: outputmakefile] Error 1
>    make[1]: *** [/.../linux/Makefile:248: __sub-make] Error 2
>    make[1]: Leaving directory '/.../linux/build'
>    make: *** [Makefile:248: __sub-make] Error 2
> 
> Usually, running 'make mrproper' is sufficient for cleaning the source
> tree for out-of-tree builds.
> 
> However, building UML generates build artifacts not only in arch/um/,
> but also in the SUBARCH directory (i.e., arch/x86/). If in-tree stale
> files remain under arch/x86/, Kbuild will reuse them instead of creating
> new ones under the specified build directory.
> 
> This commit makes 'make ARCH=um clean' recurse into the SUBARCH directory.
> 
> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
> Closes: https://lore.kernel.org/lkml/20250502172459.14175-1-skhan@linuxfoundation.org/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

It doesn't solve the problem. I still see arch/x86/realmode/rm/pasyms.h
after running make ARCH=um mrproper

A subsequent kunit run on x86_64 fails. make ARCH=x86_64 mrproper
will remove the headers for x86_64 properly. The patch I proposed
prompts user run mrproper on the arch in compile.h - It works now
for the case where compile.h doesn't exist. I can send that out
unless you have other ideas on how to fix this.

My workflow:

- Build kernel on x86_64 with CONFIG_AMD_MEM_ENCRYPT enabled

- Check for arch/x86/realmode/rm/pasyms.h
   ls arch/x86/realmode/rm/pasyms.h
      arch/x86/realmode/rm/pasyms.h

- make ARCH=um O=/linux/build
   
   This patch cleans the source tree, but doesn't remove
   arch/x86/realmode/rm/pasyms.h

- ls arch/x86/realmode/rm/pasyms.h
      arch/x86/realmode/rm/pasyms.h

- ./tools/testing/kunit/kunit.py run --alltests --arch x86_64
[15:26:35] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=x86_64 O=.kunit olddefconfig
[15:26:37] Building KUnit Kernel ...
Populating config with:
$ make ARCH=x86_64 O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=x86_64 O=.kunit --jobs=16
ERROR:root:ld:arch/x86/realmode/rm/realmode.lds:236: undefined symbol `sev_es_trampoline_start' referenced in expression
make[6]: *** [../arch/x86/realmode/rm/Makefile:49: arch/x86/realmode/rm/realmode.elf] Error 1
make[5]: *** [../arch/x86/realmode/Makefile:22: arch/x86/realmode/rm/realmode.bin] Error 2
make[4]: *** [../scripts/Makefile.build:461: arch/x86/realmode] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:461: arch/x86] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/linux/linux_kselftest/Makefile:2009: .] Error 2
make[1]: *** [/linux/linux_kselftest/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

thanks,
-- Shuah
