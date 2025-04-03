Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC62505DD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696887; cv=none; b=fOLnJICqsP0m5kEtzjKNvnATFDXlIrKYsLsLPK+9XwcHTpe7RRY4f/4Q3TgZSmropI4IJW7GNoDxNxZybSfZs+O3ouW9pYhY0UYI9mL8hpvviORuRIXY5GRISpCeXBAuTjhYohDGv4MbwAeukYuXzxww9ii88mwFNqsErahht6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696887; c=relaxed/simple;
	bh=PuTFb6/AgrVS9kTvovIHTdR/gBQ7500V2Xy3T48EVQE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=foHjMoIdSxczCBmKPU8hmvw2386oM8YEug/9dt4HwNWhAMa9z5zFIh5ngZC3+3DqgFBnvsoFQmrjSFgwULLrYm8SwumISiA1nPLe+pqdVaJwjAGq/lSa5p3r9f9u6FZHJW1Z45utdYQBTC/i+g8wxLryATQaPA8hRuC7+l66gM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=2gB/Cf1Q; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="2gB/Cf1Q"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af519c159a8so1038187a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743696884; x=1744301684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef+pzV4C83e4SAj4to/6r+rMfPyJU1oBkUC+EMKeDMQ=;
        b=2gB/Cf1Qjz84loEuVI/E5t1FVqxAEg7MJ/VklU3AxRc1dRZkV4vlzfe0vI5f+eCgFD
         d7VhdYB/uqiWKiZbZ2+uCsqWOMZksa1UXhhpHqZJh44CcQhak0ffiLUjtBtNQkZh3PiS
         gpGU9pHnlwkzEqHnVprIsqcH44eTg4dAlpF2JIFKbbMkwDwkMFXBnWFR9bRPsMIVXehE
         TRv7R4i6KCca5iF80/7KrdtsEaeuefseRg5Ktug1IECodD9ImDjzjozwENQudc8w1NOE
         J+DSs1e5PshaqeYAoOWO97VEUgrS987MixlxKfuOaVD3b8QnYlaxSH5Yof8UXXmGhV99
         23TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696884; x=1744301684;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef+pzV4C83e4SAj4to/6r+rMfPyJU1oBkUC+EMKeDMQ=;
        b=JAIxVsweiKjvYRSL/lR6SmhqcX1oNCGwL+sSlIDMWDwEe2xDw5FHBqxy1iEVL0K4LP
         6TaU2nCinPzCx3punpEVNdD6klclmYc2f3GDOnl2NZYp9YpXMC8WzMeFZ5wJrUquz+Ge
         Bwssy0+Mdu8hax+HlZ6v8E9AzCLAZyP7C4ZQ0FVZY7pfBw/YSJwpF5+6afP2Ivo4OAyF
         SCbHwf8JJ67S9enD1jTavH4fozAHRzvZDXSAUOM1Twcs6J0FQVyz3b3D6jPIk5eeiq1a
         hTC4KCFsYqWZ6KTSnmcuOEoOjy75rgmu3EpspwZwfBte1TCzm4IwqxVr3YxoBVTP6NHk
         6Lhw==
X-Forwarded-Encrypted: i=1; AJvYcCViACdT32AxuNPUNG5+kprRswBJE9g3MLLPaQKrJQpMOZRM2BEaEpU9YJnYcgKYw/r/BD1gzkQn3tORQfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9m85t0OtCmbNQKlgRhto+/AZHJUKj44wW+cqWk0yZfya8lin
	YC4ZkR8BRKKMZpXRQqCZyJ1pvSLw2yChOX5EqbMPGLalLmLxDgsTj0tVp6F+xzI=
X-Gm-Gg: ASbGncsiRSFbBO5be3AIuqgIo606b8Y9W6QrRUICIrBPWALdlOOpMi7x/D4Ra241/p3
	JP+bQnHPm93DDw6KWKaVwxKzqsRvMzuamDKbq8IGhxgJWPh231ZVlez/3YwUgJmiwCNJEQERJwr
	SRlvddC1xKXXgaU7YGS9CssZ/mFUbKeYtGttXnBhjvYvooRcGWIYHE15YNupx2YtKU4SJyymN3I
	byCF6vPCWxJbXFc+tLGXlccnA3dmSPYY3ADpaw+1cvkNQf9ChipCsg59wYFJcT8X9FQi4FS6gqa
	p1RANyJY8wNyxdkDCxIeqDz2PJx/9mMFZl2z+A==
X-Google-Smtp-Source: AGHT+IELGoM2vuGwvs+CKuvhAKIXpRljIuAtDQQP6mgRfQoQftDtOy8EjZTD2p4+jkf5EebMeV65Kw==
X-Received: by 2002:a17:90b:5444:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-306a4b7fc3amr116329a91.27.1743696884290;
        Thu, 03 Apr 2025 09:14:44 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca47ec7sm2086347a91.15.2025.04.03.09.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:14:43 -0700 (PDT)
Date: Thu, 03 Apr 2025 09:14:43 -0700 (PDT)
X-Google-Original-Date: Thu, 03 Apr 2025 09:14:41 PDT (-0700)
Subject:     Re: [PATCH v2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
In-Reply-To: <5b0adf9b-2b22-43fe-ab74-68df94115b9a@ghiti.fr>
CC: wangyuli@uniontech.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, vincent.chen@sifive.com, palmerdabbelt@google.com, zhanjun@uniontech.com,
  niecheng1@uniontech.com, guanwentao@uniontech.com, chenhuacai@loongson.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-69513841-5068-441d-be8f-2aeebdc56a08@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 03 Apr 2025 02:58:50 PDT (-0700), alex@ghiti.fr wrote:
> Hi WangYuli,
>
> On 02/04/2025 09:42, WangYuli wrote:
>> The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
>> symbol using inline assembly.
>>
>> There's a potential issue where the compiler might inline
>> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
>
>
> I guess you meant kgdb_compiled_break.
>
>
>> symbol multiple times, leading to fail to link vmlinux.o.
>> This isn't merely a potential compilation problem. The intent here
>> is to determine the global symbol address of kgdb_compiled_break,
>> and if this function is inlined multiple times, it would logically
>> be a grave error.
>>
>> Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
>> Fixes: fe89bd2be866 ("riscv: Add KGDB support")
>> Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: WangYuli <wangyuli@uniontech.com>
>> ---
>> Changelog:
>>   *v1->v2: Add the missing __ASSEMBLY__ check and substitute
>> ".option rvc/norvc" with ".option push/pop".
>> ---
>>   arch/riscv/include/asm/kgdb.h | 9 +--------
>>   arch/riscv/kernel/kgdb.c      | 8 ++++++++
>>   2 files changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
>> index 46677daf708b..d9f6a8fc387f 100644
>> --- a/arch/riscv/include/asm/kgdb.h
>> +++ b/arch/riscv/include/asm/kgdb.h
>> @@ -19,16 +19,9 @@
>>
>>   #ifndef	__ASSEMBLY__
>>
>> +extern void arch_kgdb_breakpoint(void);
>
>
> The "extern" is not needed here.
>
>
>>   extern unsigned long kgdb_compiled_break;
>>
>> -static inline void arch_kgdb_breakpoint(void)
>> -{
>> -	asm(".global kgdb_compiled_break\n"
>> -	    ".option norvc\n"
>> -	    "kgdb_compiled_break: ebreak\n"
>> -	    ".option rvc\n");
>> -}
>> -
>>   #endif /* !__ASSEMBLY__ */
>>
>>   #define DBG_REG_ZERO "zero"
>> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
>> index 2e0266ae6bd7..5873d3970360 100644
>> --- a/arch/riscv/kernel/kgdb.c
>> +++ b/arch/riscv/kernel/kgdb.c
>> @@ -254,6 +254,14 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>>   	regs->epc = pc;
>>   }
>>
>> +noinline void arch_kgdb_breakpoint(void)
>> +{
>> +	asm(".global kgdb_compiled_break\n"
>> +	    ".option push\n"
>
>
> Here you forgot .option norvc. But this fix as mentioned by Samuel
> should be in a separate patch.

I don't think we actually need either here: we're just looking at the 
address of kgdb_compiled_break, so it's fine if it ends up as a 
c.ebreak.

> Thanks,
>
> Alex
>
>
>> +	    "kgdb_compiled_break: ebreak\n"
>> +	    ".option pop\n");
>> +}
>> +
>>   void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
>>   				char *remcom_out_buffer)
>>   {
