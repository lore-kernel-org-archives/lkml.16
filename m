Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999BC18A6BA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 23:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799605; cv=none; b=IlzE9oA4bxOO7bhhjc1urILK06QaXNjRp5NcBNqKJPOEGJB+2HyfjLvEm7uRLX8rLOGsADJ++D37D6hi/DW1nDplOcVbLMhgkGKEq09PvOlCRJf1k5wGR7hfv6EQ5nTGDXWP8ZbkIaMSo07Wb5p10mE3FyI71cdlBXbMIEAa2aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799605; c=relaxed/simple;
	bh=SAd6SHdx4HIO04A1WGKYhkGtorl+FeYxWO4BIDZSayw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=VwM46LB3nSHTaotmgT6zS/zdCQzpEijxU6U2SmF5EhfmcXyMtreJRLX2d0tOKZHcDNt8gdKDUKuyJz3wpRcIOvKSXGkfo08kwRPqHAB16ssJGMpwe/aSQ8XZQSdrZLFkqXK4YO2Y+If7k31Gxxhme/gVFgPdZK+Smp6nLgN2mZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=kYjTQcvm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="kYjTQcvm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fa0892f9bdso25468a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 15:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738799603; x=1739404403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ra5Mbg5OY3KVHpv79LQ4A0jzyK7crMbEFKoAz+DcSV8=;
        b=kYjTQcvmmdmJnSL9lxKV8np22b5rjkqxNkAUrisG0eBVHlynK6H8r2n+2UG75oPI3b
         MRm6meuMua12JBeS12UXSu/gGu43yLaBUCx7wSYfx8Rt2rFMUgShZ5cSsdDlUFA9hvd5
         LCdU7wkWoZ6oviROGIUlfcJ56X2I3U61b3wNAfyBTqafbKf7nCJPPsnFzXlSCbYA/Fzo
         2eaLXxINwT2/k+3RmulfBwNM5Ff/lRhMQYxNjloNM4N9+QODu91g5wZPCTMabg6wigDP
         g3CRBdgmEh1QxBXxJ9oMbyIvHmRWbFejztLjAx7vYaDFirO+CRJf6TLpdm94XLbixeye
         fgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799603; x=1739404403;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra5Mbg5OY3KVHpv79LQ4A0jzyK7crMbEFKoAz+DcSV8=;
        b=MjCRE7i/TRpx0wOaB9sUIfAxrvoHGKGnb1e9QR6jAOY0xgzweLpfmVrH2UiR6XhTZA
         xOlkNiBv5SCPdL5vJ6qKjZu5vMMtvna+XAd3j7edqI+78hmNlk7eXyvFKoZ9sy8B53/U
         6abBMD1DXeskQv/SU0ccEe4XqkcQDsDh1svp6rvGGjTz9AjZ/ihsb5IyxePXDJ/VbNuh
         5aXEXcWgwHRPluzMzo4lDTSD11F2jeSbAkaH/0SsMSzPmcI8FOzbqM/0qOu9hLmcz63x
         fguOmMqGExjp8TB9r5Hx4nmMI3WpwKqnpPPSYBcjbquw0TlCXtkjNMpqpXE6SQOUPqgG
         jO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeazTt0h/X6swilwc3gfkgcB3De1JCpaMr7L/4RhwXfj+BKR1HxJ9AOqjB6e4y4C9wcwpiUwEFv1ND510=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpJKzKpe+jlDKHJj/BkUcug3plJ5jYubKe8sqb2ztEnkNhFwN
	3nXs32wnIeqLaAGX1KGUQQVoMkwxkjpnrImBD+Np/svPZ9ecmcFCWTw53oW4mxXU0ZwF9QowI8Y
	UoTE=
X-Gm-Gg: ASbGncsT6Euul7JW+NDH3caNnJsnVysEqiYTNw7mynyrYLfpmUHZfA6m15kNqppcEAm
	iyQaRs6e9hSuQ3Eo18hp0o+Mc+Db5tQPxhA7Dwqdh9n2TX11fXeSORf93jldhs6SM7TwmkK8a/i
	P+IXS6HsuHiIuMih68n7csMxdsk8UHzQXr0Gv0SThVK0EMKZcGdzlmIt+P5+DMhZ5cN4JexYQLd
	h+h5ELNm0TUDTEOJnMkrSzrkq34uZNQQfmFvO4mNoK901P6rlsywhEb8M+suwAA8L8L6Bb8BNFZ
	Xwl4+6VoUqIF
X-Google-Smtp-Source: AGHT+IESlnEloTRkMdGmIgpHf3GHd5Z19yX7ObK7xTCBbFAJo4c09Hwxk6ijfuAekNIxp8Vwcvp0xg==
X-Received: by 2002:a05:6a00:e84:b0:725:f097:ed21 with SMTP id d2e1a72fcca58-730351b9a07mr6070010b3a.15.1738799602709;
        Wed, 05 Feb 2025 15:53:22 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e1e792sm21788b3a.161.2025.02.05.15.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 15:53:21 -0800 (PST)
Date: Wed, 05 Feb 2025 15:53:21 -0800 (PST)
X-Google-Original-Date: Wed, 05 Feb 2025 12:41:24 PST (-0800)
Subject:     Re: [PATCH v2] RISC-V: hwprobe: Use BIT macro to avoid warnings
In-Reply-To: <422ee6c5-048d-498e-a823-97deef02326f@ghiti.fr>
CC: jesse@rivosinc.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, cleger@rivosinc.com, Conor Dooley <conor@kernel.org>,
  Evan Green <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, ajones@ventanamicro.com,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-2665f589-5f29-42fa-9c6e-3b00a39c38de@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, 25 Aug 2024 23:28:17 PDT (-0700), alex@ghiti.fr wrote:
> Hi Jesse,
>
> On 22/08/2024 22:39, Jesse Taube wrote:
>> In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
>> which causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
>> these warnings.
>>
>> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
>> ---
>> V1 -> V2:
>>   - Reword commit message
>> ---
>>   arch/riscv/include/uapi/asm/hwprobe.h | 102 +++++++++++++-------------
>>   1 file changed, 51 insertions(+), 51 deletions(-)
>>
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
>> index b706c8e47b02..d0874ff2fd37 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -21,57 +21,57 @@ struct riscv_hwprobe {
>>   #define RISCV_HWPROBE_KEY_MARCHID	1
>>   #define RISCV_HWPROBE_KEY_MIMPID	2
>>   #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
>> -#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
>> +#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	BIT_ULL(0)
>>   #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
>> -#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
>> -#define		RISCV_HWPROBE_IMA_C		(1 << 1)
>> -#define		RISCV_HWPROBE_IMA_V		(1 << 2)
>> -#define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
>> -#define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
>> -#define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
>> -#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
>> -#define		RISCV_HWPROBE_EXT_ZBC		(1 << 7)
>> -#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 8)
>> -#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 9)
>> -#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 10)
>> -#define		RISCV_HWPROBE_EXT_ZKND		(1 << 11)
>> -#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 12)
>> -#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 13)
>> -#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
>> -#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
>> -#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
>> -#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
>> -#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
>> -#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
>> -#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
>> -#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
>> -#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
>> -#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
>> -#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
>> -#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
>> -#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
>> -#define		RISCV_HWPROBE_EXT_ZFH		(1 << 27)
>> -#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
>> -#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
>> -#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
>> -#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
>> -#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
>> -#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
>> -#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
>> -#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
>> -#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
>> -#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 37)
>> -#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 38)
>> -#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
>> -#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
>> -#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
>> -#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
>> -#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
>> -#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
>> -#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
>> -#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>> -#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>> -#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>> +#define		RISCV_HWPROBE_IMA_FD		BIT_ULL(0)
>> +#define		RISCV_HWPROBE_IMA_C		BIT_ULL(1)
>> +#define		RISCV_HWPROBE_IMA_V		BIT_ULL(2)
>> +#define		RISCV_HWPROBE_EXT_ZBA		BIT_ULL(3)
>> +#define		RISCV_HWPROBE_EXT_ZBB		BIT_ULL(4)
>> +#define		RISCV_HWPROBE_EXT_ZBS		BIT_ULL(5)
>> +#define		RISCV_HWPROBE_EXT_ZICBOZ	BIT_ULL(6)
>> +#define		RISCV_HWPROBE_EXT_ZBC		BIT_ULL(7)
>> +#define		RISCV_HWPROBE_EXT_ZBKB		BIT_ULL(8)
>> +#define		RISCV_HWPROBE_EXT_ZBKC		BIT_ULL(9)
>> +#define		RISCV_HWPROBE_EXT_ZBKX		BIT_ULL(10)
>> +#define		RISCV_HWPROBE_EXT_ZKND		BIT_ULL(11)
>> +#define		RISCV_HWPROBE_EXT_ZKNE		BIT_ULL(12)
>> +#define		RISCV_HWPROBE_EXT_ZKNH		BIT_ULL(13)
>> +#define		RISCV_HWPROBE_EXT_ZKSED		BIT_ULL(14)
>> +#define		RISCV_HWPROBE_EXT_ZKSH		BIT_ULL(15)
>> +#define		RISCV_HWPROBE_EXT_ZKT		BIT_ULL(16)
>> +#define		RISCV_HWPROBE_EXT_ZVBB		BIT_ULL(17)
>> +#define		RISCV_HWPROBE_EXT_ZVBC		BIT_ULL(18)
>> +#define		RISCV_HWPROBE_EXT_ZVKB		BIT_ULL(19)
>> +#define		RISCV_HWPROBE_EXT_ZVKG		BIT_ULL(20)
>> +#define		RISCV_HWPROBE_EXT_ZVKNED	BIT_ULL(21)
>> +#define		RISCV_HWPROBE_EXT_ZVKNHA	BIT_ULL(22)
>> +#define		RISCV_HWPROBE_EXT_ZVKNHB	BIT_ULL(23)
>> +#define		RISCV_HWPROBE_EXT_ZVKSED	BIT_ULL(24)
>> +#define		RISCV_HWPROBE_EXT_ZVKSH		BIT_ULL(25)
>> +#define		RISCV_HWPROBE_EXT_ZVKT		BIT_ULL(26)
>> +#define		RISCV_HWPROBE_EXT_ZFH		BIT_ULL(27)
>> +#define		RISCV_HWPROBE_EXT_ZFHMIN	BIT_ULL(28)
>> +#define		RISCV_HWPROBE_EXT_ZIHINTNTL	BIT_ULL(29)
>> +#define		RISCV_HWPROBE_EXT_ZVFH		BIT_ULL(30)
>> +#define		RISCV_HWPROBE_EXT_ZVFHMIN	BIT_ULL(31)
>> +#define		RISCV_HWPROBE_EXT_ZFA		BIT_ULL(32)
>> +#define		RISCV_HWPROBE_EXT_ZTSO		BIT_ULL(33)
>> +#define		RISCV_HWPROBE_EXT_ZACAS		BIT_ULL(34)
>> +#define		RISCV_HWPROBE_EXT_ZICOND	BIT_ULL(35)
>> +#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	BIT_ULL(36)
>> +#define		RISCV_HWPROBE_EXT_ZVE32X	BIT_ULL(37)
>> +#define		RISCV_HWPROBE_EXT_ZVE32F	BIT_ULL(38)
>> +#define		RISCV_HWPROBE_EXT_ZVE64X	BIT_ULL(39)
>> +#define		RISCV_HWPROBE_EXT_ZVE64F	BIT_ULL(40)
>> +#define		RISCV_HWPROBE_EXT_ZVE64D	BIT_ULL(41)
>> +#define		RISCV_HWPROBE_EXT_ZIMOP		BIT_ULL(42)
>> +#define		RISCV_HWPROBE_EXT_ZCA		BIT_ULL(43)
>> +#define		RISCV_HWPROBE_EXT_ZCB		BIT_ULL(44)
>> +#define		RISCV_HWPROBE_EXT_ZCD		BIT_ULL(45)
>> +#define		RISCV_HWPROBE_EXT_ZCF		BIT_ULL(46)
>> +#define		RISCV_HWPROBE_EXT_ZCMOP		BIT_ULL(47)
>> +#define		RISCV_HWPROBE_EXT_ZAWRS		BIT_ULL(48)
>>   #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>>   #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>>   #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
>
>
> Why isn't this one ^ converted too? I did not look but are there other
> occurrences in this file that should be converted too?

They're multi-bit values, I poked around looking for a macro and 
couldn't find any.  That said, the "<< 0" doesn't do anything -- it was 
there from back when we though we'd pack multiple values into this, but 
we screwed up some of the value/bitmask on this one so it's deprecated.

So I'm just dropping the "<< 0"

> And what about the rest of the riscv sources?

Probably Jesse was just squashing the checkpatch warnings in the files 
she touched.  Either way I think it's a reasonable cleanup, I'll send a 
v2.

>
> Thanks,
>
> Alex
>
>
>> @@ -85,6 +85,6 @@ struct riscv_hwprobe {
>>   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>>
>>   /* Flags */
>> -#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
>> +#define RISCV_HWPROBE_WHICH_CPUS	BIT(0)
>>
>>   #endif
