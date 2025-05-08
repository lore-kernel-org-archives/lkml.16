Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9B52147F5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725978; cv=none; b=BhW2W5dr5s1qqdVOYF10nD5znlRoQ9BwzWzs5LmZoRRTAtaUtRYevLg8l9kEf9RFzuFC9BDViqERIsRJo+7beMXPhYRrUJM5Dpqd13Y1NVrCXP0UNY5ebzRl9TuPtyyV/II7EqBlJMIindtOeDpslmV0bnp+8j3iP7QwJAFPsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725978; c=relaxed/simple;
	bh=mjZDxInIt5/yOXLinpjaio+JMeN50GgToV9RTZA81sk=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=UtcuCPWz9rBGgq1vgd5PM56EPmFbGNxRFphoO2TuSMIWDS3UDJvYu1wgtsqb/CL3EEC/3Fylwbv+OOx5KHx7ho4ObwKULROySJ6+LNQKXT9bNWqTr7E9c3htPZTIySyL6pM9tOQjCA4YPSBFe0C9gEnMzqJZcNCom+qB3LxrFEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=WbIENq0P; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="WbIENq0P"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e7e5bce38so14758325ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746725976; x=1747330776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Q2vg1BTSM42eTHo3pl1hZh9V4Pj/emdMlH/CKlkCHs=;
        b=WbIENq0PfVm0C4dAXl6OD4C9a7PKZyzBuEiMB2ldBN5Zp5Mm/akyV9EESK7QDjBtqD
         6K9hnOPnsbx0up1+uoaPdtiHanoqrbUiLHVxSjLLA3WWTcwToks+DrMQXWQad8eGe5Jd
         zdCVnFGGi9Y7m5R5Hd73NzM4FVVfOKag08RUuzhyyowF+dl49HJ1ZUpVUpsdrL784kQ0
         Aj3qUbMGGiOeGhPLUMlI0sGtQjlSRu7Nvs0JGCC4ArGHhAli9XGNhZRQqniAlkdwuqY/
         /yuJ0XFXTXzS9HCdPO8db6FumfgnqkFcWw2urhqmA3aL3z5n+VeWr3bSckSwnAKg4yRF
         p8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725976; x=1747330776;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Q2vg1BTSM42eTHo3pl1hZh9V4Pj/emdMlH/CKlkCHs=;
        b=jRJUa67gxx21v6/Qptr6js4Av2XEKGmjoxVpWNxDvrqQSi7Z/UA8Saztbk6qhB57mM
         QA+VRhFhX5X6XcX1I8lcufQqaqa9qY140jkILTi2pfWiBNtfh8KdIUkaHwHSRMurAS6t
         NZ786nZgqAYs8DoM2VbwavvSelPqWR34PBZWvf6IWUvaT7DhiLyiBvF/yMcIgJslYSYB
         e4eu3apMpe479caYgxRzywm4+empg/uafiu8EyYfUgOyLFVtfyNbW6ALFVEIW+2iMKB5
         MT13Xo5ObfnXG36pmKEPZpkudmq3MDFEsrpaAorftl73d7bnD7LWbWoOLmBVOK7G4JrO
         pY8w==
X-Forwarded-Encrypted: i=1; AJvYcCU5IXeZngPdNGVe66IfGH2R8veIE2pxMavQoU5l7Fy9Km/yt8mwqQBbBg+NmLeE/oc2xhFtFOR6/DnseuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDzep/VSkfQ7AeztVC5wiuT9KerEeiHdPnEM4ZtLYsynilv3J
	GjBuGNUdh56fyry4/Vwpl/rM4UCrEo3zu8XpMX+QLbdNXU7+wzoOSwaDAYNfI1o=
X-Gm-Gg: ASbGnct4jp/NKnjwKAQbvCcsSUQyTC8VeHc956fkTckgWbRUkvq/AprXOTVQ+o/8WTZ
	jGNACzzWk4QjvBMhlD4W6WsmXak+fqo1Xj4hAleMOnjH6ZbWnyY4RnQZSoDSVgBPjqozoBT+xnk
	V2RJf0Y+/wSEN7sa7tg2VSepxh0csBoWKp7T836gRtqoiwwNJDeTcCDNdpymWtqC7+Re35gZx9A
	10kfuBZkN0zjLLGz0rAIe+ORYRR/N7CAh5OfHOBwfbaLyRJr576S9qUNqQmuycKbGKoqYY51Ll2
	Z/CR2P8H0vwo2CcrIUX3uxwkw4AhvH2B2g==
X-Google-Smtp-Source: AGHT+IEmGJ9YfFR3Eyhf15Bqfj3jceFTb5e0DgSI0Pb7USDVv/AkviW/WYTgDJ7svFwBHzKizS+WBw==
X-Received: by 2002:a17:902:e949:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22fc8e99d25mr3358715ad.40.1746725976096;
        Thu, 08 May 2025 10:39:36 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82745efsm1971375ad.134.2025.05.08.10.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:39:35 -0700 (PDT)
Date: Thu, 08 May 2025 10:39:35 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:39:33 PDT (-0700)
Subject:     Re: [PATCH] riscv: enable mseal sysmap for RV64
In-Reply-To: <5e7f2acd-2eef-4e69-9c11-ba8d1ec0bbc5@lucifer.local>
CC: jeffxu@chromium.org, jszhang@kernel.org, akpm@linux-foundation.org,
  Liam.Howlett@oracle.com, kees@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-mm@kvack.org, linux-hardening@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lorenzo.stoakes@oracle.com
Message-ID: <mhng-db41d38d-d3ec-4515-99f9-7368c82d46ca@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 07 May 2025 09:22:09 PDT (-0700), lorenzo.stoakes@oracle.com wrote:
> On Wed, May 07, 2025 at 09:18:31AM -0700, Jeff Xu wrote:
>> Hi Jisheng
>>
>> It seems mm maintainers might prefer arch change reviewed by arch
>> maintainer and goes to arch tree, according to discussion in [1], I
>> don't have an opinion on this,  adding mm maintainers as FYI.
>
> Thanks Jeff, appreciate the ping!
>
> Jisheng - the main point here is to ensure that the arch doesn't rely in any way
> on, within the arch code itself, relocating any of these mappings. It's pretty
> easy to eyeball it and get a sense.
>
> Because if this is the case, the arch will be broken by this change should a
> user enable it, and obviously we'd rather avoid that! :)
>
> It's really likely that you're fine, as it'd be unusual for an arch to do this,
> but I strongly suggest you do so.
>
> And yes, I think these should really go through arch trees as explicitly arch
> code.
>
> Thanks, Lorenzo
>
>>
>> On Sat, Apr 26, 2025 at 7:16 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>> >
>> > Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS for RV64, covering the
>> > vdso, vvar.
>> >
>> > Passed sysmap_is_sealed and mseal_test self tests.
>> > Passed booting a buildroot rootfs image and a cli debian rootfs image.
>> >
>> mm maintainers like to get confirmation that the arch doesn't rely on
>> remapping the VDSO, VVAR, or any other special mappings, see
>> discussion in [2]

Do you have some description of what remapping is disallowed here?  
There's not a ton in that referenced thread.

We play a few tricks with remapping, including some aliasing to handle 
different VA widths and text patching (via poke pages).  IIRC those are 
similar in spirit to what's going on in x86/arm64 land, though sometimes 
the exact flavor of the trick matters.  If you've got something I can 
look at it might save me from having to read though the mm code...

and ya, we'll pick it up through the arch tree once one of us can be 
convinced this works ;)

>>
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > Cc: Jeff Xu <jeffxu@chromium.org>
>> > ---
>> >  arch/riscv/Kconfig       | 1 +
>> >  arch/riscv/kernel/vdso.c | 2 +-
>> >  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> Please consider updating document as part of your patch:
>> features/core/mseal_sys_mappings/arch-support.txt
>> Documentation/userspace-api/mseal.rst
>>
>> Sample change in [3]
>>
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index bbec87b79309..3cb0b05eef62 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -70,6 +70,7 @@ config RISCV
>> >         # LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
>> >         select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
>> >         select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
>> > +       select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
>> The "if 64BIT && MMU" are not needed here.
>>
>> MMU is not checked by MSEAL_SYSTEM_MAPPINGS, which we should,  this
>> can go to security/Kconfig separately. If you'd like, please submit a
>> fix to mm tree directly.
>>
>> [1] https://lore.kernel.org/all/7EB087B72C4FBDD3+20250417132410.404043-1-wangyuli@uniontech.com/,
>> [2] https://lore.kernel.org/all/3de559d6-be19-44bc-ba8f-4c52d4bca684@lucifer.local/
>> [3] https://lore.kernel.org/all/648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com/
>>
>> Thanks
>> -Jeff
>>
>> >         select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
>> >         select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
>> >         select ARCH_SUPPORTS_RT
>> > diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
>> > index cc2895d1fbc2..3a8e038b10a2 100644
>> > --- a/arch/riscv/kernel/vdso.c
>> > +++ b/arch/riscv/kernel/vdso.c
>> > @@ -136,7 +136,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
>> >
>> >         ret =
>> >            _install_special_mapping(mm, vdso_base, vdso_text_len,
>> > -               (VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
>> > +               (VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC | VM_SEALED_SYSMAP),
>> >                 vdso_info->cm);
>> >
>> >         if (IS_ERR(ret))
>> > --
>> > 2.47.2
>> >
