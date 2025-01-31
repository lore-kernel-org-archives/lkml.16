Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C698023A9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738287106; cv=none; b=Ggf3GrfR/DXLzRrthGRJJL3shTrxzWUn1Idb/EVnbRoljYzjG5l7EzH3+dcS1vBNhwY4mFDRMZq6woaQY54rBtsoNkLrUuhg96FJj39vY5Q2s2fBolRxmDC6WfDM6Us8ID/Jfniqj8PCZcdapXxX/3W1BEu4/PjN9QDB/mvkt4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738287106; c=relaxed/simple;
	bh=1tLoSinO89mGQ5F24iVcL3OaxVWIwWTzqzxlZjUonqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8PtrbsSb4Ut+jB5y7ksJJvoiL/pnMpPMPXAxgvgQAgqJZiI4ILkhODw5qYl8djgjotf5u5SEYtyf/RAv/ISu2X7SLI8IwhgD1aeQ6WAIB+8HHjv1o5/Rwc0M2YQHrbjQLhOgWME7m3BuC7GuHXhIchdBetQjgzUGZxZCwZNWW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=J7BqHWc6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="J7BqHWc6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163dc5155fso26155795ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1738287104; x=1738891904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MG19W4SOPIaZi7OCinPeczwbesfkNxF5n0JVFRzeQlA=;
        b=J7BqHWc6CV/K3sjDGsvMDY+w+feEescR1xLeu4FPufwF8LubbSWXL/va7OuhV+07Hu
         y3oZhEVt2AEbzKxkzswOrbMjopgywfv4WJ4i1+rVxrtgk5YiJnjFwEEXeImz3ZkOfC6S
         6BNoNbRBz7g+eRKnv4u7u8xaKo/DI+CliMoAnJSPQ73FRetzj67d7QjlrXNjqhsaPvCC
         E0yri1nj8hupPVQK3arLvaDlCRNElq2fiRT2HeNQpoiGWoUc93Jc7s3j5NrrQek8iO3I
         o5c5ZW6W072Bl74+R4aBa/GUrvSBjlej4WcEW06z5yLhBMPk3PyEp09dwr4U4vdwS8jq
         DdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287104; x=1738891904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MG19W4SOPIaZi7OCinPeczwbesfkNxF5n0JVFRzeQlA=;
        b=lkpkMPu2emC8FsSzQp7GRF9uiew1uGVwpafCsABEGYzb8w1HynZpmIqvE4w6gbwPpb
         ZnpGtllA6Z8S77koT/ybI+UYLZ3jw37myAutT1hfxTZtQ1eYQoT/Jk20ZEIYA0qFXWu4
         lvLGWpoVFJ1/tX3Mgt/FQyZ/fwQdVRyn7fXkrAVsOnUaT58h6eZi4tv3YVJxzoU+JkZ6
         jd4AJbA7Tufdzq13adJeUXAXfMeu2oOrBZPDnShNtprYHIyyOEeHAnpO1+RZbHvHL/B+
         hsFv9bfkkxRx1PHeomYRFJ4vJu6zh4UBDmWbAuv30rWG4B8hIwbpmnK3nyfZWIYZyiUq
         1VqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbG5J4v2SE5IRFOxp6LrKRF8x1F/m4hQGwBJuz66KPS4BkGb6mKwzS73AWSX2B7DHrLJkk5AKDszoReV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRlyFFTiQc+iHG5PqPqilrwOzdHqJj9APWMU9b3fNC0hXDFYS
	dmICCj9Xlr1ZX8NhKX/dxtEJYsDcu+Sqpwy+ozbN1osslgo4I50GzCzHNrpkYQ==
X-Gm-Gg: ASbGncuFpW4RnFcPbDmoEloW8z23YpykOB0A2I6tMTBlLX88n3i1CCN4OKbVq2vspA0
	n9ckIAcyEcjctY66hv5fOh1H+xk8vudPWy0FMp3WmW7yUKh65gfVGSzTB4w2HLXizdb4EKUZs5D
	JvpdQJWV2UqzROZ8v97ldEFP20QfGgZRW6miZ1ZElHXCS9SCzvKcE7soUuM3aINJSZQixM+wv+9
	7cVvoMb1L5Ui69swWzpLhGSZ+0z0oiJrGUgsMEfXD/JR4qT+eyhafGiwkjKJGZbCgLsV0RQbPaK
	cbopqdQI8oyJPlYN7cvv2JqRa4sP5bN+EQ==
X-Google-Smtp-Source: AGHT+IF4Q8nENVfklGPnhiKtH5eyOQErysoSYV+Lhn5dkRBbuxx/QIH4nFvnyXq4lmP1dfXh+avEog==
X-Received: by 2002:a17:903:22c4:b0:216:1cfa:2bbf with SMTP id d9443c01a7336-21dd7dd87famr149812315ad.35.1738287103992;
        Thu, 30 Jan 2025 17:31:43 -0800 (PST)
Received: from [192.168.50.113] ([27.96.222.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97e7csm5137597a91.9.2025.01.30.17.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 17:31:43 -0800 (PST)
Message-ID: <f1218075-94a5-429a-ab35-f47d3e79e80e@tenstorrent.com>
Date: Fri, 31 Jan 2025 12:31:38 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
To: Jessica Clarke <jrtc27@jrtc27.com>, charlie@rivosinc.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
 <EA2CB85E-E210-402E-B891-2F4420E55CDB@jrtc27.com>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <EA2CB85E-E210-402E-B891-2F4420E55CDB@jrtc27.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/1/2025 9:34 am, Jessica Clarke wrote:
> On 18 Nov 2024, at 23:01, Cyril Bur <cyrilbur@tenstorrent.com> wrote:
>>
>> From: Jisheng Zhang <jszhang@kernel.org>
>>
>> I believe the output constraints "=m" is not necessary, because
>> the instruction itself is "write", we don't need the compiler
>> to "write" for us. So tell compiler we read from memory instead
>> of writing.
> 
> That’s not what =m does. =m tells the compiler “this assembly will be
> writing to this memory location, and needs the address of the location
> for that operand”. If you move it from an output to an input then you
> get the same assembly generated, but the compiler believes you are
> *reading* from that memory, not *writing* to it, and so does not
> believe the memory may be clobbered.
> 
> Now, it may well be that, by virtue of this being userspace memory that
> is only ever accessed via assembly, and any inline assembly being
> marked volatile, this in effect doesn’t matter. But it is still
> technically wrong to model it that way, and you cannot use the
> justification you are using, because it is false, and demonstrates a
> lack of understanding for how inline assembly works. It has to be
> correctly justified.
> 
> (I do note that neither x86 nor arm64 seems to model this as an output)
> 
> Jess

Good points, I agree. I am happy to respin this patch move the =m to 
output constraint.

@Charlie Please let me know if you would like me to keep your tags on 
the tweaked version.

Thanks,

Cyril
> 
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>> ---
>> arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
>> 1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>> index 09d4ca37522c..84b084e388a7 100644
>> --- a/arch/riscv/include/asm/uaccess.h
>> +++ b/arch/riscv/include/asm/uaccess.h
>> @@ -186,11 +186,11 @@ do { \
>> __typeof__(*(ptr)) __x = x; \
>> __asm__ __volatile__ ( \
>> "1:\n" \
>> - " " insn " %z2, %1\n" \
>> + " " insn " %z1, %2\n" \
>> "2:\n" \
>> _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0) \
>> - : "+r" (err), "=m" (*(ptr)) \
>> - : "rJ" (__x)); \
>> + : "+r" (err) \
>> + : "rJ" (__x), "m"(*(ptr))); \
>> } while (0)
>>
>> #ifdef CONFIG_64BIT
>> @@ -203,16 +203,16 @@ do { \
>> u64 __x = (__typeof__((x)-(x)))(x); \
>> __asm__ __volatile__ ( \
>> "1:\n" \
>> - " sw %z3, %1\n" \
>> + " sw %z1, %3\n" \
>> "2:\n" \
>> - " sw %z4, %2\n" \
>> + " sw %z2, %4\n" \
>> "3:\n" \
>> _ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0) \
>> _ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0) \
>> - : "+r" (err), \
>> - "=m" (__ptr[__LSW]), \
>> - "=m" (__ptr[__MSW]) \
>> - : "rJ" (__x), "rJ" (__x >> 32)); \
>> + : "+r" (err) \
>> + : "rJ" (__x), "rJ" (__x >> 32), \
>> + "m" (__ptr[__LSW]), \
>> + "m" (__ptr[__MSW])); \
>> } while (0)
>> #endif /* CONFIG_64BIT */
>>
>> -- 
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

