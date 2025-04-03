Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90369134CF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664097; cv=none; b=OroDBLBuZ+nWSEvBVHrv0jWqFPKYgIFR0EnfZtecg29zbRNKdvih2UUp/d2cVhCXKMH+LLOL9izqHMfRGfmEUerJerS52QVfHVOfBtaBBq9bXe/Bc49x8+TigyeSd+wTEsvUKbH3xGH6GXkjqmn7cmUl7e2tgofhLrlpWC+lWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664097; c=relaxed/simple;
	bh=vtfxJXEjbpW0QTVzgq6hkBS+uZVaaGcyRD6HcJffC40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSKigzWyV1UjH2fs4jyKCmL5LNg1P8BIa6nQrPekVsePDRbUhHDasA/joDCnjHX+iRyvhzQW4bWVbkrw6uMBsBEPsozVupOf8OTGE7WTS/S3z8xJqhGtoy3SoitmNSofkUk4UmWnSJG9izQ8REC8prALmMexjCot4nd+W9WXNKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M4Ly/vhC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M4Ly/vhC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0782d787so3334045e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743664094; x=1744268894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ygNy7TpE/EybhxZCszoMTx6j9tYNzu3q7HVkiSNenM=;
        b=M4Ly/vhCVk2Ot8gE2OJEQ2USs99wROIUWVGdALamZg2s7BgcNGtYB7pvQWAzk2mxMe
         ndlSxX3NIwJQLpiIP4NezGp4OHbIMwYj/NscAVRLqXE91QGI0bEfvxi4781zfdI3bjev
         re84771U9L4BGG15u95XPhW5kN5Fiy3ujMJYXDop4k2DyGJvO/Oe/uNr/37/gE6mVYDp
         pVl0R3HXKWytY5F5/33DVOgk7NxymU/nu2Ume1Rv2tv3vYk8BJDQTIHDQqtlZm0f+Jnl
         +z0nlVFgN7n6nQKXQjGkH5KEFc+s/j8a4h+E0hJXFU2EgtrdSGfxOeqYRsEcAmXNyLyM
         C2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664094; x=1744268894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ygNy7TpE/EybhxZCszoMTx6j9tYNzu3q7HVkiSNenM=;
        b=VgCFLebKFDmoC2M/HBetfQOHRtqwC1qJlmLuGQRICKakl1ou/NJOwLD8lHPVoX6khl
         X7rRm1pj2eenuwF0Y1zzQVG6/u8yMQLu20boLfMV0cTRPwln1FeKU6FC90/oHNqZOxyS
         pfzLtyLnojnC8lT6zy+LlY+KnArp0zy2dHO2ykPLS5tCWlnRytfW5JZD3Q4VvU5DDo1T
         omvIEHocM3EmPANnfRSUKbHFkj/gCDv50VPEsBkutyXgRNtbfkHKxPzO6FO0xIQoF62u
         ouQo45rBV/s3D3AXlb99IaPVMuAw0BDiWI/cKhmd4FyS343bk8qWfFyEfBFKbl1cwl08
         BJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9FQSknqv6X3RBpBcaPwF/XCMfqxer5X8CbkS5i+Bjqs4tXgg9hMAcnmJeOx5XQPdYHTD+yo7//ScolhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSrbcaa5bf2NqW/RtQjRBvoYzESOWBDyLxtwpsdI/mDwXX92y
	+5AAqHRvIvMkrvn7rCr72aR0Fr/UMrBcdCKgmrdqsMTe/tu7NxK5njVmaeyznQ==
X-Gm-Gg: ASbGncu9Vqbv14YA+bxbxp7vNmcCR1SsJlPctheTFUmYHCIGW0r78DeMkJFkUSD5E7e
	t6FqSPCwO+ZMrpPVYiybfC3l/Xvuou3wikbdJEu1Cb7ArI27ebYlypj3l1Z/jNVyixcNdZ2jU3N
	WodJUF8am2m867Y50SYBdnLdrE/1veNGXkue0SVv3JcV7EFymQYSWCm+F+abFnkhbtaZ1Gtl9WX
	fV8K3hsOzklgrNVOfLaDq2ajEudNxO59p6we6cck6qImHwfreMdKBCphBiCw8CBV7OaqyREJ5uy
	2Nn+3GPQfIZpV6KymzTrl8jUY40PawqK2yYXk07kQWIYDTdXU1b/oNpon8sZj6eYNsKaP40WZ0C
	dkynhoEF83ONbkcEuD55C1znYJu5IjA==
X-Google-Smtp-Source: AGHT+IFnX6JduAHPOKQnq8RBXyoZ/4SvgwizUWaaQ03B3v/UpmPZS5BPdEF+QaBlxZT+JsjQRMScoQ==
X-Received: by 2002:a05:6000:23c7:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-39c1211b77amr10130061f8f.52.1743664093736;
        Thu, 03 Apr 2025 00:08:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d92dsm940405f8f.71.2025.04.03.00.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 00:08:13 -0700 (PDT)
Message-ID: <53a596b9-7755-4064-a65c-fb3db1e4550e@suse.com>
Date: Thu, 3 Apr 2025 09:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Change xen-acpi-processor dom0 dependency
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Penny Zheng <penny.zheng@amd.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250331172913.51240-1-jason.andryuk@amd.com>
 <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.04.2025 16:24, Jürgen Groß wrote:
> On 31.03.25 19:29, Jason Andryuk wrote:
>> xen-acpi-processor functions under a PVH dom0 with only a
>> xen_initial_domain() runtime check.  Change the Kconfig dependency from
>> PV dom0 to generic dom0 to reflect that.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   drivers/xen/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
>> index f7d6f47971fd..24f485827e03 100644
>> --- a/drivers/xen/Kconfig
>> +++ b/drivers/xen/Kconfig
>> @@ -278,7 +278,7 @@ config XEN_PRIVCMD_EVENTFD
>>   
>>   config XEN_ACPI_PROCESSOR
>>   	tristate "Xen ACPI processor"
>> -	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
>> +	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
>>   	default m
>>   	help
>>   	  This ACPI processor uploads Power Management information to the Xen
> 
> Assuming that all needed hypercalls are fine for PVH dom0:

If you want to feel further ascertained, you could also add
Tested-by: Jan Beulich <jbeulich@suse.com>
even if that was only in the context of "xen/acpi: upload power and
performance related data from a PVH dom0", where I noticed this issue.

Jan
