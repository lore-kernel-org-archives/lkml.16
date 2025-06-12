Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C021D90C8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749762605; cv=none; b=BgjEVt95mkBF/Ap9+9dPZy2YrdPLSCGs8L0TdvrPSMOV8l5OYRglWlqoGeYyQi/GDFvIdevqeRbv87ctDusopHSrzz/fy47L1yUg24QBwMFzPzg1ePFuQ9LUqNrHHjNMI9YtMtfVWxnBQ9PC1zq0Yup6fRRsjF/y+FQ+eZRItWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749762605; c=relaxed/simple;
	bh=vxuvJTjNZqMB2tsW+Gf45ICIGKCz2E/kBypfMf8Tk/0=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=RzfwXw4liL5Ct4FvNccrM64qu7k919Y2WZHJyk2JPzkjawc+48+7oSK9bbt4hYha59Cmc3AL/vixWLVbSUEgd5weZ6p1UPTDvI9TzOqFhXTtj0QKeGn47q7oa+PMq2yLK+Vb6IUrHcVMU7e7I0VdnHX2TBrPO09iTwD9K7VnsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=g7REbKfF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="g7REbKfF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-236377f00a1so14129445ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749762603; x=1750367403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PexcpAOOtkiKpS0ImSN7hb8qJkrQBZztkR4qfhcbAPg=;
        b=g7REbKfF+msloaZ+zCwP8+nQ/ttT+zv9+6Ms6Yt4gcY3oZ0IA7XQvwdhQ7rgx3XFVN
         T0DK1ZoSaJcC889H7Tn2HNcF3mRlTjRPDsJbtTBWlkkEgD0cB3faWblGrRQgNVPeb4eM
         XRRb42ZRA3WNuv2Cypflk89nQj06kgnIiG/P6iu2bWVnrBULz5W6vukunCcOiFy+8QXw
         nqx6L0oB49LhCRZvjZvmZlQQiba/HvbBFmsk5OMGg/6eMx/Qa6iXN7vSzxh+4oOk1r9s
         UG/RICKbGih0J6cGmyetab/culDYmigWT0koJ+GmCMrvWwc4XRrtoQKtoVoxA6m1iFV3
         I+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749762603; x=1750367403;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PexcpAOOtkiKpS0ImSN7hb8qJkrQBZztkR4qfhcbAPg=;
        b=M8JziBKERMAzIbOJgUIzzVsm1kUdiBlwgWX2xNjg+OzjTIouT2toP1RRrMPzgUGjSA
         sGoVkVEbqVQBytBB4V4h4nAjaSSwIrm+OTfKl910PI+eR0z5EHvvZl966E2a1BUKson9
         00t2OW7U5fYY7zvZOl6o3YteimLYe3ZOksZrp4yyVcTL0SQLHGqwykkqFXcEQ0w8H/HP
         qBNPBuEa50SM0BX/2x7VK9ofe3dcwoaXivCpsWQJEXnj6Z1g4XGbX0An3DECoFSo2JYW
         rssCUZ73PAOKzS5eyuBOzHCM/T9XPnAYnPoBAVixSHCGj+3LYcTsC3GGjPsV/h2q4BCG
         r8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/RXRVi/S8WKAN1/JnltIiPis1N1GPko/HBOWHwkVSCQKqEGehrGp90mANGQL9cDK3RnNZjx3JnNUQxj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YygM1zzeYxB8frfLwXIt8H00/CELxDBgYNkSkAbXqXJnx3DOCe1
	di16kPbNwreOm021dVLXaTIGLYr9pFXAK3cHCSgZ4ZTzOr4g1spbXGdA+MhbRc6ntkg=
X-Gm-Gg: ASbGncsL+l24fTeDKqY9njm6M8QvbY/1maj6r0VTs7KwSFaI3U1NjeDnmDKtMAFywNo
	P1Q0M3FGtUW2ZleuIIjJ005KlBuxVE6G6QoOWdlLhzyoP2bvmdmUQPNvWbpANwgSHDhI16HyNTp
	8/PMTVAYdmMyn07ScF+h46IOYBJOc6yqVGZTDOmPsbBik0+DrsPKYLHqC0drEHRR0qHiCiINFSu
	lD0vDzqLoyRnPy8cTM71Ql0VqyQWV7ZFO7L+AYapCu1N1j83OxdlY6Ah49fLxA8lE10vX1eKZ/g
	lnH7D8RA40MHOSghe6e0Aocq7PdnoSaNFlPOG+jezMHSX5BOhJqfWm0ryUkjLIVxMZ1DxO0=
X-Google-Smtp-Source: AGHT+IGL4tPRfvomS0QOENtAAhRSPdcbA0I2fW+JHeZhytSPqTuXvc5dEq7vCmd0bf7++ELPpHr/nQ==
X-Received: by 2002:a17:902:ce87:b0:231:9902:1519 with SMTP id d9443c01a7336-2365dc2fde1mr7281095ad.39.1749762602989;
        Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365decb5f9sm1602845ad.194.2025.06.12.14.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 14:09:58 PDT (-0700)
Subject:     Re: [PATCH] drm/amd/pm: Avoid more large frame warnings
In-Reply-To: <c3cc254a-4018-49e1-bb6e-25b245d62f4e@amd.com>
CC: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com,
  airlied@gmail.com, simona@ffwll.ch, asad.kamal@amd.com, amd-gfx@lists.freedesktop.org,
  dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lijo.lazar@amd.com
Message-ID: <mhng-9A9FE10C-6479-4B2F-8FE0-2467BB76681E@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 05:29:55 PDT (-0700), lijo.lazar@amd.com wrote:
>
>
> On 6/11/2025 10:30 AM, Lazar, Lijo wrote:
>>
>>
>> On 6/11/2025 2:51 AM, Palmer Dabbelt wrote:
>>> From: Palmer Dabbelt <palmer@dabbelt.com>
>>>
>>> 9KiB frames seem pretty big, but without this I'm getting some warnings
>>> as of 6.16-rc1
>>>
>>>       CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
>>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_get_gpu_metrics':
>>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:2885:1: error: the frame size of 8304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>>>      2885 | }
>>>           | ^
>>>     cc1: all warnings being treated as errors
>>>
>>
>> Could you also provide your build environment details?
>>
>> With below in Makefile + gcc 11.4.0, stack frame size is 168 bytes.

I'm on GCC 12 on RISC-V (though looks like it showed up somewhere else, 
too).

>>
>> ccflags-y += -fstack-usage
>>
>> smu_v13_0_6_ppt.c:2667:16:smu_v13_0_6_get_gpu_metrics   168     static
>>
>> Thanks,
>> Lijo
>>
>
> Was able to see this issue in one of our systems. This patch fixed that
> -  https://patchwork.freedesktop.org/patch/658216/
>
> Please try and let me know if it works for your config.

Thanks, I just threw it at the tester.  I'll go post a Reviewed-by at 
https://lore.kernel.org/all/20250612122321.801690-1-lijo.lazar@amd.com/ 
if it works...

>
> Thanks,
> Lijo
>
>>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>>> ---
>>>  drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> index 51f1fa9789ab..9824b7f4827f 100644
>>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> @@ -23,9 +23,19 @@
>>>  # Makefile for the 'smu manager' sub-component of powerplay.
>>>  # It provides the smu management services for the driver.
>>>
>>> +ifneq ($(CONFIG_FRAME_WARN),0)
>>> +    frame_warn_limit := 9216
>>> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
>>> +        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
>>> +    endif
>>> +endif
>>> +
>>>  SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
>>>  	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o smu_v13_0_6_ppt.o smu_v13_0_12_ppt.o
>>>
>>>  AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
>>>
>>>  AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
>>> +
>>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_12_ppt.o := $(frame_warn_flag)
>>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_6_ppt.o := $(frame_warn_flag)
>>
