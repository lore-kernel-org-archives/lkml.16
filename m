Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D226BDB9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739248301; cv=none; b=p06aKVd+YUNaOSBONT4yVM5B06jCFEy9jQdp44dOXiXzPFVz9kXFnTTqJB+z0HivRn3Y/mVpX6yVJWNzlWh6UcBNVZo8MntwAQqDM2p3LW5eX4DcjAQh172T73xadResRmXbrmNOLgf7XHUDGMB4AV8uUrVEIwXp2EVbBmYhHeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739248301; c=relaxed/simple;
	bh=KBi+G9UGgPx2k8umZQyZtGo0Tkv4fp4ucz0iGRT1/ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5gJLRgbmUrWiF+//zcjkANJRNkwri3/qQgXt4i5RVrbf3t0KlrZgNcD62K6mSrlw+2haR94wtsQ8Erisz5+srnSZdP4IlNXCCbBWNCqzRccyMqMUIKVz5l3Jh6vQiNk351PL14mxE8eilXHl+cm4Uj5vEpJmAeKXoHJTH0tCFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LT5hQ26v; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LT5hQ26v"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-855370e0de6so34923739f.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739248298; x=1739853098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uk7QCT1ibthTmG31kgz2RQ3fd9RFf43i5AcvZcwTxN4=;
        b=LT5hQ26vzNTfE/pnK0iQOZRlVJ9iOVJQ30cBQmxNxGOYs0Vtyj0Q9LZ/WXHnaWr8WU
         8FodzwkLHV86p1IUbMUClZ9I4/aeZYYEGROWTkIEkLhO3n4w3dqfKFA7tM4PlmtHKxrM
         NxDtHeltMZL1QL6dPtT64MMeL1LqLFoBAePnhx1+7+Qr/JLh3uCcFaYzggmbRAIWwpZB
         C9c5pou1ojdbaiGDB1o+FBiigUli+g4i25OaoeEoloPr5csOaMngMzQ4h0MXF67Pz7XY
         4FQWQchXuJhtDRzcL2EB+VDzyNVYrgA7enODAz6mFQfVVAoqeY3zftSgOYIkKPut6lW9
         0KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248298; x=1739853098;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uk7QCT1ibthTmG31kgz2RQ3fd9RFf43i5AcvZcwTxN4=;
        b=VOUPsiPKSWLXNlAfjifKvu4dqGd24R2DnkwlaqrQRffOTo2gQubP/PxHNJumWyoR+1
         Azi0AhNNIM3QVpF5oDrkaxKdSeRBpUoE1xG3VTJ5m6VHINbD32IKOzGBGJX9ISWp+Toz
         pMhb+StxEhmsgp1l7aMa7fM78LHRax3/gHknkn4frQWpv7bkPQURlnf2piBUfs4v3iLk
         /e63d5IaLcFFc6ecuiMAUhvfBVdu8CCdNSCTGHKJVNjQvHfU9JThzItrWcAkEmxHC0HI
         l0LVpZDzwCJzrY5hE40ciaOoq1yRhwyDBELdgfM2k2zO/hLAIFAzIX38/fyOKYZf8bKu
         Z8vA==
X-Forwarded-Encrypted: i=1; AJvYcCWF1FXGLCEQAKPbJsLr0gZGxzbeNcEoEyD9aIEOcg0uDy0ddfvuzyX3yWQInYGaa9eVCiZmEZgMMBy59s8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUCcMXxf6swErNL5sBmfYBzrFYsT4q4AWohVTOV8FnJm2dGG8u
	CSRoc+Aqr3YDTJJxNS22ht9JDqzo1K9S/1lNX81+xhheS7qB7XAG4tfwisoSXKk=
X-Gm-Gg: ASbGncvy6Ttul25yXJa3M771000Tj/wYQulS8Y1PYYxKx/LgYKtFAYM6ZTjWSmZVupc
	L/T01prRDPXovvSR8bPYJC8X4d25LLbQRqi2pSVn/G03Qurglk8FBncjvHQlyItwlTuGcgWWl59
	OxJpoOK98l0S3om2pzAWwg+H8wvck7is1MT+pYUJMTZJUb+SgEd2bjVm1UKI2ffwUUFYFlunADu
	Aiqm5xr38zqwixwkHakXlDd1oWNYDR/SrHc5U6mkmGTuqOzBJZXUZx6lpzPsBFq0U3Oj8LDYTvo
	wo9cotN3qcbiSdY0y2M4Oesruz6GLYgafANKUT0=
X-Google-Smtp-Source: AGHT+IHEmCDuHZ+8uB9f8GDunxYoBJjA1XFOTU/tpz/O0tguykq12oFATdzw1dCWB2rK39lLH2IaZg==
X-Received: by 2002:a05:6602:3946:b0:84a:5201:41ff with SMTP id ca18e2360f4ac-854fd886d54mr1422323839f.3.1739248297943;
        Mon, 10 Feb 2025 20:31:37 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ecdb903a89sm2110916173.70.2025.02.10.20.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 20:31:37 -0800 (PST)
Message-ID: <6223225b-a7cf-452d-ae69-d895b5f23d62@sifive.com>
Date: Mon, 10 Feb 2025 22:31:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] riscv: add Firmware Feature (FWFT) SBI
 extensions definitions
To: Deepak Gupta <debug@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-2-cleger@rivosinc.com>
 <Z6rMtBud/hsKYYIw@debug.ba.rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <Z6rMtBud/hsKYYIw@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Deepak,

On 2025-02-10 10:06 PM, Deepak Gupta wrote:
> On Mon, Feb 10, 2025 at 10:35:34PM +0100, Clément Léger wrote:
>> The Firmware Features extension (FWFT) was added as part of the SBI 3.0
>> specification. Add SBI definitions to use this extension.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>> Tested-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>> arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
>> 1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 3d250824178b..d373b5c08039 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -35,6 +35,7 @@ enum sbi_ext_id {
>>     SBI_EXT_DBCN = 0x4442434E,
>>     SBI_EXT_STA = 0x535441,
>>     SBI_EXT_NACL = 0x4E41434C,
>> +    SBI_EXT_FWFT = 0x46574654,
>>
>>     /* Experimentals extensions must lie within this range */
>>     SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>> @@ -402,6 +403,33 @@ enum sbi_ext_nacl_feature {
>> #define SBI_NACL_SHMEM_SRET_X(__i)        ((__riscv_xlen / 8) * (__i))
>> #define SBI_NACL_SHMEM_SRET_X_LAST        31
>>
>> +/* SBI function IDs for FW feature extension */
>> +#define SBI_EXT_FWFT_SET        0x0
>> +#define SBI_EXT_FWFT_GET        0x1
>> +
>> +enum sbi_fwft_feature_t {
>> +    SBI_FWFT_MISALIGNED_EXC_DELEG        = 0x0,
>> +    SBI_FWFT_LANDING_PAD            = 0x1,
>> +    SBI_FWFT_SHADOW_STACK            = 0x2,
>> +    SBI_FWFT_DOUBLE_TRAP            = 0x3,
>> +    SBI_FWFT_PTE_AD_HW_UPDATING        = 0x4,
>> +    SBI_FWFT_POINTER_MASKING_PMLEN        = 0x5,
>> +    SBI_FWFT_LOCAL_RESERVED_START        = 0x6,
>> +    SBI_FWFT_LOCAL_RESERVED_END        = 0x3fffffff,
>> +    SBI_FWFT_LOCAL_PLATFORM_START        = 0x40000000,
>> +    SBI_FWFT_LOCAL_PLATFORM_END        = 0x7fffffff,
>> +
>> +    SBI_FWFT_GLOBAL_RESERVED_START        = 0x80000000,
>> +    SBI_FWFT_GLOBAL_RESERVED_END        = 0xbfffffff,
>> +    SBI_FWFT_GLOBAL_PLATFORM_START        = 0xc0000000,
>> +    SBI_FWFT_GLOBAL_PLATFORM_END        = 0xffffffff,
>> +};
>> +
>> +#define SBI_FWFT_PLATFORM_FEATURE_BIT        (1 << 30)
>> +#define SBI_FWFT_GLOBAL_FEATURE_BIT        (1 << 31)
>> +
>> +#define SBI_FWFT_SET_FLAG_LOCK            (1 << 0)
>> +
>> /* SBI spec version fields */
>> #define SBI_SPEC_VERSION_DEFAULT    0x1
>> #define SBI_SPEC_VERSION_MAJOR_SHIFT    24
>> @@ -419,6 +447,11 @@ enum sbi_ext_nacl_feature {
>> #define SBI_ERR_ALREADY_STARTED -7
>> #define SBI_ERR_ALREADY_STOPPED -8
>> #define SBI_ERR_NO_SHMEM    -9
>> +#define SBI_ERR_INVALID_STATE    -10
>> +#define SBI_ERR_BAD_RANGE    -11
>> +#define SBI_ERR_TIMEOUT        -12
> 
> nit: Space mis-aligned(^)    ^

The alignment is correct when the patch is applied. It only looks wrong in the
patch because the "+" from the unified diff format causes an overflow to the
next tab stop.

Regards,
Samuel

> otherwise
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> 
>> +#define SBI_ERR_IO        -13
>> +#define SBI_ERR_DENIED_LOCKED    -14
>>
>> extern unsigned long sbi_spec_version;
>> struct sbiret {
>> -- 
>> 2.47.2
>>
>>

