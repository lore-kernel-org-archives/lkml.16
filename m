Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B620A5C0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598375; cv=none; b=kxwGm2tWGMtzLrAaCKJC2LXxJB4IIVgZXnawqs86jz5bbdJHHHDdXuRmiA82R+efYQNOVESKRvIcpOSVMV/EfV6MJ0Tk7Dn+wd/QeN5ryUSCcQQIeXVgnQ9nPjPECjs6HUkLa+t3ICiF1Jpda5Z1bu9MF1IIbqeRtaWxrPSuqnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598375; c=relaxed/simple;
	bh=Ve82USrbfZy14MZhXBHyLd0AAbsZViBZKCZsys94s88=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=JKGvaw8PrV+h5g7suDpD2gUFHV5Y4vYf8T2tBXVuPn65weAp/FGzdjIdLvEWzu5/yveJO4vS4u5V5UqoU1YvGgrXp4+PjQK/hAQ+pcfTXTUA9892hVk5ICsvK1NwqsrzbRmvEDonIXa9SuYRrPZje3WG8cE84X3FL57tV40Ndls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=vBYmFk8F; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="vBYmFk8F"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166022c5caso70920765ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738598373; x=1739203173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5WM9ndKvA26UIZeHIPCkUlE9Zv9sxLm8VjPdFITu6k=;
        b=vBYmFk8Ff5ASF3GFoi3zwm5crgYG4akasZGXM85HB3RfDgCM60ZUwkMvzIaDqBGO6W
         8N+PHsCNS4Fcm2zWW4ET5b3gxamBOfCqCTCHrArhNYO4wjJ4SkkjaKb7M319oHo9Ntt1
         BHN98YtwTO6AyTE9G0panYtMVyBfvmgnx3gtCmnuEgZ/t2sEtwXaKPK9NNlvbt+wDMc3
         ER9+Q6mtpkjgulz5md+21x8iuyd2m9pdWv39O8KHiIyxO/GgIEHR1ZwsweXoqtK55grx
         hcvWVSTorALaP6kX8KjbWvR6SDE3ePBsBkRaOl9EY/Ti8R00KoAPnni1cOUtY6gW/9xU
         N13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598373; x=1739203173;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5WM9ndKvA26UIZeHIPCkUlE9Zv9sxLm8VjPdFITu6k=;
        b=v6leMoUaidqxeB5IjBkmEwnDEi+iE0upVRgAs6MANyBqdSMXE+QptmUpb31UNpGqIo
         Vfg35cp41YYBt3J6NbOzXHE5qt/tCTEPUuDUF/ZnRr4BR+sjilEIbYKij5f4ncqiqe1g
         Y8iOlrldZvJBbpI+bc7Xk+AlqKa6ZeSM1IoCYhvk33f9m+hZnvNSg2RKOFszfbRq+2kh
         rayOWEcyow6C2KbduvEetrrwfziwIGm9qcNhRMSYyDKZivLNGJ7QoXr3IF7u3drbPKvw
         91001YVfRECwHTHXw8qDGj81ntSxJ8GTG7m4dRPdsz/pcU+9Xq9KoJB1CXZULjSmEwza
         FOUg==
X-Forwarded-Encrypted: i=1; AJvYcCUUAUXKYiIc3GfX7ToT5c4jg+kUL+24XYMQLdNZ9MdK8Kxt/f5ukgVlVXCr3unkNfBc8/vS8Qa30QrOuso=@vger.kernel.org
X-Gm-Message-State: AOJu0YymDTWgyPswDeI71Z/jWnp5OjLyxZ6mL8eDNS7Y/tEi6zQhxCq/
	LFeqJHAveqDQSzPO47P+LbfeeP/l6FVjply4X7hhm/YP1DDcgC+zeLml+QTuBcQ=
X-Gm-Gg: ASbGnct1OKBhQJraOWTtDg3vHrziigbyXCx/hXZcXg6bVV/zb3a5mfK5n+ghCMkW1VC
	Nnyib2oxkBDsc7PiS63tjB05FrGzR1gGd/5fnUPVT+KYOeBJrpjNglcu9wS8cxXLk0ybkR3kAck
	NwOzCyl3z8LWKbBlFKa+QytVohRbD5mqYWVX7gLSJwHeAH2dNViuRiJfsIad2V4hQupVPXz0wpU
	VLnsR9HzaWMu8bIsq2Ifzikej9DGrNyCUBu88+7lbc3HLPDwYj+27eCU384KGvKhV1naAv7qD92
	Z7IjSPa1
X-Google-Smtp-Source: AGHT+IEvrjfNkAkF5z8tTOHc/531hwMvQ6V42TC/2Zg2DMiMr0heP/1FCPKQPrgN+EdObeq8c1tilw==
X-Received: by 2002:a17:902:d492:b0:216:6f1a:1c81 with SMTP id d9443c01a7336-21dd7c35597mr341125995ad.2.1738598372667;
        Mon, 03 Feb 2025 07:59:32 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0a65716sm6799959a12.68.2025.02.03.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:59:31 -0800 (PST)
Date: Mon, 03 Feb 2025 07:59:31 -0800 (PST)
X-Google-Original-Date: Sun, 19 Jan 2025 13:37:48 PST (-0800)
Subject:     Re: [External] Re: [PATCH] riscv: add a warning when physical memory address overflows
In-Reply-To: <87fromgalp.fsf@bytedance.com>
CC: alex@ghiti.fr, punit.agrawal@bytedance.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, chenjiahao16@huawei.com,
  guoren@kernel.org, vishal.moola@gmail.com, stuart.menefy@codasip.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, cuiyunhui@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: punit.agrawal@bytedance.com
Message-ID: <mhng-0cc06470-8584-474e-9fe0-dc6731fdef44@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 23 Oct 2024 07:25:22 PDT (-0700), punit.agrawal@bytedance.com wrote:
> Hi Palmer,
>
> [...]
>
>>> On 14/08/2024 08:26, Yunhui Cui wrote:
>>> > The part of physical memory that exceeds the size of the linear mapping
>>> > will be discarded. When the system starts up normally, a warning message
>>> > will be printed to prevent confusion caused by the mismatch between the
>>> > system memory and the actual physical memory.
>>> >
>>> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>>> > ---
>>> >   arch/riscv/mm/init.c | 8 ++++++--
>>> >   1 file changed, 6 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> > index 52290c9bd04bd..c93164dc51658 100644
>>> > --- a/arch/riscv/mm/init.c
>>> > +++ b/arch/riscv/mm/init.c
>>> > @@ -236,8 +236,12 @@ static void __init setup_bootmem(void)
>>> >        */
>>> >       if (IS_ENABLED(CONFIG_64BIT)) {
>>> >               max_mapped_addr = __pa(PAGE_OFFSET) + KERN_VIRT_SIZE;
>>> > -             memblock_cap_memory_range(phys_ram_base,
>>> > -                                       max_mapped_addr - phys_ram_base);
>>> > +             if (memblock_end_of_DRAM() > max_mapped_addr) {
>>> > +                     memblock_cap_memory_range(phys_ram_base,
>>> > +                                               max_mapped_addr - phys_ram_base);
>>> > +                     pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
>>> > +                             max_mapped_addr);
>>> > +             }
>>> >       }
>>> >
>>> >
>>>
>>>
>>> A bit weird to review and test my own patch, but here it is anyway :)
>>>
>>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>>
>>> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Looks like the patch has been ready for a while now. If there are no
> further problems, can it be merged please?

It didn't build, I squashed in a 

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8f8b76aaf99a..9641e4ad387f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -259,8 +259,8 @@ static void __init setup_bootmem(void)
 		if (memblock_end_of_DRAM() > max_mapped_addr) {
 			memblock_cap_memory_range(phys_ram_base,
 						  max_mapped_addr - phys_ram_base);
-			pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
-				max_mapped_addr);
+			pr_warn("Physical memory overflows the linear mapping size: region above %pa removed",
+				&max_mapped_addr);
 		}
 	}

to fix it.


>
> [...]
