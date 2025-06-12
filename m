Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8602D4B5C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 19:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757355; cv=none; b=GSwUbqL8Nr1qfBrdyZJok/hyjqKrVPd4PUhWj/NctRRKNSGQXEtk8OWB28D8Qi8dUcHE7cSWIfrgJ4+HLBkD6OyN74oNAh+AGMivZVi/066AN7OR6+5a9Fu0IW8lMtQh2LyUGApXETXJfdKBIlTPlnUxSU+8KcwYoF83jAm4uF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757355; c=relaxed/simple;
	bh=mHqhUJezYXqPgVmcJfV7z35uQygOdTBCuPHQ8tafg30=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=U4AjMOHfF8m1nymIbMlNTUsKrVra4O/O7EqvcQMCzBCak7JDfwqkkKsWEqUjh1KXnslW5yvQd1gsUkCCqveHD2PKZViWwEb6tQGrn59ozisC6DLn+iFAQDMZ1oytMexOV7FYPd3KkLVNXJAx37CYglxVQLxPJOKciY7iu7QRQYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=d1eeuYkB; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="d1eeuYkB"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23633a6ac50so18744085ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749757353; x=1750362153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wU2gWru+pGp/2bdnX0/py0HOFjAqRaBE4NmRyG3YyE=;
        b=d1eeuYkB5yxQrx7n7lmxmWnydCERXZyroTuqJghtAQNlEpF0z6XHJQOjazRxtNGdzg
         h9KGcC8L/iCS5ljKOWhGxVNZcFulzTUMlR4MJwa+S2AKdhaFlSbG3JwBhBlWKoVWeaH/
         uOjwt87yMyQpVF7RGydTDXDTM7gy9Om55zVVtTWMd0m+dqmgU364ugtgtS87Ijl/LDjD
         oLfQ14cAFyf27icGC4MXVgfGknlei5ywuPwEbMkby2MNQzu1rJ457U1K9PohuKljsEqX
         QxTW6dcbVKixNZ9au2OqSeeJVWBzi5D+PH3XOBM1fFv/d5VIKFX5CQP9gLLtvsQrY8bu
         KQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749757353; x=1750362153;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wU2gWru+pGp/2bdnX0/py0HOFjAqRaBE4NmRyG3YyE=;
        b=Ps+cN01+/I0zyC+kmsOlEQ7lTuVm2P04LsRjmvv9Ke7oMnWZYGAWoGlO/LWxuGUIW9
         0m03h7kJwkdSHMOjVD7osF5WkiJ88d4n5enwl2sZ2Xw5OVH/TJ6SqQUFh5sawdeSr5OP
         kMUcJ3r42O1dYfd3SOBTrFyrtf8DEgx3MKZ9M08oaI3Dj9y4mBaP6ALdUuDobDLgZT+Q
         Ko+Jmlghrtd+nKxji9SFJUPCWMfkkX4E1shbaVlGcDtlSOkE2uYQfgKFDTMISUckzv2g
         CiFkHgnieckyVT3UFGaY5BPjjcE+PefxRGnwiSNT6eEzxGjxPU2i7iY7nwk7j9ncx0JR
         Ptkw==
X-Forwarded-Encrypted: i=1; AJvYcCWR0vAdlzS5ty9kMKGmGqr6FlxM8oA+3JU8Itr2Ixd/bOXsYvlV3DgGbzPj6vRwGrTDOak+TGlfgY8L6yE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEa/i2d61Xdb2sBULyfPq7SNc9n22Bf37w+zVKyqJ3omttp5MD
	e3zyK11W8fQ/TfBXqwMBTZMQXkh92652XwGCXHOnDENutqZ29ASoktvKd0Vb3+MACiQ=
X-Gm-Gg: ASbGncuBBuYGr81RaxfrVI/Gg4ifyNiSRyCXyCjMVJaXuKvA7KMrsblkuFdbnph28gl
	ry72dCA3NRc2X60PCs+ZQcm/tZ1fX11y1dXIwebq7XQ0ndeSUfXYQDgwAjjqE/l0rnRrinhjnFw
	dGfVH+l8re1akGsyvHHc+QeZ+5pZ7AQr9CeDHl5Yf+IHX6UE2UpegThzonze8Wx9+DZD15JFRhn
	M453tfXtdSyFj37IQZ0GAY75dHDMLktTrKc5oWte4Z49ScJiQwtTwDItWkW9h0R42Qilx3dDBt8
	rzC318lL2UPo9HyeTThR7ikeXIKkPZ+paiPa4LcRzoQsXIWODJsS2ny1vXlP
X-Google-Smtp-Source: AGHT+IHGeSTc+wMQKofdFqp+fq6QEkGdV+HYkmUzLXbvgEikoJEVAyqi9G/tKmrk94n8EqfMCvEsqg==
X-Received: by 2002:a17:902:b185:b0:235:866:9fac with SMTP id d9443c01a7336-2365d8a28ecmr3212175ad.2.1749757353002;
        Thu, 12 Jun 2025 12:42:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365de7832asm949425ad.140.2025.06.12.12.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 12:42:32 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:42:32 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 12:41:38 PDT (-0700)
Subject:     Re: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
In-Reply-To: <de5e9d8d-c620-4371-8c74-7ef804d97d53@ghiti.fr>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, cyrilbur@tenstorrent.com, jszhang@kernel.org, cleger@rivosinc.com,
  samuel.holland@sifive.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-6698D901-534C-4886-BDB3-BB4EDF14E7E8@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2025 00:31:18 PDT (-0700), Alexandre Ghiti wrote:
> On 6/10/25 23:30, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@dabbelt.com>
>>
>> I must have lost this rebasing things during the merge window, I know I
>> got it at some point but it's not here now.  Without this I get warnings
>> along the lines of
>>
>>      include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>>       3975 |         if (unlikely(get_user(c, path)))
>>            |                      ^
>>      arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
>>        274 |                 __get_user((x), __p) :                          \
>>            |                 ^
>>      arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
>>        244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
>>            |         ^
>>      arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
>>        207 |         __ge  LD [M]  net/802/psnap.ko
>>      t_user_nocheck(x, ptr, __gu_failed);                        \
>>            |         ^
>>      arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
>>        196 |                 __get_user_8((x), __gu_ptr, label);             \
>>            |                 ^
>>      arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
>>        130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
>>            |         ^
>>
>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>> ---
>>   arch/riscv/include/asm/uaccess.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>> index d472da4450e6..525e50db24f7 100644
>> --- a/arch/riscv/include/asm/uaccess.h
>> +++ b/arch/riscv/include/asm/uaccess.h
>> @@ -127,6 +127,7 @@ do {								\
>>
>>   #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>>   #define __get_user_8(x, ptr, label)				\
>> +do {								\
>>   	u32 __user *__ptr = (u32 __user *)(ptr);		\
>>   	u32 __lo, __hi;						\
>>   	asm_goto_output(					\
>> @@ -141,7 +142,7 @@ do {								\
>>   		: : label);                                     \
>>   	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
>>   		(((u64)__hi << 32) | __lo)));			\
>> -
>> +} while (0)
>>   #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
>>   #define __get_user_8(x, ptr, label)				\
>>   do {								\
>
>
> I had come up with the same fix so:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks, and I guess it should also be

Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")

I'm going to put it on fixes.
