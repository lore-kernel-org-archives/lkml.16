Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82F24BBF0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520748; cv=none; b=Fr000TIW3RF3alkHDWYnMDYIfxrB4EXeDlCDGv4LXJvRpW94qS/p4VMh8ASI+2UhWPNy2w9a3DSuXWx2HA6HXwM3eBEJCGioBJw0T7fn6OofDcAQncKtt/Lxci/+q9w3jFym3cTH9i6UagPu62XYVgaVVxVMQeowrjKPQJxSxjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520748; c=relaxed/simple;
	bh=i59p11TUOVjmWNwenzcP44UhSBFX66tSib4hOHBgbZk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=RGauuyTeEbox3EUxVRp8KWZPGwA5V1+ZtcchS9whhEALSrepFGkht2QvuVUElyWpZRp7B0hb7obZ91silVi5MuGgNXB1vEe8gwIaWs4wZKUvYmjZjPMt4tOVGFfBupBa/b3kkWXo4UytQl+tzypnv4/mlFXaAJES9ky6OgOGlo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9EtOveu; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9EtOveu"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso10006576a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746520745; x=1747125545; darn=vger.kernel.org;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KBUvhxsXBTO2k7dRSYGlK/Srd5NXERecRKbU4v4RqA=;
        b=E9EtOveuZnrArMME8k5fiOIvep1G/kVqmR96hmpoUShVMWmI8NTSOPIZYo6vN0wD2c
         3Fy6o3Em2r6IhpKmvUBUDTreb8WwOaxuRa5JzM+MytHIOPRKcjo92UsC/60kDe06Iicg
         Yfrw29nmVkmeBi5K7LzwMkjA3ihW2udtH9LYdFQq2BzKP6mPdmBe7HvdTHcaCe9OytzF
         aJCoacSHVlQQd7lEd3DxyPw4zOQm0KSZzYXr/vtTeYsWP7eQPCvzNcpC4s9gteSdZH0x
         kJFT8+2Oc4krjE6LdlEQW7bIDNkNKHhaipyCr2v1Scxwdt8zSWBPcR4spAM12fZrSeRT
         s0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520745; x=1747125545;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4KBUvhxsXBTO2k7dRSYGlK/Srd5NXERecRKbU4v4RqA=;
        b=tOrz3EZ/4Ha170bb1qCP79dr9hJYD7NwzmgnFoSqac8HCps7UbFkjtsfEhxeXGq3FM
         eyBk4optINSPEQme+XKtGnCu42Txx/GC/dEWJkyQ0gRoGMzIPfA45l32WEKKRmNFtFyP
         g09Lisj6eGtNc1y/zW7iMEBGcuzkMvHDu47WvymuegTACbs+GieKkhsmRXOBYqDlVPve
         0119vIN9f9Kt6YGP9GC/fftaP/Kw92z4+AweF5vNFIuJvve1D0gOV2IRnNrm/wZEMuP6
         5OA7H6qnEqrDQgDwBDi1NVdlGm8O/Ho5u8q++Y8b2QK/ft+pU5H2YZOMboryeZ9gTdDK
         AE4A==
X-Forwarded-Encrypted: i=1; AJvYcCUa1e2Wt2MmxtphCvE8JZzcvGokIIAYABmB0SMVm0El4F7VP1J4EICZC8iW8jyqo95iwwHktr5Ue+lgM1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynl4uAnRTmMrkKqyXeNaCK69xPU/Yq+CVdTYBQOG1SLrB7tuEp
	9tpldvmDkMcIc1ZLPDkqsaMfe8g+4r3tWVXA8XeMA/Ueakk3Yjil1eT5Gpuz
X-Gm-Gg: ASbGncvtlkhQ5vtCACzQoQzKTy3Oo9eGbyQNzbcuFhGKNP9T3IrXvyKxlSW5AIZuT+O
	VMssgKmkN5HZv5JY89xqBGksnulWM/LTenhbJnmcvSZIBnPE9aCPta/2f2RFJRT2SjYLK6G4tqy
	N63s7IeBvn/hj7LENBIdNI6iePJPgYnts02aWBhQS2m6iVo/NN1w1Zo26U72emXoWfvb+4GlIkR
	mc8m7MgzJJBaKVncSkUAcn+1GLcLpdYFnzEa/gB/kRr7Q12OdsnjcCYLw8rEVgKcZplwNlJLTIA
	WnD2Pt25Duy5PwZRuqLnoibq1zrp02+Z3Q==
X-Google-Smtp-Source: AGHT+IEh5pX7uIDIZLZYjnGeH5gEqXeedK818+958xSMEg3kwVwipJmaknLmFX93B9zyn1p90/OZ9Q==
X-Received: by 2002:a05:6402:35cc:b0:5f8:e955:241d with SMTP id 4fb4d7f45d1cf-5fab0574bf9mr8498986a12.8.1746520744874;
        Tue, 06 May 2025 01:39:04 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5fa778188acsm7050363a12.35.2025.05.06.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:39:04 -0700 (PDT)
Message-ID: <6819caa8.a70a0220.771e1.2b4b@mx.google.com>
X-Google-Original-Message-ID: <87o6w65e1l.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com,  palmer@dabbelt.com,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
In-Reply-To: <ceccc081-2dd5-4828-8eaf-148b48e05eda@ghiti.fr> (Alexandre
	Ghiti's message of "Tue, 6 May 2025 10:33:24 +0200")
Organization: Linux Private Site
References: <20250501130309.14803-1-mikisabate@gmail.com>
	<ceccc081-2dd5-4828-8eaf-148b48e05eda@ghiti.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 06 May 2025 10:39:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dt., de maig 06 2025, Alexandre Ghiti wrote:

> Hi Miquel,
>
> Your patch title should be prefixed with "riscv" or "RISC-V", but no need=
 to
> resend, I'll fix it when I merge your patch.

Yikes! I'll keep this in mind next time. Thanks!

>
> On 01/05/2025 15:03, mikisabate@gmail.com wrote:
>> From: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>>
>> Fix a couple of spelling issues plus some minor details on the grammar.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>> ---
>>   arch/riscv/Kconfig | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 1fd197afd2f7..3f40e33bc115 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -664,12 +664,12 @@ config RISCV_ISA_V_PREEMPTIVE
>>   	default y
>>   	help
>>   	  Usually, in-kernel SIMD routines are run with preemption disabled.
>> -	  Functions which envoke long running SIMD thus must yield core's
>> +	  Functions which invoke long running SIMD thus must yield the core's
>>   	  vector unit to prevent blocking other tasks for too long.
>>   -	  This config allows kernel to run SIMD without explicitly disable
>> -	  preemption. Enabling this config will result in higher memory
>> -	  consumption due to the allocation of per-task's kernel Vector contex=
t.
>> +	  This config allows the kernel to run SIMD without explicitly disabli=
ng
>> +	  preemption. Enabling this config will result in higher memory consum=
ption
>> +	  due to the allocation of per-task's kernel Vector context.
>>     config RISCV_ISA_ZAWRS
>>   	bool "Zawrs extension support for more efficient busy waiting"
>
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks,
>
> Alex

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmgZyqYVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlXmAP/j7qS8GoNAoFN73khsWuHSpSP7xG
ueY9TZuygiLwriu11LRda2vGZACHpZW8fxrvoAw4ayEiWLcF0MHegVy4+nueQx5/
ADrOBXeHCUxVVYeDDG0yu7S2DOQ8VZkpSLz2ABuZFgj2ebQkHJmD7Tl4YVkdC+z2
Zb8gJt2x8qRfg7IzyC6G5FWD6t/i+LdJSnGCTDY+8Wn8Vz8ndU4f31q5IangOj8m
aCVe7TVNYiVsm22OYb8RH9K3mPIZQ1N5059EfnaGmAKRy9u+3MUrG3SKw88dco8E
ZMqraYWEm86cjpHWzU5dSCGgiLSVb6KcPBI6QyDp6Fg1TVwFBVS63r7T9aiWzg3j
9lQX61wJPoStZ7/eOnwgUo+2xH3fzc6lN88pBHhYDoIC7nnU5rnHVqZijyQiRu1Z
I36gjldjFvbPYE8Aj47NKwSV7VvwkFxynijvO+wMX7JqrL6pOBsfon9IBIXIobDP
qrgR//GPNGCOWmSGYUUo9LGoHtrOy20GZbAvhXr8AoUD5uOmaP1dAx7FZATHZl6O
3W4aeNl4qkmOAw94uEZkjS5mCsZXN9P7wUQtP3+WR9vhyh9IDBbQBtjjIZteZVwh
hpGH+sUr5MHWhP+qGG+eOfHjgDHXOfdHWIUtecwElQx48IL3s2JFL+jyIb/4Uwj7
rlTtXA6qA7Y/zFot
=DGgC
-----END PGP SIGNATURE-----
--=-=-=--
